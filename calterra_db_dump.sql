--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: carbon_footprints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carbon_footprints (
    id integer NOT NULL,
    user_id integer,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_emission numeric NOT NULL
);


ALTER TABLE public.carbon_footprints OWNER TO postgres;

--
-- Name: carbon_footprints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carbon_footprints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbon_footprints_id_seq OWNER TO postgres;

--
-- Name: carbon_footprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carbon_footprints_id_seq OWNED BY public.carbon_footprints.id;


--
-- Name: flight_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    departure_airport character varying(255),
    destination_airport character varying(255),
    flight_distance numeric,
    trip_type character varying(255),
    flight_class character varying(255)
);


ALTER TABLE public.flight_contributors OWNER TO postgres;

--
-- Name: flight_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_contributors_id_seq OWNER TO postgres;

--
-- Name: flight_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_contributors_id_seq OWNED BY public.flight_contributors.id;


--
-- Name: food_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    food_diet character varying(255) NOT NULL
);


ALTER TABLE public.food_contributors OWNER TO postgres;

--
-- Name: food_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_contributors_id_seq OWNER TO postgres;

--
-- Name: food_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_contributors_id_seq OWNED BY public.food_contributors.id;


--
-- Name: home_appliances_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_appliances_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    appliance_type character varying(255) NOT NULL,
    duration_hours numeric,
    wash_cycles numeric
);


ALTER TABLE public.home_appliances_contributors OWNER TO postgres;

--
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_appliances_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_appliances_contributors_id_seq OWNER TO postgres;

--
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_appliances_contributors_id_seq OWNED BY public.home_appliances_contributors.id;


--
-- Name: power_sources_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.power_sources_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    power_source_type character varying(255) NOT NULL,
    usage_kwh numeric,
    usage_cubic_meter numeric
);


ALTER TABLE public.power_sources_contributors OWNER TO postgres;

--
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.power_sources_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_sources_contributors_id_seq OWNER TO postgres;

--
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_sources_contributors_id_seq OWNED BY public.power_sources_contributors.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying(100) NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vehicle_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    vehicle_type character varying(255) NOT NULL,
    distance numeric,
    fuel_type character varying(255),
    vehicle_size character varying(255)
);


ALTER TABLE public.vehicle_contributors OWNER TO postgres;

--
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_contributors_id_seq OWNER TO postgres;

--
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_contributors_id_seq OWNED BY public.vehicle_contributors.id;


--
-- Name: carbon_footprints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints ALTER COLUMN id SET DEFAULT nextval('public.carbon_footprints_id_seq'::regclass);


--
-- Name: flight_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors ALTER COLUMN id SET DEFAULT nextval('public.flight_contributors_id_seq'::regclass);


--
-- Name: food_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors ALTER COLUMN id SET DEFAULT nextval('public.food_contributors_id_seq'::regclass);


--
-- Name: home_appliances_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors ALTER COLUMN id SET DEFAULT nextval('public.home_appliances_contributors_id_seq'::regclass);


--
-- Name: power_sources_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors ALTER COLUMN id SET DEFAULT nextval('public.power_sources_contributors_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vehicle_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors ALTER COLUMN id SET DEFAULT nextval('public.vehicle_contributors_id_seq'::regclass);


--
-- Data for Name: carbon_footprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carbon_footprints (id, user_id, date, total_emission) FROM stdin;
1	11	2023-10-30 13:05:09.93961	2.3904
2	11	2023-10-30 13:37:34.482389	2.9892000000000003
\.


--
-- Data for Name: flight_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_contributors (id, carbon_footprint_id, departure_airport, destination_airport, flight_distance, trip_type, flight_class) FROM stdin;
\.


--
-- Data for Name: food_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_contributors (id, carbon_footprint_id, food_diet) FROM stdin;
\.


--
-- Data for Name: home_appliances_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_appliances_contributors (id, carbon_footprint_id, appliance_type, duration_hours, wash_cycles) FROM stdin;
\.


--
-- Data for Name: power_sources_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_sources_contributors (id, carbon_footprint_id, power_source_type, usage_kwh, usage_cubic_meter) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
OlG_OAGUVTuGQ5R35wuj0w8eCSNlQmQH	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-06T01:26:59.630Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-11-06 08:30:18
TO3O59vGA53Tj3Swc7SCKY4cxsPDIXAX	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-06T02:35:09.835Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":11}}	2023-11-06 13:37:35
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, email, password_hash, registration_date) FROM stdin;
1	progenitor	Akun Dummy	progenitor@gmail.com	$2y$10$B71Yn43h9lCcP5Tl/Gr.ZOxaod01YvsCdxfOt7SLtqi/SRIint92a	2023-10-28 23:46:28.122731
2	usertest1	User Test	usertest1@email.com	$2a$10$hebg599uxLjajPOSh88/9.72qBY4Gja3.up4COmTszzfQRQBwSYZK	2023-10-29 07:00:17.038452
8	usertest2	User Test 2	usertest2@email.com	$2a$10$xjW6SV9ZqupL7.YFdOE7Gu5mgSyZjZCHDOQ5xkRIa2ICs3tFis2iW	2023-10-29 07:19:17.748464
11	usertest3	User Test 3	usertest3@email.com	$2a$10$AmrznvivxCJM77.erplzXOv5T1TDckpx0ZW1T4wyXCFKBKFy7/gve	2023-10-29 08:14:04.393012
\.


--
-- Data for Name: vehicle_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_contributors (id, carbon_footprint_id, vehicle_type, distance, fuel_type, vehicle_size) FROM stdin;
1	1	Car	20		Small
2	2	Car	20	Petrol	Small
\.


--
-- Name: carbon_footprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carbon_footprints_id_seq', 2, true);


--
-- Name: flight_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_contributors_id_seq', 1, false);


--
-- Name: food_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_contributors_id_seq', 1, false);


--
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_appliances_contributors_id_seq', 1, false);


--
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_sources_contributors_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_contributors_id_seq', 2, true);


--
-- Name: carbon_footprints carbon_footprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_pkey PRIMARY KEY (id);


--
-- Name: flight_contributors flight_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_pkey PRIMARY KEY (id);


--
-- Name: food_contributors food_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_pkey PRIMARY KEY (id);


--
-- Name: home_appliances_contributors home_appliances_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_pkey PRIMARY KEY (id);


--
-- Name: power_sources_contributors power_sources_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vehicle_contributors vehicle_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_pkey PRIMARY KEY (id);


--
-- Name: carbon_footprints carbon_footprints_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: flight_contributors flight_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- Name: food_contributors food_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- Name: home_appliances_contributors home_appliances_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- Name: power_sources_contributors power_sources_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- Name: vehicle_contributors vehicle_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- PostgreSQL database dump complete
--

