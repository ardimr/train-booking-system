--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.5

-- Started on 2023-11-13 21:33:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 11 (class 2615 OID 25054)
-- Name: accounts; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA accounts;


--
-- TOC entry 7 (class 2615 OID 24801)
-- Name: assets; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA assets;


--
-- TOC entry 10 (class 2615 OID 24993)
-- Name: bookings; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA bookings;


--
-- TOC entry 8 (class 2615 OID 24916)
-- Name: finances; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA finances;


--
-- TOC entry 6 (class 2615 OID 24729)
-- Name: travel_schedules; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA travel_schedules;


--
-- TOC entry 9 (class 2615 OID 24934)
-- Name: users; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA users;


--
-- TOC entry 254 (class 1255 OID 24959)
-- Name: update_updated_on_user_task(); Type: FUNCTION; Schema: users; Owner: -
--

CREATE FUNCTION users.update_updated_on_user_task() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.users.users.updated_at = now();
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 244 (class 1259 OID 25056)
-- Name: user_account; Type: TABLE; Schema: accounts; Owner: -
--

CREATE TABLE accounts.user_account (
    user_account_id integer NOT NULL,
    owner integer,
    balance integer,
    currency_code character(3)
);


--
-- TOC entry 243 (class 1259 OID 25055)
-- Name: user_account_user_account_id_seq; Type: SEQUENCE; Schema: accounts; Owner: -
--

CREATE SEQUENCE accounts.user_account_user_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_account_user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: accounts; Owner: -
--

ALTER SEQUENCE accounts.user_account_user_account_id_seq OWNED BY accounts.user_account.user_account_id;


--
-- TOC entry 238 (class 1259 OID 24994)
-- Name: bookings; Type: TABLE; Schema: bookings; Owner: -
--

CREATE TABLE bookings.bookings (
    booking_code character(7) NOT NULL,
    status character varying,
    book_time timestamp without time zone DEFAULT now(),
    total_amount numeric(10,2)
);


--
-- TOC entry 242 (class 1259 OID 25030)
-- Name: passengers; Type: TABLE; Schema: bookings; Owner: -
--

CREATE TABLE bookings.passengers (
    passenger_id integer NOT NULL,
    passenger_name character varying,
    passenger_id_type integer,
    passenger_id_number character varying,
    ticket_id integer,
    seat_id integer,
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 241 (class 1259 OID 25029)
-- Name: passengers_passenger_id_seq; Type: SEQUENCE; Schema: bookings; Owner: -
--

CREATE SEQUENCE bookings.passengers_passenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 241
-- Name: passengers_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: -
--

ALTER SEQUENCE bookings.passengers_passenger_id_seq OWNED BY bookings.passengers.passenger_id;


--
-- TOC entry 240 (class 1259 OID 25002)
-- Name: tickets; Type: TABLE; Schema: bookings; Owner: -
--

CREATE TABLE bookings.tickets (
    ticket_id integer NOT NULL,
    travel_id integer,
    user_id integer,
    booking_code character(7),
    created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 239 (class 1259 OID 25001)
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: bookings; Owner: -
--

CREATE SEQUENCE bookings.tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 239
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: -
--

ALTER SEQUENCE bookings.tickets_ticket_id_seq OWNED BY bookings.tickets.ticket_id;


--
-- TOC entry 233 (class 1259 OID 24922)
-- Name: currencies; Type: TABLE; Schema: finances; Owner: -
--

CREATE TABLE finances.currencies (
    currency_code character(3) NOT NULL,
    name character varying
);


--
-- TOC entry 247 (class 1259 OID 25127)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 223 (class 1259 OID 24742)
-- Name: cities; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.cities (
    city_code character(3) NOT NULL,
    name character varying
);


--
-- TOC entry 228 (class 1259 OID 24813)
-- Name: classes; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.classes (
    id integer NOT NULL,
    class_code character varying,
    name character varying
);


--
-- TOC entry 227 (class 1259 OID 24812)
-- Name: classes_id_seq; Type: SEQUENCE; Schema: travel_schedules; Owner: -
--

CREATE SEQUENCE travel_schedules.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 227
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.classes_id_seq OWNED BY travel_schedules.classes.id;


--
-- TOC entry 230 (class 1259 OID 24820)
-- Name: seats; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.seats (
    seat_id integer NOT NULL,
    seat_row smallint,
    seat_column character(1),
    train_car_id smallint
);


--
-- TOC entry 229 (class 1259 OID 24819)
-- Name: seats_id_seq; Type: SEQUENCE; Schema: travel_schedules; Owner: -
--

CREATE SEQUENCE travel_schedules.seats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 229
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.seats_id_seq OWNED BY travel_schedules.seats.seat_id;


--
-- TOC entry 222 (class 1259 OID 24735)
-- Name: stations; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.stations (
    station_code character(3) NOT NULL,
    name character varying,
    city_code character(3)
);


--
-- TOC entry 226 (class 1259 OID 24808)
-- Name: train_cars; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.train_cars (
    train_car_id integer NOT NULL,
    train_code character(3),
    capacity smallint,
    class_id integer,
    train_car_no smallint
);


--
-- TOC entry 224 (class 1259 OID 24802)
-- Name: trains; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.trains (
    train_code character(3) NOT NULL,
    name character varying
);


--
-- TOC entry 232 (class 1259 OID 24849)
-- Name: travel_fares; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.travel_fares (
    travel_fare_id integer NOT NULL,
    travel_id integer,
    fare integer,
    class_id integer,
    currency_code character(3)
);


--
-- TOC entry 231 (class 1259 OID 24848)
-- Name: travel_costs_id_seq; Type: SEQUENCE; Schema: travel_schedules; Owner: -
--

CREATE SEQUENCE travel_schedules.travel_costs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 231
-- Name: travel_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.travel_costs_id_seq OWNED BY travel_schedules.travel_fares.travel_fare_id;


--
-- TOC entry 221 (class 1259 OID 24731)
-- Name: travels; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.travels (
    travel_id integer NOT NULL,
    travel_code character(3),
    departure_schedule timestamp with time zone,
    arrival_schedule timestamp with time zone,
    departure_station character(3),
    destination_station character(3),
    train_code character(3)
);


--
-- TOC entry 220 (class 1259 OID 24730)
-- Name: travel_travel_id_seq; Type: SEQUENCE; Schema: travel_schedules; Owner: -
--

CREATE SEQUENCE travel_schedules.travel_travel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 220
-- Name: travel_travel_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.travel_travel_id_seq OWNED BY travel_schedules.travels.travel_id;


--
-- TOC entry 225 (class 1259 OID 24807)
-- Name: untitled_table_213_id_seq; Type: SEQUENCE; Schema: travel_schedules; Owner: -
--

CREATE SEQUENCE travel_schedules.untitled_table_213_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 225
-- Name: untitled_table_213_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.untitled_table_213_id_seq OWNED BY travel_schedules.train_cars.train_car_id;


--
-- TOC entry 237 (class 1259 OID 24945)
-- Name: id_types; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.id_types (
    id_type_id integer NOT NULL,
    name character varying
);


--
-- TOC entry 236 (class 1259 OID 24944)
-- Name: id_types_id_type_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.id_types_id_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 236
-- Name: id_types_id_type_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.id_types_id_type_id_seq OWNED BY users.id_types.id_type_id;


--
-- TOC entry 251 (class 1259 OID 25160)
-- Name: permissions; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.permissions (
    id integer NOT NULL,
    action character varying
);


--
-- TOC entry 250 (class 1259 OID 25159)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 250
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.permissions_id_seq OWNED BY users.permissions.id;


--
-- TOC entry 253 (class 1259 OID 25167)
-- Name: role_permissions; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.role_permissions (
    id integer NOT NULL,
    role_id integer,
    permission_id integer
);


--
-- TOC entry 252 (class 1259 OID 25166)
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 252
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.role_permissions_id_seq OWNED BY users.role_permissions.id;


--
-- TOC entry 246 (class 1259 OID 25112)
-- Name: roles; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.roles (
    id integer NOT NULL,
    name character varying
);


--
-- TOC entry 245 (class 1259 OID 25111)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 245
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.roles_id_seq OWNED BY users.roles.id;


--
-- TOC entry 249 (class 1259 OID 25140)
-- Name: user_roles; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


--
-- TOC entry 248 (class 1259 OID 25139)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.user_roles_id_seq OWNED BY users.user_roles.id;


--
-- TOC entry 235 (class 1259 OID 24936)
-- Name: users; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.users (
    user_id integer NOT NULL,
    username character varying,
    email character varying,
    fullname character varying,
    password character varying,
    phone_number character varying,
    id_type integer,
    id_number character varying,
    born_date date,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 234 (class 1259 OID 24935)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.users_user_id_seq OWNED BY users.users.user_id;


--
-- TOC entry 3283 (class 2604 OID 25059)
-- Name: user_account user_account_id; Type: DEFAULT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account ALTER COLUMN user_account_id SET DEFAULT nextval('accounts.user_account_user_account_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 25033)
-- Name: passengers passenger_id; Type: DEFAULT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers ALTER COLUMN passenger_id SET DEFAULT nextval('bookings.passengers_passenger_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 25005)
-- Name: tickets ticket_id; Type: DEFAULT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('bookings.tickets_ticket_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 24816)
-- Name: classes id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.classes ALTER COLUMN id SET DEFAULT nextval('travel_schedules.classes_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 24823)
-- Name: seats seat_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.seats ALTER COLUMN seat_id SET DEFAULT nextval('travel_schedules.seats_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 24811)
-- Name: train_cars train_car_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars ALTER COLUMN train_car_id SET DEFAULT nextval('travel_schedules.untitled_table_213_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 24852)
-- Name: travel_fares travel_fare_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travel_fares ALTER COLUMN travel_fare_id SET DEFAULT nextval('travel_schedules.travel_costs_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 24734)
-- Name: travels travel_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels ALTER COLUMN travel_id SET DEFAULT nextval('travel_schedules.travel_travel_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 24948)
-- Name: id_types id_type_id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.id_types ALTER COLUMN id_type_id SET DEFAULT nextval('users.id_types_id_type_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 25163)
-- Name: permissions id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.permissions ALTER COLUMN id SET DEFAULT nextval('users.permissions_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 25170)
-- Name: role_permissions id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_permissions ALTER COLUMN id SET DEFAULT nextval('users.role_permissions_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 25115)
-- Name: roles id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.roles ALTER COLUMN id SET DEFAULT nextval('users.roles_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 25143)
-- Name: user_roles id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles ALTER COLUMN id SET DEFAULT nextval('users.user_roles_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 24939)
-- Name: users user_id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users ALTER COLUMN user_id SET DEFAULT nextval('users.users_user_id_seq'::regclass);


--
-- TOC entry 3500 (class 0 OID 25056)
-- Dependencies: 244
-- Data for Name: user_account; Type: TABLE DATA; Schema: accounts; Owner: -
--

INSERT INTO accounts.user_account VALUES (1, 1, 1000000, 'IDR');
INSERT INTO accounts.user_account VALUES (2, 2, 1000000, 'IDR');


--
-- TOC entry 3494 (class 0 OID 24994)
-- Dependencies: 238
-- Data for Name: bookings; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.bookings VALUES ('RM7AB12', 'PAID', NULL, 100000.00);
INSERT INTO bookings.bookings VALUES ('ARDIMR4', 'WAITING', '2023-07-17 13:16:24.547181', 150000.00);
INSERT INTO bookings.bookings VALUES ('TG5O6GM', 'PAID', '2023-07-26 15:11:15.381848', 150000.00);
INSERT INTO bookings.bookings VALUES ('21E3KKB', 'PAID', '2023-07-29 03:46:20.932391', 150000.00);
INSERT INTO bookings.bookings VALUES ('NOM6WG7', 'PAID', '2023-07-29 04:06:59.169774', 150000.00);
INSERT INTO bookings.bookings VALUES ('3PW90CL', 'PAID', '2023-07-29 04:12:05.554732', 150000.00);
INSERT INTO bookings.bookings VALUES ('XVMOLJ8', 'PAID', '2023-07-29 04:25:41.259083', 150000.00);
INSERT INTO bookings.bookings VALUES ('8K2JC2E', 'PAID', '2023-07-29 04:31:42.641549', 150000.00);
INSERT INTO bookings.bookings VALUES ('AW15SK2', 'PAID', '2023-07-29 04:49:28.611154', 150000.00);
INSERT INTO bookings.bookings VALUES ('R0IN724', 'PAID', '2023-10-19 13:52:34.739406', 150000.00);
INSERT INTO bookings.bookings VALUES ('9KLSP9J', 'PAID', '2023-10-19 14:14:02.061958', 150000.00);
INSERT INTO bookings.bookings VALUES ('GS6X9BL', 'PAID', '2023-10-19 14:19:29.741228', 150000.00);


--
-- TOC entry 3498 (class 0 OID 25030)
-- Dependencies: 242
-- Data for Name: passengers; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.passengers VALUES (3, 'Rizky Ardi Maulana', 1, '337602', 1, 1, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (4, 'Shiva Veronica Aulia', 1, '337601', 1, 2, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (5, 'Najwa Cahya', 1, '337603', 1, 3, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (6, 'Dharma', 1, '337890', 2, 5, '2023-07-17 13:22:48.284519');
INSERT INTO bookings.passengers VALUES (7, 'Rizky Ardi Maulana', 1, '3376020411990006', 4, 12, '2023-07-26 15:11:15.381848');
INSERT INTO bookings.passengers VALUES (8, 'Shifa Veronica Aulia', 1, '3376020411990007', 4, 13, '2023-07-26 15:11:15.381848');
INSERT INTO bookings.passengers VALUES (21, 'Rizky Ardi Maulana', 1, '337602123456789', 11, 2, '2023-10-19 13:52:34.739406');
INSERT INTO bookings.passengers VALUES (22, 'Shifa Veronica Aulia', 1, '3376020411123321', 12, 35, '2023-10-19 14:14:02.061958');
INSERT INTO bookings.passengers VALUES (23, 'Najwa Cahya', 1, '336736181273123', 13, 34, '2023-10-19 14:19:29.741228');


--
-- TOC entry 3496 (class 0 OID 25002)
-- Dependencies: 240
-- Data for Name: tickets; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.tickets VALUES (1, 1, 1, 'RM7AB12', '2023-07-17 13:05:15.302182');
INSERT INTO bookings.tickets VALUES (2, 2, 1, 'ARDIMR4', '2023-07-17 13:19:30.327731');
INSERT INTO bookings.tickets VALUES (4, 1, 2, 'TG5O6GM', '2023-07-26 15:11:15.381848');
INSERT INTO bookings.tickets VALUES (11, 17, 1, 'R0IN724', '2023-10-19 13:52:34.739406');
INSERT INTO bookings.tickets VALUES (12, 17, 1, '9KLSP9J', '2023-10-19 14:14:02.061958');
INSERT INTO bookings.tickets VALUES (13, 17, 1, 'GS6X9BL', '2023-10-19 14:19:29.741228');


--
-- TOC entry 3489 (class 0 OID 24922)
-- Dependencies: 233
-- Data for Name: currencies; Type: TABLE DATA; Schema: finances; Owner: -
--

INSERT INTO finances.currencies VALUES ('IDR', 'Rupiah');


--
-- TOC entry 3479 (class 0 OID 24742)
-- Dependencies: 223
-- Data for Name: cities; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.cities VALUES ('BDG', 'Bandung');
INSERT INTO travel_schedules.cities VALUES ('TGL', 'Tegal');
INSERT INTO travel_schedules.cities VALUES ('JKT', 'Jakarta');
INSERT INTO travel_schedules.cities VALUES ('CBN', 'Cirebon');
INSERT INTO travel_schedules.cities VALUES ('SMG', 'Semarang');
INSERT INTO travel_schedules.cities VALUES ('SKT', 'Surakarta');
INSERT INTO travel_schedules.cities VALUES ('YYK', 'Yogyakarta');
INSERT INTO travel_schedules.cities VALUES ('SBY', 'Surabaya');
INSERT INTO travel_schedules.cities VALUES ('MLG', 'Malang');


--
-- TOC entry 3484 (class 0 OID 24813)
-- Dependencies: 228
-- Data for Name: classes; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.classes VALUES (1, 'EKS', 'Excecutive');
INSERT INTO travel_schedules.classes VALUES (2, 'EKO', 'Economy');


--
-- TOC entry 3486 (class 0 OID 24820)
-- Dependencies: 230
-- Data for Name: seats; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.seats VALUES (1, 1, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (2, 1, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (3, 1, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (4, 1, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (5, 1, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (6, 1, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (7, 1, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (8, 1, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (10, 1, 'A', 3);
INSERT INTO travel_schedules.seats VALUES (11, 1, 'B', 3);
INSERT INTO travel_schedules.seats VALUES (12, 1, 'C', 3);
INSERT INTO travel_schedules.seats VALUES (13, 1, 'D', 3);
INSERT INTO travel_schedules.seats VALUES (14, 1, 'A', 4);
INSERT INTO travel_schedules.seats VALUES (15, 1, 'B', 4);
INSERT INTO travel_schedules.seats VALUES (16, 1, 'C', 4);
INSERT INTO travel_schedules.seats VALUES (17, 1, 'D', 4);
INSERT INTO travel_schedules.seats VALUES (18, 2, 'A', 5);
INSERT INTO travel_schedules.seats VALUES (19, 2, 'B', 5);
INSERT INTO travel_schedules.seats VALUES (20, 2, 'C', 5);
INSERT INTO travel_schedules.seats VALUES (21, 2, 'D', 5);
INSERT INTO travel_schedules.seats VALUES (22, 2, 'A', 6);
INSERT INTO travel_schedules.seats VALUES (23, 2, 'B', 6);
INSERT INTO travel_schedules.seats VALUES (24, 2, 'C', 6);
INSERT INTO travel_schedules.seats VALUES (25, 2, 'D', 6);
INSERT INTO travel_schedules.seats VALUES (26, 2, 'A', 7);
INSERT INTO travel_schedules.seats VALUES (27, 2, 'B', 7);
INSERT INTO travel_schedules.seats VALUES (28, 2, 'C', 7);
INSERT INTO travel_schedules.seats VALUES (29, 2, 'D', 7);
INSERT INTO travel_schedules.seats VALUES (30, 2, 'A', 8);
INSERT INTO travel_schedules.seats VALUES (31, 2, 'B', 8);
INSERT INTO travel_schedules.seats VALUES (32, 2, 'C', 8);
INSERT INTO travel_schedules.seats VALUES (33, 2, 'D', 8);
INSERT INTO travel_schedules.seats VALUES (34, 2, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (35, 2, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (36, 2, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (37, 2, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (42, 3, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (43, 3, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (44, 3, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (45, 3, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (46, 4, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (47, 4, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (48, 4, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (49, 5, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (50, 5, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (51, 5, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (52, 5, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (53, 6, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (54, 6, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (55, 6, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (56, 6, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (57, 7, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (58, 7, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (59, 7, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (60, 7, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (61, 8, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (62, 8, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (63, 8, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (64, 8, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (65, 9, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (66, 9, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (67, 9, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (68, 9, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (69, 10, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (70, 10, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (71, 10, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (72, 10, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (73, 11, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (77, 15, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (78, 15, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (79, 15, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (80, 15, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (81, 4, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (74, 11, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (75, 11, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (76, 11, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (82, 12, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (83, 12, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (84, 12, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (85, 12, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (86, 13, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (87, 13, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (88, 13, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (89, 13, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (90, 14, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (91, 14, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (92, 14, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (93, 14, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (143, 3, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (144, 3, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (145, 3, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (146, 3, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (147, 4, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (148, 4, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (149, 4, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (150, 5, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (151, 5, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (152, 5, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (153, 5, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (154, 6, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (155, 6, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (156, 6, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (157, 6, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (158, 7, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (159, 7, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (160, 7, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (161, 7, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (162, 8, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (163, 8, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (164, 8, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (165, 8, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (166, 9, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (167, 9, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (168, 9, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (169, 9, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (170, 10, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (171, 10, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (172, 10, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (173, 10, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (174, 11, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (175, 11, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (176, 11, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (177, 11, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (178, 15, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (179, 15, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (180, 15, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (181, 15, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (182, 4, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (183, 12, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (184, 12, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (185, 12, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (186, 12, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (187, 13, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (188, 13, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (189, 13, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (190, 13, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (191, 14, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (192, 14, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (193, 14, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (194, 14, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (195, 2, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (196, 2, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (197, 2, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (198, 2, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (203, 1, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (204, 1, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (205, 1, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (206, 1, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (207, 2, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (208, 2, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (209, 2, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (210, 2, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (211, 3, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (212, 3, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (213, 3, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (214, 3, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (215, 4, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (216, 4, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (217, 4, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (218, 4, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (219, 5, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (220, 5, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (221, 5, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (222, 5, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (223, 6, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (224, 6, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (225, 6, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (226, 6, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (227, 7, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (228, 7, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (229, 7, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (230, 7, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (231, 8, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (232, 8, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (233, 8, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (234, 8, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (235, 9, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (236, 9, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (237, 9, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (238, 9, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (239, 10, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (240, 10, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (241, 10, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (242, 10, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (243, 11, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (244, 11, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (245, 11, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (246, 11, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (247, 12, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (248, 12, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (249, 12, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (250, 12, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (251, 13, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (252, 13, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (253, 13, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (254, 13, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (255, 14, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (256, 14, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (257, 14, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (258, 14, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (259, 15, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (260, 15, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (261, 15, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (262, 15, 'D', 9);


--
-- TOC entry 3478 (class 0 OID 24735)
-- Dependencies: 222
-- Data for Name: stations; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.stations VALUES ('GMR', 'Gambir', 'JKT');
INSERT INTO travel_schedules.stations VALUES ('CN ', 'Cirebon', 'CBN');
INSERT INTO travel_schedules.stations VALUES ('CNP', 'Prujakan', 'CBN');
INSERT INTO travel_schedules.stations VALUES ('SMC', 'Semarang Poncol', 'SMG');
INSERT INTO travel_schedules.stations VALUES ('SMT', 'Semarang Tawang', 'SMG');
INSERT INTO travel_schedules.stations VALUES ('SLO', 'Solo Balapan', 'SKT');
INSERT INTO travel_schedules.stations VALUES ('SK ', 'Solo Jebres', 'SKT');
INSERT INTO travel_schedules.stations VALUES ('SGU', 'Surabaya Gubeng', 'SBY');
INSERT INTO travel_schedules.stations VALUES ('SBI', 'Surabaya Pasarturi', 'SBY');
INSERT INTO travel_schedules.stations VALUES ('YK ', 'Yogyakarta', 'YYK');
INSERT INTO travel_schedules.stations VALUES ('LPN', 'Lempuyangan', 'YYK');
INSERT INTO travel_schedules.stations VALUES ('ML ', 'Malang', 'MLG');
INSERT INTO travel_schedules.stations VALUES ('TG ', 'Tegal', 'TGL');
INSERT INTO travel_schedules.stations VALUES ('BD ', 'Bandung', 'BDG');


--
-- TOC entry 3482 (class 0 OID 24808)
-- Dependencies: 226
-- Data for Name: train_cars; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.train_cars VALUES (1, 'CIR', 10, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (2, 'CIR', 10, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (3, 'CIR', 20, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (4, 'CIR', 20, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (5, 'HAR', 15, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (6, 'HAR', 15, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (7, 'HAR', 25, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (8, 'HAR', 25, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (9, 'CIR', 60, 1, 3);


--
-- TOC entry 3480 (class 0 OID 24802)
-- Dependencies: 224
-- Data for Name: trains; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.trains VALUES ('CIR', 'Ciremai');
INSERT INTO travel_schedules.trains VALUES ('HAR', 'Harina');


--
-- TOC entry 3488 (class 0 OID 24849)
-- Dependencies: 232
-- Data for Name: travel_fares; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.travel_fares VALUES (1, 1, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (3, 2, 110000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (5, 1, 80000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (9, 2, 90000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (10, 3, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (11, 3, 100000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (12, 4, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (13, 4, 100000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (14, 5, 200000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (15, 5, 120000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (16, 6, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (17, 6, 80000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (18, 7, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (19, 7, 80000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (20, 8, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (21, 12, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (22, 13, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (23, 14, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (24, 16, 175000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (25, 16, 110000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (26, 17, 175000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (27, 17, 110000, 2, 'IDR');


--
-- TOC entry 3477 (class 0 OID 24731)
-- Dependencies: 221
-- Data for Name: travels; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.travels VALUES (2, '143', '2023-07-07 09:40:00+00', '2023-07-07 14:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (3, '126', '2023-07-07 20:25:00+00', '2023-07-08 01:32:00+00', 'BD ', 'TG ', 'HAR');
INSERT INTO travel_schedules.travels VALUES (5, '144', '2023-07-07 16:50:00+00', '2023-07-08 00:59:00+00', 'BD ', 'SMC', 'CIR');
INSERT INTO travel_schedules.travels VALUES (1, '144', '2023-07-07 16:50:00+00', '2023-07-07 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (6, '144', '2023-07-08 16:50:00+00', '2023-07-08 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (7, '144', '2023-07-09 16:50:00+00', '2023-07-09 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (4, '125', '2023-07-07 22:35:00+00', '2023-07-08 05:30:00+00', 'TG ', 'BD ', 'HAR');
INSERT INTO travel_schedules.travels VALUES (8, '144', '2023-09-07 16:50:00+00', '2023-09-07 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (16, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (13, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (14, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (17, '144', '2023-10-19 14:16:00+00', '2023-10-19 20:16:00+00', 'TG ', 'BD ', 'CIR');


--
-- TOC entry 3493 (class 0 OID 24945)
-- Dependencies: 237
-- Data for Name: id_types; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.id_types VALUES (1, 'KTP');
INSERT INTO users.id_types VALUES (2, 'SIM');
INSERT INTO users.id_types VALUES (3, 'Paspor');


--
-- TOC entry 3507 (class 0 OID 25160)
-- Dependencies: 251
-- Data for Name: permissions; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.permissions VALUES (1, 'GET');
INSERT INTO users.permissions VALUES (2, 'POST');
INSERT INTO users.permissions VALUES (3, 'DELETE');
INSERT INTO users.permissions VALUES (4, 'PUT');
INSERT INTO users.permissions VALUES (5, 'PATCH');


--
-- TOC entry 3509 (class 0 OID 25167)
-- Dependencies: 253
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.role_permissions VALUES (1, 1, 1);
INSERT INTO users.role_permissions VALUES (2, 1, 2);
INSERT INTO users.role_permissions VALUES (3, 1, 3);
INSERT INTO users.role_permissions VALUES (4, 1, 4);
INSERT INTO users.role_permissions VALUES (5, 1, 5);


--
-- TOC entry 3502 (class 0 OID 25112)
-- Dependencies: 246
-- Data for Name: roles; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.roles VALUES (1, 'admin');
INSERT INTO users.roles VALUES (2, 'user');


--
-- TOC entry 3505 (class 0 OID 25140)
-- Dependencies: 249
-- Data for Name: user_roles; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.user_roles VALUES (1, 1, 2);
INSERT INTO users.user_roles VALUES (2, 2, 2);


--
-- TOC entry 3491 (class 0 OID 24936)
-- Dependencies: 235
-- Data for Name: users; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.users VALUES (1, 'ardimr', 'ardi@gmail.com', 'Rizky Ardi Maulana', '$2a$04$piwEb1UECg22/dTEjED6puzMxfbkdkzwnrxbpesF.WHQQnxHoEZXC', '+628986983930', 1, '337602', '1999-11-04', '2023-07-08 11:16:21.472678', '2023-07-08 11:16:21.472678');
INSERT INTO users.users VALUES (2, 'shifava', 'shifa@gmail.com', 'Shifa Veronica Aulia', '$2a$04$7jhZb21NcIeFT484fHlY7ePP.Cvh0qJ0NN3HxF23m9k00L1P92v/q', '+62890123456', 1, '337601', '2000-07-07', '2023-07-08 11:25:40.787218', '2023-07-08 11:25:40.787218');
INSERT INTO users.users VALUES (4, 'shifavero', 'shifa@gmail.com', 'Shifa Veronica Aulia', '$2a$04$7jhZb21NcIeFT484fHlY7ePP.Cvh0qJ0NN3HxF23m9k00L1P92v/q', '+62890123456', 1, '337601', '2000-07-07', '2023-10-15 13:15:28.01111', '2023-10-15 13:15:28.01111');


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_account_user_account_id_seq; Type: SEQUENCE SET; Schema: accounts; Owner: -
--

SELECT pg_catalog.setval('accounts.user_account_user_account_id_seq', 2, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 241
-- Name: passengers_passenger_id_seq; Type: SEQUENCE SET; Schema: bookings; Owner: -
--

SELECT pg_catalog.setval('bookings.passengers_passenger_id_seq', 23, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 239
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: bookings; Owner: -
--

SELECT pg_catalog.setval('bookings.tickets_ticket_id_seq', 13, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 247
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 227
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.classes_id_seq', 2, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 229
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.seats_id_seq', 262, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 231
-- Name: travel_costs_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.travel_costs_id_seq', 27, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 220
-- Name: travel_travel_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.travel_travel_id_seq', 17, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 225
-- Name: untitled_table_213_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.untitled_table_213_id_seq', 9, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 236
-- Name: id_types_id_type_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.id_types_id_type_id_seq', 3, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 250
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.permissions_id_seq', 5, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 252
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.role_permissions_id_seq', 5, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 245
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.roles_id_seq', 3, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.user_roles_id_seq', 2, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.users_user_id_seq', 4, true);


--
-- TOC entry 3311 (class 2606 OID 25061)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_account_id);


--
-- TOC entry 3307 (class 2606 OID 25000)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_code);


--
-- TOC entry 3309 (class 2606 OID 25028)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 3301 (class 2606 OID 24926)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: finances; Owner: -
--

ALTER TABLE ONLY finances.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (currency_code);


--
-- TOC entry 3293 (class 2606 OID 24748)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_code);


--
-- TOC entry 3297 (class 2606 OID 24832)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 24903)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 3291 (class 2606 OID 24765)
-- Name: stations station_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_code);


--
-- TOC entry 3295 (class 2606 OID 24873)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_code);


--
-- TOC entry 3289 (class 2606 OID 24896)
-- Name: travels travels_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (travel_id);


--
-- TOC entry 3305 (class 2606 OID 24952)
-- Name: id_types id_types_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.id_types
    ADD CONSTRAINT id_types_pkey PRIMARY KEY (id_type_id);


--
-- TOC entry 3315 (class 2606 OID 25172)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 25119)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 24943)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3330 (class 2606 OID 25075)
-- Name: user_account user_account_currency_code_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 25070)
-- Name: user_account user_account_owner_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_owner_fkey FOREIGN KEY (owner) REFERENCES users.users(user_id);


--
-- TOC entry 3327 (class 2606 OID 25037)
-- Name: passengers passengers_passenger_id_type_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_passenger_id_type_fkey FOREIGN KEY (passenger_id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;


--
-- TOC entry 3328 (class 2606 OID 25047)
-- Name: passengers passengers_seat_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES travel_schedules.seats(seat_id) ON UPDATE CASCADE;


--
-- TOC entry 3329 (class 2606 OID 25042)
-- Name: passengers passengers_ticket_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES bookings.tickets(ticket_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3324 (class 2606 OID 25021)
-- Name: tickets tickets_booking_code_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_booking_code_fkey FOREIGN KEY (booking_code) REFERENCES bookings.bookings(booking_code) ON UPDATE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 25006)
-- Name: tickets tickets_travel_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES travel_schedules.travels(travel_id) ON UPDATE CASCADE;


--
-- TOC entry 3326 (class 2606 OID 25016)
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 24749)
-- Name: stations station_city_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_city_code_fkey FOREIGN KEY (city_code) REFERENCES travel_schedules.cities(city_code) ON UPDATE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 24833)
-- Name: train_cars train_cars_class_id_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_class_id_fkey FOREIGN KEY (class_id) REFERENCES travel_schedules.classes(id) ON UPDATE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 24874)
-- Name: train_cars train_cars_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 24927)
-- Name: travel_fares travel_costs_currency_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travel_fares
    ADD CONSTRAINT travel_costs_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 24782)
-- Name: travels travels_departure_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_departure_station_fkey FOREIGN KEY (departure_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 24790)
-- Name: travels travels_destination_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_destination_station_fkey FOREIGN KEY (destination_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 24879)
-- Name: travels travels_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 25146)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES users.roles(id);


--
-- TOC entry 3333 (class 2606 OID 25151)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id);


--
-- TOC entry 3323 (class 2606 OID 24953)
-- Name: users users_id_type_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_id_type_fkey FOREIGN KEY (id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;


-- Completed on 2023-11-13 21:33:38

--
-- PostgreSQL database dump complete
--

