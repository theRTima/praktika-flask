import os
import re
import psycopg2
import pandas as pd
import matplotlib
matplotlib.use('Agg')  # Для работы без GUI
import matplotlib.pyplot as plt
from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, flash, send_file
from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, FloatField, DateField, SelectField, SubmitField
from wtforms.validators import DataRequired, Optional, ValidationError
from io import BytesIO
import base64
from fpdf import FPDF

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'secret-key')

# Конфигурация БД из переменных окружения
def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get('DB_HOST', 'db'),
        port=os.environ.get('DB_PORT', '5432'),
        database=os.environ.get('DB_NAME', 'my_db'),
        user=os.environ.get('DB_USER', 'my_user'),
        password=os.environ.get('DB_PASSWORD', '12345')
    )
    return conn

# Формы
class CarForm(FlaskForm):
    car_id = IntegerField('ID техники', validators=[DataRequired()])
    brand = StringField('Марка', validators=[DataRequired()])
    model = StringField('Модель', validators=[DataRequired()])
    year = IntegerField('Год выпуска', validators=[DataRequired()])
    capacity = IntegerField('Грузоподъемность (кг)', validators=[DataRequired()])
    status = SelectField('Статус', choices=[('Ready', 'Ready'), ('Work', 'Work'), ('Repair', 'Repair')], validators=[DataRequired()])
    cost_per_km = FloatField('Стоимость за км (руб)', validators=[DataRequired()])
    last_tech_date = StringField('Дата последнего ТО (ДД.ММ.ГГГГ)', validators=[Optional()])
    licence_plate = StringField('Гос. номер', validators=[DataRequired()])
    submit = SubmitField('Сохранить')

    def validate_last_tech_date(self, field):
        if field.data and not re.match(r'\d{2}\.\d{2}\.\d{4}', field.data):
            raise ValidationError('Неверный формат даты. Используйте ДД.ММ.ГГГГ')

class DriverForm(FlaskForm):
    driver_id = IntegerField('ID водителя', validators=[DataRequired()])
    second_name = StringField('Фамилия', validators=[DataRequired()])
    first_name = StringField('Имя', validators=[DataRequired()])
    patronymic = StringField('Отчество', validators=[Optional()])
    phone_number = StringField('Телефон', validators=[DataRequired()])
    licence_number = StringField('Номер прав', validators=[DataRequired()])
    hire_date = StringField('Дата найма (ДД.ММ.ГГГГ)', validators=[Optional()])
    car_id = IntegerField('ID назначенной техники', validators=[Optional()])
    submit = SubmitField('Сохранить')

    def validate_hire_date(self, field):
        if field.data and not re.match(r'\d{2}\.\d{2}\.\d{4}', field.data):
            raise ValidationError('Неверный формат даты. Используйте ДД.ММ.ГГГГ')

class ReportForm(FlaskForm):
    year = IntegerField('Год', validators=[Optional()])
    start_date = StringField('Начальная дата (ДД.ММ.ГГГГ)', validators=[Optional()])
    end_date = StringField('Конечная дата (ДД.ММ.ГГГГ)', validators=[Optional()])
    submit = SubmitField('Сформировать')

# Маршруты
@app.route('/')
def index():
    return render_template('index.html')

# Управление техникой
@app.route('/cars')
def cars():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT car_id, brand, model, year, capacity, 
               status, cost_per_km, last_tech_date, licence_plate
        FROM cars
        ORDER BY car_id
    """)
    cars = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('cars.html', cars=cars)

@app.route('/cars/add', methods=['GET', 'POST'])
def add_car():
    form = CarForm()
    if form.validate_on_submit():
        # Обработка даты
        last_tech_date = None
        if form.last_tech_date.data:
            day, month, year = map(int, form.last_tech_date.data.split('.'))
            last_tech_date = f"{year}-{month:02d}-{day:02d}"

        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute("""
                INSERT INTO cars (car_id, brand, model, year, capacity, 
                                 status, cost_per_km, last_tech_date, licence_plate)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                form.car_id.data,
                form.brand.data,
                form.model.data,
                form.year.data,
                form.capacity.data,
                form.status.data,
                form.cost_per_km.data,
                last_tech_date,
                form.licence_plate.data
            ))
            conn.commit()
            flash('Техника успешно добавлена', 'success')
        except psycopg2.Error as e:
            conn.rollback()
            flash(f'Ошибка при добавлении техники: {e}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('cars'))
    return render_template('car_form.html', form=form, action='Добавить')

@app.route('/cars/edit/<int:car_id>', methods=['GET', 'POST'])
def edit_car(car_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM cars WHERE car_id = %s", (car_id,))
    car = cur.fetchone()
    cur.close()
    
    if not car:
        flash('Техника не найдена', 'danger')
        return redirect(url_for('cars'))
    
    form = CarForm(obj=car)
    if form.validate_on_submit():
        # Обработка даты
        last_tech_date = None
        if form.last_tech_date.data:
            day, month, year = map(int, form.last_tech_date.data.split('.'))
            last_tech_date = f"{year}-{month:02d}-{day:02d}"

        cur = conn.cursor()
        try:
            cur.execute("""
                UPDATE cars 
                SET brand = %s, model = %s, year = %s, capacity = %s,
                    status = %s, cost_per_km = %s, last_tech_date = %s, licence_plate = %s
                WHERE car_id = %s
            """, (
                form.brand.data,
                form.model.data,
                form.year.data,
                form.capacity.data,
                form.status.data,
                form.cost_per_km.data,
                last_tech_date,
                form.licence_plate.data,
                car_id
            ))
            conn.commit()
            flash('Данные техники обновлены', 'success')
        except psycopg2.Error as e:
            conn.rollback()
            flash(f'Ошибка при обновлении техники: {e}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('cars'))
    
    # Предзаполнение формы
    if car[7]:  # last_tech_date
        form.last_tech_date.data = car[7].strftime('%d.%m.%Y')
    return render_template('car_form.html', form=form, action='Редактировать')

@app.route('/cars/delete/<int:car_id>')
def delete_car(car_id):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("DELETE FROM cars WHERE car_id = %s", (car_id,))
        conn.commit()
        flash('Техника успешно удалена', 'success')
    except psycopg2.Error as e:
        conn.rollback()
        flash(f'Ошибка при удалении техники: {e}', 'danger')
    finally:
        cur.close()
        conn.close()
    return redirect(url_for('cars'))

@app.route('/cars/status/<int:car_id>', methods=['GET', 'POST'])
def change_car_status(car_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT status FROM cars WHERE car_id = %s", (car_id,))
    current_status = cur.fetchone()[0]
    
    if request.method == 'POST':
        new_status = request.form['status']
        try:
            cur.execute("UPDATE cars SET status = %s WHERE car_id = %s", (new_status, car_id))
            conn.commit()
            flash('Статус техники обновлен', 'success')
        except psycopg2.Error as e:
            conn.rollback()
            flash(f'Ошибка при обновлении статуса: {e}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('cars'))
    
    cur.close()
    conn.close()
    return render_template('change_status.html', 
                           car_id=car_id, 
                           current_status=current_status,
                           statuses=['Ready', 'Work', 'Repair'])

# Управление водителями
@app.route('/drivers')
def drivers():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT driver_id, second_name, first_name, patronymic,
               phone_number, licence_number, hire_date, car_id
        FROM drivers
        ORDER BY driver_id
    """)
    drivers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('drivers.html', drivers=drivers)

@app.route('/drivers/add', methods=['GET', 'POST'])
def add_driver():
    form = DriverForm()
    if form.validate_on_submit():
        # Обработка даты
        hire_date = None
        if form.hire_date.data:
            day, month, year = map(int, form.hire_date.data.split('.'))
            hire_date = f"{year}-{month:02d}-{day:02d}"

        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute("""
                INSERT INTO drivers (
                    driver_id, second_name, first_name, patronymic,
                    phone_number, licence_number, hire_date, car_id
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                form.driver_id.data,
                form.second_name.data,
                form.first_name.data,
                form.patronymic.data,
                form.phone_number.data,
                form.licence_number.data,
                hire_date,
                form.car_id.data if form.car_id.data else None
            ))
            conn.commit()
            flash('Водитель успешно добавлен', 'success')
        except psycopg2.Error as e:
            conn.rollback()
            flash(f'Ошибка при добавлении водителя: {e}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('drivers'))
    return render_template('driver_form.html', form=form, action='Добавить')

@app.route('/drivers/edit/<int:driver_id>', methods=['GET', 'POST'])
def edit_driver(driver_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM drivers WHERE driver_id = %s", (driver_id,))
    driver = cur.fetchone()
    cur.close()
    
    if not driver:
        flash('Водитель не найден', 'danger')
        return redirect(url_for('drivers'))
    
    form = DriverForm(obj=driver)
    if form.validate_on_submit():
        # Обработка даты
        hire_date = None
        if form.hire_date.data:
            day, month, year = map(int, form.hire_date.data.split('.'))
            hire_date = f"{year}-{month:02d}-{day:02d}"

        cur = conn.cursor()
        try:
            cur.execute("""
                UPDATE drivers 
                SET second_name = %s, first_name = %s, patronymic = %s,
                    phone_number = %s, licence_number = %s, hire_date = %s, car_id = %s
                WHERE driver_id = %s
            """, (
                form.second_name.data,
                form.first_name.data,
                form.patronymic.data,
                form.phone_number.data,
                form.licence_number.data,
                hire_date,
                form.car_id.data if form.car_id.data else None,
                driver_id
            ))
            conn.commit()
            flash('Данные водителя обновлены', 'success')
        except psycopg2.Error as e:
            conn.rollback()
            flash(f'Ошибка при обновлении водителя: {e}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('drivers'))
    
    # Предзаполнение формы
    if driver[6]:  # hire_date
        form.hire_date.data = driver[6].strftime('%d.%m.%Y')
    return render_template('driver_form.html', form=form, action='Редактировать')

@app.route('/drivers/delete/<int:driver_id>')
def delete_driver(driver_id):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("DELETE FROM drivers WHERE driver_id = %s", (driver_id,))
        conn.commit()
        flash('Водитель успешно удален', 'success')
    except psycopg2.Error as e:
        conn.rollback()
        flash(f'Ошибка при удалении водителя: {e}', 'danger')
    finally:
        cur.close()
        conn.close()
    return redirect(url_for('drivers'))

# Отчеты
@app.route('/reports')
def reports():
    return render_template('reports.html')

@app.route('/reports/transport_cost', methods=['GET', 'POST'])
def transport_cost_report():
    form = ReportForm()
    report_data = None
    year = None
    total_cost = 0
    total_orders = 0
    
    if form.validate_on_submit():
        year = form.year.data
        
        if not year:
            flash('Пожалуйста, введите год для формирования отчета', 'danger')
            return render_template('report_form.html', form=form, title='Отчет по стоимости перевозок за год')
        
        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute("""
                SELECT 
                    EXTRACT(MONTH FROM order_date) AS month,
                    SUM(order_cost) AS total_cost,
                    COUNT(*) AS orders_count
                FROM orders
                WHERE EXTRACT(YEAR FROM order_date) = %s
                GROUP BY EXTRACT(MONTH FROM order_date)
                ORDER BY month
            """, (year,))
            data = cur.fetchall()
            
            months = [
                "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь",
                "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"
            ]
            
            report_data = []
            for row in data:
                month_idx = int(row[0]) - 1
                if 0 <= month_idx < len(months):
                    month_name = months[month_idx]
                    report_data.append({
                        'month': month_name,
                        'total_cost': row[1],
                        'orders_count': row[2]
                    })
            
            if report_data:
                total_cost = sum(row['total_cost'] for row in report_data)
                total_orders = sum(row['orders_count'] for row in report_data)
            else:
                flash(f'Нет данных о перевозках за {year} год', 'warning')
                
        except psycopg2.Error as e:
            flash(f'Ошибка при получении данных: {e}', 'danger')
        finally:
            cur.close()
            conn.close()

    return render_template('transport_cost_report.html', 
                           form=form,
                           year=year,
                           report_data=report_data,
                           total_cost=total_cost,
                           total_orders=total_orders)
                           
@app.route('/reports/driver_efficiency', methods=['GET', 'POST'])
def driver_efficiency_report():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT driver_id, second_name || ' ' || first_name || ' ' || patronymic 
        FROM drivers 
        ORDER BY driver_id
    """)
    drivers = cur.fetchall()
    cur.close()
    conn.close()

    if request.method == 'POST':
        driver_id = request.form['driver_id']
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("""
            SELECT 
                second_name || ' ' || first_name || ' ' || patronymic,
                hire_date, car_id
            FROM drivers
            WHERE driver_id = %s
        """, (driver_id,))
        driver_info = cur.fetchone()
        
        cur.execute("""
            SELECT 
                COUNT(*) AS total_orders,
                SUM(order_cost) AS total_revenue,
                AVG(order_cost) AS avg_order_cost,
                MIN(order_date) AS first_order_date,
                MAX(order_date) AS last_order_date
            FROM orders
            WHERE driver_id = %s
        """, (driver_id,))
        stats = cur.fetchone()
        
        cur.execute("""
            SELECT 
                TO_CHAR(order_date, 'YYYY-MM') AS month,
                COUNT(*) AS orders_count,
                SUM(order_cost) AS month_revenue
            FROM orders
            WHERE driver_id = %s
            GROUP BY TO_CHAR(order_date, 'YYYY-MM')
            ORDER BY month
        """, (driver_id,))
        monthly_stats = cur.fetchall()
        cur.close()
        conn.close()
        
        return render_template('driver_efficiency_report.html', 
                               driver_id=driver_id,
                               driver_info=driver_info,
                               stats=stats,
                               monthly_stats=monthly_stats)

    return render_template('select_driver.html', drivers=drivers, title='Отчет по эффективности водителя')

@app.route('/reports/gas_stats')
def gas_stats_report():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT 
            COUNT(*) AS total_refuels,
            SUM(gas_quantity) AS total_quantity,
            SUM(gas_quantity * gt.gas_cost_per_litr) AS total_cost,
            MIN(gas_date) AS first_refuel,
            MAX(gas_date) AS last_refuel
        FROM gas g
        JOIN gas_type_cost gt ON g.gas_type = gt.gas_type2
    """)
    total_stats = cur.fetchone()
    
    cur.execute("""
        SELECT 
            gt.gas_type2 AS fuel_type,
            COUNT(*) AS refuels_count,
            SUM(gas_quantity) AS total_quantity,
            SUM(gas_quantity * gt.gas_cost_per_litr) AS total_cost
        FROM gas g
        JOIN gas_type_cost gt ON g.gas_type = gt.gas_type2
        GROUP BY gt.gas_type2
        ORDER BY total_quantity DESC
    """)
    fuel_stats = cur.fetchall()
    
    cur.execute("""
        SELECT 
            c.car_id,
            c.brand || ' ' || c.model AS car_name,
            COUNT(*) AS refuels_count,
            SUM(gas_quantity) AS total_quantity,
            SUM(gas_quantity * gt.gas_cost_per_litr) AS total_cost
        FROM gas g
        JOIN cars c ON g.car_id = c.car_id
        JOIN gas_type_cost gt ON g.gas_type = gt.gas_type2
        GROUP BY c.car_id, c.brand, c.model
        ORDER BY total_quantity DESC
        LIMIT 10
    """)
    car_stats = cur.fetchall()
    cur.close()
    conn.close()
    
    return render_template('gas_stats_report.html',
                           total_stats=total_stats,
                           fuel_stats=fuel_stats,
                           car_stats=car_stats)

@app.route('/reports/revenue_orders_chart', methods=['GET', 'POST'])
def revenue_orders_chart():
    form = ReportForm()
    if form.validate_on_submit():
        start_date = form.start_date.data
        end_date = form.end_date.data
        
        # Преобразование дат
        start_day, start_month, start_year = map(int, start_date.split('.'))
        start_date_formatted = f"{start_year}-{start_month:02d}-{start_day:02d}"
        
        end_day, end_month, end_year = map(int, end_date.split('.'))
        end_date_formatted = f"{end_year}-{end_month:02d}-{end_day:02d}"
        
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("""
            SELECT 
                order_date,
                SUM(order_cost) AS daily_revenue,
                COUNT(*) AS daily_orders
            FROM orders
            WHERE order_date BETWEEN %s AND %s
            GROUP BY order_date
            ORDER BY order_date
        """, (start_date_formatted, end_date_formatted))
        data = cur.fetchall()
        cur.close()
        conn.close()
        
        # Создание графика
        dates = [row[0] for row in data]
        revenues = [row[1] for row in data]
        orders = [row[2] for row in data]
        
        plt.figure(figsize=(12, 6))
        plt.plot(dates, revenues, 'b-', label='Выручка')
        plt.xlabel('Дата')
        plt.ylabel('Выручка (руб)', color='b')
        plt.tick_params('y', colors='b')
        
        plt.twinx()
        plt.plot(dates, orders, 'r--', label='Количество заказов')
        plt.ylabel('Количество заказов', color='r')
        plt.tick_params('y', colors='r')
        
        plt.title(f"Выручка и количество заказов с {start_date} по {end_date}")
        plt.legend()
        plt.tight_layout()
        
        # Сохранение в буфер
        buf = BytesIO()
        plt.savefig(buf, format='png')
        plt.close()
        buf.seek(0)
        
        # Преобразование в base64
        image_base64 = base64.b64encode(buf.read()).decode('utf-8')
        
        return render_template('revenue_orders_chart.html', 
                              image_base64=image_base64,
                              start_date=start_date,
                              end_date=end_date)
    
    return render_template('report_form.html', form=form, title='График выручки и заказов')

# Запуск приложения
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)