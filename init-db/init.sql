--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
--SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cargo; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.cargo (
    cargo_type character varying(100) NOT NULL,
    cargo_weight_kg numeric(10,2) NOT NULL,
    cargo_volume_m3 numeric(5,2) NOT NULL,
    cargo_id bigint NOT NULL
);


ALTER TABLE public.cargo OWNER TO my_user;

--
-- Name: TABLE cargo; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.cargo IS 'Информация о грузе';


--
-- Name: COLUMN cargo.cargo_type; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cargo.cargo_type IS 'Тип груза, информация о нём';


--
-- Name: COLUMN cargo.cargo_weight_kg; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cargo.cargo_weight_kg IS 'Вес груза в кг';


--
-- Name: COLUMN cargo.cargo_volume_m3; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cargo.cargo_volume_m3 IS 'Объём груза в м3';


--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.cargo_cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cargo_cargo_id_seq OWNER TO my_user;

--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.cargo_cargo_id_seq OWNED BY public.cargo.cargo_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.orders (
    start_point character varying(100) NOT NULL,
    end_point character varying(100) NOT NULL,
    order_date date NOT NULL,
    status character varying(20) NOT NULL,
    order_cost numeric(10,2) NOT NULL,
    cargo_id bigint NOT NULL,
    client_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.orders OWNER TO my_user;

--
-- Name: TABLE orders; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.orders IS 'Информация о заказе';


--
-- Name: COLUMN orders.start_point; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.orders.start_point IS 'Место отправления(приёма) груза';


--
-- Name: COLUMN orders.end_point; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.orders.end_point IS 'место привоза груза';


--
-- Name: COLUMN orders.order_date; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.orders.order_date IS 'Дата заказа';


--
-- Name: COLUMN orders.status; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.orders.status IS 'Статус заказа';


--
-- Name: COLUMN orders.order_cost; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.orders.order_cost IS 'Стоимость заказа';


--
-- Name: cars; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.cars (
    brand character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    year integer NOT NULL,
    capacity numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    cost_per_km numeric(5,2) NOT NULL,
    last_tech_date date NOT NULL,
    licence_plate character varying(15) NOT NULL,
    car_id bigint NOT NULL
);


ALTER TABLE public.cars OWNER TO my_user;

--
-- Name: TABLE cars; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.cars IS 'Информация о технике';


--
-- Name: COLUMN cars.brand; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.brand IS 'Бренд техники';


--
-- Name: COLUMN cars.model; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.model IS 'Модель техники';


--
-- Name: COLUMN cars.year; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.year IS 'Год выпуска техники';


--
-- Name: COLUMN cars.capacity; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.capacity IS 'Грузоподъемность техники';


--
-- Name: COLUMN cars.status; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.status IS 'Статус готовности к работе техники';


--
-- Name: COLUMN cars.cost_per_km; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.cost_per_km IS 'Стоимость перевоза груза на технике(за 1 км пути)';


--
-- Name: COLUMN cars.last_tech_date; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.last_tech_date IS 'Дата последнего тех.обслуживания';


--
-- Name: COLUMN cars.licence_plate; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.cars.licence_plate IS 'Регистрационный знак техники';


--
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.cars_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cars_car_id_seq OWNER TO my_user;

--
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars.car_id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.drivers (
    first_name character varying(50) NOT NULL,
    second_name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    licence_number character varying(20) NOT NULL,
    hire_date date NOT NULL,
    car_id bigint NOT NULL,
    driver_id bigint NOT NULL
);


ALTER TABLE public.drivers OWNER TO my_user;

--
-- Name: TABLE drivers; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.drivers IS 'Личная информация водителей';


--
-- Name: COLUMN drivers.first_name; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.first_name IS 'Имя водителя';


--
-- Name: COLUMN drivers.second_name; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.second_name IS 'Фамилия водителя';


--
-- Name: COLUMN drivers.patronymic; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.patronymic IS 'Отчество водителя';


--
-- Name: COLUMN drivers.phone_number; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.phone_number IS 'Номер телефона водителя';


--
-- Name: COLUMN drivers.licence_number; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.licence_number IS 'Номер водительской лицензии(прав) водителя';


--
-- Name: COLUMN drivers.hire_date; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.drivers.hire_date IS 'Дата приема водителя на работу';


--
-- Name: client; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.client (
    company_name character varying(100) NOT NULL,
    person_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.client OWNER TO my_user;

--
-- Name: TABLE client; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.client IS 'Информация о клиенте';


--
-- Name: COLUMN client.company_name; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.client.company_name IS 'Название компании. Поле может быть пропущено';


--
-- Name: COLUMN client.person_name; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.client.person_name IS 'ФИО заказчика';


--
-- Name: COLUMN client.phone_number; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.client.phone_number IS 'Номер телефона клиента';


--
-- Name: COLUMN client.email; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.client.email IS 'email клиента';


--
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_client_id_seq OWNER TO my_user;

--
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.drivers_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_driver_id_seq OWNER TO my_user;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.drivers_driver_id_seq OWNED BY public.drivers.driver_id;


--
-- Name: gas; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.gas (
    gas_type character varying(3) NOT NULL,
    gas_date date NOT NULL,
    gas_quantity numeric(10,2) NOT NULL,
    car_id bigint NOT NULL,
    gas_id bigint NOT NULL
);


ALTER TABLE public.gas OWNER TO my_user;

--
-- Name: TABLE gas; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.gas IS 'Информация о расходе ГСМ';


--
-- Name: COLUMN gas.gas_type; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.gas.gas_type IS 'Тип бензина';


--
-- Name: COLUMN gas.gas_date; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.gas.gas_date IS 'Дата заправки';


--
-- Name: COLUMN gas.gas_quantity; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.gas.gas_quantity IS 'Стоимость заправки';


--
-- Name: gas_gas_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.gas_gas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gas_gas_id_seq OWNER TO my_user;

--
-- Name: gas_gas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.gas_gas_id_seq OWNED BY public.gas.gas_id;


--
-- Name: gas_type_cost; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.gas_type_cost (
    gas_type2 character varying(3) NOT NULL,
    gas_cost_per_litr numeric(3,1) NOT NULL
);


ALTER TABLE public.gas_type_cost OWNER TO my_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_order_id_seq OWNER TO my_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.seasons (
    mounth integer NOT NULL,
    season character varying(10),
    season_number integer
);


ALTER TABLE public.seasons OWNER TO my_user;

--
-- Name: service; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.service (
    service_type character varying(100) NOT NULL,
    service_date date NOT NULL,
    service_cost numeric(10,2) NOT NULL,
    car_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.service OWNER TO my_user;

--
-- Name: TABLE service; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON TABLE public.service IS 'Информация о тех.обслуживаниях конкретного авто';


--
-- Name: COLUMN service.service_type; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.service.service_type IS 'Тип тех.обслуживания, его описание';


--
-- Name: COLUMN service.service_date; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.service.service_date IS 'Дата тех.обслуживания';


--
-- Name: COLUMN service.service_cost; Type: COMMENT; Schema: public; Owner: my_user
--

COMMENT ON COLUMN public.service.service_cost IS 'Стоимость тех.обслуживания';


--
-- Name: service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: my_user
--

CREATE SEQUENCE public.service_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_service_id_seq OWNER TO my_user;

--
-- Name: service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: my_user
--

ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;


--
-- Name: cargo cargo_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.cargo ALTER COLUMN cargo_id SET DEFAULT nextval('public.cargo_cargo_id_seq'::regclass);


--
-- Name: cars car_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.cars ALTER COLUMN car_id SET DEFAULT nextval('public.cars_car_id_seq'::regclass);


--
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- Name: drivers driver_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.drivers ALTER COLUMN driver_id SET DEFAULT nextval('public.drivers_driver_id_seq'::regclass);


--
-- Name: gas gas_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.gas ALTER COLUMN gas_id SET DEFAULT nextval('public.gas_gas_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: service service_id; Type: DEFAULT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.cargo (cargo_type, cargo_weight_kg, cargo_volume_m3, cargo_id) FROM stdin;
﻿Авто запчасти	26627.00	20.00	1
Мебель	8675.00	78.00	2
Строительные материалы	26239.00	85.00	3
Посылки с маркетплейсов	18895.00	62.00	4
Корм	7673.00	69.00	5
Песок	8444.00	35.00	6
Щебень	8616.00	62.00	7
Авто запчасти	28532.00	73.00	8
Мебель	27063.00	44.00	9
Строительные материалы	29798.00	63.00	10
Посылки с маркетплейсов	27102.00	65.00	11
Корм	6266.00	83.00	12
Песок	14172.00	17.00	13
Щебень	18999.00	13.00	14
Авто запчасти	5633.00	62.00	15
Мебель	2095.00	81.00	16
Строительные материалы	28171.00	51.00	17
Посылки с маркетплейсов	29185.00	93.00	18
Корм	11055.00	77.00	19
Песок	23478.00	87.00	20
Щебень	3582.00	50.00	21
Авто запчасти	17428.00	96.00	22
Мебель	3630.00	71.00	23
Строительные материалы	3440.00	14.00	24
Посылки с маркетплейсов	27875.00	23.00	25
Корм	2725.00	57.00	26
Песок	19332.00	37.00	27
Щебень	16663.00	65.00	28
Авто запчасти	5362.00	31.00	29
Мебель	11609.00	61.00	30
Строительные материалы	27000.00	49.00	31
Посылки с маркетплейсов	2998.00	16.00	32
Корм	15895.00	43.00	33
Песок	3150.00	13.00	34
Щебень	18765.00	92.00	35
Авто запчасти	6785.00	14.00	36
Мебель	27872.00	85.00	37
Строительные материалы	10492.00	56.00	38
Посылки с маркетплейсов	9956.00	90.00	39
Корм	23360.00	22.00	40
Песок	12556.00	59.00	41
Щебень	23573.00	21.00	42
Авто запчасти	26312.00	82.00	43
Мебель	5676.00	81.00	44
Строительные материалы	18388.00	36.00	45
Посылки с маркетплейсов	9732.00	77.00	46
Корм	6724.00	72.00	47
Песок	27181.00	66.00	48
Щебень	23573.00	21.00	49
Авто запчасти	1357.00	13.00	50
Мебель	4590.00	46.00	51
Строительные материалы	19696.00	57.00	52
Посылки с маркетплейсов	26289.00	73.00	53
Корм	12706.00	60.00	54
Песок	14287.00	35.00	55
Щебень	15860.00	21.00	56
Авто запчасти	14420.00	61.00	57
Мебель	26159.00	81.00	58
Строительные материалы	22391.00	66.00	59
Посылки с маркетплейсов	6417.00	70.00	60
Корм	14552.00	59.00	61
Песок	29348.00	29.00	62
Щебень	4624.00	96.00	63
Авто запчасти	23581.00	30.00	64
Мебель	4620.00	89.00	65
Строительные материалы	19324.00	83.00	66
Посылки с маркетплейсов	17303.00	42.00	67
Корм	6826.00	35.00	68
Песок	5462.00	62.00	69
Щебень	25238.00	80.00	70
Авто запчасти	8378.00	82.00	71
Мебель	12062.00	55.00	72
Строительные материалы	28682.00	77.00	73
Посылки с маркетплейсов	2439.00	55.00	74
Корм	16794.00	83.00	75
Песок	3635.00	34.00	76
Щебень	24036.00	39.00	77
Авто запчасти	21720.00	81.00	78
Мебель	6019.00	79.00	79
Строительные материалы	17586.00	65.00	80
Посылки с маркетплейсов	12343.00	17.00	81
Корм	14877.00	59.00	82
Песок	21705.00	89.00	83
Щебень	14536.00	19.00	84
Авто запчасти	5434.00	58.00	85
Мебель	13569.00	26.00	86
Строительные материалы	21982.00	19.00	87
Посылки с маркетплейсов	1736.00	70.00	88
Корм	2310.00	46.00	89
Песок	3909.00	57.00	90
Щебень	25957.00	76.00	91
Авто запчасти	20580.00	24.00	92
Мебель	6658.00	85.00	93
Строительные материалы	17304.00	31.00	94
Посылки с маркетплейсов	14704.00	89.00	95
Корм	19637.00	84.00	96
Песок	28154.00	58.00	97
Щебень	24039.00	65.00	98
Авто запчасти	4134.00	34.00	99
Мебель	7859.00	71.00	100
Строительные материалы	4643.00	37.00	101
Посылки с маркетплейсов	26681.00	31.00	102
Корм	2427.00	28.00	103
Песок	18249.00	15.00	104
Щебень	20456.00	23.00	105
Авто запчасти	14146.00	88.00	106
Мебель	16314.00	42.00	107
Строительные материалы	15027.00	43.00	108
Посылки с маркетплейсов	8165.00	45.00	109
Корм	23093.00	62.00	110
Песок	7998.00	73.00	111
Щебень	1597.00	46.00	112
Авто запчасти	2727.00	73.00	113
Мебель	18546.00	88.00	114
Строительные материалы	28140.00	79.00	115
Посылки с маркетплейсов	14672.00	95.00	116
Корм	20606.00	73.00	117
Песок	16877.00	41.00	118
Щебень	1314.00	79.00	119
Авто запчасти	9968.00	14.00	120
Мебель	20898.00	29.00	121
Строительные материалы	10960.00	83.00	122
Посылки с маркетплейсов	12008.00	37.00	123
Корм	24880.00	29.00	124
Песок	15777.00	28.00	125
Щебень	23552.00	28.00	126
Авто запчасти	29681.00	45.00	127
Мебель	3185.00	79.00	128
Строительные материалы	25089.00	49.00	129
Посылки с маркетплейсов	26950.00	93.00	130
Корм	22327.00	18.00	131
Песок	11624.00	42.00	132
Щебень	18636.00	51.00	133
Авто запчасти	11966.00	59.00	134
Мебель	29985.00	41.00	135
Строительные материалы	5843.00	55.00	136
Посылки с маркетплейсов	10462.00	28.00	137
Корм	1649.00	58.00	138
Песок	29852.00	90.00	139
Щебень	25518.00	36.00	140
Авто запчасти	19251.00	69.00	141
Мебель	6591.00	90.00	142
Строительные материалы	27613.00	78.00	143
Посылки с маркетплейсов	24151.00	50.00	144
Корм	17952.00	96.00	145
Песок	12247.00	92.00	146
Щебень	3340.00	63.00	147
Авто запчасти	28661.00	84.00	148
Мебель	15539.00	13.00	149
Строительные материалы	10937.00	50.00	150
Посылки с маркетплейсов	1375.00	14.00	151
Корм	27566.00	92.00	152
Песок	3453.00	75.00	153
Щебень	28749.00	81.00	154
Авто запчасти	17744.00	63.00	155
Мебель	29863.00	73.00	156
Строительные материалы	21683.00	56.00	157
Посылки с маркетплейсов	9791.00	88.00	158
Корм	6655.00	84.00	159
Песок	15284.00	41.00	160
Щебень	25519.00	87.00	161
Авто запчасти	28709.00	59.00	162
Мебель	27895.00	21.00	163
Строительные материалы	1621.00	56.00	164
Посылки с маркетплейсов	6462.00	88.00	165
Корм	12150.00	30.00	166
Песок	22134.00	27.00	167
Щебень	3267.00	20.00	168
Авто запчасти	20769.00	96.00	169
Мебель	6963.00	16.00	170
Строительные материалы	25117.00	34.00	171
Посылки с маркетплейсов	21075.00	46.00	172
Корм	24863.00	66.00	173
Песок	4109.00	32.00	174
Щебень	18471.00	44.00	175
Авто запчасти	15339.00	41.00	176
Мебель	27520.00	27.00	177
Строительные материалы	29294.00	52.00	178
Посылки с маркетплейсов	15657.00	72.00	179
Корм	21505.00	83.00	180
Песок	27108.00	12.00	181
Щебень	7235.00	88.00	182
Авто запчасти	22519.00	65.00	183
Мебель	21439.00	39.00	184
Строительные материалы	3427.00	45.00	185
Посылки с маркетплейсов	8804.00	41.00	186
Корм	18010.00	19.00	187
Песок	24936.00	87.00	188
Щебень	11551.00	78.00	189
Авто запчасти	17030.00	54.00	190
Мебель	20713.00	91.00	191
Строительные материалы	5694.00	95.00	192
Посылки с маркетплейсов	18436.00	86.00	193
Корм	14735.00	87.00	194
Песок	15288.00	43.00	195
Щебень	28985.00	30.00	196
Авто запчасти	26579.00	62.00	197
Мебель	20821.00	49.00	198
Строительные материалы	1590.00	16.00	199
Посылки с маркетплейсов	25109.00	53.00	200
Корм	12888.00	39.00	201
Песок	4938.00	58.00	202
\.


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.cars (brand, model, year, capacity, status, cost_per_km, last_tech_date, licence_plate, car_id) FROM stdin;
КАМАЗ	6520	2017	20000.00	Work	90.00	2025-03-13	О789МР799	4
УРАЛ	4320	2015	9000.00	Repair	65.00	2025-03-14	Е726КХ799	5
MAN	TGS WW	2020	21000.00	Work	112.00	2025-03-15	Е628РН799	6
Mercedes-Benz	Arocs	2014	7000.00	Ready	56.00	2025-03-16	Е343КХ799	7
Volvo	FL	2016	12000.00	Repair	80.00	2025-03-17	Е222ТТ799	8
ГАЗ	Валдай	2018	3640.00	Ready	58.00	2025-03-18	Е293РМ799	9
КАМАЗ	6520	2021	20000.00	Ready	98.00	2025-03-19	О221ТР799	10
УРАЛ	4320	2022	8500.00	Repair	78.00	2025-03-20	Р561ОК799	11
MAN	TGS WW	2018	18000.00	Work	90.00	2025-03-21	Р293ТТ799	12
Mercedes-Benz	Antos	2020	8600.00	Repair	66.00	2025-03-22	А628РА799	13
Volvo	FM	2019	17000.00	Ready	90.00	2025-03-23	У619АА799	14
ГАЗ	ГАЗон NEXT	2020	5000.00	Work	54.00	2025-03-24	А722УУ799	15
КАМАЗ	6520	2020	20000.00	Ready	98.00	2025-03-25	А799АА799	16
УРАЛ	4320	2016	9000.00	Work	88.00	2025-03-26	М726ТС799	17
MAN	TGS WW	2015	34000.00	Ready	134.00	2025-03-27	М799ТС799	18
Mercedes-Benz	Arocs	2018	9800.00	Work	80.00	2025-03-28	Л287РС799	19
Volvo	FL	2019	11000.00	Ready	88.00	2025-03-29	Р722ТС799	20
ГАЗ	ГАЗон NEXT	2021	4700.00	Work	55.00	2025-03-30	В722ВР799	21
КАМАЗ	6580	2020	25450.00	Ready	95.00	2025-03-31	В366ОР799	22
УРАЛ	6370	2022	19500.00	Ready	90.00	2025-04-01	А743МР799	23
MAN	TGS WW	2023	36000.00	Ready	120.00	2025-04-02	Ц632ДМ799	24
Mercedes-Benz	Arocs	2017	12000.00	Work	89.00	2025-04-03	М735ОК799	25
Volvo	FM	2023	23000.00	Repair	102.00	2025-04-04	П634ЛН799	26
ГАЗ	ГАЗон NEXT	2024	5000.00	Ready	60.00	2025-04-05	З666СС799	27
КАМАЗ	6580	2025	25450.00	Ready	98.00	2025-04-06	Ч326ОР799	28
УРАЛ	6370	2019	19500.00	Work	94.00	2025-04-07	М654ОК799	29
MAN	TGS WW	2020	39000.00	Ready	123.00	2025-04-08	Ц222ИП799	30
Mercedes-Benz	Antos	2019	7500.00	Repair	65.00	2025-04-09	А524РМ799	31
Volvo	FM	2018	12500.00	Ready	87.00	2025-04-10	Р765РР799	32
ГАЗ	Валдай	2017	3480.00	Ready	65.00	2025-04-11	С634ТО799	33
КАМАЗ	6580	2016	25450.00	Work	104.00	2025-04-12	Т645ТТ799	34
УРАЛ	6370	2019	19500.00	Ready	98.00	2025-04-13	Т647ТТ799	35
MAN	TGS WW	2018	41000.00	Work	134.00	2025-04-14	Р729ТО799	36
Mercedes-Benz	Arocs	2022	11000.00	Ready	87.00	2025-04-15	Р634КА799	37
Volvo	FM	2021	21000.00	Repair	96.00	2025-04-16	К345КК799	38
ГАЗ	Валдай	2022	3480.00	Work	65.00	2025-04-17	Р666СК799	39
КАМАЗ	6580	2020	25450.00	Work	104.00	2025-04-18	С123РА799	40
Volvo	FM	2012	24300.00	Ready	98.00	2025-03-11	С222ТО799	2
ГАЗ	Валдай	2018	3925.00	Repair	54.00	2025-03-12	С293ВО799	3
﻿Mercedes-Benz	Actros	2018	24300.00	Ready	75.00	2025-03-10	А565РМ799	1
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.client (company_name, person_name, phone_number, email, client_id) FROM stdin;
﻿AutoMax	Богомолова Таисия Леонидовна	89831886829	tesat_iwacu30@mail.ru	1
CarNest	Комарова Кира Вячеславовна	89950862589	yuzo-nobibi26@hotmail.com	2
DealAuto	Сизова Ксения Артёмовна	89199592841	nebawi-sosa67@aol.com	3
DrivePro	Головин Марк Игоревич	89114692363	higipu-bazo43@inbox.ru	4
CarZone	Кондратьев Максим Кириллович	89186838141	muwoye-buyi61@hotmail.com	5
QuickCar	Селезнева Варвара Георгиевна	89635515718	lozawof_ire74@hotmail.com	6
Гонка	Ермаков Дмитрий Владимирович	89544317223	lipe-suruwo92@yahoo.com	7
АвтоМаг	Денисова Александра Руслановна	89391180554	gaf_ocexoga80@gmail.com	8
MotorHub	Смирнов Владимир Евгеньевич	89963866236	pigar_ifevo54@yandex.ru	9
GearVend	Кондратьева Василиса Савельевна	89846983428	yovup-uyagu55@gmail.com	10
FastCars	Зубова Алиса Никитична	89324150944	xiyoyab_iso34@hotmail.com	11
AutoShop	Морозов Роберт Романович	89586808407	yogela_xule81@yandex.ru	12
АвтоТорг	Фокин Эрик Глебович	89811948333	zivoy-ohave18@bk.ru	13
BuildMart	Чернова Валерия Артёмовна	89029981808	dagoru_soba25@hotmail.com	14
EcoStone	Григорьев Владимир Семёнович	89307739654	wotote-fari14@inbox.ru	15
ProBlock	Моргунов Дмитрий Ростиславович	89898387739	kigo-vosexo54@internet.ru	16
TopSupply	Яковлев Даниил Артёмович	89421844892	cur-ecenitu93@hotmail.com	17
QuickFix	Леонтьева Маргарита Мироновна	89677817153	bevub_ozipa16@mail.ru	18
FsatDeck	Воронов Юрий Михайлович	89276818016	zisame-lafe75@hotmail.com	19
MatZone	Смирнова Василиса Петровна	89441459056	nic_uvobicu32@yandex.ru	20
ToolNest	Архипова Ева Тимофеевна	89749697021	hibaha_yibi9@inbox.ru	21
SureBuild	Овсянников Лука Александрович	89435232051	fizul-odiwo72@list.ru	22
BrickHub	Куликова Софья Максимовна	89523142850	gab-umuyatu52@hotmail.com	23
СтройГид	Кузнецова Милана Алексеевна	89986218277	sura-yopeni20@yahoo.com	24
Материалы	Ананьев Денис Данилович	89956281412	nut_ofifopu55@hotmail.com	25
СтройЦентр	Макаров Егор Егорович	89953015119	sexo-yanoru44@aol.com	26
БлокТорг	Соболев Константин Павлович	89625370276	wohukis_ana43@mail.ru	27
БыстроДом	Соловьев Артём Елисеевич	89519748319	zajejop_uji14@aol.com	28
Качество	Пугачева Ева Захаровна	89817677955	jucob_okexo26@hotmail.com	29
ТехноСклад	Щербаков Ян Алексеевич	89877469042	pizenov-uku64@mail.ru	30
ГипсОкно	Исаева Евгения Васильевна	89855457866	xic_epojugi77@bk.ru	31
ЛёгкийСтрой	Попова Диана Тимофеевна	89585552068	xina-pozocu48@list.ru	32
СтройПартн	Власова Аделина Алексеевна	89057605842	kuwu_nowodo78@aol.com	33
BuildPro	Федоров Всеволод Артёмович	89381496574	ziwabob_iyo34@aol.com	34
PlanMax	Шубин Али Макарович	89334296725	zulaxew-aco40@mail.ru	35
MatShop	Наумов Арсений Алексеевич	89078689950	yitetup_axa14@aol.com	36
SteelFix	Николаев Константин Александрович	89695988686	nogexa-ceti1@yandex.ru	37
ProMats	Журавлев Артём Маркович	89269777402	sisu_bevixo92@yahoo.com	38
StoneBox	Афанасьева Дарья Артемьевна	89359398522	ruja_safohe11@hotmail.com	39
BrickNest	Кошелева Тамара Сергеевна	89084184021	cawuxag_uvu24@internet.ru	40
СтройГиж	Щербакова Мария Андреевна	89876620525	tela_kecowe15@list.ru	41
FormSet	Никитина Диана Данииловна	89341216557	ture_wixoxo20@yandex.ru	42
FurniShop	Баранова Василиса Александровна	89068035258	mawit-umole18@bk.ru	43
HomeSeats	Баранова Дарья Тимофеевна	89027743164	lac_egusoji8@list.ru	44
CozyNest	Бочарова Дана Захаровна	89900349778	jun-uguzaci92@yandex.ru	45
StyleFab	Чернов Александр Михайлович	89249624167	cad_ulejino13@gmail.com	46
DeskZone	Бирюков Тимофей Серафимович	89607821275	xir_uduzupe26@mail.ru	47
SofaWorld	Мальцева Полина Семёновна	89580605449	vifuxot_ipe76@internet.ru	48
WoodWorks	Еремеев Даниил Александрович	89457575288	puh_aviguge97@gmail.com	49
ModernRug	Кольцов Андрей Давидович	89889931017	laxofe_cage45@yandex.ru	50
QuickFurn	Романова Марианна Захаровна	89740991380	rebija_cuyu32@internet.ru	51
ChicDecor	Иванов Дмитрий Никитич	89155094686	comu-haribi22@hotmail.com	52
МебельМир	Кудряшова Ирина Артёмовна	89333333460	jefiyix-idi2@yandex.ru	53
Диваны-72	Сидоров Даниил Гордеевич	89751864636	roja_fayaje44@list.ru	54
Комфорт24	Никитин Илья Филиппович	89688670245	wifa-solapi94@yahoo.com	55
СтильныйДом	Захарова Кристина Артёмовна	89575333516	rax_otoyaje46@mail.ru	56
Мебель+RU	Полякова Юлия Максимовна	89310999287	tavow_eyema37@list.ru	57
УютТорг	Савельева Дарья Эмильевна	89687290656	sica_mufoko52@gmail.com	58
СалонМебель	Наумова Мария Родионовна	89171611942	sihozuf-uki25@inbox.ru	59
ЭкоМебель	Злобина Дарья Никитична	89969933885	voy_oxizola51@gmail.com	60
КлассикаМ	Коновалова Наталья Дамировна	89996808990	toyu-jakawo79@bk.ru	61
МебельКакТепло	Ульянова Виктория Богдановна	89178714956	nigozax_iye89@hotmail.com	62
HomeNest	Смирнова Полина Дмитриевна	89841004294	bajuket_ado79@hotmail.com	63
FurniCo	Головина Маргарита Викторовна	89093343199	cup-ajulola98@gmail.com	64
CozyShop	Кондратьев Захар Николаевич	89845680268	vifexa_paru71@hotmail.com	65
DecorBox	Маркова Виктория Данииловна	89788562793	sacugu-goli5@hotmail.com	66
StyleHub	Дмитриева Кира Георгиевна	89662512006	suveyuh_uke49@mail.ru	67
SofaNest	Алексеев Лев Савельевич	89053987363	yicus_ugupa93@inbox.ru	68
SpaceMkr	Борисов Даниил Леонидович	89313126787	hunu_hutuxu90@internet.ru	69
ChicNest	Терехов Максим Демидович	89875247964	vuluxu_buco50@bk.ru	70
FitFurns	Воронин Али Олегович	89431204722	way_olucoza93@yandex.ru	71
Oak&More	Соколова Мария Эмировна	89049320547	yocu-dihiru7@yandex.ru	72
Мебелька	Сазонов Владислав Ярославович	89793632833	rus-opayoli2@bk.ru	73
ДомаМебель	Прокофьев Макар Серафимович	89426597233	buroves_ufe43@gmail.com	74
StoneMart	Комаров Никита Артемьевич	89372341575	bugagu_pova57@inbox.ru	75
AsphaltPro	Морозов Роман Александрович	89072838104	gaguzo-gode86@gmail.com	76
GravelHub	Сорокин Максим Андреевич	89311972476	dofi_tajezo27@aol.com	77
SandSupply	Орлова Лейла Александровна	89287892822	kufa-wejaro81@bk.ru	78
RockSales	Васильев Иван Леонидович	89278906960	pej_ijetiba26@bk.ru	79
EarthWorks	Головин Сергей Артурович	89862763492	bevaxad_atu86@hotmail.com	80
BulkGravel	Орехова Полина Романовна	89999549398	vuli_nujolu73@yahoo.com	81
PuresAndCo	Григорьева Варвара Тимофеевна	89579714790	gimemov_ive62@gmail.com	82
StoneHaven	Ткачев Алексей Богданович	89598774820	wisapek-ama86@gmail.com	83
QuickGravel	Архипова Ульяна Ивановна	89191178766	copeba_vice34@hotmail.com	84
ЩебеньИнв	Баранов Егор Семёнович	89761476386	mekuve_yewe24@bk.ru	85
ПесокТорг	Давыдов Андрей Александрович	89685517650	zume_necaki45@bk.ru	86
МирЩебня	Гусева Вероника Андреевна	89490801918	vaxiho-pohi24@bk.ru	87
ПесокПро	Новиков Гордей Александрович	89518889255	huv_abixawo29@list.ru	88
Щебенка54	Соколова Амалия Марковна	89979439834	yayapu_dawa86@hotmail.com	89
ЗемляТрейд	Иванова Мария Николаевна	89504058384	fupo_nowaco82@yahoo.com	90
SandDepot	Головин Константин Матвеевич	89998909733	ketuy_uduza48@yahoo.com	91
GravelHub	Дмитриев Александр Алексеевич	89488970655	miso_guzepe42@aol.com	92
RockGoods	Попова Таисия Николаевна	89442805298	noxeni-tadi75@aol.com	93
SandMart	Королева Ника Давидовна	89844441566	wahifo-peba24@yandex.ru	94
PebbleShop	Гаврилова Екатерина Алексеевна	89977166269	buy_emodevi73@aol.com	95
QuarryLink	Борисов Александр Тимофеевич	89410622157	bizehav-ase25@yahoo.com	96
BulkEarth	Петров Михаил Максимович	89601597004	cufa-zoxana94@yahoo.com	97
FineGrains	Кудрявцева София Андреевна	89291972406	nice-wakela85@bk.ru	98
EarthyMix	Антипова Юлия Тихоновна	89251823314	kafadef_uda92@aol.com	99
ЩебеньТорг	Максимова Полина Максимовна	89479938095	garuk_efelo60@gmail.com	100
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.drivers (first_name, second_name, patronymic, phone_number, licence_number, hire_date, car_id, driver_id) FROM stdin;
﻿Алексей	Попов	Сергеевич	89855367398	9931682654	2018-03-27	1	101
Михаил	Иванов	Артемович	89851234567	9900117788	2024-02-23	2	102
Алексей	Горшков	Иванович	89262345678	9998277877	2022-05-23	3	103
Сергей	Петров	Русланович	89853456789	9932632534	2015-10-01	4	104
Артем	Магнитов	Сергеевич	89854567890	9988755551	2024-04-07	5	105
Сергей	Горшенев	Олегович	89265678901	9920554391	2020-01-05	6	106
Иван	Киреев	Ильич	89856789012	9977684321	2016-12-01	7	107
Алексей	Кувшинов	Максимович	89857890123	9942801670	2015-02-20	8	108
Максим	Балалай	Александрович	89278901234	9911070380	2015-05-05	9	109
Иван	Кринский	Иванович	89859012345	9965623668	2020-04-02	10	110
Игорь	Авдеев	Олегович	89160123456	9950970785	2015-12-13	11	111
Григорий	Алманский	Русланович	89165112334	9910116182	2016-12-13	12	112
Алексей	Карасев	Ильич	89852233445	9923480787	2018-07-07	13	113
Александр	Иванов	Русланович	89253344556	9957626814	2020-08-07	14	114
Олег	Грецкий	Александрович	89854455667	9991434124	2019-01-30	15	115
Алексей	Валкамский	Русланович	89805566778	9952933260	2015-03-03	16	116
Георгий	Кулешов	Ильич	89806677889	9905926296	2020-04-25	17	117
Александр	Кишинев	Иванович	89857788990	9959000254	2012-11-22	18	118
Алексей	Кеншов	Олегович	89858899001	9935147960	2020-02-13	19	119
Андрей	Серпейкин	Александрович	89269900112	9923952374	2020-05-02	20	120
Иван	Неев	Иванович	89250011223	9988074856	2012-12-26	21	121
Вячеслав	Карасиков	Олегович	89856321456	9991905113	2015-07-05	22	122
Алексей	Горный	Владленович	89257432567	9928043668	2019-10-07	23	123
Илья	Петечкин	Артемович	89858543678	9930374302	2020-11-13	24	124
Руслан	Ильясов	Александрович	89859654789	9912192744	2013-10-20	25	125
Михаил	Куминоп	Ильич	89850765890	9925887607	2022-02-01	26	126
Георгий	Купитман	Александрович	89851876901	9930458394	2020-02-01	27	127
Алексей	Лобанов	Максимович	89852987012	9968724304	2019-06-30	28	128
Алексей	Сергеев	Артемович	89853098123	9980571663	2015-08-22	29	129
Андрей	Дорогин	Владленович	89164109234	9945095662	2022-02-22	30	130
Алексей	Норкин	Ильич	89855210345	9974553704	2012-12-12	31	131
Георгий	Кот	Максимович	89166321456	9997839385	2015-06-16	32	132
Илья	Митрошкин	Владленович	89177432567	9931101108	2017-04-04	33	133
Иван	Керкин	Олегович	89858543678	9997122033	2013-02-12	34	134
Сергей	Кипка	Владленович	89859654789	9930741663	2020-03-16	35	135
Михаил	Шорт	Сергеевич	89850765890	9969169329	2023-03-20	36	136
Иван	Нерф	Александрович	89161876901	9950422559	2017-02-13	37	137
Руслан	Красный	Олегович	89172987012	9907157543	2013-12-13	38	138
Виктор	Ольхов	Артемович	89853098123	9966890099	2018-11-11	39	139
Сергей	Ваныкин	Сергеевич	89034109234	9962332961	2022-02-20	40	140
\.


--
-- Data for Name: gas; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.gas (gas_type, gas_date, gas_quantity, car_id, gas_id) FROM stdin;
﻿92	2018-04-20	223.00	12	1
92	2018-04-23	108.00	8	2
92	2018-04-26	329.00	4	3
92	2018-04-29	278.00	16	4
ДТ	2018-05-02	107.00	28	5
ДТ	2018-05-05	124.00	31	6
92	2018-05-08	355.00	3	7
ДТ	2018-05-11	359.00	26	8
95	2018-05-14	164.00	21	9
92	2018-05-17	123.00	5	10
ДТ	2018-05-20	382.00	39	11
92	2018-05-23	181.00	9	12
92	2018-05-26	197.00	14	13
ДТ	2018-05-29	375.00	27	14
ДТ	2018-06-01	386.00	27	15
ДТ	2018-06-04	312.00	31	16
ДТ	2018-06-07	281.00	33	17
92	2018-06-10	291.00	9	18
ДТ	2018-06-13	398.00	30	19
ДТ	2018-06-16	392.00	36	20
ДТ	2018-06-19	227.00	34	21
ДТ	2018-06-22	393.00	30	22
92	2018-06-25	339.00	12	23
ДТ	2018-06-28	274.00	34	24
ДТ	2018-07-01	130.00	27	25
95	2018-07-04	159.00	1	26
ДТ	2018-07-07	302.00	35	27
92	2018-07-10	254.00	17	28
92	2018-07-13	373.00	16	29
92	2018-07-16	215.00	11	30
ДТ	2018-07-19	142.00	33	31
92	2018-07-22	105.00	14	32
92	2018-07-25	170.00	7	33
92	2018-07-28	243.00	16	34
92	2018-07-31	393.00	17	35
ДТ	2018-08-03	130.00	25	36
92	2018-08-06	226.00	19	37
92	2018-08-09	194.00	11	38
ДТ	2018-08-12	356.00	35	39
ДТ	2018-08-15	215.00	30	40
95	2018-08-18	304.00	38	41
ДТ	2018-08-21	226.00	36	42
92	2018-08-24	172.00	4	43
92	2018-08-27	399.00	10	44
92	2018-08-30	288.00	2	45
92	2018-09-02	261.00	9	46
ДТ	2018-09-05	311.00	39	47
92	2018-09-08	105.00	13	48
ДТ	2018-09-11	230.00	32	49
ДТ	2018-09-14	204.00	29	50
92	2018-09-17	381.00	7	51
92	2018-09-20	216.00	13	52
ДТ	2018-09-23	362.00	37	53
92	2018-09-26	108.00	16	54
ДТ	2018-09-29	387.00	38	55
92	2018-10-02	204.00	7	56
95	2018-10-05	264.00	37	57
ДТ	2018-10-08	244.00	34	58
95	2018-10-11	142.00	11	59
ДТ	2018-10-14	112.00	27	60
92	2018-10-17	167.00	8	61
92	2018-10-20	170.00	21	62
92	2018-10-23	228.00	13	63
92	2018-10-26	125.00	13	64
ДТ	2018-10-29	251.00	31	65
92	2018-11-01	308.00	24	66
92	2018-11-04	145.00	19	67
92	2018-11-07	233.00	4	68
92	2018-11-10	242.00	11	69
92	2018-11-13	237.00	5	70
92	2018-11-16	296.00	16	71
92	2019-01-11	338.00	23	72
92	2019-01-14	157.00	2	73
92	2019-01-17	322.00	4	74
92	2019-01-20	163.00	17	75
ДТ	2019-01-23	117.00	34	76
ДТ	2019-01-26	274.00	29	77
92	2019-01-29	249.00	6	78
ДТ	2019-02-01	190.00	27	79
ДТ	2019-02-04	293.00	30	80
ДТ	2019-02-07	326.00	25	81
92	2019-02-10	379.00	8	82
95	2019-02-13	262.00	7	83
92	2019-02-16	283.00	4	84
92	2019-02-19	371.00	9	85
92	2019-02-22	123.00	19	86
92	2019-02-25	185.00	16	87
ДТ	2019-02-28	338.00	36	88
ДТ	2019-03-03	299.00	32	89
92	2019-03-06	218.00	7	90
92	2019-03-09	238.00	19	91
92	2019-03-12	158.00	18	92
ДТ	2019-03-15	119.00	34	93
92	2019-03-18	310.00	4	94
92	2019-03-21	308.00	23	95
92	2019-03-24	105.00	6	96
92	2019-03-27	351.00	14	97
95	2019-03-30	251.00	6	98
ДТ	2019-04-02	390.00	26	99
92	2019-04-05	368.00	21	100
ДТ	2019-04-08	357.00	32	101
ДТ	2019-04-11	379.00	38	102
92	2019-04-14	132.00	14	103
ДТ	2019-04-17	295.00	28	104
ДТ	2019-04-20	121.00	37	105
92	2019-04-23	157.00	23	106
92	2019-04-26	358.00	11	107
ДТ	2019-04-29	171.00	27	108
92	2019-05-02	100.00	22	109
95	2019-05-05	312.00	26	110
92	2019-05-08	311.00	24	111
92	2019-05-11	223.00	7	112
92	2019-05-14	153.00	14	113
92	2019-05-17	157.00	1	114
ДТ	2019-05-20	284.00	28	115
ДТ	2019-05-23	372.00	35	116
ДТ	2019-05-26	243.00	31	117
92	2019-05-29	289.00	13	118
92	2019-06-01	109.00	3	119
ДТ	2019-06-04	115.00	36	120
ДТ	2019-06-07	134.00	25	121
92	2019-06-10	311.00	23	122
ДТ	2019-06-13	398.00	37	123
ДТ	2019-06-16	309.00	39	124
95	2019-06-19	206.00	3	125
92	2019-06-22	332.00	7	126
92	2019-06-25	274.00	20	127
92	2019-06-28	182.00	20	128
92	2019-07-01	215.00	15	129
ДТ	2019-07-04	190.00	29	130
95	2019-07-07	346.00	18	131
92	2019-07-10	383.00	17	132
92	2019-07-13	322.00	22	133
92	2019-07-16	311.00	17	134
92	2019-07-19	209.00	7	135
92	2019-07-22	190.00	23	136
95	2019-07-25	118.00	9	137
92	2019-07-28	338.00	8	138
ДТ	2019-07-31	359.00	36	139
ДТ	2019-08-03	246.00	36	140
92	2019-08-06	134.00	3	141
ДТ	2019-08-09	332.00	36	142
92	2019-08-12	201.00	9	143
ДТ	2019-08-15	193.00	28	144
ДТ	2019-08-18	132.00	31	145
92	2019-08-21	178.00	8	146
92	2019-08-24	376.00	24	147
92	2019-08-27	232.00	2	148
95	2019-08-30	127.00	33	149
92	2019-09-02	361.00	12	150
92	2019-09-05	377.00	24	151
92	2019-09-08	296.00	22	152
92	2019-09-11	139.00	17	153
ДТ	2019-09-14	139.00	32	154
92	2019-09-17	340.00	4	155
ДТ	2019-09-20	244.00	38	156
ДТ	2019-09-23	346.00	34	157
92	2019-09-26	260.00	11	158
92	2019-09-29	226.00	13	159
ДТ	2019-10-02	352.00	40	160
95	2019-10-05	303.00	34	161
92	2019-10-08	306.00	5	162
92	2019-10-11	139.00	9	163
92	2019-10-14	236.00	6	164
92	2019-10-17	171.00	20	165
92	2019-10-20	171.00	15	166
ДТ	2019-10-23	302.00	32	167
92	2019-10-26	399.00	6	168
92	2019-10-29	265.00	24	169
ДТ	2019-11-01	161.00	26	170
92	2019-11-04	377.00	16	171
92	2019-11-07	159.00	2	172
95	2019-11-10	369.00	14	173
92	2019-11-13	305.00	16	174
92	2019-11-16	247.00	14	175
ДТ	2019-11-19	137.00	35	176
ДТ	2019-11-22	300.00	40	177
ДТ	2019-11-25	117.00	36	178
92	2019-11-28	300.00	17	179
ДТ	2019-12-01	176.00	29	180
ДТ	2019-12-04	313.00	25	181
92	2019-12-07	284.00	15	182
92	2019-12-10	285.00	22	183
92	2019-12-13	153.00	21	184
95	2019-12-16	145.00	19	185
92	2019-12-19	251.00	15	186
92	2019-12-22	385.00	21	187
92	2019-12-25	227.00	6	188
92	2019-12-28	211.00	23	189
92	2019-12-31	103.00	13	190
92	2020-01-03	105.00	22	191
92	2020-01-06	366.00	23	192
ДТ	2020-01-09	283.00	35	193
ДТ	2020-01-12	151.00	40	194
92	2020-01-15	119.00	2	195
ДТ	2020-01-18	245.00	39	196
95	2020-01-21	286.00	28	197
92	2020-01-24	359.00	8	198
ДТ	2020-01-27	189.00	30	199
ДТ	2020-01-30	161.00	34	200
92	2020-02-02	134.00	11	201
95	2020-02-05	328.00	20	202
95	2020-02-08	176.00	38	203
ДТ	2020-02-11	377.00	26	204
92	2020-02-14	306.00	9	205
92	2020-02-17	337.00	18	206
92	2020-02-20	376.00	17	207
92	2020-02-23	148.00	6	208
ДТ	2020-02-26	314.00	25	209
92	2020-02-29	339.00	11	210
92	2020-03-03	228.00	10	211
ДТ	2020-03-06	355.00	31	212
92	2020-03-09	300.00	2	213
ДТ	2020-03-12	252.00	30	214
92	2020-03-15	221.00	5	215
92	2020-03-18	226.00	5	216
95	2020-03-21	392.00	33	217
ДТ	2020-03-24	100.00	40	218
92	2020-03-27	142.00	8	219
92	2020-06-29	311.00	24	220
92	2020-07-02	360.00	4	221
92	2020-07-05	126.00	2	222
95	2020-07-08	230.00	39	223
95	2020-07-11	129.00	27	224
ДТ	2020-07-14	190.00	32	225
92	2020-07-17	246.00	15	226
ДТ	2020-07-20	238.00	39	227
95	2020-07-23	115.00	35	228
92	2020-07-26	128.00	5	229
92	2020-07-29	169.00	20	230
92	2020-08-01	236.00	12	231
ДТ	2020-08-04	382.00	25	232
92	2020-08-07	221.00	6	233
92	2020-08-10	204.00	10	234
92	2020-08-13	165.00	12	235
ДТ	2020-08-16	251.00	34	236
92	2020-08-19	102.00	4	237
ДТ	2020-08-22	111.00	32	238
ДТ	2020-08-25	105.00	40	239
ДТ	2020-08-28	363.00	33	240
95	2020-08-31	267.00	4	241
92	2020-09-03	276.00	2	242
95	2020-09-06	372.00	28	243
ДТ	2020-09-09	164.00	39	244
92	2020-09-12	320.00	15	245
ДТ	2020-09-15	191.00	34	246
92	2020-09-18	201.00	11	247
92	2020-09-21	221.00	7	248
95	2020-09-24	301.00	9	249
92	2020-09-27	104.00	3	250
92	2020-09-30	198.00	6	251
92	2020-10-03	334.00	4	252
92	2020-10-06	392.00	18	253
92	2020-10-09	283.00	1	254
ДТ	2020-10-12	395.00	25	255
92	2020-10-15	284.00	11	256
92	2020-10-18	312.00	4	257
92	2020-10-21	288.00	17	258
92	2020-10-24	270.00	9	259
95	2020-10-27	203.00	40	260
ДТ	2020-10-30	386.00	39	261
ДТ	2020-11-02	226.00	33	262
92	2020-11-05	308.00	8	263
92	2020-11-08	396.00	14	264
ДТ	2020-11-11	285.00	29	265
92	2020-11-14	372.00	6	266
92	2020-11-17	205.00	4	267
ДТ	2020-11-20	372.00	27	268
92	2020-11-23	387.00	21	269
ДТ	2020-11-26	224.00	34	270
92	2020-11-29	279.00	6	271
ДТ	2020-12-02	150.00	27	272
ДТ	2020-12-05	175.00	37	273
92	2020-12-08	309.00	13	274
95	2020-12-11	313.00	27	275
95	2020-12-14	397.00	27	276
92	2020-12-17	350.00	1	277
92	2020-12-20	342.00	21	278
92	2020-12-23	150.00	20	279
92	2020-12-26	186.00	14	280
92	2020-12-29	225.00	16	281
ДТ	2021-01-01	212.00	38	282
ДТ	2021-01-04	325.00	33	283
ДТ	2021-01-07	251.00	27	284
92	2021-01-10	197.00	16	285
ДТ	2021-01-13	199.00	37	286
92	2021-01-16	238.00	10	287
ДТ	2021-01-19	376.00	39	288
ДТ	2021-01-22	331.00	26	289
ДТ	2021-01-25	390.00	36	290
95	2021-01-28	231.00	29	291
95	2021-01-31	146.00	24	292
ДТ	2021-02-03	246.00	33	293
92	2021-02-06	290.00	10	294
92	2021-02-09	171.00	5	295
92	2021-02-12	145.00	20	296
ДТ	2021-02-15	285.00	34	297
92	2021-02-18	181.00	19	298
ДТ	2021-02-21	274.00	33	299
ДТ	2021-02-24	245.00	36	300
ДТ	2021-02-27	272.00	32	301
92	2021-03-02	355.00	24	302
92	2021-03-05	194.00	17	303
92	2021-03-08	194.00	12	304
92	2021-03-11	213.00	20	305
92	2021-03-14	341.00	13	306
92	2021-03-17	203.00	5	307
ДТ	2021-03-20	240.00	26	308
95	2021-03-23	221.00	30	309
95	2021-03-26	198.00	8	310
95	2021-03-29	198.00	27	311
ДТ	2021-04-01	310.00	34	312
92	2021-04-04	173.00	2	313
ДТ	2021-04-07	272.00	38	314
92	2021-04-10	134.00	13	315
92	2021-10-13	396.00	7	316
ДТ	2021-10-16	287.00	34	317
92	2021-10-19	117.00	3	318
ДТ	2021-10-22	337.00	28	319
92	2021-10-25	385.00	2	320
92	2021-10-28	101.00	18	321
ДТ	2021-10-31	211.00	25	322
92	2021-11-03	292.00	1	323
92	2021-11-06	156.00	15	324
92	2021-11-09	348.00	18	325
ДТ	2021-11-12	157.00	35	326
92	2021-11-15	238.00	9	327
ДТ	2021-11-18	222.00	36	328
92	2021-11-21	333.00	13	329
92	2021-11-24	122.00	16	330
92	2021-11-27	226.00	17	331
ДТ	2021-11-30	232.00	31	332
95	2021-12-03	347.00	27	333
95	2021-12-06	150.00	21	334
ДТ	2021-12-09	377.00	34	335
92	2021-12-12	214.00	5	336
92	2021-12-15	207.00	6	337
92	2021-12-18	326.00	8	338
92	2021-12-21	170.00	7	339
92	2021-12-24	172.00	24	340
92	2021-12-27	400.00	9	341
ДТ	2021-12-30	364.00	33	342
ДТ	2022-01-02	256.00	27	343
ДТ	2022-01-05	321.00	39	344
ДТ	2022-01-08	328.00	37	345
ДТ	2022-01-11	229.00	30	346
92	2022-01-14	352.00	10	347
92	2022-01-17	194.00	7	348
ДТ	2022-01-20	296.00	36	349
92	2022-01-23	388.00	19	350
ДТ	2022-01-26	305.00	36	351
92	2022-01-29	359.00	1	352
ДТ	2022-02-01	185.00	31	353
92	2022-02-04	229.00	2	354
92	2022-02-07	120.00	11	355
92	2022-02-10	153.00	14	356
92	2022-02-13	117.00	18	357
92	2022-02-16	109.00	21	358
92	2022-02-19	115.00	2	359
92	2022-02-22	376.00	2	360
92	2022-02-25	267.00	7	361
92	2022-02-28	169.00	19	362
ДТ	2022-03-03	363.00	37	363
95	2022-03-06	115.00	33	364
95	2022-03-09	320.00	28	365
95	2022-03-12	377.00	12	366
92	2022-03-15	246.00	21	367
ДТ	2022-03-18	147.00	36	368
92	2022-03-21	259.00	14	369
92	2022-03-24	270.00	10	370
92	2022-03-27	157.00	12	371
92	2022-03-30	319.00	12	372
92	2022-04-02	264.00	12	373
92	2022-04-05	349.00	12	374
ДТ	2022-04-08	218.00	31	375
92	2022-04-11	132.00	1	376
92	2022-04-14	131.00	9	377
92	2022-04-17	292.00	9	378
ДТ	2022-04-20	378.00	27	379
ДТ	2022-04-23	331.00	28	380
95	2022-04-26	378.00	11	381
95	2022-04-29	255.00	17	382
95	2022-05-02	360.00	17	383
95	2022-05-05	134.00	28	384
95	2022-05-08	320.00	11	385
92	2022-05-11	375.00	14	386
92	2022-05-14	126.00	5	387
92	2022-05-17	276.00	8	388
92	2022-05-20	343.00	4	389
92	2022-05-23	118.00	7	390
92	2022-05-26	368.00	19	391
92	2022-05-29	319.00	3	392
92	2022-06-01	367.00	5	393
ДТ	2022-06-04	345.00	29	394
95	2022-06-07	112.00	8	395
ДТ	2022-06-10	390.00	32	396
95	2022-06-13	220.00	34	397
ДТ	2022-06-16	353.00	35	398
ДТ	2022-06-19	348.00	31	399
92	2022-06-22	301.00	10	400
ДТ	2022-06-25	391.00	35	401
ДТ	2022-06-28	396.00	28	402
ДТ	2022-07-01	214.00	33	403
92	2022-07-04	228.00	15	404
95	2022-07-07	264.00	7	405
92	2022-07-10	325.00	6	406
95	2022-07-13	385.00	38	407
92	2022-07-16	133.00	14	408
92	2022-07-19	140.00	17	409
92	2022-07-22	390.00	3	410
92	2022-07-25	207.00	24	411
ДТ	2022-07-28	115.00	26	412
ДТ	2022-07-31	372.00	35	413
ДТ	2022-08-03	316.00	25	414
92	2022-08-06	277.00	19	415
92	2022-08-09	148.00	23	416
92	2022-08-12	145.00	6	417
95	2022-08-15	264.00	33	418
ДТ	2022-08-18	343.00	33	419
95	2022-08-21	334.00	14	420
92	2022-08-24	181.00	7	421
ДТ	2022-08-27	349.00	32	422
ДТ	2022-08-30	191.00	27	423
ДТ	2022-09-02	293.00	31	424
92	2022-09-05	215.00	21	425
92	2022-09-08	369.00	16	426
92	2022-09-11	183.00	9	427
92	2022-09-14	238.00	5	428
92	2022-09-17	218.00	6	429
92	2022-09-20	150.00	22	430
ДТ	2022-09-23	264.00	39	431
95	2022-09-26	343.00	9	432
95	2022-09-29	385.00	38	433
95	2022-10-02	351.00	22	434
92	2022-10-05	261.00	3	435
92	2022-10-08	124.00	10	436
92	2022-10-11	220.00	3	437
92	2022-10-14	130.00	6	438
ДТ	2022-10-17	391.00	31	439
92	2022-10-20	208.00	13	440
92	2022-10-23	386.00	7	441
ДТ	2022-10-26	123.00	36	442
92	2022-10-29	148.00	11	443
92	2022-11-01	309.00	16	444
92	2022-11-04	341.00	21	445
ДТ	2022-11-07	118.00	26	446
95	2022-11-10	321.00	31	447
92	2022-11-13	151.00	18	448
95	2022-11-16	246.00	32	449
ДТ	2022-11-19	297.00	38	450
92	2022-11-22	222.00	15	451
ДТ	2022-11-25	281.00	33	452
92	2022-11-28	389.00	22	453
92	2022-12-01	230.00	14	454
92	2022-12-04	124.00	24	455
92	2022-12-07	100.00	17	456
ДТ	2022-12-10	100.00	39	457
92	2022-12-13	252.00	15	458
95	2022-12-16	206.00	1	459
ДТ	2022-12-19	262.00	32	460
92	2022-12-22	225.00	7	461
95	2022-12-25	362.00	3	462
ДТ	2022-12-28	118.00	30	463
92	2022-12-31	261.00	10	464
92	2023-01-03	100.00	7	465
ДТ	2023-01-06	224.00	36	466
ДТ	2023-01-09	278.00	39	467
92	2023-01-12	138.00	13	468
95	2023-01-15	281.00	16	469
92	2023-01-18	287.00	22	470
95	2023-01-21	396.00	12	471
ДТ	2023-01-24	371.00	29	472
92	2023-01-27	334.00	17	473
92	2023-01-30	100.00	22	474
92	2023-02-02	314.00	10	475
92	2023-02-05	307.00	18	476
95	2023-02-08	399.00	19	477
92	2023-02-11	171.00	3	478
95	2023-02-14	385.00	6	479
95	2023-02-17	109.00	32	480
92	2023-02-20	227.00	8	481
92	2023-02-23	393.00	15	482
92	2023-02-26	246.00	23	483
92	2023-03-01	292.00	24	484
92	2023-03-04	294.00	9	485
95	2023-03-07	190.00	24	486
95	2023-03-10	320.00	6	487
95	2023-03-13	301.00	22	488
92	2023-03-16	277.00	3	489
92	2023-03-19	185.00	21	490
92	2023-03-22	391.00	13	491
92	2023-03-25	148.00	17	492
ДТ	2023-03-28	376.00	31	493
92	2023-03-31	238.00	20	494
92	2023-04-03	243.00	7	495
92	2023-04-06	383.00	3	496
95	2023-04-09	341.00	6	497
ДТ	2023-04-12	383.00	38	498
92	2023-04-15	385.00	17	499
95	2023-04-18	188.00	33	500
ДТ	2023-04-21	399.00	36	501
92	2023-04-24	106.00	14	502
ДТ	2023-04-27	390.00	29	503
ДТ	2023-04-30	162.00	30	504
92	2023-05-03	357.00	2	505
92	2023-05-06	119.00	18	506
ДТ	2023-05-09	174.00	38	507
ДТ	2023-05-12	346.00	30	508
95	2023-05-15	362.00	19	509
92	2023-05-18	242.00	20	510
ДТ	2023-05-21	177.00	33	511
ДТ	2023-05-24	190.00	36	512
ДТ	2023-05-27	360.00	27	513
ДТ	2023-05-30	102.00	28	514
ДТ	2023-06-02	183.00	39	515
92	2023-06-05	165.00	8	516
92	2023-06-08	160.00	12	517
92	2023-06-11	127.00	19	518
92	2023-06-14	280.00	10	519
95	2023-06-17	330.00	14	520
\.


--
-- Data for Name: gas_type_cost; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.gas_type_cost (gas_type2, gas_cost_per_litr) FROM stdin;
92	38.0
95	42.0
ДТ	44.0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.orders (start_point, end_point, order_date, status, order_cost, cargo_id, client_id, driver_id, order_id) FROM stdin;
﻿Тула (Тул.)	Коломна (Моск.)	2017-01-13	Ready	72626.00	41	67	111	1
Москва (Моск.)	Обнинск (Калуж.)	2017-01-16	Ready	66011.00	168	72	112	2
Серпухов (Моск.)	Донской (Тул.)	2017-01-19	Ready	62749.00	91	50	107	3
Калуга (Калуж.)	Щёкино (Тул.)	2017-01-22	Ready	23859.00	92	70	134	4
Рязань (Ряз.)	Кашира (Моск.)	2017-01-25	Ready	72288.00	193	46	123	5
Алексин (Тул.)	Рязань (Ряз.)	2017-01-28	Ready	33004.00	74	59	114	6
Щёкино (Тул.)	Кимовск (Тул.)	2017-01-31	Ready	24944.00	34	81	140	7
Новомосковск (Тул.)	Серпухов (Моск.)	2017-02-03	Ready	65280.00	145	87	125	8
Донской (Тул.)	Богородицк (Тул.)	2017-02-06	Ready	33027.00	22	18	122	9
Ефремов (Тул.)	Алексин (Тул.)	2017-02-09	Ready	30881.00	186	16	136	10
Богородицк (Тул.)	Новомосковск (Тул.)	2017-02-12	Ready	17583.00	28	98	111	11
Кимовск (Тул.)	Ефремов (Тул.)	2017-02-15	Ready	75380.00	64	1	110	12
Клин (Моск.)	Тула (Тул.)	2017-02-18	Ready	16430.00	84	63	112	13
Подольск (Моск.)	Подольск (Моск.)	2017-02-21	Ready	41086.00	21	28	133	14
Коломна (Моск.)	Клин (Моск.)	2017-02-24	Ready	22625.00	163	99	105	15
Орехово-Зуево (Моск.)	Мытищи (Моск.)	2017-02-27	Ready	43979.00	24	17	137	16
Мытищи (Моск.)	Королёв (Моск.)	2017-03-02	Ready	70792.00	129	14	111	17
Королёв (Моск.)	Люберцы (Моск.)	2017-03-05	Ready	77515.00	28	27	102	18
Люберцы (Моск.)	Электросталь (Моск.)	2017-03-08	Ready	54096.00	36	11	130	19
Электросталь (Моск.)	Дмитров (Моск.)	2017-03-11	Ready	71597.00	126	30	123	20
Дмитров (Моск.)	Сергиев Посад (Моск.)	2017-03-14	Ready	33110.00	126	88	120	21
Сергиев Посад (Моск.)	Чехов (Моск.)	2017-03-17	Ready	77426.00	173	5	102	22
Чехов (Моск.)	Наро-Фоминск (Моск.)	2017-03-20	Ready	34243.00	35	18	101	23
Наро-Фоминск (Моск.)	Жуковский (Моск.)	2017-03-23	Ready	30230.00	199	99	106	24
Обнинск (Калуж.)	Дубна (Моск.)	2017-03-26	Ready	49921.00	65	99	122	25
Жуковский (Моск.)	Раменское (Моск.)	2017-03-29	Ready	48845.00	134	30	115	26
Дубна (Моск.)	Видное (Моск.)	2017-04-01	Ready	84883.00	140	71	136	27
Раменское (Моск.)	Домодедово (Моск.)	2017-04-04	Ready	31298.00	41	77	135	28
Видное (Моск.)	Солнечногорск (Моск.)	2017-04-07	Ready	16691.00	48	46	132	29
Домодедово (Моск.)	Истра (Моск.)	2017-04-10	Ready	53152.00	164	4	128	30
Солнечногорск (Моск.)	Зарайск (Моск.)	2017-04-13	Ready	23959.00	62	41	121	31
Истра (Моск.)	Воскресенск (Моск.)	2017-04-16	Ready	43624.00	127	38	115	32
Зарайск (Моск.)	Павловский Посад (Моск.)	2017-04-19	Ready	59576.00	138	94	108	33
Воскресенск (Моск.)	Красногорск (Моск.)	2017-04-22	Ready	53411.00	111	60	121	34
Павловский Посад (Моск.)	Одинцово (Моск.)	2017-04-25	Ready	58622.00	47	68	103	35
Красногорск (Моск.)	Балашиха (Моск.)	2017-04-28	Ready	15544.00	59	31	107	36
Одинцово (Моск.)	Химки (Моск.)	2017-05-01	Ready	31137.00	116	66	118	37
Балашиха (Моск.)	Реутов (Моск.)	2017-05-04	Ready	30480.00	167	38	105	38
Химки (Моск.)	Ногинск (Моск.)	2017-05-07	Ready	12510.00	188	65	132	39
Реутов (Моск.)	Фрязино (Моск.)	2017-05-10	Ready	40519.00	191	90	120	40
Ногинск (Моск.)	Лобня (Моск.)	2017-05-13	Ready	60549.00	83	88	139	41
Фрязино (Моск.)	Дзержинский (Моск.)	2017-05-16	Ready	41123.00	119	71	137	42
Лобня (Моск.)	Протвино (Моск.)	2017-05-19	Ready	83159.00	57	49	104	43
Дзержинский (Моск.)	Пущино (Моск.)	2017-05-22	Ready	40221.00	89	75	113	44
Протвино (Моск.)	Таруса (Калуж.)	2017-05-25	Ready	23651.00	89	13	114	45
Пущино (Моск.)	Ступино (Моск.)	2017-05-28	Ready	59037.00	174	67	126	46
Таруса (Калуж.)	Озёры (Моск.)	2017-05-31	Ready	56385.00	34	33	114	47
Бехово (Тул.)	Звенигород (Моск.)	2017-06-03	Ready	63530.00	74	100	128	48
Алексин (Тул.)	Дедовск (Моск.)	2017-06-06	Ready	12956.00	13	32	124	49
Тула (Тул.)	Ивантеевка (Моск.)	2017-06-09	Ready	78470.00	132	14	121	50
Кашира (Моск.)	Куровское (Моск.)	2017-06-12	Ready	57590.00	135	9	129	51
Ступино (Моск.)	Ликино-Дулёво (Моск.)	2017-06-15	Ready	61879.00	74	62	106	52
Озёры (Моск.)	Рошаль (Моск.)	2017-06-18	Ready	39488.00	159	90	129	53
Звенигород (Моск.)	Шатура (Моск.)	2017-06-21	Ready	20458.00	41	58	137	54
Клин (Моск.)	Электрогорск (Моск.)	2017-06-24	Ready	26206.00	63	41	131	55
Дедовск (Моск.)	Луховицы (Моск.)	2017-06-27	Ready	17857.00	36	49	119	56
Ивантеевка (Моск.)	Егорьевск (Моск.)	2017-06-30	Ready	24708.00	40	8	113	57
Куровское (Моск.)	Серебряные Пруды (Моск.)	2017-07-03	Ready	71636.00	123	84	116	58
Ликино-Дулёво (Моск.)	Скопин (Ряз.)	2017-07-06	Ready	34403.00	75	15	139	59
Рошаль (Моск.)	Михайлов (Ряз.)	2017-07-09	Ready	36482.00	4	73	120	60
Шатура (Моск.)	Кораблино (Ряз.)	2017-07-12	Ready	45668.00	116	60	111	61
Электрогорск (Моск.)	Ряжск (Ряз.)	2017-07-15	Ready	61555.00	14	33	134	62
Луховицы (Моск.)	Сасово (Ряз.)	2017-07-18	Ready	52840.00	128	93	117	63
Егорьевск (Моск.)	Касимов (Ряз.)	2017-07-21	Ready	57166.00	36	53	106	64
Серебряные Пруды (Моск.)	Шацк (Ряз.)	2017-07-24	Ready	52803.00	132	55	132	65
Скопин (Ряз.)	Щёлково (Моск.)	2017-07-27	Ready	44708.00	99	100	138	66
Михайлов (Ряз.)	Черусти (Моск.)	2017-07-30	Ready	44985.00	23	57	126	67
Кораблино (Ряз.)	Талдом (Моск.)	2017-08-02	Ready	51321.00	129	77	125	68
Ряжск (Ряз.)	Высоковск (Моск.)	2017-08-05	Ready	76415.00	190	1	127	69
Сасово (Ряз.)	Кубинка (Моск.)	2017-08-08	Ready	40184.00	122	11	102	70
Касимов (Ряз.)	Голицыно (Моск.)	2017-08-11	Ready	56181.00	81	47	115	71
Шацк (Ряз.)	Можайск (Моск.)	2017-08-14	Ready	65982.00	147	72	107	72
Щёлково (Моск.)	Верея (Моск.)	2017-08-17	Ready	73679.00	175	6	114	73
Черусти (Моск.)	Боровск (Калуж.)	2017-08-20	Ready	75535.00	188	18	106	74
Талдом (Моск.)	Малоярославец (Калуж.)	2017-08-23	Ready	43785.00	133	28	134	75
Высоковск (Моск.)	Жуков (Калуж.)	2017-08-26	Ready	72053.00	63	34	106	76
Кубинка (Моск.)	Белоусово (Калуж.)	2017-08-29	Ready	25432.00	42	42	129	77
Голицыно (Моск.)	Кременки (Калуж.)	2017-09-01	Ready	69397.00	153	49	115	78
Можайск (Моск.)	Сосенский (Калуж.)	2017-09-04	Ready	43517.00	167	82	103	79
Верея (Моск.)	Суворов (Тул.)	2017-09-07	Ready	36102.00	83	96	130	80
Боровск (Калуж.)	Ясногорск (Тул.)	2017-09-10	Ready	21870.00	91	42	112	81
Малоярославец (Калуж.)	Плавск (Тул.)	2017-09-13	Ready	84901.00	130	7	119	82
Жуков (Калуж.)	Венёв (Тул.)	2017-09-16	Ready	41408.00	34	51	121	83
Белоусово (Калуж.)	Белёв (Тул.)	2017-09-19	Ready	77573.00	65	92	105	84
Кременки (Калуж.)	Болохово (Тул.)	2017-09-22	Ready	73805.00	143	22	138	85
Сосенский (Калуж.)	Киреевск (Тул.)	2017-09-25	Ready	66472.00	19	68	108	86
Суворов (Тул.)	Липки (Тул.)	2017-09-28	Ready	61745.00	69	4	107	87
Ясногорск (Тул.)	Советск (Тул.)	2017-10-01	Ready	66853.00	75	27	135	88
Плавск (Тул.)	Узловая (Тул.)	2017-10-04	Ready	59620.00	123	25	125	89
Венёв (Тул.)	Первомайский (Тул.)	2017-10-07	Ready	21016.00	109	3	128	90
Белёв (Тул.)	Товарковский (Тул.)	2017-10-10	Ready	63300.00	49	41	107	91
Болохово (Тул.)	Куркино (Тул.)	2017-10-13	Ready	53371.00	123	74	109	92
Киреевск (Тул.)	Волово (Тул.)	2017-10-16	Ready	76214.00	163	28	135	93
Липки (Тул.)	Чекалин (Тул.)	2017-10-19	Ready	53903.00	91	2	124	94
Советск (Тул.)	Арсеньево (Тул.)	2017-10-22	Ready	51293.00	125	60	139	95
Щёкино (Тул.)	Одоев (Тул.)	2017-10-25	Ready	32361.00	127	73	111	96
Новомосковск (Тул.)	Кимры (Твер.)	2017-10-28	Ready	13970.00	111	38	119	97
Донской (Тул.)	Балабаново (Калуж.)	2017-10-31	Ready	12234.00	166	68	127	98
Ефремов (Тул.)	Ермолино (Калуж.)	2017-11-03	Ready	83878.00	100	18	124	99
Богородицк (Тул.)	Кондрово (Калуж.)	2017-11-06	Ready	23555.00	176	95	106	100
Кимовск (Тул.)	Полотняный Завод (Калуж.)	2017-11-09	Ready	63517.00	173	58	138	101
Узловая (Тул.)	Медынь (Калуж.)	2017-11-12	Ready	81629.00	125	15	107	102
Первомайский (Тул.)	Мещовск (Калуж.)	2017-11-15	Ready	48627.00	189	7	134	103
Товарковский (Тул.)	Мосальск (Калуж.)	2017-11-18	Ready	70687.00	23	91	116	104
Куркино (Тул.)	Юхнов (Калуж.)	2017-11-21	Ready	47695.00	126	100	118	105
Волово (Тул.)	Спас-Деменск (Калуж.)	2017-11-24	Ready	33935.00	142	72	109	106
Чекалин (Тул.)	Киров (Калуж.)	2017-11-27	Ready	46998.00	66	56	103	107
Арсеньево (Тул.)	Людиново (Калуж.)	2017-11-30	Ready	73354.00	182	41	113	108
Одоев (Тул.)	Жиздра (Калуж.)	2017-12-03	Ready	52240.00	90	91	129	109
Дубна (Моск.)	Козельск (Калуж.)	2017-12-06	Ready	29638.00	170	52	104	110
Кимры (Твер.)	Сухиничи (Калуж.)	2017-12-09	Ready	24222.00	109	68	112	111
Талдом (Моск.)	Барятино (Калуж.)	2017-12-12	Ready	76776.00	123	37	104	112
Дмитров (Моск.)	Болхов (Орл.)	2017-12-15	Ready	81212.00	36	39	101	113
Сергиев Посад (Моск.)	Мценск (Орл.)	2017-12-18	Ready	30196.00	73	45	140	114
Калуга (Калуж.)	Новосиль (Орл.)	2017-12-21	Ready	55593.00	26	34	114	115
Обнинск (Калуж.)	Верховье (Орл.)	2017-12-24	Ready	30496.00	71	59	118	116
Малоярославец (Калуж.)	Ливны (Орл.)	2017-12-27	Ready	15587.00	37	60	123	117
Балабаново (Калуж.)	Глазуновка (Орл.)	2017-12-30	Ready	57840.00	13	26	130	118
Ермолино (Калуж.)	Долгое (Орл.)	2018-01-02	Ready	34188.00	83	43	128	119
Кондрово (Калуж.)	Кромы (Орл.)	2018-01-05	Ready	31604.00	163	94	137	120
Полотняный Завод (Калуж.)	Орёл (Орл.)	2018-01-08	Ready	27297.00	30	92	116	121
Медынь (Калуж.)	Елец (Лип.)	2018-01-11	Ready	51671.00	137	64	139	122
Мещовск (Калуж.)	Задонск (Лип.)	2018-01-14	Ready	62231.00	177	28	126	123
Мосальск (Калуж.)	Лебедянь (Лип.)	2018-01-17	Ready	22050.00	110	98	110	124
Юхнов (Калуж.)	Данков (Лип.)	2018-01-20	Ready	81444.00	77	35	110	125
Спас-Деменск (Калуж.)	Чаплыгин (Лип.)	2018-01-23	Ready	62390.00	164	75	103	126
Киров (Калуж.)	Усмань (Лип.)	2018-01-26	Ready	83121.00	141	23	102	127
Людиново (Калуж.)	Липецк (Лип.)	2018-01-29	Ready	28046.00	161	88	107	128
Жиздра (Калуж.)	Грязи (Лип.)	2018-02-01	Ready	32032.00	38	60	122	129
Козельск (Калуж.)	Мичуринск (Тамб.)	2018-02-04	Ready	71146.00	179	19	133	130
Сухиничи (Калуж.)	Котовск (Тамб.)	2018-02-07	Ready	24470.00	125	43	124	131
Барятино (Калуж.)	Рассказово (Тамб.)	2018-02-10	Ready	46990.00	76	77	131	132
Суворов (Тул.)	Моршанск (Тамб.)	2018-02-13	Ready	32835.00	49	72	128	133
Чекалин (Тул.)	Кирсанов (Тамб.)	2018-02-16	Ready	81432.00	60	54	101	134
Белёв (Тул.)	Уварово (Тамб.)	2018-02-19	Ready	20050.00	95	45	126	135
Болхов (Орл.)	Жердевка (Тамб.)	2018-02-22	Ready	72146.00	135	7	130	136
Мценск (Орл.)	Тамбов (Тамб.)	2018-02-25	Ready	84864.00	179	9	107	137
Новосиль (Орл.)	Новомичуринск (Ряз.)	2018-02-28	Ready	13124.00	57	45	104	138
Верховье (Орл.)	Спасск-Рязанский (Ряз.)	2018-03-03	Ready	21508.00	27	74	125	139
Ливны (Орл.)	Шилово (Ряз.)	2018-03-06	Ready	14346.00	54	92	114	140
Глазуновка (Орл.)	Кадом (Ряз.)	2018-03-09	Ready	31239.00	37	55	119	141
Долгое (Орл.)	Тума (Ряз.)	2018-03-12	Ready	48973.00	117	54	137	142
Кромы (Орл.)	Спас-Клепики (Ряз.)	2018-03-15	Ready	79262.00	74	57	125	143
Орёл (Орл.)	Рыбное (Ряз.)	2018-03-18	Ready	56047.00	199	39	123	144
Болхов (Орл.)	Солотча (Ряз.)	2018-03-21	Ready	60195.00	103	2	133	145
Мценск (Орл.)	Константиново (Ряз.)	2018-03-24	Ready	81223.00	199	9	117	146
Ливны (Орл.)	Калуга (Калуж.)	2018-03-27	Ready	53863.00	77	72	119	147
Елец (Лип.)	Донской (Тул.)	2018-03-30	Ready	69456.00	90	100	114	148
Задонск (Лип.)	Рязань (Ряз.)	2018-04-02	Ready	36241.00	28	39	101	149
Лебедянь (Лип.)	Щёкино (Тул.)	2018-04-05	Ready	52918.00	21	82	104	150
Данков (Лип.)	Калуга (Калуж.)	2018-04-08	Ready	26181.00	41	44	101	151
Чаплыгин (Лип.)	Донской (Тул.)	2018-04-11	Ready	78011.00	12	55	120	152
Раненбург (Лип.)	Рязань (Ряз.)	2018-04-14	Ready	67377.00	143	37	104	153
Мичуринск (Тамб.)	Коломна (Моск.)	2018-04-17	Ready	19592.00	90	55	101	154
Котовск (Тамб.)	Обнинск (Калуж.)	2018-04-20	Ready	60142.00	129	83	134	155
Рассказово (Тамб.)	Алексин (Тул.)	2018-04-23	Ready	27938.00	91	98	117	156
Моршанск (Тамб.)	Новомосковск (Тул.)	2018-04-26	Ready	22291.00	63	18	109	157
Кирсанов (Тамб.)	Серпухов (Моск.)	2018-04-29	Ready	15881.00	185	67	139	158
Уварово (Тамб.)	Богородицк (Тул.)	2018-05-02	Ready	79724.00	1	99	101	159
Жердевка (Тамб.)	Ефремов (Тул.)	2018-05-05	Ready	75033.00	78	44	124	160
Тамбов (Тамб.)	Тула (Тул.)	2018-05-08	Ready	59453.00	41	31	118	161
Котовск (Тамб.)	Подольск (Моск.)	2018-05-11	Ready	26411.00	160	90	114	162
Рассказово (Тамб.)	Клин (Моск.)	2018-05-14	Ready	62775.00	120	59	116	163
Моршанск (Тамб.)	Мытищи (Моск.)	2018-05-17	Ready	29790.00	28	48	113	164
Кирсанов (Тамб.)	Королёв (Моск.)	2018-05-20	Ready	74034.00	202	46	102	165
Уварово (Тамб.)	Люберцы (Моск.)	2018-05-23	Ready	74774.00	187	55	111	166
Жердевка (Тамб.)	Электросталь (Моск.)	2018-05-26	Ready	19646.00	7	99	102	167
Тамбов (Тамб.)	Дмитров (Моск.)	2018-05-29	Ready	59105.00	186	75	101	168
Мичуринск (Тамб.)	Сергиев Посад (Моск.)	2018-06-01	Ready	69491.00	198	85	114	169
Липецк (Лип.)	Чехов (Моск.)	2018-06-04	Ready	72828.00	5	86	116	170
Елец (Лип.)	Наро-Фоминск (Моск.)	2018-06-07	Ready	36411.00	104	73	104	171
Грязи (Лип.)	Жуковский (Моск.)	2018-06-10	Ready	54312.00	75	57	107	172
Лебедянь (Лип.)	Дубна (Моск.)	2018-06-13	Ready	37164.00	102	16	131	173
Данков (Лип.)	Раменское (Моск.)	2018-06-16	Ready	59514.00	15	4	123	174
Усмань (Лип.)	Видное (Моск.)	2018-06-19	Ready	41525.00	35	92	112	175
Чаплыгин (Лип.)	Домодедово (Моск.)	2018-06-22	Ready	16866.00	7	11	132	176
Рязань (Ряз.)	Солнечногорск (Моск.)	2018-06-25	Ready	31092.00	82	12	125	177
Касимов (Ряз.)	Истра (Моск.)	2018-06-28	Ready	14751.00	153	11	124	178
Скопин (Ряз.)	Зарайск (Моск.)	2018-07-01	Ready	63369.00	146	69	127	179
Сасово (Ряз.)	Воскресенск (Моск.)	2018-07-04	Ready	76976.00	67	92	108	180
Шацк (Ряз.)	Павловский Посад (Моск.)	2018-07-07	Ready	66311.00	200	2	113	181
Ряжск (Ряз.)	Красногорск (Моск.)	2018-07-10	Ready	57040.00	176	66	134	182
Кораблино (Ряз.)	Одинцово (Моск.)	2018-07-13	Ready	57531.00	91	45	101	183
Михайлов (Ряз.)	Балашиха (Моск.)	2018-07-16	Ready	70324.00	103	40	110	184
Новомичуринск (Ряз.)	Химки (Моск.)	2018-07-19	Ready	66307.00	73	59	121	185
Спасск-Рязанский (Ряз.)	Реутов (Моск.)	2018-07-22	Ready	31970.00	122	57	139	186
Шилово (Ряз.)	Ногинск (Моск.)	2018-07-25	Ready	22587.00	91	43	140	187
Кадом (Ряз.)	Фрязино (Моск.)	2018-07-28	Ready	38786.00	125	94	116	188
Тума (Ряз.)	Лобня (Моск.)	2018-07-31	Ready	64846.00	189	3	104	189
Спас-Клепики (Ряз.)	Дзержинский (Моск.)	2018-08-03	Ready	18048.00	68	41	109	190
Рыбное (Ряз.)	Протвино (Моск.)	2018-08-06	Ready	42476.00	189	11	139	191
Солотча (Ряз.)	Пущино (Моск.)	2018-08-09	Ready	38806.00	177	39	126	192
Константиново (Ряз.)	Таруса (Калуж.)	2018-08-12	Ready	36411.00	130	100	123	193
Тула (Тул.)	Ступино (Моск.)	2018-08-15	Ready	48170.00	109	77	128	194
Москва (Моск.)	Озёры (Моск.)	2018-08-18	Ready	50139.00	180	66	129	195
Серпухов (Моск.)	Звенигород (Моск.)	2018-08-21	Ready	28567.00	133	93	122	196
Калуга (Калуж.)	Дедовск (Моск.)	2018-08-24	Ready	63991.00	147	15	130	197
Рязань (Ряз.)	Ивантеевка (Моск.)	2018-08-27	Ready	28782.00	200	76	112	198
Алексин (Тул.)	Куровское (Моск.)	2018-08-30	Ready	66317.00	154	50	132	199
Щёкино (Тул.)	Ликино-Дулёво (Моск.)	2018-09-02	Ready	64671.00	187	19	116	200
Новомосковск (Тул.)	Рошаль (Моск.)	2018-09-05	Ready	65557.00	109	33	137	201
Донской (Тул.)	Шатура (Моск.)	2018-09-08	Ready	82525.00	145	22	127	202
Ефремов (Тул.)	Электрогорск (Моск.)	2018-09-11	Ready	51896.00	47	28	135	203
Богородицк (Тул.)	Луховицы (Моск.)	2018-09-14	Ready	67132.00	132	10	130	204
Кимовск (Тул.)	Егорьевск (Моск.)	2018-09-17	Ready	16418.00	111	32	124	205
Клин (Моск.)	Серебряные Пруды (Моск.)	2018-09-20	Ready	55556.00	74	20	102	206
Подольск (Моск.)	Скопин (Ряз.)	2018-09-23	Ready	58260.00	105	22	138	207
Коломна (Моск.)	Михайлов (Ряз.)	2018-09-26	Ready	27592.00	72	26	113	208
Орехово-Зуево (Моск.)	Кораблино (Ряз.)	2018-09-29	Ready	20552.00	123	2	114	209
Мытищи (Моск.)	Ряжск (Ряз.)	2018-10-02	Ready	43309.00	77	52	114	210
Королёв (Моск.)	Сасово (Ряз.)	2018-10-05	Ready	35221.00	1	2	114	211
Люберцы (Моск.)	Касимов (Ряз.)	2018-10-08	Ready	49778.00	14	59	106	212
Электросталь (Моск.)	Шацк (Ряз.)	2018-10-11	Ready	26548.00	9	38	102	213
Дмитров (Моск.)	Щёлково (Моск.)	2018-10-14	Ready	35595.00	188	56	117	214
Сергиев Посад (Моск.)	Черусти (Моск.)	2018-10-17	Ready	53687.00	142	9	125	215
Чехов (Моск.)	Талдом (Моск.)	2018-10-20	Ready	56087.00	45	12	108	216
Наро-Фоминск (Моск.)	Высоковск (Моск.)	2018-10-23	Ready	64134.00	153	21	116	217
Обнинск (Калуж.)	Кубинка (Моск.)	2018-10-26	Ready	54195.00	86	91	117	218
Жуковский (Моск.)	Голицыно (Моск.)	2018-10-29	Ready	71253.00	22	11	108	219
Дубна (Моск.)	Можайск (Моск.)	2018-11-01	Ready	46244.00	52	40	105	220
Раменское (Моск.)	Верея (Моск.)	2018-11-04	Ready	50278.00	177	64	126	221
Видное (Моск.)	Боровск (Калуж.)	2018-11-07	Ready	71268.00	128	95	124	222
Домодедово (Моск.)	Малоярославец (Калуж.)	2018-11-10	Ready	39910.00	11	89	116	223
Солнечногорск (Моск.)	Жуков (Калуж.)	2018-11-13	Ready	84655.00	45	98	111	224
Истра (Моск.)	Белоусово (Калуж.)	2018-11-16	Ready	36010.00	175	53	120	225
Зарайск (Моск.)	Кременки (Калуж.)	2018-11-19	Ready	83457.00	105	1	138	226
Воскресенск (Моск.)	Сосенский (Калуж.)	2018-11-22	Ready	64943.00	47	68	119	227
Павловский Посад (Моск.)	Суворов (Тул.)	2018-11-25	Ready	31770.00	185	48	118	228
Красногорск (Моск.)	Ясногорск (Тул.)	2018-11-28	Ready	57303.00	58	31	105	229
Одинцово (Моск.)	Плавск (Тул.)	2018-12-01	Ready	19436.00	12	9	114	230
Балашиха (Моск.)	Венёв (Тул.)	2018-12-04	Ready	33258.00	42	11	129	231
Химки (Моск.)	Белёв (Тул.)	2018-12-07	Ready	63730.00	139	50	121	232
Реутов (Моск.)	Болохово (Тул.)	2018-12-10	Ready	28197.00	146	63	120	233
Ногинск (Моск.)	Киреевск (Тул.)	2018-12-13	Ready	12427.00	8	67	121	234
Фрязино (Моск.)	Липки (Тул.)	2018-12-16	Ready	67985.00	122	58	102	235
Лобня (Моск.)	Советск (Тул.)	2018-12-19	Ready	67823.00	200	49	110	236
Дзержинский (Моск.)	Узловая (Тул.)	2018-12-22	Ready	44725.00	114	95	117	237
Протвино (Моск.)	Первомайский (Тул.)	2018-12-25	Ready	52352.00	178	58	130	238
Пущино (Моск.)	Товарковский (Тул.)	2018-12-28	Ready	56825.00	93	79	139	239
Таруса (Калуж.)	Куркино (Тул.)	2018-12-31	Ready	65877.00	173	82	135	240
Бехово (Тул.)	Волово (Тул.)	2019-01-03	Ready	56560.00	187	77	120	241
Алексин (Тул.)	Чекалин (Тул.)	2019-01-06	Ready	52092.00	70	5	133	242
Тула (Тул.)	Арсеньево (Тул.)	2019-01-09	Ready	15486.00	139	5	102	243
Кашира (Моск.)	Одоев (Тул.)	2019-01-12	Ready	80715.00	123	12	102	244
Ступино (Моск.)	Кимры (Твер.)	2019-01-15	Ready	59778.00	160	37	131	245
Озёры (Моск.)	Балабаново (Калуж.)	2019-01-18	Ready	35068.00	121	45	111	246
Звенигород (Моск.)	Ермолино (Калуж.)	2019-01-21	Ready	67080.00	120	15	125	247
Клин (Моск.)	Кондрово (Калуж.)	2019-01-24	Ready	79357.00	92	53	108	248
Дедовск (Моск.)	Полотняный Завод (Калуж.)	2019-01-27	Ready	42820.00	115	43	139	249
Ивантеевка (Моск.)	Медынь (Калуж.)	2019-01-30	Ready	64582.00	97	68	117	250
Куровское (Моск.)	Мещовск (Калуж.)	2019-02-02	Ready	30042.00	118	3	120	251
Ликино-Дулёво (Моск.)	Мосальск (Калуж.)	2019-02-05	Ready	70863.00	92	52	107	252
Рошаль (Моск.)	Юхнов (Калуж.)	2019-02-08	Ready	34812.00	148	10	126	253
Шатура (Моск.)	Спас-Деменск (Калуж.)	2019-02-11	Ready	65971.00	46	95	106	254
Электрогорск (Моск.)	Киров (Калуж.)	2019-02-14	Ready	78334.00	19	90	113	255
Луховицы (Моск.)	Людиново (Калуж.)	2019-02-17	Ready	61897.00	72	88	106	256
Егорьевск (Моск.)	Жиздра (Калуж.)	2019-02-20	Ready	14779.00	37	32	129	257
Серебряные Пруды (Моск.)	Козельск (Калуж.)	2019-02-23	Ready	74631.00	36	60	138	258
Скопин (Ряз.)	Сухиничи (Калуж.)	2019-02-26	Ready	39930.00	176	95	129	259
Михайлов (Ряз.)	Барятино (Калуж.)	2019-03-01	Ready	37698.00	34	1	103	260
Кораблино (Ряз.)	Болхов (Орл.)	2019-03-04	Ready	68384.00	11	33	113	261
Ряжск (Ряз.)	Мценск (Орл.)	2019-03-07	Ready	74973.00	195	11	130	262
Сасово (Ряз.)	Новосиль (Орл.)	2019-03-10	Ready	55642.00	13	21	136	263
Касимов (Ряз.)	Верховье (Орл.)	2019-03-13	Ready	63588.00	141	53	111	264
Шацк (Ряз.)	Ливны (Орл.)	2019-03-16	Ready	46140.00	52	23	128	265
Щёлково (Моск.)	Глазуновка (Орл.)	2019-03-19	Ready	43144.00	192	79	103	266
Черусти (Моск.)	Долгое (Орл.)	2019-03-22	Ready	56194.00	182	2	132	267
Талдом (Моск.)	Кромы (Орл.)	2019-03-25	Ready	82403.00	158	93	120	268
Высоковск (Моск.)	Орёл (Орл.)	2019-03-28	Ready	78416.00	54	75	106	269
Кубинка (Моск.)	Елец (Лип.)	2019-03-31	Ready	80241.00	198	45	136	270
Голицыно (Моск.)	Задонск (Лип.)	2019-04-03	Ready	69928.00	22	100	101	271
Можайск (Моск.)	Лебедянь (Лип.)	2019-04-06	Ready	75852.00	81	74	124	272
Верея (Моск.)	Данков (Лип.)	2019-04-09	Ready	51534.00	137	3	136	273
Боровск (Калуж.)	Чаплыгин (Лип.)	2019-04-12	Ready	32719.00	105	97	116	274
Малоярославец (Калуж.)	Усмань (Лип.)	2019-04-15	Ready	60635.00	69	76	134	275
Жуков (Калуж.)	Липецк (Лип.)	2019-04-18	Ready	45180.00	126	56	138	276
Белоусово (Калуж.)	Грязи (Лип.)	2019-04-21	Ready	78172.00	140	43	113	277
Кременки (Калуж.)	Мичуринск (Тамб.)	2019-04-24	Ready	37462.00	200	28	107	278
Сосенский (Калуж.)	Котовск (Тамб.)	2019-04-27	Ready	32340.00	136	44	131	279
Суворов (Тул.)	Рассказово (Тамб.)	2019-04-30	Ready	71931.00	135	43	118	280
Ясногорск (Тул.)	Моршанск (Тамб.)	2019-05-03	Ready	68379.00	96	31	110	281
Плавск (Тул.)	Кирсанов (Тамб.)	2019-05-06	Ready	47051.00	175	23	133	282
Венёв (Тул.)	Уварово (Тамб.)	2019-05-09	Ready	84452.00	6	64	133	283
Белёв (Тул.)	Жердевка (Тамб.)	2019-05-12	Ready	12874.00	125	7	135	284
Болохово (Тул.)	Тамбов (Тамб.)	2019-05-15	Ready	16475.00	194	19	132	285
Киреевск (Тул.)	Новомичуринск (Ряз.)	2019-05-18	Ready	25124.00	1	77	137	286
Липки (Тул.)	Спасск-Рязанский (Ряз.)	2019-05-21	Ready	63687.00	53	92	120	287
Советск (Тул.)	Шилово (Ряз.)	2019-05-24	Ready	40357.00	169	32	126	288
Щёкино (Тул.)	Кадом (Ряз.)	2019-05-27	Ready	68191.00	34	60	133	289
Новомосковск (Тул.)	Тума (Ряз.)	2019-05-30	Ready	30288.00	66	83	128	290
Донской (Тул.)	Спас-Клепики (Ряз.)	2019-06-02	Ready	48899.00	83	72	112	291
Ефремов (Тул.)	Рыбное (Ряз.)	2019-06-05	Ready	44503.00	132	75	125	292
Богородицк (Тул.)	Солотча (Ряз.)	2019-06-08	Ready	29544.00	94	41	110	293
Кимовск (Тул.)	Константиново (Ряз.)	2019-06-11	Ready	71755.00	25	84	120	294
Узловая (Тул.)	Кимовск (Тул.)	2019-06-14	Ready	79183.00	174	59	112	295
Первомайский (Тул.)	Серпухов (Моск.)	2019-06-17	Ready	57645.00	141	91	127	296
Товарковский (Тул.)	Богородицк (Тул.)	2019-06-20	Ready	50854.00	201	100	117	297
Куркино (Тул.)	Алексин (Тул.)	2019-06-23	Ready	72844.00	35	27	134	298
Волово (Тул.)	Новомосковск (Тул.)	2019-06-26	Ready	27252.00	113	90	140	299
Чекалин (Тул.)	Ефремов (Тул.)	2019-06-29	Ready	69998.00	125	79	127	300
Арсеньево (Тул.)	Тула (Тул.)	2019-07-02	Ready	14438.00	122	98	135	301
Одоев (Тул.)	Подольск (Моск.)	2019-07-05	Ready	19777.00	102	90	110	302
Дубна (Моск.)	Клин (Моск.)	2019-07-08	Ready	12825.00	153	95	101	303
Кимры (Твер.)	Мытищи (Моск.)	2019-07-11	Ready	59105.00	28	33	129	304
Талдом (Моск.)	Королёв (Моск.)	2019-07-14	Ready	83219.00	17	32	117	305
Дмитров (Моск.)	Люберцы (Моск.)	2019-07-17	Ready	32336.00	165	58	124	306
Сергиев Посад (Моск.)	Электросталь (Моск.)	2019-07-20	Ready	13121.00	59	82	136	307
Калуга (Калуж.)	Дмитров (Моск.)	2019-07-23	Ready	59588.00	123	62	102	308
Обнинск (Калуж.)	Сергиев Посад (Моск.)	2019-07-26	Ready	79295.00	161	88	136	309
Малоярославец (Калуж.)	Чехов (Моск.)	2019-07-29	Ready	76291.00	16	28	106	310
Балабаново (Калуж.)	Наро-Фоминск (Моск.)	2019-08-01	Ready	25130.00	102	45	138	311
Ермолино (Калуж.)	Жуковский (Моск.)	2019-08-04	Ready	18446.00	82	43	132	312
Кондрово (Калуж.)	Дубна (Моск.)	2019-08-07	Ready	57210.00	82	72	114	313
Полотняный Завод (Калуж.)	Раменское (Моск.)	2019-08-10	Ready	48249.00	32	82	132	314
Медынь (Калуж.)	Видное (Моск.)	2019-08-13	Ready	14582.00	55	89	106	315
Мещовск (Калуж.)	Домодедово (Моск.)	2019-08-16	Ready	58417.00	82	79	117	316
Мосальск (Калуж.)	Солнечногорск (Моск.)	2019-08-19	Ready	72362.00	94	59	126	317
Юхнов (Калуж.)	Истра (Моск.)	2019-08-22	Ready	77727.00	129	14	139	318
Спас-Деменск (Калуж.)	Зарайск (Моск.)	2019-08-25	Ready	71680.00	144	66	131	319
Киров (Калуж.)	Воскресенск (Моск.)	2019-08-28	Ready	17294.00	125	83	132	320
Людиново (Калуж.)	Павловский Посад (Моск.)	2019-08-31	Ready	68420.00	118	31	129	321
Жиздра (Калуж.)	Красногорск (Моск.)	2019-09-03	Ready	59187.00	136	43	127	322
Козельск (Калуж.)	Одинцово (Моск.)	2019-09-06	Ready	74644.00	158	32	121	323
Сухиничи (Калуж.)	Балашиха (Моск.)	2019-09-09	Ready	76534.00	89	89	118	324
Барятино (Калуж.)	Химки (Моск.)	2019-09-12	Ready	17312.00	92	33	117	325
Суворов (Тул.)	Реутов (Моск.)	2019-09-15	Ready	44910.00	137	36	109	326
Чекалин (Тул.)	Ногинск (Моск.)	2019-09-18	Ready	81467.00	57	80	102	327
Белёв (Тул.)	Фрязино (Моск.)	2019-09-21	Ready	19330.00	133	2	106	328
Болхов (Орл.)	Лобня (Моск.)	2019-09-24	Ready	14751.00	98	76	123	329
Мценск (Орл.)	Дзержинский (Моск.)	2019-09-27	Ready	77152.00	67	15	111	330
Новосиль (Орл.)	Протвино (Моск.)	2019-09-30	Ready	69050.00	177	32	124	331
Верховье (Орл.)	Пущино (Моск.)	2019-10-03	Ready	41179.00	45	75	136	332
Ливны (Орл.)	Таруса (Калуж.)	2019-10-06	Ready	30634.00	66	33	139	333
Глазуновка (Орл.)	Ступино (Моск.)	2019-10-09	Ready	81420.00	131	39	138	334
Долгое (Орл.)	Озёры (Моск.)	2019-10-12	Ready	56994.00	166	13	117	335
Кромы (Орл.)	Звенигород (Моск.)	2019-10-15	Ready	16367.00	108	65	124	336
Орёл (Орл.)	Дедовск (Моск.)	2019-10-18	Ready	56471.00	162	21	111	337
Болхов (Орл.)	Ивантеевка (Моск.)	2019-10-21	Ready	34598.00	106	24	116	338
Мценск (Орл.)	Куровское (Моск.)	2019-10-24	Ready	83343.00	138	71	102	339
Ливны (Орл.)	Ликино-Дулёво (Моск.)	2019-10-27	Ready	74174.00	190	68	120	340
Елец (Лип.)	Рошаль (Моск.)	2019-10-30	Ready	47127.00	172	40	132	341
Задонск (Лип.)	Шатура (Моск.)	2019-11-02	Ready	66605.00	46	18	108	342
Лебедянь (Лип.)	Электрогорск (Моск.)	2019-11-05	Ready	72527.00	193	68	110	343
Данков (Лип.)	Луховицы (Моск.)	2019-11-08	Ready	47610.00	158	34	133	344
Чаплыгин (Лип.)	Егорьевск (Моск.)	2019-11-11	Ready	75671.00	87	63	135	345
Раненбург (Лип.)	Серебряные Пруды (Моск.)	2019-11-14	Ready	68767.00	25	8	137	346
Мичуринск (Тамб.)	Скопин (Ряз.)	2019-11-17	Ready	31409.00	53	94	122	347
Котовск (Тамб.)	Михайлов (Ряз.)	2019-11-20	Ready	59063.00	128	74	112	348
Рассказово (Тамб.)	Кораблино (Ряз.)	2019-11-23	Ready	28397.00	187	29	115	349
Моршанск (Тамб.)	Ряжск (Ряз.)	2019-11-26	Ready	48887.00	46	13	114	350
Кирсанов (Тамб.)	Сасово (Ряз.)	2019-11-29	Ready	34678.00	58	66	108	351
Уварово (Тамб.)	Касимов (Ряз.)	2019-12-02	Ready	40873.00	63	72	124	352
Жердевка (Тамб.)	Шацк (Ряз.)	2019-12-05	Ready	31243.00	52	29	117	353
Тамбов (Тамб.)	Щёлково (Моск.)	2019-12-08	Ready	18671.00	25	36	140	354
Котовск (Тамб.)	Черусти (Моск.)	2019-12-11	Ready	58462.00	2	93	119	355
Рассказово (Тамб.)	Талдом (Моск.)	2019-12-14	Ready	28215.00	34	39	118	356
Моршанск (Тамб.)	Высоковск (Моск.)	2019-12-17	Ready	31572.00	32	21	134	357
Кирсанов (Тамб.)	Кубинка (Моск.)	2019-12-20	Ready	29739.00	201	87	117	358
Уварово (Тамб.)	Голицыно (Моск.)	2019-12-23	Ready	43433.00	59	43	126	359
Жердевка (Тамб.)	Можайск (Моск.)	2019-12-26	Ready	46676.00	130	70	114	360
Тамбов (Тамб.)	Верея (Моск.)	2019-12-29	Ready	82829.00	38	74	108	361
Мичуринск (Тамб.)	Боровск (Калуж.)	2020-01-01	Ready	14557.00	88	91	120	362
Липецк (Лип.)	Малоярославец (Калуж.)	2020-01-04	Ready	83287.00	28	80	128	363
Елец (Лип.)	Жуков (Калуж.)	2020-01-07	Ready	83446.00	167	62	115	364
Грязи (Лип.)	Белоусово (Калуж.)	2020-01-10	Ready	20818.00	87	29	135	365
Лебедянь (Лип.)	Кременки (Калуж.)	2020-01-13	Ready	41841.00	152	3	129	366
Данков (Лип.)	Сосенский (Калуж.)	2020-01-16	Ready	63256.00	189	100	119	367
Усмань (Лип.)	Суворов (Тул.)	2020-01-19	Ready	49593.00	9	96	124	368
Чаплыгин (Лип.)	Ясногорск (Тул.)	2020-01-22	Ready	18942.00	176	51	104	369
Рязань (Ряз.)	Плавск (Тул.)	2020-01-25	Ready	28393.00	90	7	118	370
Касимов (Ряз.)	Венёв (Тул.)	2020-01-28	Ready	57686.00	79	50	118	371
Скопин (Ряз.)	Белёв (Тул.)	2020-01-31	Ready	50034.00	12	14	105	372
Сасово (Ряз.)	Болохово (Тул.)	2020-02-03	Ready	79101.00	162	43	114	373
Шацк (Ряз.)	Киреевск (Тул.)	2020-02-06	Ready	69265.00	115	88	116	374
Ряжск (Ряз.)	Липки (Тул.)	2020-02-09	Ready	80518.00	27	84	138	375
Кораблино (Ряз.)	Советск (Тул.)	2020-02-12	Ready	38291.00	75	57	102	376
Михайлов (Ряз.)	Узловая (Тул.)	2020-02-15	Ready	33846.00	12	28	121	377
Новомичуринск (Ряз.)	Первомайский (Тул.)	2020-02-18	Ready	31295.00	22	80	119	378
Спасск-Рязанский (Ряз.)	Товарковский (Тул.)	2020-02-21	Ready	48667.00	65	1	134	379
Шилово (Ряз.)	Куркино (Тул.)	2020-02-24	Ready	82175.00	112	83	101	380
Кадом (Ряз.)	Волово (Тул.)	2020-02-27	Ready	30114.00	46	74	131	381
Тума (Ряз.)	Чекалин (Тул.)	2020-03-01	Ready	15408.00	28	61	130	382
Спас-Клепики (Ряз.)	Арсеньево (Тул.)	2020-03-04	Ready	59373.00	122	15	113	383
Рыбное (Ряз.)	Одоев (Тул.)	2020-03-07	Ready	51598.00	194	52	117	384
Солотча (Ряз.)	Кимры (Твер.)	2020-03-10	Ready	48599.00	73	88	124	385
Константиново (Ряз.)	Балабаново (Калуж.)	2020-03-13	Ready	21479.00	23	65	101	386
Тула (Тул.)	Ермолино (Калуж.)	2020-03-16	Ready	19059.00	99	90	136	387
Москва (Моск.)	Кондрово (Калуж.)	2020-03-19	Ready	81658.00	33	25	121	388
Серпухов (Моск.)	Полотняный Завод (Калуж.)	2020-03-22	Ready	41550.00	113	8	108	389
Калуга (Калуж.)	Медынь (Калуж.)	2020-03-25	Ready	36699.00	66	49	124	390
Рязань (Ряз.)	Мещовск (Калуж.)	2020-03-28	Ready	33199.00	185	95	131	391
Алексин (Тул.)	Мосальск (Калуж.)	2020-03-31	Ready	80196.00	172	60	131	392
Щёкино (Тул.)	Юхнов (Калуж.)	2020-04-03	Ready	62634.00	62	10	137	393
Новомосковск (Тул.)	Спас-Деменск (Калуж.)	2020-04-06	Ready	17519.00	12	87	129	394
Донской (Тул.)	Киров (Калуж.)	2020-04-09	Ready	71508.00	193	29	135	395
Ефремов (Тул.)	Людиново (Калуж.)	2020-04-12	Ready	42518.00	113	52	101	396
Богородицк (Тул.)	Жиздра (Калуж.)	2020-04-15	Ready	80239.00	63	72	135	397
Кимовск (Тул.)	Козельск (Калуж.)	2020-04-18	Ready	22523.00	168	19	137	398
Клин (Моск.)	Сухиничи (Калуж.)	2020-04-21	Ready	25288.00	63	30	110	399
Подольск (Моск.)	Барятино (Калуж.)	2020-04-24	Ready	81181.00	180	37	112	400
Коломна (Моск.)	Болхов (Орл.)	2020-04-27	Ready	37883.00	119	34	109	401
Орехово-Зуево (Моск.)	Мценск (Орл.)	2020-04-30	Ready	78420.00	172	93	130	402
Мытищи (Моск.)	Новосиль (Орл.)	2020-05-03	Ready	46593.00	76	62	105	403
Королёв (Моск.)	Верховье (Орл.)	2020-05-06	Ready	40869.00	152	72	122	404
Люберцы (Моск.)	Ливны (Орл.)	2020-05-09	Ready	66665.00	198	100	102	405
Электросталь (Моск.)	Глазуновка (Орл.)	2020-05-12	Ready	18639.00	188	52	118	406
Дмитров (Моск.)	Долгое (Орл.)	2020-05-15	Ready	75091.00	22	12	136	407
Сергиев Посад (Моск.)	Кромы (Орл.)	2020-05-18	Ready	38128.00	120	61	101	408
Чехов (Моск.)	Орёл (Орл.)	2020-05-21	Ready	29486.00	116	57	108	409
Наро-Фоминск (Моск.)	Елец (Лип.)	2020-05-24	Ready	19306.00	4	46	111	410
Обнинск (Калуж.)	Задонск (Лип.)	2020-05-27	Ready	43593.00	14	10	113	411
Жуковский (Моск.)	Лебедянь (Лип.)	2020-05-30	Ready	45751.00	36	64	103	412
Дубна (Моск.)	Данков (Лип.)	2020-06-02	Ready	30592.00	120	56	131	413
Раменское (Моск.)	Чаплыгин (Лип.)	2020-06-05	Ready	14427.00	63	92	125	414
Видное (Моск.)	Усмань (Лип.)	2020-06-08	Ready	66100.00	94	86	114	415
Домодедово (Моск.)	Липецк (Лип.)	2020-06-11	Ready	22675.00	71	81	125	416
Солнечногорск (Моск.)	Грязи (Лип.)	2020-06-14	Ready	16517.00	46	40	117	417
Истра (Моск.)	Мичуринск (Тамб.)	2020-06-17	Ready	23915.00	20	49	101	418
Зарайск (Моск.)	Котовск (Тамб.)	2020-06-20	Ready	62932.00	26	73	135	419
Воскресенск (Моск.)	Рассказово (Тамб.)	2020-06-23	Ready	23511.00	81	64	110	420
Павловский Посад (Моск.)	Моршанск (Тамб.)	2020-06-26	Ready	53097.00	111	33	123	421
Красногорск (Моск.)	Кирсанов (Тамб.)	2020-06-29	Ready	53397.00	49	86	137	422
Одинцово (Моск.)	Уварово (Тамб.)	2020-07-02	Ready	51408.00	179	17	103	423
Балашиха (Моск.)	Жердевка (Тамб.)	2020-07-05	Ready	24038.00	18	78	117	424
Химки (Моск.)	Тамбов (Тамб.)	2020-07-08	Ready	76703.00	27	70	107	425
Реутов (Моск.)	Новомичуринск (Ряз.)	2020-07-11	Ready	78558.00	140	12	125	426
Ногинск (Моск.)	Спасск-Рязанский (Ряз.)	2020-07-14	Ready	41998.00	108	61	110	427
Фрязино (Моск.)	Шилово (Ряз.)	2020-07-17	Ready	71737.00	128	61	137	428
Лобня (Моск.)	Кадом (Ряз.)	2020-07-20	Ready	33965.00	77	25	138	429
Дзержинский (Моск.)	Тума (Ряз.)	2020-07-23	Ready	14098.00	185	33	105	430
Протвино (Моск.)	Спас-Клепики (Ряз.)	2020-07-26	Ready	23068.00	107	74	104	431
Пущино (Моск.)	Рыбное (Ряз.)	2020-07-29	Ready	17559.00	23	65	123	432
Таруса (Калуж.)	Солотча (Ряз.)	2020-08-01	Ready	49674.00	68	35	121	433
Бехово (Тул.)	Константиново (Ряз.)	2020-08-04	Ready	36246.00	67	89	110	434
Алексин (Тул.)	Калуга (Калуж.)	2020-08-07	Ready	80375.00	74	27	132	435
Тула (Тул.)	Донской (Тул.)	2020-08-10	Ready	39131.00	157	49	107	436
Кашира (Моск.)	Рязань (Ряз.)	2020-08-13	Ready	67318.00	56	6	137	437
Ступино (Моск.)	Щёкино (Тул.)	2020-08-16	Ready	32322.00	49	2	105	438
Озёры (Моск.)	Калуга (Калуж.)	2020-08-19	Ready	29529.00	79	25	102	439
Звенигород (Моск.)	Донской (Тул.)	2020-08-22	Ready	60943.00	105	12	101	440
Клин (Моск.)	Рязань (Ряз.)	2020-08-25	Ready	61853.00	82	79	124	441
Дедовск (Моск.)	Клин (Моск.)	2020-08-28	Ready	45152.00	93	9	117	442
Ивантеевка (Моск.)	Подольск (Моск.)	2020-08-31	Ready	77394.00	74	16	122	443
Куровское (Моск.)	Коломна (Моск.)	2020-09-03	Ready	42726.00	56	71	101	444
Ликино-Дулёво (Моск.)	Орехово-Зуево (Моск.)	2020-09-06	Ready	44859.00	49	39	120	445
Рошаль (Моск.)	Мытищи (Моск.)	2020-09-09	Ready	23667.00	174	46	122	446
Шатура (Моск.)	Королёв (Моск.)	2020-09-12	Ready	43470.00	143	71	115	447
Электрогорск (Моск.)	Люберцы (Моск.)	2020-09-15	Ready	27285.00	85	98	103	448
Луховицы (Моск.)	Электросталь (Моск.)	2020-09-18	Ready	70891.00	61	77	115	449
Егорьевск (Моск.)	Дмитров (Моск.)	2020-09-21	Ready	26454.00	81	27	105	450
Серебряные Пруды (Моск.)	Сергиев Посад (Моск.)	2020-09-24	Ready	39213.00	185	42	112	451
Скопин (Ряз.)	Чехов (Моск.)	2020-09-27	Ready	83816.00	178	22	128	452
Михайлов (Ряз.)	Наро-Фоминск (Моск.)	2020-09-30	Ready	70883.00	98	80	131	453
Кораблино (Ряз.)	Обнинск (Калуж.)	2020-10-03	Ready	21283.00	6	33	124	454
Ряжск (Ряз.)	Жуковский (Моск.)	2020-10-06	Ready	43737.00	137	14	106	455
Сасово (Ряз.)	Дубна (Моск.)	2020-10-09	Ready	63383.00	91	16	105	456
Касимов (Ряз.)	Раменское (Моск.)	2020-10-12	Ready	19429.00	31	17	130	457
Шацк (Ряз.)	Видное (Моск.)	2020-10-15	Ready	14862.00	145	33	137	458
Щёлково (Моск.)	Домодедово (Моск.)	2020-10-18	Ready	77895.00	102	29	102	459
Черусти (Моск.)	Солнечногорск (Моск.)	2020-10-21	Ready	81715.00	173	58	140	460
Талдом (Моск.)	Истра (Моск.)	2020-10-24	Ready	38292.00	18	68	124	461
Высоковск (Моск.)	Зарайск (Моск.)	2020-10-27	Ready	32134.00	14	56	106	462
Кубинка (Моск.)	Воскресенск (Моск.)	2020-10-30	Ready	48850.00	101	73	118	463
Голицыно (Моск.)	Павловский Посад (Моск.)	2020-11-02	Ready	72040.00	89	82	110	464
Можайск (Моск.)	Красногорск (Моск.)	2020-11-05	Ready	77843.00	127	95	115	465
Верея (Моск.)	Одинцово (Моск.)	2020-11-08	Ready	72431.00	25	67	123	466
Боровск (Калуж.)	Балашиха (Моск.)	2020-11-11	Ready	51327.00	28	38	105	467
Малоярославец (Калуж.)	Химки (Моск.)	2020-11-14	Ready	44629.00	96	87	140	468
Жуков (Калуж.)	Реутов (Моск.)	2020-11-17	Ready	23308.00	182	15	127	469
Белоусово (Калуж.)	Ногинск (Моск.)	2020-11-20	Ready	74731.00	173	49	128	470
Кременки (Калуж.)	Фрязино (Моск.)	2020-11-23	Ready	29215.00	112	65	122	471
Сосенский (Калуж.)	Лобня (Моск.)	2020-11-26	Ready	48526.00	197	46	131	472
Суворов (Тул.)	Дзержинский (Моск.)	2020-11-29	Ready	25010.00	35	71	102	473
Ясногорск (Тул.)	Протвино (Моск.)	2020-12-02	Ready	75695.00	97	7	136	474
Плавск (Тул.)	Пущино (Моск.)	2020-12-05	Ready	79694.00	27	88	107	475
Венёв (Тул.)	Таруса (Калуж.)	2020-12-08	Ready	65794.00	117	45	116	476
Белёв (Тул.)	Бехово (Тул.)	2020-12-11	Ready	70814.00	45	53	135	477
Болохово (Тул.)	Алексин (Тул.)	2020-12-14	Ready	39427.00	176	69	139	478
Киреевск (Тул.)	Тула (Тул.)	2020-12-17	Ready	61336.00	16	60	108	479
Липки (Тул.)	Кашира (Моск.)	2020-12-20	Ready	56003.00	20	61	102	480
Советск (Тул.)	Ступино (Моск.)	2020-12-23	Ready	52729.00	153	53	132	481
Щёкино (Тул.)	Озёры (Моск.)	2020-12-26	Ready	72658.00	70	50	131	482
Новомосковск (Тул.)	Звенигород (Моск.)	2020-12-29	Ready	43893.00	55	15	116	483
Донской (Тул.)	Клин (Моск.)	2021-01-01	Ready	81297.00	140	33	140	484
Ефремов (Тул.)	Дедовск (Моск.)	2021-01-04	Ready	71290.00	125	5	131	485
Богородицк (Тул.)	Ивантеевка (Моск.)	2021-01-07	Ready	23586.00	22	67	115	486
Кимовск (Тул.)	Куровское (Моск.)	2021-01-10	Ready	69768.00	194	2	122	487
Узловая (Тул.)	Ликино-Дулёво (Моск.)	2021-01-13	Ready	34029.00	86	50	106	488
Первомайский (Тул.)	Рошаль (Моск.)	2021-01-16	Ready	84174.00	192	14	114	489
Товарковский (Тул.)	Шатура (Моск.)	2021-01-19	Ready	48449.00	114	32	128	490
Куркино (Тул.)	Электрогорск (Моск.)	2021-01-22	Ready	42433.00	22	43	119	491
Волово (Тул.)	Луховицы (Моск.)	2021-01-25	Ready	37298.00	34	84	135	492
Чекалин (Тул.)	Егорьевск (Моск.)	2021-01-28	Ready	82008.00	100	99	115	493
Арсеньево (Тул.)	Серебряные Пруды (Моск.)	2021-01-31	Ready	45615.00	85	5	123	494
Одоев (Тул.)	Скопин (Ряз.)	2021-02-03	Ready	23445.00	68	39	127	495
Дубна (Моск.)	Михайлов (Ряз.)	2021-02-06	Ready	33147.00	99	20	107	496
Кимры (Твер.)	Кораблино (Ряз.)	2021-02-09	Ready	59136.00	128	16	113	497
Талдом (Моск.)	Ряжск (Ряз.)	2021-02-12	Ready	53143.00	173	83	103	498
Дмитров (Моск.)	Сасово (Ряз.)	2021-02-15	Ready	21338.00	4	85	121	499
Сергиев Посад (Моск.)	Касимов (Ряз.)	2021-02-18	Ready	43562.00	22	77	135	500
Калуга (Калуж.)	Шацк (Ряз.)	2021-02-21	Ready	61250.00	69	75	131	501
Обнинск (Калуж.)	Щёлково (Моск.)	2021-02-24	Ready	46758.00	1	20	122	502
Малоярославец (Калуж.)	Черусти (Моск.)	2021-02-27	Ready	13718.00	4	63	108	503
Балабаново (Калуж.)	Талдом (Моск.)	2021-03-02	Ready	17366.00	8	52	109	504
Ермолино (Калуж.)	Высоковск (Моск.)	2021-03-05	Ready	77041.00	180	58	126	505
Кондрово (Калуж.)	Кубинка (Моск.)	2021-03-08	Ready	65901.00	37	47	116	506
Полотняный Завод (Калуж.)	Голицыно (Моск.)	2021-03-11	Ready	27563.00	202	64	121	507
Медынь (Калуж.)	Можайск (Моск.)	2021-03-14	Ready	13788.00	110	55	135	508
Мещовск (Калуж.)	Верея (Моск.)	2021-03-17	Ready	80719.00	142	55	103	509
Мосальск (Калуж.)	Боровск (Калуж.)	2021-03-20	Ready	64972.00	14	40	124	510
Юхнов (Калуж.)	Малоярославец (Калуж.)	2021-03-23	Ready	42139.00	106	87	117	511
Спас-Деменск (Калуж.)	Жуков (Калуж.)	2021-03-26	Ready	70460.00	135	7	136	512
Киров (Калуж.)	Белоусово (Калуж.)	2021-03-29	Ready	36787.00	77	74	109	513
Людиново (Калуж.)	Кременки (Калуж.)	2021-04-01	Ready	21953.00	137	82	125	514
Жиздра (Калуж.)	Сосенский (Калуж.)	2021-04-04	Ready	19140.00	75	11	139	515
Козельск (Калуж.)	Суворов (Тул.)	2021-04-07	Ready	45323.00	9	81	119	516
Сухиничи (Калуж.)	Ясногорск (Тул.)	2021-04-10	Ready	43886.00	178	27	127	517
Барятино (Калуж.)	Плавск (Тул.)	2021-04-13	Ready	58777.00	107	43	121	518
Суворов (Тул.)	Венёв (Тул.)	2021-04-16	Ready	60709.00	128	97	114	519
Чекалин (Тул.)	Белёв (Тул.)	2021-04-19	Ready	24398.00	158	49	109	520
Белёв (Тул.)	Болохово (Тул.)	2021-04-22	Ready	22834.00	199	32	124	521
Болхов (Орл.)	Киреевск (Тул.)	2021-04-25	Ready	38703.00	52	12	116	522
Мценск (Орл.)	Липки (Тул.)	2021-04-28	Ready	69152.00	69	47	119	523
Новосиль (Орл.)	Советск (Тул.)	2021-05-01	Ready	50838.00	10	59	115	524
Верховье (Орл.)	Щёкино (Тул.)	2021-05-04	Ready	46224.00	171	41	109	525
Ливны (Орл.)	Новомосковск (Тул.)	2021-05-07	Ready	26000.00	115	7	110	526
Глазуновка (Орл.)	Донской (Тул.)	2021-05-10	Ready	80296.00	51	54	127	527
Долгое (Орл.)	Ефремов (Тул.)	2021-05-13	Ready	27442.00	169	20	116	528
Кромы (Орл.)	Богородицк (Тул.)	2021-05-16	Ready	38367.00	138	88	104	529
Орёл (Орл.)	Кимовск (Тул.)	2021-05-19	Ready	22832.00	173	58	105	530
Болхов (Орл.)	Узловая (Тул.)	2021-05-22	Ready	29505.00	78	28	124	531
Мценск (Орл.)	Первомайский (Тул.)	2021-05-25	Ready	12854.00	169	2	112	532
Ливны (Орл.)	Товарковский (Тул.)	2021-05-28	Ready	84078.00	128	8	107	533
Елец (Лип.)	Куркино (Тул.)	2021-05-31	Ready	78059.00	95	23	111	534
Задонск (Лип.)	Волово (Тул.)	2021-06-03	Ready	79574.00	105	24	113	535
Лебедянь (Лип.)	Чекалин (Тул.)	2021-06-06	Ready	81441.00	70	26	103	536
Данков (Лип.)	Арсеньево (Тул.)	2021-06-09	Ready	13152.00	165	71	116	537
Чаплыгин (Лип.)	Одоев (Тул.)	2021-06-12	Ready	31145.00	188	42	133	538
Раненбург (Лип.)	Дубна (Моск.)	2021-06-15	Ready	66827.00	111	25	130	539
Мичуринск (Тамб.)	Кимры (Твер.)	2021-06-18	Ready	73060.00	159	52	132	540
Котовск (Тамб.)	Талдом (Моск.)	2021-06-21	Ready	79022.00	42	45	118	541
Рассказово (Тамб.)	Дмитров (Моск.)	2021-06-24	Ready	46669.00	74	55	137	542
Моршанск (Тамб.)	Сергиев Посад (Моск.)	2021-06-27	Ready	66499.00	117	79	102	543
Кирсанов (Тамб.)	Калуга (Калуж.)	2021-06-30	Ready	42519.00	133	84	139	544
Уварово (Тамб.)	Обнинск (Калуж.)	2021-07-03	Ready	15259.00	31	25	139	545
Жердевка (Тамб.)	Малоярославец (Калуж.)	2021-07-06	Ready	65321.00	41	28	103	546
Тамбов (Тамб.)	Балабаново (Калуж.)	2021-07-09	Ready	68846.00	171	16	134	547
Котовск (Тамб.)	Ермолино (Калуж.)	2021-07-12	Ready	61609.00	106	30	131	548
Рассказово (Тамб.)	Кондрово (Калуж.)	2021-07-15	Ready	84545.00	125	75	138	549
Моршанск (Тамб.)	Полотняный Завод (Калуж.)	2021-07-18	Ready	78074.00	138	82	116	550
Кирсанов (Тамб.)	Медынь (Калуж.)	2021-07-21	Ready	35400.00	189	67	139	551
Уварово (Тамб.)	Мещовск (Калуж.)	2021-07-24	Ready	23647.00	176	100	125	552
Жердевка (Тамб.)	Мосальск (Калуж.)	2021-07-27	Ready	82931.00	110	98	130	553
Тамбов (Тамб.)	Юхнов (Калуж.)	2021-07-30	Ready	37231.00	146	97	139	554
Мичуринск (Тамб.)	Спас-Деменск (Калуж.)	2021-08-02	Ready	46181.00	29	65	106	555
Липецк (Лип.)	Кашира (Моск.)	2021-08-05	Ready	13489.00	36	51	114	556
Елец (Лип.)	Ступино (Моск.)	2021-08-08	Ready	58609.00	111	3	102	557
Грязи (Лип.)	Озёры (Моск.)	2021-08-11	Ready	48342.00	43	40	139	558
Лебедянь (Лип.)	Звенигород (Моск.)	2021-08-14	Ready	61369.00	18	41	122	559
Данков (Лип.)	Клин (Моск.)	2021-08-17	Ready	82809.00	137	85	105	560
Усмань (Лип.)	Дедовск (Моск.)	2021-08-20	Ready	75987.00	102	27	138	561
Чаплыгин (Лип.)	Ивантеевка (Моск.)	2021-08-23	Ready	80955.00	106	3	133	562
Рязань (Ряз.)	Куровское (Моск.)	2021-08-26	Ready	35221.00	55	29	130	563
Касимов (Ряз.)	Ликино-Дулёво (Моск.)	2021-08-29	Ready	42244.00	57	82	128	564
Скопин (Ряз.)	Рошаль (Моск.)	2021-09-01	Ready	78260.00	113	98	120	565
Сасово (Ряз.)	Шатура (Моск.)	2021-09-04	Ready	32390.00	29	70	108	566
Шацк (Ряз.)	Электрогорск (Моск.)	2021-09-07	Ready	39068.00	34	92	136	567
Ряжск (Ряз.)	Луховицы (Моск.)	2021-09-10	Ready	67374.00	101	68	118	568
Кораблино (Ряз.)	Егорьевск (Моск.)	2021-09-13	Ready	76724.00	99	36	128	569
Михайлов (Ряз.)	Серебряные Пруды (Моск.)	2021-09-16	Ready	57929.00	126	8	103	570
Новомичуринск (Ряз.)	Скопин (Ряз.)	2021-09-19	Ready	37379.00	96	14	132	571
Спасск-Рязанский (Ряз.)	Михайлов (Ряз.)	2021-09-22	Ready	80527.00	87	65	126	572
Шилово (Ряз.)	Кораблино (Ряз.)	2021-09-25	Ready	41746.00	49	90	128	573
Кадом (Ряз.)	Ряжск (Ряз.)	2021-09-28	Ready	82486.00	104	50	119	574
Тума (Ряз.)	Сасово (Ряз.)	2021-10-01	Ready	64972.00	68	53	108	575
Спас-Клепики (Ряз.)	Касимов (Ряз.)	2021-10-04	Ready	58051.00	81	54	106	576
Рыбное (Ряз.)	Шацк (Ряз.)	2021-10-07	Ready	21929.00	194	72	130	577
Солотча (Ряз.)	Щёлково (Моск.)	2021-10-10	Ready	36413.00	12	17	120	578
Константиново (Ряз.)	Черусти (Моск.)	2021-10-13	Ready	37325.00	115	17	135	579
Тула (Тул.)	Талдом (Моск.)	2021-10-16	Ready	62700.00	61	16	106	580
Москва (Моск.)	Высоковск (Моск.)	2021-10-19	Ready	53448.00	29	53	111	581
Серпухов (Моск.)	Кубинка (Моск.)	2021-10-22	Ready	56844.00	105	48	130	582
Калуга (Калуж.)	Голицыно (Моск.)	2021-10-25	Ready	34518.00	118	94	109	583
Рязань (Ряз.)	Можайск (Моск.)	2021-10-28	Ready	35563.00	59	1	104	584
Алексин (Тул.)	Верея (Моск.)	2021-10-31	Ready	66389.00	97	35	101	585
Щёкино (Тул.)	Боровск (Калуж.)	2021-11-03	Ready	20487.00	137	82	110	586
Новомосковск (Тул.)	Малоярославец (Калуж.)	2021-11-06	Ready	58967.00	116	4	133	587
Донской (Тул.)	Жуков (Калуж.)	2021-11-09	Ready	50790.00	32	48	129	588
Ефремов (Тул.)	Белоусово (Калуж.)	2021-11-12	Ready	16296.00	122	21	129	589
Богородицк (Тул.)	Кременки (Калуж.)	2021-11-15	Ready	17147.00	200	76	137	590
Кимовск (Тул.)	Сосенский (Калуж.)	2021-11-18	Ready	40688.00	52	87	135	591
Клин (Моск.)	Суворов (Тул.)	2021-11-21	Ready	84586.00	141	84	114	592
Подольск (Моск.)	Ясногорск (Тул.)	2021-11-24	Ready	34023.00	162	72	135	593
Коломна (Моск.)	Плавск (Тул.)	2021-11-27	Ready	61625.00	51	50	111	594
Орехово-Зуево (Моск.)	Венёв (Тул.)	2021-11-30	Ready	33701.00	79	59	118	595
Мытищи (Моск.)	Белёв (Тул.)	2021-12-03	Ready	35151.00	17	80	121	596
Королёв (Моск.)	Болохово (Тул.)	2021-12-06	Ready	56995.00	149	26	126	597
Люберцы (Моск.)	Киреевск (Тул.)	2021-12-09	Ready	77368.00	39	58	124	598
Электросталь (Моск.)	Липки (Тул.)	2021-12-12	Ready	61419.00	194	58	107	599
Дмитров (Моск.)	Советск (Тул.)	2021-12-15	Ready	22863.00	12	63	124	600
Сергиев Посад (Моск.)	Щёкино (Тул.)	2021-12-18	Ready	48735.00	17	7	106	601
Чехов (Моск.)	Новомосковск (Тул.)	2021-12-21	Ready	68974.00	170	81	131	602
Наро-Фоминск (Моск.)	Донской (Тул.)	2021-12-24	Ready	27867.00	114	85	114	603
Обнинск (Калуж.)	Ефремов (Тул.)	2021-12-27	Ready	74692.00	106	32	114	604
Жуковский (Моск.)	Богородицк (Тул.)	2021-12-30	Ready	52765.00	20	65	122	605
Дубна (Моск.)	Кимовск (Тул.)	2022-01-02	Ready	73100.00	151	98	136	606
Раменское (Моск.)	Узловая (Тул.)	2022-01-05	Ready	41135.00	28	36	119	607
Видное (Моск.)	Первомайский (Тул.)	2022-01-08	Ready	53847.00	91	9	116	608
Домодедово (Моск.)	Товарковский (Тул.)	2022-01-11	Ready	27521.00	86	54	116	609
Солнечногорск (Моск.)	Куркино (Тул.)	2022-01-14	Ready	72646.00	185	83	115	610
Истра (Моск.)	Волово (Тул.)	2022-01-17	Ready	37454.00	58	21	133	611
Зарайск (Моск.)	Чекалин (Тул.)	2022-01-20	Ready	63505.00	125	15	105	612
Воскресенск (Моск.)	Арсеньево (Тул.)	2022-01-23	Ready	25689.00	37	37	107	613
Павловский Посад (Моск.)	Одоев (Тул.)	2022-01-26	Ready	84758.00	61	7	109	614
Красногорск (Моск.)	Дубна (Моск.)	2022-01-29	Ready	73500.00	199	47	112	615
Одинцово (Моск.)	Кимры (Твер.)	2022-02-01	Ready	45799.00	179	18	108	616
Балашиха (Моск.)	Талдом (Моск.)	2022-02-04	Ready	73720.00	79	58	132	617
Химки (Моск.)	Дмитров (Моск.)	2022-02-07	Ready	47291.00	194	91	112	618
Реутов (Моск.)	Сергиев Посад (Моск.)	2022-02-10	Ready	65129.00	147	11	137	619
Ногинск (Моск.)	Калуга (Калуж.)	2022-02-13	Ready	42631.00	81	69	126	620
Фрязино (Моск.)	Обнинск (Калуж.)	2022-02-16	Ready	37191.00	82	52	122	621
Лобня (Моск.)	Малоярославец (Калуж.)	2022-02-19	Ready	61201.00	44	19	113	622
Дзержинский (Моск.)	Балабаново (Калуж.)	2022-02-22	Ready	42541.00	47	61	123	623
Протвино (Моск.)	Ермолино (Калуж.)	2022-02-25	Ready	62906.00	82	31	131	624
Пущино (Моск.)	Кондрово (Калуж.)	2022-02-28	Ready	25398.00	149	59	121	625
Таруса (Калуж.)	Полотняный Завод (Калуж.)	2022-03-03	Ready	67021.00	164	99	124	626
Бехово (Тул.)	Медынь (Калуж.)	2022-03-06	Ready	40979.00	48	50	106	627
Алексин (Тул.)	Мещовск (Калуж.)	2022-03-09	Ready	13141.00	41	19	128	628
Тула (Тул.)	Мосальск (Калуж.)	2022-03-12	Ready	13471.00	121	74	140	629
Кашира (Моск.)	Юхнов (Калуж.)	2022-03-15	Ready	63408.00	2	69	121	630
Ступино (Моск.)	Спас-Деменск (Калуж.)	2022-03-18	Ready	18111.00	121	80	117	631
Озёры (Моск.)	Киров (Калуж.)	2022-03-21	Ready	15922.00	113	12	101	632
Звенигород (Моск.)	Людиново (Калуж.)	2022-03-24	Ready	63988.00	44	49	128	633
Клин (Моск.)	Жиздра (Калуж.)	2022-03-27	Ready	80123.00	146	96	134	634
Дедовск (Моск.)	Козельск (Калуж.)	2022-03-30	Ready	23795.00	182	72	125	635
Ивантеевка (Моск.)	Сухиничи (Калуж.)	2022-04-02	Ready	50676.00	34	16	133	636
Куровское (Моск.)	Барятино (Калуж.)	2022-04-05	Ready	73666.00	183	62	140	637
Ликино-Дулёво (Моск.)	Суворов (Тул.)	2022-04-08	Ready	44069.00	169	83	123	638
Рошаль (Моск.)	Чекалин (Тул.)	2022-04-11	Ready	45020.00	67	23	131	639
Шатура (Моск.)	Белёв (Тул.)	2022-04-14	Ready	32205.00	2	9	136	640
Электрогорск (Моск.)	Болхов (Орл.)	2022-04-17	Ready	32814.00	77	21	109	641
Луховицы (Моск.)	Мценск (Орл.)	2022-04-20	Ready	53828.00	91	99	128	642
Егорьевск (Моск.)	Новосиль (Орл.)	2022-04-23	Ready	28990.00	168	25	135	643
Серебряные Пруды (Моск.)	Верховье (Орл.)	2022-04-26	Ready	38831.00	185	43	139	644
Скопин (Ряз.)	Ливны (Орл.)	2022-04-29	Ready	42718.00	141	90	107	645
Михайлов (Ряз.)	Глазуновка (Орл.)	2022-05-02	Ready	78376.00	92	3	116	646
Кораблино (Ряз.)	Долгое (Орл.)	2022-05-05	Ready	33768.00	87	66	104	647
Ряжск (Ряз.)	Кромы (Орл.)	2022-05-08	Ready	25704.00	146	2	114	648
Сасово (Ряз.)	Орёл (Орл.)	2022-05-11	Ready	57371.00	168	97	106	649
Касимов (Ряз.)	Болхов (Орл.)	2022-05-14	Ready	29962.00	14	54	110	650
Шацк (Ряз.)	Мценск (Орл.)	2022-05-17	Ready	84822.00	7	99	106	651
Щёлково (Моск.)	Ливны (Орл.)	2022-05-20	Ready	16697.00	174	94	109	652
Черусти (Моск.)	Елец (Лип.)	2022-05-23	Ready	13564.00	178	45	119	653
Талдом (Моск.)	Задонск (Лип.)	2022-05-26	Ready	27793.00	122	46	116	654
Высоковск (Моск.)	Лебедянь (Лип.)	2022-05-29	Ready	26927.00	168	45	122	655
Кубинка (Моск.)	Данков (Лип.)	2022-06-01	Ready	75747.00	24	65	116	656
Голицыно (Моск.)	Чаплыгин (Лип.)	2022-06-04	Ready	76292.00	25	72	105	657
Можайск (Моск.)	Раненбург (Лип.)	2022-06-07	Ready	59936.00	53	19	124	658
Верея (Моск.)	Мичуринск (Тамб.)	2022-06-10	Ready	41826.00	17	23	137	659
Боровск (Калуж.)	Котовск (Тамб.)	2022-06-13	Ready	52729.00	199	17	130	660
Малоярославец (Калуж.)	Рассказово (Тамб.)	2022-06-16	Ready	33731.00	17	35	132	661
Жуков (Калуж.)	Моршанск (Тамб.)	2022-06-19	Ready	50384.00	41	34	117	662
Белоусово (Калуж.)	Кирсанов (Тамб.)	2022-06-22	Ready	66359.00	37	38	105	663
Кременки (Калуж.)	Уварово (Тамб.)	2022-06-25	Ready	53236.00	106	48	132	664
Сосенский (Калуж.)	Жердевка (Тамб.)	2022-06-28	Ready	67169.00	180	80	102	665
Суворов (Тул.)	Тамбов (Тамб.)	2022-07-01	Ready	37641.00	70	19	107	666
Ясногорск (Тул.)	Котовск (Тамб.)	2022-07-04	Ready	63426.00	103	71	128	667
Плавск (Тул.)	Рассказово (Тамб.)	2022-07-07	Ready	84745.00	39	86	138	668
Венёв (Тул.)	Моршанск (Тамб.)	2022-07-10	Ready	54624.00	31	17	129	669
Белёв (Тул.)	Кирсанов (Тамб.)	2022-07-13	Ready	81446.00	149	40	136	670
Болохово (Тул.)	Уварово (Тамб.)	2022-07-16	Ready	15702.00	194	3	123	671
Киреевск (Тул.)	Жердевка (Тамб.)	2022-07-19	Ready	34035.00	133	86	108	672
Липки (Тул.)	Тамбов (Тамб.)	2022-07-22	Ready	68229.00	78	27	137	673
Советск (Тул.)	Мичуринск (Тамб.)	2022-07-25	Ready	62058.00	174	89	112	674
Щёкино (Тул.)	Липецк (Лип.)	2022-07-28	Ready	38888.00	53	30	113	675
Новомосковск (Тул.)	Елец (Лип.)	2022-07-31	Ready	49095.00	42	37	116	676
Донской (Тул.)	Грязи (Лип.)	2022-08-03	Ready	60975.00	129	47	121	677
Ефремов (Тул.)	Лебедянь (Лип.)	2022-08-06	Ready	68213.00	159	27	107	678
Богородицк (Тул.)	Данков (Лип.)	2022-08-09	Ready	48356.00	195	49	133	679
Кимовск (Тул.)	Усмань (Лип.)	2022-08-12	Ready	33857.00	39	69	140	680
Узловая (Тул.)	Чаплыгин (Лип.)	2022-08-15	Ready	37540.00	164	24	105	681
Первомайский (Тул.)	Рязань (Ряз.)	2022-08-18	Ready	28440.00	33	31	135	682
Товарковский (Тул.)	Касимов (Ряз.)	2022-08-21	Ready	23823.00	201	93	138	683
Куркино (Тул.)	Скопин (Ряз.)	2022-08-24	Ready	48954.00	168	69	125	684
Волово (Тул.)	Сасово (Ряз.)	2022-08-27	Ready	24705.00	82	89	139	685
Чекалин (Тул.)	Шацк (Ряз.)	2022-08-30	Ready	77530.00	95	52	111	686
Арсеньево (Тул.)	Ряжск (Ряз.)	2022-09-02	Ready	70582.00	70	58	135	687
Одоев (Тул.)	Кораблино (Ряз.)	2022-09-05	Ready	43684.00	141	44	140	688
Дубна (Моск.)	Наро-Фоминск (Моск.)	2022-09-08	Ready	74078.00	128	7	118	689
Кимры (Твер.)	Обнинск (Калуж.)	2022-09-11	Ready	37776.00	169	12	114	690
Талдом (Моск.)	Жуковский (Моск.)	2022-09-14	Ready	76146.00	180	19	108	691
Дмитров (Моск.)	Дубна (Моск.)	2022-09-17	Ready	38299.00	15	19	110	692
Сергиев Посад (Моск.)	Раменское (Моск.)	2022-09-20	Ready	53249.00	189	92	112	693
Калуга (Калуж.)	Видное (Моск.)	2022-09-23	Ready	30423.00	43	79	125	694
Обнинск (Калуж.)	Домодедово (Моск.)	2022-09-26	Ready	43517.00	193	90	130	695
Малоярославец (Калуж.)	Солнечногорск (Моск.)	2022-09-29	Ready	66875.00	164	47	127	696
Балабаново (Калуж.)	Истра (Моск.)	2022-10-02	Ready	77433.00	173	8	132	697
Ермолино (Калуж.)	Зарайск (Моск.)	2022-10-05	Ready	33787.00	127	15	113	698
Кондрово (Калуж.)	Воскресенск (Моск.)	2022-10-08	Ready	50754.00	171	1	115	699
Полотняный Завод (Калуж.)	Павловский Посад (Моск.)	2022-10-11	Ready	72883.00	122	63	122	700
Медынь (Калуж.)	Красногорск (Моск.)	2022-10-14	Ready	83708.00	103	99	128	701
Мещовск (Калуж.)	Одинцово (Моск.)	2022-10-17	Ready	26732.00	41	91	116	702
Мосальск (Калуж.)	Балашиха (Моск.)	2022-10-20	Ready	72379.00	8	82	133	703
Юхнов (Калуж.)	Химки (Моск.)	2022-10-23	Ready	74957.00	155	43	112	704
Спас-Деменск (Калуж.)	Реутов (Моск.)	2022-10-26	Ready	14869.00	25	62	125	705
Киров (Калуж.)	Ногинск (Моск.)	2022-10-29	Ready	47015.00	153	39	131	706
Людиново (Калуж.)	Фрязино (Моск.)	2022-11-01	Ready	69570.00	15	40	101	707
Жиздра (Калуж.)	Лобня (Моск.)	2022-11-04	Ready	43177.00	11	94	135	708
Козельск (Калуж.)	Дзержинский (Моск.)	2022-11-07	Ready	56688.00	81	50	136	709
Сухиничи (Калуж.)	Протвино (Моск.)	2022-11-10	Ready	49821.00	78	5	131	710
Барятино (Калуж.)	Пущино (Моск.)	2022-11-13	Ready	27092.00	111	52	106	711
Суворов (Тул.)	Таруса (Калуж.)	2022-11-16	Ready	78925.00	10	70	129	712
Чекалин (Тул.)	Бехово (Тул.)	2022-11-19	Ready	49293.00	37	25	105	713
Белёв (Тул.)	Алексин (Тул.)	2022-11-22	Ready	35482.00	114	29	135	714
Болхов (Орл.)	Тула (Тул.)	2022-11-25	Ready	52443.00	95	55	126	715
Мценск (Орл.)	Кашира (Моск.)	2022-11-28	Ready	67836.00	50	72	134	716
Новосиль (Орл.)	Дубна (Моск.)	2022-12-01	Ready	35072.00	176	6	135	717
Верховье (Орл.)	Кимры (Твер.)	2022-12-04	Ready	49360.00	68	100	103	718
Ливны (Орл.)	Талдом (Моск.)	2022-12-07	Ready	26101.00	162	60	112	719
Глазуновка (Орл.)	Дмитров (Моск.)	2022-12-10	Ready	29273.00	124	49	127	720
Долгое (Орл.)	Сергиев Посад (Моск.)	2022-12-13	Ready	56875.00	129	78	122	721
Кромы (Орл.)	Калуга (Калуж.)	2022-12-16	Ready	35634.00	15	65	138	722
Орёл (Орл.)	Обнинск (Калуж.)	2022-12-19	Ready	78230.00	96	86	114	723
Болхов (Орл.)	Малоярославец (Калуж.)	2022-12-22	Ready	67349.00	74	13	124	724
Мценск (Орл.)	Балабаново (Калуж.)	2022-12-25	Ready	44715.00	92	47	128	725
Ливны (Орл.)	Ермолино (Калуж.)	2022-12-28	Ready	36165.00	51	84	139	726
Елец (Лип.)	Кондрово (Калуж.)	2022-12-31	Ready	42232.00	23	98	111	727
Задонск (Лип.)	Полотняный Завод (Калуж.)	2023-01-03	Ready	40086.00	126	74	126	728
Лебедянь (Лип.)	Медынь (Калуж.)	2023-01-06	Ready	35903.00	23	46	101	729
Данков (Лип.)	Мещовск (Калуж.)	2023-01-09	Ready	69160.00	90	33	107	730
Чаплыгин (Лип.)	Мосальск (Калуж.)	2023-01-12	Ready	16807.00	99	73	126	731
Раненбург (Лип.)	Юхнов (Калуж.)	2023-01-15	Ready	25527.00	61	71	135	732
Мичуринск (Тамб.)	Спас-Деменск (Калуж.)	2023-01-18	Ready	48684.00	180	16	103	733
Котовск (Тамб.)	Киров (Калуж.)	2023-01-21	Ready	63986.00	97	57	132	734
Рассказово (Тамб.)	Людиново (Калуж.)	2023-01-24	Ready	22667.00	30	95	133	735
Моршанск (Тамб.)	Жиздра (Калуж.)	2023-01-27	Ready	19494.00	186	47	111	736
Кирсанов (Тамб.)	Козельск (Калуж.)	2023-01-30	Ready	27674.00	53	15	112	737
Уварово (Тамб.)	Сухиничи (Калуж.)	2023-02-02	Ready	73526.00	202	99	125	738
Жердевка (Тамб.)	Барятино (Калуж.)	2023-02-05	Ready	58400.00	117	76	124	739
Тамбов (Тамб.)	Суворов (Тул.)	2023-02-08	Ready	25727.00	188	22	132	740
Котовск (Тамб.)	Чекалин (Тул.)	2023-02-11	Ready	65722.00	200	76	105	741
Рассказово (Тамб.)	Белёв (Тул.)	2023-02-14	Ready	26704.00	5	60	103	742
Моршанск (Тамб.)	Болхов (Орл.)	2023-02-17	Ready	52309.00	71	94	139	743
Кирсанов (Тамб.)	Мценск (Орл.)	2023-02-20	Ready	62628.00	186	44	135	744
Уварово (Тамб.)	Новосиль (Орл.)	2023-02-23	Ready	58975.00	81	2	111	745
Жердевка (Тамб.)	Верховье (Орл.)	2023-02-26	Ready	23410.00	51	12	110	746
Тамбов (Тамб.)	Ливны (Орл.)	2023-03-01	Ready	45303.00	55	94	140	747
Мичуринск (Тамб.)	Глазуновка (Орл.)	2023-03-04	Ready	22901.00	85	27	123	748
Липецк (Лип.)	Долгое (Орл.)	2023-03-07	Ready	67863.00	187	7	107	749
Елец (Лип.)	Кромы (Орл.)	2023-03-10	Ready	25765.00	156	55	139	750
Грязи (Лип.)	Орёл (Орл.)	2023-03-13	Ready	39688.00	119	61	131	751
Лебедянь (Лип.)	Болхов (Орл.)	2023-03-16	Ready	26426.00	62	69	139	752
Данков (Лип.)	Мценск (Орл.)	2023-03-19	Ready	83839.00	198	66	139	753
Усмань (Лип.)	Ливны (Орл.)	2023-03-22	Ready	21828.00	154	6	136	754
Чаплыгин (Лип.)	Елец (Лип.)	2023-03-25	Ready	14774.00	1	81	116	755
Рязань (Ряз.)	Задонск (Лип.)	2023-03-28	Ready	25927.00	157	16	119	756
Касимов (Ряз.)	Лебедянь (Лип.)	2023-03-31	Ready	16090.00	125	78	128	757
Скопин (Ряз.)	Данков (Лип.)	2023-04-03	Ready	62963.00	167	18	139	758
Сасово (Ряз.)	Чаплыгин (Лип.)	2023-04-06	Ready	28399.00	147	65	114	759
Шацк (Ряз.)	Раненбург (Лип.)	2023-04-09	Ready	31865.00	35	32	113	760
Ряжск (Ряз.)	Мичуринск (Тамб.)	2023-04-12	Ready	42549.00	62	54	118	761
Кораблино (Ряз.)	Котовск (Тамб.)	2023-04-15	Ready	32919.00	45	15	128	762
Михайлов (Ряз.)	Рассказово (Тамб.)	2023-04-18	Ready	71289.00	21	81	134	763
Новомичуринск (Ряз.)	Моршанск (Тамб.)	2023-04-21	Ready	60291.00	63	31	118	764
Спасск-Рязанский (Ряз.)	Кирсанов (Тамб.)	2023-04-24	Ready	12752.00	25	81	135	765
Шилово (Ряз.)	Уварово (Тамб.)	2023-04-27	Ready	44366.00	20	1	125	766
Кадом (Ряз.)	Жердевка (Тамб.)	2023-04-30	Ready	49789.00	182	97	128	767
Тума (Ряз.)	Тамбов (Тамб.)	2023-05-03	Ready	56132.00	85	28	123	768
Спас-Клепики (Ряз.)	Котовск (Тамб.)	2023-05-06	Ready	61574.00	198	80	105	769
Рыбное (Ряз.)	Рассказово (Тамб.)	2023-05-09	Ready	79345.00	104	34	102	770
Солотча (Ряз.)	Моршанск (Тамб.)	2023-05-12	Ready	64909.00	9	2	121	771
Константиново (Ряз.)	Кирсанов (Тамб.)	2023-05-15	Ready	66236.00	72	64	124	772
Лобня (Моск.)	Уварово (Тамб.)	2023-05-18	Ready	48955.00	157	38	118	773
Дзержинский (Моск.)	Жердевка (Тамб.)	2023-05-21	Ready	36004.00	202	60	128	774
Протвино (Моск.)	Тамбов (Тамб.)	2023-05-24	Ready	72896.00	160	20	135	775
Пущино (Моск.)	Мичуринск (Тамб.)	2023-05-27	Ready	17560.00	152	99	136	776
Таруса (Калуж.)	Липецк (Лип.)	2023-05-30	Ready	16952.00	187	17	124	777
Бехово (Тул.)	Елец (Лип.)	2023-06-02	Ready	22379.00	172	22	115	778
Алексин (Тул.)	Грязи (Лип.)	2023-06-05	Ready	64886.00	150	56	130	779
Тула (Тул.)	Лебедянь (Лип.)	2023-06-08	Ready	45063.00	55	6	139	780
Кашира (Моск.)	Данков (Лип.)	2023-06-11	Ready	56265.00	155	74	112	781
Ступино (Моск.)	Усмань (Лип.)	2023-06-14	Ready	58521.00	127	11	127	782
Озёры (Моск.)	Чаплыгин (Лип.)	2023-06-17	Ready	53704.00	169	8	123	783
Звенигород (Моск.)	Рязань (Ряз.)	2023-06-20	Ready	59126.00	34	51	116	784
Клин (Моск.)	Касимов (Ряз.)	2023-06-23	Ready	24651.00	47	20	105	785
Дедовск (Моск.)	Скопин (Ряз.)	2023-06-26	Ready	71299.00	106	97	128	786
Ивантеевка (Моск.)	Сасово (Ряз.)	2023-06-29	Ready	31185.00	164	21	126	787
Куровское (Моск.)	Шацк (Ряз.)	2023-07-02	Ready	53250.00	186	94	119	788
Ликино-Дулёво (Моск.)	Ряжск (Ряз.)	2023-07-05	Ready	78917.00	32	71	113	789
Рошаль (Моск.)	Кораблино (Ряз.)	2023-07-08	Ready	19915.00	125	71	126	790
Боровск (Калуж.)	Михайлов (Ряз.)	2023-07-11	Ready	29590.00	101	92	104	791
Малоярославец (Калуж.)	Новомичуринск (Ряз.)	2023-07-14	Ready	67909.00	46	57	133	792
Жуков (Калуж.)	Спасск-Рязанский (Ряз.)	2023-07-17	Ready	80773.00	79	84	132	793
Белоусово (Калуж.)	Шилово (Ряз.)	2023-07-20	Ready	16995.00	137	10	123	794
Кременки (Калуж.)	Кадом (Ряз.)	2023-07-23	Ready	65630.00	13	35	120	795
Сосенский (Калуж.)	Тума (Ряз.)	2023-07-26	Ready	81869.00	176	52	134	796
Суворов (Тул.)	Спас-Клепики (Ряз.)	2023-07-29	Ready	13922.00	156	77	139	797
Ясногорск (Тул.)	Рыбное (Ряз.)	2023-08-01	Ready	52234.00	143	68	126	798
Плавск (Тул.)	Солотча (Ряз.)	2023-08-04	Ready	57460.00	102	25	102	799
Венёв (Тул.)	Константиново (Ряз.)	2023-08-07	Ready	40158.00	23	98	132	800
Белёв (Тул.)	Лобня (Моск.)	2023-08-10	Ready	48395.00	101	50	139	801
Болохово (Тул.)	Дзержинский (Моск.)	2023-08-13	Ready	30254.00	196	13	140	802
Киреевск (Тул.)	Протвино (Моск.)	2023-08-16	Ready	59517.00	139	88	101	803
Липки (Тул.)	Пущино (Моск.)	2023-08-19	Ready	77794.00	173	24	116	804
Советск (Тул.)	Таруса (Калуж.)	2023-08-22	Ready	47161.00	124	45	120	805
Щёкино (Тул.)	Бехово (Тул.)	2023-08-25	Ready	24430.00	176	24	106	806
Новомосковск (Тул.)	Алексин (Тул.)	2023-08-28	Ready	52133.00	110	98	121	807
Донской (Тул.)	Тула (Тул.)	2023-08-31	Ready	35585.00	49	90	107	808
Ефремов (Тул.)	Кашира (Моск.)	2023-09-03	Ready	16148.00	129	64	108	809
Богородицк (Тул.)	Ступино (Моск.)	2023-09-06	Ready	72231.00	22	53	137	810
Кимовск (Тул.)	Озёры (Моск.)	2023-09-09	Ready	61567.00	32	83	120	811
Узловая (Тул.)	Звенигород (Моск.)	2023-09-12	Ready	80351.00	135	83	136	812
Первомайский (Тул.)	Клин (Моск.)	2023-09-15	Ready	37014.00	118	48	118	813
Товарковский (Тул.)	Дедовск (Моск.)	2023-09-18	Ready	73942.00	58	42	106	814
Куркино (Тул.)	Ивантеевка (Моск.)	2023-09-21	Ready	31122.00	38	74	134	815
Волово (Тул.)	Куровское (Моск.)	2023-09-24	Ready	65192.00	46	41	113	816
Чекалин (Тул.)	Ликино-Дулёво (Моск.)	2023-09-27	Ready	36580.00	180	86	121	817
Арсеньево (Тул.)	Рошаль (Моск.)	2023-09-30	Ready	63408.00	155	53	115	818
Одоев (Тул.)	Боровск (Калуж.)	2023-10-03	Ready	62630.00	52	95	111	819
Дубна (Моск.)	Малоярославец (Калуж.)	2023-10-06	Ready	51007.00	81	35	111	820
Кимры (Твер.)	Жуков (Калуж.)	2023-10-09	Ready	61096.00	74	23	115	821
Талдом (Моск.)	Белоусово (Калуж.)	2023-10-12	Ready	16142.00	158	43	136	822
Дмитров (Моск.)	Кременки (Калуж.)	2023-10-15	Ready	81074.00	20	61	101	823
Сергиев Посад (Моск.)	Сосенский (Калуж.)	2023-10-18	Ready	34276.00	142	72	134	824
Калуга (Калуж.)	Суворов (Тул.)	2023-10-21	Ready	77361.00	28	36	136	825
Обнинск (Калуж.)	Ясногорск (Тул.)	2023-10-24	Ready	53113.00	24	19	139	826
Малоярославец (Калуж.)	Плавск (Тул.)	2023-10-27	Ready	16219.00	113	29	140	827
Балабаново (Калуж.)	Венёв (Тул.)	2023-10-30	Ready	35240.00	90	33	104	828
Ермолино (Калуж.)	Белёв (Тул.)	2023-11-02	Ready	50293.00	57	98	124	829
Кондрово (Калуж.)	Болохово (Тул.)	2023-11-05	Ready	59497.00	138	4	140	830
Полотняный Завод (Калуж.)	Куровское (Моск.)	2023-11-08	Ready	37961.00	174	47	114	831
Медынь (Калуж.)	Ликино-Дулёво (Моск.)	2023-11-11	Ready	24951.00	173	67	116	832
Мещовск (Калуж.)	Рошаль (Моск.)	2023-11-14	Ready	25858.00	109	27	128	833
Мосальск (Калуж.)	Шатура (Моск.)	2023-11-17	Ready	77368.00	85	56	104	834
Юхнов (Калуж.)	Электрогорск (Моск.)	2023-11-20	Ready	63620.00	8	34	104	835
Спас-Деменск (Калуж.)	Луховицы (Моск.)	2023-11-23	Ready	70030.00	11	78	126	836
Киров (Калуж.)	Егорьевск (Моск.)	2023-11-26	Ready	16975.00	104	2	133	837
Людиново (Калуж.)	Серебряные Пруды (Моск.)	2023-11-29	Ready	64790.00	197	86	132	838
Жиздра (Калуж.)	Скопин (Ряз.)	2023-12-02	Ready	68570.00	102	41	118	839
Козельск (Калуж.)	Михайлов (Ряз.)	2023-12-05	Ready	20566.00	176	42	128	840
Сухиничи (Калуж.)	Кораблино (Ряз.)	2023-12-08	Ready	54682.00	65	30	118	841
Барятино (Калуж.)	Ряжск (Ряз.)	2023-12-11	Ready	25341.00	68	20	118	842
Суворов (Тул.)	Сасово (Ряз.)	2023-12-14	Ready	23808.00	46	35	124	843
Чекалин (Тул.)	Касимов (Ряз.)	2023-12-17	Ready	79377.00	57	60	130	844
Белёв (Тул.)	Шацк (Ряз.)	2023-12-20	Ready	34552.00	107	93	123	845
Болхов (Орл.)	Щёлково (Моск.)	2023-12-23	Ready	28968.00	88	68	129	846
Мценск (Орл.)	Черусти (Моск.)	2023-12-26	Ready	51138.00	42	5	126	847
Новосиль (Орл.)	Талдом (Моск.)	2023-12-29	Ready	67548.00	123	68	126	848
Верховье (Орл.)	Высоковск (Моск.)	2024-01-01	Ready	29860.00	18	44	116	849
Ливны (Орл.)	Кубинка (Моск.)	2024-01-04	Ready	73772.00	100	64	131	850
Глазуновка (Орл.)	Голицыно (Моск.)	2024-01-07	Ready	67040.00	112	25	130	851
Долгое (Орл.)	Можайск (Моск.)	2024-01-10	Ready	71567.00	56	11	104	852
Кромы (Орл.)	Верея (Моск.)	2024-01-13	Ready	71029.00	142	42	133	853
Орёл (Орл.)	Боровск (Калуж.)	2024-01-16	Ready	56433.00	102	42	109	854
Болхов (Орл.)	Малоярославец (Калуж.)	2024-01-19	Ready	59003.00	93	16	104	855
Мценск (Орл.)	Жуков (Калуж.)	2024-01-22	Ready	22899.00	160	80	132	856
Ливны (Орл.)	Белоусово (Калуж.)	2024-01-25	Ready	39534.00	116	67	136	857
Елец (Лип.)	Кременки (Калуж.)	2024-01-28	Ready	18078.00	24	46	117	858
Задонск (Лип.)	Сосенский (Калуж.)	2024-01-31	Ready	20954.00	98	39	123	859
Лебедянь (Лип.)	Суворов (Тул.)	2024-02-03	Ready	40174.00	51	94	115	860
Данков (Лип.)	Ясногорск (Тул.)	2024-02-06	Ready	28898.00	189	89	123	861
Чаплыгин (Лип.)	Плавск (Тул.)	2024-02-09	Ready	62322.00	181	96	131	862
Раненбург (Лип.)	Венёв (Тул.)	2024-02-12	Ready	19002.00	200	3	122	863
Мичуринск (Тамб.)	Белёв (Тул.)	2024-02-15	Ready	43834.00	115	66	138	864
Котовск (Тамб.)	Болохово (Тул.)	2024-02-18	Ready	73856.00	27	100	128	865
Рассказово (Тамб.)	Киреевск (Тул.)	2024-02-21	Ready	58597.00	163	61	115	866
Моршанск (Тамб.)	Липки (Тул.)	2024-02-24	Ready	16160.00	200	13	114	867
Кирсанов (Тамб.)	Советск (Тул.)	2024-02-27	Ready	34162.00	45	60	140	868
Уварово (Тамб.)	Щёкино (Тул.)	2024-03-01	Ready	36957.00	48	88	135	869
Жердевка (Тамб.)	Новомосковск (Тул.)	2024-03-04	Ready	58402.00	32	89	115	870
Тамбов (Тамб.)	Донской (Тул.)	2024-03-07	Ready	46067.00	140	94	115	871
Котовск (Тамб.)	Ефремов (Тул.)	2024-03-10	Ready	56753.00	87	86	118	872
Рассказово (Тамб.)	Богородицк (Тул.)	2024-03-13	Ready	54260.00	65	42	132	873
Моршанск (Тамб.)	Кимовск (Тул.)	2024-03-16	Ready	63067.00	87	42	107	874
Кирсанов (Тамб.)	Узловая (Тул.)	2024-03-19	Ready	71673.00	76	57	107	875
Уварово (Тамб.)	Первомайский (Тул.)	2024-03-22	Ready	26249.00	174	89	118	876
Жердевка (Тамб.)	Товарковский (Тул.)	2024-03-25	Ready	59938.00	137	58	131	877
Тамбов (Тамб.)	Куркино (Тул.)	2024-03-28	Ready	65838.00	128	16	108	878
Мичуринск (Тамб.)	Волово (Тул.)	2024-03-31	Ready	36779.00	166	79	138	879
Липецк (Лип.)	Чекалин (Тул.)	2024-04-03	Ready	74480.00	3	11	138	880
Елец (Лип.)	Арсеньево (Тул.)	2024-04-06	Ready	64933.00	99	24	101	881
Грязи (Лип.)	Одоев (Тул.)	2024-04-09	Ready	64049.00	94	17	137	882
Лебедянь (Лип.)	Дубна (Моск.)	2024-04-12	Ready	48621.00	186	66	132	883
Данков (Лип.)	Кимры (Твер.)	2024-04-15	Ready	61447.00	38	71	121	884
Усмань (Лип.)	Талдом (Моск.)	2024-04-18	Ready	67920.00	33	94	124	885
Задонск (Лип.)	Дмитров (Моск.)	2024-04-21	Ready	48367.00	97	90	126	886
Лебедянь (Лип.)	Сергиев Посад (Моск.)	2024-04-24	Ready	13694.00	99	5	121	887
Данков (Лип.)	Калуга (Калуж.)	2024-04-27	Ready	52186.00	23	30	114	888
Чаплыгин (Лип.)	Обнинск (Калуж.)	2024-04-30	Ready	64022.00	32	96	123	889
Раненбург (Лип.)	Малоярославец (Калуж.)	2024-05-03	Ready	38330.00	196	3	137	890
Мичуринск (Тамб.)	Балабаново (Калуж.)	2024-05-06	Ready	56723.00	159	78	130	891
Котовск (Тамб.)	Ермолино (Калуж.)	2024-05-09	Ready	15124.00	144	75	130	892
Рассказово (Тамб.)	Кондрово (Калуж.)	2024-05-12	Ready	39005.00	34	86	113	893
Моршанск (Тамб.)	Полотняный Завод (Калуж.)	2024-05-15	Ready	16840.00	34	17	101	894
Кирсанов (Тамб.)	Медынь (Калуж.)	2024-05-18	Ready	48400.00	3	10	118	895
Уварово (Тамб.)	Мещовск (Калуж.)	2024-05-21	Ready	72193.00	38	81	102	896
Жердевка (Тамб.)	Мосальск (Калуж.)	2024-05-24	Ready	58540.00	42	90	123	897
Тамбов (Тамб.)	Юхнов (Калуж.)	2024-05-27	Ready	81721.00	198	57	130	898
Котовск (Тамб.)	Спас-Деменск (Калуж.)	2024-05-30	Ready	41218.00	163	97	136	899
Рассказово (Тамб.)	Киров (Калуж.)	2024-06-02	Ready	44683.00	50	37	101	900
Моршанск (Тамб.)	Людиново (Калуж.)	2024-06-05	Ready	57956.00	176	94	110	901
Кирсанов (Тамб.)	Жиздра (Калуж.)	2024-06-08	Ready	84173.00	152	68	129	902
Уварово (Тамб.)	Козельск (Калуж.)	2024-06-11	Ready	66935.00	156	73	111	903
Жердевка (Тамб.)	Сухиничи (Калуж.)	2024-06-14	Ready	16255.00	57	71	104	904
Тамбов (Тамб.)	Барятино (Калуж.)	2024-06-17	Ready	30278.00	94	59	140	905
Мичуринск (Тамб.)	Суворов (Тул.)	2024-06-20	Ready	74890.00	181	84	120	906
Липецк (Лип.)	Чекалин (Тул.)	2024-06-23	Ready	15976.00	56	33	126	907
Елец (Лип.)	Белёв (Тул.)	2024-06-26	Ready	29003.00	198	71	132	908
Грязи (Лип.)	Болхов (Орл.)	2024-06-29	Ready	68729.00	182	26	114	909
Лебедянь (Лип.)	Мценск (Орл.)	2024-07-02	Ready	26948.00	30	48	130	910
Данков (Лип.)	Новосиль (Орл.)	2024-07-05	Ready	18488.00	118	80	108	911
Усмань (Лип.)	Верховье (Орл.)	2024-07-08	Ready	29824.00	182	96	123	912
Чаплыгин (Лип.)	Ливны (Орл.)	2024-07-11	Ready	20096.00	10	18	139	913
Рязань (Ряз.)	Глазуновка (Орл.)	2024-07-14	Ready	21138.00	128	51	107	914
Касимов (Ряз.)	Долгое (Орл.)	2024-07-17	Ready	50467.00	139	55	123	915
Скопин (Ряз.)	Кромы (Орл.)	2024-07-20	Ready	50386.00	105	57	140	916
Сасово (Ряз.)	Орёл (Орл.)	2024-07-23	Ready	55529.00	15	67	137	917
Шацк (Ряз.)	Болхов (Орл.)	2024-07-26	Ready	25271.00	117	58	131	918
Ряжск (Ряз.)	Мценск (Орл.)	2024-07-29	Ready	80071.00	178	91	117	919
Кораблино (Ряз.)	Ливны (Орл.)	2024-08-01	Ready	45272.00	69	73	125	920
Михайлов (Ряз.)	Елец (Лип.)	2024-08-04	Ready	52078.00	50	39	101	921
Новомичуринск (Ряз.)	Задонск (Лип.)	2024-08-07	Ready	58083.00	4	8	136	922
Спасск-Рязанский (Ряз.)	Лебедянь (Лип.)	2024-08-10	Ready	80666.00	50	18	103	923
Шилово (Ряз.)	Данков (Лип.)	2024-08-13	Ready	58139.00	121	39	127	924
Кадом (Ряз.)	Чаплыгин (Лип.)	2024-08-16	Ready	77641.00	16	4	119	925
Тума (Ряз.)	Раненбург (Лип.)	2024-08-19	Ready	70607.00	178	66	119	926
Спас-Клепики (Ряз.)	Мичуринск (Тамб.)	2024-08-22	Ready	49387.00	177	33	115	927
Рыбное (Ряз.)	Котовск (Тамб.)	2024-08-25	Ready	12609.00	162	60	117	928
Солотча (Ряз.)	Рассказово (Тамб.)	2024-08-28	Ready	69446.00	141	24	139	929
Константиново (Ряз.)	Моршанск (Тамб.)	2024-08-31	Ready	33943.00	187	22	128	930
Тула (Тул.)	Кирсанов (Тамб.)	2024-09-03	Ready	69250.00	100	72	112	931
Москва (Моск.)	Уварово (Тамб.)	2024-09-06	Ready	12193.00	53	88	108	932
Серпухов (Моск.)	Жердевка (Тамб.)	2024-09-09	Ready	31538.00	67	29	106	933
Калуга (Калуж.)	Тамбов (Тамб.)	2024-09-12	Ready	50088.00	172	36	113	934
Рязань (Ряз.)	Котовск (Тамб.)	2024-09-15	Ready	83302.00	107	59	102	935
Алексин (Тул.)	Рассказово (Тамб.)	2024-09-18	Ready	72990.00	185	88	103	936
Щёкино (Тул.)	Моршанск (Тамб.)	2024-09-21	Ready	38141.00	198	79	110	937
Новомосковск (Тул.)	Кирсанов (Тамб.)	2024-09-24	Ready	72911.00	36	69	112	938
Донской (Тул.)	Уварово (Тамб.)	2024-09-27	Ready	41081.00	20	28	115	939
Ефремов (Тул.)	Жердевка (Тамб.)	2024-09-30	Ready	23650.00	68	46	136	940
Богородицк (Тул.)	Тамбов (Тамб.)	2024-10-03	Ready	50080.00	171	9	140	941
Кимовск (Тул.)	Мичуринск (Тамб.)	2024-10-06	Ready	81359.00	19	33	128	942
Клин (Моск.)	Липецк (Лип.)	2024-10-09	Ready	27624.00	172	12	121	943
Подольск (Моск.)	Елец (Лип.)	2024-10-12	Ready	21650.00	52	15	103	944
Коломна (Моск.)	Грязи (Лип.)	2024-10-15	Ready	51772.00	18	36	134	945
Орехово-Зуево (Моск.)	Лебедянь (Лип.)	2024-10-18	Ready	65610.00	95	53	116	946
Мытищи (Моск.)	Данков (Лип.)	2024-10-21	Ready	68577.00	92	52	124	947
Королёв (Моск.)	Усмань (Лип.)	2024-10-24	Ready	23845.00	157	83	125	948
Люберцы (Моск.)	Чаплыгин (Лип.)	2024-10-27	Ready	51273.00	117	71	134	949
Электросталь (Моск.)	Рязань (Ряз.)	2024-10-30	Ready	51176.00	84	2	103	950
Дмитров (Моск.)	Касимов (Ряз.)	2024-11-02	Ready	31790.00	196	69	133	951
Сергиев Посад (Моск.)	Скопин (Ряз.)	2024-11-05	Ready	84446.00	87	71	135	952
Чехов (Моск.)	Сасово (Ряз.)	2024-11-08	Ready	12738.00	82	84	126	953
Наро-Фоминск (Моск.)	Шацк (Ряз.)	2024-11-11	Ready	78366.00	117	33	123	954
Обнинск (Калуж.)	Ряжск (Ряз.)	2024-11-14	Ready	29207.00	101	43	118	955
Жуковский (Моск.)	Кораблино (Ряз.)	2024-11-17	Ready	46692.00	132	71	122	956
Дубна (Моск.)	Михайлов (Ряз.)	2024-11-20	Ready	46995.00	181	92	130	957
Раменское (Моск.)	Новомичуринск (Ряз.)	2024-11-23	Ready	31610.00	1	68	135	958
Видное (Моск.)	Спасск-Рязанский (Ряз.)	2024-11-26	Ready	53496.00	162	71	115	959
Домодедово (Моск.)	Шилово (Ряз.)	2024-11-29	Ready	61385.00	50	75	109	960
Солнечногорск (Моск.)	Кадом (Ряз.)	2024-12-02	Ready	31205.00	130	37	114	961
Истра (Моск.)	Тума (Ряз.)	2024-12-05	Ready	52139.00	87	17	133	962
Зарайск (Моск.)	Спас-Клепики (Ряз.)	2024-12-08	Ready	27641.00	174	18	113	963
Воскресенск (Моск.)	Рыбное (Ряз.)	2024-12-11	Ready	26990.00	194	66	118	964
Павловский Посад (Моск.)	Солотча (Ряз.)	2024-12-14	Ready	62155.00	19	12	124	965
Красногорск (Моск.)	Константиново (Ряз.)	2024-12-17	Ready	47313.00	187	5	128	966
Одинцово (Моск.)	Лобня (Моск.)	2024-12-20	Ready	81342.00	96	54	119	967
Балашиха (Моск.)	Дзержинский (Моск.)	2024-12-23	Ready	58325.00	166	17	118	968
Химки (Моск.)	Протвино (Моск.)	2024-12-26	Ready	43621.00	126	81	112	969
Реутов (Моск.)	Пущино (Моск.)	2024-12-29	Ready	46085.00	133	62	139	970
Ногинск (Моск.)	Таруса (Калуж.)	2025-01-01	Ready	56687.00	47	16	103	971
Фрязино (Моск.)	Бехово (Тул.)	2025-01-04	Ready	42862.00	93	94	136	972
Лобня (Моск.)	Алексин (Тул.)	2025-01-07	Ready	21033.00	67	37	140	973
Дзержинский (Моск.)	Тула (Тул.)	2025-01-10	Ready	57072.00	100	16	138	974
Протвино (Моск.)	Кашира (Моск.)	2025-01-13	Ready	46441.00	162	67	138	975
Пущино (Моск.)	Ступино (Моск.)	2025-01-16	Ready	76921.00	186	31	113	976
Таруса (Калуж.)	Озёры (Моск.)	2025-01-19	Ready	32645.00	145	42	127	977
Бехово (Тул.)	Звенигород (Моск.)	2025-01-22	Ready	26146.00	124	26	120	978
Алексин (Тул.)	Клин (Моск.)	2025-01-25	Ready	37679.00	35	31	138	979
Тула (Тул.)	Дедовск (Моск.)	2025-01-28	Ready	41734.00	19	29	117	980
Кашира (Моск.)	Ивантеевка (Моск.)	2025-01-31	Ready	35496.00	89	41	125	981
Ступино (Моск.)	Куровское (Моск.)	2025-02-03	Work	65627.00	23	14	110	982
Озёры (Моск.)	Ликино-Дулёво (Моск.)	2025-02-06	Work	13874.00	164	37	106	983
Звенигород (Моск.)	Рошаль (Моск.)	2025-02-09	Work	55355.00	63	58	117	984
Клин (Моск.)	Боровск (Калуж.)	2025-02-12	Work	71792.00	152	26	106	985
Дедовск (Моск.)	Малоярославец (Калуж.)	2025-02-15	Work	61721.00	159	44	124	986
Ивантеевка (Моск.)	Жуков (Калуж.)	2025-02-18	Work	52044.00	150	10	138	987
Куровское (Моск.)	Белоусово (Калуж.)	2025-02-21	Work	73060.00	66	26	135	988
Ликино-Дулёво (Моск.)	Кременки (Калуж.)	2025-02-24	Work	51891.00	3	59	106	989
Рошаль (Моск.)	Сосенский (Калуж.)	2025-02-27	Work	73075.00	104	61	109	990
Шатура (Моск.)	Суворов (Тул.)	2025-03-02	Work	17993.00	11	92	131	991
Электрогорск (Моск.)	Ясногорск (Тул.)	2025-03-05	Work	51735.00	54	15	108	992
Луховицы (Моск.)	Плавск (Тул.)	2025-03-08	Work	76094.00	171	92	110	993
Егорьевск (Моск.)	Венёв (Тул.)	2025-03-11	Work	36604.00	154	45	125	994
Рыбное (Ряз.)	Белёв (Тул.)	2025-03-14	Work	52356.00	83	93	127	995
Солотча (Ряз.)	Болохово (Тул.)	2025-03-17	Work	32184.00	96	47	130	996
Константиново (Ряз.)	Киреевск (Тул.)	2025-03-20	Work	70545.00	64	96	117	997
Тула (Тул.)	Липки (Тул.)	2025-03-23	Work	73461.00	126	60	138	998
Москва (Моск.)	Советск (Тул.)	2025-03-26	Work	32914.00	132	9	139	999
Ликино-Дулёво (Моск.)	Щёкино (Тул.)	2025-03-29	Work	27772.00	6	37	139	1000
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.seasons (mounth, season, season_number) FROM stdin;
1	зима	1
2	зима	1
3	весна	2
4	весна	2
5	весна	2
6	лето	3
7	лето	3
8	лето	3
9	осень	4
10	осень	4
11	осень	4
12	зима	1
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.service (service_type, service_date, service_cost, car_id, service_id) FROM stdin;
﻿Балансировка колес	2018-01-10	89493.00	26	1
Обслуживание трансмиссии	2018-01-19	64402.00	7	2
Плановое тех. Обслуживание	2018-01-28	79102.00	22	3
Ремонт подвески	2018-02-06	95103.00	26	4
Ремонт двигателя	2018-02-15	54414.00	25	5
Балансировка колес	2018-02-24	18876.00	12	6
Обслуживание трансмиссии	2018-03-05	13393.00	18	7
Плановое тех. Обслуживание	2018-03-14	95514.00	27	8
Плановое тех. Обслуживание	2018-03-23	54687.00	34	9
Ремонт двигателя	2018-04-01	80671.00	14	10
Плановое тех. Обслуживание	2018-04-10	45974.00	21	11
Обслуживание трансмиссии	2018-04-19	71420.00	37	12
Плановое тех. Обслуживание	2018-04-28	87233.00	36	13
Ремонт подвески	2018-05-07	12762.00	21	14
Ремонт двигателя	2018-05-16	83986.00	20	15
Балансировка колес	2018-05-25	77977.00	7	16
Обслуживание трансмиссии	2018-06-03	11159.00	24	17
Плановое тех. Обслуживание	2018-06-12	78658.00	13	18
Ремонт подвески	2018-06-21	44001.00	8	19
Плановое тех. Обслуживание	2018-06-30	77604.00	14	20
Балансировка колес	2018-07-09	92838.00	20	21
Плановое тех. Обслуживание	2018-07-18	14388.00	29	22
Плановое тех. Обслуживание	2018-07-27	76551.00	15	23
Ремонт подвески	2018-08-05	54130.00	6	24
Ремонт двигателя	2018-08-14	39260.00	18	25
Балансировка колес	2018-08-23	10457.00	8	26
Обслуживание трансмиссии	2018-09-01	68974.00	40	27
Плановое тех. Обслуживание	2018-09-10	52484.00	16	28
Ремонт подвески	2018-09-19	53571.00	17	29
Ремонт двигателя	2018-09-28	62448.00	25	30
Балансировка колес	2018-10-07	12743.00	34	31
Обслуживание трансмиссии	2018-10-16	66996.00	35	32
Плановое тех. Обслуживание	2018-10-25	90478.00	23	33
Плановое тех. Обслуживание	2018-11-03	99373.00	8	34
Плановое тех. Обслуживание	2018-11-12	68735.00	26	35
Плановое тех. Обслуживание	2018-11-21	70908.00	4	36
Обслуживание трансмиссии	2018-11-30	30986.00	39	37
Плановое тех. Обслуживание	2018-12-09	49104.00	10	38
Ремонт подвески	2018-12-18	67653.00	23	39
Ремонт двигателя	2018-12-27	56481.00	7	40
Балансировка колес	2019-01-05	73010.00	31	41
Обслуживание трансмиссии	2019-01-14	50372.00	39	42
Плановое тех. Обслуживание	2019-01-23	10588.00	12	43
Ремонт подвески	2019-02-01	64911.00	18	44
Ремонт двигателя	2019-02-10	53606.00	34	45
Балансировка колес	2019-02-19	6560.00	2	46
Обслуживание трансмиссии	2019-02-28	67397.00	32	47
Плановое тех. Обслуживание	2019-03-09	93864.00	15	48
Ремонт подвески	2019-03-18	45227.00	1	49
Ремонт двигателя	2019-03-27	57944.00	32	50
Балансировка колес	2019-04-05	43160.00	27	51
Обслуживание трансмиссии	2019-04-14	99770.00	30	52
Плановое тех. Обслуживание	2019-04-23	81126.00	29	53
Ремонт подвески	2019-05-02	46443.00	5	54
Ремонт двигателя	2019-05-11	33639.00	23	55
Балансировка колес	2019-05-20	85903.00	11	56
Обслуживание трансмиссии	2019-05-29	66051.00	38	57
Плановое тех. Обслуживание	2019-06-07	77594.00	24	58
Ремонт подвески	2019-06-16	90070.00	28	59
Ремонт двигателя	2019-06-25	85997.00	13	60
Балансировка колес	2019-07-04	9953.00	38	61
Обслуживание трансмиссии	2019-07-13	91829.00	29	62
Плановое тех. Обслуживание	2019-07-22	57151.00	20	63
Ремонт подвески	2019-07-31	45088.00	4	64
Ремонт двигателя	2019-08-09	80988.00	37	65
Балансировка колес	2019-08-18	69979.00	29	66
Обслуживание трансмиссии	2019-08-27	6958.00	28	67
Плановое тех. Обслуживание	2019-09-05	5745.00	23	68
Ремонт подвески	2019-09-14	25511.00	10	69
Ремонт двигателя	2019-09-23	56982.00	36	70
Плановое тех. Обслуживание	2019-10-02	43247.00	25	71
Плановое тех. Обслуживание	2019-10-11	43432.00	25	72
Плановое тех. Обслуживание	2019-10-20	12884.00	15	73
Ремонт подвески	2019-10-29	33441.00	32	74
Ремонт двигателя	2019-11-07	54409.00	34	75
Балансировка колес	2019-11-16	10499.00	15	76
Обслуживание трансмиссии	2019-11-25	56586.00	27	77
Плановое тех. Обслуживание	2019-12-04	28368.00	16	78
Ремонт подвески	2019-12-13	17669.00	2	79
Ремонт двигателя	2019-12-22	32388.00	16	80
Балансировка колес	2019-12-31	29250.00	31	81
Обслуживание трансмиссии	2020-01-09	45610.00	28	82
Плановое тех. Обслуживание	2020-01-18	21614.00	26	83
Ремонт подвески	2020-01-27	41441.00	39	84
Ремонт двигателя	2020-02-05	36965.00	20	85
Балансировка колес	2020-02-14	21349.00	39	86
Обслуживание трансмиссии	2020-02-23	48394.00	23	87
Плановое тех. Обслуживание	2020-03-03	98265.00	15	88
Ремонт подвески	2020-03-12	42166.00	11	89
Ремонт двигателя	2020-03-21	42984.00	8	90
Балансировка колес	2020-03-30	36740.00	39	91
Обслуживание трансмиссии	2020-04-08	73676.00	32	92
Плановое тех. Обслуживание	2020-04-17	51840.00	10	93
Ремонт подвески	2020-04-26	92419.00	36	94
Ремонт двигателя	2020-05-05	98521.00	26	95
Балансировка колес	2020-05-14	31481.00	2	96
Обслуживание трансмиссии	2020-05-23	88437.00	28	97
Плановое тех. Обслуживание	2020-06-01	85779.00	34	98
Плановое тех. Обслуживание	2020-06-10	81519.00	36	99
Ремонт двигателя	2020-06-19	32158.00	34	100
Балансировка колес	2020-06-28	17421.00	5	101
Обслуживание трансмиссии	2020-07-07	28369.00	10	102
Плановое тех. Обслуживание	2020-07-16	33072.00	16	103
Ремонт подвески	2020-07-25	19316.00	24	104
Ремонт двигателя	2020-08-03	64070.00	22	105
Балансировка колес	2020-08-12	76410.00	13	106
Обслуживание трансмиссии	2020-08-21	96901.00	8	107
Плановое тех. Обслуживание	2020-08-30	12922.00	34	108
Ремонт подвески	2020-09-08	77296.00	16	109
Ремонт двигателя	2020-09-17	70630.00	16	110
Балансировка колес	2020-09-26	40413.00	37	111
Обслуживание трансмиссии	2020-10-05	89413.00	27	112
Плановое тех. Обслуживание	2020-10-14	64304.00	4	113
Плановое тех. Обслуживание	2020-10-23	14589.00	31	114
Ремонт двигателя	2020-11-01	52029.00	30	115
Плановое тех. Обслуживание	2020-11-10	89793.00	21	116
Обслуживание трансмиссии	2020-11-19	55646.00	28	117
Плановое тех. Обслуживание	2020-11-28	62882.00	2	118
Ремонт подвески	2020-12-07	66160.00	7	119
Ремонт двигателя	2020-12-16	25208.00	12	120
Балансировка колес	2020-12-25	54199.00	20	121
Обслуживание трансмиссии	2021-01-03	12146.00	1	122
Плановое тех. Обслуживание	2021-01-12	84264.00	18	123
Ремонт подвески	2021-01-21	78691.00	26	124
Ремонт двигателя	2021-01-30	6705.00	29	125
Балансировка колес	2021-02-08	51903.00	39	126
Обслуживание трансмиссии	2021-02-17	47525.00	26	127
Плановое тех. Обслуживание	2021-02-26	41783.00	37	128
Ремонт подвески	2021-03-07	61663.00	18	129
Ремонт двигателя	2021-03-16	50955.00	13	130
Балансировка колес	2021-03-25	68285.00	10	131
Обслуживание трансмиссии	2021-04-03	80595.00	7	132
Плановое тех. Обслуживание	2021-04-12	7845.00	36	133
Ремонт подвески	2021-04-21	63048.00	10	134
Ремонт двигателя	2021-04-30	5435.00	3	135
Балансировка колес	2021-05-09	44956.00	30	136
Обслуживание трансмиссии	2021-05-18	48738.00	9	137
Плановое тех. Обслуживание	2021-05-27	57726.00	30	138
Ремонт подвески	2021-06-05	32036.00	28	139
Ремонт двигателя	2021-06-14	58297.00	21	140
Плановое тех. Обслуживание	2021-06-23	80687.00	27	141
Плановое тех. Обслуживание	2021-07-02	77092.00	38	142
Плановое тех. Обслуживание	2021-07-11	35293.00	31	143
Ремонт подвески	2021-07-20	81417.00	22	144
Ремонт двигателя	2021-07-29	49393.00	8	145
Балансировка колес	2021-08-07	91305.00	24	146
Обслуживание трансмиссии	2021-08-16	53119.00	19	147
Плановое тех. Обслуживание	2021-08-25	72245.00	35	148
Ремонт подвески	2021-09-03	64126.00	6	149
Ремонт двигателя	2021-09-12	77614.00	4	150
Балансировка колес	2021-09-21	27646.00	17	151
Обслуживание трансмиссии	2021-09-30	71091.00	21	152
Плановое тех. Обслуживание	2021-10-09	56775.00	23	153
Ремонт подвески	2021-10-18	61738.00	11	154
Ремонт двигателя	2021-10-27	14665.00	26	155
Балансировка колес	2021-11-05	36156.00	4	156
Обслуживание трансмиссии	2021-11-14	72163.00	37	157
Плановое тех. Обслуживание	2021-11-23	19359.00	9	158
Ремонт подвески	2021-12-02	41589.00	37	159
Ремонт двигателя	2021-12-11	62568.00	13	160
Плановое тех. Обслуживание	2021-12-20	35065.00	32	161
Плановое тех. Обслуживание	2021-12-29	76005.00	28	162
Плановое тех. Обслуживание	2022-01-07	61007.00	40	163
Ремонт подвески	2022-01-16	58718.00	39	164
Ремонт двигателя	2022-01-25	92716.00	37	165
Балансировка колес	2022-02-03	51798.00	31	166
Обслуживание трансмиссии	2022-02-12	81390.00	17	167
Плановое тех. Обслуживание	2022-02-21	55601.00	39	168
Ремонт подвески	2022-03-02	37270.00	36	169
Ремонт двигателя	2022-03-11	30980.00	12	170
Балансировка колес	2022-03-20	38124.00	7	171
Обслуживание трансмиссии	2022-03-29	53223.00	30	172
Плановое тех. Обслуживание	2022-04-07	39848.00	5	173
Ремонт подвески	2022-04-16	72834.00	9	174
Ремонт двигателя	2022-04-25	80951.00	3	175
Балансировка колес	2022-05-04	86742.00	1	176
Обслуживание трансмиссии	2022-05-13	59375.00	33	177
Плановое тех. Обслуживание	2022-05-22	67457.00	26	178
Ремонт подвески	2022-05-31	34014.00	36	179
Ремонт двигателя	2022-06-09	5541.00	30	180
Балансировка колес	2022-06-18	30800.00	9	181
Обслуживание трансмиссии	2022-06-27	8848.00	34	182
Плановое тех. Обслуживание	2022-07-06	20746.00	29	183
Ремонт подвески	2022-07-15	97048.00	8	184
Ремонт двигателя	2022-07-24	76241.00	27	185
Балансировка колес	2022-08-02	92895.00	40	186
Обслуживание трансмиссии	2022-08-11	53467.00	33	187
Плановое тех. Обслуживание	2022-08-20	21204.00	16	188
Плановое тех. Обслуживание	2022-08-29	25771.00	21	189
Плановое тех. Обслуживание	2022-09-07	76238.00	32	190
Плановое тех. Обслуживание	2022-09-16	20972.00	14	191
Плановое тех. Обслуживание	2022-09-25	38419.00	20	192
Плановое тех. Обслуживание	2022-10-04	45428.00	12	193
Ремонт подвески	2022-10-13	73168.00	4	194
Ремонт двигателя	2022-10-22	63367.00	28	195
Балансировка колес	2022-10-31	90149.00	38	196
Обслуживание трансмиссии	2022-11-09	30972.00	11	197
Плановое тех. Обслуживание	2022-11-18	65486.00	20	198
Ремонт подвески	2022-11-27	31699.00	6	199
Ремонт двигателя	2022-12-06	44966.00	33	200
Балансировка колес	2022-12-15	48153.00	30	201
Обслуживание трансмиссии	2022-12-24	78729.00	1	202
Плановое тех. Обслуживание	2023-01-02	16559.00	15	203
Ремонт подвески	2023-01-11	56675.00	11	204
Ремонт двигателя	2023-01-20	73738.00	6	205
Балансировка колес	2023-01-29	6810.00	8	206
Обслуживание трансмиссии	2023-02-07	24665.00	38	207
Плановое тех. Обслуживание	2023-02-16	83943.00	12	208
Ремонт подвески	2023-02-25	83367.00	32	209
Ремонт двигателя	2023-03-06	46499.00	23	210
Балансировка колес	2023-03-15	79716.00	18	211
Обслуживание трансмиссии	2023-03-24	6191.00	35	212
Плановое тех. Обслуживание	2023-04-02	78509.00	37	213
Ремонт подвески	2023-04-11	58378.00	10	214
Ремонт двигателя	2023-04-20	20727.00	30	215
Балансировка колес	2023-04-29	70012.00	34	216
Обслуживание трансмиссии	2023-05-08	68787.00	32	217
Плановое тех. Обслуживание	2023-05-17	53622.00	2	218
Ремонт подвески	2023-05-26	81614.00	29	219
Ремонт двигателя	2023-06-04	51697.00	29	220
Балансировка колес	2023-06-13	83249.00	33	221
Обслуживание трансмиссии	2023-06-22	32267.00	21	222
Плановое тех. Обслуживание	2023-07-01	77044.00	30	223
Ремонт подвески	2023-07-10	77999.00	38	224
Ремонт двигателя	2023-07-19	45165.00	29	225
Балансировка колес	2023-07-28	24421.00	31	226
Плановое тех. Обслуживание	2023-08-06	93752.00	13	227
Плановое тех. Обслуживание	2023-08-15	93876.00	37	228
Ремонт подвески	2023-08-24	10115.00	13	229
Плановое тех. Обслуживание	2023-09-02	70387.00	21	230
Балансировка колес	2023-09-11	44902.00	8	231
Обслуживание трансмиссии	2023-09-20	85157.00	7	232
Плановое тех. Обслуживание	2023-09-29	41515.00	32	233
Ремонт подвески	2023-10-08	58209.00	32	234
Ремонт двигателя	2023-10-17	75189.00	14	235
Балансировка колес	2023-10-26	99955.00	19	236
Обслуживание трансмиссии	2023-11-04	73949.00	13	237
Плановое тех. Обслуживание	2023-11-13	44832.00	8	238
Ремонт подвески	2023-11-22	24540.00	17	239
Ремонт двигателя	2023-12-01	39891.00	30	240
Балансировка колес	2023-12-10	12341.00	13	241
Обслуживание трансмиссии	2023-12-19	26610.00	11	242
Плановое тех. Обслуживание	2023-12-28	32316.00	6	243
Ремонт подвески	2024-01-06	32858.00	20	244
Ремонт двигателя	2024-01-15	31998.00	24	245
Балансировка колес	2024-01-24	85242.00	2	246
Обслуживание трансмиссии	2024-02-02	58931.00	22	247
Плановое тех. Обслуживание	2024-02-11	13470.00	17	248
Ремонт подвески	2024-02-20	79273.00	27	249
Ремонт двигателя	2024-02-29	53934.00	3	250
Балансировка колес	2024-03-09	63081.00	27	251
Обслуживание трансмиссии	2024-03-18	56251.00	18	252
Плановое тех. Обслуживание	2024-03-27	27195.00	38	253
Плановое тех. Обслуживание	2024-04-05	74282.00	23	254
Ремонт двигателя	2024-04-14	59414.00	9	255
Плановое тех. Обслуживание	2024-04-23	45326.00	16	256
Обслуживание трансмиссии	2024-05-02	83737.00	15	257
Плановое тех. Обслуживание	2024-05-11	60340.00	18	258
Ремонт подвески	2024-05-20	62711.00	16	259
Ремонт двигателя	2024-05-29	7608.00	28	260
Балансировка колес	2024-06-07	21093.00	28	261
Обслуживание трансмиссии	2024-06-16	32336.00	14	262
Плановое тех. Обслуживание	2024-06-25	20313.00	11	263
Ремонт подвески	2024-07-04	50745.00	10	264
Ремонт двигателя	2024-07-13	56075.00	13	265
Балансировка колес	2024-07-22	81407.00	5	266
Обслуживание трансмиссии	2024-07-31	9450.00	2	267
Плановое тех. Обслуживание	2024-08-09	76792.00	28	268
Ремонт подвески	2024-08-18	5158.00	4	269
Ремонт двигателя	2024-08-27	22606.00	23	270
Плановое тех. Обслуживание	2024-09-05	51863.00	21	271
Плановое тех. Обслуживание	2024-09-14	84505.00	6	272
Плановое тех. Обслуживание	2024-09-23	66111.00	16	273
Ремонт подвески	2024-10-02	41118.00	33	274
Ремонт двигателя	2024-10-11	77597.00	16	275
\.


--
-- Name: cargo_cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.cargo_cargo_id_seq', 1, false);


--
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.cars_car_id_seq', 1, false);


--
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);


--
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.drivers_driver_id_seq', 1, false);


--
-- Name: gas_gas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.gas_gas_id_seq', 1, false);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);


--
-- Name: service_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: my_user
--

SELECT pg_catalog.setval('public.service_service_id_seq', 1, false);


--
-- Name: cargo cargo_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pk PRIMARY KEY (cargo_id);


--
-- Name: cars cars_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pk PRIMARY KEY (car_id);


--
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);


--
-- Name: drivers drivers_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pk PRIMARY KEY (driver_id);


--
-- Name: gas gas_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.gas
    ADD CONSTRAINT gas_pk PRIMARY KEY (gas_id);


--
-- Name: gas_type_cost gas_type_cost_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.gas_type_cost
    ADD CONSTRAINT gas_type_cost_pk PRIMARY KEY (gas_type2);


--
-- Name: orders order_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pk PRIMARY KEY (order_id);


--
-- Name: service service_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pk PRIMARY KEY (service_id);


--
-- Name: drivers drivers_cars_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_cars_fk FOREIGN KEY (car_id) REFERENCES public.cars(car_id);


--
-- Name: gas gas_cars_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.gas
    ADD CONSTRAINT gas_cars_fk FOREIGN KEY (car_id) REFERENCES public.cars(car_id);


--
-- Name: orders order_cargo_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_cargo_fk FOREIGN KEY (cargo_id) REFERENCES public.cargo(cargo_id);


--
-- Name: orders order_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_client_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: orders order_drivers_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_drivers_fk FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id);


--
-- Name: service service_cars_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_cars_fk FOREIGN KEY (car_id) REFERENCES public.cars(car_id);


--
-- PostgreSQL database dump complete
--

