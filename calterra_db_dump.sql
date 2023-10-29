--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-28 23:51:06

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
-- TOC entry 218 (class 1259 OID 16587)
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
-- TOC entry 217 (class 1259 OID 16586)
-- Name: carbon_footprints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carbon_footprints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carbon_footprints_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 217
-- Name: carbon_footprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carbon_footprints_id_seq OWNED BY public.carbon_footprints.id;


--
-- TOC entry 228 (class 1259 OID 16656)
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
-- TOC entry 227 (class 1259 OID 16655)
-- Name: flight_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flight_contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 227
-- Name: flight_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_contributors_id_seq OWNED BY public.flight_contributors.id;


--
-- TOC entry 226 (class 1259 OID 16644)
-- Name: food_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    food_diet character varying(255) NOT NULL
);


ALTER TABLE public.food_contributors OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16643)
-- Name: food_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 225
-- Name: food_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_contributors_id_seq OWNED BY public.food_contributors.id;


--
-- TOC entry 224 (class 1259 OID 16630)
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
-- TOC entry 223 (class 1259 OID 16629)
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_appliances_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_appliances_contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 223
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_appliances_contributors_id_seq OWNED BY public.home_appliances_contributors.id;


--
-- TOC entry 222 (class 1259 OID 16616)
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
-- TOC entry 221 (class 1259 OID 16615)
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.power_sources_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.power_sources_contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 221
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_sources_contributors_id_seq OWNED BY public.power_sources_contributors.id;


--
-- TOC entry 216 (class 1259 OID 16573)
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
-- TOC entry 215 (class 1259 OID 16572)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 220 (class 1259 OID 16602)
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
-- TOC entry 219 (class 1259 OID 16601)
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_contributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_contributors_id_seq OWNED BY public.vehicle_contributors.id;


--
-- TOC entry 4720 (class 2604 OID 16590)
-- Name: carbon_footprints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints ALTER COLUMN id SET DEFAULT nextval('public.carbon_footprints_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16659)
-- Name: flight_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors ALTER COLUMN id SET DEFAULT nextval('public.flight_contributors_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16647)
-- Name: food_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors ALTER COLUMN id SET DEFAULT nextval('public.food_contributors_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16633)
-- Name: home_appliances_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors ALTER COLUMN id SET DEFAULT nextval('public.home_appliances_contributors_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16619)
-- Name: power_sources_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors ALTER COLUMN id SET DEFAULT nextval('public.power_sources_contributors_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16576)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16605)
-- Name: vehicle_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors ALTER COLUMN id SET DEFAULT nextval('public.vehicle_contributors_id_seq'::regclass);


--
-- TOC entry 4897 (class 0 OID 16587)
-- Dependencies: 218
-- Data for Name: carbon_footprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carbon_footprints (id, user_id, date, total_emission) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 16656)
-- Dependencies: 228
-- Data for Name: flight_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_contributors (id, carbon_footprint_id, departure_airport, destination_airport, flight_distance, trip_type, flight_class) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 16644)
-- Dependencies: 226
-- Data for Name: food_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_contributors (id, carbon_footprint_id, food_diet) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 16630)
-- Dependencies: 224
-- Data for Name: home_appliances_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_appliances_contributors (id, carbon_footprint_id, appliance_type, duration_hours, wash_cycles) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 16616)
-- Dependencies: 222
-- Data for Name: power_sources_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_sources_contributors (id, carbon_footprint_id, power_source_type, usage_kwh, usage_cubic_meter) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16573)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, email, password_hash, registration_date) FROM stdin;
1	progenitor	Akun Dummy	progenitor@gmail.com	$2y$10$B71Yn43h9lCcP5Tl/Gr.ZOxaod01YvsCdxfOt7SLtqi/SRIint92a	2023-10-28 23:46:28.122731
\.


--
-- TOC entry 4899 (class 0 OID 16602)
-- Dependencies: 220
-- Data for Name: vehicle_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_contributors (id, carbon_footprint_id, vehicle_type, distance, fuel_type, vehicle_size) FROM stdin;
\.


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: carbon_footprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carbon_footprints_id_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 227
-- Name: flight_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_contributors_id_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 225
-- Name: food_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_contributors_id_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 223
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_appliances_contributors_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 221
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_sources_contributors_id_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 219
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_contributors_id_seq', 1, false);


--
-- TOC entry 4734 (class 2606 OID 16595)
-- Name: carbon_footprints carbon_footprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_pkey PRIMARY KEY (id);


--
-- TOC entry 4744 (class 2606 OID 16663)
-- Name: flight_contributors flight_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16649)
-- Name: food_contributors food_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 16637)
-- Name: home_appliances_contributors home_appliances_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16623)
-- Name: power_sources_contributors power_sources_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 16585)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4730 (class 2606 OID 16581)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16583)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4736 (class 2606 OID 16609)
-- Name: vehicle_contributors vehicle_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16596)
-- Name: carbon_footprints carbon_footprints_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4750 (class 2606 OID 16664)
-- Name: flight_contributors flight_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4749 (class 2606 OID 16650)
-- Name: food_contributors food_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4748 (class 2606 OID 16638)
-- Name: home_appliances_contributors home_appliances_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4747 (class 2606 OID 16624)
-- Name: power_sources_contributors power_sources_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4746 (class 2606 OID 16610)
-- Name: vehicle_contributors vehicle_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


-- Completed on 2023-10-28 23:51:07

--
-- PostgreSQL database dump complete
--

