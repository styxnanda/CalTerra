--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-16 11:28:43

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
-- TOC entry 225 (class 1259 OID 16892)
-- Name: flight_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    departure_airport character varying(255),
    destination_airport character varying(255),
    flight_distance numeric,
    emission numeric NOT NULL
);


ALTER TABLE public.flight_emissions OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16891)
-- Name: flight_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flight_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 224
-- Name: flight_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_emissions_id_seq OWNED BY public.flight_emissions.id;


--
-- TOC entry 223 (class 1259 OID 16877)
-- Name: food_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    food_type character varying(255) NOT NULL,
    emission numeric NOT NULL
);


ALTER TABLE public.food_emissions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16876)
-- Name: food_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 222
-- Name: food_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_emissions_id_seq OWNED BY public.food_emissions.id;


--
-- TOC entry 221 (class 1259 OID 16862)
-- Name: home_appliances_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_appliances_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    appliance_type character varying(255) NOT NULL,
    duration_hours numeric,
    emission numeric NOT NULL
);


ALTER TABLE public.home_appliances_emissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16861)
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_appliances_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_appliances_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 220
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_appliances_emissions_id_seq OWNED BY public.home_appliances_emissions.id;


--
-- TOC entry 219 (class 1259 OID 16847)
-- Name: power_sources_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.power_sources_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    power_source_type character varying(255) NOT NULL,
    usage numeric,
    emission numeric NOT NULL
);


ALTER TABLE public.power_sources_emissions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16846)
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.power_sources_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.power_sources_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 218
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_sources_emissions_id_seq OWNED BY public.power_sources_emissions.id;


--
-- TOC entry 228 (class 1259 OID 16922)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying(100) NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16907)
-- Name: user_monthly_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_monthly_emissions (
    id integer NOT NULL,
    user_id uuid,
    year_month date NOT NULL,
    monthly_total_emission numeric NOT NULL
);


ALTER TABLE public.user_monthly_emissions OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16906)
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_monthly_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_monthly_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 226
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_monthly_emissions_id_seq OWNED BY public.user_monthly_emissions.id;


--
-- TOC entry 215 (class 1259 OID 16808)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    username character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16832)
-- Name: vehicle_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    vehicle_type character varying(255) NOT NULL,
    distance numeric,
    fuel_type character varying(255),
    emission numeric NOT NULL,
    vehicle_size character varying(255)
);


ALTER TABLE public.vehicle_emissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16831)
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_emissions_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 216
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_emissions_id_seq OWNED BY public.vehicle_emissions.id;


--
-- TOC entry 4731 (class 2604 OID 16895)
-- Name: flight_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions ALTER COLUMN id SET DEFAULT nextval('public.flight_emissions_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16880)
-- Name: food_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions ALTER COLUMN id SET DEFAULT nextval('public.food_emissions_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16865)
-- Name: home_appliances_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions ALTER COLUMN id SET DEFAULT nextval('public.home_appliances_emissions_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16850)
-- Name: power_sources_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions ALTER COLUMN id SET DEFAULT nextval('public.power_sources_emissions_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 16910)
-- Name: user_monthly_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions ALTER COLUMN id SET DEFAULT nextval('public.user_monthly_emissions_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16835)
-- Name: vehicle_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions ALTER COLUMN id SET DEFAULT nextval('public.vehicle_emissions_id_seq'::regclass);


--
-- TOC entry 4915 (class 0 OID 16892)
-- Dependencies: 225
-- Data for Name: flight_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_emissions (id, user_id, "timestamp", departure_airport, destination_airport, flight_distance, emission) FROM stdin;
\.


--
-- TOC entry 4913 (class 0 OID 16877)
-- Dependencies: 223
-- Data for Name: food_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_emissions (id, user_id, "timestamp", food_type, emission) FROM stdin;
\.


--
-- TOC entry 4911 (class 0 OID 16862)
-- Dependencies: 221
-- Data for Name: home_appliances_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_appliances_emissions (id, user_id, "timestamp", appliance_type, duration_hours, emission) FROM stdin;
\.


--
-- TOC entry 4909 (class 0 OID 16847)
-- Dependencies: 219
-- Data for Name: power_sources_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_sources_emissions (id, user_id, "timestamp", power_source_type, usage, emission) FROM stdin;
\.


--
-- TOC entry 4918 (class 0 OID 16922)
-- Dependencies: 228
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
8giiI2_BDgYnxa8aIWtFtq0DYgPj8eak	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-20T06:25:42.835Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"9935d7c0-f6e0-4977-b259-04a8135baf66"}}	2023-11-20 13:25:51
\.


--
-- TOC entry 4917 (class 0 OID 16907)
-- Dependencies: 227
-- Data for Name: user_monthly_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_monthly_emissions (id, user_id, year_month, monthly_total_emission) FROM stdin;
1	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-01	0
\.


--
-- TOC entry 4905 (class 0 OID 16808)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, email, password_hash, registration_date) FROM stdin;
9935d7c0-f6e0-4977-b259-04a8135baf66	coba2seq	Ini Coba	coba2seq@email.com	$2a$10$JhiFm5fSLwCKQXIxVIinxOGtxEnyovbvitDyDPVm.NcF9rtBGtify	2023-11-09 22:24:37.955965
\.


--
-- TOC entry 4907 (class 0 OID 16832)
-- Dependencies: 217
-- Data for Name: vehicle_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_emissions (id, user_id, "timestamp", vehicle_type, distance, fuel_type, emission, vehicle_size) FROM stdin;
\.


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 224
-- Name: flight_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_emissions_id_seq', 1, false);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 222
-- Name: food_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_emissions_id_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 220
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_appliances_emissions_id_seq', 1, false);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 218
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_sources_emissions_id_seq', 1, false);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 226
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_monthly_emissions_id_seq', 1, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 216
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_emissions_id_seq', 1, false);


--
-- TOC entry 4749 (class 2606 OID 16900)
-- Name: flight_emissions flight_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions
    ADD CONSTRAINT flight_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 16885)
-- Name: food_emissions food_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions
    ADD CONSTRAINT food_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16870)
-- Name: home_appliances_emissions home_appliances_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions
    ADD CONSTRAINT home_appliances_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16855)
-- Name: power_sources_emissions power_sources_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions
    ADD CONSTRAINT power_sources_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 16928)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- TOC entry 4751 (class 2606 OID 16914)
-- Name: user_monthly_emissions user_monthly_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 16916)
-- Name: user_monthly_emissions user_monthly_emissions_user_id_year_month_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_user_id_year_month_key UNIQUE (user_id, year_month);


--
-- TOC entry 4735 (class 2606 OID 16820)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4737 (class 2606 OID 16816)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16818)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4741 (class 2606 OID 16840)
-- Name: vehicle_emissions vehicle_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions
    ADD CONSTRAINT vehicle_emissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 16901)
-- Name: flight_emissions flight_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions
    ADD CONSTRAINT flight_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4759 (class 2606 OID 16886)
-- Name: food_emissions food_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions
    ADD CONSTRAINT food_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4758 (class 2606 OID 16871)
-- Name: home_appliances_emissions home_appliances_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions
    ADD CONSTRAINT home_appliances_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4757 (class 2606 OID 16856)
-- Name: power_sources_emissions power_sources_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions
    ADD CONSTRAINT power_sources_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4761 (class 2606 OID 16917)
-- Name: user_monthly_emissions user_monthly_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4756 (class 2606 OID 16841)
-- Name: vehicle_emissions vehicle_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions
    ADD CONSTRAINT vehicle_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2023-11-16 11:28:44

--
-- PostgreSQL database dump complete
--

