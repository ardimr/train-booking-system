--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.5

-- Started on 2023-12-03 14:49:52

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
-- TOC entry 6 (class 2615 OID 16392)
-- Name: accounts; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA accounts;


--
-- TOC entry 7 (class 2615 OID 16393)
-- Name: assets; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA assets;


--
-- TOC entry 8 (class 2615 OID 16394)
-- Name: bookings; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA bookings;


--
-- TOC entry 9 (class 2615 OID 16395)
-- Name: finances; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA finances;


--
-- TOC entry 10 (class 2615 OID 16396)
-- Name: travel_schedules; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA travel_schedules;


--
-- TOC entry 11 (class 2615 OID 16397)
-- Name: users; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA users;


--
-- TOC entry 259 (class 1255 OID 16398)
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
-- TOC entry 221 (class 1259 OID 16399)
-- Name: user_account; Type: TABLE; Schema: accounts; Owner: -
--

CREATE TABLE accounts.user_account (
    user_account_id integer NOT NULL,
    owner integer,
    balance integer,
    currency_code character(3)
);


--
-- TOC entry 222 (class 1259 OID 16402)
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
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_account_user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: accounts; Owner: -
--

ALTER SEQUENCE accounts.user_account_user_account_id_seq OWNED BY accounts.user_account.user_account_id;


--
-- TOC entry 223 (class 1259 OID 16403)
-- Name: bookings; Type: TABLE; Schema: bookings; Owner: -
--

CREATE TABLE bookings.bookings (
    booking_code character(7) NOT NULL,
    status character varying,
    book_time timestamp without time zone DEFAULT now(),
    total_amount numeric(10,2)
);


--
-- TOC entry 224 (class 1259 OID 16409)
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
-- TOC entry 225 (class 1259 OID 16415)
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
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 225
-- Name: passengers_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: -
--

ALTER SEQUENCE bookings.passengers_passenger_id_seq OWNED BY bookings.passengers.passenger_id;


--
-- TOC entry 226 (class 1259 OID 16416)
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
-- TOC entry 227 (class 1259 OID 16420)
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
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 227
-- Name: tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: -
--

ALTER SEQUENCE bookings.tickets_ticket_id_seq OWNED BY bookings.tickets.ticket_id;


--
-- TOC entry 228 (class 1259 OID 16421)
-- Name: currencies; Type: TABLE; Schema: finances; Owner: -
--

CREATE TABLE finances.currencies (
    currency_code character(3) NOT NULL,
    name character varying
);

--
-- TOC entry 229 (class 1259 OID 16426)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 16427)
-- Name: cities; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.cities (
    city_code character(3) NOT NULL,
    name character varying
);


--
-- TOC entry 231 (class 1259 OID 16432)
-- Name: classes; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.classes (
    id integer NOT NULL,
    class_code character varying,
    name character varying
);


--
-- TOC entry 232 (class 1259 OID 16437)
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
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 232
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.classes_id_seq OWNED BY travel_schedules.classes.id;


--
-- TOC entry 233 (class 1259 OID 16438)
-- Name: seats; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.seats (
    seat_id integer NOT NULL,
    seat_row smallint,
    seat_column character(1),
    train_car_id smallint
);


--
-- TOC entry 234 (class 1259 OID 16441)
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
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 234
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.seats_id_seq OWNED BY travel_schedules.seats.seat_id;


--
-- TOC entry 235 (class 1259 OID 16442)
-- Name: stations; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.stations (
    station_code character(3) NOT NULL,
    name character varying,
    city_code character(3)
);


--
-- TOC entry 236 (class 1259 OID 16447)
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
-- TOC entry 237 (class 1259 OID 16450)
-- Name: trains; Type: TABLE; Schema: travel_schedules; Owner: -
--

CREATE TABLE travel_schedules.trains (
    train_code character(3) NOT NULL,
    name character varying
);


--
-- TOC entry 238 (class 1259 OID 16455)
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
-- TOC entry 239 (class 1259 OID 16458)
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
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 239
-- Name: travel_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.travel_costs_id_seq OWNED BY travel_schedules.travel_fares.travel_fare_id;


--
-- TOC entry 240 (class 1259 OID 16459)
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
-- TOC entry 241 (class 1259 OID 16462)
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
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 241
-- Name: travel_travel_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.travel_travel_id_seq OWNED BY travel_schedules.travels.travel_id;


--
-- TOC entry 242 (class 1259 OID 16463)
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
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 242
-- Name: untitled_table_213_id_seq; Type: SEQUENCE OWNED BY; Schema: travel_schedules; Owner: -
--

ALTER SEQUENCE travel_schedules.untitled_table_213_id_seq OWNED BY travel_schedules.train_cars.train_car_id;


--
-- TOC entry 243 (class 1259 OID 16464)
-- Name: id_types; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.id_types (
    id_type_id integer NOT NULL,
    name character varying
);


--
-- TOC entry 244 (class 1259 OID 16469)
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
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 244
-- Name: id_types_id_type_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.id_types_id_type_id_seq OWNED BY users.id_types.id_type_id;


--
-- TOC entry 245 (class 1259 OID 16470)
-- Name: permissions; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.permissions (
    id integer NOT NULL,
    action character varying
);


--
-- TOC entry 246 (class 1259 OID 16475)
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
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 246
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.permissions_id_seq OWNED BY users.permissions.id;


--
-- TOC entry 256 (class 1259 OID 16642)
-- Name: resources; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.resources (
    id integer NOT NULL,
    name character varying
);


--
-- TOC entry 255 (class 1259 OID 16641)
-- Name: resources_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 255
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.resources_id_seq OWNED BY users.resources.id;


--
-- TOC entry 247 (class 1259 OID 16476)
-- Name: role_permissions; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.role_permissions (
    id integer NOT NULL,
    role_id integer,
    permission_id integer
);


--
-- TOC entry 248 (class 1259 OID 16479)
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
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 248
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.role_permissions_id_seq OWNED BY users.role_permissions.id;


--
-- TOC entry 258 (class 1259 OID 16651)
-- Name: role_resource_permissions; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.role_resource_permissions (
    id integer NOT NULL,
    role_id integer,
    resource_id integer,
    permission_id integer
);


--
-- TOC entry 257 (class 1259 OID 16650)
-- Name: role_resources_permissions_id_seq; Type: SEQUENCE; Schema: users; Owner: -
--

CREATE SEQUENCE users.role_resources_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 257
-- Name: role_resources_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.role_resources_permissions_id_seq OWNED BY users.role_resource_permissions.id;


--
-- TOC entry 249 (class 1259 OID 16480)
-- Name: roles; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.roles (
    id integer NOT NULL,
    name character varying
);


--
-- TOC entry 250 (class 1259 OID 16485)
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
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 250
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.roles_id_seq OWNED BY users.roles.id;


--
-- TOC entry 251 (class 1259 OID 16486)
-- Name: user_roles; Type: TABLE; Schema: users; Owner: -
--

CREATE TABLE users.user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


--
-- TOC entry 252 (class 1259 OID 16489)
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
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 252
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.user_roles_id_seq OWNED BY users.user_roles.id;


--
-- TOC entry 253 (class 1259 OID 16490)
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
-- TOC entry 254 (class 1259 OID 16497)
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
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 254
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: -
--

ALTER SEQUENCE users.users_user_id_seq OWNED BY users.users.user_id;


--
-- TOC entry 3283 (class 2604 OID 16498)
-- Name: user_account user_account_id; Type: DEFAULT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account ALTER COLUMN user_account_id SET DEFAULT nextval('accounts.user_account_user_account_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 16499)
-- Name: passengers passenger_id; Type: DEFAULT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers ALTER COLUMN passenger_id SET DEFAULT nextval('bookings.passengers_passenger_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 16500)
-- Name: tickets ticket_id; Type: DEFAULT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets ALTER COLUMN ticket_id SET DEFAULT nextval('bookings.tickets_ticket_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 16501)
-- Name: classes id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.classes ALTER COLUMN id SET DEFAULT nextval('travel_schedules.classes_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 16502)
-- Name: seats seat_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.seats ALTER COLUMN seat_id SET DEFAULT nextval('travel_schedules.seats_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 16503)
-- Name: train_cars train_car_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars ALTER COLUMN train_car_id SET DEFAULT nextval('travel_schedules.untitled_table_213_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 16504)
-- Name: travel_fares travel_fare_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travel_fares ALTER COLUMN travel_fare_id SET DEFAULT nextval('travel_schedules.travel_costs_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 16505)
-- Name: travels travel_id; Type: DEFAULT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels ALTER COLUMN travel_id SET DEFAULT nextval('travel_schedules.travel_travel_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 16506)
-- Name: id_types id_type_id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.id_types ALTER COLUMN id_type_id SET DEFAULT nextval('users.id_types_id_type_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 16507)
-- Name: permissions id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.permissions ALTER COLUMN id SET DEFAULT nextval('users.permissions_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 16645)
-- Name: resources id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.resources ALTER COLUMN id SET DEFAULT nextval('users.resources_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 16508)
-- Name: role_permissions id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_permissions ALTER COLUMN id SET DEFAULT nextval('users.role_permissions_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 16654)
-- Name: role_resource_permissions id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_resource_permissions ALTER COLUMN id SET DEFAULT nextval('users.role_resources_permissions_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 16509)
-- Name: roles id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.roles ALTER COLUMN id SET DEFAULT nextval('users.roles_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 16510)
-- Name: user_roles id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles ALTER COLUMN id SET DEFAULT nextval('users.user_roles_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 16511)
-- Name: users user_id; Type: DEFAULT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users ALTER COLUMN user_id SET DEFAULT nextval('users.users_user_id_seq'::regclass);


--
-- TOC entry 3307 (class 2606 OID 16517)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_account_id);


--
-- TOC entry 3309 (class 2606 OID 16519)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_code);


--
-- TOC entry 3311 (class 2606 OID 16521)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 3313 (class 2606 OID 16523)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: finances; Owner: -
--

ALTER TABLE ONLY finances.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (currency_code);

--
-- TOC entry 3315 (class 2606 OID 16525)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_code);


--
-- TOC entry 3317 (class 2606 OID 16527)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16529)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 3321 (class 2606 OID 16531)
-- Name: stations station_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_code);


--
-- TOC entry 3323 (class 2606 OID 16533)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_code);


--
-- TOC entry 3325 (class 2606 OID 16535)
-- Name: travels travels_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (travel_id);


--
-- TOC entry 3327 (class 2606 OID 16537)
-- Name: id_types id_types_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.id_types
    ADD CONSTRAINT id_types_pkey PRIMARY KEY (id_type_id);


--
-- TOC entry 3329 (class 2606 OID 16668)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16649)
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 16539)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16656)
-- Name: role_resource_permissions role_resources_permissions_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_resource_permissions
    ADD CONSTRAINT role_resources_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16541)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 16543)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3340 (class 2606 OID 16544)
-- Name: user_account user_account_currency_code_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 16549)
-- Name: user_account user_account_owner_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_owner_fkey FOREIGN KEY (owner) REFERENCES users.users(user_id);


--
-- TOC entry 3342 (class 2606 OID 16554)
-- Name: passengers passengers_passenger_id_type_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_passenger_id_type_fkey FOREIGN KEY (passenger_id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 16559)
-- Name: passengers passengers_seat_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES travel_schedules.seats(seat_id) ON UPDATE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 16564)
-- Name: passengers passengers_ticket_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES bookings.tickets(ticket_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 16569)
-- Name: tickets tickets_booking_code_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_booking_code_fkey FOREIGN KEY (booking_code) REFERENCES bookings.bookings(booking_code) ON UPDATE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 16574)
-- Name: tickets tickets_travel_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES travel_schedules.travels(travel_id) ON UPDATE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 16579)
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 16584)
-- Name: stations station_city_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_city_code_fkey FOREIGN KEY (city_code) REFERENCES travel_schedules.cities(city_code) ON UPDATE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 16589)
-- Name: train_cars train_cars_class_id_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_class_id_fkey FOREIGN KEY (class_id) REFERENCES travel_schedules.classes(id) ON UPDATE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 16594)
-- Name: train_cars train_cars_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 16599)
-- Name: travel_fares travel_costs_currency_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travel_fares
    ADD CONSTRAINT travel_costs_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3352 (class 2606 OID 16604)
-- Name: travels travels_departure_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_departure_station_fkey FOREIGN KEY (departure_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 16609)
-- Name: travels travels_destination_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_destination_station_fkey FOREIGN KEY (destination_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 16614)
-- Name: travels travels_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3358 (class 2606 OID 16669)
-- Name: role_resource_permissions role_resources_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_resource_permissions
    ADD CONSTRAINT role_resources_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES users.permissions(id) ON UPDATE CASCADE;


--
-- TOC entry 3359 (class 2606 OID 16662)
-- Name: role_resource_permissions role_resources_permissions_resource_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_resource_permissions
    ADD CONSTRAINT role_resources_permissions_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES users.resources(id) ON UPDATE CASCADE;


--
-- TOC entry 3360 (class 2606 OID 16657)
-- Name: role_resource_permissions role_resources_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_resource_permissions
    ADD CONSTRAINT role_resources_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES users.roles(id) ON UPDATE CASCADE;


--
-- TOC entry 3355 (class 2606 OID 16619)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES users.roles(id);


--
-- TOC entry 3356 (class 2606 OID 16624)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id);


--
-- TOC entry 3357 (class 2606 OID 16629)
-- Name: users users_id_type_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_id_type_fkey FOREIGN KEY (id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;


-- Completed on 2023-12-03 14:49:52

--
-- PostgreSQL database dump complete
--

