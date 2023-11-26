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




-- Completed on 2023-11-13 21:33:38

--
-- PostgreSQL database dump complete
--

