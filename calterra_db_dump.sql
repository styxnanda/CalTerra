--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-31 14:12:50

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
-- TOC entry 215 (class 1259 OID 16685)
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
-- TOC entry 216 (class 1259 OID 16691)
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
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 216
-- Name: carbon_footprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carbon_footprints_id_seq OWNED BY public.carbon_footprints.id;


--
-- TOC entry 217 (class 1259 OID 16692)
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
-- TOC entry 218 (class 1259 OID 16697)
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
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 218
-- Name: flight_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_contributors_id_seq OWNED BY public.flight_contributors.id;


--
-- TOC entry 219 (class 1259 OID 16698)
-- Name: food_contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_contributors (
    id integer NOT NULL,
    carbon_footprint_id integer,
    food_diet character varying(255) NOT NULL
);


ALTER TABLE public.food_contributors OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16701)
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
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 220
-- Name: food_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_contributors_id_seq OWNED BY public.food_contributors.id;


--
-- TOC entry 221 (class 1259 OID 16702)
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
-- TOC entry 222 (class 1259 OID 16707)
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
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 222
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_appliances_contributors_id_seq OWNED BY public.home_appliances_contributors.id;


--
-- TOC entry 223 (class 1259 OID 16708)
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
-- TOC entry 224 (class 1259 OID 16713)
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
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 224
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_sources_contributors_id_seq OWNED BY public.power_sources_contributors.id;


--
-- TOC entry 225 (class 1259 OID 16714)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying(100) NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16719)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16789)
-- Name: users_id_seq_latest; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq_latest
    START WITH 20000000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq_latest OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq_latest; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq_latest OWNED BY public.users.id;


--
-- TOC entry 227 (class 1259 OID 16726)
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
-- TOC entry 228 (class 1259 OID 16731)
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
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 228
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_contributors_id_seq OWNED BY public.vehicle_contributors.id;


--
-- TOC entry 4722 (class 2604 OID 16732)
-- Name: carbon_footprints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints ALTER COLUMN id SET DEFAULT nextval('public.carbon_footprints_id_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16733)
-- Name: flight_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors ALTER COLUMN id SET DEFAULT nextval('public.flight_contributors_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 16734)
-- Name: food_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors ALTER COLUMN id SET DEFAULT nextval('public.food_contributors_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16735)
-- Name: home_appliances_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors ALTER COLUMN id SET DEFAULT nextval('public.home_appliances_contributors_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16736)
-- Name: power_sources_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors ALTER COLUMN id SET DEFAULT nextval('public.power_sources_contributors_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16806)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq_latest'::regclass);


--
-- TOC entry 4730 (class 2604 OID 16738)
-- Name: vehicle_contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors ALTER COLUMN id SET DEFAULT nextval('public.vehicle_contributors_id_seq'::regclass);


--
-- TOC entry 4900 (class 0 OID 16685)
-- Dependencies: 215
-- Data for Name: carbon_footprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carbon_footprints (id, user_id, date, total_emission) FROM stdin;
1	11	2023-10-30 13:05:09.93961	2.3904
2	11	2023-10-30 13:37:34.482389	2.9892000000000003
\.


--
-- TOC entry 4902 (class 0 OID 16692)
-- Dependencies: 217
-- Data for Name: flight_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_contributors (id, carbon_footprint_id, departure_airport, destination_airport, flight_distance, trip_type, flight_class) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 16698)
-- Dependencies: 219
-- Data for Name: food_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_contributors (id, carbon_footprint_id, food_diet) FROM stdin;
\.


--
-- TOC entry 4906 (class 0 OID 16702)
-- Dependencies: 221
-- Data for Name: home_appliances_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_appliances_contributors (id, carbon_footprint_id, appliance_type, duration_hours, wash_cycles) FROM stdin;
\.


--
-- TOC entry 4908 (class 0 OID 16708)
-- Dependencies: 223
-- Data for Name: power_sources_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_sources_contributors (id, carbon_footprint_id, power_source_type, usage_kwh, usage_cubic_meter) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 16714)
-- Dependencies: 225
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
OlG_OAGUVTuGQ5R35wuj0w8eCSNlQmQH	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-06T01:26:59.630Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-11-06 08:30:18
TO3O59vGA53Tj3Swc7SCKY4cxsPDIXAX	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-06T02:35:09.835Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":11}}	2023-11-06 13:37:35
QaCjEmBpoKajcxFVVNFiPHAjzgjPqtKe	{"cookie":{"originalMaxAge":604800000,"expires":"2023-11-07T07:04:07.692Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"20000000"}}	2023-11-07 14:04:33
\.


--
-- TOC entry 4911 (class 0 OID 16719)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, email, password_hash, registration_date) FROM stdin;
1	progenitor	Akun Dummy	progenitor@gmail.com	$2y$10$B71Yn43h9lCcP5Tl/Gr.ZOxaod01YvsCdxfOt7SLtqi/SRIint92a	2023-10-28 23:46:28.122731
2	usertest1	User Test	usertest1@email.com	$2a$10$hebg599uxLjajPOSh88/9.72qBY4Gja3.up4COmTszzfQRQBwSYZK	2023-10-29 07:00:17.038452
8	usertest2	User Test 2	usertest2@email.com	$2a$10$xjW6SV9ZqupL7.YFdOE7Gu5mgSyZjZCHDOQ5xkRIa2ICs3tFis2iW	2023-10-29 07:19:17.748464
11	usertest3	User Test 3	usertest3@email.com	$2a$10$AmrznvivxCJM77.erplzXOv5T1TDckpx0ZW1T4wyXCFKBKFy7/gve	2023-10-29 08:14:04.393012
20000000	coba2seq	Coba Sequence Baru	coba2seq@yahoo.com	$2a$10$es3FTf3sSgZK88Kc.pf89.KkMmUpAhNZWmDuSiTAeKTARBkB/yuGa	2023-10-31 13:35:29.022621
\.


--
-- TOC entry 4912 (class 0 OID 16726)
-- Dependencies: 227
-- Data for Name: vehicle_contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_contributors (id, carbon_footprint_id, vehicle_type, distance, fuel_type, vehicle_size) FROM stdin;
1	1	Car	20		Small
2	2	Car	20	Petrol	Small
\.


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 216
-- Name: carbon_footprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carbon_footprints_id_seq', 2, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 218
-- Name: flight_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_contributors_id_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 220
-- Name: food_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_contributors_id_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 222
-- Name: home_appliances_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_appliances_contributors_id_seq', 1, false);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 224
-- Name: power_sources_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_sources_contributors_id_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq_latest; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq_latest', 20000000, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 228
-- Name: vehicle_contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_contributors_id_seq', 2, true);


--
-- TOC entry 4732 (class 2606 OID 16740)
-- Name: carbon_footprints carbon_footprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16742)
-- Name: flight_contributors flight_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4736 (class 2606 OID 16744)
-- Name: food_contributors food_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16746)
-- Name: home_appliances_contributors home_appliances_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 16748)
-- Name: power_sources_contributors power_sources_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16750)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- TOC entry 4744 (class 2606 OID 16752)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4746 (class 2606 OID 16792)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 16756)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4750 (class 2606 OID 16758)
-- Name: vehicle_contributors vehicle_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 16793)
-- Name: carbon_footprints carbon_footprints_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carbon_footprints
    ADD CONSTRAINT carbon_footprints_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4752 (class 2606 OID 16764)
-- Name: flight_contributors flight_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_contributors
    ADD CONSTRAINT flight_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4753 (class 2606 OID 16769)
-- Name: food_contributors food_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_contributors
    ADD CONSTRAINT food_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4754 (class 2606 OID 16774)
-- Name: home_appliances_contributors home_appliances_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_contributors
    ADD CONSTRAINT home_appliances_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4755 (class 2606 OID 16779)
-- Name: power_sources_contributors power_sources_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_contributors
    ADD CONSTRAINT power_sources_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


--
-- TOC entry 4756 (class 2606 OID 16784)
-- Name: vehicle_contributors vehicle_contributors_carbon_footprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_contributors
    ADD CONSTRAINT vehicle_contributors_carbon_footprint_id_fkey FOREIGN KEY (carbon_footprint_id) REFERENCES public.carbon_footprints(id);


-- Completed on 2023-10-31 14:12:50

--
-- PostgreSQL database dump complete
--

