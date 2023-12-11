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
-- Name: airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airport (
    country_code character varying(10) NOT NULL,
    region_name character varying(200) NOT NULL,
    iata character varying(10) NOT NULL,
    airport character varying(200) NOT NULL,
    lattitude numeric NOT NULL,
    longitude numeric NOT NULL
);


ALTER TABLE public.airport OWNER TO postgres;

--
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
-- Name: flight_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_emissions_id_seq OWNER TO postgres;

--
-- Name: flight_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_emissions_id_seq OWNED BY public.flight_emissions.id;


--
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
-- Name: food_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_emissions_id_seq OWNER TO postgres;

--
-- Name: food_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_emissions_id_seq OWNED BY public.food_emissions.id;


--
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
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_appliances_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_appliances_emissions_id_seq OWNER TO postgres;

--
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_appliances_emissions_id_seq OWNED BY public.home_appliances_emissions.id;


--
-- Name: power_sources_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.power_sources_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    power_source_type character varying(255) NOT NULL,
    usage_kwh numeric,
    emission numeric NOT NULL
);


ALTER TABLE public.power_sources_emissions OWNER TO postgres;

--
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.power_sources_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_sources_emissions_id_seq OWNER TO postgres;

--
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_sources_emissions_id_seq OWNED BY public.power_sources_emissions.id;


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
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_monthly_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_monthly_emissions_id_seq OWNER TO postgres;

--
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_monthly_emissions_id_seq OWNED BY public.user_monthly_emissions.id;


--
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
-- Name: vehicle_emissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_emissions (
    id integer NOT NULL,
    user_id uuid,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    vehicle_type character varying(255) NOT NULL,
    distance numeric,
    fuel_type character varying(255),
    emission numeric NOT NULL
);


ALTER TABLE public.vehicle_emissions OWNER TO postgres;

--
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_emissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_emissions_id_seq OWNER TO postgres;

--
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_emissions_id_seq OWNED BY public.vehicle_emissions.id;


--
-- Name: flight_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions ALTER COLUMN id SET DEFAULT nextval('public.flight_emissions_id_seq'::regclass);


--
-- Name: food_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions ALTER COLUMN id SET DEFAULT nextval('public.food_emissions_id_seq'::regclass);


--
-- Name: home_appliances_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions ALTER COLUMN id SET DEFAULT nextval('public.home_appliances_emissions_id_seq'::regclass);


--
-- Name: power_sources_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions ALTER COLUMN id SET DEFAULT nextval('public.power_sources_emissions_id_seq'::regclass);


--
-- Name: user_monthly_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions ALTER COLUMN id SET DEFAULT nextval('public.user_monthly_emissions_id_seq'::regclass);


--
-- Name: vehicle_emissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions ALTER COLUMN id SET DEFAULT nextval('public.vehicle_emissions_id_seq'::regclass);


--
-- Data for Name: airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airport (country_code, region_name, iata, airport, lattitude, longitude) FROM stdin;
BR	Para	SFK	Soure Airport	-0.699431	-48.521
AE	Ash Shariqah	SHJ	Sharjah International Airport	25.3286	55.5172
AE	Abu Zaby	AZI	Al Bateen Executive Airport	24.4283	54.4581
AE	Al Fujayrah	FJR	Fujairah International Airport	25.1122	56.324
AE	Abu Zaby	XSB	Sir Bani Yas Airport	24.2836	52.5803
AE	Ra's al Khaymah	RKT	Ras Al Khaimah International Airport	25.6135	55.9388
AE	Dubayy	DWC	Al Maktoum International Airport	24.8964	55.1614
AE	Abu Zaby	DHF	Al Dhafra Air Base	24.2482	54.5477
AE	Abu Zaby	ZDY	Dalma Airport	24.51	52.3352
AE	Dubayy	DCG	Dubai Creek Seaplane Base	25.2422	55.3314
AE	Abu Zaby	AYM	Yas Island Seaplane Base	24.467	54.6103
AE	Dubayy	DJH	Jebel Ali Seaplane Base	24.989	55.0238
AE	Ra's al Khaymah	RHR	Al Hamra Seaplane Base	25.691	55.778
AE	Dubayy	DXB	Dubai International Airport	25.2528	55.3644
AE	Abu Zaby	AAN	Al Ain International Airport	24.2617	55.6092
AE	Dubayy	NHD	Al Minhad Air Base	25.0268	55.3662
AE	Abu Zaby	AUH	Abu Dhabi International Airport	24.433	54.6511
AF	Farah	FAH	Farah Airport	32.367	62.183
AF	Faryab	MMZ	Maymana Airport	35.9308	64.7609
AF	Khost	OLR	Forward Operating Base Salerno	33.3638	69.9561
AF	Badakhshan	KWH	Khwahan Airport	37.883	70.217
AF	Ghazni	SBF	Sardeh Band Airport	33.3207	68.6365
AF	Kabul	KBL	Hamid Karzai International Airport	34.5659	69.2123
AF	Badghis	LQN	Qala i Naw Airport	34.985	63.1178
AF	Badakhshan	FBD	Fayzabad Airport	37.1211	70.5181
AF	Khost	KHT	Khost Airfield	33.3334	69.952
AF	Badakhshan	SGA	Sheghnan Airport	37.567	71.5
AF	Herat	HEA	Herat International Airport	34.21	62.2283
AF	Ghazni	GZI	Ghazni Airport	33.5312	68.4129
AF	Bamyan	BIN	Bamyan Airport	34.817	67.817
AF	Kandahar	KDH	Kandahar International Airport	31.5058	65.8478
AF	Helmand	DWR	Dwyer Airport	31	64
AF	Kabul	GRG	Gardez Airport	33.6315	69.2394
AF	Kunduz	UND	Kunduz Airport	36.6651	68.9108
AF	Helmand	BST	Bost Airport	31.5597	64.365
AF	Kandahar	URZ	Uruzgan Airport	32.903	66.6309
AF	Kandahar	TII	Tarinkot Airport	32.6042	65.8658
AF	Paktika	URN	Urgun Airport	32.9318	69.1563
AF	Herat	ZAJ	Zaranj Airport	30.9722	61.8658
AF	Helmand	OAZ	Camp Bastion Air Base	31.8638	64.2246
AF	Balkh	MZR	Mazar-e Sharif International Airport	36.7069	67.2097
AF	Badakhshan	KUR	Razer Airport	37.752	-89.0154
AF	Takhar	TQN	Taloqan Airport	36.7707	69.532
AF	Ghor	CCN	Chaghcharan Airport	34.5265	65.271
AF	Badakhshan	DAZ	Darwaz Airport	38.4611	70.8825
AF	Nangarhar	JAA	Jalalabad Airport	34.3998	70.4986
AF	Logar	OAA	Forward Operating Base Shank	33.9225	69.0772
AF	Herat	OAH	Shindand Air Base	33.3913	62.261
AF	Parwan	OAI	Bagram Airfield	34.9461	69.265
AF	Paktika	OAS	Sharana Airstrip / Forward Operating Base Sharana	33.1258	68.8385
AF	Kabul	KBL	Kabul International Airport	34.5658	69.2131
AG	Barbuda	BBQ	Barbuda Codrington Airport	17.6358	-61.8286
AG	Saint George	ANU	V. C. Bird International Airport	17.1367	-61.7927
AI	Anguilla	AXA	Clayton J. Lloyd International Airport	18.2048	-63.0551
AM	Sirak	LWN	Gyumri Shirak Airport	40.7504	43.8593
AM	Erevan	EVN	Zvartnots International Airport	40.1473	44.3959
AO	Moxico	LUO	Luena Airport	-11.7681	19.8977
AO	Cunene	VPE	Ondjiva Pereira Airport	-17.0435	15.6838
AO	Uige	UGO	Uige Airport	-7.60307	15.0278
AO	Malange	KNP	Kapanda Airport	-9.76937	15.4553
AO	Bie	SVP	Kuito Airport	-12.4046	16.9474
AO	Zaire	ARZ	N'zeto Airport	-7.25944	12.8631
AO	Kuando Kubango	CTI	Cuito Cuanavale Airport	-15.1603	19.1561
AO	Namibe	MSZ	Namibe Airport (Yuri Gagarin Airport)	-15.2612	12.1468
AO	Zaire	SZA	Soyo Airport	-6.14109	12.3718
AO	Huila	SDD	Lubango Mukanka Airport	-14.9247	13.575
AO	Kwanza Sul	PBN	Porto Amboim Airport	-10.722	13.7655
AO	Moxico	CAV	Cazombo Airport	-11.8931	22.9164
AO	Malange	MEG	Malanje Airport	-9.52509	16.3124
AO	Moxico	GGC	Lumbala N'guimbo Airport	-14.105	21.45
AO	Bengo	AZZ	Ambriz Airport	-7.86222	13.1161
AO	Lunda Norte	LZM	Cuango-Luzamba Airport	-9.11596	18.0493
AO	Lunda Sul	VHC	Henrique de Carvalho Airport	-9.68907	20.4319
AO	Lunda Norte	PGI	Chitato Airport	-7.35889	20.8047
AO	Kuando Kubango	DRC	Dirico Airport	-17.9819	20.7681
AO	Bie	ANL	Andulo Airport	-11.4723	16.7109
AO	Lunda Norte	DUE	Dundo Airport	-7.40089	20.8185
AO	Benguela	LLT	Lobito Airport	-12.3757	13.561
AO	Benguela	CBT	Catumbela Airport	-12.4792	13.4869
AO	Kwanza Sul	NDD	Sumbe Airport	-11.1679	13.8475
AO	Kwanza Sul	CEO	Waco Kungo Airport	-11.4264	15.1014
AO	Kwanza Norte	NDF	N'dalatando Airport	-9.27519	14.9772
AO	Huila	JMB	Jamba Airport	-14.6982	16.0701
AO	Huambo	NOV	Albano Machado Airport	-12.8089	15.7605
AO	Benguela	BUG	Benguela Airport (Gen. V. Deslandes Airport)	-12.609	13.4037
AO	Lunda Norte	LBZ	Lucapa Airport	-8.44573	20.7321
AO	Luanda	LAD	Quatro de Fevereiro Airport	-8.85837	13.2312
AO	Lunda Norte	NZA	Nzagi Airport	-7.71694	21.3582
AO	Cunene	XGN	Xangongo Airport	-16.7554	14.9653
AO	Lunda Norte	CFF	Cafunfo Airport	-8.78361	17.9897
AO	Cabinda	CAB	Cabinda Airport	-5.59699	12.1884
AO	Moxico	UAL	Luau Airport	-10.7158	22.2311
AO	Kuando Kubango	SPP	Menongue Airport	-14.6576	17.7198
AO	Uige	GXG	Negage Airport	-7.75451	15.2877
AO	Zaire	SSY	Mbanza Congo Airport	-6.2699	14.247
AO	Moxico	CNZ	Cangamba Airport	-13.7106	19.8611
AQ	Antarctica	TNM	Teniente R. Marsh Airport	-62.1908	-58.9867
AR	Buenos Aires	EPA	El Palomar Airport	-34.6099	-58.6126
AR	San Luis	RLO	Valle del Conlara Airport	-32.3847	-65.1865
AR	Entre Rios	COC	Comodoro Pierrestegui Airport	-31.2969	-57.9966
AR	Santa Fe	ROS	Rosario - Islas Malvinas International Airport	-32.9036	-60.785
AR	Chubut	ROY	Rio Mayo Airport	-45.7039	-70.2456
AR	La Pampa	RSA	Santa Rosa Airport (Argentina)	-36.5883	-64.2757
AR	Santa Cruz	RYO	Rio Turbio Airport	-51.605	-72.2203
AR	Santa Cruz	RZA	Santa Cruz Airport (Argentina)	-50.0165	-68.5792
AR	La Pampa	GPO	General Pico Airport	-35.6962	-63.7583
AR	Corrientes	CNQ	Doctor Fernando Piragine Niveyro International Airport	-27.4455	-58.7619
AR	Misiones	ELO	Eldorado Airport	-26.3975	-54.5747
AR	Santiago del Estero	SDE	Vicecomodoro Angel de la Paz Aragones Airport	-27.7656	-64.31
AR	Mendoza	AFA	San Rafael Airport (Argentina)	-34.5883	-68.4039
AR	Neuquen	HOS	Chos Malal Airport	-37.4447	-70.2225
AR	Neuquen	APZ	Zapala Airport	-38.9755	-70.1136
AR	Santa Fe	SFN	Sauce Viejo Airport	-31.7117	-60.8117
AR	Cordoba	COR	Ingeniero Aeronautico Ambrosio L.V. Taravella International Airport (Pajas Blancas)	-31.3236	-64.208
AR	Rio Negro	SGV	Sierra Grande Airport	-41.5917	-65.3394
AR	Corrientes	UZU	Curuzu Cuatia Airport	-29.7706	-57.9789
AR	Salta	SLA	Martin Miguel de Guemes International Airport	-24.856	-65.4862
AR	Rio Negro	MQD	Maquinchao Airport	-41.2431	-68.7078
AR	Rio Negro	OES	Antoine de Saint Exupery Airport	-40.7512	-65.0343
AR	Neuquen	CPC	Aviador Carlos Campos Airport	-40.0754	-71.1373
AR	Salta	TTG	Tartagal Airport	-22.6196	-63.7937
AR	Buenos Aires	CSZ	Brigadier Hector Eduardo Ruiz Airport	-37.4461	-61.8893
AR	Catamarca	CTC	Coronel Felipe Varela International Airport	-28.5956	-65.7517
AR	Chubut	OLN	Lago Musters Airport	-45.5824	-68.9998
AR	Buenos Aires	CPG	Carmen de Patagones Airport	-40.7781	-62.9803
AR	Buenos Aires	SST	Santa Teresita Airport	-36.5423	-56.7218
AR	Rio Negro	BRC	San Carlos de Bariloche Airport	-41.1512	-71.1575
AR	Salta	ORA	Oran Air	-23.1528	-64.3292
AR	San Juan	UAQ	Domingo Faustino Sarmiento Airport	-31.5715	-68.4182
AR	Chubut	ARR	Alto Rio Senguer Airport	-45.0136	-70.8122
AR	Buenos Aires	OVR	Olavarria Airport	-36.89	-60.2166
AR	Corrientes	OYA	Goya Airport	-29.1058	-59.2189
AR	Buenos Aires	OYO	Tres Arroyos Airport	-38.3869	-60.3297
AR	San Luis	LUQ	Brigadier Mayor Cesar Raul Ojeda Airport	-33.2732	-66.3564
AR	Tucuman	TUC	Teniente General Benjamin Matienzo International Airport	-26.8409	-65.1049
AR	Formosa	CLX	Clorinda Airport	-25.3036	-57.7344
AR	Chubut	EMX	El Maiten Airport	-42.0292	-71.1725
AR	Buenos Aires	PEH	Comodoro Pedro Zanni Airport	-35.8446	-61.8576
AR	Santa Cruz	PMQ	Perito Moreno Airport	-46.5379	-70.9787
AR	Chubut	PMY	El Tehuelche Airport	-42.7592	-65.1027
AR	Santa Cruz	ULA	Capitan Jose Daniel Vazquez Airport	-49.3068	-67.8026
AR	Jujuy	JUJ	Gobernador Horacio Guzman International Airport	-24.3928	-65.0978
AR	Rio Negro	GNR	Dr. Arturo Umberto Illia Airport	-39.0007	-67.6205
AR	Buenos Aires	VLG	Villa Gesell Airport	-37.2354	-57.0292
AR	Chubut	JSM	Jose de San Martin Airport	-44.0486	-70.4589
AR	Entre Rios	PRA	General Justo Jose de Urquiza Airport	-31.7948	-60.4804
AR	Buenos Aires	JNI	Junin Airport	-34.5459	-60.9306
AR	Entre Rios	GHU	Gualeguaychu Airport	-33.0103	-58.6131
AR	Tierra del Fuego	USH	Ushuaia - Malvinas Argentinas International Airport	-54.8433	-68.2958
AR	Chaco	PRQ	Presidencia Roque Saenz Pena Airport	-26.7536	-60.4922
AR	Santa Cruz	GGS	Gobernador Gregores Airport	-48.7831	-70.15
AR	Chubut	CRD	General Enrique Mosconi International Airport	-45.7853	-67.4655
AR	Rio Negro	EHL	El Bolson Airport	-41.9432	-71.5323
AR	Misiones	PSS	Libertador General Jose de San Martin Airport	-27.3858	-55.9707
AR	Buenos Aires	TDL	Tandil Airport	-37.2374	-59.2279
AR	Santa Cruz	PUD	Puerto Deseado Airport	-47.7353	-65.9041
AR	Santa Fe	RAF	Rafaela Airport	-31.2825	-61.5017
AR	Santa Cruz	FTE	Comandante Armando Tola International Airport	-50.2803	-72.0531
AR	Formosa	FMA	Formosa International Airport (El Pucu Airport)	-26.2127	-58.2281
AR	San Luis	VME	Villa Reynolds Airport	-33.7299	-65.3874
AR	La Rioja	IRJ	Capitan Vicente Almandos Almonacid Airport	-29.3816	-66.7958
AR	Buenos Aires	VGS	General Villegas Airport	-35	-63
AR	Buenos Aires	LPG	La Plata Airport	-34.9722	-57.8947
AR	Neuquen	CUT	Cutral Co Airport	-38.9397	-69.2646
AR	Santa Fe	CRR	Ceres Airport	-29.8723	-61.9279
AR	Rio Negro	LMD	Los Menucos Airport	-40.8177	-68.0747
AR	Santa Fe	RCQ	Reconquista Airport	-29.2103	-59.68
AR	Formosa	LLS	Alferez Armando Rodriguez Airport	-24.7214	-60.5488
AR	Cordoba	RCU	Las Higueras Airport	-33.0851	-64.2613
AR	Santa Fe	NCJ	Sunchales Airport	-30.9575	-61.5283
AR	Buenos Aires	MJR	Miramar Airport	-38.2271	-57.8697
AR	Neuquen	RDS	Rincon de los Sauces Airport	-37.3906	-68.9042
AR	Chubut	REL	Almirante Marcos A. Zar Airport	-43.2105	-65.2703
AR	Cordoba	VDR	Villa Dolores Airport	-31.9452	-65.1463
AR	Corrientes	MCS	Monte Caseros Airport	-30.2719	-57.6402
AR	Santa Cruz	LHS	Las Heras Airport	-46.5383	-68.9653
AR	Mendoza	LGS	Comodoro D. Ricardo Salomon Airport	-35.4936	-69.5743
AR	Buenos Aires	BHI	Comandante Espora Airport	-38.725	-62.1693
AR	Buenos Aires	MDQ	Astor Piazzolla International Airport	-37.9342	-57.5733
AR	Neuquen	LCP	Loncopue Airport	-38.0819	-70.6439
AR	Cordoba	LCM	La Cumbre Airport	-31.0058	-64.5319
AR	Chaco	RES	Resistencia International Airport	-27.45	-59.0561
AR	Neuquen	NQN	Presidente Peron International Air	-38.949	-68.1557
AR	Corrientes	MDX	Mercedes Airport	-29.2214	-58.0878
AR	Neuquen	CVH	Caviahue Airport	-37.8514	-71.0092
AR	Santa Cruz	CVI	Caleta Olivia Airport	-46.4318	-67.5186
AR	Rio Negro	VDM	Gobernador Edgardo Castello Airport	-40.8692	-63.0004
AR	Tierra del Fuego	RGA	Hermes Quijada International Airport	-53.7777	-67.7494
AR	Santa Cruz	RGL	Piloto Civil Norberto Fernandez International Airport	-51.6089	-69.3126
AR	Chubut	EQS	Esquel Airport	-42.908	-71.1395
AR	Mendoza	MDZ	Gov. Francisco Gabrielli International Airport (El Plumerillo)	-32.8317	-68.7929
AR	Santiago del Estero	RHD	Termas de Rio Hondo Airport	-27.4966	-64.936
AR	Corrientes	AOL	Paso de los Libres Airport	-29.6894	-57.1521
AR	Misiones	IGR	Cataratas del Iguazu International Airport	-25.7373	-54.4734
AR	Chaco	CNT	Charata Airport	-27.2164	-61.2103
AR	Rio Negro	CCT	Colonia Catriel Airport	-37.9102	-67.835
AR	Rio Negro	VCF	Valcheta Airport	-40.7	-66.15
AR	Rio Negro	IGB	Ingeniero Jacobacci Airport (Capitan FAA H. R. Borden Airport)	-41.3209	-69.5749
AR	Buenos Aires	NEC	Necochea Airport	-38.4831	-58.8172
AR	Buenos Aires	AEP	Aeroparque Internacional Jorge Newbery	-34.5589	-58.4164
AR	Buenos Aires	EZE	Ministro Pistarini International Airport	-34.8222	-58.5358
AS	Eastern District	PPG	Pago Pago International Airport	-14.331	-170.71
AS	Eastern District	TAV	Tau Airport	-14.2292	-169.511
AS	Eastern District	OFU	Ofu Airport	-14.1844	-169.67
AT	Oberosterreich	LNZ	Linz Airport (Blue Danube Airport)	48.2332	14.1875
AT	Salzburg	SZG	Salzburg Airport	47.7933	13.0043
AT	Karnten	KLU	Klagenfurt Airport	46.6425	14.3377
AT	Steiermark	GRZ	Graz Airport	46.9911	15.4396
AT	Tirol	INN	Innsbruck Airport (Kranebitten Airport)	47.2602	11.344
AT	Niederosterreich	VIE	Vienna International Airport	48.1103	16.5697
AT	Vorarlberg	HOH	Hohenems-Dornbirn Airport	47.385	9.7
AU	Queensland	PHQ	The Monument Airport	-21.8111	139.924
AU	Western Australia	CBC	Cherrabun Airport	-18.9178	125.538
AU	Northern Territory	MSF	Mount Swan Airport	-22.6247	135.035
AU	Queensland	AAB	Arrabury Airport	-26.693	141.048
AU	Queensland	XTO	Taroom Airport	-25.8017	149.9
AU	Western Australia	MXU	Mullewa Airport	-28.475	115.517
AU	South Australia	CED	Ceduna Airport	-32.1306	133.71
AU	Queensland	RSB	Roseberth Airport	-25.8333	139.65
AU	Queensland	HVB	Hervey Bay Airport	-25.3189	152.88
AU	Northern Territory	RRV	Robinson River Airport (Northern Territory)	-16.7183	136.945
AU	South Australia	RRE	Marree Airport	-29.6633	138.065
AU	Western Australia	DCN	RAAF Base Curtin	-17.5814	123.828
AU	Northern Territory	RPV	Roper Valley Airport	-14.9215	134.05
AU	Queensland	XTG	Thargomindah Airport	-27.9864	143.811
AU	South Australia	HWK	Wilpena Pound Airport	-31.8559	138.468
AU	Queensland	MXD	Marion Downs Airport	-23.3637	139.65
AU	Northern Territory	RPM	Ngukurr Airport	-14.7228	134.747
AU	New South Wales	HXX	Hay Airport	-34.5314	144.83
AU	Queensland	DDN	Delta Downs Airport	-16.9917	141.317
AU	New South Wales	CES	Cessnock Airport	-32.7875	151.342
AU	Northern Territory	RPB	Roper Bar Airport	-14.7348	134.525
AU	Queensland	ROK	Rockhampton Airport	-23.3819	150.475
AU	Queensland	ROH	Robinhood Airport	-18.845	143.71
AU	Queensland	MWY	Miranda Downs Airport	-17.3289	141.886
AU	Queensland	LRE	Longreach Airport	-23.4342	144.28
AU	South Australia	RMK	Renmark Airport	-34.1964	140.674
AU	Queensland	RMA	Roma Airport	-26.545	148.775
AU	South Australia	MWT	Moolawatana Airport	-29.9069	139.765
AU	Queensland	RLP	Rosella Plains Airport	-18.4253	144.459
AU	Queensland	ABG	Abingdon Airport	-17.6167	143.167
AU	Queensland	ABH	Alpha Airport	-23.6461	146.584
AU	New South Wales	XRH	RAAF Base Richmond	-33.6006	150.781
AU	Queensland	RKY	Rokeby Airport	-13.6434	142.641
AU	South Australia	IDK	Indulkana Airport	-26.9667	133.325
AU	Western Australia	MWB	Morawa Airport	-29.2017	116.022
AU	Queensland	ABM	Northern Peninsula Airport	-10.9508	142.459
AU	Queensland	IFF	Iffley Airport	-18.9	141.217
AU	Queensland	IFL	Innisfail Airport	-17.5594	146.012
AU	Queensland	IGH	Ingham Airport	-18.6606	146.152
AU	New South Wales	BHQ	Broken Hill Airport	-32.0014	141.472
AU	Western Australia	ZNE	Newman Airport	-23.4178	119.803
AU	New South Wales	BHS	Bathurst Airport	-33.4094	149.652
AU	Queensland	BHT	Brighton Downs Airport	-23.3639	141.563
AU	South Australia	CFH	Clifton Hills Airport	-27.0183	138.892
AU	Northern Territory	CFI	Camfield Airport	-17.0217	131.327
AU	New South Wales	ABX	Albury Airport	-36.0678	146.958
AU	Queensland	MVU	Musgrave Airport	-14.7757	143.505
AU	Western Australia	RHL	Roy Hill Station Airport	-22.6258	119.959
AU	Queensland	IKP	Inkerman Airport	-16.275	141.442
AU	Queensland	INJ	Injune Airport	-25.851	148.55
AU	Queensland	CFP	Carpentaria Downs Airport	-18.7167	144.317
AU	South Australia	RCN	American River Airport	-35.7574	137.776
AU	Queensland	DFP	Drumduff Airport	-16.053	143.012
AU	New South Wales	CFS	Coffs Harbour Airport	-30.3206	153.116
AU	Queensland	RCM	Richmond Airport	-20.7019	143.115
AU	South Australia	INM	Innamincka Airport	-27.7	140.733
AU	Western Australia	RBU	Roebourne Airport	-20.7617	117.157
AU	Western Australia	DGD	Dalgaranga Airport	-27.8303	117.316
AU	New South Wales	DGE	Mudgee Airport	-32.5625	149.611
AU	Victoria	RBS	Orbost Airport	-37.79	148.61
AU	Victoria	RBC	Robinvale Airport	-34.65	142.783
AU	South Australia	MVK	Mulka Airport	-28.3478	138.65
AU	New South Wales	MVH	Macksville Airport	-30.7	152.917
AU	Queensland	IRG	Lockhart River Airport	-12.7869	143.305
AU	Queensland	XMY	Yam Island Airport	-9.90111	142.776
AU	Queensland	BIP	Bulimba Airport	-16.8808	143.479
AU	Northern Territory	RAM	Ramingining Airport	-12.3564	134.898
AU	Queensland	ISA	Mount Isa Airport	-20.6639	139.489
AU	Queensland	ISI	Isisford Airport	-24.2583	144.425
AU	South Australia	XML	Minlaton Airport	-34.75	137.533
AU	New South Wales	IVR	Inverell Airport	-29.8883	151.144
AU	Western Australia	YNN	Yandicoogina Airport	59.4875	-97.7803
AU	Western Australia	BIW	Billiluna Airport	-19.5667	127.667
AU	Victoria	XMC	Mallacoota Airport	-37.5983	149.72
AU	Northern Territory	IVW	Inverway Airport	-17.8411	129.643
AU	Tasmania	LST	Launceston Airport	-41.5453	147.214
AU	South Australia	PXH	Prominent Hill Airport	-29.716	135.524
AU	Queensland	DHD	Durham Downs Airport	-27.075	141.9
AU	South Australia	ADL	Adelaide Airport	-34.945	138.531
AU	Northern Territory	JAB	Jabiru Airport	-12.6583	132.893
AU	Western Australia	JAD	Jandakot Airport	-32.0975	115.881
AU	South Australia	ADO	Andamooka Airport	-30.4383	137.137
AU	New South Wales	LSY	Lismore Airport	-28.8303	153.26
AU	Western Australia	CGV	Caiguna Airport	-32.265	125.493
AU	Queensland	JCK	Julia Creek Airport	-20.6683	141.723
AU	Tasmania	LTB	Latrobe Airport	-41.2352	146.396
AU	Western Australia	MUQ	Muccan Station Airport	-20.6589	120.067
AU	Queensland	ZGL	South Galway Airport	-25.6833	142.108
AU	Northern Territory	MUP	Mulga Park Airport	-25.86	131.65
AU	South Australia	PUG	Port Augusta Airport	-32.5069	137.717
AU	Victoria	PTJ	Portland Airport	-38.3181	141.471
AU	Western Australia	PRD	Pardoo Airport	-20.1175	119.59
AU	New South Wales	PQQ	Port Macquarie Airport	-31.4358	152.863
AU	Queensland	PPP	Whitsunday Coast Airport	-20.495	148.552
AU	South Australia	PPI	Port Pirie Airport	-33.2389	137.995
AU	Queensland	JUN	Jundah Airport	-24.8417	143.058
AU	Western Australia	JUR	Jurien Bay Airport	-30.3016	115.056
AU	Western Australia	KAX	Kalbarri Airport	-27.6928	114.259
AU	Northern Territory	KBB	Kirkimbie Airport	-17.7792	129.21
AU	Western Australia	KBD	Kimberley Downs Airport	-17.3978	124.355
AU	Queensland	LTP	Lyndhurst Airport	-19.1958	144.371
AU	Northern Territory	KBJ	Kings Canyon Airport	-24.26	131.49
AU	Queensland	PMK	Palm Island Airport	-18.7553	146.581
AU	South Australia	KBY	Streaky Bay Airport	-32.8358	134.293
AU	Queensland	KCE	Collinsville Airport	-20.5967	147.86
AU	South Australia	PLO	Port Lincoln Airport	-34.6053	135.88
AU	Northern Territory	KCS	Kings Creek Station Airport	-24.4233	131.835
AU	Northern Territory	PKT	Port Keats Airfield	-14.25	129.529
AU	Queensland	LTV	Lotus Vale Station Airport	-17.0483	141.376
AU	Western Australia	KDB	Kambalda Airport	-31.1907	121.598
AU	Queensland	KDS	Kamaran Downs Airport	-24.3388	139.279
AU	New South Wales	PKE	Parkes Airport	-33.1314	148.239
AU	Western Australia	PHE	Port Hedland International Airport	-20.3778	118.626
AU	Queensland	MFL	Mount Full Stop Airport	-19.67	144.885
AU	Queensland	ZBO	Bowen Airport	-20.0183	148.215
AU	Western Australia	KFE	Fortescue Dave Forrest Airport	-22.2908	119.437
AU	Queensland	MTQ	Mitchell Airport	-26.4833	147.937
AU	New South Wales	MTL	Maitland Airport	-32.7013	151.493
AU	Queensland	ZBL	Biloela Airport	-24.4	150.51
AU	Northern Territory	KFG	Kalkgurung Airport	-17.4319	130.808
AU	South Australia	KGC	Kingscote Airport	-35.7139	137.521
AU	Queensland	BKP	Barkly Downs Airport	-20.4958	138.475
AU	Queensland	BKQ	Blackall Airport	-24.4278	145.429
AU	Western Australia	KGI	Kalgoorlie-Boulder Airport	-30.7894	121.462
AU	Western Australia	CIE	Collie Airport	-33.3667	116.217
AU	South Australia	PEY	Penong Airport	-31.9167	133
AU	Queensland	DKI	Dunk Island Airport	-17.9417	146.14
AU	Northern Territory	KGR	Kulgera Airport	-25.8428	133.292
AU	Western Australia	PER	Perth Airport	-31.9403	115.967
AU	Northern Territory	PEP	Peppimenarti Airport	-14.1442	130.091
AU	Northern Territory	DKV	Docker River Airport	-24.86	129.07
AU	Queensland	KGY	Kingaroy Airport	-26.5808	151.841
AU	South Australia	PEA	Penneshaw Airport	-35.7558	137.963
AU	South Australia	PDN	Parndana Airport	-35.807	137.264
AU	South Australia	PDE	Pandie Pandie Airport	-26.1167	139.4
AU	Northern Territory	MTD	Mount Sandford Station Airport	-16.9783	130.555
AU	Western Australia	PBO	Paraburdoo Airport	-23.1711	117.745
AU	Queensland	AGW	Agnew Airport	-12.1456	142.149
AU	Queensland	KKP	Koolburra Airport	-15.3189	143.955
AU	Victoria	OYN	Ouyen Airport	-35.089	142.354
AU	Queensland	LUT	New Laura Airport	-15.1833	144.367
AU	Queensland	LUU	Laura Airport	-15.55	144.45
AU	South Australia	DLK	Dulkaninna Airport	-29.0133	138.481
AU	Victoria	XCO	Colac Airport	-38.2867	143.68
AU	Queensland	OXY	Morney Airport	-25.3583	141.433
AU	Queensland	OXO	Orientos Airport	-28.0598	141.536
AU	Western Australia	MGV	Margaret River Station Airport	-18.6217	126.883
AU	Victoria	BLN	Benalla Airport	-36.5519	146.007
AU	Queensland	KML	Kamileroi Airport	-19.375	140.057
AU	Northern Territory	DLV	Delissaville Airport	-12.55	130.685
AU	Queensland	OSO	Osborne Mine Airport	-22.0817	140.555
AU	Western Australia	KNI	Katanning Airport	-33.7167	117.633
AU	Queensland	BLS	Bollon Airport	-28.0583	147.483
AU	Queensland	BLT	Blackwater Airport	-23.6031	148.807
AU	Western Australia	CJF	Coondewanna Airport	-22.9667	118.813
AU	Tasmania	KNS	King Island Airport	-39.8775	143.878
AU	Western Australia	KNX	East Kimberley Regional Airport	-15.7781	128.708
AU	Queensland	DMD	Doomadgee Airport	-17.9403	138.822
AU	Queensland	ORS	Orpheus Island Resort Waterport	-18.634	146.5
AU	South Australia	ORR	Yorketown Airport	-35	137.617
AU	Western Australia	LVO	Laverton Airport	-28.6136	122.424
AU	Western Australia	YLG	Yalgoo Airport	-28.3553	116.684
AU	Queensland	KOH	Koolatah Airport	-15.8886	142.439
AU	Queensland	OPI	Oenpelli Airport	-12.325	133.006
AU	New South Wales	MRZ	Moree Airport	-29.4989	149.845
AU	Western Australia	BME	Broome International Airport	-17.9447	122.232
AU	Queensland	OOR	Mooraberree Airport	-25.25	140.983
AU	New South Wales	OOM	Cooma-Snowy Mountains Airport	-36.3006	148.974
AU	Northern Territory	MRT	Moroak Airport	-14.8181	133.701
AU	Queensland	KPP	Kalpowar Airport	-14.89	144.22
AU	Queensland	OOL	Gold Coast Airport (Coolangatta Airport)	-28.1644	153.505
AU	Queensland	LWH	Lawn Hill Airport	-18.5683	138.635
AU	New South Wales	KPS	Kempsey Airport	-31.0744	152.77
AU	Queensland	DNB	Dunbar Airport	-16.05	142.4
AU	Northern Territory	CKI	Croker Island Airport	-11.165	132.483
AU	Western Australia	ONS	Onslow Airport	-21.6683	115.113
AU	Western Australia	DNG	Doongan Airport	-15.3864	126.302
AU	Queensland	BMP	Brampton Island Airport	-20.8033	149.27
AU	South Australia	MRP	Marla Airport	-27.3333	133.627
AU	Queensland	MRL	Miners Lake Airport	46.3834	-82.6331
AU	Queensland	ONR	Monkira Airport	-24.8167	140.533
AU	Queensland	ONG	Mornington Island Airport	-16.6625	139.178
AU	Queensland	MRG	Mareeba Airfield	-17.0692	145.419
AU	Western Australia	WYN	Wyndham Airport	-15.5114	128.153
AU	Western Australia	MQZ	Margaret River Airport	-33.9306	115.1
AU	South Australia	WYA	Whyalla Airport	-33.0589	137.514
AU	Western Australia	DNM	Denham Airport	-25.8882	113.577
AU	Western Australia	KQR	Karara Airport	-29.2167	116.687
AU	Victoria	KRA	Kerang Airport	-35.7514	143.939
AU	New South Wales	WWY	West Wyalong Airport	-33.9372	147.191
AU	Western Australia	CKW	Graeme Rowley Aerodrome	-22.3543	119.643
AU	New South Wales	DNQ	Deniliquin Airport	-35.5594	144.946
AU	Queensland	KRB	Karumba Airport	-17.4567	140.83
AU	Western Australia	WWI	Woodie Woodie Airport	-21.6628	121.234
AU	Victoria	MQL	Mildura Airport	-34.2292	142.086
AU	Northern Territory	KRD	Kurundi Airport	-20.51	134.671
AU	Queensland	BNE	Brisbane Airport	-27.3842	153.117
AU	South Australia	OLP	Olympic Dam Airport	-30.485	136.877
AU	Northern Territory	MFP	Manners Creek Airport	-22.1	137.983
AU	Northern Territory	MQE	Marqua Airport	-22.8058	137.251
AU	Queensland	OKY	Oakey Army Aviation Centre	-27.4114	151.735
AU	New South Wales	BNK	Ballina Byron Gateway Airport	-28.8339	153.562
AU	New South Wales	CLH	Coolah Airport	-31.7733	149.61
AU	Queensland	OKR	Yorke Island Airport	-9.7528	143.406
AU	Queensland	KSV	Springvale Airport	-23.55	140.7
AU	Queensland	OKB	Orchid Beach Airport	-24.9594	153.315
AU	Western Australia	WUN	Wiluna Airport	-26.6292	120.221
AU	Western Australia	WUI	Murrin Murrin Airport	-28.7053	121.891
AU	Western Australia	KTA	Karratha Airport	-20.7122	116.773
AU	Western Australia	MQA	Mandora Station Airport	-19.7383	120.838
AU	Northern Territory	MGT	Milingimbi Airport	-12.0944	134.894
AU	Northern Territory	KTR	RAAF Base Tindal	-14.5211	132.378
AU	Western Australia	ODR	Ord River Airport	-17.3408	128.912
AU	Western Australia	ALH	Albany Airport	-34.9433	117.809
AU	South Australia	WUD	Wudinna Airport	-33.0433	135.447
AU	Queensland	LYT	Lady Elliot Island Airport	-24.1129	152.716
AU	South Australia	ODL	Cordillo Downs Airport	-26.7453	140.638
AU	Queensland	KUG	Kubin Airport	-10.225	142.218
AU	South Australia	ODD	Oodnadatta Airport	-27.5617	135.447
AU	Western Australia	DOX	Dongara Airport	-29.2981	114.927
AU	Western Australia	OCM	Boolgeeda Airport	-22.54	117.275
AU	Queensland	OBA	Oban Airport	56.4657	-5.3977
AU	Queensland	KWM	Kowanyama Airport	-15.4856	141.751
AU	Queensland	CMA	Cunnamulla Airport	-28.03	145.622
AU	New South Wales	OAG	Orange Airport	-33.3817	149.133
AU	Queensland	WTB	Toowoomba Wellcamp Airport	-27.5583	151.793
AU	Queensland	MOV	Moranbah Airport	-22.0578	148.077
AU	New South Wales	CMD	Cootamundra Airport	-34.6239	148.028
AU	Tasmania	DPO	Devonport Airport	-41.1697	146.43
AU	Queensland	LZR	Lizard Island Airport	-14.6733	145.455
AU	South Australia	MOO	Moomba Airport	-28.0994	140.197
AU	New South Wales	NYN	Nyngan Airport	-31.5511	147.203
AU	Queensland	WSY	Whitsunday Airport	-20.2761	148.755
AU	Western Australia	KYF	Yeelirrie Airport	-27.2771	120.096
AU	South Australia	KYI	Yalata Airport	-31.4706	131.825
AU	Western Australia	DRB	Derby Airport	-17.37	123.661
AU	Queensland	DRD	Dorunda Airport	-16.5537	141.824
AU	Northern Territory	BOX	Borroloola Airport	-16.0753	136.302
AU	Queensland	CML	Camooweal Airport	-19.9117	138.125
AU	Western Australia	WRW	Warrawagine Airport	-20.8442	120.702
AU	Western Australia	WRN	Windarling Airport	-30.0317	119.39
AU	South Australia	NUR	Nullabor Motel Airport	-31.4417	130.902
AU	Northern Territory	NUB	Numbulwar Airport	-14.2717	135.717
AU	Queensland	CMQ	Clermont Airport	-22.7731	147.621
AU	South Australia	AMT	Amata Airport	-26.1083	131.207
AU	Queensland	NTN	Normanton Airport	-17.6841	141.07
AU	New South Wales	NTL	Newcastle Airport / RAAF Base Williamtown	-32.795	151.834
AU	Northern Territory	AMX	Ammaroo Airport	-21.7383	135.242
AU	Queensland	DRN	Dirranbandi Airport	-28.5917	148.217
AU	Northern Territory	MNW	MacDonald Downs Airport	-22.444	135.199
AU	Northern Territory	MNV	Mount Valley Airport	-14.1167	133.833
AU	Queensland	MNQ	Monto Airport	-24.8858	151.1
AU	Queensland	NSV	Noosa Airport	-26.4233	153.063
AU	Queensland	DRR	Durrie Airport	-25.685	140.228
AU	New South Wales	NSO	Scone Airport	-32.0372	150.832
AU	Queensland	WPK	Wrotham Park Airport	-16.6583	144.002
AU	Western Australia	NSM	Norseman Airport	-32.21	121.755
AU	Northern Territory	NRY	Newry Airport	-16.0442	129.264
AU	Northern Territory	DRW	Darwin International Airport	-12.4147	130.877
AU	New South Wales	CNB	Coonamble Airport	-30.9833	148.376
AU	Northern Territory	MNG	Maningrida Airport	-12.0561	134.234
AU	Western Australia	BQB	Busselton Regional Airport	-33.6884	115.402
AU	Queensland	CNC	Coconut Island Airport	-10.05	143.07
AU	Western Australia	DRY	Drysdale River Airport	-15.7136	126.381
AU	New South Wales	LBH	Palm Beach Water Airport	-33.5871	151.323
AU	South Australia	MNE	Mungeranie Airport	-28.0092	138.657
AU	Western Australia	NRG	Narrogin Airport	-32.93	117.08
AU	New South Wales	NRA	Narrandera Airport	-34.7022	146.512
AU	Queensland	BQL	Boulia Airport	-22.9133	139.9
AU	Northern Territory	ANZ	Angus Downs Airport	-25.0325	132.275
AU	South Australia	LCN	Balcanoona Airport	-30.535	139.337
AU	Queensland	WON	Wondoola Airport	-18.575	140.892
AU	Queensland	CNJ	Cloncurry Airport	-20.6686	140.504
AU	New South Wales	WOL	Illawarra Regional Airport	-34.5611	150.789
AU	Western Australia	MBB	Marble Bar Airport	-21.1633	119.833
AU	Northern Territory	NPP	Napperby Airport	-22.5312	133.763
AU	Queensland	WNR	Windorah Airport	-25.4131	142.667
AU	Queensland	LDC	Lindeman Island Airport	-20.4536	149.04
AU	Western Australia	BQW	Balgo Hill Airport	-20.1483	127.973
AU	New South Wales	LDH	Lord Howe Island Airport	-31.5383	159.077
AU	New South Wales	NOA	NAS Nowra	-34.9489	150.537
AU	Victoria	MBF	Porepunkah Airfield	-36.7187	146.89
AU	Western Australia	WND	Windarra Airport	-28.475	122.242
AU	Queensland	CNS	Cairns Airport	-16.8858	145.755
AU	Queensland	MBH	Maryborough Airport	-25.5133	152.715
AU	Queensland	MMM	Middlemount Airport	-22.8025	148.705
AU	Western Australia	LDW	Lansdowne Airport	-17.6128	126.743
AU	Victoria	BRJ	Bright Airport	-36.733	146.967
AU	New South Wales	BRK	Bourke Airport	-30.0392	145.952
AU	Western Australia	WME	Mount Keith Airport	-27.2864	120.555
AU	Western Australia	MBN	Mount Barnett Airport	-16.6573	125.961
AU	Western Australia	LEA	RAAF Learmonth (Learmonth Airport)	-22.2356	114.089
AU	Western Australia	MMG	Mount Magnet Airport	-28.1161	117.842
AU	Northern Territory	LEL	Lake Evella Airport	-12.4989	135.806
AU	Victoria	WMB	Warrnambool Airport	-38.2953	142.447
AU	Western Australia	WLP	West Angelas Airport	-23.1356	118.707
AU	Northern Territory	COB	Coolibah Airport	-15.5483	130.962
AU	Queensland	NMR	Nappa Merrie Airport	-27.5583	141.133
AU	Northern Territory	BRT	Bathurst Island Airport	-11.7692	130.62
AU	Northern Territory	WLO	Waterloo Airport	-16.63	129.32
AU	Western Australia	LER	Leinster Airport	-27.8433	120.703
AU	Queensland	MLV	Merluna Airport	-13.0649	142.454
AU	Northern Territory	WLL	Wollogorang Airport	-17.2199	137.935
AU	Queensland	WLE	Miles Airport	-26.8083	150.175
AU	New South Wales	WLC	Walcha Airport	-31	151.567
AU	New South Wales	COJ	Coonabarabran Airport	-31.3325	149.267
AU	Queensland	NMP	New Moon Airport	-19.2	145.773
AU	Victoria	MBW	Moorabbin Airport	-37.9758	145.102
AU	Western Australia	WLA	Wallal Airport	-19.7736	120.649
AU	Western Australia	NLS	Nicholson Airport	-18.05	128.9
AU	South Australia	MLR	Millicent Airport	-37.5836	140.366
AU	Western Australia	NLL	Nullagine Airport	-21.9133	120.198
AU	Queensland	LFP	Lakefield Airport	-14.9207	144.203
AU	Victoria	WKB	Warracknabeal Airport	-36.3211	142.419
AU	Western Australia	WIT	Wittenoom Airport	-22.2183	118.348
AU	Victoria	BSJ	Bairnsdale Airport	-37.8875	147.568
AU	New South Wales	WIO	Wilcannia Airport	-31.5264	143.375
AU	Queensland	WIN	Winton Airport	-22.3636	143.086
AU	Queensland	NLF	Darnley Island Airport	-9.58333	143.767
AU	Western Australia	LGE	Lake Gregory Airport	-20.1089	127.619
AU	Queensland	MKY	Mackay Airport	-21.1717	149.18
AU	Western Australia	COY	Coolawanyah Station Airport	-21.7946	117.755
AU	Western Australia	NKB	Noonkanbah Airport	-18.4947	124.852
AU	South Australia	LGH	Leigh Creek Airport	-30.5983	138.426
AU	New South Wales	ARM	Armidale Airport	-30.5281	151.617
AU	Northern Territory	MKV	Mount Cavenagh Airport	-25.9667	133.2
AU	Western Australia	NIF	Nifty Airport	-21.6717	121.587
AU	South Australia	CPD	Coober Pedy Airport	-29.04	134.721
AU	New South Wales	LHG	Lightning Ridge Airport	-29.4567	147.984
AU	Northern Territory	LIB	Limbunya Airport	-17.2356	129.882
AU	New South Wales	NGA	Young Airport	-34.2556	148.248
AU	Victoria	WHL	Welshpool Airport	-38.6824	146.445
AU	Victoria	WGT	Wangaratta Airport	-36.4158	146.307
AU	Victoria	ARY	Ararat Airport	-37.3094	142.989
AU	Western Australia	NDS	Sandstone Airport	-27.98	119.297
AU	Queensland	DVP	Davenport Downs Airport	-24.15	141.108
AU	Northern Territory	BTD	Brunette Downs Airport	-18.64	135.938
AU	Northern Territory	DVR	Daly River Airport	-13.7498	130.694
AU	Western Australia	MKR	Meekatharra Airport	-26.6117	118.548
AU	Queensland	LKD	Lakeland Downs Airport	-15.8333	144.85
AU	New South Wales	WGE	Walgett Airport	-30.0328	148.126
AU	Queensland	LLG	Chillagoe Airport	-17.1428	144.529
AU	New South Wales	WGA	Wagga Wagga Airport	-35.1653	147.466
AU	New South Wales	WEW	Wee Waa Airport	-30.2583	149.408
AU	Queensland	WEI	Weipa Airport	-12.6786	141.925
AU	Queensland	DXD	Dixie Airport	-15.1175	143.316
AU	Western Australia	LLL	Lissadell Airport	-16.661	128.594
AU	Queensland	CQP	Cape Flattery Airport	-14.9708	145.312
AU	Northern Territory	ASP	Alice Springs Airport	-23.8067	133.902
AU	Queensland	LLP	Linda Downs Airport	-23.0167	138.7
AU	Northern Territory	MCV	McArthur River Mine Airport	-16.4425	136.084
AU	Queensland	DYA	Dysart Airport	-22.6222	148.364
AU	New South Wales	NBH	Nambucca Heads Airport	-30.65	153
AU	Queensland	MCY	Sunshine Coast Airport	-26.6033	153.091
AU	New South Wales	CRB	Collarenebri Airport	-29.5217	148.582
AU	Northern Territory	YUE	Yuendumu Airport	-22.2542	131.782
AU	Northern Territory	LNH	Lake Nash Airport	-20.9807	137.918
AU	Queensland	DYM	Diamantina Lakes Airport	-23.7617	141.145
AU	Queensland	WDI	Wondai Airport	-26.2833	151.858
AU	Western Australia	LNO	Leonora Airport	-28.8781	121.315
AU	Queensland	BTX	Betoota Airport	-25.6417	140.783
AU	Queensland	CRH	Cherrabah Airport	-28.4301	152.089
AU	South Australia	NAC	Naracoorte Airport	-36.9853	140.725
AU	South Australia	CRJ	Coorabie Airport	-31.8944	132.296
AU	Queensland	BUC	Burketown Airport	-17.7486	139.534
AU	Northern Territory	DYW	Daly Waters Airport	-16.2647	133.383
AU	Western Australia	MJP	Manjimup Airport	-34.2653	116.14
AU	New South Wales	NAA	Narrabri Airport	-30.3192	149.827
AU	Queensland	LOA	Lorraine Airport	-18.9933	139.907
AU	Queensland	WAZ	Warwick Airport	-28.1494	151.943
AU	Northern Territory	WAV	Wave Hill Airport	-17.3933	131.118
AU	South Australia	LOC	Lock Airport	-33.5442	135.693
AU	New South Wales	WAU	Wauchope Airport	-20.6406	134.215
AU	Western Australia	MJK	Shark Bay Airport	-25.8939	113.577
AU	South Australia	MGB	Mount Gambier Airport	-37.7456	140.785
AU	Northern Territory	MIZ	Mainoru Airport	-14.0533	134.094
AU	Western Australia	MYO	Myroodah Airport	-18.1247	124.272
AU	Northern Territory	MIY	Mittiebah Airport	-18.8093	137.081
AU	Queensland	WAN	Waverney Airport	-25.3563	141.925
AU	Queensland	MYI	Murray Island Airport	-9.91667	144.055
AU	New South Wales	MYA	Moruya Airport	-35.8978	150.144
AU	Queensland	AUD	Augustus Downs Airport	-18.515	139.878
AU	Western Australia	CRY	Carlton Hill Airport	-15.5019	128.534
AU	Victoria	ECH	Echuca Airport	-36.1572	144.762
AU	Northern Territory	EDD	Erldunda Airport	-25.2058	133.254
AU	Victoria	MEB	Essendon Airport	-37.7281	144.902
AU	Queensland	EDR	Edward River Airport	-14.8965	141.609
AU	Queensland	VNR	Vanrook Airport	-16.9633	141.95
AU	South Australia	MIN	Minnipa Airport	-32.8433	135.145
AU	New South Wales	MIM	Merimbula Airport	-36.9086	149.901
AU	Western Australia	BUY	Bunbury Airport	-33.3783	115.677
AU	Northern Territory	CSD	Cresswell Downs Airport	-17.948	135.916
AU	Queensland	EIH	Einasleigh Airport	-18.5033	144.094
AU	Queensland	AUU	Aurukun Airport	-13.3541	141.721
AU	Northern Territory	EKD	Elkedra Airport	-21.1725	135.444
AU	Northern Territory	ELC	Elcho Island Airport	-12.0194	135.571
AU	Western Australia	MIH	Mitchell Plateau Airport	-14.7914	125.824
AU	Victoria	MEL	Melbourne Airport	-37.6733	144.843
AU	Northern Territory	VCD	Victoria River Downs Airport	-16.4021	131.005
AU	New South Wales	CSI	Casino Airport	-28.8828	153.067
AU	Northern Territory	AVG	Auvergne Airport	-15.7	130
AU	Queensland	EMD	Emerald Airport	-23.5675	148.179
AU	Northern Territory	UTD	Nutwood Downs Airport	-15.8074	134.146
AU	Queensland	BVI	Birdsville Airport	-25.8975	139.348
AU	Queensland	UTB	Muttaburra Airport	-22.5833	144.533
AU	Western Australia	USL	Useless Loop Airport	-26.1667	113.4
AU	Western Australia	ENB	Eneabba Airport	-29.8325	115.246
AU	Western Australia	EPR	Esperance Airport	-33.6844	121.823
AU	Victoria	AVV	Avalon Airport	-38.0394	144.469
AU	Northern Territory	RDA	Rockhampton Downs Airport	-18.9533	135.201
AU	South Australia	ERB	Pukatja Airport (Ernabella Airport)	-26.2633	132.182
AU	South Australia	UMR	RAAF Woomera Airfield	-31.1442	136.817
AU	Queensland	MET	Moreton Airport	-12.4442	142.638
AU	Queensland	ERQ	Elrose Airport	-20.9764	141.007
AU	Queensland	BVW	Batavia Downs Airport	-12.6592	142.675
AU	Queensland	ULP	Quilpie Airport	-26.6122	144.253
AU	South Australia	AWN	Alton Downs Airport	-26.5333	139.267
AU	Northern Territory	AWP	Austral Downs Airport	-20.5	137.75
AU	New South Wales	UIR	Quirindi Airport	-31.4906	150.514
AU	Victoria	MHU	Mount Hotham Airport	-37.0475	147.334
AU	Queensland	AXC	Aramac Airport	-22.9667	145.242
AU	Western Australia	BVZ	Beverley Springs Airport	-16.7333	125.433
AU	Tasmania	UEE	Queenstown Airport	-42.075	145.532
AU	Western Australia	BWB	Barrow Island Airport	-20.8644	115.406
AU	Queensland	UDA	Undara Airport	-18.2	144.6
AU	Western Australia	UBU	Kalumburu Airport	-14.2883	126.632
AU	South Australia	ETD	Etadunna Airport	-28.7408	138.589
AU	Northern Territory	AXL	Alexandria Homestead Airport	-19.0602	136.71
AU	Queensland	UBB	Mabuiag Island Airport	-9.95	142.183
AU	Western Australia	MHO	Mount House Airport	-17.055	125.71
AU	Western Australia	EUC	Eucla Airport	-31.7	128.883
AU	Northern Territory	EVD	Eva Downs Airport	-18.001	134.863
AU	Queensland	CTL	Charleville Airport	-26.4133	146.262
AU	New South Wales	EVH	Evans Head Memorial Aerodrome	-29.0933	153.42
AU	Queensland	CTN	Cooktown Airport	-15.4447	145.184
AU	Northern Territory	TYP	Tobermorey Airport	-22.2558	137.953
AU	Queensland	TYG	Thylungra Airport	-26.0833	143.467
AU	New South Wales	TYB	Tibooburra Airport	-29.4511	142.058
AU	New South Wales	BWQ	Brewarrina Airport	-29.9739	146.817
AU	Northern Territory	AYD	Alroy Downs Airport	-19.2908	136.079
AU	Tasmania	BWT	Burnie Airport	-40.9989	145.731
AU	New South Wales	BWU	Bankstown Airport	-33.9244	150.988
AU	Northern Territory	AYL	Anthony Lagoon Airport	-18.0181	135.535
AU	Northern Territory	CTR	Cattle Creek Airport	-17.607	131.549
AU	Western Australia	EXM	Exmouth Airport	-22.0333	114.1
AU	Queensland	TXR	Tanbar Airport	-25.8478	141.928
AU	Northern Territory	AYQ	Ayers Rock Airport	-25.1861	130.976
AU	Queensland	AYR	Ayr Airport	-19.5844	147.329
AU	Queensland	TWP	Torwood Airport	-17.3633	143.75
AU	Queensland	TWN	Tewantin Airport	-26.388	153.028
AU	Western Australia	BXF	Bellburn Airstrip	-17.545	128.305
AU	Victoria	BXG	Bendigo Airport	-36.7394	144.33
AU	Queensland	TWB	Toowoomba City Aerodrome	-27.5428	151.916
AU	New South Wales	TUM	Tumut Airport	-35.2628	148.241
AU	Western Australia	TTX	Truscott-Mungalalu Airport	-14.0897	126.381
AU	Queensland	TSV	Townsville Airport	-19.2525	146.765
AU	New South Wales	TRO	Taree Airport	-31.8886	152.514
AU	Queensland	TQP	Trepell Airport	-21.835	140.888
AU	Queensland	CUD	Caloundra Airport	-26.8	153.1
AU	Northern Territory	FIK	Finke Airport	-25.5947	134.583
AU	Western Australia	TPR	Tom Price Airport	-22.746	117.869
AU	New South Wales	CUG	Cudal Airport	-33.2783	148.763
AU	Western Australia	FIZ	Fitzroy Crossing Airport	-18.1819	125.559
AU	Tasmania	FLS	Flinders Island Airport	-40.0917	147.993
AU	New South Wales	FLY	Finley Airport	-35.6667	145.55
AU	New South Wales	TMW	Tamworth Regional Airport	-31.0839	150.847
AU	Western Australia	FOS	Forrest Airport	-30.8381	128.115
AU	New South Wales	FOT	Forster (Wallis Island) Airport	-32.2042	152.479
AU	New South Wales	FRB	Forbes Airport	-33.3636	147.935
AU	Western Australia	TKY	Turkey Creek Airport	-17.0408	128.206
AU	Western Australia	FSL	Fossil Downs Airport	-18.1321	125.787
AU	Queensland	CUQ	Coen Airport	-13.7611	143.113
AU	Western Australia	FVL	Flora Valley Airport	-18.2833	128.417
AU	Western Australia	FVR	Forrest River Airport	-15.1647	127.84
AU	Queensland	THG	Thangool Airport	-24.4939	150.576
AU	Queensland	GAH	Gayndah Airport	-25.6144	151.619
AU	Victoria	TGN	Latrobe Regional Airport	-38.2072	146.47
AU	Western Australia	CUY	Cue Airport	-27.4467	117.918
AU	Northern Territory	GBL	South Goulburn Island Airport	-11.65	133.382
AU	Western Australia	BYP	Barimunya Airport	-22.6739	119.166
AU	South Australia	CVC	Cleve Airport	-33.7097	136.505
AU	Queensland	GBP	Gamboola Airport	-16.55	143.667
AU	New South Wales	TEM	Temora Airport	-34.4214	147.512
AU	Western Australia	GBV	Gibb River Airport	-16.4233	126.445
AU	Western Australia	GBW	Ginbata Airport	-22.5812	120.036
AU	Western Australia	TEF	Telfer Airport	-21.715	122.229
AU	Queensland	TDR	Theodore Airport	-24.9933	150.093
AU	Northern Territory	BYX	Baniyala Airport	-13.1981	136.227
AU	Western Australia	CVQ	Carnarvon Airport	-24.8802	113.672
AU	Western Australia	TDN	Theda Station Airport	-14.7881	126.496
AU	Queensland	BBL	Ballera Airport	-27.4056	141.809
AU	Western Australia	GDD	Gordon Downs Airport	-18.6781	128.592
AU	New South Wales	BZD	Balranald Airport	-34.6236	143.578
AU	New South Wales	TCW	Tocumwal Airport	-35.8117	145.608
AU	Tasmania	GEE	George Town Aerodrome	-41.08	146.84
AU	Northern Territory	TCA	Tennant Creek Airport	-19.6344	134.183
AU	Western Australia	GET	Geraldton Airport	-28.7961	114.707
AU	Victoria	GEX	Geelong Airport	-38.225	144.333
AU	New South Wales	GFE	Grenfell Airport	-34	148.133
AU	New South Wales	GFF	Griffith Airport	-34.2508	146.067
AU	South Australia	CWR	Cowarie Airport	-27.7117	138.328
AU	Western Australia	TBL	Tableland Homestead Airport	-17.2833	126.9
AU	Queensland	BZP	Bizant Airport	-14.7403	144.119
AU	New South Wales	CWT	Cowra Airport	-33.8447	148.649
AU	New South Wales	CWW	Corowa Airport	-35.9947	146.357
AU	New South Wales	GFN	Clarence Valley Regional Airport	-29.7594	153.03
AU	Northern Territory	TBK	Timber Creek Airport	-15.62	130.445
AU	Queensland	GGD	Gregory Downs Airport	-18.625	139.233
AU	South Australia	TAQ	Tarcoola Airport	-30.7033	134.584
AU	Queensland	GIC	Boigu Island Airport	-9.23278	142.218
AU	Queensland	TAN	Tangalooma Airport	-27.13	153.363
AU	Queensland	GKL	Great Keppel Island Airport	-23.1833	150.942
AU	Queensland	BCI	Barcaldine Airport	-23.5653	145.307
AU	Queensland	BCK	Bolwarra Airport	-17.3883	144.169
AU	Queensland	SYU	Warraber Island Airport	-10.2083	142.825
AU	Queensland	GLG	Glengyle Airport	-24.8083	139.6
AU	New South Wales	GLI	Glen Innes Airport	-29.675	151.689
AU	Queensland	GLM	Glenormiston Airport	-22.8883	138.825
AU	New South Wales	SYD	Sydney Airport (Kingsford Smith Airport)	-33.9461	151.177
AU	Western Australia	CXQ	Christmas Creek Airport	-22.3567	119.652
AU	Queensland	GLT	Gladstone Airport	-23.8697	151.223
AU	Queensland	CXT	Charters Towers Airport	-20.0431	146.273
AU	Western Australia	GLY	Goldsworthy Airport	-20.333	119.5
AU	Victoria	SXE	West Sale Airport	-38.0908	146.965
AU	Victoria	SWH	Swan Hill Airport	-35.3758	143.533
AU	Victoria	SWC	Stawell Airport	-37.0717	142.741
AU	Northern Territory	BCZ	Bickerton Island Airport	-13.7808	136.202
AU	Western Australia	SWB	Shaw River Airport	-21.5103	119.362
AU	Queensland	BDB	Bundaberg Airport	-24.9039	152.319
AU	Queensland	GOO	Goondiwindi Airport	-28.5214	150.32
AU	Queensland	BDD	Badu Island Airport	-10.15	142.173
AU	Victoria	CYG	Corryong Airport	-36.1828	147.888
AU	New South Wales	GOS	Somersby Airfield	-33.3678	151.3
AU	Northern Territory	GOV	Gove Airport	-12.2694	136.818
AU	Queensland	GPD	Mount Gordon Airport	-19.7726	139.404
AU	Northern Territory	GPN	Garden Point Airport	-11.4025	130.422
AU	Queensland	SVM	St Pauls Mission Airport	-10.3667	142.117
AU	New South Wales	CAZ	Cobar Airport	-31.5383	145.794
AU	Queensland	STH	Strathmore Airport	-17.85	142.567
AU	Queensland	STF	Stephens Island Airport	-9.51	143.55
AU	Western Australia	GSC	Gascoyne Junction Airport	-25.0546	115.203
AU	South Australia	GSN	Mount Gunson Airport	-31.4597	137.174
AU	Queensland	SSP	Silver Plains Airport	-13.9754	143.554
AU	Northern Territory	GTE	Groote Eylandt Airport	-13.975	136.46
AU	Western Australia	SSK	Sturt Creek Airport	-19.1664	128.174
AU	Tasmania	CBI	Cape Barren Island Airport	-40.3917	148.017
AU	Northern Territory	GTS	The Granites Airport	-26.9483	133.607
AU	Queensland	GTT	Georgetown Airport	-18.305	143.53
AU	Queensland	SRR	Dunwich Airport	-27.5167	153.428
AU	Western Australia	BDW	Bedford Downs Airport	-17.2867	127.463
AU	Tasmania	SRN	Strahan Airport	-42.155	145.292
AU	Queensland	SRM	Sandringham Station Airport	-24.0568	139.082
AU	New South Wales	GUH	Gunnedah Airport	-30.9611	150.251
AU	New South Wales	GUL	Goulburn Airport	-34.8103	149.726
AU	Queensland	GVP	Greenvale Airport	-18.9966	145.014
AU	Western Australia	BEE	Beagle Bay Airport	-17.0165	122.646
AU	Australian Capital Territory	CBR	Canberra Airport	-35.3069	149.195
AU	Western Australia	SQC	Southern Cross Airport	-31.24	119.36
AU	Western Australia	GYL	Argyle Airport	-16.6369	128.451
AU	Queensland	GYP	Gympie Airport	-26.2828	152.702
AU	Queensland	HAT	Heathlands Airport	-11.7369	142.577
AU	New South Wales	CBX	Condobolin Airport	-33.0644	147.209
AU	Queensland	CBY	Canobie Airport	-19.4794	140.927
AU	Tasmania	HBA	Hobart International Airport	-42.8361	147.51
AU	Queensland	SNH	Stanthorpe Airport	-28.6203	151.991
AU	New South Wales	BEO	Lake Macquarie Airport (Belmont Airport)	-33.0667	151.648
AU	Western Australia	HCQ	Halls Creek Airport	-18.2339	127.67
AU	Northern Territory	SNB	Snake Bay Airport	-11.4228	130.654
AU	Western Australia	SLJ	Solomon Airport	-22.2554	117.763
AU	Queensland	HGD	Hughenden Airport	-20.815	144.225
AU	Queensland	CZY	Cluny Airport	-24.5167	139.617
AU	Queensland	BEU	Bedourie Airport	-24.3461	139.46
AU	Queensland	HID	Horn Island Airport	-10.5864	142.29
AU	Queensland	CCL	Chinchilla Airport	-26.775	150.617
AU	Queensland	HIG	Highbury Airport	-16.4244	143.146
AU	New South Wales	SIX	Singleton Airport	-32.6008	151.193
AU	Queensland	HIP	Headingly Airport	-21.3333	138.283
AU	Queensland	BFC	Bloomfield Airport	-15.8736	145.33
AU	Tasmania	SIO	Smithton Airport	-40.835	145.084
AU	Northern Territory	SHU	Smith Point Airport	-11.15	132.15
AU	Victoria	SHT	Shepparton Airport	-36.4289	145.393
AU	Queensland	SHQ	Southport Airport	-27.9221	153.372
AU	South Australia	CCW	Cowell Airport	-33.6667	136.892
AU	Western Australia	HLL	Hillside Airport	-21.7244	119.392
AU	Tasmania	HLS	St Helens Airport	-41.3367	148.282
AU	Victoria	HLT	Hamilton Airport	-37.6489	142.065
AU	Northern Territory	CDA	Cooinda Airport	-12.9033	132.532
AU	Queensland	HLV	Helenvale Airport	-15.6858	145.215
AU	Northern Territory	HMG	Hermannsburg Airport	-23.93	132.805
AU	Western Australia	ZVG	Springvale Airport (Western Australia)	-17.7869	127.67
AU	Western Australia	SGP	Shay Gap Airport	-20.4247	120.141
AU	Queensland	SGO	St George Airport	-28.0497	148.595
AU	Northern Territory	HOK	Hooker Creek Airport	-18.3367	130.638
AU	Queensland	HPE	Hopevale Airport	-15.2923	145.104
AU	Queensland	SCG	Spring Creek Airport	-18.6333	144.567
AU	Queensland	SBR	Saibai Island Airport	-9.37833	142.625
AU	Northern Territory	HRY	Henbury Airport	-24.584	133.236
AU	Victoria	HSM	Horsham Airport	-36.6697	142.173
AU	Queensland	HTI	Great Barrier Reef Airport	-20.3581	148.952
AU	Victoria	HTU	Hopetoun Airport	-35.7153	142.36
AU	Western Australia	RVT	Ravensthorpe Airport	-33.7972	120.208
AU	Queensland	CDQ	Croydon Airport	-18.225	142.258
AU	Northern Territory	HUB	Humbert River Airport	-16.4897	130.63
AU	New South Wales	DBO	Dubbo City Regional Airport	-32.2167	148.575
AU	South Australia	RTY	Merty Merty Airport	-28.5833	140.317
AU	New South Wales	CDU	Camden Airport	-34.0403	150.687
AU	Western Australia	RTS	Rottnest Island Airport	-32.0067	115.54
AU	Queensland	RTP	Rutland Plains Airport	-15.6433	141.843
AU	Queensland	XTR	Tara Airport	-27.1567	150.477
AU	New South Wales	RSE	Rose Bay Water Airport	-33.869	151.262
AU	Queensland	DBY	Dalby Airport	-27.1553	151.267
AW	Aruba	AUA	Queen Beatrix International Airport	12.5014	-70.0152
AZ	Lankaran	LLK	Lankaran International Airport	38.7464	48.818
AZ	Qabala	GBB	Qabala International Airport	40.8267	47.7125
AZ	Zaqatala	ZTU	Zaqatala International Airport	41.5622	46.6672
AZ	Ganca	KVD	Ganja International Airport	40.7377	46.3176
AZ	Naxcivan	NAJ	Nakhchivan International Airport	39.1888	45.4584
AZ	Yevlax	YLV	Yevlakh Airport	40.6319	47.1419
AZ	Baki	GYD	Heydar Aliyev International Airport	40.4675	50.0467
BA	Republika Srpska	BNX	Banja Luka International Airport	44.9414	17.2975
BA	Federacija Bosne i Hercegovine	OMO	Mostar Airport	43.2829	17.8459
BA	Federacija Bosne i Hercegovine	SJJ	Sarajevo International Airport	43.8246	18.3315
BA	Federacija Bosne i Hercegovine	TZL	Tuzla International Airport	44.4587	18.7248
BB	Christ Church	BGI	Grantley Adams International Airport	13.0746	-59.4925
BB	Christ Church	BGI	Grantley Adams International Airport	13.0747	-59.4925
BD	Sylhet	ZYL	Osmani International Airport	24.9632	91.8668
BD	Khulna	JSR	Jessore Airport	23.1838	89.1608
BD	Chittagong	CGP	Shah Amanat International Airport	22.2496	91.8133
BD	Rangpur	TKR	Thakurgaon Airport	26.0164	88.4036
BD	Barisal	BZL	Barisal Airport	22.801	90.3012
BD	Rajshahi	RJH	Shah Makhdum Airport	24.4372	88.6165
BD	Sylhet	ZHM	Shamshernagar Airport	24.417	91.883
BD	Dhaka	DAC	Hazrat Shahjalal International Airport	23.8433	90.3978
BD	Chittagong	CLA	Comilla Airport	23.4372	91.1897
BD	Rangpur	SPD	Saidpur Airport	25.7592	88.9089
BD	Chittagong	CXB	Cox's Bazar Airport	21.4522	91.9639
BD	Rajshahi	IRD	Ishwardi Airport	24.1525	89.0494
BE	West-Vlaanderen	KJK	Kortrijk-Wevelgem International Airport	50.8172	3.20472
BE	Liege	LGG	Liege Airport	50.6374	5.44322
BE	Antwerpen	ANR	Antwerp International Airport	51.1894	4.46028
BE	West-Vlaanderen	OST	Ostend-Bruges International Airport	51.1989	2.86222
BE	Brussels Hoofdstedelijk Gewest	BRU	Brussels Airport (Zaventem Airport)	50.9014	4.48444
BE	Antwerpen	OBL	Oostmalle Airfield	51.2647	4.75333
BE	Hainaut	CRL	Brussels South Charleroi Airport	50.4592	4.45382
BF	Yagha	XSE	Sebba Airport	13.45	0.517
BF	Boulgou	XZA	Zabre Airport	11.167	-0.617
BF	Sourou	TUQ	Tougan Airport	13.067	-3.067
BF	Sanmatenga	XKY	Kaya Airport	13.067	-1.1
BF	Soum	XDJ	Djibo Airport	14.1	-1.633
BF	Boulgou	TEG	Tenkodogo Airport	11.8	-0.367
BF	Oudalan	XGG	Gorom Gorom Airport	14.45	-0.233
BF	Soum	XAR	Aribinda Airport	14.217	-0.883
BF	Gourma	FNG	Fada N'gourma Airport	12.033	0.35
BF	Kossi	XNU	Nouna Airport	12.75	-3.867
BF	Tapoa	DIP	Diapaga Airport	12.0603	1.78463
BF	Sissili	XLU	Leo Airport	11.1	-2.1
BF	Bougouriba	XDE	Diebougou Airport	10.95	-3.25
BF	Poni	XGA	Gaoua Airport (Amilcar Cabral Airport)	10.3841	-3.16345
BF	Houet	BOY	Bobo Dioulasso Airport	11.1601	-4.33097
BF	Mouhoun	DGU	Dedougou Airport	12.459	-3.49
BF	Nahouri	PUP	Po Airport	11.15	-1.15
BF	Oudalan	TMQ	Tambao Airport	14.8	0.05
BF	Kadiogo	OUA	Ouagadougou Airport	12.3532	-1.51242
BF	Comoe	BNR	Banfora Airport	10.683	-4.717
BF	Namentenga	XBO	Boulsa Airport	12.65	-0.567
BF	Kompienga	XPA	Pama Airport	11.25	0.7
BF	Seno	DOR	Dori Airport	14.033	-0.033
BF	Tapoa	ARL	Arly Airport	11.597	1.483
BF	Yatenga	OUG	Ouahigouya Airport	13.567	-2.417
BF	Tapoa	XKA	Kantchari Airport	12.467	1.5
BF	Gnagna	XBG	Bogande Airport	12.983	-0.167
BG	Burgas	BOJ	Burgas Airport	42.5696	27.5152
BG	Veliko Tarnovo	GOZ	Gorna Oryahovitsa Airport	43.1514	25.7129
BG	Ruse	ROU	Ruse Airport	43.6948	26.0567
BG	Varna	VAR	Varna Airport	43.2321	27.8251
BG	Plovdiv	PDV	Plovdiv Airport	42.0678	24.8508
BG	Silistra	SLS	Silistra Airfield	44.0552	27.1788
BG	Stara Zagora	SZR	Stara Zagora Airport	42.3767	25.655
BG	Sofia	SOF	Sofia Airport	42.6967	23.4114
BG	Targovishte	TGV	Targovishte Airport (Buhovtsi Airfield)	43.3066	26.7009
BG	Yambol	JAM	Bezmer Air Base	42.4549	26.3522
BG	Haskovo	HKV	Haskovo Malevo Airport	41.8718	25.6048
BH	Al Muharraq	BAH	Bahrain International Airport	26.2708	50.6336
BI	Kirundo	KRE	Kirundo Airport	-2.54477	30.0946
BI	Bujumbura Mairie	BJM	Bujumbura International Airport	-3.32402	29.3185
BI	Gitega	GID	Gitega Airport	-3.41721	29.9113
BJ	Alibori	KDC	Kandi Airport	11.1448	2.94038
BJ	Donga	DJA	Djougou Airport	9.69208	1.63778
BJ	Collines	SVF	Save Airport	8.01817	2.46458
BJ	Littoral	COO	Cadjehoun Airport	6.35723	2.38435
BJ	Atacora	NAE	Boundetingou Airport	10.377	1.36051
BJ	Borgou	PKO	Parakou Airport	9.35769	2.60968
BL	Saint Barthelemy	SBH	Gustaf III Airport	17.9044	-62.8436
BM	Hamilton	BDA	L.F. Wade International Airport	32.364	-64.6787
BN	Brunei-Muara	BWN	Brunei International Airport	4.9442	114.928
BO	El Beni	RBQ	Rurrenabaque Airport	-14.4279	-67.4968
BO	Tarija	BYC	Yacuiba Airport	-21.9609	-63.6517
BO	Pando	PUR	Puerto Rico Airport	-11.1077	-67.5512
BO	El Beni	RIB	Riberalta Airport	-11	-66
BO	El Beni	SBL	Santa Ana del Yacuma Airport	-13.7622	-65.4352
BO	Santa Cruz	ASC	Ascencion de Guarayos Airport	-15.9303	-63.1567
BO	Tarija	VLM	Lieutenant Colonel Rafael Pabon Airport	-21.2552	-63.4056
BO	Santa Cruz	VAH	Cap. Av. Vidal Villagomez Toledo Airport	-18.4825	-64.0994
BO	Pando	CIJ	Captain Anibal Arab Airport	-11.0404	-68.783
BO	Santa Cruz	SJS	San Jose de Chiquitos Airport	-17.8308	-60.7431
BO	Santa Cruz	SJV	San Javier Airport (Bolivia)	-16.2708	-62.4703
BO	El Beni	BVK	Huacaraje Airport	-13.55	-63.7479
BO	Potosi	UYU	Uyuni Airport (Joya Andina Airport)	-20.4463	-66.8484
BO	Santa Cruz	SRZ	El Trompillo Airport	-17.8116	-63.1715
BO	Tarija	TJA	Capitan Oriel Lea Plaza Airport	-21.5557	-64.7013
BO	El Beni	BVL	Baures Airport	-13.5833	-63.5833
BO	Santa Cruz	SNG	Capitan Av. Juan Cochamanidis Air	-16.3836	-60.9628
BO	El Beni	SNM	San Ignacio de Moxos Airport	-14.9658	-65.6338
BO	El Beni	SRB	Santa Rosa Airport (Bolivia)	-14.0662	-66.7868
BO	La Paz	APB	Apolo Airport	-14.7356	-68.4119
BO	Tarija	BJO	Bermejo Airport	-22.7733	-64.3129
BO	Santa Cruz	PSZ	Puerto Suarez International Airport	-18.9753	-57.8206
BO	Oruro	ORU	Juan Mendoza Airport	-17.9626	-67.0762
BO	El Beni	GYA	Guayaramerin Airport	-10.8206	-65.3456
BO	La Paz	LPB	El Alto International Airport	-16.5133	-68.1923
BO	Santa Cruz	CEP	Concepcion Airport	-16.1383	-62.0286
BO	El Beni	SJB	San Joaquin Airport	-13.0528	-64.6617
BO	El Beni	MGD	Magdalena Airport	-13.2607	-64.0608
BO	Santa Cruz	CAM	Camiri Airport	-20.0064	-63.5278
BO	Santa Cruz	VVI	Viru Viru International Airport	-17.6448	-63.1354
BO	Chuquisaca	MHW	Monteagudo Airport	-19.827	-63.961
BO	El Beni	TDD	Teniente Jorge Henrich Arauz Airport	-14.8187	-64.918
BO	El Beni	REY	Reyes Airport	-14.3044	-67.3534
BO	Chuquisaca	SRE	Juana Azurduy de Padilla International Airport	-19.2468	-65.1496
BO	Chuquisaca	SRJ	Capitan German Quiroga Guardia Airport	-14.8592	-66.7375
BO	Santa Cruz	RBO	Robore Airport	-18.3292	-59.765
BO	Santa Cruz	MQK	San Matias Airport	-16.3392	-58.4019
BO	El Beni	SRD	San Ramon Airport	-13.2639	-64.6039
BO	Cochabamba	CBB	Jorge Wilstermann International Airport	-17.4211	-66.1771
BO	Potosi	POI	Captain Nicolas Rojas Airport	-19.5433	-65.7237
BO	Cochabamba	CCA	Chimore Airport	-16.9889	-65.1417
BQ	Sint Eustatius	EUX	F. D. Roosevelt Airport	17.4965	-62.9794
BQ	Bonaire	BON	Flamingo International Airport	12.131	-68.2685
BQ	Saba	SAB	Juancho E. Yrausquin Airport	17.645	-63.22
BR	Santa Catarina	UVI	Uniao da Vitoria Airport	-26.2317	-51.0689
BR	Rio Grande do Norte	MVF	Gov. Dix-Sept Rosado Airport	-5.20192	-37.3643
BR	Parana	CWB	Afonso Pena International Airport	-25.5285	-49.1758
BR	Minas Gerais	PIV	Pirapora Airport	-17.3169	-44.8603
BR	Amazonas	PIN	Julio Belem	-2.67302	-56.7772
BR	Para	BVS	Breves Airport	-1.63653	-50.4436
BR	Maranhao	BRB	Barreirinhas Airport	-2.75663	-42.8057
BR	Rondonia	BVH	Vilhena Airport (Brigadeiro Camarao Airport)	-12.6944	-60.0983
BR	Rio Grande do Sul	SQY	Sao Lourenco do Sul Airport	-31.3833	-52.0328
BR	Maranhao	PHI	Pinheiro Airport	-2.48361	-45.0672
BR	Rio Grande do Sul	CXJ	Caxias do Sul Airport (Hugo Cantergiani Regional Airport)	-29.1971	-51.1875
BR	Acre	ZMD	Sena Madureira Airport	-9.116	-68.6108
BR	Roraima	BVB	Boa Vista International Airport	2.84139	-60.6922
BR	Piaui	PHB	Parnaiba-Prefeito Dr. Joao Silva Filho International Airport	-2.89375	-41.732
BR	Parana	PGZ	Comte. Antonio Amilton Beraldo Airport	-25.1847	-50.1441
BR	Rio de Janeiro	REZ	Resende Airport	-22.4785	-44.4803
BR	Para	TMT	Porto Trombetas Airport	-1.4896	-56.3968
BR	Sao Paulo	VOT	Votuporanga Airport (Domingos Pignatari Airport)	-20.4632	-50.0045
BR	Parana	TUR	Tucurui Airport	-3.78601	-49.7203
BR	Para	OIA	Ourilandia do Norte Airport	-6.7631	-51.0499
BR	Rio Grande do Sul	PFB	Lauro Kurtz Airport	-28.244	-52.3266
BR	Mato Grosso	AFL	Alta Floresta Airport	-9.86639	-56.105
BR	Rio Grande do Sul	SRA	Santa Rosa Airport (Brazil)	-27.9067	-54.5204
BR	Rio Grande do Sul	GEL	Sepe Tiaraju Airport	-28.2817	-54.1691
BR	Maranhao	BSS	Balsas Airport	-7.52603	-46.0533
BR	Rio Grande do Sul	PET	Joao Simoes Lopes Neto International Airport	-31.7184	-52.3277
BR	Maranhao	PDR	Presidente Dutra Airport	-5.3098	-44.481
BR	Amazonas	OLC	Senadora Eunice Michiles Airport	-3.46793	-68.9204
BR	Rio Grande do Sul	CZB	Carlos Ruhl Airport	-28.6578	-53.6106
BR	Mato Grosso	MTG	Mato Grosso Airport	-14.9942	-59.9458
BR	Distrito Federal	BSB	Brasilia International Airport (Presidente J. Kubitschek Int'l Airport)	-15.8692	-47.9208
BR	Bahia	PDF	Prado Airport	-17.2967	-39.2712
BR	Para	MTE	Monte Alegre Airport	-1.9958	-54.0742
BR	Piaui	PCS	Picos Airport	-7.06206	-41.5237
BR	Sao Paulo	BJP	Arthur Siqueira-Braganca Paulista State Airport	-22.9792	-46.5375
BR	Espirito Santo	GUZ	Guarapari Airport	-20.6465	-40.4919
BR	Mato Grosso	PBX	Fazenda Piraguassu Airport	-10.8611	-51.685
BR	Mato Grosso	PBV	Aeroporto de Porto dos Gauchos Airport	-11.5404	-57.3782
BR	Acre	CZS	Cruzeiro do Sul International Airport	-7.59991	-72.7695
BR	Sao Paulo	UBT	Ubatuba Airport	-23.4411	-45.0756
BR	Bahia	VDC	Pedro Otacilio Figueiredo Airport	-14.8628	-40.8631
BR	Rio Grande do Sul	LVB	Livramento do Brumado Airport	-13.6506	-41.8339
BR	Rondonia	PBQ	Pimenta Bueno Airport	-11.6416	-61.1791
BR	Rio Grande do Sul	IJU	Joao Batista Bos Filho Airport	-28.3687	-53.8466
BR	Bahia	BRA	Barreiras Airport	-12.0789	-45.009
BR	Sao Paulo	FRC	Franca Airport (Ten. Lund Presotto-Franca State Airport)	-20.5922	-47.3829
BR	Sao Paulo	AIF	Assis Airport	-22.64	-50.4531
BR	Bahia	BQQ	Barra Airport (Brazil)	-11.0808	-43.1475
BR	Parana	IGU	Foz do Iguacu International Airport	-25.6003	-54.485
BR	Mato Grosso	LVR	Bom Futuro Municipal Airport	-13.0379	-55.9502
BR	Sao Paulo	GUJ	Guaratingueta Airport	-22.7916	-45.2048
BR	Mato Grosso	AIR	Aripuana Airport	-10.1883	-59.4573
BR	Mato Grosso	OPS	Presidente Joao Figueiredo Airport	-11.885	-55.5861
BR	Bahia	BPS	Porto Seguro Airport	-16.4386	-39.0809
BR	Mato Grosso do Sul	PBB	Paranaiba Airport	-19.6512	-51.1994
BR	Sergipe	AJU	Santa Maria Airport (Sergipe)	-10.984	-37.0703
BR	Mato Grosso	BPG	Barra do Garcas Airport	-15.8613	-52.3889
BR	Para	ORX	Oriximina Airport	-1.71408	-55.8362
BR	Rio Grande do Sul	RIA	Santa Maria Airport (Rio Grande do Sul)	-29.7114	-53.6882
BR	Parana	GPB	Tancredo Thomas de Faria Airport	-25.3875	-51.5202
BR	Rondonia	JPR	Jose Coleto Airport	-10.8708	-61.8465
BR	Bahia	PAV	Paulo Afonso Airport	-9.40088	-38.2506
BR	Goias	MQH	Minacu Airport	-13.5491	-48.1953
BR	Rio Grande do Sul	RIG	Rio Grande Regional Airport	-32.0817	-52.1633
BR	Tocantins	IDO	Santa Isabel do Morro Airport	-11.5723	-50.6662
BR	Amapa	OYK	Oiapoque Airport	3.85549	-51.7969
BR	Parana	TEC	Telemaco Borba Airport	-24.3178	-50.6516
BR	Bahia	UNA	Una-Comandatuba Airport	-15.3552	-38.999
BR	Santa Catarina	BNU	Blumenau Airport	-26.8306	-49.0903
BR	Mato Grosso	ROO	Maestro Marinho Franco Airport	-16.586	-54.7248
BR	Ceara	FOR	Pinto Martins - Fortaleza International Airport	-3.77628	-38.5326
BR	Bahia	BMS	Socrates Mariani Bittencourt Airport	-14.2554	-41.8175
BR	Rio Grande do Sul	ALQ	Alegrete Airport	-29.8127	-55.8934
BR	Sao Paulo	OUS	Jornalista Benedito Pimentel-Ourinhos State Airport	-22.9665	-49.9133
BR	Para	ALT	Alenquer Airport	-1.917	-54.7231
BR	Goias	TLZ	Catalao Airport	-18.2168	-47.8997
BR	Amazonas	HUW	Francisco Correa da Cruz Airport	-7.53212	-63.0721
BR	Acre	TRQ	Jose Galera dos Santos Airport	-8.15526	-70.7833
BR	Minas Gerais	AMJ	Almenara Airport	-16.1839	-40.6672
BR	Para	MAB	Joao Correa da Rocha Airport	-5.36859	-49.138
BR	Rio Grande do Sul	CSU	Santa Cruz do Sul Airport	-29.6841	-52.4122
BR	Amazonas	IPG	Ipiranga Airport	-2.93907	-69.694
BR	Minas Gerais	MOC	Montes Claros/Mario Ribeiro Airport	-16.7069	-43.8189
BR	Amazonas	TBT	Tabatinga International Airport	-4.25567	-69.9358
BR	Amazonas	MNX	Manicore Airport	-5.81138	-61.2783
BR	Mato Grosso do Sul	CSS	Cassilandia Airport	-19.1464	-51.6853
BR	Minas Gerais	IPN	Vale do Aco Regional Airport	-19.4707	-42.4876
BR	Piaui	FLB	Cangapara Airport	-6.84639	-43.0773
BR	Amazonas	MAO	Eduardo Gomes International Airport	-3.03861	-60.0497
BR	Bahia	IPU	Ipiau Airport	-14.1339	-39.7339
BR	Amazonas	RBB	Borba Airport	-4.40634	-59.6024
BR	Goias	RVD	General Leite de Castro Airport	-17.8347	-50.9561
BR	Bahia	IRE	Irece Airport	-11.3399	-41.847
BR	Bahia	CRQ	Caravelas Airport	-17.6523	-39.2531
BR	Pernambuco	FEN	Fernando de Noronha Airport (Gov. Carlos Wilson Airport)	-3.85493	-32.4233
BR	Sao Paulo	RAO	Leite Lopes Airport	-21.1364	-47.7767
BR	Rondonia	CQS	Costa Marques Airport	-12.4211	-64.2516
BR	Bahia	TXF	Teixeira de Freitas Airport (9 de maio Airport)	-17.5245	-39.6685
BR	Parana	UMU	Orlando de Carvalho Airport	-23.7987	-53.3138
BR	Amazonas	IRZ	Tapuruquara Airport	-0.3786	-64.9923
BR	Mato Grosso	MBK	Orlando Villas-Boas Regional Airport	-10.1703	-54.9528
BR	Para	XIG	Xinguara Municipal Airport	-7.0906	-49.9765
BR	Mato Grosso	CQA	Canarana Airport	-13.5744	-52.2706
BR	Minas Gerais	DIQ	Divinopolis Airport (Brigadeiro Cabral Airport)	-20.1807	-44.8709
BR	Alagoas	APQ	Arapiraca Airport	-9.77536	-36.6292
BR	Goias	APS	Anapolis Airport	-16.3623	-48.9271
BR	Paraiba	CPV	Campina Grande Airport (Presidente Joao Suassuna Airport)	-7.26992	-35.8964
BR	Parana	APU	Apucarana Airport	-23.6095	-51.3845
BR	Parana	APX	Arapongas Airport	-23.3529	-51.4917
BR	Maranhao	APY	Alto Parnaiba Airport	-9.08361	-45.9506
BR	Sao Paulo	AQA	Araraquara Airport	-21.812	-48.133
BR	Maranhao	CPU	Cururupu Airport	-1.82111	-44.8669
BR	Sao Paulo	QSC	Mario Pereira Lopes Airport	-21.8754	-47.9037
BR	Amazonas	ITA	Itacoatiara Airport	-3.12726	-58.4812
BR	Rondonia	AQM	Ariquemes Airport	-10.1781	-62.8256
BR	Acre	FEJ	Feijo Airport	-8.14083	-70.3472
BR	Amazonas	MBZ	Maues Airport	-3.37217	-57.7248
BR	Para	ITB	Itaituba Airport	-4.24234	-56.0007
BR	Bahia	ITE	Itubera Airport	-13.7322	-39.1417
BR	Minas Gerais	ITI	Itambacuri Airport	-8.7	-51.1742
BR	Rio Grande do Sul	HRZ	Horizontina Airport	-27.6383	-54.3391
BR	Bahia	ITN	Itabuna Airport	-14.8105	-39.2904
BR	Espirito Santo	SBJ	Sao Mateus Airport	-18.7213	-39.8337
BR	Goias	ARS	Aragarcas Airport	-15.8994	-52.2411
BR	Sao Paulo	ARU	Aracatuba Airport	-21.1413	-50.4247
BR	Rio de Janeiro	ITP	Itaperuna Airport	-21.2193	-41.8759
BR	Mato Grosso	SWM	Suia-Missu Airport	-11.6717	-51.4347
BR	Bahia	CNV	Canavieiras Airport	-15.667	-38.9547
BR	Amapa	MCP	Alberto Alcolumbre International Airport	0.050664	-51.0722
BR	Bahia	FEC	Feira de Santana Airport (Gov. Joao Durval Carneiro Airport)	-12.2003	-38.9068
BR	Rio Grande do Sul	ITQ	Itaqui Airport	-29.1731	-56.5367
BR	Goias	ITR	Itumbiara Airport	-18.4447	-49.2134
BR	Parana	TOW	Luiz dal Canalle Filho Airport	-24.6863	-53.6975
BR	Mato Grosso	STZ	Santa Terezinha Airport	-10.4647	-50.5186
BR	Bahia	GNM	Guanambi Airport	-14.2082	-42.7461
BR	Para	CMT	Cameta Airport	-2.2468	-49.56
BR	Alagoas	MCZ	Zumbi dos Palmares International Airport	-9.51081	-35.7917
BR	Santa Catarina	FLN	Hercilio Luz International Airport	-27.6703	-48.5525
BR	Bahia	VAL	Valenca Airport	-13.2965	-38.9924
BR	Para	CMP	Santana do Araguaia Airport	-9.31997	-50.3285
BR	Minas Gerais	IZA	Presidente Itamar Franco Airport (Zona da Mata Regional Airport)	-21.5131	-43.1731
BR	Minas Gerais	VAG	Major Brigadeiro Trompowsky Airport	-21.5901	-45.4733
BR	Santa Catarina	XAP	Serafin Enoss Bertaso Airport	-27.1342	-52.6566
BR	Tocantins	GRP	Gurupi Airport	-11.7396	-49.1322
BR	Para	ATM	Altamira Airport	-3.25391	-52.254
BR	Mato Grosso	DMT	Diamantino Airport	-14.3769	-56.4004
BR	Mato Grosso do Sul	CMG	Corumba International Airport	-19.0119	-57.6714
BR	Ceara	CMC	Camocim Airport	-2.89618	-40.858
BR	Para	STM	Santarem-Maestro Wilson Fonseca Airport	-2.42472	-54.7858
BR	Tocantins	DNO	Dianopolis Airport	-11.5954	-46.8467
BR	Rio de Janeiro	MEA	Benedito Lacerda Airport	-22.343	-41.766
BR	Sao Paulo	SFV	Santa Fe do Sul Airport	-20.183	-50.917
BR	Maranhao	GMS	Guimaraes Airport	-2.10944	-44.6511
BR	Goias	CLV	Caldas Novas Airport	-17.7253	-48.6075
BR	Santa Catarina	VIA	Angelo Ponzoni Municipal Airport	-26.9997	-51.1419
BR	Sao Paulo	MII	Frank Miloye Milenkowichi-Marilia State Airport	-22.1969	-49.9264
BR	Tocantins	AUX	Araguaina Airport	-7.22787	-48.2405
BR	Rio Grande do Sul	TSQ	Torres Airport	-29.4149	-49.81
BR	Parana	PVI	Edu Chaves Airport	-23.0899	-52.4885
BR	Minas Gerais	ESI	Espinosa Airport	-14.9337	-42.81
BR	Maranhao	CLN	Carolina Airport	-7.32044	-47.4587
BR	Mato Grosso do Sul	DOU	Dourados Airport (Francisco de Matos Pereira Airport)	-22.2019	-54.9266
BR	Rondonia	PVH	Governador Jorge Teixeira de Oliveira International Airport	-8.70929	-63.9023
BR	Para	MEU	Serra do Areao Airport	-0.889839	-52.6022
BR	Sao Paulo	SSZ	Santos Air Force Base	-23.9281	-46.2997
BR	Para	CKS	Carajas Airport	-6.11528	-50.0014
BR	Parana	CKO	Cornelio Procopio Airport	-23.1525	-50.6025
BR	Santa Catarina	AXE	XanxerÃƒÂª - JoÃƒÂ£o Winckler Airport	-26.8756	-52.3731
BR	Mato Grosso	SXO	Sao Felix do Araguaia	-11.6324	-50.6896
BR	Sao Paulo	SJK	Professor Urbano Ernesto Stumpf International Airport	-23.2292	-45.8615
BR	Amazonas	CIZ	Coari Airport	-4.13406	-63.1326
BR	Amazonas	SJL	Sao Gabriel da Cachoeira Airport	-0.14835	-66.9855
BR	Sao Paulo	SJP	Prof. Eribelto Manoel Reino State Airport	-20.8166	-49.4065
BR	Bahia	BVM	Belmonte Airport	-15.8717	-38.8719
BR	Minas Gerais	GVR	Coronel Altino Machado de Oliveira Airport	-18.8952	-41.9822
BR	Minas Gerais	SSO	Sao Lourenco Airport	-22.0909	-45.0445
BR	Maranhao	CTP	Carutapera Airport	-1.25028	-46.0172
BR	Piaui	GDP	Guadalupe Airport	-6.78222	-43.5822
BR	Santa Catarina	JCB	Santa Terezinha Municipal Airport	-27.1714	-51.5533
BR	Mato Grosso	OTT	Andre Maggi Airport	-9.89861	-58.5819
BR	Bahia	JCM	Jacobina Airport	-11.1632	-40.5531
BR	Para	JCR	Jacareacanga Airport	-6.23316	-57.7769
BR	Sao Paulo	URB	Castilho Airport (Urubupunga Airport)	-20.7771	-51.5648
BR	Minas Gerais	DTI	Diamantina Airport	-18.232	-43.6504
BR	Mato Grosso	AZL	Fazenda Tucunare Airport	-13.4655	-58.8669
BR	Parana	AAG	Avelino Vieira Airport	-24.1039	-49.7891
BR	Bahia	SSA	Deputado Luis Eduardo Magalhaes International Airport	-12.9086	-38.3225
BR	Maranhao	SLZ	Marechal Cunha Machado International Airport	-2.58536	-44.2341
BR	Mato Grosso do Sul	CGR	Campo Grande International Airport	-20.4687	-54.6725
BR	Rio Grande do Sul	CTQ	Santa Vitoria do Palmar Airport	-33.5022	-53.3442
BR	Tocantins	AAI	Arraias Airport	-13.0252	-46.8841
BR	Bahia	IOS	Ilheus Jorge Amado Airport	-14.816	-39.0332
BR	Rio Grande do Sul	POA	Salgado Filho International Airport	-29.9944	-51.1714
BR	Santa Catarina	LAJ	Antonio Correia Pinto de Macedo Airport	-27.7821	-50.2815
BR	Minas Gerais	UDI	Ten. Cel. Av. Cesar Bombonato Airport	-18.8836	-48.2253
BR	Pernambuco	PNZ	Senador Nilo Coelho Airport	-9.36241	-40.5691
BR	Tocantins	NTM	Miracema do Tocantins Airport	-9.5669	-48.3919
BR	Minas Gerais	AAX	Araxa Airport	-19.5632	-46.9604
BR	Minas Gerais	JDF	Francisco Alvares de Assis Airport	-21.7915	-43.3868
BR	Para	SXX	Sao Felix do Xingu Airport	-6.6413	-51.9523
BR	Parana	FBE	Francisco Beltrao Airport (Paulo Abdala Airport)	-26.0592	-53.0635
BR	Sao Paulo	BAT	Chafei Amsei Airport	-20.5845	-48.5941
BR	Rondonia	GJM	Guajara-Mirim Airport	-10.7864	-65.2848
BR	Amazonas	BAZ	Barcelos Airport	-0.981292	-62.9196
BR	Para	TUZ	Tucuma Airport	-6.7488	-51.1478
BR	Mato Grosso	CGB	Marechal Rondon International Airport	-15.6529	-56.1167
BR	Ceara	JDO	Juazeiro do Norte Airport	-7.21896	-39.2701
BR	Minas Gerais	JDR	Prefeito Octavio de Almeida Neves Airport	-21.085	-44.2247
BR	Sao Paulo	SOD	Sorocaba Airport	-23.478	-47.49
BR	Mato Grosso	CFO	Confresa Airport	-10.6344	-51.5636
BR	Para	PTQ	Porto de Moz Airport	-1.74145	-52.2361
BR	Acre	RBR	Placido de Castro International Airport	-9.86889	-67.8981
BR	Bahia	JEQ	Jequie Airport	-13.8777	-40.0716
BR	Amazonas	CAF	Carauari Airport	-4.87152	-66.8975
BR	Parana	PTO	Juvenal Loureiro Cardoso Airport	-26.2172	-52.6945
BR	Amazonas	FBA	Fonte Boa Airport	-2.53261	-66.0832
BR	Goias	GYN	Santa Genoveva Airport	-16.632	-49.2207
BR	Parana	CAC	Cascavel Airport (Adalberto Mendes da Silva Airport)	-25.0003	-53.5008
BR	Santa Catarina	CFC	Cacador Airport	-26.7884	-50.9398
BR	Rio de Janeiro	CFB	Cabo Frio International Airport	-22.9217	-42.0743
BR	Parana	PNG	Santos Dumont Airport	-25.5401	-48.5312
BR	Maranhao	IMP	Imperatriz Airport (Prefeito Renato Moreira Airport)	-5.53129	-47.46
BR	Tocantins	PNB	Porto Nacional Airport	-10.7194	-48.3997
BR	Mato Grosso	JIA	Juina Airport	-11.4194	-58.7017
BR	Minas Gerais	PSW	Municipal JosÃƒÂ© Figueiredo Airport	-20.7322	-46.6618
BR	Rio Grande do Sul	ERM	Erechim Airport	-27.6619	-52.2683
BR	Rio de Janeiro	BZC	Umberto Modiano Airport	-22.7709	-41.9631
BR	Santa Catarina	JJG	Humberto Ghizzo Bortoluzzi Regional Airport	-28.6753	-49.0596
BR	Amazonas	TFF	Tefe Airport	-3.38294	-64.7241
BR	Mato Grosso do Sul	BYO	Bonito Airport	-21.2473	-56.4525
BR	Parana	GGJ	Guaira Airport	-24.0797	-54.1881
BR	Santa Catarina	LOI	Helmuth Baungartem Airport	-27.16	-49.5425
BR	Sao Paulo	JLS	Jales Airport	-20.293	-50.5464
BR	Parana	GGH	Gastao Mesquita Airport	-23.6914	-52.6422
BR	Amazonas	BCR	Novo Campo Airport	-8.83456	-67.3124
BR	Para	GGF	Almeirim Airport	-1.47917	-52.5781
BR	Mato Grosso	GGB	Agua Boa Airport	-14.0194	-52.1522
BR	Minas Gerais	TFL	Teofilo Otoni Airport (Juscelino Kubitscheck Airport)	-17.8923	-41.5136
BR	Minas Gerais	JNA	Januaria Airport	-15.4738	-44.3855
BR	Tocantins	PMW	Palmas-Brigadeiro Lysias Rodrigues Airport	-10.2915	-48.357
BR	Espirito Santo	VIX	Eurico de Aguiar Salles Airport	-20.2581	-40.2864
BR	Mato Grosso	VLP	Vila Rica Municipal Airport	-9.97944	-51.1422
BR	Maranhao	BDC	Barra do Corda Airport	-5.5025	-45.2158
BR	Bahia	MVS	Mucuri Airport	-18.0489	-39.8642
BR	Rio Grande do Norte	NAT	Sao Goncalo do Amarante-Governador Aluizio Alves International Airport	-5.76806	-35.3761
BR	Mato Grosso do Sul	PMG	Ponta Pora International Airport	-22.5496	-55.7026
BR	Rio Grande do Sul	BGV	Bento Goncalves Airport	-29.1483	-51.5364
BR	Parana	MGF	Silvio Name Junior Regional Airport	-23.4761	-52.0162
BR	Para	CDJ	Conceicao do Araguaia Airport	-8.34835	-49.3015
BR	Espirito Santo	CDI	Cachoeiro de Itapemirim Airport (Raimundo de Andrade Airport)	-20.8343	-41.1856
BR	Santa Catarina	JOI	Joinville-Lauro Carneiro de Loyola Airport	-26.2245	-48.7974
BR	Amazonas	NVP	Novo Aripuana Airport	-5.11803	-60.3649
BR	Mato Grosso	TGQ	Tangara da Serra Airport	-14.662	-57.4435
BR	Rio Grande do Sul	BGX	Comandante Gustavo Kraemer Airport	-31.3905	-54.1122
BR	Mato Grosso	CCX	Caceres Airport	-16.0436	-57.6299
BR	Sao Paulo	LIP	Lins Airport	-21.664	-49.7305
BR	Minas Gerais	PPY	Pouso Alegre Airport	-22.2892	-45.9191
BR	Paraiba	JPA	Presidente Castro Pinto International Airport	-7.14583	-34.9486
BR	Goias	SQM	Sao Miguel do Araguaia Airport	-13.3313	-50.1976
BR	Santa Catarina	CCM	Diomicio Freitas Airport	-28.7244	-49.4214
BR	Santa Catarina	NVT	Navegantes-Ministro Victor Konder International Airport	-26.88	-48.6514
BR	Mato Grosso do Sul	TJL	Plinio Alarcom Airport	-20.7542	-51.6842
BR	Santa Catarina	CCI	Concordia Airport	-27.1806	-52.0527
BR	Piaui	THE	Teresina-Senador Petronio Portel Airport	-5.05994	-42.8235
BR	Mato Grosso	JRN	Juruena Airport	-10.3058	-58.4894
BR	Para	RDC	Redencao Airport	-8.03329	-49.9799
BR	Parana	CBW	Campo Mourao Airport	-24.0092	-52.3568
BR	Sao Paulo	JTC	Moussa Nakhl Tobias-Bauru/Arealva State Airport	-22.1669	-49.0503
BR	Para	BEL	Val de Cans International Airport	-1.37925	-48.4763
BR	Goias	JTI	Jatai Airport	-17.8299	-51.773
BR	Minas Gerais	LEP	Leopoldina Airport	-21.4661	-42.727
BR	Minas Gerais	NNU	Nanuque Airport	-17.8233	-40.3299
BR	Bahia	LEC	Coronel Horacio de Mattos Airport	-12.4823	-41.277
BR	Mato Grosso	NOK	Nova Xavantina Airport	-14.6983	-52.3464
BR	Parana	LDB	Londrina-Governador Jose Richa Airport	-23.3336	-51.1301
BR	Mato Grosso	JUA	Mauro Luiz Frizon Airport	-11.2966	-57.5495
BR	Sao Paulo	PPB	Presidente Prudente Airport	-22.1751	-51.4246
BR	Para	NPR	Novo Progresso Airport	-7.12583	-55.4008
BR	Goias	NQL	Niquelandia Air	-14.4349	-48.4915
BR	Mato Grosso	LCB	Pontes e Lacerda Airport	-15.1934	-59.3848
BR	Minas Gerais	UBA	Mario de Almeida Franco Airport	-19.7647	-47.9661
BR	Rio Grande do Sul	URG	Rubem Berta International Airport	-29.7822	-57.0382
BR	Amazonas	LBR	Labrea Airport	-7.27897	-64.7695
BR	Bahia	LAZ	Bom Jesus da Lapa Airport	-13.2621	-43.4081
BR	Parana	BFH	Bacacheri Airport	-25.4051	-49.232
BR	Amazonas	PLL	Manaus Air Force Base	-3.14604	-59.9863
BR	Minas Gerais	POO	Pocos de Caldas Airport	-21.843	-46.5679
BR	Santa Catarina	SQX	Helio Wasum Airport	-26.7816	-53.5035
BR	Rondonia	OAL	Capital do Cafe Airport	-11.496	-61.4508
BR	Para	OBI	Obidos Airport	-1.86717	-55.5144
BR	Minas Gerais	POJ	Pedro Pereira dos Santos Airport	-18.6728	-46.4912
BR	Amazonas	ERN	Eirunepe Airport (Amaury Feitosa Tomaz Airport)	-6.63953	-69.8798
BR	Pernambuco	REC	Recife/Guararapes-Gilberto Freyre International Airport	-8.12649	-34.9236
BR	Rio de Janeiro	CAW	Bartolomeu Lysandro Airport	-21.6983	-41.3017
BR	Pernambuco	CAU	Caruaru Airport (Oscar Laranjeiras Airport)	-8.28239	-36.0135
BR	Parana	AAG	Avelino Vieira Airport	-24.1042	-49.7906
BR	Ceara	ARX	Aracati Airport	-4.56861	-37.8047
BR	Rio Grande do Sul	CEL	Canela Airport	-29.3706	-50.8322
BR	Ceara	JJD	Comte. Ariston Pessoa Regional Airport	-2.90667	-40.3581
BR	Sao Paulo	BAU	Bauru Airport	-22.3436	-49.0539
BR	Sao Paulo	CPQ	Campo dos Amarais Airport	-22.8592	-47.1081
BR	Mato Grosso	BSB	BrasÃƒÂ­lia International Airport	-15.8692	-47.9208
BS	South Andros	TZN	South Andros Airport	24.1589	-77.5897
BS	New Providence	NAS	Lynden Pindling International Airport	25.039	-77.4662
BS	City of Freeport	CXY	Cat Cay Airport	25.5546	-79.2752
BS	Long Island	CRI	Colonel Hill Airport (Crooked Island Airport)	22.7456	-74.1824
BS	East Grand Bahama	FPO	Grand Bahama International Airport	26.5587	-78.6956
BS	Central Andros	SAQ	San Andros Airport	25.0538	-78.049
BS	Long Island	PWN	Pitts Town Airport	22.8297	-74.3461
BS	Central Andros	CCZ	Chub Cay International Airport	25.4171	-77.8809
BS	Long Island	DCT	Duncan Town Airport	22.1818	-75.7295
BS	South Eleuthera	GHB	Governor's Harbour Airport	25.2847	-76.331
BS	Berry Islands	GHC	Great Harbour Cay Airport	25.7383	-77.8401
BS	Harbour Island	ELH	North Eleuthera Airport	25.4749	-76.6835
BS	Central Andros	MAY	Clarence A. Bain Airport	24.2877	-77.6846
BS	Acklins	AXP	Spring Point Airport	22.4418	-73.9709
BS	Central Andros	TZN	South Andros Airport (Congo Town Airport)	24.1587	-77.5898
BS	Exuma	TYM	Staniel Cay Airport	24.1691	-76.4391
BS	Rum Cay	RCY	Port Nelson Airport	23.6844	-74.8362
BS	Long Island	LGI	Deadman's Cay Airport	23.179	-75.0936
BS	Bimini	NSB	North Seaplane Base	25.767	-79.25
BS	Hope Town	MHH	Marsh Harbour Airport	26.5114	-77.0835
BS	San Salvador	ZSA	San Salvador Airport (Cockburn Town Airport)	24.0633	-74.524
BS	South Eleuthera	ATC	Arthur's Town Airport	24.6294	-75.6738
BS	South Eleuthera	RSD	Rock Sound International Airport	24.8951	-76.1769
BS	City of Freeport	WKR	Walker's Cay Airport	27.2667	-78.3997
BS	Exuma	NMC	Norman's Cay Airport	24.5943	-76.8202
BS	Bimini	BIM	South Bimini Airport	25.6999	-79.2647
BS	Exuma	GGT	Exuma International Airport	23.5626	-75.878
BS	Mayaguana	MYG	Mayaguana Airport (Abraham's Bay Airport)	22.3795	-73.0135
BS	Hope Town	TCB	Treasure Cay Airport	26.7453	-77.3913
BS	Long Island	SML	Stella Maris Airport	23.5823	-75.2686
BS	Central Andros	ASD	Andros Town International Airport	24.6979	-77.7956
BS	Cat Island	TBI	New Bight Airport	24.3153	-75.4523
BS	Inagua	IGA	Inagua Airport (Matthew Town Airport)	20.975	-73.6669
BS	West Grand Bahama	WTD	West End Airport	26.6853	-78.975
BT	Paro	PBH	Paro International Airport	27.4032	89.4246
BT	Trashigang	YON	Yongphulla Airport (Yonphula Airport)	27.2564	91.5145
BT	Sarpang	GLU	Gelephu Airport	26.8846	90.4641
BT	Bumthang	BUT	Bathpalathang Airport	27.5622	90.7471
BW	Central	TLD	Tuli Lodge Airport	-22.1892	29.1269
BW	North West	SVT	Savuti Airport	-18.5206	24.0767
BW	Central	SXN	Sua Pan Airport	-20.5534	26.1158
BW	Kgalagadi	HUK	Hukuntsi Airport	-23.9897	21.7581
BW	Ghanzi	GNZ	Ghanzi Airport	-21.6925	21.6581
BW	North West	KHW	Khwai River Airport	-19.15	23.783
BW	Kgalagadi	TBY	Tshabong Airport	-26.0333	22.4
BW	South East	GBE	Sir Seretse Khama International Airport	-24.5552	25.9182
BW	North East	FRW	Francistown Airport	-21.1596	27.4745
BW	North West	MUB	Maun Airport	-19.9726	23.4311
BW	Southern	JWA	Jwaneng Airport	-24.6023	24.691
BW	Chobe	BBK	Kasane Airport	-17.8329	25.1624
BW	North West	SWX	Shakawe Airport	-18.3739	21.8326
BW	Central	PKW	Selebi-Phikwe Airport	-22.0583	27.8288
BW	Central	ORP	Orapa Airport	-21.2667	25.3167
BW	South East	LOQ	Lobatse Airport	-25.1981	25.7139
BY	Homyel'skaya voblasts'	GME	Gomel Airport	52.527	31.0167
BY	Vitsyebskaya voblasts'	VTB	Vitebsk Vostochny Airport	55.1265	30.3496
BY	Hrodzenskaya voblasts'	GNA	Grodno Airport	53.602	24.0538
BY	Brestskaya voblasts'	BQT	Brest Airport	52.1083	23.8981
BY	Minskaya voblasts'	MHP	Minsk-1 Airport	53.8645	27.5397
BY	Minskaya voblasts'	MSQ	Minsk National Airport	53.8825	28.0307
BY	Mahilyowskaya voblasts'	MVQ	Mogilev Airport	53.9549	30.0951
BZ	Stann Creek	BGK	Big Creek Airport	16.5194	-88.4079
BZ	Stann Creek	SVK	Silver Creek Airport	16.7253	-88.34
BZ	Belize	CYC	Caye Chapel Airport	17.7008	-88.0411
BZ	Cayo	CYD	San Ignacio Town Airstrip	17.1049	-89.1011
BZ	Stann Creek	PLJ	Placencia Airport	16.537	-88.3615
BZ	Stann Creek	MDB	Melinda Airport	17.0043	-88.3042
BZ	Corozal	CZH	Corozal Airport	18.3822	-88.4119
BZ	Belize	BZE	Philip S. W. Goldson International Airport	17.5391	-88.3082
BZ	Orange Walk	ORZ	Orange Walk Airport	18.0468	-88.5839
BZ	Stann Creek	INB	Independence Airport (Belize)	16.5345	-88.4413
BZ	Corozal	SJX	Sarteneja Airport	18.3561	-88.1308
BZ	Cayo	BCV	Hector Silva Airstrip	17.2696	-88.7765
BZ	Cayo	SQS	Matthew Spain Airport	17.1859	-89.0098
BZ	Belize	CUK	Caye Caulker Airport	17.7347	-88.0325
BZ	Toledo	PND	Punta Gorda Airport	16.1024	-88.8083
BZ	Belize	SPR	John Greif II Airport	17.9139	-87.9711
BZ	Stann Creek	DGA	Dangriga Airport	16.9825	-88.231
BZ	Cayo	MZE	Manatee Airport	17.2785	-89.0238
BZ	Belize	TZA	Belize City Municipal Airport	17.5164	-88.1944
CA	British Columbia	YQJ	April Point Seaplane Base	50.065	-125.235
CA	Manitoba	YDV	Bloodvein River Airport	51.7846	-96.6923
CA	Saskatchewan	YKC	Collins Bay Airport	58.2361	-103.678
CA	Northwest Territories	YDU	Kasba Lake Airport	60.2919	-102.502
CA	British Columbia	YDT	Boundary Bay Airport	49.0742	-123.012
CA	British Columbia	YDQ	Dawson Creek Airport	55.7423	-120.183
CA	Newfoundland and Labrador	YDP	Nain Airport	56.5492	-61.6803
CA	Quebec	YDO	Dolbeau-Saint-Felicien Airport	48.7785	-72.375
CA	Manitoba	YDN	Lt. Col W.G. (Billy) Barker VC Airport	51.1008	-100.052
CA	British Columbia	YKA	Kamloops Airport	50.7022	-120.444
CA	British Columbia	YDL	Dease Lake Airport	58.4222	-130.032
CA	Newfoundland and Labrador	YJT	Stephenville International Airport	48.5442	-58.55
CA	Saskatchewan	YDJ	Hatchet Lake Airport	58.6625	-103.538
CA	Alberta	YJP	Hinton/Jasper-Hinton Airport	53.3192	-117.753
CA	Nova Scotia	YDG	Digby/Annapolis Regional Airport	44.5458	-65.7854
CA	Manitoba	LRQ	Laurie River Airport	56.2486	-101.304
CA	Newfoundland and Labrador	YDF	Deer Lake Regional Airport	49.2108	-57.3914
CA	Newfoundland and Labrador	YDE	Paradise River Airport	53.43	-57.2333
CA	Quebec	YJN	Saint-Jean Airport	45.2944	-73.2811
CA	Alberta	YDC	Drayton Valley Industrial Airport	53.2658	-114.96
CA	Yukon	YDB	Burwash Airport	61.3711	-139.041
CA	Northwest Territories	YJF	Fort Liard Airport	60.2358	-123.469
CA	Yukon	YDA	Dawson City Airport	64.0431	-139.128
CA	British Columbia	YCZ	Fairmont Hot Springs Airport	50.3303	-115.873
CA	Nunavut	YCY	Clyde River Airport	70.4861	-68.5167
CA	Alberta	YJA	Jasper Airport	52.9967	-118.059
CA	Northwest Territories	GSL	Taltheilei Narrows Airport	62.5981	-111.543
CA	British Columbia	YCW	Chilliwack Airport	49.1528	-121.939
CA	Manitoba	YIV	Island Lake Airport (Garden Hill Airport)	53.8572	-94.6536
CA	Alberta	YCT	Coronation Airport	52.075	-111.445
CA	Nunavut	YCS	Chesterfield Inlet Airport	63.3469	-90.7311
CA	Manitoba	YCR	Cross Lake (Charlie Sinclair Memorial) Airport	54.6106	-97.7608
CA	Nunavut	YCO	Kugluktuk Airport	67.8167	-115.144
CA	Ontario	YCN	Cochrane Aerodrome	49.1056	-81.0136
CA	Ontario	YCM	St. Catharines/Niagara District Airport	43.1917	-79.1717
CA	New Brunswick	YCL	Charlo Airport	47.9908	-66.3303
CA	Northwest Territories	YCK	Colville Lake/Tommy Kochon Aerodrome	67.02	-126.126
CA	Nunavut	YIO	Pond Inlet Airport	72.6833	-77.9667
CA	New Brunswick	YCH	Miramichi Airport	47.0078	-65.4492
CA	Quebec	YIK	Ivujivik Airport	62.4173	-77.9253
CA	British Columbia	YCG	West Kootenay Regional Airport (Castlegar Airport)	49.2964	-117.632
CA	British Columbia	YCF	Cortes Island Aerodrome	50.063	-124.93
CA	Ontario	YCE	Centralia/James T. Field Memorial Aerodrome	43.2856	-81.5083
CA	British Columbia	YCD	Nanaimo Airport	49.055	-123.87
CA	Newfoundland and Labrador	YSO	Postville Airport	54.9105	-59.7851
CA	Ontario	YCC	Cornwall Regional Airport	45.0928	-74.5633
CA	British Columbia	CXH	Vancouver Harbour Flight Centre (Coal Harbour Seaplane Base)	49.2944	-123.111
CA	Nunavut	YCB	Cambridge Bay Airport	69.1081	-105.138
CA	British Columbia	YCA	Courtenay Airpark	49.6794	-124.982
CA	Alberta	YBY	Bonnyville Airport	54.3042	-110.744
CA	Quebec	YBX	Lourdes-de-Blanc-Sablon Airport	51.4436	-57.1853
CA	Manitoba	ILF	Ilford Airport	56.0614	-95.6139
CA	British Columbia	YBW	Bedwell Harbour Water Aerodrome	48.75	-123.233
CA	Manitoba	YBV	Berens River Airport	52.3589	-97.0183
CA	Manitoba	YBT	Brochet Airport	57.8894	-101.679
CA	Ontario	YBS	Opapimiskan Lake Airport	52.6067	-90.3769
CA	British Columbia	YIG	Big Bay Water Aerodrome	50.3923	-125.137
CA	Manitoba	YBR	Brandon Municipal Airport (McGill Field)	49.91	-99.9519
CA	Quebec	YIF	Saint-Augustin Airport	51.2117	-58.6583
CA	British Columbia	YBQ	Telegraph Harbour Seaplane Base	48.97	-123.664
CA	British Columbia	YBO	Bob Quinn Lake Airport	56.9667	-130.25
CA	British Columbia	YBL	Campbell River Airport	49.9508	-125.271
CA	Nunavut	YBK	Baker Lake Airport	64.2989	-96.0778
CA	Quebec	YBJ	Baie-Johan-Beetz Seaplane Base	50.2838	-62.8063
CA	Ontario	YIB	Atikokan Municipal Airport	48.7739	-91.6386
CA	Newfoundland and Labrador	YBI	Black Tickle Airport	53.4694	-55.785
CA	British Columbia	YBH	Bull Harbour Waterdrome	50.9179	-127.937
CA	Quebec	YBG	Canadian Forces Base Bagotville	48.3306	-70.9964
CA	British Columbia	YBF	Bamfield Water Aerodrome	48.8333	-125.133
CA	Saskatchewan	YBE	Uranium City Airport	59.5614	-108.481
CA	Quebec	YBC	Baie-Comeau Airport	49.1325	-68.2044
CA	Nunavut	YBB	Kugaaruk Airport	68.5344	-89.8081
CA	Alberta	YBA	Banff Airport	51.2073	-115.542
CA	Nova Scotia	YHZ	Halifax Stanfield International Airport	44.8808	-63.5086
CA	British Columbia	YAZ	Tofino/Long Beach Airport	49.0798	-125.776
CA	Newfoundland and Labrador	YAY	St. Anthony Airport	51.3919	-56.0831
CA	British Columbia	XBB	Blubber Bay Seaplane Base	49.794	-124.621
CA	Ontario	YAX	Angling Lake/Wapekeka Airport	53.8492	-89.5794
CA	Northwest Territories	YHY	Hay River/Merlyn Carter Airport	60.8397	-115.783
CA	British Columbia	YAV	Mayne Island Water Aerodrome (Miner's Bay Seaplane Base)	48.8667	-123.3
CA	Quebec	YAU	Kattiniq/Donaldson Airport	61.6622	-73.3214
CA	Ontario	YAT	Attawapiskat Airport	52.9275	-82.4319
CA	Quebec	YAR	La Grande-3 Airport	53.5717	-76.1964
CA	British Columbia	YAQ	Maple Bay Seaplane Base	48.8167	-123.608
CA	Ontario	MSA	Muskrat Dam Airport	53.4414	-91.7628
CA	Ontario	XBE	Bearskin Lake Airport	53.9656	-91.0272
CA	British Columbia	YRD	Dean River Airport	52.8237	-126.965
CA	Yukon	YHT	Haines Junction Airport	60.7892	-137.546
CA	Ontario	XBR	Brockville Regional Tackaberry Airport	44.6394	-75.7503
CA	British Columbia	YHS	Sechelt Aerodrome	49.4606	-123.719
CA	Ontario	YAM	Sault Ste. Marie Airport	46.485	-84.5094
CA	British Columbia	YAL	Alert Bay Airport	50.5822	-126.916
CA	British Columbia	YAJ	Lyall Harbour Seaplane Base	48.7952	-123.182
CA	Quebec	YHR	Chevery Airport	50.4689	-59.6367
CA	Northwest Territories	DAS	Great Bear Lake Airport	66.7031	-119.707
CA	Quebec	YAH	La Grande-4 Airport	53.7547	-73.6753
CA	Ontario	YAG	Fort Frances Municipal Airport	48.6542	-93.4397
CA	British Columbia	YCQ	Chetwynd Airport	55.6872	-121.627
CA	Manitoba	YAD	Moose Lake Airport	53.7063	-100.344
CA	Ontario	YAC	Cat Lake Airport	51.7272	-91.8244
CA	Nunavut	YAB	Arctic Bay Airport	73.0058	-85.0425
CA	British Columbia	YAA	Anahim Lake Airport	52.4525	-125.303
CA	Quebec	AKV	Akulivik Airport	60.8186	-78.1486
CA	Manitoba	XTL	Tadoule Lake Airport	58.7061	-98.5122
CA	Ontario	YHP	Poplar Hill Airport	52.1133	-94.2556
CA	Manitoba	XSI	South Indian Lake Airport	56.7928	-98.9072
CA	Newfoundland and Labrador	YHO	Hopedale Airport	55.4483	-60.2286
CA	Alberta	HZP	Fort MacKay/Horizon Airport	57.3817	-111.701
CA	Yukon	XRR	Ross River Airport	61.9706	-132.423
CA	Ontario	YHN	Hornepayne Municipal Airport	49.1931	-84.7589
CA	British Columbia	XQU	Qualicum Beach Airport	49.3372	-124.394
CA	Nunavut	YHK	Gjoa Haven Airport	68.6356	-95.8497
CA	Manitoba	XPP	Poplar River Airport	52.9965	-97.2742
CA	Northwest Territories	YHI	Ulukhaktok/Holman Airport	70.7628	-117.806
CA	Ontario	YZR	Sarnia Chris Hadfield Airport	42.9994	-82.3089
CA	British Columbia	YZP	Sandspit Airport	53.2543	-131.814
CA	British Columbia	YHH	Campbell River Water Aerodrome	50.05	-125.25
CA	Alberta	YZH	Slave Lake Airport	55.2931	-114.777
CA	Quebec	YZG	Salluit Airport	62.1794	-75.6672
CA	Saskatchewan	XCL	Cluff Lake Airport	58.3911	-109.516
CA	Prince Edward Island	YHG	Charlottetown Airport	46.2862	-63.1297
CA	Northwest Territories	YZF	Yellowknife Airport	62.4628	-114.44
CA	Ontario	YHF	Hearst Municipal Airport	49.7142	-83.6861
CA	Ontario	XCM	Chatham-Kent Airport	42.3064	-82.0819
CA	Ontario	YZE	Gore Bay-Manitoulin Airport	45.8853	-82.5678
CA	Alberta	YZU	Whitecourt Airport	54.1439	-115.787
CA	British Columbia	YHE	Hope Aerodrome	49.3683	-121.498
CA	British Columbia	YZA	Cache Creek Airport (Ashcroft Regional Airport)	50.7753	-121.321
CA	Quebec	YZV	Sept-Iles Airport	50.2233	-66.2656
CA	Ontario	YHD	Dryden Regional Airport	49.8317	-92.7442
CA	British Columbia	YHC	Hakai Passage Water Aerodrome	51.733	-128.117
CA	Saskatchewan	YHB	Hudson Bay Airport	52.8167	-102.311
CA	Quebec	YYY	Mont-Joli Airport	48.6086	-68.2081
CA	Newfoundland and Labrador	YHA	Port Hope Simpson Airport	52.5281	-56.2861
CA	Ontario	YYW	Armstrong Airport	50.2903	-88.9097
CA	Ontario	YYU	Kapuskasing Airport	49.4139	-82.4675
CA	Newfoundland and Labrador	YYT	St. John's International Airport	47.6186	-52.7519
CA	Nunavut	YGZ	Grise Fiord Airport	76.4261	-82.9092
CA	Manitoba	YGX	Gillam Airport	56.3575	-94.7106
CA	Quebec	YGW	Kuujjuarapik Airport	55.2819	-77.7653
CA	Newfoundland and Labrador	YYR	CFB Goose Bay	53.3192	-60.4258
CA	Manitoba	YYQ	Churchill Airport	58.7392	-94.065
CA	Saskatchewan	YYN	Swift Current Airport	50.2919	-107.691
CA	Alberta	YYM	Cowley Airport	49.6364	-114.094
CA	Manitoba	YYL	Lynn Lake Airport	56.8639	-101.076
CA	British Columbia	YYJ	Victoria International Airport	48.6469	-123.426
CA	Manitoba	YYI	Rivers Airport	50.0101	-100.314
CA	Nunavut	YYH	Taloyoak Airport	69.5467	-93.5767
CA	Prince Edward Island	YYG	Charlottetown Airport	46.29	-63.1211
CA	Yukon	YZW	Teslin Airport	60.1728	-132.743
CA	British Columbia	YYF	Penticton Regional Airport	49.4631	-119.602
CA	Nova Scotia	YZX	CFB Greenwood	44.9844	-64.9169
CA	British Columbia	YYE	Northern Rockies Regional Airport	58.8364	-122.597
CA	Quebec	YGV	Havre Saint-Pierre Airport	50.2819	-63.6114
CA	British Columbia	YYD	Smithers Airport	54.8247	-127.183
CA	Alberta	YYC	Calgary International Airport	51.1139	-114.02
CA	Nunavut	YGT	Igloolik Airport	69.3647	-81.8161
CA	Quebec	YGR	Iles-de-la-Madeleine Airport	47.4247	-61.7781
CA	British Columbia	YZZ	Trail Airport	49.0556	-117.609
CA	Ontario	YGQ	Geraldton (Greenstone Regional) Airport	49.7783	-86.9394
CA	Ontario	YYB	North Bay/Jack Garland Airport	46.3636	-79.4228
CA	British Columbia	ZAA	Alice Arm/Silver City Water Aerodrome	55.4667	-129.483
CA	Ontario	YXZ	Wawa Airport	47.9667	-84.7867
CA	Manitoba	XGL	Granville Lake Airport	56.3	-100.5
CA	Manitoba	ZAC	York Landing Airport	56.0894	-96.0892
CA	Yukon	YXY	Erik Nielsen Whitehorse International Airport	60.7096	-135.067
CA	Quebec	YGP	Michel-Pouliot Gaspe Airport	48.7753	-64.4786
CA	British Columbia	YXX	Abbotsford International Airport	49.0253	-122.361
CA	Ontario	YXU	London International Airport	43.0356	-81.1539
CA	Manitoba	YGO	Gods Lake Narrows Airport	54.5589	-94.4914
CA	British Columbia	YXT	Northwest Regional Airport	54.4685	-128.576
CA	British Columbia	YGN	Greenway Sound Seaplane Base	50.839	-126.775
CA	Manitoba	YGM	Gimli Industrial Park Airport	50.6281	-97.0433
CA	Quebec	YGL	La Grande Riviere Airport	53.6253	-77.7042
CA	Ontario	YGK	Kingston/Norman Rogers Airport	44.2253	-76.5969
CA	British Columbia	YXS	Prince George Airport	53.8894	-122.679
CA	Quebec	XGR	Kangiqsualujjuaq (Georges River) Airport	58.7114	-65.9928
CA	Ontario	YXR	Earlton (Timiskaming Regional) Airport	47.6974	-79.8473
CA	Yukon	YXQ	Beaver Creek Airport	62.4103	-140.867
CA	Nunavut	YXP	Pangnirtung Airport	66.145	-65.7136
CA	British Columbia	QBC	Bella Coola Airport	52.3875	-126.596
CA	Northwest Territories	YGH	Fort Good Hope Airport	66.2408	-128.651
CA	New Brunswick	ZBF	Bathurst Airport (New Brunswick)	47.6297	-65.7389
CA	Quebec	ZBM	Roland-Desourdy Airport	45.2908	-72.7414
CA	Nunavut	YXN	Whale Cove Airport	62.24	-92.5981
CA	British Columbia	YGG	Ganges Water Aerodrome	48.8545	-123.497
CA	Ontario	YXL	Sioux Lookout Airport	50.1139	-91.9053
CA	Quebec	YXK	Rimouski Airport	48.4781	-68.4969
CA	British Columbia	ZEL	Bella Bella (Campbell Island) Airport	52.185	-128.157
CA	British Columbia	YXJ	Fort St. John Airport (North Peace Airport)	56.2381	-120.74
CA	Alberta	YXH	Medicine Hat Airport	50.0189	-110.721
CA	Saskatchewan	YXE	Saskatoon John G. Diefenbaker International Airport	52.1708	-106.7
CA	British Columbia	YXC	Cranbrook/Canadian Rockies International Airport	49.6108	-115.782
CA	British Columbia	YGE	Gorge Harbour Seaplane Base	50.0994	-125.023
CA	Quebec	ZEM	Eastmain River Airport	52.2264	-78.5225
CA	Northwest Territories	YWY	Wrigley Airport	63.2094	-123.437
CA	British Columbia	YZT	Port Hardy Airport	50.6806	-127.367
CA	British Columbia	YWS	Whistler/Green Lake Water Aerodrome	50.1436	-122.949
CA	Ontario	YWR	White River Water Aerodrome	48.6269	-85.2233
CA	Yukon	ZFA	Faro Airport (Yukon)	62.2075	-133.376
CA	Saskatchewan	ZFD	Fond-du-Lac Airport	59.3344	-107.182
CA	Quebec	YWQ	Chutes-des-Passes/Lac Margane Water Aerodrome	49.9434	-71.138
CA	Northwest Territories	ZFM	Fort McPherson Airport	67.4075	-134.861
CA	Northwest Territories	ZFN	Tulita Airport	64.9097	-125.573
CA	Ontario	YWP	Webequie Airport	52.9594	-87.3749
CA	Newfoundland and Labrador	YWM	Williams Harbour Airport	52.5669	-55.7847
CA	Alberta	YGC	Grande Cache Airport	53.9169	-118.874
CA	British Columbia	YWL	Williams Lake Airport	52.1831	-122.054
CA	British Columbia	YGB	Texada/Gillies Bay Airport	49.6942	-124.518
CA	Alberta	ZFW	Fairview Airport	56.0814	-118.435
CA	Ontario	KIF	Kingfisher Lake Airport	53.0125	-89.8553
CA	Newfoundland and Labrador	YFX	St. Lewis (Fox Harbour) Airport	52.3728	-55.6739
CA	Northwest Territories	YFS	Fort Simpson Airport	61.7602	-121.237
CA	Newfoundland and Labrador	YWK	Wabush Airport	52.9219	-66.8644
CA	British Columbia	ZGF	Grand Forks Airport	49.0156	-118.431
CA	Northwest Territories	YWJ	Deline Airport	65.2111	-123.436
CA	British Columbia	YWH	Victoria Harbour Water Airport	48.425	-123.389
CA	Manitoba	ZGI	Gods River Airport	54.8397	-94.0786
CA	Northwest Territories	YFR	Fort Resolution Airport	61.1808	-113.69
CA	Manitoba	ZGR	Little Grand Rapids Airport	52.0456	-95.4658
CA	Northwest Territories	YSG	Lutselk'e Airport	62.4183	-110.682
CA	Manitoba	YWG	Winnipeg James Armstrong Richardson International Airport	49.91	-97.2399
CA	Quebec	YWB	Kangiqsujuaq (Wakeham Bay) Airport	61.5886	-71.9294
CA	Quebec	ZGS	La Romaine Airport	50.2597	-60.6794
CA	Ontario	YWA	Petawawa Airport	45.9522	-77.3192
CA	Manitoba	YFO	Flin Flon Airport	54.6781	-101.682
CA	Ontario	XKS	Kasabonika Airport	53.5247	-88.6428
CA	Northwest Territories	YFL	Fort Reliance Water Aerodrome (CJN8)	62.7	-109.167
CA	Northwest Territories	YFJ	Wekweeti Airport	64.1908	-114.077
CA	Ontario	YVZ	Deer Lake Airport	52.6558	-94.0614
CA	Ontario	YVV	Wiarton Airport	44.7458	-81.1072
CA	Saskatchewan	YVT	Buffalo Narrows Airport	55.8419	-108.418
CA	Alberta	YFI	Fort MacKay/Firebag Aerodrome	57.2758	-110.977
CA	Manitoba	XLB	Lac Brochet Airport	58.6175	-101.469
CA	Ontario	YFH	Fort Hope Airport	51.5619	-87.9078
CA	British Columbia	YVR	Vancouver International Airport	49.1939	-123.184
CA	Northwest Territories	YVQ	Norman Wells Airport	65.2816	-126.798
CA	Quebec	YVP	Kuujjuaq Airport	58.0961	-68.4269
CA	Quebec	YFG	Fontanges Airport	54.5539	-71.1733
CA	Quebec	YFE	Forestville Airport	48.7461	-69.0972
CA	Quebec	YVO	Val-d'Or Airport	48.0533	-77.7828
CA	Nunavut	YVN	Cape Dyer Airport	66.593	-61.5776
CA	Nunavut	YVM	Qikiqtarjuaq Airport	67.5458	-64.0314
CA	New Brunswick	YFC	Fredericton International Airport	45.8689	-66.5372
CA	Alberta	ZHP	High Prairie Airport	55.3936	-116.475
CA	Alberta	YVG	Vermilion Airport	53.3558	-110.824
CA	Nunavut	YFB	Iqaluit Airport	63.7564	-68.5558
CA	British Columbia	YVE	Vernon Regional Airport	50.2481	-119.331
CA	Saskatchewan	YVC	La Ronge (Barber Field) Airport	55.1514	-105.262
CA	Quebec	YVB	Bonaventure Airport	48.0711	-65.4603
CA	Quebec	YUY	Rouyn-Noranda Airport	48.2061	-78.8356
CA	Nunavut	YUX	Hall Beach Airport	68.7761	-81.2425
CA	Nunavut	YUT	Repulse Bay Airport	66.5214	-86.2247
CA	Ontario	YFA	Fort Albany Airport	52.2014	-81.6969
CA	Quebec	YUD	Umiujaq Airport	56.5361	-76.5183
CA	Northwest Territories	YUB	Tuktoyaktuk/James Gruben Airport	69.4333	-133.026
CA	Quebec	YEY	Amos/Magny Airport	48.5639	-78.2497
CA	Northwest Territories	YEV	Inuvik (Mike Zubko) Airport	68.3042	-133.483
CA	Nunavut	YEU	Eureka Aerodrome	79.9947	-85.8142
CA	British Columbia	YTX	Telegraph Creek Airport	57.9167	-131.117
CA	Manitoba	ZJG	Jenpeg Airport	54.5189	-98.0461
CA	British Columbia	YTU	Tasu Water Aerodrome	52.7631	-132.04
CA	Saskatchewan	YTT	Tisdale Airport	52.8367	-104.067
CA	Alberta	YET	Edson Airport	53.5789	-116.465
CA	Ontario	YTS	Timmins/Victor M. Power Airport	48.5697	-81.3767
CA	Ontario	YTR	CFB Trenton	44.1189	-77.5281
CA	Quebec	YTQ	Tasiujaq Airport	58.6678	-69.9558
CA	Ontario	YER	Fort Severn Airport	56.0189	-87.6761
CA	British Columbia	YTP	Tofino Harbour Water Aerodrome	49.155	-125.91
CA	Ontario	KEW	Keewaywin Airport	52.9911	-92.8364
CA	Quebec	YTM	Mont Tremblant International Airport	46.4094	-74.78
CA	Manitoba	KES	Kelsey Airport	56.0375	-96.5097
CA	Manitoba	ZJN	Swan River Airport	52.1206	-101.236
CA	Ontario	YTL	Big Trout Lake Airport	53.8178	-89.8969
CA	Yukon	XMP	Macmillan Pass Airport	63.1811	-130.202
CA	British Columbia	DGF	Douglas Lake Airport	50.1655	-120.171
CA	Ontario	ZKE	Kashechewan Airport	52.2825	-81.6778
CA	Quebec	ZKG	Kegaska Airport	50.1958	-61.2658
CA	Quebec	ZLT	La Tabatiere Airport	50.8308	-58.9756
CA	British Columbia	ZMH	South Cariboo Regional Airport	51.7361	-121.333
CA	Saskatchewan	YEN	Estevan Regional Aerodrome	49.2103	-102.966
CA	Ontario	SUR	Summer Beaver Airport	52.7086	-88.5419
CA	Manitoba	YTH	Thompson Airport	55.8011	-97.8642
CA	Ontario	YEM	Manitowaning/Manitoulin East Municipal Airport	45.8428	-81.8581
CA	British Columbia	ZMT	Masset Airport	54.0275	-132.125
CA	British Columbia	ZNA	Nanaimo Harbour Water Airport	49.1833	-123.95
CA	Ontario	YEL	Elliot Lake Municipal Airport	46.3514	-82.5614
CA	British Columbia	YTG	Sullivan Bay Water Aerodrome	50.8854	-126.831
CA	Nunavut	YEK	Arviat Airport	61.0942	-94.0708
CA	British Columbia	ZNU	Namu Water Aerodrome	51.8628	-127.869
CA	Quebec	YTF	Alma Airport	48.5089	-71.6419
CA	Nunavut	YTE	Cape Dorset Airport	64.23	-76.5267
CA	Manitoba	YTD	Thicket Portage Airport	55.3189	-97.7078
CA	British Columbia	YTB	Hartley Bay Water Aerodrome	53.4167	-129.25
CA	Ontario	YTA	Pembroke Airport	45.8644	-77.2517
CA	Northwest Territories	YSY	Sachs Harbour (David Nasogaluak Jr. Saaryuaq) Airport	71.9939	-125.243
CA	British Columbia	YSX	Bella Bella/Shearwater Water Aerodrome	52.15	-128.083
CA	British Columbia	ZOF	Ocean Falls Water Aerodrome	52.3667	-127.717
CA	Prince Edward Island	YSU	Summerside Airport	46.4406	-63.8336
CA	Manitoba	YST	St. Theresa Point Airport	53.8456	-94.8519
CA	Ontario	YSP	Marathon Aerodrome	48.7553	-86.3444
CA	Manitoba	PIW	Pikwitonei Airport	55.5889	-97.1642
CA	Ontario	ZPB	Sachigo Lake Airport	53.8911	-92.1964
CA	British Columbia	YSN	Salmon Arm Airport	50.6828	-119.229
CA	Manitoba	XPK	Pukatawagan Airport	55.7492	-101.266
CA	Northwest Territories	YSM	Fort Smith Airport	60.0203	-111.962
CA	Saskatchewan	ZPO	Pinehouse Lake Airport	55.5281	-106.582
CA	British Columbia	ZQS	Queen Charlotte City Water Aerodrome	53.267	-132.083
CA	New Brunswick	YSL	Saint-Leonard Aerodrome	47.1575	-67.8347
CA	Nunavut	YSK	Sanikiluaq Airport	56.5378	-79.2467
CA	New Brunswick	YSJ	Saint John Airport	45.3161	-65.8903
CA	Ontario	YEB	Bar River Airport	46.4203	-84.0922
CA	Ontario	YSI	Parry Sound/Frying Pan Island-Sans Souci Water Aerodrome	45.1733	-80.1375
CA	Ontario	YSH	Smiths Falls-Montague Airport	44.9458	-75.9406
CA	Saskatchewan	YSF	Stony Rapids Airport	59.2503	-105.841
CA	British Columbia	YSE	Squamish Airport	49.7817	-123.162
CA	Alberta	YSD	CFB Suffield	50.2667	-111.183
CA	Quebec	YSC	Sherbrooke Airport	45.4386	-71.6914
CA	Ontario	YSB	Sudbury Airport	46.625	-80.7989
CA	Nova Scotia	YSA	Sable Island Aerodrome	43.9303	-59.9603
CA	British Columbia	YRV	Revelstoke Airport	50.9667	-118.183
CA	Ontario	ZRJ	Round Lake (Weagamow Lake) Airport	52.9436	-91.3128
CA	Nunavut	YRT	Rankin Inlet Airport	62.8114	-92.1158
CA	Manitoba	YRS	Red Sucker Lake Airport	54.1672	-93.5572
CA	British Columbia	YRR	Stuart Island Airport	50.4094	-125.132
CA	Quebec	YRQ	Trois-Rivieres Airport	46.3528	-72.6794
CA	Ontario	ZSJ	Sandy Lake Airport	53.0642	-93.3444
CA	Ontario	YRO	Ottawa/Rockcliffe Airport	45.4603	-75.6461
CA	British Columbia	YRN	Rivers Inlet Water Aerodrome	51.684	-127.264
CA	British Columbia	ZST	Stewart Aerodrome	55.9354	-129.982
CA	Alberta	YRM	Rocky Mountain House Airport	52.4297	-114.904
CA	Ontario	YRL	Red Lake Airport	51.0669	-93.7931
CA	Quebec	YRJ	Roberval Airport	48.52	-72.2656
CA	Quebec	YRI	Riviere-du-Loup Airport	47.7644	-69.5847
CA	British Columbia	ZSW	Prince Rupert/Seal Cove Water Airport	54.3333	-130.283
CA	Newfoundland and Labrador	YRG	Rigolet Airport	54.1797	-58.4575
CA	Newfoundland and Labrador	YRF	Cartwright Airport	53.6828	-57.0419
CA	Northwest Territories	YDW	Obre Lake/North of Sixty Airport	60.3164	-103.129
CA	British Columbia	YRC	Refuge Cove Water Aerodrome	50.1234	-124.843
CA	Nunavut	YRB	Resolute Bay Airport	74.7169	-94.9694
CA	Northwest Territories	YRA	Gameti/Rae Lakes Airport	64.1161	-117.31
CA	Quebec	ZTB	Tete-a-la-Baleine Airport	50.6744	-59.3836
CA	British Columbia	YQZ	Quesnel Airport	53.0261	-122.51
CA	Nova Scotia	YQY	Sydney/J.A. Douglas McCurdy Airport	46.1614	-60.0478
CA	Newfoundland and Labrador	YQX	Gander International Airport / CFB Gander	48.9369	-54.5681
CA	Saskatchewan	YQW	North Battleford Airport (Cameron McIntosh Airport)	52.7692	-108.244
CA	Manitoba	ZTM	Shamattawa Airport	55.8656	-92.0814
CA	Saskatchewan	YQV	Yorkton Municipal Airport	51.2647	-102.462
CA	Alberta	YQU	Grande Prairie Airport	55.1797	-118.885
CA	Ontario	YQT	Thunder Bay International Airport	48.3719	-89.3239
CA	British Columbia	ZTS	Tahsis Water Aerodrome	49.9167	-126.667
CA	British Columbia	TUX	Tumbler Ridge Airport	55.025	-120.935
CA	Ontario	YQS	St. Thomas Municipal Airport	42.77	-81.1108
CA	Ontario	ZUC	Ignace Municipal Airport	49.4297	-91.7178
CA	Saskatchewan	YQR	Regina International Airport	50.4319	-104.666
CA	British Columbia	YQQ	CFB Comox	49.7108	-124.887
CA	Ontario	YQN	Nakina Airport	50.1828	-86.6964
CA	Northwest Territories	LAK	Aklavik/Freddie Carmichael Airport	68.2233	-135.006
CA	Newfoundland and Labrador	ZUM	Churchill Falls Airport	53.5619	-64.1064
CA	Saskatchewan	ZWL	Wollaston Lake Airport	58.1069	-103.172
CA	New Brunswick	YQM	Greater Moncton International Airport	46.1122	-64.6786
CA	Alberta	YQL	Lethbridge Airport	49.6303	-112.8
CA	Alberta	TIL	Cheadle Airport	51.0575	-113.624
CA	Ontario	YQK	Kenora Airport	49.7883	-94.3631
CA	Nova Scotia	YQI	Yarmouth Airport	43.8269	-66.0881
CA	Yukon	YQH	Watson Lake Airport	60.1164	-128.822
CA	Alberta	NML	Fort McMurray/Mildred Lake Airport	57.0556	-111.574
CA	Ontario	YQG	Windsor International Airport	42.2756	-82.9556
CA	Alberta	YQF	Red Deer Regional Airport	52.1822	-113.894
CA	Manitoba	YQD	The Pas Airport	53.9714	-101.091
CA	Quebec	YQC	Quaqtaq Airport	61.0464	-69.6178
CA	Quebec	YQB	Quebec City Jean Lesage International Airport	46.7911	-71.3933
CA	Ontario	YQA	Muskoka Airport	44.9747	-79.3033
CA	British Columbia	YPZ	Burns Lake Airport	54.3764	-125.951
CA	Alberta	YPY	Fort Chipewyan Airport	58.7672	-111.117
CA	Quebec	YPX	Puvirnituq Airport	60.0506	-77.2869
CA	British Columbia	YPW	Powell River Airport	49.8342	-124.5
CA	British Columbia	YPT	Pender Harbour Water Aerodrome	49.6238	-124.025
CA	Nova Scotia	YPS	Port Hawkesbury Airport	45.6567	-61.3681
CA	Nunavut	JOJ	Doris Lake Aerodrome	68.1253	-106.585
CA	British Columbia	YPR	Prince Rupert Airport	54.2861	-130.445
CA	Ontario	YPQ	Peterborough Airport	44.23	-78.3633
CA	Ontario	YPO	Peawanuck Airport	54.9881	-85.4433
CA	Quebec	YPN	Port-Menier Airport	49.8364	-64.2886
CA	Ontario	YPM	Pikangikum Airport	51.8197	-93.9733
CA	Northwest Territories	TNS	Tungsten (Cantung) Airport	61.9569	-128.203
CA	Ontario	YPL	Pickle Lake Airport	51.4464	-90.2142
CA	Quebec	YPJ	Aupaluk Airport	59.2967	-69.5997
CA	British Columbia	YPI	Port Simpson Water Aerodrome	54.5667	-130.433
CA	Quebec	YPH	Inukjuak Airport	58.4719	-78.0769
CA	Manitoba	YPG	Portage la Prairie/Southport Airport	49.9031	-98.2738
CA	Alberta	YPE	Peace River Airport	56.2269	-117.447
CA	Ontario	YPD	Parry Sound Area Municipal Airport	45.2575	-79.8297
CA	Northwest Territories	YPC	Nora Aliqatchialuk Ruben Airport	69.3608	-124.075
CA	British Columbia	YPB	Alberni Valley Regional Airport	49.3219	-124.931
CA	Saskatchewan	YPA	Prince Albert (Glass Field) Airport	53.2142	-105.673
CA	Ontario	YOW	Ottawa Macdonald-Cartier International Airport	45.3225	-75.6692
CA	Ontario	YOS	Billy Bishop Regional Airport	44.5903	-80.8375
CA	Ontario	YYZ	Toronto Pearson International Airport	43.6797	-79.6227
CA	Ontario	YTZ	Billy Bishop Toronto City Airport	43.6285	-79.396
CA	Ontario	YKF	Region of Waterloo International Airport	43.4558	-80.3858
CA	Alberta	YOP	Rainbow Lake Airport	58.4914	-119.408
CA	Ontario	YOO	Oshawa Airport	43.9228	-78.895
CA	Alberta	YOJ	High Level Airport	58.6214	-117.165
CA	Quebec	YOI	Opinaca Aerodrome	52.2219	-76.6119
CA	Quebec	YUL	MontrÃƒÂ©al-Pierre Elliott Trudeau International Airport	45.4657	-73.7455
CA	Quebec	YMX	MontrÃƒÂ©al-Mirabel International Airport	45.6702	-74.0324
CA	Manitoba	YOH	Oxford House Airport	54.9333	-95.2789
CA	Ontario	YOG	Ogoki Post Airport	51.6586	-85.9017
CA	Alberta	YOE	Donnelly Airport	55.7094	-117.094
CA	Alberta	JHL	Fort MacKay/Albian Aerodrome	57.2239	-111.419
CA	British Columbia	SYF	Silva Bay Seaplane Base	49.15	-123.696
CA	British Columbia	CFQ	Creston Aerodrome	49.0369	-116.498
CA	Alberta	YOD	CFB Cold Lake (R.W. McNair Airport)	54.405	-110.279
CA	Yukon	YOC	Old Crow Airport	67.5706	-139.839
CA	Northwest Territories	YOA	Ekati Airport	64.6989	-110.615
CA	Northwest Territories	YNX	Snap Lake Airport	63.5936	-110.906
CA	Quebec	YNS	Nemiscau Airport	51.6911	-76.1356
CA	Newfoundland and Labrador	YNP	Natuashish Airport	55.9139	-61.1844
CA	Ontario	YNO	North Spirit Lake Airport	52.49	-92.9711
CA	Northwest Territories	DVK	Diavik Airport	64.5114	-110.289
CA	Northwest Territories	GHK	Gahcho Kue Aerodrome	63.4265	-109.193
CA	British Columbia	DUQ	Duncan Airport	48.7545	-123.71
CA	Quebec	YNM	Matagami Airport	49.7617	-77.8028
CA	Saskatchewan	YNL	Points North Landing Airport	58.2767	-104.082
CA	British Columbia	YNH	Hudson's Hope Airport	56.0356	-121.976
CA	Manitoba	YNE	Norway House Airport	53.9583	-97.8442
CA	Quebec	YND	Gatineau-Ottawa Executive Airport	45.5217	-75.5636
CA	Quebec	YNC	Wemindji Airport	53.0106	-78.8311
CA	Quebec	YNA	Natashquan Airport	50.19	-61.7892
CA	Quebec	YMW	Maniwaki Airport	46.2728	-75.9906
CA	Nunavut	YMV	Mary River Aerodrome	71.3242	-79.3569
CA	British Columbia	YMU	Mansons Landing Water Aerodrome	50.0667	-124.983
CA	Quebec	YMT	Chibougamau/Chapais Airport	49.7719	-74.5281
CA	British Columbia	YMP	Port McNeill Airport	50.5756	-127.029
CA	Ontario	YMO	Moosonee Airport	51.2911	-80.6078
CA	Nunavut	UZM	Hope Bay Aerodrome	68.156	-106.618
CA	Newfoundland and Labrador	YMN	Makkovik Airport	55.0769	-59.1864
CA	Alberta	YMM	Fort McMurray International Airport	56.6533	-111.222
CA	Quebec	YML	Charlevoix Airport	47.5975	-70.2239
CA	Saskatchewan	YMJ	CFB Moose Jaw (C.M. McEwen Airport)	50.3303	-105.559
CA	Newfoundland and Labrador	YMH	Mary's Harbour Airport	52.3028	-55.8472
CA	Ontario	YMG	Manitouwadge Airport	49.0839	-85.8606
CA	British Columbia	YMF	Montague Harbour Water Aerodrome	48.817	-123.2
CA	Ontario	WNN	Wunnummin Lake Airport	52.8939	-89.2892
CA	Quebec	YME	Matane Airport	48.8569	-67.4533
CA	Northwest Territories	YMD	Mould Bay Airport	76.2392	-119.322
CA	British Columbia	YMB	Merritt Airport	50.1228	-120.747
CA	Yukon	YMA	Mayo Airport	63.6164	-135.868
CA	British Columbia	YLY	Langley Regional Airport	49.1008	-122.631
CA	British Columbia	YLW	Kelowna International Airport	49.9561	-119.378
CA	Alberta	WPC	Pincher Creek Airport	49.5206	-113.997
CA	Nunavut	YLT	Alert Airport	82.5178	-62.2806
CA	Quebec	YLS	Lebel-sur-Quevillon Airport	49.0303	-77.0172
CA	British Columbia	WPL	Powell Lake Water Aerodrome	49.8833	-124.533
CA	Manitoba	YLR	Leaf Rapids Airport	56.5133	-99.9853
CA	Quebec	YLQ	La Tuque Airport	47.4097	-72.7889
CA	Quebec	YLP	Mingan Airport	50.2869	-64.1528
CA	Quebec	SSQ	La Sarre Airport	48.9172	-79.1786
CA	Yukon	YLM	Clinton Creek Airport	64.4755	-140.742
CA	Alberta	YLL	Lloydminster Airport	53.3092	-110.073
CA	British Columbia	CJH	Chilko Lake (Tsylos Park Lodge) Aerodrome	51.6261	-124.142
CA	Ontario	YLK	Lake Simcoe Regional Airport	44.4853	-79.5556
CA	Saskatchewan	YLJ	Meadow Lake Airport	54.1253	-108.523
CA	Ontario	YLH	Lansdowne House Airport	52.1956	-87.9342
CA	Northwest Territories	YLE	Whati Airport	63.1317	-117.246
CA	Ontario	YLD	Chapleau Airport	47.82	-83.3467
CA	Nunavut	YLC	Kimmirut Airport	62.85	-69.8833
CA	Alberta	YLB	Lac La Biche Airport	54.7703	-112.032
CA	Saskatchewan	YKY	Kindersley Regional Airport	51.5175	-109.181
CA	Ontario	YKX	Kirkland Lake Airport	48.2103	-79.9814
CA	Quebec	YKU	Chisasibi Airport	53.8056	-78.9169
CA	British Columbia	YKT	Klemtu Water Aerodrome	52.6076	-128.522
CA	Quebec	YKQ	Waskaganish Airport	51.4733	-78.7583
CA	Quebec	YKL	Schefferville Airport	54.8053	-66.8053
CA	British Columbia	YKK	Kitkatla Water Aerodrome	53.8	-130.433
CA	Nunavut	YZS	Coral Harbour Airport	64.1933	-83.3594
CA	Saskatchewan	YKJ	Key Lake Airport	57.2561	-105.618
CA	Quebec	YKG	Kangirsuk Airport	60.0272	-69.9992
CA	Manitoba	YKE	Knee Lake Airport	54.9153	-94.7981
CA	Ontario	YKD	Kincardine Municipal Airport	44.2014	-81.6067
CA	Newfoundland and Labrador	YYT	St. John's International Airport	47.6186	-52.7525
CA	Ontario	YHM	John C. Munro Hamilton International Airport	43.1736	-79.935
CC	Cocos (Keeling) Islands	CCK	Cocos (Keeling) Islands Airport	-12.1886	96.8306
CD	Kinshasa	FIH	N'djili Airport	-4.38575	15.4446
CD	Mai-Ndombe	INO	Inongo Airport	-1.94722	18.2858
CD	Equateur	BSU	Basankusu Airport	1.22472	19.7889
CD	Haut-Katanga	KEC	Kasenga Airport	-10.35	28.633
CD	Lualaba	KWZ	Kolwezi Airport	-10.7659	25.5057
CD	Kasai	BAN	Basongo Airport	-4.3158	20.4149
CD	Nord-Kivu	GOM	Goma International Airport	-1.67081	29.2385
CD	Bas-Uele	BZU	Buta Zega Airport	2.81835	24.7937
CD	Mongala	LIQ	Lisala Airport	2.17066	21.4969
CD	Kasai	PFR	Ilebo Airport	-4.32992	20.5901
CD	Kongo Central	LZI	Luozi Airport	-4.95	14.133
CD	Sud-Ubangi	LIE	Libenge Airport	3.633	18.633
CD	Kasai Oriental	LJA	Lodja Airport	-3.417	23.45
CD	Tshopo	FKI	Bangoka International Airport	0.481639	25.338
CD	Kasai	KGA	Kananga Airport	-5.90005	22.4692
CD	Sankuru	IKL	Ikela Airport	-1.04811	23.3725
CD	Mai-Ndombe	LUS	Lusanga Airport	-4.8	18.717
CD	Kongo Central	NKL	Nkolo-Fuma Airport	-5.421	14.8169
CD	Mai-Ndombe	MSM	Masi-Manimba Airport	-4.783	17.85
CD	Nord-Kivu	IRP	Matari Airport	2.82761	27.5883
CD	Tshopo	YAN	Yangambi Airport	0.783	24.467
CD	Kasai Oriental	LBO	Lusambo Airport	-4.96167	23.3783
CD	Maniema	PUN	Punia Airport	-1.367	26.333
CD	Haut-Katanga	PWO	Pweto Airport	-8.467	28.883
CD	Mai-Ndombe	IDF	Idiofa Airport	-5	19.6
CD	Kinshasa	FIH	N'djili Airport (Kinshasa Int'l Airport)	-4.38575	15.4446
CD	Kasai	LZA	Luiza Airport	-7.183	22.4
CD	Mai-Ndombe	FDU	Bandundu Airport	-3.31132	17.3817
CD	Kasai Oriental	MJM	Mbuji Mayi Airport	-6.12124	23.569
CD	Equateur	MDK	Mbandaka Airport	0.0226	18.2887
CD	Mongala	BMB	Bumba Airport	2.18278	22.4817
CD	Ituri	BUX	Bunia Airport	1.56572	30.2208
CD	Maniema	KND	Kindu Airport	-2.91918	25.9154
CD	Tanganyika	KBO	Kabalo Airport	-6.083	26.917
CD	Tanganyika	BDV	Moba Airport	-7.067	29.783
CD	Kasai	TSH	Tshikapa Airport	-6.43833	20.7947
CD	Maniema	KLY	Kamisuku Airport	-2.578	26.734
CD	Equateur	BDT	Gbadolite Airport	4.25321	20.9753
CD	Kinshasa	NLO	N'Dolo Airport	-4.32666	15.3275
CD	Nord-Ubangi	KLI	Kotakoli Air Base	4.15764	21.6509
CD	Tshuapa	BNB	Boende Airport	-0.217	20.85
CD	Nord-Kivu	BNC	Beni Airport	0.575	29.4739
CD	Haut-Katanga	KNM	Kaniama Airport	-7.583	24.15
CD	Kongo Central	BOA	Boma Airport	-5.854	13.064
CD	Haut-Katanga	FBM	Lubumbashi International Airport	-11.5913	27.5309
CD	Mai-Ndombe	KKW	Kikwit Airport	-5.03577	18.7856
CD	Nord-Kivu	RUE	Butembo Airport	0.117142	29.313
CD	Kasai Oriental	KBN	Tunta Airport	-6.133	24.483
CD	Sud-Ubangi	GMA	Gemena Airport	3.23537	19.7713
CD	Tanganyika	FMI	Kalemie Airport	-5.87556	29.25
CD	Sud-Kivu	BKY	Kavumu Airport	-2.30898	28.8088
CD	Haut-Katanga	KAP	Kapanga Airport	-8.35	22.583
CD	Tanganyika	KOO	Kongolo Airport	-5.39444	26.99
CD	Tanganyika	MNO	Manono Airport	-7.28889	27.3944
CD	Kongo Central	MAT	Matadi Tshimpi Airport	-5.79961	13.4404
CD	Haut-Katanga	KIL	Kilwa Airport	-9.2886	28.3269
CD	Kongo Central	MNB	Muanda Airport (Moanda Airport)	-5.93086	12.3518
CD	Mai-Ndombe	KRZ	Basango Mboliasa Airport	-1.435	19.024
CD	Kasai	MEW	Mweka Airport	-4.85	21.55
CD	Kasai Oriental	GDJ	Gandajika Airport	-6.733	23.95
CD	Mai-Ndombe	KGN	Kasongo Lunda Airport	-4.533	26.617
CD	Mai-Ndombe	NIO	Nioki Airport	-2.7175	17.6847
CF	Haute-Kotto	ODA	Ouadda Airport	8.01056	22.3986
CF	Haut-Mbomou	IMO	Zemio Airport	5.05	25.15
CF	Vakaga	GDI	Gordil Airport	9.58112	21.7282
CF	Bangui	BGF	Bangui M'Poko International Airport	4.39848	18.5188
CF	Mbomou	RFA	Rafai Airport	4.98861	23.9278
CF	Mambere-Kadei	BBT	Berberati Airport	4.22158	15.7864
CF	Haute-Kotto	AIG	Yalinga Airport	6.52	23.26
CF	Mbomou	BMF	Bakouma Airport	5.694	22.801
CF	Haut-Mbomou	MKI	M'Boki Airport	5.33301	25.9319
CF	Nana-Mambere	BOP	Bouar Airport	5.958	15.637
CF	Ouham	BCF	Bouca Airport	6.517	18.267
CF	Ouham	BTG	Batangafo Airport	7.31411	18.3088
CF	Mambere-Kadei	CRF	Carnot Airport	4.937	15.894
CF	Bamingui-Bangoran	NDL	N'Dele Airport	8.42721	20.6352
CF	Haute-Kotto	KWD	Kavadja Airport	-1.95	124.967
CF	Ouham-Pende	BOZ	Bozoum Airport	6.34417	16.3219
CF	Haute-Kotto	BIV	Bria Airport	6.52778	21.9894
CF	Ouham	BSN	Bossangoa Airport	6.492	17.429
CF	Vakaga	IRO	Birao Airport	10.2364	22.7169
CF	Bamingui-Bangoran	KOL	Koumala Airport	8.4965	21.2565
CF	Mbomou	BGU	Bangassou Airport	4.785	22.781
CF	Vakaga	ODJ	Ouanda Djalle Airport	8.9	22.783
CF	Ouaka	BBY	Bambari Airport	5.84694	20.6475
CF	Bamingui-Bangoran	GDA	Gounda Airport	9.3167	21.185
CG	Cuvette	MKJ	Makoua Airport	-0.017	15.583
CG	Sangha	SOE	Souanke Airport	2.067	14.133
CG	Plateaux	DJM	Djambala Airport	-2.533	14.75
CG	Plateaux	LCO	Lague Airport	-2.45	14.533
CG	Niari	DIS	Dolisie Airport	-4.20635	12.6599
CG	Plateaux	LKC	Lekana Airport	-2.313	14.606
CG	Brazzaville	BZV	Maya-Maya Airport	-4.2517	15.253
CG	Bouenza	MUY	Mouyondzi Airport	-4.01487	13.9661
CG	Cuvette-Ouest	EWO	Ewo Airport	-0.883	14.8
CG	Pointe-Noire	PNR	Pointe Noire Airport	-4.81603	11.8866
CG	Niari	MSX	Mossendjo Airport	-2.95	12.7
CG	Brazzaville	ANJ	Zanaga Airport	-2.85	13.817
CG	Lekoumou	SIB	Sibiti Airport	-3.683	13.35
CG	Plateaux	GMM	Gamboma Airport	-1.8294	15.8852
CG	Likouala	ION	Impfondo Airport	1.617	18.067
CG	Sangha	EPN	Epena Airport	1.36667	17.4833
CG	Bouenza	NKY	Yokangassi Airport	-4.22308	13.2863
CG	Sangha	OUE	Ouesso Airport	1.61599	16.0379
CG	Niari	KMK	Makabana Airport	-3.483	12.617
CG	Pool	KNJ	Kindamba Airport	-3.95	14.517
CG	Cuvette	BOE	Boundji Airport	-1.033	15.383
CG	Cuvette	OLL	Oyo Ollombo Airport	-1.22667	15.91
CG	Cuvette	OKG	Okoyo Airport	-1.44833	15.0733
CG	Likouala	BTB	Betou Airport	3.05	18.5
CG	Cuvette	FTX	Owando Airport	-0.53135	15.9501
CG	Cuvette-Ouest	KEE	Kelle Airport	-0.083	14.533
CG	Brazzaville	BZV	MayaÃ¢â‚¬â€œMaya Airport	-4.25167	15.2531
CH	Luzern	EML	Emmen Air Base	47.0924	8.30518
CH	Graubunden	SMV	Samedan Airport (Engadin Airport)	46.5341	9.88411
CH	Ticino	LUG	Lugano Airport	46.0043	8.91058
CH	Sankt Gallen	ACH	St. Gallen-Altenrhein Airport	47.485	9.56077
CH	Valais	SIR	Sion Airport	46.2196	7.32676
CH	Zurich	ZRH	Zurich Airport	47.4647	8.54917
CH	Geneve	GVA	Geneva Airport	46.2381	6.10895
CH	Bern	BRN	Bern Airport	46.9141	7.49715
CH	Nidwalden	BXO	Buochs Airport	46.9744	8.39694
CI	Abidjan	OFI	Ouango Fitini Airport	9.6	-4.05
CI	Abidjan	ABJ	Port Bouet Airport (Felix Houphouet Boigny Int'l)	5.26139	-3.92629
CI	Savanes	BXI	Boundiali Airport	9.533	-6.467
CI	Sassandra-Marahoue	DJO	Daloa Airport	6.79281	-6.47319
CI	Goh-Djiboua	DIV	Divo Airport	6.90461	-5.36236
CI	Bas-Sassandra	ZSS	Sassandra Airport	4.92833	-6.13278
CI	Savanes	FEK	Ferkessedougou Airport	9.6	-5.18333
CI	Bas-Sassandra	TXU	Tabou Airport	4.43781	-7.36273
CI	Montagnes	MJC	Man Airport	7.27207	-7.58736
CI	Vallee du Bandama	KTC	Katiola Airport	8.1329	-5.0657
CI	Lacs	DIM	Dimbokro Airport	6.65167	-4.64056
CI	Bas-Sassandra	SPY	San Pedro Airport	4.74672	-6.66082
CI	Vallee du Bandama	BYK	Bouake Airport	7.7388	-5.07367
CI	Woroba	SEO	Seguela Airport	7.96833	-6.71083
CI	Comoe	OGO	Abengourou Airport	6.71556	-3.47028
CI	Goh-Djiboua	GGN	Gagnoa Airport	6.133	-5.95
CI	Denguele	KEO	Odienne Airport	9.5	-7.567
CI	Comoe	ABO	Aboisso Airport	5.46194	-3.23472
CI	Zanzan	BDK	Soko Airport	8.01722	-2.76194
CI	Zanzan	BQO	Tehini Airport	9.2775	-3.02528
CI	Bas-Sassandra	BBV	Nero-Mer Airport	4.64341	-6.92396
CI	Abidjan	ASK	Yamoussoukro Airport	6.90317	-5.36558
CI	Montagnes	GGO	Guiglo Airport	6.53471	-7.52685
CI	Woroba	TOZ	Mahana Airport	8.2934	-7.674
CI	Savanes	HGO	Korhogo Airport	9.38718	-5.55666
CI	Yamoussoukro	ASK	Yamoussoukro International Airport	6.90317	-5.36558
CK	Cook Islands	PZK	Pukapuka Island Airfield	-10.9145	-165.839
CK	Cook Islands	AIU	Enua Airport	-19.9678	-158.119
CK	Cook Islands	AIT	Aitutaki Airport	-18.8309	-159.764
CK	Cook Islands	MUK	Mauke Airport	-20.1361	-157.345
CK	Cook Islands	MHX	Manihiki Island Airport	-10.3767	-161.002
CK	Cook Islands	PYE	Tongareva Airport	-9.01437	-158.032
CK	Cook Islands	MGS	Mangaia Airport	-21.896	-157.907
CK	Cook Islands	MOI	Mitiaro Airport (Nukuroa Airport)	-19.8425	-157.703
CK	Cook Islands	RAR	Rarotonga International Airport	-21.2027	-159.806
CL	Magallanes	WPU	Guardiamarina Zanartu Airport	-54.9311	-67.6263
CL	Antofagasta	CJC	El Loa Airport	-22.4982	-68.9036
CL	Los Lagos	WCA	Gamboa Airport	-42.4903	-73.7728
CL	Los Lagos	WCH	Chaiten Airfield	-42.9328	-72.6991
CL	Los Lagos	PUX	El Mirador Airport	-41.3494	-72.9467
CL	La Araucania	PZS	Maquehue Airport	-38.7668	-72.6371
CL	Valparaiso	VAP	Rodelillo Airfield	-33.0681	-71.5575
CL	La Araucania	ZPC	Pucon Airport	-39.2928	-71.9159
CL	Aisen del General Carlos Ibanez del Campo	BBA	Balmaceda Airport	-45.9161	-71.6895
CL	Atacama	CPO	Desierto de Atacama Airport	-27.2612	-70.7792
CL	Los Lagos	ZOS	Canal Bajo Carlos Hott Siebert Airport	-40.6112	-73.061
CL	Aisen del General Carlos Ibanez del Campo	GXQ	Teniente Vidal Airfield	-45.5942	-72.1061
CL	Coquimbo	COW	Coquimbo Airport	-30.1989	-71.2469
CL	Atacama	VLR	Vallenar Airport	-28.5964	-70.756
CL	La Araucania	ZIC	Victoria Airport	-38.2456	-72.3486
CL	Valparaiso	LOB	San Rafael Airport	-32.8142	-70.6467
CL	Coquimbo	LSC	La Florida Airport	-29.9162	-71.1995
CL	Los Lagos	MHC	Mocopulli Airport	-42.3404	-73.7157
CL	Antofagasta	TTC	Las Breas Airport	-25.5643	-70.3759
CL	Biobio	LSQ	Maria Dolores Airport	-37.4017	-72.4254
CL	Aisen del General Carlos Ibanez del Campo	LGR	Cochrane Airfield	-47.2438	-72.5884
CL	Biobio	YAI	General Bernardo O'Higgins Airport	-36.5825	-72.0314
CL	Los Lagos	FRT	Frutillar Airport	-41.117	-73.05
CL	Los Lagos	FFU	Futaleufu Airfield	-43.1892	-71.8511
CL	Valparaiso	KNA	Vina del Mar Airport	-32.9496	-71.4786
CL	Aisen del General Carlos Ibanez del Campo	CCH	Chile Chico Airfield	-46.5833	-71.6874
CL	Magallanes	PNT	Teniente Julio Gallardo Airport	-51.6715	-72.5284
CL	Atacama	CNR	Chanaral Airport	-26.3325	-70.6073
CL	Los Lagos	WAP	Alto Palena Airfield	-43.6119	-71.8061
CL	La Araucania	ZCO	La Araucania Airport	-38.9259	-72.6515
CL	Los Rios	ZAL	Pichoy Airport	-39.65	-73.0861
CL	Tarapaca	IQQ	Diego Aracena International Airport	-20.5352	-70.1813
CL	Maule	TLX	Panguilemo Airport	-35.3778	-71.6017
CL	Region Metropolitana de Santiago	SCL	Comodoro Arturo Merino Benitez International Airport	-33.393	-70.7858
CL	Los Lagos	ZUD	Pupelde Airfield	-41.9043	-73.7966
CL	Antofagasta	ANF	Cerro Moreno International Airport	-23.4445	-70.4451
CL	Magallanes	SMB	Franco Bianco Airport	-52.7367	-69.3336
CL	Los Lagos	PMC	El Tepual Airport	-41.4389	-73.094
CL	Antofagasta	TOQ	Barriles Airport	-22.1411	-70.0629
CL	Arica y Parinacota	ARI	Chacalluta International Airport	-18.3485	-70.3387
CL	Valparaiso	IPC	Mataveri International Airport (Isla de Pascua Airport)	-27.1648	-109.422
CL	Aisen del General Carlos Ibanez del Campo	WPA	Cabo Juan Roman Airfield	-45.3992	-72.6703
CL	Coquimbo	OVL	El Tuqui Airport	-30.5592	-71.1756
CL	Atacama	ESR	Ricardo Garcia Posada Airport	-26.3111	-69.7652
CL	Magallanes	PUQ	Presidente Carlos Ibanez del Campo International Airport	-53.0026	-70.8546
CL	Biobio	CCP	Carriel Sur International Airport	-36.7727	-73.0631
CL	Magallanes	WPR	Capitan Fuentes Martinez Airport	-53.2537	-70.3192
CL	Tarapaca	CPP	Coposa Airport	-20.75	-68.6833
CL	Region Metropolitana de Santiago	SCL	Arturo Merino BenÃƒÂ­tez International Airport	-33.3928	-70.7856
CM	Ouest	DSC	Dschang Airport	5.45	10.067
CM	Sud	KBI	Kribi Airport	2.87389	9.97778
CM	Sud-Ouest	TKC	Tiko Airport	4.08919	9.36053
CM	Littoral	DLA	Douala International Airport	4.00608	9.71948
CM	Nord-Ouest	BLC	Bali Airport	5.89528	10.0339
CM	Ouest	FOM	Foumban Nkounja Airport	5.63692	10.7508
CM	Littoral	NKS	Nkongsamba Airport	4.95	9.933
CM	Centre	YAO	Yaounde Airport	3.83604	11.5235
CM	Extreme-Nord	KLE	Kaele Airport	10.0925	14.4456
CM	Sud-Ouest	MMF	Mamfe Airport	5.70417	9.30639
CM	Est	BTA	Bertoua Airport	4.54861	13.7261
CM	Ouest	BFX	Bafoussam Airport	5.53692	10.3546
CM	Extreme-Nord	MVR	Salak Airport	10.4514	14.2574
CM	Sud	EBW	Ebolowa Airport	2.876	11.185
CM	Adamaoua	NGE	Ngaoundere Airport	7.35701	13.5592
CM	Extreme-Nord	GXX	Yagoua Airport	10.3561	15.2372
CM	Nord-Ouest	BPC	Bamenda Airport	6.03924	10.1226
CM	Nord	GOU	Garoua International Airport	9.33589	13.3701
CM	Est	OUR	Batouri Airport	4.475	14.3625
CM	Centre	NSI	Yaounde Nsimalen International Airport	3.72256	11.5533
CN	Sichuan	TFU	Chengdu Tianfu International Airport	30.319	104.445
CN	Henan	AYN	Anyang Airport	36.1339	114.344
CN	Xinjiang	KJI	Kanas Airport	48.2223	86.9959
CN	Guizhou	WMT	Zunyi Maotai Airport	27.8164	106.333
CN	Yunnan	KMG	Kunming Changshui International Airport	25.1019	102.929
CN	Jilin	YSQ	Songyuan Chaganhu Airport	44.9381	124.55
CN	Nei Mongol	UCB	Ulanqab Airport	41.1297	113.108
CN	Jiangxi	KOW	Ganzhou Huangjin Airport	25.8533	114.779
CN	Xinjiang	TLQ	Turpan Jiaohe Airport	43.0308	89.0987
CN	Xinjiang	KRL	Korla Airport	41.6978	86.1289
CN	Guangdong	MXZ	Meixian Airport	24.35	116.133
CN	Xinjiang	KRY	Karamay Airport	45.4665	84.9527
CN	Xinjiang	AAT	Altay Airport	47.7499	88.0858
CN	Heilongjiang	OHE	Mohe Gulian Airport	52.9128	122.43
CN	Nei Mongol	ERL	Erenhot Saiwusu International Airport	43.4225	112.097
CN	Guizhou	KWE	Guiyang Longdongbao International Airport	26.5385	106.801
CN	Guangxi	KWL	Guilin Liangjiang International Airport	25.2181	110.039
CN	Nei Mongol	NZL	Zhalantun Chengjisihan Airport	47.8658	122.768
CN	Nei Mongol	NZH	Manzhouli Xijiao Airport	49.5667	117.33
CN	Jiangsu	NTG	Nantong Xingdong Airport	32.0708	120.976
CN	Anhui	FUG	Fuyang Xiguan Airport	32.8822	115.734
CN	Guangdong	FUO	Foshan Shadi Airport	23.0833	113.07
CN	Fujian	LCX	Longyan Guanzhishan Airport	25.6747	116.747
CN	Heilongjiang	LDS	Yichun Lindu Airport	47.7521	129.019
CN	Henan	NNY	Nanyang Jiangying Airport	32.9808	112.615
CN	Guangxi	NNG	Nanning Wuxu International Airport	22.6083	108.172
CN	Heilongjiang	FYJ	Fuyuan Dongji Airport	48.1995	134.366
CN	Xinjiang	NLT	Xinyuan Nalati Airport	43.4318	83.3786
CN	Xinjiang	FYN	Fuyun Koktokay Airport	46.8042	89.512
CN	Hainan	BAR	Qionghai Bo'ao Airport	19.1382	110.455
CN	Gansu	THQ	Tianshui Maijishan Airport	34.5594	105.86
CN	Nei Mongol	BAV	Baotou Airport	40.56	109.997
CN	Shaanxi	LFQ	Linfen Qiaoli Airport	36.1326	111.641
CN	Yunnan	NLH	Ninglang Luguhu Airport	27.5403	100.759
CN	Jiangsu	NKG	Nanjing Lukou International Airport	31.742	118.862
CN	Hubei	LHK	Laohekou Airport	32.3894	111.695
CN	Gansu	LHW	Lanzhou Zhongchuan International Airport	36.5152	103.62
CN	Chongqing	LIA	Liangping Airport	30.6794	107.786
CN	Xizang	NGQ	Ngari Gunsa Airport	32.1	80.0531
CN	Guizhou	ACX	Xingyi Wanfenglin Airport	25.0864	104.959
CN	Zhejiang	NGB	Ningbo Lishe International Airport	29.8267	121.462
CN	Yunnan	JMJ	Lancang Jingmai Airport	22.4158	99.7864
CN	Yunnan	LJG	Lijiang Sanyi Airport	26.68	100.246
CN	Heilongjiang	NDG	Qiqihar Sanjiazi Airport	47.2396	123.918
CN	Guizhou	LLB	Libo Airport (Qiannan Airport)	25.4525	107.962
CN	Hunan	LLF	Yongzhou Lingling Airport	26.3387	111.61
CN	Nei Mongol	TGO	Tongliao Airport	43.5567	122.2
CN	Shaanxi	LLV	Luliang Airport	37.6833	111.143
CN	Jilin	NBS	Changbaishan Airport	42.0669	127.602
CN	Sichuan	NAO	Nanchong Gaoping Airport	30.7955	106.163
CN	Yunnan	LNJ	Lincang Airport	23.7381	100.025
CN	Gansu	LNL	Longnan Chengzhou Airport	33.788	105.797
CN	Guizhou	LPF	Liupanshui Yuezhao Airport	26.6094	104.979
CN	Yunnan	CWJ	Cangyuan Washan Airport	23.2739	99.3736
CN	Sichuan	BZX	Bazhong Enyang Airport	31.7384	106.645
CN	Nei Mongol	AEQ	Ar Horqin Airport	43.8704	120.16
CN	Guangxi	AEB	Baise Bama Airport	23.7206	106.96
CN	Guizhou	BFJ	Bijie Feixiong Airport	27.2671	105.472
CN	Guizhou	ZYI	Zunyi Xinzhou Airport	27.5895	107.001
CN	Guangdong	ZUH	Zhuhai Jinwan Airport (Zhuhai Sanzao Airport)	22.0064	113.376
CN	Anhui	BFU	Bengbu Airport	32.8477	117.32
CN	Hebei	ZQZ	Zhangjiakou Ningyuan Airport	40.7386	114.93
CN	Guangxi	BHY	Beihai Fucheng Airport	21.5394	109.294
CN	Ningxia	ZHY	Zhongwei Shapotou Airport (Zhongwei Xiangshan Airport)	37.5731	105.154
CN	Guangdong	ZHA	Zhanjiang Airport	21.2144	110.358
CN	Yunnan	ZAT	Zhaotong Airport	27.3256	103.755
CN	Gansu	YZY	Zhangye Ganzhou Airport	38.8019	100.675
CN	Hebei	BPE	Qinhuangdao Beidaihe Airport	39.6664	119.059
CN	Xinjiang	BPL	Bole Alashankou Airport	44.895	82.3
CN	Xizang	BPX	Qamdo Bamda Airport	30.5536	97.1083
CN	Yunnan	BSD	Baoshan Yunduan Airport	25.0533	99.1683
CN	Qinghai	YUS	Yushu Batang Airport	32.8364	97.0364
CN	Yunnan	YUA	Yuanmou Air Base	25.7375	101.882
CN	Jiangsu	YTY	Yangzhou Taizhou Airport	32.5602	119.717
CN	Guangdong	CAN	Guangzhou Baiyun International Airport	23.3924	113.299
CN	Hebei	CDE	Chengde Puning Airport	41.1225	118.074
CN	Jiangsu	YNZ	Yancheng Nanyang International Airport	33.4258	120.203
CN	Hunan	CGD	Changde Taohuayuan Airport	28.9189	111.64
CN	Shandong	YNT	Yantai Penglai International Airport	37.6572	120.987
CN	Henan	CGO	Zhengzhou Xinzheng International Airport	34.5197	113.841
CN	Jilin	CGQ	Changchun Longjia International Airport	43.9962	125.685
CN	Jilin	YNJ	Yanji Chaoyangchuan Airport	42.8828	129.451
CN	Liaoning	CHG	Chaoyang Airport	41.5381	120.435
CN	Yunnan	LUM	Dehong Mangshi Airport	24.4011	98.5317
CN	Nei Mongol	CIF	Chifeng Yulong Airport	42.235	118.908
CN	Shaanxi	CIH	Changzhi Wangcun Airport	36.2475	113.126
CN	Heilongjiang	YLN	Yilan Airport	46.317	129.567
CN	Chongqing	CKG	Chongqing Jiangbei International Airport	29.7192	106.642
CN	Liaoning	YKH	Yingkou Lanqi Airport	40.5425	122.359
CN	Zhejiang	YIW	Yiwu Airport	29.3447	120.032
CN	Xinjiang	YIN	Yining Airport	43.9558	81.3303
CN	Hubei	YIH	Yichang Sanxia Airport	30.5565	111.48
CN	Sichuan	AHJ	Hongyuan Airport	32.5315	102.352
CN	Nei Mongol	YIE	Arxan Yi'ershi Airport	47.3106	119.912
CN	Jiangxi	YIC	Yichun Mingyueshan Airport	27.8025	114.306
CN	Liaoning	CNI	Changhai Airport	39.2667	122.667
CN	Hunan	CSX	Changsha Huanghua International Airport	28.1892	113.22
CN	Sichuan	CTU	Chengdu Shuangliu International Airport	30.5785	103.947
CN	Shanxi	YCU	Yuncheng Guangong Airport	35.1164	111.031
CN	Sichuan	YBP	Yibin Caiba Airport	28.8006	104.545
CN	Jiangsu	CZX	Changzhou Benniu Airport	31.9197	119.779
CN	Shaanxi	DAT	Datong Yungang Airport	40.0603	113.482
CN	Sichuan	DAX	Dazhou Heshi Airport	31.1302	107.429
CN	Jilin	DBC	Baicheng Chang'an Airport	45.5053	123.02
CN	Jiangsu	XUZ	Xuzhou Guanyin Airport	34.0591	117.555
CN	Sichuan	DCY	Daocheng Yading Airport	29.3231	100.053
CN	Liaoning	DDG	Dandong Langtou Airport	40.0247	124.286
CN	Hebei	XNT	Xingtai Dalian Airport	36.8831	114.429
CN	Qinghai	XNN	Xining Caojiabao Airport	36.5275	102.043
CN	Fujian	XMN	Xiamen Gaoqi International Airport	24.544	118.128
CN	Shaanxi	XIY	Xi'an Xianyang International Airport	34.4471	108.752
CN	Shaanxi	AKA	Ankang Wulipu Airport	32.7081	108.931
CN	Yunnan	DIG	Diqing Shangri-La Airport	27.7936	99.6772
CN	Guangdong	XIN	Xingning Air Base	24.1492	115.758
CN	Nei Mongol	XIL	Xilinhot Airport	43.9156	115.964
CN	Xizang	LXA	Lhasa Gonggar Airport	29.2978	90.9119
CN	Sichuan	XIC	Xichang Qingshan Airport	27.9891	102.184
CN	Hubei	XFN	Xiangyang Liuji Airport	32.1506	112.291
CN	Liaoning	DLC	Dalian Zhoushuizi International Airport	38.9657	121.539
CN	Liaoning	XEN	Xingcheng Airport	40.5803	120.698
CN	Yunnan	DLU	Dali Airport	25.6494	100.319
CN	Henan	LYA	Luoyang Beijiao Airport	34.7411	112.388
CN	Gansu	DNH	Dunhuang Airport	40.1611	94.8092
CN	Nei Mongol	WZQ	Urad Middle Banner Airport	41.4596	108.535
CN	Chongqing	WXN	Wanzhou Wuqiao Airport	30.8017	108.433
CN	Xinjiang	AKU	Aksu Airport	41.2625	80.2917
CN	Guangxi	WUZ	Wuzhou Xijiang Airport	23.4567	111.248
CN	Jiangsu	LYG	Lianyungang Baitabu Airport	34.5717	118.874
CN	Shandong	LYI	Linyi Shubuling Airport	35.0461	118.412
CN	Jiangsu	WUX	Sunan Shuofang International Airport	31.4944	120.429
CN	Shaanxi	WUT	Xinzhou Wutaishan Airport	38.5975	112.969
CN	Fujian	WUS	Wuyishan Airport	27.7019	118.001
CN	Hubei	WUH	Wuhan Tianhe International Airport	30.7838	114.208
CN	Nei Mongol	WUA	Wuhai Airport	39.7934	106.799
CN	Shandong	DOY	Dongying Shengli Airport	37.5086	118.788
CN	Heilongjiang	DQA	Daqing Sartu Airport	46.7464	125.141
CN	Zhejiang	WNZ	Wenzhou Longwan International Airport	27.9122	120.852
CN	Nei Mongol	DSN	Ordos Ejin Horo Airport	39.49	109.861
CN	Yunnan	WNH	Wenshan Puzhehei Airport	23.5583	104.326
CN	Heilongjiang	DTU	Wudalianchi Airport	48.445	126.133
CN	Guangxi	LZH	Liuzhou Bailian Airport	24.2075	109.391
CN	Sichuan	LZO	Luzhou Yunlong Airport	29.03	105.47
CN	Anhui	WHA	Wuhu Airport	31.3906	118.409
CN	Hunan	WGN	Shaoyang Wugang Airport	26.802	110.642
CN	Xizang	LZY	Nyingchi Mainling Airport	29.3033	94.3353
CN	Shandong	WEH	Weihai Dashuibo Airport	37.1871	122.229
CN	Shandong	WEF	Weifang Airport	36.6467	119.119
CN	Hunan	DYG	Zhangjiajie Hehua Airport	29.1028	110.443
CN	Hubei	WDS	Shiyan Wudangshan Airport	32.5917	110.908
CN	Chongqing	DZU	Dazu Air Base	29.6362	105.774
CN	Guizhou	TEN	Tongren Fenghuang Airport	27.8833	109.309
CN	Yunnan	TCZ	Tengchong Tuofeng Airport	24.9381	98.4858
CN	Xinjiang	TCG	Tacheng Airport	46.6725	83.3408
CN	Hubei	ENH	Enshi Xujiaping Airport	30.3203	109.485
CN	Sichuan	GHN	Guanghan Airport	30.9485	104.33
CN	Shandong	TAO	Qingdao Liuting International Airport	36.2661	120.374
CN	Shaanxi	TYN	Taiyuan Wusu International Airport	37.7469	112.628
CN	Guangdong	SZX	Shenzhen Bao'an International Airport	22.6393	113.811
CN	Jiangsu	SZV	Suzhou Guangfu Airport	31.2631	120.401
CN	Hainan	SYX	Sanya Phoenix International Airport	18.3029	109.412
CN	Yunnan	SYM	Pu'er Simao Airport	22.7933	100.959
CN	Qinghai	GMQ	Golog Maqin Airport	34.4181	100.301
CN	Xinjiang	SXJ	Shanshan Airport	42.9117	90.2475
CN	Liaoning	AOG	Anshan Teng'ao Airport	41.1053	122.854
CN	Anhui	TXN	Huangshan Tunxi International Airport	29.7333	118.256
CN	Guangdong	SWA	Jieyang Chaoshan International Airport	23.552	116.503
CN	Qinghai	GOQ	Golmud Airport	36.4006	94.7861
CN	Hebei	TVS	Tangshan Sannuhe Airport	39.7178	118.003
CN	Fujian	SQJ	Sanming Shaxian Airport	26.4263	117.834
CN	Jiangxi	SQD	Shangrao Sanqingshan Airport	28.3797	117.964
CN	Shaanxi	UYN	Yulin Yuyang Airport	38.3597	109.591
CN	Gansu	GXH	Gannan Xiahe Airport	34.8105	102.645
CN	Xinjiang	URC	Urumqi Diwopu International Airport	43.9071	87.4742
CN	Sichuan	GYS	Guangyuan Panlong Airport	32.3911	105.702
CN	Ningxia	GYU	Guyuan Liupanshan Airport	36.0789	106.217
CN	Hainan	HAK	Haikou Meilan International Airport	19.9349	110.459
CN	Guangxi	HCJ	Hechi Jinchengjiang Airport	24.805	107.7
CN	Hebei	HDG	Handan Airport	36.5258	114.426
CN	Heilongjiang	HEK	Heihe Airport	50.1716	127.309
CN	Nei Mongol	HET	Hohhot Baita International Airport	40.8514	111.824
CN	Anhui	AQG	Anqing Tianzhushan Airport	30.5822	117.05
CN	Anhui	HFE	Hefei Xinqiao International Airport	31.78	117.298
CN	Zhejiang	HGH	Hangzhou Xiaoshan International Airport	30.2295	120.434
CN	Hebei	SJW	Shijiazhuang Zhengding International Airport	38.2807	114.697
CN	Jiangsu	HIA	Huai'an Lianshui Airport	33.7908	119.125
CN	Hunan	HJJ	Huaihua Zhijiang Airport	27.4411	109.7
CN	Shaanxi	SIA	Xi'an Xiguan Airport	34.3767	109.12
CN	Hubei	SHS	Shashi Airport	30.3243	112.28
CN	Nei Mongol	HLD	Hulunbuir Hailar Airport	49.205	119.825
CN	Nei Mongol	HLH	Ulanhot Airport	46.1953	122.008
CN	Xinjiang	SHF	Shihezi Huayuan Airport	44.2421	85.8905
CN	Liaoning	SHE	Shenyang Taoxian International Airport	41.6398	123.483
CN	Tianjin	TSN	Tianjin Binhai International Airport	39.1244	117.346
CN	Shanghai	SHA	Shanghai Hongqiao International Airport	31.1979	121.336
CN	Xinjiang	HMI	Hami Airport (Kumul Airport)	42.8414	93.6692
CN	Hunan	HNY	Hengyang Nanyue Airport	26.9053	112.628
CN	Hubei	HPG	Shennongjia Hongping Airport	31.626	110.34
CN	Heilongjiang	HRB	Harbin Taiping International Airport	45.6234	126.25
CN	Guangdong	HSC	Shaoguan Guitou Airport	24.9786	113.421
CN	Henan	HSJ	Zhengzhou Shangjie Airport	34.8422	113.274
CN	Zhejiang	HSN	Zhoushan Putuoshan Airport	29.9342	122.362
CN	Xinjiang	HTN	Hotan Airport	37.0385	79.8649
CN	Qinghai	HTT	Huatugou Airport	38.202	90.8415
CN	Jiangsu	RUG	Rugao Air Base	32.2579	120.502
CN	Nei Mongol	HUO	Holingol Huolinhe Airport	45.4872	119.407
CN	Guangdong	HUZ	Huizhou Pingtan Airport	23.05	114.6
CN	Xinjiang	RQA	Ruoqiang Loulan Airport	38.9747	88.0083
CN	Qinghai	HXD	Delingha Airport	37.1253	97.2687
CN	Shaanxi	ENY	Yan'an Ershilipu Airport	36.6369	109.554
CN	Zhejiang	HYN	Taizhou Luqiao Airport	28.5622	121.429
CN	Shaanxi	HZG	Hanzhong Chenggu Airport	33.1341	107.206
CN	Guizhou	HZH	Liping Airport	26.3222	109.15
CN	Heilongjiang	MDG	Mudanjiang Hailang Airport	44.5241	129.569
CN	Nei Mongol	RLK	Bayannur Tianjitai Airport	40.926	107.743
CN	Xizang	RKZ	Shigatse Peace Airport	29.3519	89.3114
CN	Shandong	RIZ	Rizhao Shanzihe Airport	35.405	119.324
CN	Nei Mongol	RHT	Alxa Right Banner Badanjilin Airport	39.225	101.546
CN	Nei Mongol	EJN	Ejin Banner Taolai Airport	42.0155	101.001
CN	Ningxia	INC	Yinchuan Hedong International Airport	38.3228	106.393
CN	Xinjiang	IQM	Qiemo Airport	38.2336	85.4656
CN	Gansu	IQN	Qingyang Airport	35.7997	107.603
CN	Xinjiang	QSZ	Shache Airport	38.2811	77.0752
CN	Sichuan	PZI	Panzhihua Bao'anying Airport	26.54	101.799
CN	Shanghai	PVG	Shanghai Pudong International Airport	31.1434	121.805
CN	Jiangxi	JDZ	Jingdezhen Luojia Airport	29.3386	117.176
CN	Heilongjiang	JGD	Jiagedaqi Airport	50.3714	124.118
CN	Gansu	JGN	Jiayuguan Airport	39.8569	98.3414
CN	Jiangxi	JGS	Jinggangshan Airport	26.8569	114.737
CN	Guizhou	AVA	Anshun Huangguoshu Airport	26.2606	105.873
CN	Yunnan	JHG	Xishuangbanna Gasa Airport	21.9739	100.76
CN	Gansu	JIC	Jinchang Jinchuan Airport	38.5422	102.348
CN	Sichuan	MIG	Mianyang Nanjiao Airport	31.4281	104.741
CN	Jilin	JIL	Jilin Ertaizi Airport	44.0022	126.396
CN	Chongqing	JIQ	Qianjiang Wulingshan Airport	29.5133	108.831
CN	Jiangxi	JIU	Jiujiang Lushan Airport	29.4769	115.801
CN	Fujian	JJN	Quanzhou Jinjiang International Airport	24.7964	118.59
CN	Heilongjiang	JMU	Jiamusi Dongjiao Airport	46.8434	130.465
CN	Shandong	JNG	Jining Qufu Airport	35.2928	116.347
CN	Liaoning	JNZ	Jinzhou Bay Airport	41.1014	121.062
CN	Heilongjiang	JSJ	Jiansanjiang Airport	47.11	132.66
CN	Anhui	JUH	Chizhou Jiuhuashan Airport	30.7403	117.686
CN	Nei Mongol	AXF	Alxa Left Banner Bayanhot Airport	38.7483	105.589
CN	Zhejiang	JUZ	Quzhou Airport	28.9658	118.899
CN	Heilongjiang	JXA	Jixi Xingkaihu Airport	45.293	131.193
CN	Sichuan	JZH	Jiuzhai Huanglong Airport	32.8533	103.682
CN	Shandong	PNJ	Penglai Shahekou Airport	42.4464	119.574
CN	Jilin	TNH	Tonghua Sanyuanpu Airport	42.2539	125.703
CN	Xinjiang	KCA	Kuqa Qiuci Airport	41.6779	82.8729
CN	Shandong	TNA	Jinan Yaoqiang International Airport	36.8572	117.216
CN	Sichuan	KGT	Kangding Airport	30.1575	101.735
CN	Fujian	FOC	Fuzhou Changle International Airport	25.9351	119.663
CN	Xinjiang	KHG	Kashgar Airport (Kashi Airport)	39.5429	76.02
CN	Jiangxi	KHN	Nanchang Changbei International Airport	28.865	115.9
CN	Guizhou	KJH	Kaili Huangping Airport	26.972	107.988
CN	Chongqing Shi	CQW	Chongqing Xiannyushan Airport	29.4658	107.692
CN	Sichuan Sheng	DZH	Dazhou Jinya Airport	31.04	107.44
CN	Hubei Sheng	EHU	Ezhou Huahu Airport	30.3429	115.03
CN	Qinghai Sheng	HBQ	Haibei Qilian Airport	38.012	100.644
CN	Hunan Sheng	HCZ	Chenzhou Beihu Airport	25.7506	112.846
CN	Shandong Sheng	HZA	Heze Mudan Airport	35.2133	115.737
CN	Anhui Sheng	WHA	Wuhu Xuanzhou Airport	31.1044	118.667
CN	Chongqing Shi	WSK	Chongqing Wushan Airport	31.064	109.706
CN	Henan Sheng	XAI	Xinyang Minggang Airport	32.5414	114.078
CN	Hunan Sheng	YYA	Yueyang Sanhe Airport	29.314	113.278
CN	Beijing	PEK	Beijing Capital International Airport	40.0725	116.598
CO	Cesar	HAY	Hacaritama Airport	8.24722	-73.5819
CO	Narino	MQR	Mosquera Airport	2.64955	-78.3361
CO	Cesar	GRA	Gamarra Airport	8.34197	-73.7057
CO	Huila	SRO	Santana Ramos Airport	2.21667	-75.25
CO	Antioquia	IGO	Jaime Ortiz Betancur Airport	7.68038	-76.6865
CO	Huila	PCC	Puerto Rico Airport	1.91667	-75.1667
CO	Choco	BSC	Jose Celestino Mutis Airport	6.20292	-77.3947
CO	La Guajira	SJH	San Juan del Cesar Airport	10.7667	-73.0167
CO	Cesar	DZI	Codazzi Airport	10.0966	-73.2337
CO	Casanare	PRE	Pore Airport	5.73333	-71.9833
CO	Vaupes	MFB	Monfort Airport	0.633333	-69.75
CO	Boyaca	SJG	San Pedro de Jagua Airport	4.65	-73.3333
CO	Arauca	TME	Gabriel Vargas Santos Airport	6.45108	-71.7603
CO	Cundinamarca	MND	Medina Airport	4.51667	-73.2833
CO	Cordoba	AYA	Ayapel Airport	8.3	-75.15
CO	Boyaca	MOY	Monterrey Airport	4.90693	-72.8948
CO	Putumayo	LQM	Caucaya Airport	-0.182278	-74.7708
CO	Antioquia	UNC	Unguia Airport	8.03333	-77.0833
CO	Amazonas	AYC	Ayacucho Airport	8.6	-73.6167
CO	Antioquia	ULS	Mulatos Airport	8.65	-76.75
CO	Caqueta	AYG	Yaguara Airport	1.54417	-73.9333
CO	Antioquia	SJR	San Juan de Uraba Airport	8.76667	-76.5333
CO	Tolima	CPL	General Navas Pardo Airport	3.717	-75.467
CO	Vaupes	VAB	Yavarate Airport	1.11667	-70.75
CO	Cauca	TBD	Timbiqui Airport	2.767	-77.667
CO	Antioquia	SMC	Santa Maria Airport	8.15	-77.05
CO	Boyaca	SOX	Alberto Lleras Camargo Airport	5.67732	-72.9703
CO	Antioquia	NPU	San Pedro de Uraba Airport	8.28597	-76.3804
CO	Guaviare	MFS	Miraflores Airport	1.35	-71.9444
CO	Tolima	PLA	Planadas Airport	3.3	-75.7
CO	Magdalena	PLT	Plato Airport	9.8	-74.7833
CO	Cordoba	PLC	Planeta Rica Airport	8.4	-75.6
CO	Bolivar	MGN	Baracoa Regional Airport	9.28474	-74.8461
CO	Boyaca	TAU	Tauramena Airport	5.01281	-72.7424
CO	Cauca	GPI	Guapi Airport (Juan Casiano Airport)	2.57013	-77.8986
CO	Cordoba	SCA	Santa Catalina Airport	8.5	-76.175
CO	Risaralda	PEI	Matecana International Airport	4.81267	-75.7395
CO	Casanare	NUH	Nunchia Airport	5.65	-72.2
CO	Santander	BGA	Palonegro International Airport	7.1265	-73.1848
CO	Tolima	SQB	Santa Ana Airport	4.40833	-75.0217
CO	Sucre	CVE	Covenas Airport	9.40092	-75.6913
CO	Narino	PYN	Payan Airport	1.8	-78.1667
CO	Cordoba	LRI	Lorica Airport	9.03333	-75.7
CO	Guainia	NAD	Macanal Airport	2.56667	-67.5833
CO	Vaupes	ARF	Acaricuara Airport	0.533333	-70.1333
CO	Amazonas	SSD	San Felipe Airport	-32.7458	-70.705
CO	Cauca	LMX	Lopez de Micay Airport	3.05	-77.55
CO	Casanare	EYP	El Alcaravan Airport	5.31911	-72.384
CO	Choco	JUO	Jurado Airport	6.51667	-76.6
CO	Antioquia	ARO	Arboletes Airport	8.85705	-76.4244
CO	Choco	ACD	Alcides Fernandez Airport	8.51667	-77.3
CO	Vaupes	CUO	Caruru Airport	1.0136	-71.2961
CO	Valle del Cauca	ACL	Aguaclara Airport	4.75361	-73.0028
CO	Amazonas	ACM	Arica Airport (Colombia)	-2.14544	-71.7581
CO	Vaupes	MVP	Fabio Alberto Leon Bentley Airport	1.25366	-70.2339
CO	Huila	NVA	Benito Salas Airport	2.95015	-75.294
CO	Caqueta	ACR	Araracuara Airport	-0.5833	-72.4083
CO	Caqueta	CUI	Curillo Airport	4.66667	-72
CO	Meta	ELJ	El Recreo Airport	2	-74.1333
CO	Arauca	ARQ	El Troncal Airport	7.02106	-71.3889
CO	Meta	URI	Uribe Airport	3.21667	-74.4
CO	Casanare	TTM	Tablon de Tamara Airport	5.72448	-72.103
CO	Narino	ISD	Iscuande Airport	2.44583	-77.9818
CO	La Guajira	MCJ	Jorge Isaacs Airport (La Mina Airport)	11.2325	-72.4901
CO	Antioquia	TRB	Gonzalo Mejia Airport	8.07453	-76.7415
CO	Boyaca	PYA	Velasquez Airport	5.93904	-74.457
CO	Amazonas	ECO	El Encanto Airport	-1.75333	-73.2047
CO	Antioquia	CAQ	Juan H. White Airport	7.96847	-75.1985
CO	Antioquia	ADN	Andes Airport	5.69764	-75.8804
CO	Santander	AZT	Zapatoca Airport	6.81667	-73.2833
CO	Choco	BHF	Bahia Cupica Airport	6.55	-77.3263
CO	Meta	BAC	Barranca de Upia Airport	4.58333	-72.9667
CO	Narino	ECR	El Charco Airport	2.44944	-78.0942
CO	Narino	PSO	Antonio Narino Airport	1.39625	-77.2915
CO	San Andres, Providencia y Santa Catalina	ADZ	Gustavo Rojas Pinilla International Airport	12.5836	-81.7112
CO	Putumayo	VGZ	Villa Garzon Airport	0.978767	-76.6056
CO	Caqueta	TQS	Captain Ernesto Esguerra Cubides Air Base	0.7459	-75.234
CO	Guainia	PDA	Obando Airport	3.85353	-67.9062
CO	Caqueta	CQT	Caquetania Airport	2.03333	-74.2167
CO	Sucre	CZU	Las Brujas Airport	9.33274	-75.2856
CO	Casanare	PZA	Paz de Ariporo Airport	5.87615	-71.8866
CO	Distrito Capital de Bogota	BOG	El Dorado International Airport	4.70159	-74.1469
CO	Casanare	SQE	San Luis de Palenque Airport	5.40018	-71.7001
CO	Caqueta	SVI	Eduardo Falla Solano Airport	2.15217	-74.7663
CO	Tolima	GIR	Santiago Vila Airport	4.27624	-74.7967
CO	Atlantico	BAQ	Ernesto Cortissoz International Airport	10.8896	-74.7808
CO	Norte de Santander	OCV	Aguas Claras Airport	8.31506	-73.3583
CO	Antioquia	AFI	Amalfi Airport (Colombia)	6.91667	-75.0667
CO	Santander	EJA	Yariguies Airport	7.02433	-73.8068
CO	Valle del Cauca	BUN	Gerardo Tobar Lopez Airport	3.81963	-76.9898
CO	Cordoba	MTR	Los Garzones Airport	8.82374	-75.8258
CO	Valle del Cauca	CRC	Santa Ana Airport	4.75818	-75.9557
CO	Guainia	MHF	Morichal Airport	1.75	-69.9167
CO	Antioquia	MDE	Jose Maria Cordova International Airport	6.16454	-75.4231
CO	Choco	COG	Mandinga Airport	5.08333	-76.7
CO	Magdalena	SMR	Simon Bolivar International Airport	11.1196	-74.2306
CO	Arauca	RAV	Cravo Norte Airport	6.31684	-70.2107
CO	Bolivar	CTG	Rafael Nunez International Airport	10.4424	-75.513
CO	Cundinamarca	EUO	Paratebueno Airport	4.38333	-73.2
CO	Vaupes	MIX	Miriti-Parana Airport	-1.13333	-70.25
CO	Boyaca	RON	Juan Jose Rondon	6.283	-71.083
CO	Casanare	HTZ	Hato Corozal Airport	6.15	-71.75
CO	Arauca	RVE	Los Colonizadores Airport	6.95187	-71.8572
CO	Meta	CCO	Carimagua Airport	4.56417	-71.3364
CO	Choco	NQU	Reyes Murillo Airport	5.6964	-77.2806
CO	San Andres, Providencia y Santa Catalina	PVA	El Embrujo Airport	13.3569	-81.3583
CO	Cordoba	MTB	Montelibano Airport	7.97174	-75.4325
CO	Arauca	AUC	Santiago Perez  Quiroz Airport	7.06888	-70.7369
CO	Vichada	CSR	Casuarito Airport	5.83333	-68.1333
CO	Amazonas	LCR	La Chorrera Airport	-0.733333	-73.0167
CO	Cauca	PPN	Guillermo Leon Valencia Airport	2.4544	-76.6093
CO	Vichada	SSL	Santa Rosalia Airport	5.1309	-70.8682
CO	Amazonas	TCD	Tarapaca Airport	-2.89472	-69.7472
CO	La Guajira	RCH	Almirante Padilla Airport	11.5262	-72.926
CO	Meta	GMC	Guerima Airport	3.62918	-70.3233
CO	Cundinamarca	PAL	Captain German Olano Moreno Air Base	5.48361	-74.6574
CO	Norte de Santander	TIB	Tibu Airport	8.63152	-72.7304
CO	Tolima	IBE	Perales Airport	4.42161	-75.1333
CO	Amazonas	LET	Alfredo Vasquez Cobo International Airport	-4.19355	-69.9432
CO	Antioquia	PBE	Morela Airport (Puerto Berrio Airport	6.46034	-74.4105
CO	Caqueta	FLA	Gustavo Artunduaga Paredes Airport	1.58919	-75.5644
CO	Cundinamarca	HRR	La Herrera Airport	3.21667	-75.85
CO	Meta	GAA	Guamal Airport	9.04465	-73.0973
CO	Santander	SNT	Las Cruces Airport	7.38322	-73.5054
CO	Narino	IPI	San Luis Airport	0.861925	-77.6718
CO	Vichada	LGT	Las Gaviotas Airport	4.54972	-70.925
CO	Choco	CPB	Capurgana Airport	8.63333	-77.35
CO	Magdalena	IVO	Chibolo Airport	10.0167	-74.6833
CO	Antioquia	URR	Urrao Airport	6.32883	-76.1425
CO	Vichada	PCR	German Olano Airport	6.18472	-67.4932
CO	Huila	CJD	Candilejas Airport	2.06667	-74.5833
CO	Casanare	TDA	Trinidad Airport	5.43278	-71.6625
CO	Valle del Cauca	ULQ	Heriberto Gil Martinez	4.08836	-76.2351
CO	Tolima	MQU	Mariquita Airport	5.21256	-74.8836
CO	Norte de Santander	CUC	Camilo Daza International Airport	7.92757	-72.5115
CO	Quindio	AXM	El Eden International Airport	4.45278	-75.7664
CO	Vichada	LPE	La Primavera Airport	3.73333	-76.2167
CO	Choco	UIB	El Carano Airport	5.69076	-76.6412
CO	Antioquia	EBG	El Bagre Airport (El Tomin Airport)	7.59647	-74.8089
CO	Valle del Cauca	CLO	Alfonso Bonilla Aragon International Airport	3.54322	-76.3816
CO	Cesar	VUP	Alfonso Lopez Pumarejo Airport	10.435	-73.2495
CO	Meta	VVC	La Vanguardia Airport	4.16787	-73.6138
CO	Antioquia	NCI	Antioquia Airport	8.45	-76.7833
CO	Meta	LMC	La Macarena Airport	2.1736	-73.7862
CO	Guainia	NBB	Barranco Minas Airport	3.48333	-69.8
CO	Sucre	TLU	Golfo de Morrosquillo Airport	9.50945	-75.5854
CO	Casanare	ORC	Orocue Airport	4.79222	-71.3564
CO	Antioquia	NAR	Puerto Nare Airport	6.21002	-74.5906
CO	Guaviare	AYI	Yari Airport	-0.383333	-72.2667
CO	Caldas	MZL	La Nubia Airport (Santaguida Airport)	5.0296	-75.4647
CO	Amazonas	LPD	La Pedrera Airport	-1.32861	-69.5797
CO	Narino	TCO	La Florida Airport	1.81442	-78.7492
CO	Boyaca	GCA	Guacamayas Airport	2.28333	-74.95
CO	Putumayo	PUU	Tres de Mayo Airport	0.505228	-76.5008
CO	Sucre	SRS	San Marcos Airport	8.69	-75.156
CO	Santander	CIM	Cimitarra Airport	6.367	-73.967
CO	Antioquia	EOH	Olaya Herrera Airport	6.22055	-75.5906
CO	Guaviare	SJE	Jorge Enrique Gonzalez Torres Airport	2.57969	-72.6394
CO	Huila	PTX	Contador Airport	1.85777	-76.0857
CO	Bolivar	MMP	San Bernardo Airport	9.79911	-74.786
CO	Antioquia	OTU	Otu Airport	7.01037	-74.7155
CO	Meta	API	Captain Luis F. Gomez Nino Air Base	4.07607	-73.5627
CO	Choco	GGL	Gilgal Airport	8.33333	-77.0833
CO	Antioquia	APO	Antonio Roldan  Betancourt Airport	7.81196	-76.7164
CO	Magdalena	ELB	Las Flores Airport	9.04554	-73.9749
CR	Guanacaste	CSC	Canas Mojica Airport	10.4307	-85.1746
CR	Alajuela	RFR	Rio Frio Airport	10.3274	-83.8876
CR	Limon	TTQ	Tortuguero Airport (Barra de Tortuguero Airport)	10.42	-83.6095
CR	Alajuela	SJO	Juan Santamaria International Airport	9.99386	-84.2088
CR	Limon	LIO	Limon International Airport	9.95796	-83.022
CR	Guanacaste	LIR	Daniel Oduber Quiros International Airport	10.5933	-85.5444
CR	Puntarenas	XQP	Quepos La Managua Airport	9.44316	-84.1298
CR	Guanacaste	PBP	Punta Islita Airport	9.85611	-85.3708
CR	Alajuela	LSL	Los Chiles Airport	11.0353	-84.7061
CR	Puntarenas	JAP	Chacarita Airport	9.98141	-84.7727
CR	Puntarenas	GLF	Golfito Airport	8.65401	-83.1822
CR	Alajuela	UPL	Upala Airport	10.8922	-85.0162
CR	Limon	GPL	Guapiles Airport	10.2172	-83.797
CR	Guanacaste	PLD	Carrillo Airport (Playa Samara/Carrillo Airport)	9.87051	-85.4814
CR	Guanacaste	NCT	Nicoya Guanacaste Airport	10.1394	-85.4458
CR	Puntarenas	BAI	Buenos Aires Airport	9.16395	-83.3302
CR	Puntarenas	TMU	Tambor Airport	9.73852	-85.0138
CR	Puntarenas	PMZ	Palmar Sur Airport	8.95103	-83.4686
CR	Puntarenas	OTR	Coto 47 Airport	8.60156	-82.9686
CR	Puntarenas	PJM	Puerto Jimenez Airport	8.53333	-83.3
CR	Puntarenas	TOO	San Vito de Java Airport	8.82611	-82.9589
CR	Guanacaste	TNO	Tamarindo Airport	10.3135	-85.8155
CR	San Jose	SYQ	Tobias Bolanos International Airport	9.95705	-84.1398
CR	Guanacaste	NOB	Nosara Airport	9.97649	-85.653
CR	Limon	BCL	Barra del Colorado Airport	10.7687	-83.5856
CR	Puntarenas	DRK	Drake Bay Airport	8.71889	-83.6417
CR	Alajuela	FON	La Fortuna Airport	10.478	-84.6345
CR	San Jose	IPZ	San Isidro de El General Airport	9.34861	-83.7125
CU	Villa Clara	BWW	Las Brujas Airport	22.6213	-79.1472
CU	Isla de la Juventud	GER	Rafael Cabrera Mustelier Airport	21.8347	-82.7838
CU	Sancti Spiritus	USS	Sancti Spiritus Airport	21.9704	-79.4427
CU	Guantanamo	BCA	Gustavo Rizo Airport	20.3653	-74.5062
CU	Camaguey	CMW	Ignacio Agramonte International Airport	21.4203	-77.8475
CU	Guantanamo	NBW	Guantanamo Bay Naval Base	19.9065	-75.2071
CU	Isla de la Juventud	SZJ	Siguanea Airport	21.6425	-82.9551
CU	Matanzas	VRO	Kawama Airport	23.124	-81.3016
CU	Holguin	MOA	Orestes Acosta Airport	20.6539	-74.9222
CU	Guantanamo	UMA	Punta de Maisi Airport	20.2506	-74.1505
CU	Guantanamo	GAO	Mariana Grajales Airport	20.0853	-75.1583
CU	Matanzas	VRA	Juan Gualberto Gomez Airport	23.0344	-81.4353
CU	Ciego de Avila	AVI	Maximo Gomez  Airport	22.0271	-78.7896
CU	Granma	BYM	Carlos Manuel de Cespedes Airport	20.3964	-76.6214
CU	Villa Clara	SNU	Abel Santamaria Airport	22.4922	-79.9436
CU	Cienfuegos	CFG	Jaime Gonzalez Airport	22.15	-80.4142
CU	Pinar del Rio	LCL	La Coloma Airport	22.3361	-83.6419
CU	Artemisa	UPB	Playa Baracoa Airport	23.0328	-82.5794
CU	Pinar del Rio	SNJ	San Julian Air Base	22.0953	-84.152
CU	Ciego de Avila	CCC	Jardines del Rey Airport	22.461	-78.3284
CU	Sancti Spiritus	TND	Alberto Delgado Airport	21.7883	-79.9972
CU	Las Tunas	VTU	Hermanos Ameijeiras Airport	20.9876	-76.9358
CU	La Habana	HAV	Jose Marti International Airport	22.9892	-82.4091
CU	Santiago de Cuba	SCU	Antonio Maceo International Airport	19.9698	-75.8354
CU	Holguin	HOG	Frank Pais Airport	20.7856	-76.3151
CU	Isla de la Juventud	CYO	Vilo Acuna Airport	21.6165	-81.546
CU	Granma	MZO	Sierra Maestra Airport	20.2881	-77.0892
CV	Ribeira Grande	NTO	Agostinho Neto Airport	17.2028	-25.0906
CV	Sao Vicente	VXE	Cesaria Evora Airport	16.8332	-25.0553
CV	Ribeira Grande de Santiago	RAI	Nelson Mandela International Airport	14.9245	-23.4935
CV	Sao Filipe	MTI	Mosteiros Airport	15.045	-24.3392
CV	Boa Vista	BVC	Aristides Pereira International Airport (Rabil Airport)	16.1365	-22.8889
CV	Brava	BVR	Esperadinha Airport	14.8643	-24.746
CV	Sal	SID	Amilcar Cabral International Airport	16.7414	-22.9494
CV	Maio	MMO	Maio Airport	15.1559	-23.2137
CV	Sao Filipe	SFL	Sao Filipe Airport	14.885	-24.48
CV	Ribeira Grande	SNE	Preguica Airport	16.5884	-24.2847
CW	Curacao	CUR	Curacao International Airport (Hato Int'l Airport)	12.1889	-68.9598
CX	Christmas Island	XCH	Christmas Island Airport	-10.4506	105.69
CY	Pafos	PFO	Paphos International Airport	34.718	32.4857
CY	Larnaka	LCA	Larnaca International Airport	34.8751	33.6249
CY	Ammochostos	GEC	Gecitkale Air Base	35.2359	33.7244
CY	Lefkosia	ECN	Ercan International Airport	35.1547	33.4961
CY	Lemesos	AKT	RAF Akrotiri	34.5904	32.9879
CZ	Olomoucky kraj	PRV	Prerov Airport	49.4258	17.4047
CZ	Jihocesky kraj	JCL	Ceske Budejovice Airport (Plana Airport)	48.9464	14.4275
CZ	Pardubicky kraj	PED	Pardubice Airport	50.0134	15.7386
CZ	Zlinsky kraj	UHE	Kunovice Airport	49.0294	17.4397
CZ	Zlinsky kraj	GTW	Holesov Airport	49.3144	17.5689
CZ	Moravskoslezsky kraj	ZBE	Zabreh Airport	49.9283	18.0783
CZ	Moravskoslezsky kraj	OSR	Leos Janacek Airport	49.6963	18.1111
CZ	Stredocesky kraj	PRG	Vaclav Havel Airport Prague	50.1008	14.26
CZ	Jihomoravsky kraj	BRQ	Brno-Turany Airport	49.1513	16.6944
CZ	Olomoucky kraj	OLO	Olomouc Airport (Neredin Airport)	49.5878	17.2108
CZ	Stredocesky kraj	VOD	Vodochody Airport	50.2166	14.3958
CZ	Karlovarsky kraj	KLV	Karlovy Vary Airport	50.203	12.915
CZ	Karlovarsky kraj	MKA	Marianske Lazne Airport	49.9228	12.7247
DE	Mecklenburg-Vorpommern	HDF	Heringsdorf Airport	53.8787	14.1523
DE	Nordrhein-Westfalen	AAH	Merzbruck Airport	50.8231	6.18639
DE	Nordrhein-Westfalen	NRN	Weeze Airport (Niederrhein Airport)	51.6024	6.14217
DE	Hessen	WIE	Wiesbaden Army Airfield	50.0498	8.3254
DE	Nordrhein-Westfalen	DTM	Dortmund Airport	51.5183	7.61224
DE	Schleswig-Holstein	HEI	Heide-Busum Airport	54.1533	8.90167
DE	Schleswig-Holstein	PSH	Sankt Peter-Ording Airport	54.3089	8.68694
DE	Berlin	TXL	Berlin Tegel Airport	52.5597	13.2877
DE	Schleswig-Holstein	LBC	Lubeck Airport	53.8054	10.7192
DE	Schleswig-Holstein	HGL	Heligoland Airport (Dune Airport)	54.1853	7.91583
DE	Rheinland-Pfalz	HHN	Frankfurt-Hahn Airport	49.9487	7.26389
DE	Thuringen	EIB	Eisenach-Kindel Airport	50.9916	10.4797
DE	Nordrhein-Westfalen	CGN	Cologne Bonn Airport	50.8659	7.14274
DE	Niedersachsen	FCN	Nordholz Naval Airbase	53.7677	8.6585
DE	Thuringen	ERF	Erfurt-Weimar Airport	50.9798	10.9581
DE	Bayern	KZG	Kitzingen Airport	49.7431	10.2006
DE	Bayern	NUE	Nuremberg Airport	49.4987	11.0781
DE	Niedersachsen	VAC	Varrelbusch Airport	52.9083	8.04056
DE	Baden-Wurttemberg	FDH	Friedrichshafen Airport (Bodensee Airport)	47.6713	9.51149
DE	Nordrhein-Westfalen	SGE	Siegerland Airport	50.7077	8.08297
DE	Niedersachsen	WVN	JadeWeserAirport	53.5022	8.05222
DE	Rheinland-Pfalz	ZQW	Zweibrucken Airport	49.2094	7.40056
DE	Bayern	HOQ	Hof-Plauen Airport	50.2886	11.8564
DE	Baden-Wurttemberg	LHA	Flughafen Lahr (Lahr Airport)	48.3693	7.82772
DE	Saarland	SCN	Saarbrucken Airport	49.2146	7.10951
DE	Niedersachsen	LGO	Langeoog Airport	53.7425	7.49778
DE	Baden-Wurttemberg	STR	Stuttgart Airport	48.6899	9.22196
DE	Hamburg	XFW	Hamburg Finkenwerder Airport	53.5353	9.83556
DE	Bayern	GHF	Giebelstadt Airport	49.6481	9.96639
DE	Bayern	MUC	Munich Airport	48.3538	11.7861
DE	Bayern	OBF	Oberpfaffenhofen Airport	48.0814	11.2831
DE	Sachsen	LEJ	Leipzig/Halle Airport	51.4239	12.2364
DE	Niedersachsen	NOD	Norddeich Airport	53.6331	7.19028
DE	Brandenburg	BER	Berlin Brandenburg Airport	52.3514	13.4939
DE	Bayern	FEL	Furstenfeldbruck Air Base	48.2056	11.2669
DE	Niedersachsen	XLW	Lemwerder Airport	53.1447	8.62444
DE	Niedersachsen	NRD	Norderney Airport	53.7069	7.23
DE	Bayern	AGB	Augsburg Airport	48.4253	10.9317
DE	Nordrhein-Westfalen	BFE	Bielefeld Airport	51.9647	8.54444
DE	Niedersachsen	AGE	Wangerooge Airport	53.7828	7.91389
DE	Niedersachsen	JUI	Juist Airport	53.6811	7.05583
DE	Nordrhein-Westfalen	MGL	Dusseldorf Monchengladbach Airport	51.2303	6.50444
DE	Schleswig-Holstein	OHR	Wyk auf Fohr Airport	54.6844	8.52833
DE	Sachsen-Anhalt	ZHZ	Halle-Oppin Airport	51.5527	12.054
DE	Hessen	FRZ	Fritzlar Air Base	51.1146	9.286
DE	Rheinland-Pfalz	RMS	Ramstein Air Base	49.4369	7.60028
DE	Hessen	KSF	Kassel Airport	51.4173	9.38497
DE	Mecklenburg-Vorpommern	FNB	Neubrandenburg Airport	53.6022	13.306
DE	Brandenburg	SXF	Berlin Schonefeld Airport	52.38	13.5225
DE	Mecklenburg-Vorpommern	RLG	Rostock-Laage Airport	53.9182	12.2783
DE	Sachsen-Anhalt	KOQ	Kothen Airport	51.7211	11.9528
DE	Sachsen	IES	Riesa-Gohlis Airfield	51.2936	13.3561
DE	Hessen	FRA	Frankfurt Airport	50.0333	8.57056
DE	Thuringen	AOC	Leipzig-Altenburg Airport	50.9819	12.5064
DE	Bayern	URD	Burg Feuerstein Airport	49.7942	11.1336
DE	Bayern	IGS	Ingolstadt Manching Airport	48.7157	11.534
DE	Niedersachsen	BMK	Borkum Airfield	53.5964	6.70917
DE	Baden-Wurttemberg	FKB	Karlsruhe/Baden-Baden Airport	48.7794	8.0805
DE	Niedersachsen	BMR	Baltrum Airport	53.7247	7.37333
DE	Nordrhein-Westfalen	PAD	Paderborn Lippstadt Airport	51.6141	8.61632
DE	Bayern	ILH	Illesheim Army Airfield	49.4739	10.3881
DE	Bremen	BRE	Bremen Airport	53.0475	8.78667
DE	Mecklenburg-Vorpommern	REB	Rechlin-Larz Airfield	53.3064	12.7522
DE	Mecklenburg-Vorpommern	PEF	Peenemunde Airfield	54.1578	13.7744
DE	Mecklenburg-Vorpommern	BBH	Stralsund-Barth Airport	54.3383	12.7105
DE	Schleswig-Holstein	KEL	Kiel Airport	54.3794	10.1453
DE	Rheinland-Pfalz	BBJ	Bitburg Airport 	49.9453	6.565
DE	Niedersachsen	BWE	Braunschweig-Wolfsburg Airport	52.3192	10.5561
DE	Nordrhein-Westfalen	ESS	Essen/Mulheim Airport	51.4023	6.93733
DE	Mecklenburg-Vorpommern	GTI	Rugen Airport (Guttin Airfield)	54.3833	13.3256
DE	Sachsen	DRS	Dresden Airport	51.1328	13.7672
DE	Bayern	RBM	Straubing Wallmuhle Airport	48.9008	12.5167
DE	Schleswig-Holstein	EUM	Neumunster Airport	54.0794	9.94139
DE	Sachsen-Anhalt	CSO	Magdeburg-Cochstedt Airport	51.8564	11.4203
DE	Nordrhein-Westfalen	GUT	RAF Gutersloh	51.9228	8.30633
DE	Nordrhein-Westfalen	FMO	Munster Osnabruck International Airport	52.1346	7.68483
DE	Bayern	FMM	Memmingen Airport	47.9888	10.2395
DE	Nordrhein-Westfalen	GKE	NATO Air Base Geilenkirchen	50.9608	6.04242
DE	Schleswig-Holstein	GWT	Sylt Airport (Westerland Airport)	54.9132	8.34047
DE	Bayern	BYU	Bindlacher Berg Airport	49.985	11.64
DE	Schleswig-Holstein	FLF	Flensburg-Schaferhaus Airport	54.7733	9.37889
DE	Mecklenburg-Vorpommern	SZW	Schwerin-Parchim International Airport	53.427	11.7834
DE	Baden-Wurttemberg	MHG	Mannheim City Airport	49.4731	8.51417
DE	Niedersachsen	EME	Emden Airport	53.3911	7.2275
DE	Rheinland-Pfalz	SPM	Spangdahlem Air Base	49.9727	6.6925
DE	Niedersachsen	HAJ	Hannover Airport	52.4611	9.68508
DE	Hamburg	HAM	Hamburg Airport	53.6304	9.98823
DE	Schleswig-Holstein	QHU	Husum Schwesing Airport	54.51	9.13833
DE	Schleswig-Holstein	WBG	Schleswig Air Base	54.4593	9.51633
DE	Nordrhein-Westfalen	DUS	Dusseldorf Airport	51.2895	6.76678
DE	Baden-Wurttemberg	HDB	Heidelberg Airport	49.3924	8.65193
DE	Bremen	BRV	Bremerhaven Airport	53.5069	8.57278
DE	Brandenburg	CBU	Cottbus-Drewitz Airport	51.8894	14.5319
DJ	Tadjourah	MHI	Moucha Airport	11.7167	43.2
DJ	Djibouti	JIB	Djibouti-Ambouli International Airport	11.5473	43.1595
DJ	Ali Sabieh	AII	Ali-Sabieh Airport	11.1469	42.72
DJ	Tadjourah	TDJ	Tadjoura Airport	11.783	42.917
DJ	Obock	OBC	Obock Airport	11.967	43.267
DK	Sjaelland	MRW	Lolland Falster Airport	54.6993	11.4401
DK	Hovedstaden	RNN	Bornholm Airport	55.0633	14.7596
DK	Nordjylland	AAL	Aalborg Airport	57.0928	9.84924
DK	Syddanmark	SGD	Sonderborg Airport	54.9644	9.79173
DK	Midtjylland	AAR	Aarhus Airport	56.3	10.619
DK	Syddanmark	SKS	Vojens Airport (Skrydstrup Airport)	55.221	9.26702
DK	Midtjylland	STA	Stauning Vestjylland Airport	55.9901	8.35391
DK	Midtjylland	SQW	Skive Airport	56.5502	9.17298
DK	Syddanmark	EBJ	Esbjerg Airport	55.5259	8.5534
DK	Midtjylland	KRP	Karup Airport	56.2975	9.12463
DK	Sjaelland	RKE	Roskilde Airport	55.5856	12.1314
DK	Nordjylland	BYR	Laesoe Airport	57.2772	11.0001
DK	Nordjylland	TED	Thisted Airport	57.0688	8.70522
DK	Syddanmark	ODE	Hans Christian Andersen Airport	55.4767	10.3309
DK	Hovedstaden	CPH	Copenhagen Airport	55.6179	12.656
DK	Syddanmark	BLL	Billund Airport	55.7403	9.15178
DK	Nordjylland	CNL	Sindal Airport	57.5035	10.2294
DM	Saint Andrew	DOM	Douglas-Charles Airport	15.547	-61.3
DM	Saint George	DCF	Canefield Airport	15.3367	-61.3922
DO	Samana	EPS	Arroyo Barril Airport	19.3214	-69.4959
DO	Monte Plata	SDQ	Las Americas International Airport	18.4297	-69.6689
DO	Barahona	BRX	Maria Montez International Airport	18.2515	-71.1204
DO	La Altagracia	PUJ	Punta Cana International Airport	18.5674	-68.3634
DO	Santiago	STI	Cibao International Airport	19.4061	-70.6047
DO	Distrito Nacional (Santo Domingo)	JBQ	La Isabela International Airport (Dr. Joaquin Balaguer Int'l)	18.5725	-69.9856
DO	Puerto Plata	POP	Gregorio Luperon International Airport	19.7579	-70.57
DO	La Vega	COZ	Constanza Airport	18.9075	-70.7219
DO	Samana	AZS	Samana El Catey International Airport	19.267	-69.742
DO	Pedernales	CBJ	Cabo Rojo Airport	17.929	-71.6448
DZ	Ghardaia	GHA	Noumerat - Moufdi Zakaria Airport	32.3841	3.79411
DZ	Tlemcen	TLM	Zenata - Messali El Hadj Airport	35.0167	-1.45
DZ	Chlef	CFK	Chlef International Airport	36.2127	1.33177
DZ	Adrar	BMW	Bordj Mokhtar Airport	21.375	0.923889
DZ	Sidi Bel Abbes	BFW	Sidi Bel Abbes Airport	35.1718	-0.593275
DZ	Tamanrasset	INZ	In Salah Airport	27.251	2.51202
DZ	Tamanrasset	INF	In Guezzam Airport	19.567	5.75
DZ	Ouargla	HME	Oued Irara-Krim Belkacem Airport	31.673	6.14044
DZ	Naama	MZW	Mecheria Airport	33.5359	-0.242353
DZ	Ghardaia	ELG	El Golea Airport	30.5713	2.85959
DZ	Mascara	MUW	Ghriss Airport	35.2077	0.147142
DZ	Tindouf	TIN	Tindouf Airport	27.7004	-8.1671
DZ	Mostaganem	MQV	Mostaganem Airport	35.9088	0.149383
DZ	Illizi	VVZ	Takhamalt Airport	26.7235	8.62265
DZ	Adrar	AZR	Touat-Cheikh Sidi Mohamed Belkebir Airport	27.8376	-0.186414
DZ	Skikda	SKI	Skikda Airport	36.8641	6.9516
DZ	Laghouat	HRM	Hassi R'Mel Airport (Tilrempt Airport)	32.9304	3.31154
DZ	Ouargla	TGR	Sidi Mahdi Airport	33.0678	6.08867
DZ	Bejaia	BJA	Soummam - Abane Ramdane Airport	36.712	5.06992
DZ	Oran	ORN	Oran Es Senia Airport	35.6239	-0.621183
DZ	Illizi	DJG	Tiska Djanet Airport	24.2928	9.45244
DZ	Laghouat	LOO	L'Mekrareg Airport (Laghouat Airport)	33.7644	2.92834
DZ	Annaba	AAE	Rabah Bitat Airport (Les Salines Airport)	36.8222	7.80917
DZ	Adrar	TMX	Timimoun Airport	29.2371	0.276033
DZ	Jijel	GJL	Jijel Ferhat Abbas Airport	36.7951	5.87361
DZ	Tiaret	TID	Abdelhafid Boussouf Bou Chekif Airport	35.3411	1.46315
DZ	El Bayadh	EBH	El Bayadh Airport	33.7217	1.0925
DZ	Illizi	IAM	In Amenas Airport (Zarzaitine Airport)	28.0515	9.64291
DZ	Ouargla	OGX	Ain Beida Airport	31.9172	5.41278
DZ	Bechar	CBH	Boudghene Ben Ali Lotfi Airport	31.6457	-2.26986
DZ	Setif	QSF	Ain Arnat Airport	36.1781	5.32449
DZ	Biskra	BSK	Biskra Airport	34.7933	5.73823
DZ	Tamanrasset	TMR	Aguenar -Hadj Bey Akhamok Airport	22.8115	5.45108
DZ	El Oued	ELU	Guemar Airport	33.5114	6.77679
DZ	Djelfa	BUJ	Bou Saada Airport	35.3325	4.20639
DZ	Batna	BLJ	Mostepha Ben Boulaid Airport	35.7521	6.30859
DZ	Alger	ALG	Houari Boumediene Airport	36.691	3.21541
DZ	Tebessa	TEE	Cheikh Larbi Tebessi Airport	35.4316	8.12072
DZ	Oran	TAF	Oran Tafaraoui Airport	35.5424	-0.532278
DZ	Constantine	CZL	Mohamed Boudiaf International Airport	36.276	6.62039
EC	Morona Santiago	MZD	Mendez Airport	-2.73333	-78.3167
EC	Morona Santiago	XMS	Edmundo Carvajal Airport	-2.29917	-78.1208
EC	Galapagos	SCY	San Cristobal Airport	-0.910206	-89.6174
EC	Loja	LOH	Ciudad de Catamayo Airport	-3.99589	-79.3719
EC	Sucumbios	PYO	Putumayo Airport	0.115949	-75.8502
EC	Orellana	TPN	Tiputini Airport	-0.776111	-75.5264
EC	El Oro	MCH	General Manuel Serrano Airport	-3.2689	-79.9616
EC	Manabi	BHA	Los Perales Airport	-0.608111	-80.4027
EC	Morona Santiago	SUQ	Sucua Airport	-2.483	-78.167
EC	El Oro	ETR	Santa Rosa International Airport	-3.44199	-79.997
EC	Orellana	OCC	Francisco de Orellana Airport	-0.462886	-76.9868
EC	Cotopaxi	LTX	Cotopaxi International Airport	-0.906833	-78.6158
EC	Napo	TNW	Jumandy Airport	-1.05972	-77.5833
EC	Manabi	PVO	Reales Tamarindos Airport	-1.04165	-80.4722
EC	Tungurahua	ATF	Chachoan Airport	-1.21207	-78.5746
EC	Esmeraldas	ESM	Carlos Concha Torres International Airport	0.978519	-79.6266
EC	Manabi	JIP	Jipijapa Airport	-1	-80.6667
EC	Galapagos	GPS	Seymour Airport	-0.453758	-90.2659
EC	Manabi	MEC	Eloy Alfaro International Airport	-0.946078	-80.6788
EC	Azuay	CUE	Mariscal Lamar International Airport	-2.88947	-78.9844
EC	Loja	MRR	Jose Maria Velasco Ibarra Airport	-4.37823	-79.941
EC	Morona Santiago	TSC	Taisha Airport	-2.38167	-77.5028
EC	Sucumbios	LGQ	Lago Agrio Airport	0.093056	-76.8675
EC	Santa Elena	SNC	General Ulpiano Paez Airport	-2.20499	-80.9889
EC	Pastaza	PTZ	Rio Amazonas Airport	-1.50524	-78.0627
EC	Pichincha	UIO	Mariscal Sucre International Airport	-0.129167	-78.3575
EC	Carchi	TUA	Teniente Coronel Luis a Mantilla International Airport	0.809506	-77.7081
EC	Galapagos	IBB	General Villamil Airport	-0.942628	-90.953
EC	Sucumbios	TPC	Tarapoa Airport	-0.122956	-76.3378
EC	Guayas	GYE	Jose Joaquin de Olmedo International Airport	-2.15742	-79.8836
EE	Saaremaa	URE	Kuressaare Airport	58.2299	22.5095
EE	Tartumaa	TAY	Tartu Airport	58.3075	26.6904
EE	Harjumaa	TLL	Tallinn Airport (Lennart Meri Tallinn Airport)	59.4133	24.8328
EE	Hiiumaa	KDL	Kardla Airport	58.9908	22.8307
EE	Parnumaa	EPU	Parnu Airport	58.419	24.4728
EG	Al Uqsur	LXR	Luxor International Airport	25.671	32.7066
EG	Janub Sina'	TCP	Taba International Airport	29.5878	34.7781
EG	Janub Sina'	AUE	Abu Rudeis Airport	28.899	33.2025
EG	Matruh	DBB	Al Alamain International Airport	30.9245	28.4614
EG	Suhaj	HMB	Sohag International Airport	26.3428	31.7428
EG	Al Iskandariyah	ALY	El Nouzha Airport	31.1839	29.9489
EG	Ash Sharqiyah	TFR	Wadi al Jandali Airport	30.3	31.75
EG	Janub Sina'	SSH	Sharm el-Sheikh International Airport	27.9773	34.395
EG	Matruh	SQK	Sidi Barrani Airport	31.4666	25.878
EG	Janub Sina'	SKV	St. Catherine International Airport	28.6853	34.0625
EG	Shamal Sina'	AAC	El Arish International Airport	31.0733	33.8358
EG	Janub Sina'	ELT	El Tor Airport	28.209	33.6455
EG	Al Iskandariyah	HBE	Borg El Arab Airport	30.9177	29.6964
EG	Asyut	ATZ	Assiut Airport	27.0465	31.012
EG	Aswan	ASW	Aswan International Airport	23.9644	32.82
EG	Bur Sa'id	PSD	Port Said Airport	31.2794	32.24
EG	Aswan	ABS	Abu Simbel Airport	22.376	31.6117
EG	Al Wadi al Jadid	UVL	El Kharga Airport	25.4736	30.5907
EG	Al Wadi al Jadid	DAK	Dakhla Oasis Airport	25.4116	29.0031
EG	Matruh	MUH	Marsa Matruh International Airport	31.3254	27.2217
EG	Al Minya	EMY	El Minya Airport	28.1013	30.7303
EG	Al Jizah	SPX	Sphinx International Airport	30.1097	30.8944
EG	Al Bahr al Ahmar	RMF	Marsa Alam International Airport	25.5571	34.5837
EG	Al Wadi al Jadid	GSQ	Sharq Al-Owainat Airport	22.5857	28.7166
EG	Al Qahirah	CAI	Cairo International Airport	30.1219	31.4056
EG	Matruh	SEW	Siwa Oasis North Airport	29.3455	25.5067
EG	Al Bahr al Ahmar	HRG	Hurghada International Airport	27.1783	33.7994
ER	Qash-Barkah	TES	Teseney Airport	15.1043	36.6817
ER	Janubi al Bahri al Ahmar	ASA	Assab International Airport	13.0718	42.645
ER	Al Awsat	ASM	Asmara International Airport	15.2919	38.9107
ER	Shimali al Bahri al Ahmar	MSW	Massawa International Airport	15.67	39.3701
ES	Canarias	GMZ	La Gomera Airport	28.0296	-17.2146
ES	Illes Balears	MAH	Menorca Airport (Mahon Airport)	39.8626	4.21865
ES	Canarias	LPA	Gran Canaria Airport	27.9319	-15.3866
ES	Madrid, Comunidad de	MAD	Adolfo Suarez Madrid-Barajas Airport	40.4719	-3.56264
ES	Catalunya	BCN	Barcelona El Prat Airport	41.2971	2.07846
ES	Pais Vasco	EAS	San Sebastian Airport	43.3565	-1.79061
ES	La Rioja	RJL	Logrono-Agoncilo	42.461	-2.32224
ES	Valenciana, Comunidad	ALC	Alicante-Elche Airport	38.2822	-0.558156
ES	Extremadura	BJZ	Badajoz Airport (Talavera la Real Air Base)	38.8913	-6.82133
ES	Andalucia	GRX	Federico Garcia Lorca Airport (Granada Jaen Airport)	37.1887	-3.77736
ES	Castilla-La Mancha	ABC	Albacete Airport	38.9485	-1.86352
ES	Canarias	FUE	Fuerteventura Airport	28.4527	-13.8638
ES	Canarias	ACE	Lanzarote Airport	28.9455	-13.6052
ES	Andalucia	ROZ	Naval Station Rota	36.6452	-6.34946
ES	Galicia	SCQ	Santiago de Compostela Airport	42.8963	-8.41514
ES	Andalucia	ODB	Cordoba Airport	37.842	-4.84888
ES	Andalucia	XRY	Jerez Airport (La Parra Airport)	36.7446	-6.06011
ES	Illes Balears	IBZ	Ibiza Airport	38.8729	1.37312
ES	Galicia	VGO	Vigo-Peinador Airport	42.2318	-8.62677
ES	Andalucia	SVQ	Seville Airport	37.418	-5.89311
ES	Canarias	SPC	La Palma Airport	28.6265	-17.7556
ES	Navarra, Comunidad Foral de	PNA	Pamplona Airport	42.77	-1.64633
ES	Castilla y Leon	VLL	Valladolid Airport	41.7061	-4.85194
ES	Castilla y Leon	CQM	Ciudad Real Central Airport	38.8564	-3.97
ES	Illes Balears	PMI	Palma de Mallorca Airport	39.5517	2.73881
ES	Aragon	TEV	Teruel Airport	40.403	-1.2183
ES	Catalunya	REU	Reus Airport	41.1474	1.16717
ES	Catalunya	LEU	La Seu d'Urgell Airport	42.3386	1.40917
ES	Catalunya	GRO	Girona-Costa Brava Airport	41.901	2.76055
ES	Valenciana, Comunidad	VLC	Valencia Airport	39.4893	-0.481625
ES	Aragon	HSK	Huesca-Pirineos Airport	42.0761	-0.316667
ES	Castilla y Leon	LEN	Leon Airport	42.589	-5.65556
ES	Catalunya	ILD	Lleida-Alguaire Airport	41.7282	0.535023
ES	Murcia, Region de	RMU	Region de Murcia International Airport	37.803	-1.125
ES	Andalucia	OZP	Moron Air Base	37.1749	-5.61594
ES	Andalucia	LEI	Almeria Airport	36.8439	-2.3701
ES	Canarias	VDE	El Hierro Airport	27.8148	-17.8871
ES	Murcia, Region de	MJV	Murcia-San Javier Airport	37.775	-0.812389
ES	Valenciana, Comunidad	CDT	Castellon-Costa Azahar Airport	40.2139	0.073333
ES	Pais Vasco	VIT	Vitoria Airport	42.8828	-2.72447
ES	Castilla y Leon	SLM	Salamanca Airport	40.9521	-5.50199
ES	Madrid, Comunidad de	TOJ	Madrid-Torrejon Airport	40.4967	-3.44587
ES	Castilla y Leon	RGS	Burgos Airport	42.3576	-3.62076
ES	Galicia	LCG	A Coruna Airport	43.3021	-8.37726
ES	Andalucia	AGP	Malaga Airport	36.6749	-4.49911
ES	Asturias, Principado de	OVD	Asturias Airport (Oviedo Airport)	43.5636	-6.03462
ES	Pais Vasco	BIO	Bilbao Airport	43.3011	-2.91061
ES	Melilla	MLN	Melilla Airport	35.2798	-2.95626
ES	Cantabria	SDR	Santander Airport	43.4271	-3.82001
ES	Aragon	ZAZ	Zaragoza Airport	41.6662	-1.04155
ES	Catalunya	LEU	Andorra-La Seu Airport	42.3386	1.40917
ET	Addis Ababa	ADD	Addis Ababa Bole International Airport	8.97778	38.7994
ET	Oromiya	MZX	Mena Airport	6.35	39.7167
ET	Sumale	WRA	Warder Airport	6.9724	45.3334
ET	Amara	PWI	Beles Airport	11.3126	36.4164
ET	YeDebub Biheroch Bihereseboch na Hizboch	WAC	Wacca Airport	7.167	37.167
ET	Oromiya	ALK	Asella Airport	7.96213	39.1283
ET	Dire Dawa	DIR	Aba Tenna Dejazmach Yilma International Airport	9.6247	41.8542
ET	Oromiya	NDM	Mendi Airport	9.767	35.1
ET	Amara	BJR	Bahir Dar Airport	11.6081	37.3216
ET	YeDebub Biheroch Bihereseboch na Hizboch	TIE	Tippi Airport	7.2024	35.415
ET	Amara	GDQ	Gondar Airport (Atse Tewodros Airport)	12.5199	37.434
ET	Sumale	GLC	Geladi Airport	6.98444	46.4214
ET	Oromiya	NEK	Nekemte Airport	9.05	36.6
ET	Sumale	ABK	Kabri Dar Airport	6.734	44.253
ET	YeDebub Biheroch Bihereseboch na Hizboch	AWA	Awasa Airport	7.067	38.5
ET	YeDebub Biheroch Bihereseboch na Hizboch	MUJ	Mui Airport	5.8646	35.7485
ET	Amara	ETE	Genda Wuha Airport	12.933	36.167
ET	Oromiya	DEM	Dembidolo Airport	8.554	34.858
ET	YeDebub Biheroch Bihereseboch na Hizboch	TUJ	Tum Airport	6.26	35.5184
ET	Adis Abeba	ADD	Bole International Airport	8.97789	38.7993
ET	Tigray	MQX	Alula Aba Nega Airport	13.4674	39.5335
ET	Oromiya	GNN	Ginir Airport	7.15	40.717
ET	Oromiya	EGL	Neghelle Airport	5.2897	39.7023
ET	Tigray	AXU	Axum Airport	14.1468	38.7728
ET	Oromiya	XBL	Bedele Airport (Buno Bedele Airport)	8.456	36.352
ET	Sumale	DGC	Degeh Bur Airport	8.234	43.5673
ET	Sumale	JIJ	Wilwal International Airport	9.3325	42.9121
ET	Oromiya	JIM	Aba Segud Airport	7.66609	36.8166
ET	Afar	SZE	Semera Airport	11.7875	40.9915
ET	Oromiya	NEJ	Nejjo Airport	9.55	35.467
ET	Oromiya	GOR	Gore Airport	8.1614	35.5529
ET	YeDebub Biheroch Bihereseboch na Hizboch	MTF	Mizan Teferi Airport	6.9571	35.5547
ET	Oromiya	GOB	Robe Airport	7.11606	40.0463
ET	YeDebub Biheroch Bihereseboch na Hizboch	BCO	Baco Airport (Jinka Airport)	5.78287	36.562
ET	Oromiya	SKR	Shakiso Airport	5.6923	38.9764
ET	YeDebub Biheroch Bihereseboch na Hizboch	SXU	Soddu Airport	6.817	37.75
ET	Amara	LLI	Lalibela Airport	11.975	38.98
ET	Amara	OTA	Mota Airport	11.083	37.867
ET	Amara	MKS	Mekane Selam Airport	10.7254	38.7415
ET	Tigray	HUE	Humera Airport	14.25	36.583
ET	Oromiya	BEI	Beica Airport	9.38639	34.5219
ET	Sumale	HIL	Shilavo Airport	6.08333	44.7667
ET	YeDebub Biheroch Bihereseboch na Hizboch	AMH	Arba Minch Airport	6.03939	37.5905
ET	Oromiya	FNH	Fincha Airport	9.583	37.35
ET	Amara	DBM	Debre Marqos Airport	10.35	37.717
ET	Sumale	LFO	Kelafo Airport	5.657	44.35
ET	Tigray	SHC	Shire Airport	14.0781	38.2725
ET	YeDebub Biheroch Bihereseboch na Hizboch	BCY	Bulchi Airport	6.21667	36.6667
ET	Amara	DBT	Debre Tabor Airport	11.967	38
ET	Gambela Hizboch	GMB	Gambela Airport	8.12876	34.5631
ET	Amara	DSE	Combolcha Airport	11.0825	39.7114
ET	Sumale	GDE	Gode Airport	5.93513	43.5786
ET	Binshangul Gumuz	ASO	Asosa Airport	10.0185	34.5863
FI	Varsinais-Suomi	TKU	Turku Airport	60.5141	22.2628
FI	Satakunta	POR	Pori Airport	61.4617	21.8
FI	Keski-Suomi	JYV	Jyvaskyla Airport	62.3995	25.6783
FI	Pohjois-Savo	KUO	Kuopio Airport	63.0071	27.7978
FI	Kymenlaakso	UTI	Utti Airport	60.8964	26.9384
FI	Etela-Savo	VRK	Varkaus Airport	62.1711	27.8686
FI	Etela-Pohjanmaa	SJY	Seinajoki Airport	62.6921	22.8323
FI	Uusimaa	HYV	Hyvink- Airfield	60.6544	24.8811
FI	Pohjois-Pohjanmaa	YLI	Ylivieska Airfield	64.0547	24.7253
FI	Pohjanmaa	KOK	Kokkola-Pietarsaari Airport	63.7212	23.1431
FI	Keski-Suomi	KEV	Halli Airport	61.856	24.7867
FI	Pohjanmaa	VAA	Vaasa Airport	63.0507	21.7622
FI	Etela-Karjala	LPP	Lappeenranta Airport	61.0446	28.1447
FI	Etela-Savo	SVL	Savonlinna Airport	61.9431	28.9451
FI	Varsinais-Suomi	MHQ	Mariehamn Airport	60.1222	19.8982
FI	Lappi	KEM	Kemi-Tornio Airport	65.7787	24.5821
FI	Pohjois-Karjala	KTQ	Kitee Airfield	62.1661	30.0736
FI	Lappi	IVL	Ivalo Airport	68.6073	27.4053
FI	Etela-Pohjanmaa	KAU	Kauhava Airfield	63.1271	23.0514
FI	Lappi	KTT	Kittila Airport	67.701	24.8468
FI	Lappi	SOT	Sodankyla Airfield	67.395	26.6191
FI	Pohjois-Karjala	JOE	Joensuu Airport	62.6629	29.6075
FI	Pohjois-Pohjanmaa	OUL	Oulu Airport	64.9301	25.3546
FI	Lappi	RVN	Rovaniemi Airport	66.5648	25.8304
FI	Uusimaa	HEM	Helsinki-Malmi Airport	60.2546	25.0428
FI	Etela-Pohjanmaa	KHJ	Kauhajoki Airfield	62.4625	22.3931
FI	Uusimaa	HEL	Helsinki Airport (Helsinki-Vantaa Airport)	60.3172	24.9633
FI	Kainuu	KAJ	Kajaani Airport	64.2855	27.6924
FI	Pirkanmaa	TMP	Tampere-Pirkkala Airport	61.4141	23.6044
FI	Etela-Savo	MIK	Mikkeli Airport	61.6866	27.2018
FI	Lappi	ENF	Enontekio Airport	68.3626	23.4243
FI	Pohjois-Pohjanmaa	KAO	Kuusamo Airport	65.9876	29.2394
FJ	Eastern	MFJ	Moala Airport	-18.5667	179.951
FJ	Northern	SVU	Savusavu Airport	-16.8028	179.341
FJ	Eastern	KAY	Wakaya Airport	-17.617	179.017
FJ	Western	MNF	Mana Island Airport	-17.6731	177.098
FJ	Western	BXL	Blue Lagoon Seaplane Base	-16.943	177.368
FJ	Eastern	KDV	Vunisea Airport	-19.0581	178.157
FJ	Central	PHR	Pacific Harbour Airport	-18.257	178.068
FJ	Northern	BVF	Dama Airport	-16.8598	178.623
FJ	Eastern	ONU	Ono-i-Lau Airport	-20.6589	-178.741
FJ	Western	KVU	Korolevu Seaplane Base	-17.7543	177.437
FJ	Western	TTL	Turtle Island Seaplane Base	-16.966	177.368
FJ	Eastern	KXF	Koro Airport	-17.3458	179.422
FJ	Central	LUC	Laucala Airport	-16.7481	-179.667
FJ	Central	SUV	Nausori International Airport	-18.0433	178.559
FJ	Western	NTA	Natadola Seaplane Base	-18.0677	177.315
FJ	Northern	LBS	Labasa Airport	-16.4667	179.34
FJ	Western	VTF	Vatulele Airport	-18.5125	177.639
FJ	Eastern	LEV	Levuka Airfield (Bureta Airport)	-17.7111	178.759
FJ	Eastern	NGI	Gau Airport	-18.1156	179.34
FJ	Eastern	LKB	Lakeba Airport	-18.1992	-178.817
FJ	Central	NAN	Nadi International Airport	-17.7554	177.443
FJ	Northern	AQS	Saqani Airport	-16.4494	179.74
FJ	Northern	TVU	Matei Airport	-16.6906	-179.877
FJ	Western	VAU	Vatukoula Airport	-17.5	177.842
FJ	Northern	RTA	Rotuma Airport	-12.4825	177.071
FJ	Eastern	VBV	Vanuabalavu Airport	-17.269	-178.976
FJ	Western	YAS	Yasawa Island Airport	-16.7589	177.545
FJ	Western	CST	Castaway Island Seaplane Base	-17.7358	177.129
FJ	Northern	RBI	Rabi Airport	-16.5337	179.976
FJ	Eastern	ICI	Cicia Airport	-17.7433	-179.342
FJ	Western	PTF	Malolo Lailai Airport	-17.7779	177.197
FK	Falkland Islands (Malvinas)	PSY	Port Stanley Airport	-51.6857	-57.7776
FK	Falkland Islands (Malvinas)	FAE	Vagar Airport	62.0636	-7.27722
FK	Falkland Islands (Malvinas)	MPN	RAF Mount Pleasant	-51.8228	-58.4472
FM	Yap	ULI	Ulithi Airport (FAA: TT02)	10.0198	139.79
FM	Yap	YAP	Yap International Airport	9.49891	138.083
FM	Chuuk	TKK	Chuuk International Airport	7.46187	151.843
FM	Kosrae	KSA	Kosrae International Airport	5.35698	162.958
FM	Pohnpei	PNI	Pohnpei International Airport	6.9851	158.209
FR	Auvergne-Rhone-Alpes	LPY	Le Puy - Loudes Airport	45.0807	3.76289
FR	Normandie	DPE	Dieppe - Saint-Aubin Airport	49.8825	1.08528
FR	Normandie	LEH	Le Havre - Octeville Airport	49.5339	0.088056
FR	Bretagne	LDV	Landivisiau Air Base	48.5303	-4.15164
FR	Bourgogne-Franche-Comte	DIJ	Dijon Air Base	47.2689	5.09
FR	Nouvelle-Aquitaine	LRH	La Rochelle - Ile de Re Airport	46.1792	-1.19528
FR	Grand-Est	VTL	Vittel - Champ-de-Courses Airport	47.8168	6.38111
FR	Auvergne-Rhone-Alpes	MVV	Megeve Altiport	45.8208	6.65222
FR	Pays-de-la-Loire	EDM	La Roche-sur-Yon Aerodrome	46.7019	-1.37863
FR	Occitanie	MPL	Montpellier-Mediterranee Airport (Frejorgues Airport)	43.5762	3.96301
FR	Auvergne-Rhone-Alpes	GNB	Grenoble-Isere Airport	45.3629	5.32937
FR	Bretagne	LRT	Lorient South Brittany Airport (Lann-Bihoue Airport)	47.7606	-3.44
FR	Grand-Est	MZM	Metz-Frescaty Air Base	49.0717	6.13167
FR	Provence-Alpes-Cote-d'Azur	GAT	Gap-Tallard Airport	44.455	6.03778
FR	Occitanie	LDE	Tarbes-Lourdes-Pyrenees Airport	43.1787	-0.006439
FR	Normandie	EVX	Evreux-Fauville Air Base	49.0287	1.21986
FR	Nouvelle-Aquitaine	CNG	Cognac - Chateaubernard Air Base	45.6583	-0.3175
FR	Normandie	DOL	Deauville - Saint-Gatien Airport	49.3653	0.154306
FR	Grand-Est	RHE	Reims - Champagne Airport	49.31	4.05
FR	Pays-de-la-Loire	LSO	Les Sables-d'Olonne - Talmont Airport	46.4769	-1.72278
FR	Auvergne-Rhone-Alpes	LYN	Lyon-Bron Airport	45.7272	4.94427
FR	Hauts-de-France	CSF	Creil Air Base	49.2535	2.51914
FR	Corse	CLY	Calvi - Sainte-Catherine Airport	42.5244	8.79306
FR	Pays-de-la-Loire	LME	Le Mans Arnage Airport	47.9486	0.201667
FR	Occitanie	ZAO	Cahors - Lalbenque Airport	44.3514	1.47528
FR	Auvergne-Rhone-Alpes	CFE	Clermont-Ferrand Auvergne Airport	45.7867	3.16917
FR	Provence-Alpes-Cote-d'Azur	NCE	Nice Cote d'Azur Airport	43.6584	7.21587
FR	Corse	SOZ	Solenzara Air Base	41.9244	9.406
FR	Bretagne	DNR	Dinard-Pleurtuit-Saint-Malo Airport	48.5877	-2.07996
FR	Pays-de-la-Loire	CET	Cholet Le Pontreau Airport	47.0821	-0.877064
FR	Hauts-de-France	LTQ	Le Touquet - Cote d'Opale Airport	50.5174	1.62059
FR	Occitanie	RDZ	Rodez-Marcillac Airport	44.4079	2.48267
FR	Provence-Alpes-Cote-d'Azur	LTT	La Mole - Saint-Tropez Airport	43.2054	6.482
FR	Auvergne-Rhone-Alpes	NCY	Annecy - Haute-Savoie - Mont Blanc Airport	45.9308	6.10639
FR	Auvergne-Rhone-Alpes	MFX	Meribel Altiport	45.407	6.57794
FR	Auvergne-Rhone-Alpes	VAF	Valence-Chabeuil Airport	44.9216	4.9699
FR	Centre-Val de Loire	TUF	Tours Val de Loire Airport	47.4322	0.727606
FR	Hauts-de-France	LIL	Lille Airport (Lille-Lesquin Airport)	50.5633	3.08689
FR	Normandie	CER	Cherbourg - Maupertus Airport	49.6501	-1.47028
FR	Nouvelle-Aquitaine	AGF	Agen La Garenne Airport	44.1747	0.590556
FR	Nouvelle-Aquitaine	LIG	Limoges - Bellegarde Airport	45.8628	1.17944
FR	Grand-Est	ETZ	Metz-Nancy-Lorraine Airport	48.9821	6.25132
FR	Nouvelle-Aquitaine	NIT	Niort - Souche Airport	46.3135	-0.394529
FR	Hauts-de-France	BYF	Albert - Picardie Airport	49.9715	2.69766
FR	Normandie	URO	Rouen Airport	49.3842	1.1748
FR	Auvergne-Rhone-Alpes	LYS	Lyon-Saint-Exupery Airport	45.7256	5.08111
FR	Pays-de-la-Loire	LVA	Laval Entrammes Airport	48.0314	-0.742986
FR	Provence-Alpes-Cote-d'Azur	CEQ	Cannes - Mandelieu Airport	43.542	6.95348
FR	Nouvelle-Aquitaine	BOD	Bordeaux-Merignac Airport	44.8283	-0.715556
FR	Bourgogne-Franche-Comte	DLE	Dole-Jura Airport	47.0427	5.43506
FR	Auvergne-Rhone-Alpes	AHZ	Alpe d'Huez Airport	45.0883	6.08472
FR	Bretagne	BES	Brest Bretagne Airport	48.4479	-4.41854
FR	Bretagne	SBK	Saint-Brieuc - Armor Airport	48.5378	-2.85444
FR	Pays-de-la-Loire	IDY	Ile d'Yeu Aerodrome	46.7186	-2.39111
FR	Corse	AJA	Ajaccio Napoleon Bonaparte Airport	41.9236	8.80292
FR	Provence-Alpes-Cote-d'Azur	MRS	Marseille Provence Airport	43.4393	5.22142
FR	Nouvelle-Aquitaine	EGC	Bergerac Dordogne Perigord Airport	44.8253	0.518611
FR	Centre-Val de Loire	BOU	Bourges Airport	47.0581	2.37028
FR	Auvergne-Rhone-Alpes	EBU	Saint-Etienne-Boutheon Airport	45.5406	4.29639
FR	Nouvelle-Aquitaine	RYN	Royan - Medis Aerodrome	45.6281	-0.9725
FR	Hauts-de-France	CQF	Calais-Dunkerque Airport	50.9621	1.95476
FR	Pays-de-la-Loire	LBY	La Baule-Escoublac Airport	47.2894	-2.34639
FR	Pays-de-la-Loire	ANE	Angers - Loire Airport	47.5603	-0.312222
FR	Nouvelle-Aquitaine	ANG	Angouleme - Cognac International Airport	45.7292	0.221456
FR	Pays-de-la-Loire	SNR	Saint-Nazaire Montoir Airport	47.3106	-2.15667
FR	Corse	PRP	Propriano Airport	41.6606	8.88975
FR	Occitanie	LBI	Le Sequestre Airport	43.9139	2.11306
FR	Grand-Est	EPL	Epinal - Mirecourt Airport	48.325	6.06998
FR	Pays-de-la-Loire	NTE	Nantes Atlantique Airport	47.1532	-1.61073
FR	Bourgogne-Franche-Comte	SYT	Saint-Yan Airport (Charolais Bourgogne Sud Airport)	46.4125	4.01326
FR	Bretagne	LAI	Lannion - Cote de Granit Airport	48.7544	-3.47166
FR	Provence-Alpes-Cote-d'Azur	SCP	Mont-Dauphin - Saint-Crepin Airport	44.7017	6.60028
FR	Centre-Val de Loire	ORE	Orleans - Saint-Denis-de-l'Hotel port	47.9878	1.76056
FR	Bourgogne-Franche-Comte	NVS	Nevers - Fourchambault Airport	47.0026	3.11333
FR	Auvergne-Rhone-Alpes	OBS	Aubenas Aerodrome (Arddecheche Meridionale Aerodrom)	44.5442	4.37219
FR	Auvergne-Rhone-Alpes	VHY	Vichy - Charmeil Airport	46.1697	3.40374
FR	Hauts-de-France	HZB	Merville-Calonne Airport	50.6184	2.64224
FR	Corse	BIA	Bastia - Poretta Airport	42.5527	9.48373
FR	Bretagne	RNS	Rennes-Saint-Jacques Airport	48.0695	-1.73479
FR	Normandie	CFR	Caen - Carpiquet Airport	49.1733	-0.45
FR	Auvergne-Rhone-Alpes	MCU	Montlucon - Gueret Airport	46.2226	2.36396
FR	Nouvelle-Aquitaine	BIQ	Biarritz Pays Basque Airport	43.4683	-1.53111
FR	Corse	FSC	Figari-Sud Corse Airport	41.5006	9.09778
FR	Occitanie	CCF	Carcassonne Airport	43.216	2.30632
FR	Auvergne-Rhone-Alpes	RNE	Roanne Renaison Airport	46.0583	4.00139
FR	Grand-Est	SXB	Strasbourg Airport	48.5383	7.62823
FR	Grand-Est	ENC	Nancy-Essey Airport	48.6921	6.23046
FR	Bourgogne-Franche-Comte	AUF	Auxerre - Branches Aerodrome	47.8502	3.49711
FR	Auvergne-Rhone-Alpes	AUR	Aurillac - Tronquieres Airport	44.8914	2.42194
FR	Bretagne	UIP	Quimper-Cornouaille Airport	47.975	-4.16779
FR	Auvergne-Rhone-Alpes	CMF	Chambery-Savoie Airport	45.6381	5.88023
FR	Occitanie	MEN	Brenoux Airport	44.5021	3.53282
FR	Provence-Alpes-Cote-d'Azur	AVN	Avignon - Provence Airport	43.9073	4.90183
FR	Occitanie	BZR	Beziers Cap d'Agde Airport	43.3235	3.3539
FR	Occitanie	DCM	Castres-Mazamet Airport	43.5563	2.28918
FR	Grand-Est	CMR	Colmar - Houssen Airport	48.1099	7.35901
FR	Provence-Alpes-Cote-d'Azur	TLN	Toulon-Hyeres Airport (Hyeres Le Palyvestre Airport)	43.0973	6.14603
FR	Occitanie	TLS	Toulouse-Blagnac Airport	43.6291	1.36382
FR	Occitanie	PGF	Perpignan-Rivesaltes Airport	42.7404	2.87067
FR	Occitanie	FNI	Nimes-Ales-Camargue-Cevennes Airport (Garons Airport)	43.7574	4.41635
FR	Nouvelle-Aquitaine	RCO	Rochefort - Saint-Agnant Airport	45.8878	-0.983056
FR	Auvergne-Rhone-Alpes	CVF	Courchevel Altiport	45.3967	6.63472
FR	Normandie	GFR	Granville-Mont-Saint-Michel Aerodrome (fr)	48.8831	-1.56417
FR	Nouvelle-Aquitaine	PGX	Perigueux Bassillac Airport	45.1981	0.815556
FR	Nouvelle-Aquitaine	BVE	Brive-Souillac Airport	45.0397	1.48556
FR	Provence-Alpes-Cote-d'Azur	QXB	Aix-en-Provence Aerodrome	43.5056	5.36778
FR	Provence-Alpes-Cote-d'Azur	BAE	Barcelonnette - Saint-Pons Airport	44.3872	6.60919
FR	Centre-Val de Loire	CHR	Chateauroux-Centre Marcel Dassault Airport	46.8603	1.72111
FR	Nouvelle-Aquitaine	PIS	Poitiers-Biard Airport	46.5877	0.306666
FR	Provence-Alpes-Cote-d'Azur	CTT	Le Castellet Airport	43.2525	5.78519
FR	Nouvelle-Aquitaine	PUF	Pau Pyrenees Airport	43.38	-0.418611
FR	Bretagne	MXN	Morlaix - Ploujean Airport	48.6032	-3.81578
FR	Bretagne	VNE	Meucon Airport	47.7233	-2.71856
FR	Ile-de-France	TNF	Toussus-le-Noble Airport	48.7519	2.10619
FR	Auvergne-Rhone-Alpes	XBK	Bourg Ã¢â‚¬â€œ CeyzÃƒÂ©riat Airport	46.2056	5.29167
FR	Auvergne-Rhone-Alpes	XMU	Moulins Ã¢â‚¬â€œ Montbeugny Airport	46.5344	3.42167
FR	Grand-Est	XCZ	Charleville-MÃƒÂ©ziÃƒÂ¨res Aerodrome	49.7827	4.64118
FR	Provence-Alpes-Cote-d'Azur	QIE	Istres-Le TubÃƒÂ© Air Base	43.5244	4.94167
FR	Ile-de-France	CDG	Paris Charles de Gaulle Airport	49.0097	2.54778
GA	Estuaire	LBV	LÃƒÂ©on-Mba International Airport	0.458611	9.41222
GA	Ogooue-Maritime	OUU	Ouanga Airport	-2.98333	10.3
GA	Ogooue-Maritime	OMB	Omboue Hospital Airport	-1.57473	9.26269
GA	Ogooue-Maritime	WNE	Wora na Yeno Airport	-1.35	9.33333
GA	Ogooue-Maritime	BAW	Biawonque Airport	-0.666667	9.45
GA	Ogooue-Ivindo	WGY	Wagny Airport	-0.6035	12.2608
GA	Haut-Ogooue	AKE	Akieni Airport	-1.13967	13.9036
GA	Ngounie	FOU	Fougamou Airport	-1.283	10.617
GA	Ogooue-Maritime	AWE	Alowe Airport	-0.545	9.444
GA	Ogooue-Ivindo	BGB	Booue Airport	-0.1075	11.9438
GA	Woleu-Ntem	BMM	Bitam Airport	2.07564	11.4932
GA	Haut-Ogooue	LEO	Lekoni Airport	-1.5724	14.2878
GA	Ogooue-Ivindo	GAX	Gamba Airport	-2.78528	10.0472
GA	Nyanga	MYB	Mayumba Airport	-3.45842	10.6741
GA	Moyen-Ogooue	GKO	Kongo Boumba Airport	-0.0833333	11.4667
GA	Ogooue-Lolo	KOU	Koulamoutou Airport	-1.18461	12.4413
GA	Ngounie	MGO	Manega Airport	-1.73333	10.2167
GA	Woleu-Ntem	MVX	Minvoul Airport	2.15	12.133
GA	Woleu-Ntem	MZC	Mitzic Airport	0.783	11.55
GA	Estuaire	LBV	Libreville International Airport	0.4586	9.41228
GA	Haut-Ogooue	OKN	Okondja Airport	-0.665214	13.6731
GA	Moyen-Ogooue	GIM	Miele Mimbale Airport	-0.0166667	11.4
GA	Estuaire	OWE	Owendo Airport	0.3	9.5
GA	Ogooue-Ivindo	MKU	Makokou Airport	0.579211	12.8909
GA	Haut-Ogooue	MFF	Moanda Airport	-1.533	13.267
GA	Moyen-Ogooue	LBQ	Lambarene Airport	-0.704389	10.2457
GA	Ogooue-Maritime	POG	Port-Gentil International Airport	-0.711739	8.75438
GA	Ogooue-Maritime	IGE	Tchongorove Airport	-1.9223	9.3092
GA	Moyen-Ogooue	MVG	Mevang Airport	0.08333	11.0833
GA	Ogooue-Ivindo	MKB	Mekambo Airport	1.017	13.933
GA	Haut-Ogooue	MVB	M'Vengue El Hadj Omar Bongo Ondimba International Airport	-1.65616	13.438
GA	Nyanga	TCH	Tchibanga Airport	-2.85	11.017
GA	Ogooue-Lolo	LTL	Lastourville Airport	-0.826667	12.7486
GA	Estuaire	NKA	Nkan Airport	0.7	9.98333
GA	Ogooue-Maritime	BGP	Bongo Airport	-2.1713	10.2088
GA	Ngounie	KDN	Ndende Airport	-2.4	11.367
GA	Ngounie	MBC	Mbigou Airport	-1.883	11.933
GA	Moyen-Ogooue	KDJ	Ndjole Ville Airport	-0.183	10.75
GA	Ngounie	MJL	Mouila Airport	-1.84514	11.0567
GA	Woleu-Ntem	MDV	Medouneu Airport	1.0085	10.7552
GA	Woleu-Ntem	OYE	Oyem Airport	1.54311	11.5814
GA	Nyanga	MGX	Moabi Airport	-2.433	11
GB	England	MME	Teesside International Airport	54.5092	-1.42941
GB	Scotland	FSS	RAF Kinloss	57.6494	-3.56064
GB	Scotland	OBN	Oban Airport (North Connel Airport)	56.4635	-5.39967
GB	Northern Ireland	BHD	George Best Belfast City Airport	54.6181	-5.8725
GB	Scotland	TRE	Tiree Airport	56.4992	-6.86917
GB	England	NWI	Norwich International Airport	52.6758	1.28278
GB	England	RCS	Rochester Airport	51.3519	0.503333
GB	England	HUY	Humberside Airport	53.5744	-0.350833
GB	England	FFD	RAF Fairford	51.6822	-1.79003
GB	Northern Ireland	BFS	Belfast International Airport	54.6575	-6.21583
GB	Scotland	ABZ	Aberdeen Airport	57.2019	-2.19778
GB	England	LBA	Leeds Bradford Airport	53.8659	-1.66057
GB	Scotland	NRL	North Ronaldsay Airport	59.3675	-2.43444
GB	England	NQY	Cornwall Airport Newquay	50.4406	-4.99541
GB	Scotland	SKL	Broadford Airfield	57.2414	-5.90966
GB	England	NQT	Nottingham Airport	52.92	-1.07917
GB	England	BEX	RAF Benson	51.6164	-1.09583
GB	Northern Ireland	LDY	City of Derry Airport	55.0428	-7.16111
GB	Scotland	ADX	RAF Leuchars	56.3729	-2.86844
GB	England	BEQ	RAF Honington	52.3426	0.772939
GB	England	DSA	Robin Hood Airport Doncaster Sheffield	53.4805	-1.01066
GB	Scotland	WRY	Westray Airport	59.3503	-2.95
GB	England	LEQ	Land's End Airport	50.1028	-5.67056
GB	England	HRT	RAF Linton-on-Ouse	54.0489	-1.25275
GB	Northern Ireland	BOL	Ballykelly Airfield (RAF Ballykelly)	55.0544	-7.02
GB	England	BBP	Bembridge Airport	50.6781	-1.10944
GB	England	BBS	Blackbushe Airport	51.3239	-0.8475
GB	Scotland	BEB	Benbecula Airport	57.4811	-7.36278
GB	Scotland	FOA	Foula Airfield	60.1217	-2.0532
GB	England	EXT	Exeter International Airport	50.7344	-3.41389
GB	England	LHB	Bruntingthorpe Aerodrome (Leicester Harboro'/Harbour Airport)	52.4908	-1.1312
GB	England	NHT	RAF Northolt	51.553	-0.418167
GB	England	FAB	Farnborough Airport	51.2758	-0.776333
GB	England	UPV	RAF Upavon	51.2862	-1.78202
GB	Scotland	NDY	Sanday Airport	59.2503	-2.57667
GB	England	OXF	Oxford Airport (London Oxford Airport)	51.8369	-1.32
GB	Scotland	DND	Dundee Airport	56.4525	-3.02583
GB	Scotland	DOC	Dornoch Airport	57.869	-4.023
GB	England	LKZ	RAF Lakenheath	52.4093	0.561
GB	England	NCL	Newcastle Airport	55.0375	-1.69167
GB	Scotland	LMO	RAF Lossiemouth	57.7052	-3.33917
GB	England	GLO	Gloucestershire Airport	51.8942	-2.16722
GB	England	WTN	RAF Waddington	53.1662	-0.523811
GB	England	LPL	Liverpool John Lennon Airport	53.3336	-2.84972
GB	England	LYE	RAF Lyneham	51.5051	-1.99343
GB	Northern Ireland	ENK	Enniskillen/St Angelo Airport	54.3989	-7.65167
GB	England	SQZ	RAF Scampton	53.3078	-0.550833
GB	Scotland	PSV	Papa Stour Airport	60.3217	-1.69306
GB	Scotland	PSL	Perth Airport (Scone Airport)	56.4392	-3.37222
GB	England	LYX	Lydd Airport (London Ashford Airport)	50.9561	0.939167
GB	Scotland	BRR	Barra Airport	57.0228	-7.44306
GB	England	BOH	Bournemouth Airport	50.78	-1.8425
GB	Wales	CEG	Hawarden Airport (Chester Airport)	53.1781	-2.97778
GB	England	BLK	Blackpool Airport	53.7717	-3.02861
GB	Scotland	PPW	Papa Westray Airport	59.3517	-2.90028
GB	Scotland	COL	Coll Airport	56.6019	-6.61778
GB	England	MAN	Manchester Airport	53.3537	-2.27495
GB	Wales	VLY	Anglesey Airport / RAF Valley	53.2481	-4.53534
GB	England	QCY	RAF Coningsby	53.093	-0.166014
GB	Wales	SWS	Swansea Airport	51.6053	-4.06783
GB	England	CBG	Cambridge Airport	52.205	0.175
GB	England	QUG	Chichester/Goodwood Airport	50.8594	-0.759167
GB	England	QUY	RAF Wyton	52.3572	-0.107833
GB	England	ISC	St Mary's Airport	49.9133	-6.29167
GB	England	KNF	RAF Marham	52.6484	0.550692
GB	England	GBA	Cotswold Airport	51.6681	-2.05694
GB	England	CAX	Carlisle Lake District Airport	54.9375	-2.80917
GB	Scotland	GLA	Glasgow Airport	55.8719	-4.43306
GB	Scotland	CAL	Campbeltown Airport / RAF Machrihanish	55.4372	-5.68639
GB	England	EMA	East Midlands Airport	52.8311	-1.32806
GB	Scotland	SYY	Stornoway Airport	58.2156	-6.33111
GB	England	BRS	Bristol Airport	51.3827	-2.71909
GB	Scotland	SOY	Stronsay Airport	59.1553	-2.64139
GB	Scotland	OUK	Out Skerries Airport	60.4252	-0.75
GB	England	SOU	Southampton Airport	50.9503	-1.3568
GB	England	BZZ	RAF Brize Norton	51.75	-1.58362
GB	Scotland	CSA	Colonsay Airport	56.0575	-6.24306
GB	Scotland	EOI	Eday Airport	59.1906	-2.77222
GB	Wales	CWL	Cardiff Airport	51.3967	-3.34333
GB	Wales	HAW	Haverfordwest Aerodrome	51.8331	-4.96111
GB	Scotland	ILY	Islay Airport (Glenegedale Airport)	55.6819	-6.25667
GB	England	YEO	Royal Naval Air Station Yeovilton	51.0094	-2.63882
GB	England	BWF	Barrow/Walney Island Airport	54.1286	-3.2675
GB	Scotland	INV	Inverness Airport	57.5425	-4.0475
GB	Scotland	WHS	Whalsay Airstrip	60.3775	-0.925556
GB	Scotland	PIK	Glasgow Prestwick Airport	55.5094	-4.58667
GB	Scotland	WIC	Wick Airport	58.4589	-3.09306
GB	England	CVT	Coventry Airport	52.3697	-1.47972
GB	England	MHZ	RAF Mildenhall	52.3619	0.486406
GB	Scotland	KOI	Kirkwall Airport	58.9578	-2.905
GB	England	ORM	Sywell Aerodrome	52.3053	-0.793056
GB	Scotland	EDI	Edinburgh Airport	55.95	-3.3725
GB	Scotland	FIE	Fair Isle Airport	59.5358	-1.62806
GB	England	BHX	Birmingham Airport	52.4539	-1.74803
GB	England	ODH	RAF Odiham	51.2341	-0.942825
GB	Guernsey	ACI	Alderney Airport	49.7067	-2.21444
GB	West Sussex	ESH	Brighton City Airport	50.8356	-0.297222
GB	South Gloucestershire	FZO	Bristol Filton Airport	51.5194	-2.59361
GB	Great Britain	GCI	Guernsey Airport	49.4347	-2.60194
GB	Buckinghamshire	HYC	Wycombe Air Park Airport	51.6117	-0.808333
GB	Kent	MSE	Manston Airport	51.3422	1.34611
GB	Rutland	OKH	RAF Cottesmore	52.7294	-0.651389
GB	Devon	PLH	Plymouth City Airport	50.4228	-4.10583
GB	Lancashire	WRT	Warton Aerodrome	53.745	-2.88389
GB	England	QFO	Duxford Aerodrome	52.0908	0.131944
GB	England	BQH	London Biggin Hill Airport	51.3308	0.0325
GB	England	QLA	Lasham Airfield	51.1872	-1.03361
GB	England	KRH	Redhill Aerodrome	51.2136	-0.138611
GB	England	IOM	Isle of Man Airport	54.0833	-4.62333
GB	Scotland	UNT	Baltasound Airport	60.7469	-0.854722
GB	Scotland	LSI	Sumburgh Airport	59.8814	-1.29389
GB	Scotland	LWK	Tingwall Airport	60.1919	-1.24361
GB	England	LCY	London City Airport	51.5053	0.055278
GB	England	LHR	Heathrow Airport	51.4775	-0.461389
GB	England	LGW	Gatwick Airport	51.1481	-0.190278
GB	England	LTN	London Luton Airport	51.8747	-0.368333
GB	England	STN	London Stansted Airport	51.885	0.235
GB	England	SEN	London Southend Airport	51.5703	0.693333
GD	Saint George	GND	Maurice Bishop International Airport	12.0042	-61.7862
GD	Southern Grenadine Islands	CRU	Lauriston Airport (Carriacou Island Airport)	12.4761	-61.4728
GE	Imereti	KUT	David the Builder Kutaisi International Airport	42.1767	42.4826
GE	Abkhazia	SUI	Sukhumi Babushara Airport (Dranda Airport)	42.8582	41.1281
GE	Ajaria	BUS	Batumi International Airport (Alexander Kartveli Batumi Int'l Airport)	41.6103	41.5997
GE	Tbilisi	TBS	Tbilisi International Airport	41.6692	44.9547
GF	Guyane	CAY	Cayenne - Felix Eboue Airport	4.81981	-52.3604
GF	Guyane	OYP	Saint-Georges-de-l'Oyapock Airport	3.8976	-51.8041
GF	Guyane	XAU	Saul Airport	3.61361	-53.2042
GF	Guyane	REI	Regina Airport	4.31472	-52.1317
GF	Guyane	LDX	Saint-Laurent-du-Maroni Airport	5.48306	-54.0344
GF	Guyane	GSI	Grand-Santi Airport	4.28583	-54.3731
GF	Guyane	MPY	Maripasoula Airport	3.6575	-54.0372
GH	Northern	TML	Tamale Airport	9.55719	-0.863214
GH	Brong-Ahafo	NYI	Sunyani Airport	7.36183	-2.32876
GH	Western	TKD	Takoradi Airport	4.89606	-1.77476
GH	Greater Accra	ACC	Kotoka International Airport	5.60519	-0.166786
GH	Ashanti	KMS	Kumasi Airport	6.71456	-1.59082
GI	Gibraltar	GIB	Gibraltar International Airport (North Front Airport)	36.1512	-5.34966
GL	Kommuneqarfik Sermersooq	GOH	Nuuk Airport	64.1909	-51.6781
GL	Avannaata Kommunia	JUV	Upernavik Airport	72.7902	-56.1306
GL	Kommuneqarfik Sermersooq	CNP	Nerlerit Inaat Airport	70.7431	-22.6505
GL	Kommune Kujalleq	UAK	Narsarsuaq Airport	61.1605	-45.426
GL	Avannaata Kommunia	JQA	Qaarsut Airport (Uummannaq/Qaarsut Airport)	70.7342	-52.6962
GL	Kommune Qeqertalik	JCH	Qasigiannguit Heliport	68.8228	-51.1734
GL	Avannaata Kommunia	UMD	Uummannaq Heliport	70.6804	-52.1116
GL	Kommuneqarfik Sermersooq	KUS	Kulusuk Airport	65.5736	-37.1236
GL	Qeqqata Kommunia	JHS	Sisimiut Airport	66.9513	-53.7293
GL	Kommune Qeqertalik	JEG	Aasiaat Airport	68.7218	-52.7847
GL	Avannaata Kommunia	NAQ	Qaanaaq Airport	77.4886	-69.3887
GL	Avannaata Kommunia	THU	Pituffik Space Base	76.5312	-68.7032
GL	Qeqqata Kommunia	SFJ	Kangerlussuaq Airport	67.0122	-50.7116
GL	Kommuneqarfik Sermersooq	JFR	Paamiut Airport	62.0147	-49.6709
GL	Qeqqata Kommunia	JSU	Maniitsoq Airport	65.4125	-52.9394
GL	Avannaata Kommunia	JAV	Ilulissat Airport	69.2432	-51.0571
GM	Banjul	BJL	Banjul International Airport	13.338	-16.6522
GN	Conakry	CKY	Conakry International Airport (Gbessia Int'l Airport)	9.57689	-13.612
GN	Faranah	FIG	Fria Airport	10.3506	-13.5692
GN	Kankan	KNN	Kankan Airport (Diankana Airport)	10.4484	-9.22876
GN	Boke	BKJ	Boke Baralande Airport	10.9658	-14.2811
GN	Nzerekore	MCA	Macenta Airport	8.48186	-9.52507
GN	Boke	SBI	Sambailo Airport	12.5727	-13.3585
GN	Nzerekore	NZE	Nzerekore Airport	7.80602	-8.7018
GN	Labe	LEK	Tata Airport	11.3261	-12.2868
GN	Labe	KSI	Kissidougou Airport	9.16056	-10.1244
GN	Kankan	GII	Siguiri Airport	11.433	-9.167
GN	Faranah	FAA	Faranah Airport	10.0355	-10.7698
GN	Conakry	CKY	Ahmed SÃƒÂ©kou TourÃƒÂ© International Airport	9.57689	-13.612
GP	Guadeloupe	PTP	Pointe-a-Pitre International Airport (Le Raizet Airport)	16.2653	-61.5318
GP	Guadeloupe	LSS	Les Saintes Airport	15.8644	-61.5806
GP	Guadeloupe	BBR	Baillif Airport	16.0133	-61.7422
GP	Guadeloupe	DSD	La Desirade Airport (Grande-Anse Airport)	16.2969	-61.0844
GP	Guadeloupe	SFC	Saint-Francois Airport	16.2578	-61.2625
GP	Guadeloupe	GBJ	Marie-Galante Airport (Les Bases)	15.8687	-61.27
GQ	Litoral	BSG	Bata Airport	1.90547	9.80568
GQ	Bioko Norte	SSG	Malabo International Airport (Saint Isabel Airport)	3.75527	8.70872
GQ	Annobon	NBN	Annobon Air	-1.41028	5.62194
GQ	Litoral	OCS	Corisco International Airport	0.9125	9.3304
GQ	Wele-Nzas	GEM	President Obiang Nguema International Airport	1.68533	11.0244
GR	Thessalia	LRA	Larissa National Airport	39.6503	22.4655
GR	Notio Aigaio	KZS	Kastellorizo Island Public Airport	36.1417	29.5764
GR	Thessalia	JSI	Skiathos Island National Airport	39.1771	23.5037
GR	Attiki	ATH	Athens International Airport (Eleftherios Venizelos Airport)	37.9364	23.9445
GR	Anatoliki Makedonia kai Thraki	KVA	Kavala International Airport (Alexander the Great Airport)	40.9133	24.6192
GR	Dytiki Makedonia	KZI	Kozani National Airport (Filippos Airport)	40.2861	21.8408
GR	Kriti	JSH	Sitia Public Airport	35.2161	26.1013
GR	Notio Aigaio	LRS	Leros Municipal Airport	37.1849	26.8003
GR	Notio Aigaio	JTY	Astypalaia Island National Airport	36.5799	26.3758
GR	Voreio Aigaio	JKH	Chios Island National Airport	38.3432	26.1406
GR	Notio Aigaio	JKL	Kalymnos Island National Airport	36.9633	26.9406
GR	Attiki	KIT	Kithira Island National Airport	36.2743	23.017
GR	Notio Aigaio	JTR	Santorini (Thira) National Airport	36.3992	25.4793
GR	Thessalia	VOL	Nea Anchialos National Airport	39.2196	22.7943
GR	Notio Aigaio	RHO	Rhodes International Airport	36.4054	28.0862
GR	Ionia Nisia	PVK	Aktion National Airport	38.9255	20.7653
GR	Notio Aigaio	JMK	Mykonos Island National Airport	37.4351	25.3481
GR	Peloponnisos	SPJ	Sparti Airport	36.9739	22.5263
GR	Voreio Aigaio	SMI	Samos International Airport	37.69	26.9117
GR	Dytiki Ellada	PYR	Andravida Air Base	37.9207	21.2926
GR	Dytiki Ellada	AGQ	Agrinion Airport	38.602	21.3512
GR	Kriti	HER	Heraklion International Airport (Nikos Kazantzakis Airport)	35.3397	25.1803
GR	Notio Aigaio	JNX	Naxos Island National Airport	37.0811	25.3681
GR	Ionia Nisia	EFL	Kefalonia International Airport	38.1201	20.5005
GR	Sterea Ellada	SKU	Skyros Island National Airport	38.9676	24.4872
GR	Kentriki Makedonia	SKG	Thessaloniki Airport	40.5197	22.9709
GR	Peloponnisos	KLX	Kalamata International Airport	37.0683	22.0255
GR	Anatoliki Makedonia kai Thraki	AXD	Alexandroupoli Airport (Dimokritos Airport)	40.8559	25.9563
GR	Notio Aigaio	JSY	Syros Island National Airport	37.4228	24.9509
GR	Dytiki Makedonia	KSO	Kastoria National Airport (Aristotelis Airport)	40.4463	21.2822
GR	Ionia Nisia	ZTH	Zakynthos International Airport (Dionysios SolomosAirport)	37.7509	20.8843
GR	Kriti	CHQ	Chania International Airport	35.5317	24.1497
GR	Voreio Aigaio	LXS	Lemnos International Airport	39.9171	25.2363
GR	Notio Aigaio	KSJ	Kasos Island Public Airport	35.4214	26.91
GR	Ionia Nisia	CFU	Corfu International Airport (Ioannis Kapodistrias Int'l Airport)	39.6019	19.9117
GR	Voreio Aigaio	JIK	Ikaria Island National Airport	37.6827	26.3471
GR	Notio Aigaio	AOK	Karpathos Island National Airport	35.4214	27.146
GR	Notio Aigaio	PAS	Paros National Airport	37.0205	25.1132
GR	Notio Aigaio	MLO	Milos Island National Airport	36.6969	24.4769
GR	Ipeiros	IOA	Ioannina National Airport	39.6964	20.8225
GR	Voreio Aigaio	MJT	Mytilene International Airport	39.0567	26.5983
GR	Notio Aigaio	KGS	Kos Island International Airport	36.7933	27.0917
GR	Dytiki Ellada	GPA	Araxos Airport	38.1511	21.4256
GR	Peloponnese	PKH	Porto Cheli Airport	37.2988	23.149
GT	Quetzaltenango	AAZ	Quetzaltenango Airport	14.8656	-91.502
GT	Escuintla	ENJ	El Naranjo Airport	14.1069	-90.8175
GT	Alta Verapaz	CBV	Coban Airport	15.469	-90.4067
GT	Peten	PON	Poptun Airport	16.3258	-89.4161
GT	Peten	FRS	Mundo Maya International Airport	16.9138	-89.8664
GT	Peten	DON	Dos Lagunas Airport	17.6124	-89.6884
GT	Zacapa	LOX	Los Tablones Airport	14.5833	-90.5275
GT	Peten	CMM	Carmelita Airport	17.4612	-90.0537
GT	Peten	UAX	Uaxactun Airport	17.3939	-89.6327
GT	Quetzaltenango	CTF	Coatepeque Airport	14.6942	-91.8825
GT	Huehuetenango	HUG	Huehuetenango Airport	15.3274	-91.4624
GT	Quiche	AQB	Quiche Airport	15.0122	-91.1506
GT	Alta Verapaz	RUV	Rubelsanto Airport	15.992	-90.4453
GT	Izabal	PBR	Puerto Barrios Airport	15.7309	-88.5838
GT	Retalhuleu	RER	Retalhuleu Airport	14.521	-91.6973
GT	Izabal	LCF	Rio Dulce Airport (Las Vegas Airport)	15.6684	-88.9618
GT	Escuintla	GSJ	San Jose Airport	13.9362	-90.8358
GT	Chiquimula	CIQ	Chiquimula Airport	14.8309	-89.5209
GT	Guatemala	GUA	La Aurora International Airport	14.5833	-90.5275
GT	Quiche	PKJ	Playa Grande Airport	15.9975	-90.7417
GT	Guatemala	GUA	La Aurora International Airport	14.5817	-90.5267
GU	Hagatna	GUM	Antonio B. Won Pat International Airport	13.4839	144.797
GU	Barrigada	GUM	Antonio B. Won Pat International Airport (Guam Int'l)	13.4834	144.796
GU	Yigo	UAM	Andersen Air Force Base	13.584	144.93
GW	Bolama	BQE	Bubaque Airport	11.2974	-15.8381
GW	Bissau	OXB	Osvaldo Vieira International Airport	11.8948	-15.6537
GY	Essequibo Islands-West Demerara	SDC	Sand Creek Airport	2.9913	-59.51
GY	Demerara-Mahaica	OGL	Eugene F. Correia International Airport	6.80628	-58.1059
GY	Essequibo Islands-West Demerara	PIQ	Pipillipai Airport	5.33333	-60.3333
GY	Barima-Waini	MWJ	Matthews Ridge Airport	7.48811	-60.1848
GY	Essequibo Islands-West Demerara	VEG	Maikwak Airport	4.89817	-59.817
GY	Essequibo Islands-West Demerara	EKE	Ekereku Airport	6.66667	-60.85
GY	Potaro-Siparuni	KTO	Kato Airport	4.64916	-59.8322
GY	Potaro-Siparuni	ORJ	Orinduik Airport	4.72527	-60.035
GY	Upper Takutu-Upper Essequibo	LTM	Lethem Airport	3.37276	-59.7894
GY	Potaro-Siparuni	PMT	Paramakatoi Airport	4.6975	-59.7125
GY	Essequibo Islands-West Demerara	KKG	Konawaruk Airport	5.2684	-58.995
GY	Upper Takutu-Upper Essequibo	NAI	Annai Airport	3.95944	-59.1242
GY	Upper Takutu-Upper Essequibo	LUB	Lumid Pau Airport	2.39393	-59.441
GY	Demerara-Mahaica	GEO	Cheddi Jagan International Airport	6.49855	-58.2541
GY	East Berbice-Corentyne	SKM	Skeldon Airport	5.8599	-57.1489
GY	Potaro-Siparuni	MHA	Mahdia Airport	5.27749	-59.1511
GY	Upper Takutu-Upper Essequibo	AHL	Aishalton Airport	2.48653	-59.3134
GY	Upper Takutu-Upper Essequibo	KRM	Karanambo Airport	3.75194	-59.3097
GY	Cuyuni-Mazaruni	KPG	Kurupung Airport	6.46667	-59.1667
GY	Cuyuni-Mazaruni	GFO	Bartica Airport	6.35886	-58.6552
GY	Barima-Waini	PKM	Port Kaituma Airstrip	8.333	-59.633
GY	Barima-Waini	BMJ	Baramita Airport	7.37012	-60.488
GY	Potaro-Siparuni	MYM	Monkey Mountain Airport	4.48333	-59.6833
GY	Barima-Waini	BCG	Bemichi Airport	7.7	-59.1667
GY	Upper Takutu-Upper Essequibo	KRG	Karasabai Airport	4.03333	-59.5333
GY	Cuyuni-Mazaruni	KAR	Kamarang Airport	5.86534	-60.6142
GY	Potaro-Siparuni	KAI	Kaieteur International Airport	5.17275	-59.4915
GY	Cuyuni-Mazaruni	IMB	Imbaimadai Airport	5.70811	-60.2942
GY	Barima-Waini	USI	Mabaruma Airport	8.2	-59.7833
GY	Cuyuni-Mazaruni	PRR	Paruima Airport	5.81545	-61.0554
HK	Hong Kong	MFM	Macau International Airport	22.1496	113.592
HK	Hong Kong	HKG	Hong Kong International Airport (Chek Lap Kok Airport)	22.3089	113.915
HN	Olancho	LUI	La Union Airport	15.0332	-86.6923
HN	Comayagua	XPL	Soto Cano Air Base	14.3824	-87.6212
HN	Lempira	EDQ	Erandique Airport	14.2358	-88.4372
HN	Yoro	SCD	Sulaco Airport	14.9072	-87.2634
HN	Cortes	SAP	Ramon Villeda Morales International Airport	15.4526	-87.9236
HN	Yoro	OAN	El Arrayan Airport	15.5056	-86.5747
HN	Colon	LMH	Limon Airport	14.3819	-87.6211
HN	Colon	TJI	Trujillo Airport (Capiro Airport)	15.9268	-85.9382
HN	Gracias a Dios	AHS	Ahuas Airport	15.4722	-84.3522
HN	Islas de la Bahia	GJA	Guanaja Airport	16.4454	-85.9066
HN	Yoro	CYL	Coyoles Airport	15.4456	-86.6753
HN	Olancho	CAA	El Aguacate Airport	14.917	-85.9
HN	Cortes	LLH	Las Limas Airport	15.4422	-87.8988
HN	La Paz	MRJ	Marcala Airport	14.1619	-88.0344
HN	Colon	IRN	Iriona Airport	15.9392	-85.1372
HN	Yoro	ORO	Yoro Airport	15.1275	-87.135
HN	Islas de la Bahia	UII	Utila Airport	16.1131	-86.8803
HN	Atlantida	TEA	Tela Airport	15.7759	-87.4758
HN	Gracias a Dios	BHG	Brus Laguna Airport	15.7631	-84.5436
HN	Francisco Morazan	TGU	Toncontin International Airport	14.0609	-87.2172
HN	Atlantida	LCE	Goloson International Airport	15.7425	-86.853
HN	Gracias a Dios	PEU	Puerto Lempira Airport	15.2622	-83.7812
HN	Colon	TCF	Tocoa Airport	15.65	-85.983
HN	Olancho	JUT	Juticalpa Airport	14.6526	-86.2203
HN	Gracias a Dios	CDD	Cauquira Airport	15.3167	-83.5917
HN	Copan	RUY	Copan Ruinas Airport	14.9149	-89.0078
HN	Copan	SDH	Santa Rosa de Copan Airport	14.7779	-88.775
HN	Lempira	GAC	Gracias Airport	14.5735	-88.5958
HN	Islas de la Bahia	RTB	Juan Manuel Galvez International Airport	16.3168	-86.523
HN	Gracias a Dios	PCH	Palacios Airport	15.955	-84.9414
HN	Intibuca	LEZ	La Esperanza Airport	14.2911	-88.175
HN	Comayagua	TGU	ToncontÃƒÂ­n International Airport	14.0617	-87.2169
HR	Primorsko-goranska zupanija	LSZ	Losinj Airport	44.5658	14.3931
HR	Grad Zagreb	ZAG	Zagreb Airport	45.7429	16.0688
HR	Zadarska zupanija	ZAD	Zadar Airport	44.1083	15.3467
HR	Splitsko-dalmatinska zupanija	SPU	Split Airport	43.5389	16.298
HR	Primorsko-goranska zupanija	RJK	Rijeka Airport	45.2169	14.5703
HR	Splitsko-dalmatinska zupanija	BWK	Bol Airport (Brac Airport)	43.2857	16.6797
HR	Osjecko-baranjska zupanija	OSI	Osijek Airport	45.4627	18.8102
HR	Istarska zupanija	PUY	Pula Airport	44.8935	13.9222
HR	Dubrovacko-neretvanska zupanija	DBV	Dubrovnik Airport	42.5614	18.2682
HT	Nord-Ouest	PAX	Port-de-Paix Airport	19.9336	-72.8486
HT	Sud-Est	JAK	Jacmel Airport	18.2411	-72.5185
HT	Nord	CAP	Hugo Chavez International Airport	19.733	-72.1947
HT	Ouest	PAP	Toussaint L'Ouverture International Airport	18.58	-72.2925
HT	Grande'Anse	JEE	Jeremie Airport	18.6631	-74.1703
HT	Sud	CYA	Antoine-Simon Airport	18.2711	-73.7883
HT	Ouest	PAP	Toussaint Louverture International Airport	18.58	-72.2925
HU	Baranya	PEV	Pecs-Pogany International Airport	45.9909	18.241
HU	Gyor-Moson-Sopron	MCQ	Miskolc Airport	48.1369	20.7914
HU	Hajdu-Bihar	DEB	Debrecen International Airport	47.4889	21.6153
HU	Budapest	BUD	Budapest Ferenc Liszt International Airport	47.4298	19.2611
HU	Zala	SOB	Heviz-Balaton Airport	46.6864	17.1591
ID	Papua	WSR	Wasior Airport	-2.721	134.506
ID	Maluku	AHI	Amahai Airport	-3.348	128.926
ID	Jawa Tengah	YIA	Yogyakarta International Airport	-7.90534	110.057
ID	Kepulauan Riau	BTH	Hang Nadim Airport	1.12103	104.119
ID	Papua	ZEG	Senggo Airport	-5.6908	139.35
ID	Lampung	AKQ	Gunung Batin Airport	-4.61114	105.232
ID	Sulawesi Selatan	MOH	Maleo Airport	-2.20333	121.66
ID	Sulawesi Utara	KNO	Kualanamu International Airport	3.64222	98.8853
ID	Jambi	MPC	Muko-Muko Airport	-2.54186	101.088
ID	Nusa Tenggara Timur	MOF	Frans Seda Airport (Wai Oti Airport)	-8.64065	122.237
ID	Sumatera Selatan	PDO	Pendopo Airport	-3.28607	103.88
ID	Maluku	AMQ	Pattimura Airport	-3.71026	128.089
ID	Papua	SEH	Senggeh Airport	-3.45	140.779
ID	Sulawesi Utara	MNA	Melangguane Airport	4.00694	126.673
ID	Kalimantan Utara	NAF	Banaina Airport	2.72305	117.126
ID	Papua Barat	KNG	Kaimana Airport	-3.64452	133.696
ID	Sulawesi Selatan	SQR	Soroako Airport	-2.5312	121.358
ID	Maluku Utara	OTI	Pitu Airport	2.04599	128.325
ID	Jawa Timur	MSI	Masalembo Airport	-5.58333	114.433
ID	Jawa Timur	MLG	Abdul Rachman Saleh Airport	-7.92656	112.715
ID	Papua	MUF	Muting Airport	-7.3147	140.567
ID	Papua Barat	MKW	Rendani Airport	-0.891833	134.049
ID	Kepulauan Bangka Belitung	MWK	Matak Airport (Tarempa Airport)	3.34812	106.258
ID	Papua	MKQ	Mopah Airport	-8.52029	140.418
ID	Maluku Utara	SQN	Sanana Airport	-2.08051	125.967
ID	Sulawesi Utara	MDC	Sam Ratulangi International Airport	1.54926	124.926
ID	Papua Barat	RSK	Abresso Airport	-1.49677	134.175
ID	Sulawesi Barat	MJU	Tampa Padang Airport	-2.58333	119.033
ID	Nusa Tenggara Timur	RTG	Frans Sales Lega Airport	-8.59701	120.477
ID	Aceh	MEQ	Cut Nyak Dhien Airport	4.25	96.217
ID	Nusa Tenggara Timur	RTI	David Constantijn Saudale Airport	-10.7673	123.075
ID	Sulawesi Utara	MES	Soewondo Air Force Base	3.55917	98.6711
ID	Sumatera Barat	PPR	Tuanku Tambusai Airport	0.845431	100.37
ID	Papua	MDP	Mindiptana Airport	-5.75	140.367
ID	Papua	RUF	Yuruf Airport	-3.6333	140.958
ID	Maluku Utara	MAL	Mangole Airport	-1.87579	125.83
ID	Riau	SEQ	Sei Pakning Airport	1.37	102.14
ID	Nusa Tenggara Barat	LYK	Lunyuk Airport	-8.9889	117.216
ID	Papua	NKD	Sinak Airport	-3.822	137.841
ID	Nusa Tenggara Timur	LWE	Wonopito Airport	-8.3629	123.438
ID	Kalimantan Tengah	NPO	Nanga Pinoh Airport	-0.348869	111.748
ID	Sulawesi Tengah	LUW	Syukuran Aminuddin Amir Airport	-1.03892	122.772
ID	Papua Barat	NTI	Stenkol Airport	-2.1033	133.516
ID	Aceh	LSX	Lhok Sukon Airport	5.06951	97.2592
ID	Jawa Tengah	PWL	Wirasaba Airport	-7.46167	109.417
ID	Aceh	LSW	Malikus Saleh Airport	5.22668	96.9503
ID	Kalimantan Timur	SGQ	Sangkimah Airport	0.3847	117.543
ID	Papua	LLN	Kelila Airport	-3.75	138.667
ID	Papua	OBD	Obano Airport	-3.9106	136.231
ID	Nusa Tenggara Timur	LKA	Gewayantana Airport	-8.27442	123.002
ID	Sulawesi Tenggara	RAQ	Sugimanuru Airport	-4.76056	122.569
ID	Papua	LII	Mulia Airport	-3.7018	137.957
ID	Gorontalo	OJU	Tanjung Api Airport	-0.864417	121.623
ID	Papua	LHI	Lereh Airport	-3.0795	139.952
ID	Papua	OKL	Gunung Bintang Airport	-4.9071	140.628
ID	Jawa Tengah	KWB	Dewadaru Airport	-5.80091	110.478
ID	Aceh	SBG	Maimun Saleh Airport	5.87413	95.3397
ID	Jambi	KRC	Depati Parbo Airport	-2.093	101.468
ID	Papua	OKQ	Okaba Airport	-8.0946	139.723
ID	Papua	KOX	Kokonao Airport	-4.71075	136.435
ID	Riau	SIQ	Dabo Singkep Airport	-0.479189	104.579
ID	Kalimantan Timur	KOD	Kotabangun Airport	-0.26667	116.583
ID	Papua Barat	RDE	Merdey Airport (Jahabra Airport)	-1.58333	133.333
ID	Papua	KMM	Kimam Airport	-3.66667	136.167
ID	Papua	ONI	Moanamani Airport	-3.9834	136.083
ID	Aceh	KJX	Blangpidie Airport	3.73444	96.7911
ID	Bengkulu	RGT	Japura Airport	-0.352808	102.335
ID	Papua	KEI	Kepi Airport	-6.5418	139.332
ID	Papua Barat	RJM	Marinda Airport	-0.423056	130.773
ID	Papua	KCD	Kamur Airport	-6.1851	138.637
ID	Jawa Timur	SUP	Trunojoyo Airport	-7.0242	113.89
ID	Papua Barat	KBX	Kambuaya Airport	-1.3169	132.286
ID	Maluku Utara	TAX	Taliabu Airport	-1.64263	124.559
ID	Papua	KBF	Karubaga Airport	-3.684	138.479
ID	Kalimantan Tengah	TBM	Tumbang Samba Airport	-1.4694	113.083
ID	Papua	IUL	Ilu Airport	-3.7051	138.2
ID	Jambi	TJB	Sei Bati Airport	1.0527	103.393
ID	Papua	ILA	Illaga Airport	-3.97648	137.622
ID	Kalimantan Selatan	TJG	Warukin Airport	-2.21656	115.436
ID	Gorontalo	GTO	Jalaluddin Airport	0.637119	122.85
ID	Sulawesi Tengah	TLI	Sultan Bantilan Airport (Lalos Airport)	1.12343	120.794
ID	Sulawesi Selatan	UPG	Sultan Hasanuddin International Airport	-5.06163	119.554
ID	Papua	TMH	Tanah Merah Airport	-6.09922	140.298
ID	Kalimantan Timur	SRI	Temindung Airport	-0.484531	117.157
ID	Papua	TMY	Tiom Airport	-3.9256	138.456
ID	Jawa Tengah	SRG	Achmad Yani International Airport	-6.97273	110.375
ID	Kalimantan Timur	TNB	Tanah Grogot Airport	-1.91013	116.202
ID	Kalimantan Barat	SQG	Sintang Airport (Susilo Airport)	0.063619	111.473
ID	Sulawesi Tenggara	TQQ	Maranggo Airport	-5.76457	123.917
ID	Papua	EWI	Enarotali Airport	-3.9259	136.377
ID	Kalimantan Timur	TSX	Tanjung Santan Airport	-0.092973	117.453
ID	Nusa Tenggara Timur	ARD	Alor Island Airport	-8.13234	124.597
ID	Sulawesi Barat	TTR	Pongtiku Airport	-3.04474	119.822
ID	Bengkulu	BKS	Fatmawati Soekarno Airport	-3.8637	102.339
ID	Papua Barat	TXM	Teminabuan Airport	-1.44472	132.021
ID	Papua Barat	SOQ	Dominique Edward Osok Airport	-0.894	131.287
ID	Papua	ZRM	Sarmi Orai Airport	-1.86955	138.75
ID	Jawa Tengah	SOC	Adisumarmo International Airport	-7.51609	110.757
ID	Papua	UBR	Ubrub Airport	-3.67565	140.884
ID	Nusa Tenggara Timur	WGP	Mau Hau Airport (Umbu Mehang Kunda Airport)	-9.66922	120.302
ID	Papua	UGU	Bilogai Airport	-3.73956	137.032
ID	Kalimantan Tengah	SMQ	H. Asan Airport	-2.49919	112.975
ID	Gorontalo	UOL	Pogogul Airport	1.1027	121.414
ID	Riau	DUM	Pinang Kampai Airport	1.60919	101.434
ID	Papua	ZRI	Serui Airport	-1.87558	136.241
ID	Kalimantan Timur	DTD	Datadawai Airport	0.8106	114.531
ID	Papua	WAR	Waris Airport	-3.235	140.994
ID	Sulawesi Utara	DTB	Silangit Airport	2.25973	98.9919
ID	Maluku	WBA	Wahai Airport	-2.8114	129.484
ID	Papua	WMX	Wamena Airport	-4.10251	138.957
ID	Papua	WET	Waghete Airport	-4.04423	136.278
ID	Papua Barat	KEQ	Kebar Airport	-0.637101	133.128
ID	Nusa Tenggara Barat	BMU	Sultan Muhammad Salahudin Airport (Bima Airport)	-8.53965	118.687
ID	Bali	DPS	Ngurah Rai International Airport	-8.74817	115.167
ID	Sulawesi Utara	SIW	Sibisa Airport	2.66667	98.9333
ID	Maluku Utara	TTE	Sultan Babullah Airport	0.831414	127.381
ID	Sumatera Selatan	KLQ	Keluang Airport	-2.62353	103.955
ID	Sulawesi Tenggara	PUM	Kolaka Pomala Airport	-4.18109	121.618
ID	Sulawesi Tenggara	KDI	Wolter Monginsidi Airport	-4.08161	122.418
ID	Kalimantan Tengah	PKN	Iskandar Airport	-2.7052	111.673
ID	Papua Barat	INX	Inanwatan Airport	-2.1281	132.161
ID	Nusa Tenggara Timur	TMC	Tambolaka Airport (Waikabubak Airport)	-9.40972	119.244
ID	Sulawesi Utara	FLZ	Ferdinand Lumban Tobing Airport	1.55594	98.8889
ID	Papua Barat	FKQ	Fakfak Torea Airport	-2.92019	132.267
ID	Sumatera Barat	PDG	Minangkabau International Airport	-0.786917	100.281
ID	Sulawesi Tenggara	BUW	Betoambari Airport	-5.48688	122.569
ID	Kepulauan Riau	TNJ	Raja Haji Fisabilillah Airport	0.922683	104.532
ID	Kalimantan Utara	TPK	Teuku Cut Ali Airport	3.1707	97.2869
ID	Kepulauan Bangka Belitung	PGK	Depati Amir Airport	-2.1622	106.139
ID	Jawa Barat	CBN	Penggung Airport (Cakrabuwana Airport)	-6.75614	108.54
ID	Maluku	KAZ	Kao Airport	1.18528	127.896
ID	Jawa Tengah	CPF	Ngloram Airport	-7.19484	111.548
ID	Sumatera Barat	RKI	Rokot Airport	-0.95	100.75
ID	Nusa Tenggara Timur	BJW	Bajawa Soa Airport	-8.70743	121.057
ID	Maluku	BJK	Benjina Airport (Nangasuri Airport)	-6.0662	134.274
ID	Kalimantan Utara	LPU	Long Apung Airport	1.70449	114.97
ID	Banten	PPJ	Panjang Island Airport	-5.64444	106.562
ID	Kalimantan Barat	KTG	Rahadi Osman Airport (Ketapang Airport)	-1.81664	109.963
ID	Lampung	TKG	Radin Inten II Airport	-5.24056	105.176
ID	Papua	BIK	Frans Kaisiepo Airport	-1.19002	136.108
ID	Maluku	SXK	Saumlaki Airport (Olilit Airport)	-7.98861	131.306
ID	Kalimantan Utara	TJS	Tanjung Harapan Airport	2.83583	117.374
ID	Kepulauan Bangka Belitung	TJQ	H.A.S. Hanandjoeddin Airport (Buluh Tumbang Airport)	-2.74572	107.755
ID	Kalimantan Utara	TRK	Juwata International Airport	3.32667	117.569
ID	Sulawesi Utara	BJG	Kotamobagu Mopait Airport	-0.972896	122.145
ID	Kalimantan Utara	BYQ	Bunyu Airport	3.45572	117.867
ID	Yogyakarta	JOG	Adisucipto International Airport	-7.78818	110.432
ID	Maluku Utara	LAH	Oesman Sadik Airport	-0.635259	127.502
ID	Papua	DEX	Nop Goliath Airport	-4.8557	139.482
ID	Nusa Tenggara Timur	LBJ	Komodo Airport	-8.48666	119.889
ID	Papua	TIM	Mozes Kilangin Airport	-4.52828	136.887
ID	Kalimantan Timur	AAP	APT Pranoto International Airport	-0.374448	117.249
ID	Maluku	NRE	Namrole Airport	-3.8548	126.701
ID	Kalimantan Utara	LBW	Juvai Semaring Airport (Long Bawan Airport)	3.9028	115.692
ID	Papua	AAS	Apalapsili Airport	-3.8832	139.311
ID	Papua	ARJ	Arso Airport	-2.93333	140.783
ID	Kalimantan Selatan	KBU	Gusti Syamsir Alam Airport (Stagen Airport)	-3.29472	116.165
ID	Jawa Timur	SUB	Juanda International Airport	-7.37983	112.787
ID	Sulawesi Tengah	PSJ	Kasiguncu Airport	-1.41675	120.658
ID	Nusa Tenggara Timur	ENE	H. Hasan Aroeboesman Airport	-8.84929	121.661
ID	Kalimantan Utara	NNX	Nunukan Airport	4.13333	117.667
ID	Kepulauan Riau	NTX	Ranai Airport	3.90871	108.388
ID	Nusa Tenggara Timur	SAU	Tardamu Airport	-10.4924	121.848
ID	Jambi	DJB	Sultan Thaha Airport	-1.63802	103.644
ID	Papua	DJJ	Sentani Airport	-2.57695	140.516
ID	Kalimantan Timur	BEJ	Kalimarau Airport	2.1555	117.432
ID	Papua	FOO	Kornasoren Airport (Numfoor Airport)	-0.936325	134.872
ID	Maluku	GEB	Gebe Airport	-0.078889	129.458
ID	Papua	BUI	Bokondini Airport	-3.6822	138.676
ID	Bengkulu	BUU	Muara Bungo Airport	-1.1278	102.135
ID	Kalimantan Barat	PSU	Pangsuma Airport	0.835578	112.937
ID	Kalimantan Timur	BXT	PT Badak Bontang Airport	0.119691	117.475
ID	Papua	BXD	Bade Airport	-7.1759	139.583
ID	Sulawesi Tengah	PLW	Mutiara Airport	-0.918542	119.91
ID	Jawa Tengah	CXP	Tunggul Wulung Airport	-7.64506	109.034
ID	Papua	BXM	Batom Airport	-4.16667	140.85
ID	Jawa Barat	KJT	Kertajati International Airport	-6.64892	108.167
ID	Jawa Barat	CJN	Cijulang Nusawiru Airport	-7.71989	108.489
ID	Sumatera Selatan	PLM	Sultan Mahmud Badaruddin II International Airport	-2.89825	104.7
ID	Jawa Barat	BDO	Husein Sastranegara International Airport	-6.90063	107.576
ID	Papua Barat	BXB	Babo Airport	-2.53224	133.439
ID	Kalimantan Barat	PNK	Supadio Airport	-0.150711	109.404
ID	Kalimantan Selatan	BDJ	Syamsudin Noor Airport	-3.44236	114.763
ID	Maluku Utara	GLX	Gamarmalamo Airport	1.83833	127.786
ID	Maluku	NDA	Bandanaira Airport	-4.5214	129.905
ID	Kalimantan Tengah	PKY	Tjilik Riwut Airport	-2.22513	113.943
ID	Kalimantan Timur	BPN	Sultan Aji Muhammad Sulaiman Airport	-1.26827	116.894
ID	Jawa Timur	BWX	Blimbingsari Airport	-8.31015	114.34
ID	Sulawesi Selatan	LLO	Palopo Lagaligo Airport	-3.083	120.245
ID	Papua	NBX	Nabire Airport	-3.36818	135.496
ID	Papua	DRH	Dabra Airport	-3.2705	138.613
ID	Riau	PKU	Sultan Syarif Kasim II International Airport	0.460786	101.445
ID	Nusa Tenggara Barat	SWQ	Sultan Muhammad Kaharuddin III Airport (Brangbiji Airport)	-8.48904	117.412
ID	Maluku	DOB	Dobo Airport	-5.77222	134.212
ID	Maluku	NAM	Namlea Airport	-3.23557	127.1
ID	Papua	ELR	Elelim Airport	-3.7826	139.386
ID	Sulawesi Utara	GNS	Binaka Airport	1.16638	97.7047
ID	Sulawesi Utara	NAH	Naha Airport	3.68321	125.528
ID	Jawa Timur	JBB	Notohadinegoro Airport	-8.23806	113.694
ID	Papua	EWE	Ewer Airport	-5.494	138.083
ID	Jawa Barat	TSY	Tasikmalaya Airport	-7.3466	108.246
ID	Nusa Tenggara Barat	LOP	Lombok International Airport	-8.75732	116.277
ID	Papua Barat	GAV	Gag Island Airport	-0.400556	129.895
ID	Sulawesi Selatan	MXB	Andi Jemma Airport	-2.55803	120.324
ID	Kalimantan Selatan	BTW	Batu Licin Airport	-3.41241	115.995
ID	Nusa Tenggara Timur	ABU	A.A. Bere Tallo Airport	-9.07305	124.905
ID	Banten	PCB	Pondok Cabe Airport	-6.33696	106.765
ID	Nusa Tenggara Timur	KOE	El Tari Airport	-10.1716	123.671
ID	Sulawesi Utara	AEG	Aek Godang Airport	1.4001	99.4305
ID	Aceh	BTJ	Sultan Iskandar Muda International Airport	5.52287	95.4206
ID	Papua Barat	AGD	Anggi Airport	-1.3858	133.874
ID	Maluku	LUV	Karel Sadsuitubun Airport	-5.76028	132.759
ID	West Papua	AYW	Ayawasi Airport	-1.1593	132.463
ID	East Java	BXW	Bawean Airport	-5.72361	112.679
ID	South Sumatra	LLJ	Silampari Airport	-3.28	102.917
ID	West Nusa Tenggara	AMI	Selaparang Airport	-8.56056	116.094
ID	Banten	CGK	Soekarno-Hatta International Airport	-6.12556	106.656
IE	Mayo	NOC	Ireland West Airport Knock	53.9103	-8.81849
IE	Galway	GWY	Galway Airport	53.3002	-8.94159
IE	Kerry	KIR	Kerry Airport (Farranfore Airport)	52.1809	-9.52378
IE	Galway	IIA	Inishmaan Aerodrome	53.093	-9.56806
IE	Galway	INQ	Inisheer Aerodrome	53.0647	-9.5109
IE	Mayo	BLY	Belmullet Aerodrome	54.2228	-10.0308
IE	Clare	SNN	Shannon Airport	52.702	-8.92482
IE	Dublin	DUB	Dublin Airport	53.4213	-6.27007
IE	Waterford	WAT	Waterford Airport	52.1872	-7.08696
IE	Kilkenny	KKY	Kilkenny Airport	52.6508	-7.29611
IE	Cork	ORK	Cork Airport	51.8413	-8.49111
IE	Galway	NNR	Connemara Airport	53.2303	-9.46778
IE	Sligo	SXL	Sligo Airport	54.2802	-8.59921
IE	Galway	IOR	Inishmore Aerodrome (Kilronan Airport)	53.1067	-9.65361
IE	Cork	BYT	Bantry Aerodrome	51.6686	-9.48417
IE	Donegal	LTR	Letterkenny Airfield	54.9513	-7.67283
IE	Donegal	CFN	Donegal Airport	55.0442	-8.341
IL	HaDarom	ETH	J. Hozman Airport	29.5613	34.9601
IL	HaDarom	EIY	Ein Yahav Airfield	30.6217	35.2033
IL	HaDarom	MIP	Mitzpe Ramon Airport	30.7761	34.6667
IL	HaDarom	BEV	Beersheba Airport	31.287	34.723
IL	Yerushalayim	JRS	Atarot Airport (Jerusalem International Airport)	31.8647	35.2192
IL	HaDarom	ETM	Ramon Airport	29.7237	35.0114
IL	HaDarom	VDA	Ovda Airport	29.9403	34.9358
IL	Hefa	HFA	Haifa Airport (Uri Michaeli Airport)	32.8094	35.0431
IL	HaDarom	YOT	Yotvata Airfield	29.9011	35.0675
IL	HaTsafon	RPN	Rosh Pina Airport	32.981	35.5719
IL	Tel Aviv	SDV	Sde Dov Airport	32.1147	34.7822
IL	HaDarom	VTM	Nevatim Airbase	31.2083	35.0123
IL	HaDarom	MTZ	Bar Yehuda Airfield (Masada Airfield)	31.3282	35.3886
IL	Tel Aviv	TLV	Ben Gurion Airport	32.0114	34.8867
IL	HaTsafon	KSW	Kiryat Shmona Airport	33.2167	35.6
IN	Madhya Pradesh	REW	Churhata Airport	24.5034	81.2203
IN	Assam	RUP	Rupsi Airport	26.1397	89.91
IN	Gujarat	RAJ	Rajkot Airport	22.3092	70.7795
IN	Himachal Pradesh	SLV	Shimla Airport	31.0818	77.068
IN	Maharashtra	SSE	Solapur Airport	17.628	75.9348
IN	Arunachal Pradesh	ZER	Zero Airport (Ziro Airport)	27.5883	93.8281
IN	Karnataka	VDY	Vidyanagar Airport (Jindal Airport)	15.175	76.6349
IN	Gujarat	HUF	Terre Haute International Airport (Hulman Field)	39.4515	-87.3076
IN	Andhra Pradesh	PUT	Sri Sathya Sai Airport	14.1493	77.7911
IN	Madhya Pradesh	IDR	Devi Ahilyabai Holkar International Airport	22.7218	75.8011
IN	Jammu and Kashmir	RJI	Rajauri Airport	33.3779	74.3152
IN	Gujarat	RNZ	Jasper County Airport	40.9479	-87.1826
IN	Telangana	RMD	Ramagundam Airport (Basanth Nagar Airport)	18.701	79.3923
IN	Gujarat	SMD	Smith Field	41.1434	-85.1528
IN	Andhra Pradesh	VGA	Vijayawada Airport	16.5304	80.7968
IN	Kerala	TRV	Trivandrum International Airport	8.48212	76.9201
IN	Himachal Pradesh	DHM	Gaggal Airport	32.1651	76.2634
IN	Maharashtra	IXU	Aurangabad Airport (Chikkalthana Airport)	19.8627	75.3981
IN	Rajasthan	KQH	Ajmer Kishangarh Airport	26.6015	74.8141
IN	Gujarat	GFD	Pope Field	39.7903	-85.7361
IN	Gujarat	KKT	Kentland Municipal Airport	40.7587	-87.4282
IN	Rajasthan	KTU	Kota Airport	25.1602	75.8456
IN	Karnataka	HBX	Hubli Airport	15.3617	75.0849
IN	Telangana	WGC	Warangal Airport	17.9144	79.6022
IN	Tripura	IXH	Kailashahar Airport	24.3082	92.0072
IN	Bihar	GAY	Gaya Airport (Bodhgaya Airport)	24.7443	84.9512
IN	Jammu and Kashmir	SXR	Sheikh ul Alam International Airport	33.9871	74.7742
IN	Jharkhand	IXW	Sonari Airport	22.8132	86.1688
IN	Assam	TEZ	Tezpur Airport	26.7091	92.7847
IN	Assam	DIB	Dibrugarh Airport (Mohanbari Airport)	27.4839	95.0169
IN	Madhya Pradesh	GWL	Rajmata Vijaya Raje Scindia Airport (Gwalior Airport)	26.2933	78.2278
IN	Telangana	BPM	Begumpet Airport	17.4531	78.4676
IN	West Bengal	LDA	Malda Airport	25.033	88.133
IN	Madhya Pradesh	JLR	Jabalpur Airport (Dumna Airport)	23.1778	80.052
IN	Maharashtra	JLG	Jalgaon Airport	20.9614	75.6192
IN	Goa	GOI	Goa International Airport (Dabolim Airport)	15.3808	73.8314
IN	Odisha	PYB	Jeypore Airport	18.88	82.552
IN	Maharashtra	SAG	Shirdi Airport	19.6886	74.3789
IN	Gujarat	FWA	Fort Wayne International Airport	40.9785	-85.1951
IN	Madhya Pradesh	TNI	Satna Airport	24.5623	80.8549
IN	Uttarakhand	DED	Jolly Grant Airport	30.1897	78.1803
IN	Arunachal Pradesh	TEI	Tezu Airport	27.9412	96.1344
IN	Andhra Pradesh	RJA	Rajahmundry Airport	17.1104	81.8182
IN	West Bengal	RDP	Kazi Nazrul Islam Airport	23.6225	87.243
IN	Kerala	CCJ	Calicut International Airport	11.1368	75.9553
IN	Gujarat	IND	Indianapolis International Airport	39.7173	-86.2944
IN	Karnataka	BEP	Bellary Airport	15.1628	76.8828
IN	Uttarakhand	PGH	Pantnagar Airport	29.0334	79.4737
IN	Daman and Diu	DIU	Diu Airport	20.7131	70.9211
IN	Haryana	HSS	Hisar Airport	29.1794	75.7553
IN	Bihar	PAT	Lok Nayak Jayaprakash Airport	25.5913	85.088
IN	Gujarat	GUS	Grissom Air Reserve Base	40.6481	-86.1521
IN	Gujarat	VPZ	Porter County Regional Airport	41.454	-87.0071
IN	Tamil Nadu	TCR	Tuticorin Airport	8.72424	78.0258
IN	Gujarat	BMG	Monroe County Airport	39.146	-86.6167
IN	Madhya Pradesh	GUX	Guna Airport	24.6547	77.3473
IN	Assam	IXN	Khowai Airport	24.0619	91.6039
IN	Gujarat	RCR	Fulton County Airport	41.0656	-86.1817
IN	Assam	IXQ	Kamalpur Airport	24.1317	91.8142
IN	Andhra Pradesh	BEK	Bareilly Airport	28.4221	79.4508
IN	Daman and Diu	NMB	Daman Airport	20.4344	72.8432
IN	Odisha	BBI	Biju Patnaik International Airport	20.2444	85.8178
IN	Tamil Nadu	TRZ	Tiruchirappalli International Airport	10.7654	78.7097
IN	Maharashtra	BOM	Chhatrapati Shivaji International Airport	19.0887	72.8679
IN	Gujarat	STV	Surat Airport	21.1141	72.7418
IN	West Bengal	RGH	Balurghat Airport	25.2617	88.7956
IN	Gujarat	PBD	Porbandar Airport	21.6487	69.6572
IN	Jharkhand	DBD	Dhanbad Airport	23.834	86.4253
IN	Himachal Pradesh	KUU	Bhuntar Airport (Kullu Manali Airport)	31.8767	77.1544
IN	Gujarat	MIE	Delaware County Regional Airport	40.2423	-85.3959
IN	West Bengal	COH	Cooch Behar Airport	26.3305	89.4672
IN	Gujarat	SBN	South Bend International Airport	41.7087	-86.3173
IN	Andaman and Nicobar Islands	CBD	Car Nicobar Air Force Base	9.15251	92.8196
IN	Gujarat	BHU	Bhavnagar Airport	21.7522	72.1852
IN	Punjab	BUP	Bathinda Airport (Bhisiana Air Force Station)	30.2701	74.7558
IN	Tripura	IXA	Agartala Airport (Singerbhil Airport)	23.887	91.2404
IN	Madhya Pradesh	BHO	Raja Bhoj Airport	23.2875	77.3374
IN	Maharashtra	KLH	Kolhapur Airport	16.6647	74.2894
IN	Arunachal Pradesh	IXV	Along Airport	28.1753	94.802
IN	Tamil Nadu	TJV	Thanjavur Air Force Station	10.7224	79.1016
IN	Punjab	ATQ	Sri Guru Ram Dass Jee International Airport	31.7096	74.7973
IN	Delhi	DEL	Indira Gandhi International Airport	28.5665	77.1031
IN	West Bengal	CCU	Netaji Subhas Chandra Bose International Airport	22.6547	88.4467
IN	Chhattisgarh	PAB	Bilaspur Airport	21.9884	82.111
IN	Gujarat	MDN	Madison Municipal Airport	38.7589	-85.4655
IN	Gujarat	OTN	Ed-Air Airport	38.8514	-87.4997
IN	Gujarat	BHJ	Bhuj Airport / Bhuj Rudra Mata Air Force Base	23.2878	69.6702
IN	Gujarat	RID	Richmond Municipal Airport	39.7572	-84.8428
IN	Karnataka	BLR	Kempegowda International Airport	13.1979	77.7063
IN	West Bengal	IXB	Bagdogra Airport	26.6812	88.3286
IN	Chandigarh	IXC	Chandigarh Airport	30.6735	76.7885
IN	Tamil Nadu	CJB	Coimbatore International Airport	11.03	77.0434
IN	Gujarat	BDQ	Vadodara Airport (Civil Airport Harni)	22.3362	73.2263
IN	Nagaland	DMU	Dimapur Airport	25.8839	93.7711
IN	Uttar Pradesh	IXD	Allahabad Airport (Bamrauli Air Force Base)	25.4401	81.7339
IN	Telangana	HYD	Rajiv Gandhi International Airport	17.2313	78.4299
IN	Gujarat	ANQ	Tri-State Steuben County Airport	41.6397	-85.0835
IN	Gujarat	OKK	Kokomo Municipal Airport	40.5282	-86.059
IN	Gujarat	PLY	Plymouth Municipal Airport	41.3651	-86.3005
IN	Assam	DEP	Daporijo Airport	27.9855	94.2228
IN	Gujarat	SER	Freeman Municipal Airport	38.9236	-85.9074
IN	Tamil Nadu	MAA	Chennai International Airport	12.99	80.1693
IN	Maharashtra	ISK	Nashik Airport	20.1191	73.9129
IN	Maharashtra	RTC	Ratnagiri Airport	17.0136	73.3278
IN	Uttar Pradesh	LKO	Chaudhary Charan Singh International Airport	26.7606	80.8893
IN	Maharashtra	NDC	Shri Guru Gobind Singh Ji Airport	19.1833	77.3167
IN	Rajasthan	JAI	Jaipur International Airport	26.8242	75.8122
IN	Chhattisgarh	RPR	Swami Vivekananda Airport	21.1804	81.7388
IN	Karnataka	IXE	Mangalore Airport	12.9613	74.8901
IN	Gujarat	AMD	Sardar Vallabhbhai Patel International Airport	23.0772	72.6347
IN	Maharashtra	PNQ	Pune Airport	18.5821	73.9197
IN	Uttar Pradesh	GOP	Gorakhpur Airport	26.7397	83.4497
IN	Karnataka	IXG	Belgaum Airport	15.8593	74.6183
IN	Maharashtra	AKD	Akola Airport	20.699	77.0586
IN	Gujarat	GSH	Goshen Municipal Airport	41.5264	-85.7929
IN	Mizoram	AJL	Lengpui Airport	23.8406	92.6197
IN	Gujarat	HNB	Huntingburg Airport	38.249	-86.9537
IN	Gujarat	CEV	Mettel Field	39.6985	-85.1297
IN	Gujarat	FRH	French Lick Municipal Airport	38.5062	-86.6369
IN	Gujarat	AID	Anderson Municipal Airport (Darlington Field)	40.1086	-85.613
IN	Tamil Nadu	SXV	Salem Airport	11.7833	78.0656
IN	Andaman and Nicobar Islands	IXZ	Veer Savarkar International Airport (Port Blair Airport)	11.6412	92.7297
IN	Lakshadweep	AGX	Agatti Aerodrome	10.8237	72.176
IN	Uttar Pradesh	AGR	Agra Airport	27.1558	77.9609
IN	Uttar Pradesh	KNU	Kanpur Airport (Chakeri Air Force Station)	26.4043	80.4101
IN	Gujarat	IXY	Kandla Airport (Gandhidham Airport)	23.1127	70.1003
IN	Puducherry	PNY	Puducherry Airport	11.968	79.812
IN	Punjab	LUH	Sahnewal Airport (Ludhiana Airport)	30.8547	75.9526
IN	Odisha	RRK	Rourkela Airport	22.2567	84.8146
IN	Andhra Pradesh	TIR	Tirupati Airport	13.6325	79.5433
IN	Madhya Pradesh	HJR	Civil Aerodrome Khajuraho	24.8172	79.9186
IN	Odisha	JSA	Jaisalmer Airport	26.8887	70.865
IN	Maharashtra	LTU	Latur Airport	18.4115	76.4647
IN	Uttar Pradesh	VNS	Lal Bahadur Shastri Airport	25.4524	82.8593
IN	Tamil Nadu	IXM	Madurai Airport	9.83451	78.0934
IN	Kerala	CNN	Kannur International Airport	11.9186	75.5472
IN	Maharashtra	NAG	Dr. Babasaheb Ambedkar International Airport	21.0922	79.0472
IN	Tamil Nadu	NVY	Neyveli Airport	11.613	79.5274
IN	Gujarat	EVV	Evansville Regional Airport	38.037	-87.5324
IN	Gujarat	SIV	Sullivan County Airport	39.1147	-87.4483
IN	Gujarat	GBI	Kalaburagi Airport	26.6319	-78.3592
IN	Gujarat	MZZ	Marion Municipal Airport	40.4899	-85.6797
IN	Bihar	MZU	Muzaffarpur Airport	26.1191	85.3137
IN	Chhattisgarh	JGB	Jagdalpur Airport	19.0743	82.0368
IN	Meghalaya	SHL	Shillong Airport (Barapani Airport)	25.7036	91.9787
IN	Gujarat	JGA	Jamnagar Airport (Govardhanpur Airport)	22.4655	70.0126
IN	Rajasthan	UDR	Maharana Pratap Airport	24.6177	73.8961
IN	Gujarat	EKI	Elkhart Municipal Airport	41.7194	-86.0032
IN	Assam	IXI	Lilabari Airport	27.2955	94.0976
IN	Gujarat	HLB	Hillenbrand Industries Airport	39.3445	-85.2583
IN	Assam	GAU	Lokpriya Gopinath Bordoloi International Airport	26.1061	91.5859
IN	Rajasthan	JDH	Jodhpur Airport	26.2511	73.0489
IN	Jammu and Kashmir	IXJ	Jammu Airport (Satwari Airport)	32.6891	74.8374
IN	Gujarat	IXK	Keshod Airport	21.3171	70.2704
IN	Karnataka	MYQ	Mysore Airport (Mandakalli Airport)	12.23	76.6558
IN	Punjab	IXP	Pathankot Airport	32.2336	75.6344
IN	Jharkhand	IXR	Birsa Munda Airport	23.3143	85.3217
IN	Gujarat	BFR	Virgil I. Grissom Municipal Airport	38.84	-86.4454
IN	Gujarat	MGC	Michigan City Municipal Airport	41.7033	-86.8212
IN	Assam	IXS	Silchar Airport (Kumbhirgram Air Force Base)	24.9129	92.9787
IN	Assam	JRH	Jorhat Airport (Rowriah Airport)	26.7315	94.1755
IN	Arunachal Pradesh	IXT	Pasighat Airport	28.0661	95.3356
IN	Andhra Pradesh	CDP	Kadapa Airport	14.51	78.7728
IN	Rajasthan	BKB	Nal Airport	28.0706	73.2072
IN	Gujarat	LAF	Purdue University Airport	40.4123	-86.9369
IN	Manipur	IMF	Imphal International Airport (Tulihal Airport)	24.76	93.8967
IN	Gujarat	CLU	Columbus Municipal Airport	39.2619	-85.8963
IN	Kerala	COK	Cochin International Airport (Nedumbassery Airport)	10.152	76.4019
IN	Gujarat	LPO	La Porte Municipal Airport	41.5725	-86.7345
IN	Jammu and Kashmir	IXL	Kushok Bakula Rimpochee Airport	34.1359	77.5465
IN	Andhra Pradesh	VTZ	Visakhapatnam Airport	17.7212	83.2245
IN	Punjab	AIP	Adampur Airport	31.4331	75.7606
IN	Bihar	DBR	Darbhanga Airport	26.1947	85.9175
IQ	An Najaf	NJF	Al Najaf International Airport	31.9899	44.4043
IQ	Baghdad	BGW	Baghdad International Airport	33.2625	44.2346
IQ	Kirkuk	KIK	Kirkuk Airport	35.4695	44.3489
IQ	Al Anbar	IQA	Al Asad Airbase	33.7856	42.4412
IQ	Ninawa	OSM	Mosul International Airport	36.3058	43.1474
IQ	Dahuk	BMN	Bamarni Airport	37.0988	43.2666
IQ	Ninawa	RQW	Qayyarah Airfield West	35.7672	43.1251
IQ	Al Anbar	TQD	Al-Taqaddum Air Base	33.3381	43.5971
IQ	Al Basrah	BSR	Basra International Airport	30.5491	47.6621
IQ	Arbil	EBL	Erbil International Airport	36.2376	43.9632
IQ	Arbil	ISU	Sulaimaniyah International Airport	35.5617	45.3167
IR	Semnan	SNX	Semnan Municipal Airport	35.5911	53.4951
IR	Hamadan	NUJ	Hamedan Air Base (Nogeh Airport)	35.2117	48.6533
IR	Bushehr	KHK	Kharg Airport	29.2603	50.3239
IR	Azarbayjan-e Gharbi	KHY	Khoy Airport	38.4275	44.9736
IR	Kerman	RJN	Rafsanjan Airport	30.2977	56.0511
IR	Hormozgan	KIH	Kish International Airport	26.5262	53.9802
IR	Azarbayjan-e Sharqi	TBZ	Tabriz International Airport	38.1339	46.235
IR	Khorasan-e Razavi	MHD	Mashhad International Airport (Shahid Hashemi Nejad Airport)	36.2352	59.641
IR	Hormozgan	BND	Bandar Abbas International Airport	27.2183	56.3778
IR	Tehran	IKA	Imam Khomeini International Airport	35.4161	51.1522
IR	Golestan	KLM	Kalaleh Airport	37.3833	55.452
IR	Sistan va Baluchestan	VOH	Vohemar Airport	-13.3758	50.0028
IR	Ilam	IIL	Ilam Airport	33.5866	46.4048
IR	Sistan va Baluchestan	IHR	Iranshahr Airport	27.2361	60.72
IR	Bushehr	KNR	Jam Airport	27.8205	52.3522
IR	Sistan va Baluchestan	ZAH	Zahedan Airport	29.4757	60.9062
IR	Esfahan	IFN	Isfahan International Airport (Shahid Beheshti Int'l)	32.7508	51.8613
IR	Khuzestan	ABD	Abadan International Airport	30.3711	48.2283
IR	Fars	LRR	Larestan International Airport	27.6747	54.3833
IR	Azarbayjan-e Gharbi	TIA	Tirana International Airport	41.4147	19.7206
IR	Esfahan	IFH	Hesa Air Base	32.9289	51.5611
IR	Azarbayjan-e Sharqi	ACP	Sahand Airport	37.348	46.1279
IR	Sistan va Baluchestan	ACZ	Zabol Airport	31.0983	61.5439
IR	Hormozgan	BDH	Bandar Lengeh Airport	26.532	54.8248
IR	Ardabil	ADU	Ardabil Airport	38.3257	48.4244
IR	Hormozgan	AEU	Abu Musa Airport	25.8757	55.033
IR	Mazandaran	NSH	Noshahr Airport	36.6633	51.4647
IR	Sistan va Baluchestan	DOA	Doany Airport	-14.3681	49.5108
IR	Sistan va Baluchestan	ZWA	Andapa Airport	-14.6517	49.6206
IR	Khorasan-e Razavi	AFZ	Sabzevar Airport	36.1681	57.5952
IR	Semnan	RUD	Shahroud Airport	36.4253	55.1042
IR	Hormozgan	LVP	Lavan Airport	26.8103	53.3563
IR	Hormozgan	SXI	Sirri Island Airport	25.9089	54.5394
IR	Tehran	THR	Mehrabad International Airport	35.6892	51.3134
IR	Khuzestan	MRX	Mahshahr Airport	30.5562	49.1519
IR	Fars	LFM	Lamerd Airport	27.3727	53.1888
IR	Markazi	AJK	Arak Airport	34.1381	49.8473
IR	Khuzestan	AKW	Aghajari Airport	30.7444	49.6772
IR	Sistan va Baluchestan	AMB	Ambilobe Airport	-13.1884	48.988
IR	Sistan va Baluchestan	ZBR	Konarak Airport	25.4433	60.3821
IR	Sistan va Baluchestan	ANM	Antsirabato Airport	-14.9994	50.3202
IR	Hormozgan	GSM	Dayrestan Airport (Qeshm International Airport)	26.7546	55.9024
IR	Khuzestan	AWZ	Ahvaz International Airport	31.3374	48.762
IR	Khuzestan	DEF	Dezful Airport	32.4344	48.3976
IR	Yazd	AZD	Shahid Sadooghi Airport	31.9049	54.2765
IR	Azarbayjan-e Gharbi	IMQ	Maku International Airport	39.33	44.43
IR	Bushehr	IAQ	Bahregan Airport	29.84	50.2728
IR	Fars	JAR	Jahrom Airport	28.5867	53.5791
IR	Khorasan-e Jonubi	TCX	Tabas Airport	33.6678	56.8927
IR	Mazandaran	SRY	Dasht-e Naz Airport	36.6358	53.1936
IR	Khorasan-e Razavi	CKT	Sarakhs Airport	36.5012	61.0649
IR	Kohgiluyeh va Bowyer Ahmad	GCH	Gachsaran Airport	30.3376	50.828
IR	Golestan	GBT	Gorgan Airport	36.9094	54.4013
IR	Fars	SYZ	Shiraz International Airport (Shahid Dastghaib Int'l)	29.5392	52.5898
IR	Fars	FAZ	Fasa Airport	28.8918	53.7233
IR	Qazvin	GZW	Qazvin Airport	36.2401	50.0471
IR	Hamadan	HDM	Hamadan Airport	34.8692	48.5525
IR	Hormozgan	HDR	Havadarya Airport	27.1583	56.1725
IR	Azarbayjan-e Gharbi	HGE	Higuerote Airport	10.4625	-66.0928
IR	Khuzestan	OMI	Omidiyeh Air Base	30.8352	49.5349
IR	Azarbayjan-e Gharbi	OMH	Urmia Airport	37.6681	45.0687
IR	Alborz	PYK	Payam International Airport	35.7761	50.8267
IR	Sistan va Baluchestan	IVA	Ambanja Airport	-13.4848	48.6327
IR	Zanjan	JWN	Zanjan Airport	36.7737	48.3594
IR	Kerman	SYJ	Sirjan Airport	29.5509	55.6727
IR	Kerman	JYR	Jiroft Airport	28.7269	57.6703
IR	Chahar Mahal va Bakhtiari	CQD	Shahrekord Airport	32.2972	50.8422
IR	Gilan	RAS	Rasht Airport	37.3233	49.6178
IR	Khorasan-e Jonubi	XBJ	Birjand International Airport	32.8981	59.2661
IR	Kordestan	SDG	Sanandaj Airport	35.2459	47.0092
IR	Sistan va Baluchestan	SVB	Sambava Airport	-14.2786	50.1747
IR	Kerman	BXR	Bam Airport	29.0842	58.45
IR	Mazandaran	RZR	Ramsar International Airport	36.9099	50.6796
IR	Kohgiluyeh va Bowyer Ahmad	YES	Yasuj Airport	30.7005	51.5451
IR	Bushehr	BUZ	Bushehr Airport	28.9448	50.8346
IR	Kerman	KER	Kerman Airport	30.2744	56.9511
IR	Bushehr	PGU	Persian Gulf Airport	27.3796	52.7377
IR	Khorasan-e Shomali	BJB	Bojnord Airport	37.493	57.3082
IR	Kermanshah	KSH	Shahid Ashrafi Esfahani Airport (Kermanshah Airport)	34.3459	47.1581
IR	Ardabil	PFQ	Parsabad-Moghan Airport	39.6036	47.8815
IR	Mazandaran	BSM	Bishe Kola Air Base	36.6551	52.3496
IR	Sistan va Baluchestan	NOS	Fascene Airport	-13.3121	48.3148
IR	Sistan va Baluchestan	DIE	Arrachart Airport	-12.3494	49.2917
IR	Bushehr	KHA	Khaneh Airport (Piranshahr Airport)	36.7333	45.15
IR	Lorestan	KHD	Khorramabad Airport	33.4354	48.2829
IR	Tehran	KKS	Kashan Airport	33.8953	51.577
IS	Nordurland eystra	AEY	Akureyri Airport	65.66	-18.0727
IS	Nordurland eystra	RFN	Raufarhofn Airport	66.4064	-15.9183
IS	Nordurland eystra	GRY	Grimsey Airport	66.5458	-18.0173
IS	Nordurland eystra	EGS	Egilsstaoir Airport	65.2833	-14.4014
IS	Austurland	HFN	Hornafjorour Airport	64.2956	-15.2272
IS	Nordurland vestra	PFJ	Patreksfjorour Airport	65.5558	-23.965
IS	Nordurland eystra	BXV	Breiodalsvik Airport	64.79	-14.0228
IS	Nordurland eystra	HZK	Husavik Airport	65.9523	-17.426
IS	Nordurland vestra	SAK	Sauoarkrokur Airport	65.7317	-19.5728
IS	Sudurland	VEY	Vestmannaeyjar Airport	63.4243	-20.2789
IS	Nordurland eystra	MVA	Myvatn Airport	65.6558	-16.9181
IS	Austurland	DJU	Djupivogur Airport	64.6442	-14.2828
IS	Nordurland vestra	BLO	Blonduos Airport	65.645	-20.2875
IS	Vestfirdir	FLI	Holt Airport	66.0142	-23.4417
IS	Nordurland eystra	OPA	Kopasker Airport	66.3108	-16.4667
IS	Vestfirdir	IFJ	Isafjorour Airport	66.0581	-23.1353
IS	Vestfirdir	TEY	Thingeyri Airport	65.8703	-23.56
IS	Vesturland	GUU	Grundarfjorour Airport	64.9914	-23.2247
IS	Nordurland eystra	OFJ	Olafsfjorour Airport	66.0833	-18.6667
IS	Nordurland eystra	VPN	Vopnafjorour Airport	65.7206	-14.8506
IS	Nordurland eystra	FAS	Faskruosfjorour Airport	64.9317	-14.0606
IS	Vestfirdir	HVK	Holmavik Airport	65.7047	-21.6964
IS	Sudurland	FAG	Fagurholsmyri Airport	63.8747	-16.6411
IS	Austurland	BGJ	Borgarfjorour Eystri Airport	65.5164	-13.805
IS	Nordurland eystra	THO	Thorshofn Airport	66.2185	-15.3356
IS	Nordurland eystra	NOR	Norofjorour Airport	65.1319	-13.7464
IS	Nordurland vestra	OLI	Rif Airport	64.9114	-23.8231
IS	Nordurland eystra	BJD	Bakkafjorour Airport	66.0219	-14.8244
IS	Vestfirdir	GJR	Gjogur Airport	65.9953	-21.3269
IS	Vesturland	SYK	Stykkisholmur Airport	65.0581	-22.7942
IS	Nordurland vestra	BIU	Bildudalur Airport	65.6413	-23.5462
IS	Vestfirdir	RHA	Reykholar Airport	65.4526	-22.2061
IS	Nordurland eystra	SIJ	Siglufjorour Airport	66.1333	-18.9167
IS	Hofudborgarsvaedi	RKV	ReykjavÃƒÂ­k Airport	64.13	-21.9406
IS	Sudurnes	KEF	KeflavÃƒÂ­k International Airport	63.985	-22.6056
IT	Lazio	FCO	RomeÃ¢â‚¬â€œFiumicino International Airport	41.8003	12.2389
IT	Toscana	SAY	Siena-Ampugnano Airport	43.2563	11.255
IT	Sardegna	TTB	Tortoli Airport (Arbatax Airport)	39.9188	9.68298
IT	Piemonte	TRN	Turin Airport (Caselle Airport)	45.2008	7.64963
IT	Friuli-Venezia Giulia	AVB	Aviano Air Base	46.0319	12.5965
IT	Veneto	TSF	Treviso-Sant'Angelo Airport	45.6484	12.1944
IT	Sardegna	FNU	Oristano-Fenosu Airport	39.8953	8.64266
IT	Veneto	BLX	Belluno Airport	46.1665	12.2504
IT	Veneto	VCE	Venice Marco Polo Airport	45.5053	12.3519
IT	Piemonte	CUF	Cuneo International Airport	44.547	7.62322
IT	Valle d'Aosta	AOT	Aosta Valley Airport	45.7385	7.36872
IT	Toscana	GRS	Grosseto Airport	42.7597	11.0719
IT	Emilia-Romagna	BLQ	Bologna Guglielmo Marconi Airport	44.5354	11.2887
IT	Veneto	VRN	Verona Villafranca Airport	45.3957	10.8885
IT	Lombardia	MXP	Milan-Malpensa Airport	45.6306	8.72811
IT	Puglia	BDS	Brindisi - Salento Airport	40.6576	17.947
IT	Friuli-Venezia Giulia	UDN	Campoformido Airport	46.0322	13.1868
IT	Lombardia	VBS	Brescia Airport (Gabriele D'Annunzio Airport)	45.4289	10.3306
IT	Liguria	ALL	Albenga Airport	44.0506	8.12743
IT	Sicilia	PMO	Falcone-Borsellino Airport (Punta Raisi Airport)	38.176	13.091
IT	Calabria	CRV	Crotone Airport (Sant'Anna Airport)	38.9972	17.0802
IT	Sardegna	DCI	Decimomannu Air Base	39.3542	8.97248
IT	Emilia-Romagna	RAN	Ravenna Airport	44.3639	12.225
IT	Trentino-Alto Adige	BZO	Bolzano Airport	46.4602	11.3264
IT	Sicilia	PNL	Pantelleria Airport	36.8165	11.9689
IT	Sardegna	CAG	Cagliari Elmas Airport	39.2515	9.05428
IT	Emilia-Romagna	FRL	Forli International Airport (Luigi Ridolfi Airport)	44.1948	12.0701
IT	Sicilia	NSY	Naval Air Station Sigonella	37.4017	14.9224
IT	Toscana	EBA	Marina di Campo Airport	42.7603	10.2394
IT	Campania	QSR	Salerno Costa d'Amalfi Airport (Pontecagnano Airport)	40.6204	14.9113
IT	Abruzzo	QAQ	L'Aquila-Preturo Airport	42.3799	13.3092
IT	Friuli-Venezia Giulia	TRS	Trieste - Friuli Venezia Giulia Airport	45.8275	13.4722
IT	Sicilia	LMP	Lampedusa Airport	35.4979	12.6181
IT	Toscana	PSA	Pisa International Airport (Galileo Galilei Airport)	43.6839	10.3927
IT	Campania	NAP	Naples International Airport	40.886	14.2908
IT	Sicilia	CIY	Comiso Airport	36.9946	14.6072
IT	Marche	AOI	Ancona Falconara Airport	43.6163	13.3623
IT	Abruzzo	PSR	Abruzzo Airport	42.4317	14.1811
IT	Veneto	VIC	Vicenza Airport	45.5734	11.5295
IT	Calabria	SUF	Lamezia Terme International Airport	38.9054	16.2423
IT	Liguria	GOA	Genoa Cristoforo Colombo Airport	44.4133	8.8375
IT	Puglia	FOG	Foggia Gino Lisa Airport	41.4329	15.535
IT	Calabria	REG	Reggio di Calabria Airport	38.0712	15.6516
IT	Puglia	TAR	Taranto-Grottaglie Airport	40.5175	17.4032
IT	Sardegna	OLB	Olbia Costa Smeralda Airport	40.8987	9.51763
IT	Puglia	LCC	Galatina Air Base	40.2392	18.1333
IT	Umbria	PEG	Perugia San Francesco d'Assisi - Umbria International Airport	43.0959	12.5132
IT	Emilia-Romagna	RMI	Federico Fellini International Airport	44.0203	12.6117
IT	Toscana	FLR	Florence Airport	43.81	11.2051
IT	Sicilia	CTA	Catania-Fontanarossa Airport	37.4668	15.0664
IT	Puglia	BRI	Bari Karol Wojtyla Airport	41.1389	16.7606
IT	Sicilia	TPS	Vincenzo Florio Airport	37.9114	12.488
IT	Toscana	LCV	Lucca-Tassignano Airport	43.8258	10.5779
IT	Sardegna	AHO	Alghero-Fertilia Airport	40.6321	8.29077
JE	Jersey	JER	Jersey Airport	49.2081	-2.19528
JM	Kingston	KTP	Tinson Pen Aerodrome	17.9886	-76.8238
JM	Westmoreland	NEG	Negril Aerodrome	18.3428	-78.3321
JM	Portland	POT	Ken Jones Aerodrome	18.1988	-76.5345
JM	Saint James	MBJ	Sangster International Airport	18.5037	-77.9134
JM	Saint Mary	OCJ	Ian Fleming International Airport	18.4042	-76.969
JM	Saint Andrew	KIN	Norman Manley International Airport	17.9357	-76.7875
JO	Madaba	AMM	Queen Alia International Airport	31.7226	35.9932
JO	Al 'Asimah	ADJ	Amman Civil Airport (Marka International Airport)	31.9727	35.9916
JO	Ma'an	MPQ	Ma'an Airport	30.1667	35.7833
JO	Al 'Aqabah	AQJ	King Hussein International Airport	29.6116	35.0181
JO	Al Mafraq	OMF	King Hussein Air Base	32.3564	36.2592
JP	Aomori	HHE	JMSDF Hachinohe Air Base	40.5564	141.466
JP	Kagoshima	TNE	New Tanegashima Airport	30.6051	130.991
JP	Ishikawa	NTQ	Noto Airport	37.2931	136.962
JP	Tokyo	OIM	Oshima Airport	34.782	139.36
JP	Yamagata	SYO	Shonai Airport	38.8122	139.787
JP	Hokkaido	WKJ	Wakkanai Airport	45.4042	141.801
JP	Kagawa	TAK	Takamatsu Airport	34.2142	134.016
JP	Tokyo	HAC	Hachijojima Airport	33.115	139.786
JP	Miyazaki	KMI	Miyazaki Airport	31.8772	131.449
JP	Kumamoto	KMJ	Kumamoto Airport	32.8373	130.855
JP	Okinawa	OGN	Yonaguni Airport	24.4669	122.978
JP	Fukuoka	KKJ	Kitakyushu Airport	33.8459	131.035
JP	Toyama	TOY	Toyama Airport	36.6483	137.188
JP	Ishikawa	KMQ	Komatsu Airport (Kanazawa Airport)	36.3946	136.407
JP	Hokkaido	KUH	Kushiro Airport	43.041	144.193
JP	Akita	ONJ	Odate-Noshiro Airport	40.1919	140.371
JP	Saga	HSG	Saga Airport	33.1497	130.302
JP	Okinawa	UEO	Kumejima Airport	26.3635	126.714
JP	Yamagata	GAJ	Yamagata Airport (Junmachi Airport)	38.4119	140.371
JP	Okinawa	ISG	New Ishigaki Airport	24.3964	124.245
JP	Nagasaki	FUJ	Fukue Airport (Goto-Fukue Airport)	32.6663	128.833
JP	Kagoshima	KUM	Yakushima Airport	30.3856	130.659
JP	Iwate	HNA	Hanamaki Airport	39.4286	141.135
JP	Kagoshima	ASJ	Amami Airport	28.4306	129.713
JP	Hokkaido	MMB	Memanbetsu Airport	43.8806	144.164
JP	Okinawa	MMD	Minami-Daito Airport	25.8465	131.263
JP	Nagano	MMJ	Matsumoto Airport	36.1668	137.923
JP	Nagasaki	TSJ	Tsushima Airport	34.2849	129.331
JP	Hokkaido	MBE	Monbetsu Airport	44.3039	143.404
JP	Aomori	AOJ	Aomori Airport	40.7347	140.691
JP	Fukuoka	FUK	Fukuoka Airport (Itazuke Air Base)	33.5859	130.451
JP	Tottori	YGJ	Miho-Yonago Airport	35.4922	133.236
JP	Hokkaido	SHB	Nakashibetsu Airport	43.5775	144.96
JP	Nagasaki	OMJ	Omura Airport	35.0833	140.1
JP	Aichi	NKM	Nagoya Airfield (Komaki Airport)	35.255	136.924
JP	Akita	AXT	Akita Airport	39.6156	140.219
JP	Hokkaido	OBO	Tokachi-Obihiro Airport	42.7333	143.217
JP	Okinawa	MMY	Miyako Airport	24.7828	125.295
JP	Kanagawa	NJA	Naval Air Facility Atsugi	35.4546	139.45
JP	Kagoshima	KKX	Kikai Airport (Kikaiga Shima Airport)	28.3213	129.928
JP	Hokkaido	AKJ	Asahikawa Airport	43.6708	142.447
JP	Shimane	IWJ	Iwami Airport (Hagi-Iwami Airport)	34.6764	131.79
JP	Hokkaido	RIS	Rishiri Airport	45.242	141.186
JP	Yamaguchi	IWK	Marine Corps Air Station Iwakuni	34.1439	132.236
JP	Tokyo	IWO	Iwo Jima Air Base	24.784	141.323
JP	Shimane	IZO	Izumo Airport	35.4136	132.89
JP	Aomori	MSJ	Misawa Air Base	40.7032	141.368
JP	Shizuoka	FSZ	Shizuoka Airport (Mt. Fuji Shizuoka Airport)	34.796	138.188
JP	Niigata	KIJ	Niigata Airport	37.9559	139.121
JP	Tokushima	TKS	Tokushima Airport	34.1328	134.607
JP	Okinawa	TRA	Tarama Airport	24.6539	124.675
JP	Ibaraki	IBR	Ibaraki Airport	36.1811	140.415
JP	Okinawa	AGJ	Aguni Airport	26.5925	127.241
JP	Tokyo	MUS	Minami Torishima Airport	24.2897	153.979
JP	Okinawa	SHI	Shimojishima Airport	24.8267	125.145
JP	Nagasaki	NGS	Nagasaki Airport	32.9169	129.914
JP	Aichi	NGO	Chubu Centrair International Airport	34.8584	136.805
JP	Fukui	FKJ	Fukui Airport	36.1428	136.224
JP	Kagoshima	KOJ	Kagoshima Airport	31.8034	130.719
JP	Wakayama	SHM	Nanki-Shirahama Airport	33.6622	135.364
JP	Miyagi	SDJ	Sendai Airport	38.1397	140.917
JP	Niigata	SDS	Sado Airport	38.0602	138.414
JP	Kumamoto	AXJ	Amakusa Airfield	32.4825	130.159
JP	Fukushima	FKS	Fukushima Airport	37.2274	140.431
JP	Okinawa	HTR	Hateruma Airport	24.0589	123.806
JP	Okinawa	IEJ	Iejima Airport	26.722	127.785
JP	Okinawa	DNA	Kadena Air Base	26.3556	127.768
JP	Kochi	KCZ	Kochi Ryoma Airport	33.5461	133.669
JP	Hiroshima	HIW	Hiroshima-Nishi Airport	34.3669	132.414
JP	Hiroshima	HIJ	Hiroshima Airport	34.4361	132.919
JP	Okayama	OKJ	Okayama Airport	34.7569	133.855
JP	Ehime	MYJ	Matsuyama Airport	33.8272	132.7
JP	Tottori	OKI	Oki Airport	36.1811	133.325
JP	Hyogo	TJH	Tajima Airport	35.5128	134.787
JP	Kagoshima	OKE	Okinoerabu Airport	27.4255	128.701
JP	Hokkaido	OIR	Okushiri Airport	42.0717	139.433
JP	Tottori	TTJ	Tottori Airport	35.5301	134.167
JP	Hokkaido	RBJ	Rebun Airport	45.455	141.039
JP	Hokkaido	HKD	Hakodate Airport	41.77	140.822
JP	Yamaguchi	UBJ	Yamaguchi Ube Airport	33.93	131.279
JP	Okinawa	KJP	Kerama Airport	26.1683	127.293
JP	Tokyo	MYE	Miyakejima Airport	34.0736	139.56
JP	Kagoshima	TKN	Tokunoshima Airport	27.8364	128.881
JP	Okinawa	OKA	Naha Airport	26.1958	127.646
JP	Kagoshima	RNJ	Yoron Airport	27.044	128.402
JP	Okinawa	KTD	Kitadaito Airport	25.9447	131.327
JP	Oita	OIT	Oita Airport	33.4794	131.737
JP	Nagasaki	IKI	Iki Airport	33.749	129.785
JP	Tokyo	HND	Haneda Airport	35.5533	139.781
JP	Tokyo	NRT	Narita International Airport	35.7653	140.386
JP	Osaka	KIX	Kansai International Airport	34.4305	135.23
KE	Nyamira	OLX	Olkiombo Airstrip	-1.40859	35.1107
KE	Lamu	LAU	Manda Airport	-2.25242	40.9131
KE	Kilifi	VPG	Vipingo Airport	-3.80667	39.7974
KE	Garissa	LBK	Liboi Airport	0.348333	40.8817
KE	Baringo	LBN	Lake Baringo Airport	0.666103	36.1042
KE	Turkana	LKG	Lokichogio Airport	4.20412	34.3482
KE	Turkana	LKU	Lake Turkana Airport	3.41667	35.8833
KE	Turkana	LOK	Lodwar Airport	3.12197	35.6087
KE	Turkana	LOY	Loiyangalani Airport	2.75	36.717
KE	Mombasa	MBA	Moi International Airport	-4.03483	39.5942
KE	Wajir	WJR	Wajir Airport	1.73324	40.0916
KE	Narok	MRE	Mara Serena Airport	-1.40611	35.0081
KE	Kilifi	MYD	Malindi Airport	-3.22931	40.1017
KE	Elgeyo/Marakwet	NBO	Jomo Kenyatta International Airport	-1.31924	36.9278
KE	Mandera	NDE	Mandera Airport	3.933	41.85
KE	Kajiado	ASV	Amboseli Airport	-2.64505	37.2531
KE	Nakuru	NUU	Nakuru Airport	-0.298067	36.1593
KE	Nyeri	NYE	Nyeri Airport	-0.364414	36.9785
KE	Laikipia	NYK	Nanyuki Airport	-0.062399	37.041
KE	Marsabit	OYL	Moyale Airport	3.46972	39.1014
KE	Marsabit	RBT	Marsabit Airport	2.34425	38
KE	Samburu	UAS	Samburu Airport (Buffalo Spring Airport)	0.530583	37.5342
KE	Kwale	UKA	Ukunda Airport (Diani Airport)	-4.29333	39.5711
KE	Nairobi City	WIL	Wilson Airport	-1.32172	36.8148
KE	Nyamira	ANA	Angama Airstrip	-1.27156	34.9555
KE	Nyamira	KTJ	Kichwa Tembo Airport	-1.2635	35.0275
KE	Mombasa	BMQ	Bamburi Airport	-3.98191	39.7308
KE	Uasin Gishu	EDL	Eldoret International Airport	0.404458	35.2389
KE	Turkana	EYS	Eliye Springs Airport	3.21667	35.9667
KE	Garissa	GAS	Garissa Airport	-0.463508	39.6483
KE	Kakamega	GGM	Kakamega Airport	0.271342	34.7873
KE	Tana River	HOA	Hola Airport	-1.522	40.004
KE	Taita/Taveta	ILU	Kilaguni Airport	-2.91061	38.0652
KE	Meru	JJM	Mulika Lodge Airport	0.165083	38.1951
KE	Narok	KEU	Keekorok Airport	-1.583	35.25
KE	Kericho	KEY	Kericho Airport	-0.3899	35.2421
KE	Kisumu	KIS	Kisumu International Airport	-0.086139	34.7289
KE	Lamu	KIU	Kiunga Airport	-1.74383	41.4843
KE	Turkana	KLK	Kalokol Airport (Fergusons Gulf Airport)	3.49161	35.8368
KE	Elgeyo/Marakwet	KRV	Kimwarer Airport (Kerio Valley Airport)	0.319638	35.6626
KE	Uasin Gishu	KTL	Kitale Airport	0.971989	34.9586
KE	Lamu	KWY	Kiwayu Airport	-1.96056	41.2975
KG	Osh	OSS	Osh Airport	40.609	72.7933
KG	Chuy	FRU	Manas International Airport	43.0613	74.4776
KH	Siem Reab	REP	Siem Reap International Airport (Angkor Int'l)	13.4107	103.813
KH	Baat Dambang	BBM	Battambang Airport	13.0956	103.224
KH	Krong Preah Sihanouk	KOS	Sihanoukville International Airport (Kaong Kang Airport)	10.5797	103.637
KH	Phnom Penh	TNX	Steung Treng Airport	13.5319	106.015
KH	Kracheh	KTI	Kratie Airport	12.488	106.055
KH	Phnom Penh	PNH	Phnom Penh International Airport	11.5466	104.844
KH	Rotanak Kiri	RBE	Ratanakiri Airport	13.73	106.987
KH	Preah Vihear	OMY	Thbeng Meanchey Airport (Preah Vinhear Airport)	13.7597	104.972
KH	Mondol Kiri	MWV	Mondulkiri Airport	12.4636	107.187
KH	Pousaat	KZD	Krakor Airport	12.5385	104.149
KH	Kampot	KMT	Kampot Airport	10.6343	104.162
KH	Kaoh Kong	KKZ	Koh Kong Airport	11.6134	102.997
KH	Kampong Chhnang	KZC	Kampong Chhnang Airport	12.2552	104.564
KI	Gilbert Islands	KUC	Kuria Airport	0.218611	173.442
KI	Line Islands	CXI	Cassidy International Airport	1.98616	-157.35
KI	Gilbert Islands	TRW	Bonriki International Airport	1.38164	173.147
KI	Gilbert Islands	ABF	Abaiang Atoll Airport	1.79861	173.041
KI	Gilbert Islands	NON	Nonouti Airport	-0.639722	174.428
KI	Gilbert Islands	MTK	Makin Airport	3.37444	172.992
KI	Gilbert Islands	MNK	Maiana Airport	1.00361	173.031
KI	Gilbert Islands	OOT	Onotoa Airport	-1.79611	175.526
KI	Gilbert Islands	TSU	Tabiteuea South Airport	-1.47444	175.064
KI	Gilbert Islands	AIS	Arorae Island Airport	-2.61611	176.803
KI	Line Islands	TNV	Tabuaeran Island Airport	3.89944	-159.389
KI	Line Islands	TNQ	Teraina Airport	4.69836	-160.394
KI	Gilbert Islands	BBG	Butaritari Atoll Airport	3.08583	172.811
KI	Line Islands	CIS	Canton Island Airport	-2.76812	-171.71
KI	Gilbert Islands	BEZ	Beru Island Airport	-1.35472	176.007
KI	Gilbert Islands	TMN	Tamana Airport	-2.48583	175.97
KI	Gilbert Islands	NIG	Nikunau Airport	-1.31444	176.41
KI	Gilbert Islands	MZK	Marakei Airport	2.05861	173.271
KI	Gilbert Islands	AAK	Aranuka Airport	0.185278	173.637
KI	Gilbert Islands	TBF	Tabiteuea North Airport	-1.22447	174.776
KI	Gilbert Islands	AEA	Abemama Atoll Airport	0.490833	173.829
KM	Moheli	NWA	Moheli Bandar Es Eslam Airport	-12.2981	43.7664
KM	Anjouan	AJN	Ouani Airport	-12.1317	44.4303
KM	Grande Comore	HAH	Prince Said Ibrahim International Airport	-11.5337	43.2719
KM	Grande Comore	YVA	Iconi Airport	-11.7125	43.2431
KN	Saint Paul Charlestown	NEV	Vance W. Amory International Airport	17.2057	-62.5899
KN	Saint John Figtree	SKB	Robert L. Bradshaw International Airport	17.3112	-62.7187
KN	Saint Thomas Lowland	SKB	Robert L. Bradshaw Airport	17.3114	-62.7186
KP	Kangwon-do	WOS	Wonsan Kalma International Airport	39.1668	127.486
KP	Ryanggang-do	YJS	Samjiyon Airport	41.9071	128.41
KP	P'yongan-bukto	UJU	Uiju Airfield	40.1546	124.532
KP	Hamgyong-bukto	RGO	Orang Airport	41.4285	129.648
KP	Hwanghae-namdo	DSO	Sondok Airport	39.7452	127.474
KP	P'yongyang	FNJ	Pyongyang Sunan International Airport	39.2241	125.67
KR	Jeju-teukbyeoljachido	JDG	Jeongseok Airport	33.3996	126.712
KR	Chungcheongnam-do	HMY	Seosan Air Base	36.704	126.486
KR	Gyeonggi-do	SWU	Suwon Air Base	37.2394	127.007
KR	Gwangju-gwangyeoksi	MWX	Muan International Airport	34.9914	126.383
KR	Chungcheongbuk-do	JWO	Jungwon Air Base	37.03	127.885
KR	Gangwon-do	KAG	Gangneung Air Base	37.7536	128.944
KR	Gangwon-do	WJU	Wonju Airport	37.4412	127.964
KR	Gwangju-gwangyeoksi	KUV	Gunsan Airport	35.9038	126.616
KR	Gyeongsangnam-do	USN	Ulsan Airport	35.5935	129.352
KR	Gangwon-do	YNY	Yangyang International Airport	38.0613	128.669
KR	Gyeongsangnam-do	CHF	Jinhae Airport	35.1402	128.696
KR	Gwangju-gwangyeoksi	KWJ	Gwangju Airport	35.1232	126.805
KR	Gwangju-gwangyeoksi	CHN	Jeonju Airport	35.8781	127.119
KR	Chungcheongbuk-do	CJJ	Cheongju International Airport	36.717	127.499
KR	Jeju-teukbyeoljachido	CJU	Jeju International Airport	33.5113	126.493
KR	Gyeonggi-do	OSN	Osan Air Base	37.0906	127.03
KR	Gyeongsangnam-do	TAE	Daegu International Airport	35.8969	128.655
KR	Gyeongsangnam-do	UJN	Uljin Airport	36.7771	129.462
KR	Gyeongsangnam-do	HIN	Sacheon Airport	35.0886	128.072
KR	Gyeongsangnam-do	KPO	Pohang Airport	35.988	129.42
KR	Busan-gwangyeoksi	PUS	Gimhae International Airport	35.1795	128.938
KR	Gyeongsangnam-do	YEC	Yecheon Air Base	36.6304	128.35
KR	Gwangju-gwangyeoksi	RSU	Yeosu/Suncheon Airport	34.8423	127.617
KR	Gyeonggi-do	ICN	Incheon International Airport	37.4633	126.44
KW	Al Ahmadi	XIJ	Ahmad al-Jaber Air Base	28.9348	47.7919
KW	Al Farwaniyah	KWI	Kuwait International Airport	29.2266	47.9689
KY	Cayman Islands	LYB	Edward Bodden Airfield	19.6602	-80.0888
KY	Cayman Islands	CYB	Charles Kirkconnell International Airport	19.687	-79.8828
KY	Cayman Islands	GCM	Owen Roberts International Airport	19.2928	-81.3577
KZ	Mangghystau oblysy	SCO	Aktau Airport	43.8601	51.092
KZ	Soltustik Qazaqstan oblysy	PPK	Petropavl Airport	54.7747	69.1839
KZ	Shyghys Qazaqstan oblysy	PLX	Semey Airport	50.3513	80.2344
KZ	Shyghys Qazaqstan oblysy	UZR	Urzhar Airport	47.0911	81.6652
KZ	Aqtobe oblysy	AKX	Aktobe Airport	50.2458	57.2067
KZ	Qostanay oblysy	KSN	Kostanay Airport	53.2069	63.5503
KZ	Qostanay oblysy	AYK	Arkalyk Airport	50.3186	66.9528
KZ	Qaraghandy oblysy	BXH	Balkhash Airport	46.8933	75.005
KZ	Almaty	BXJ	Boraldai Airport	43.3526	76.8837
KZ	Zhambyl oblysy	DMB	Taraz Airport (Jambyl Airport)	42.8536	71.3036
KZ	Aqmola oblysy	KOV	Kokshetau Airport	53.3291	69.5946
KZ	Pavlodar oblysy	PWQ	Pavlodar Airport	52.195	77.0739
KZ	Aqmola oblysy	HRC	Zhayrem Airport	48.3974	70.1915
KZ	Bayqongyr	BXY	Krayniy Airport	45.622	63.2108
KZ	Qyzylorda oblysy	KZO	Kyzylorda Airport	44.7069	65.5925
KZ	Ongtustik Qazaqstan oblysy	CIT	Shymkent International Airport	42.3642	69.4789
KZ	Pavlodar oblysy	EKB	Ekibastuz Airport	51.591	75.215
KZ	Qaraghandy oblysy	KGF	Sary-Arka Airport	49.6708	73.3344
KZ	Shyghys Qazaqstan oblysy	UKK	Oskemen Airport (Ust-Kamenogorsk Airport)	50.0366	82.4942
KZ	Almaty	TDK	Taldykorgan Airport	45.1262	78.447
KZ	Astana	NQZ	Nursultan Nazarbayev International Airport	51.0222	71.4669
KZ	Atyrau oblysy	GUW	Atyrau Airport	47.1219	51.8214
KZ	Almaty	ALA	Almaty International Airport	43.3521	77.0405
KZ	Qaraghandy oblysy	DZN	Zhezkazgan Airport	47.7083	67.7333
KZ	Batys Qazaqstan oblysy	URA	Oral Ak Zhol Airport	51.1508	51.5431
KZ	Aqmola oblysy	ATX	Atbasar Airport	51.8517	68.3633
KZ	Shyghys Qazaqstan oblysy	SZI	Zaysan Airport	47.4875	84.8877
KZ	Almaty oblysy	USJ	Usharal Airport	46.1903	80.8314
LA	Attapu	AOU	Attapeu International Airport	14.7931	107.045
LA	Louang Namtha	LXG	Louang Namtha Airport	20.9606	101.402
LA	Xiangkhouang	XKH	Xieng Khouang Airport	19.4402	103.169
LA	Viangchan	VTE	Wattay International Airport	17.9883	102.563
LA	Bokeo	HOE	Ban Huoeisay Airport	20.2573	100.437
LA	Champasak	PKZ	Pakse International Airport	15.1321	105.781
LA	Oudomxai	ODY	Oudomsay Airport	20.6827	101.994
LA	Champasak	KOG	Khong Island Airport	17.9881	102.563
LA	Louangphabang	LPQ	Luang Prabang International Airport	19.8973	102.161
LA	Khammouan	THK	Thakhek Airport	17.4	104.8
LA	Xaignabouli	ZBY	Sayaboury Airport	19.2436	101.709
LA	Salavan	VNA	Salavan Airport	15.7094	106.411
LA	Phongsali	PCQ	Boun Neua Airport	21.6475	101.9
LA	Houaphan	NEU	Nathong Airport	20.4184	104.067
LA	Savannakhet	ZVK	Savannakhet Airport	16.5566	104.76
LB	Beyrouth	BEY	Beirut-Rafic Hariri International Airport / Beirut Air Base	33.8209	35.4884
LB	Nabatiye	KYE	Rene Mouawad Air Base (Kleyate Airport)	34.5893	36.0113
LC	Castries	SFG	L'Esperance Airport (Grand Case Airport)	18.0999	-63.0472
LC	Castries	SLU	George F. L. Charles Airport	14.0202	-60.9929
LC	Laborie	UVF	Hewanorra International Airport	13.7332	-60.9526
LK	Southern Province	BJT	Bentota River Airport	6.431	79.996
LK	Central Province	KDW	Victoria Reservoir Seaplane Base	7.2415	80.7834
LK	North Central Province	HIM	Hingurakgoda Airport (Minneriya Airport)	8.04981	80.9814
LK	Southern Province	WRZ	Weerawila Airport	6.25449	81.2352
LK	Northern Province	DBK	Dutch Bay Seaplane Base	8.273	79.756
LK	Southern Province	KCT	Koggala Airport	5.99368	80.3203
LK	Eastern Province	AFK	Kondavattavan Tank Seaplane Base	7.284	81.644
LK	Western Province	DWO	Diyawanna Oya Seaplane Base	6.90659	79.909
LK	Northern Province	JAF	Jaffna Airport	9.79233	80.0701
LK	Central Province	DBU	Dambulu Oya Tank Seaplane Base	7.8604	80.6304
LK	Western Province	DGM	Dandugama Seaplane Base	7.1079	79.8721
LK	Western Province	RML	Ratmalana Airport	6.82199	79.8862
LK	Southern Province	HBT	Hambantota Sea Plane Base	6.12404	81.103
LK	Central Province	NUF	Castlereigh Reservoir Seaplane Base	6.86	80.584
LK	Southern Province	HRI	Mattala Rajapaksa International Airport	6.28447	81.1241
LK	Northern Province	IRU	Iranamadu Waterdrome	9.29975	80.4486
LK	Central Province	GIU	Sigiriya Airport	7.95667	80.7285
LK	North Central Province	ACJ	Anuradhapura Airport	8.30149	80.4279
LK	Central Province	ADP	Ampara Airport	7.33776	81.6259
LK	Central Province	NUA	Gregory Lake Seaplane Base	6.95717	80.7795
LK	Western Province	KTY	Katukurunda Airport	6.55212	79.9775
LK	Western Province	CMB	Bandaranaike International Airport	7.18076	79.8841
LK	Central Province	AYY	Arugam Bay Seaplane Base	6.86	81.8239
LK	Southern Province	DIW	Mawella Lagoon Seaplane Base	5.99019	80.7331
LK	Central Province	BTC	Batticaloa Airport	7.70576	81.6788
LK	Central Province	PQD	Batticaloa Seaplane Base	7.92311	81.5677
LK	Western Province	KEZ	Kelani River-Peliyagoda Waterdrome	6.95	79.93
LK	Central Province	TRR	China Bay Airport	8.53851	81.1819
LK	Southern Province	TTW	Tissa Tank Waterdrome	6.2876	81.2906
LK	Western Province	BYV	Beira Lake Seaplane Base	6.92944	79.8542
LK	Central Province	THW	Trincomalee Harbour Seaplane Base	8.56	81.22
LK	Central Province	KDZ	Polgolla Reservoir Seaplane Base	7.3251	80.6422
LR	Sinoe	SNI	Greenville/Sinoe Airport (R.E. Murray Airport)	5.03431	-9.0668
LR	Grand Kru	GRC	Grand Cess Airport	4.571	-8.2076
LR	Grand Bassa	UCN	Buchanan Airport	5.90417	-10.0583
LR	Margibi	ROB	Roberts International Airport	6.23379	-10.3623
LR	Montserrado	MLW	Spriggs Payne Airport	6.28906	-10.7587
LR	Nimba	TPT	Tapeta Airport	6.4948	-8.873
LR	Lofa	VOI	Voinjama Airport (Tenebu Airport)	8.4	-9.767
LR	Nimba	NIA	Nimba Airport	7.5	-8.6
LR	Montserrado	RVC	River Cess Airport	5.47133	-9.58537
LR	Maryland	CPA	Cape Palmas Airport	4.37902	-7.69695
LR	Grand Gedeh	THC	Tchien Airport	6.04565	-8.13872
LR	Lofa	FOY	Foya Airport	8.3513	-10.2269
LR	Grand Kru	SAZ	Sasstown Airport	4.66667	-8.43333
LR	Montserrado	BYL	Bella Yella Airport	7.36917	-9.99372
LS	Qacha's Nek	UNE	Qacha's Nek Airport	-30.1117	28.6719
LS	Mafeteng	MFC	Mafeteng Airport	-29.8011	27.2436
LS	Thaba-Tseka	THB	Thaba Tseka Airport	-29.5228	28.6158
LS	Thaba-Tseka	LES	Lesobeng Airport	-29.7829	28.3167
LS	Qacha's Nek	SKQ	Sekake Airport	-30.0389	28.3703
LS	Leribe	SHZ	Seshutes Airport	-29.2676	28.5523
LS	Thaba-Tseka	SHK	Sehonghong Airport	-29.7309	28.7689
LS	Maseru	MSU	Moshoeshoe I International Airport	-29.4623	27.5525
LS	Maseru	SOK	Semonkong Airport	-29.8386	28.06
LS	Quthing	UTG	Quthing Airport	-30.4075	27.6933
LS	Qacha's Nek	LEF	Lebakeng Airport	-29.8908	28.6556
LS	Mokhotlong	MKH	Mokhotlong Airport	-29.2818	29.0728
LS	Mokhotlong	TKO	Tlokoeng Airport	-29.233	28.883
LS	Thaba-Tseka	MSG	Matsaile Airport	-29.8408	28.7764
LS	Leribe	PEL	Pelaneng Airport	-29.1206	28.5053
LS	Leribe	LRB	Leribe Airport	-28.8556	28.0528
LS	Mohale's Hoek	NKU	Nkaus Airport	-30.0217	28.1969
LT	Klaipedos apskritis	PLQ	Palanga International Airport	55.9732	21.0939
LT	Panevezio apskritis	PNV	Panevezys Air Base (Pajuostis Airport)	55.7294	24.4608
LT	Siauliu apskritis	SQQ	Siauliai International Airport	55.8939	23.395
LT	Kauno apskritis	KUN	Kaunas International Airport	54.9639	24.0848
LU	Luxembourg	LUX	Luxembourg Findel Airport	49.6233	6.20444
LV	Daugavpils novads	DGP	Daugavpils International Airport	55.9447	26.665
LV	Ventspils novads	LPX	Liepaja International Airport	56.5175	21.0969
LV	Ventspils novads	VNT	Ventspils International Airport	57.3578	21.5442
LV	Riga	RIX	Riga International Airport	56.9236	23.9711
LY	Al Wahat	NFR	Nafoora Airport	29.2132	21.5924
LY	Tarabulus	WAX	Zuwarah Airport	32.9523	12.0155
LY	Banghazi	BEN	Benina International Airport	32.0968	20.2695
LY	Darnah	DNF	Martuba Air Base	32.542	22.745
LY	Sabha	BCQ	Brak Airport	27.653	14.272
LY	Al Kufrah	AKF	Kufra Airport	24.1787	23.314
LY	Al Jabal al Akhdar	LAQ	Al Abraq International Airport	32.7887	21.9643
LY	Wadi al Hayat	QUB	Ubari Airport	26.5675	12.8231
LY	Surt	SRX	Gardabya Airport	31.0635	16.595
LY	Tarabulus	MJI	Mitiga International Airport	32.8941	13.276
LY	Al Jabal al Gharbi	ZIS	Zintan Airport	31.7749	12.2501
LY	Al Jufrah	HUQ	Hun Airport	29.1101	15.9656
LY	Al Butnan	TOB	Tobruk Airport	31.861	23.907
LY	Al Wahat	LMQ	Marsa Brega Airport	30.3781	19.5764
LY	Ghat	GHT	Ghat Airport	25.1456	10.1426
LY	Sabha	SEB	Sabha Airport	26.987	14.4725
LY	Misratah	MRA	Misrata Airport	32.325	15.061
LY	Nalut	LTD	Ghadames Airport	30.1517	9.71531
LY	Tarabulus	TIP	Tripoli International Airport	32.6635	13.159
MA	Marrakech-Safi	RAK	Marrakesh Menara Airport	31.6069	-8.0363
MA	Draa-Tafilalet	OZZ	Ouarzazate Airport	30.9391	-6.90943
MA	L'Oriental	OUD	Angads Airport	34.7872	-1.92399
MA	Laayoune-Sakia El Hamra (EH-partial)	SMW	Smara Airport	26.7318	-11.6847
MA	Casablanca-Settat	CAS	Anfa Airport	33.5533	-7.66139
MA	Draa-Tafilalet	OZG	Zagora Airport	30.3203	-5.86667
MA	Fes- Meknes	FEZ	Fes-Saiss Airport	33.9273	-4.97796
MA	Draa-Tafilalet	ERH	Moulay Ali Cherif Airport	31.9475	-4.39833
MA	Casablanca-Settat	CMN	Mohammed V International Airport	33.3675	-7.58997
MA	Guelmim-Oued Noun (EH-partial)	GLN	Guelmim Airport	29.0267	-10.0503
MA	Guelmim-Oued Noun (EH-partial)	TTA	Tan Tan Airport (Plage Blanche Airport)	28.4482	-11.1613
MA	L'Oriental	NDR	Nador International Airport	34.9888	-3.02821
MA	Rabat-Sale-Kenitra	NNA	Kenitra Air Base	34.2989	-6.59588
MA	Souss-Massa	ESU	Essaouira-Mogador Airport	31.3975	-9.68167
MA	Tanger-Tetouan-Al Hoceima	TNG	Tangier Ibn Battouta Airport	35.7269	-5.91689
MA	Rabat-Sale-Kenitra	RBA	Rabat-Sale Airport	34.0515	-6.75152
MA	L'Oriental	UAR	Bouarfa Airport	32.5143	-1.98306
MA	Laayoune-Sakia El Hamra (EH-partial)	EUN	Hassan I Airport	27.1517	-13.2192
MA	Beni-Mellal-Khenifra	BEM	Beni Mellal Airport	32.4019	-6.31591
MA	Casablanca-Settat	GMD	Ben Slimane Airport	33.6554	-7.22145
MA	Laayoune-Sakia El Hamra (EH-partial)	VIL	Dakhla Airport	23.7183	-15.932
MA	Fes- Meknes	MEK	Bassatine Air Base	33.8791	-5.51512
MA	Guelmim-Oued Noun (EH-partial)	SII	Sidi Ifni Airport (Sania Ramel Airport)	29.3667	-10.1878
MA	Souss-Massa	AGA	Agadir-Al Massira Airport	30.325	-9.41307
MA	Tanger-Tetouan-Al Hoceima	TTU	Sania Ramel Airport	35.5943	-5.32002
MA	Tanger-Tetouan-Al Hoceima	AHU	Cherif Al Idrissi Airport	35.1771	-3.83952
MA	Marrakech-Safi	SFI	Safi Airport	32.2731	-9.23694
MD	Chisinau	KIV	Chisinau International Airport	46.9277	28.931
MD	Balti	BZY	Balti International Airport	47.8431	27.7772
ME	Podgorica	TGD	Podgorica Airport	42.3594	19.2519
ME	Tivat	TIV	Tivat Airport	42.4047	18.7233
ME	Pljevlja	ZBK	Zabljak Airport	43.1167	19.2333
ME	Berane	IVG	Dolac Airport	42.839	19.862
MG	Antananarivo	OHB	Ambohibary Airport	-18.9175	48.2182
MG	Antananarivo	WTS	Tsiroanomandidy Airport	-18.7597	46.0541
MG	Antananarivo	WAD	Andriamena Airport	-17.631	47.7233
MG	Mahajanga	WTA	Tambohorano Airport	-17.4761	43.9728
MG	Mahajanga	TZO	Tsimiroro Airport	-18.3451	45.0156
MG	Mahajanga	WPB	Port Berge Airport	-15.5843	47.6236
MG	Antananarivo	VND	Vangaindrano Airport	-23.3508	47.5817
MG	Toamasina	WMR	Mananara Nord Airport	-16.1639	49.7738
MG	Mahajanga	WMV	Madirovalo Airport	-16.45	46.5667
MG	Mahajanga	WMP	Mampikony Airport	-16.0723	47.6442
MG	Antsiranana	WOR	Moramba Airport	-12.4333	49.1
MG	Toliara	AMP	Ampanihy Airport	-24.6997	44.7342
MG	Toamasina	WMN	Maroantsetra Airport	-15.4367	49.6883
MG	Mahajanga	BZM	Bemolanga Airport	-17.6925	45.0888
MG	Toliara	WML	Malaimbandy Airport	-20.3554	45.5434
MG	Mahajanga	AMY	Ambatomainty Airport	-17.6867	45.6239
MG	Toliara	WMD	Mandabe Airport	-21.0463	44.9404
MG	Mahajanga	WMA	Mandritsara Airport	-15.833	48.8333
MG	Toliara	OVA	Bekily Airport	-24.2357	45.3045
MG	Toliara	DVD	Andavadoaka Airport	-22.0661	43.2596
MG	Mahajanga	DWB	Soalala Airport	-16.1017	45.3588
MG	Fianarantsoa	WFI	Fianarantsoa Airport	-21.4416	47.1117
MG	Mahajanga	BSV	Besakoa Airport	-15.6725	47.0617
MG	Toliara	WBO	Antsoa Airport	-21.607	45.136
MG	Mahajanga	WBE	Ankaizina Airport	-14.5443	48.6914
MG	Toliara	MJA	Manja Airport	-21.4261	44.3165
MG	Mahajanga	WBD	Befandriana Airport	-15.2	48.483
MG	Antananarivo	ATJ	Antsirabe Airport	-19.8392	47.0637
MG	Toliara	JVA	Ankavandra Airport	-18.805	45.2735
MG	Toliara	BMD	Belo sur Tsiribihina Airport	-19.6867	44.5419
MG	Mahajanga	WAQ	Antsalova Airport	-18.7013	44.6149
MG	Toamasina	WAM	Ambatondrazaka Airport	-17.7954	48.4426
MG	Toliara	WAK	Ankazoabo Airport	-22.2964	44.5315
MG	Mahajanga	WAI	Ambalabe Airport	-14.8988	47.9939
MG	Mahajanga	MJN	Amborovy Airport (Philibert Tsiranana Airport)	-15.6668	46.3512
MG	Toamasina	VVB	Mahanoro Airport	-19.833	48.8
MG	Toliara	MXM	Morombe Airport	-21.7539	43.3755
MG	Mahajanga	MXT	Maintirano Airport	-18.05	44.033
MG	Toamasina	VAT	Vatomandry Airport	-19.3833	48.95
MG	Mahajanga	TVA	Morafenobe Airport	-17.8501	44.9205
MG	Mahajanga	TTS	Tsaratanana Airport	-16.7511	47.619
MG	Mahajanga	HVA	Analalava Airport	-14.6297	47.7638
MG	Mahajanga	BPY	Besalampy Airport	-16.7445	44.4825
MG	Antananarivo	TNR	Ivato International Airport	-18.7969	47.4788
MG	Toamasina	TMM	Toamasina Airport	-18.1095	49.3925
MG	Toliara	TLE	Toliara Airport	-23.3834	43.7285
MG	Toliara	FTU	Tolanaro Airport (Marillac Airport)	-25.0381	46.9561
MG	Fianarantsoa	RVA	Farafangana Airport	-22.8053	47.8206
MG	Toliara	TDV	Samangoky Airport	-21.7	43.733
MG	Toliara	BKU	Betioky Airport	-23.733	44.389
MG	Toamasina	ILK	Ilaka-Est Airport (Atsinanana Airport)	-19.583	48.803
MG	Fianarantsoa	MNJ	Mananjary Airport	-21.2018	48.3583
MG	Toamasina	SMS	Sainte Marie Airport	-17.0939	49.8158
MG	Toliara	MOQ	Morondava Airport	-20.2847	44.3176
MG	Antananarivo	AHY	Ambatolahy Airport	-20.0158	45.535
MG	Fianarantsoa	IHO	Ihosy Airport	-22.4047	46.1649
MG	Fianarantsoa	WVK	Manakara Airport	-22.1197	48.0217
MG	Toliara	ZVA	Miandrivazo Airport	-19.5628	45.4508
MH	Majuro	TBV	Tabal Airport	8.3027	171.161
MH	Utrik	UTK	Utirik Airport	11.222	169.852
MH	Majuro	MAJ	Marshall Islands International Airport (Amata Kabua Int'l)	7.06476	171.272
MH	Bikini & Kili	BII	Bikini Atoll Airport	11.5225	165.565
MH	Aur	AUL	Aur Airport	8.14528	171.173
MH	Arno	IMI	Ine Airport	7.00555	171.657
MH	Mejit	MJB	Mejit Airport	10.2833	170.869
MH	Rongelap	RNP	Rongelap Airport	11.1572	166.887
MH	Likiep	LIK	Likiep Airport	9.82316	169.308
MH	Jaluit	UIT	Jaluit Airport	5.90924	169.637
MH	Kwajalein	KWA	Bucholz Army Airfield	8.72012	167.732
MH	Namu	MJE	Majkin Airport	7.76291	168.266
MH	Ujae	UJE	Ujae Airport	8.92806	165.762
MH	Kwajalein	EBN	Ebadon Airstrip	9.33056	166.82
MH	Kwajalein	WTE	Wotje Airport	9.45833	170.239
MH	Ebon	EBO	Ebon Airport	4.5982	168.752
MH	Namdrik	NDK	Namorik Airport (Namdrik Airport)	5.63167	168.125
MH	Jabat	JAT	Jabot Airport	7.74977	168.978
MH	Kwajalein	EAL	Elenak Airport	9.31931	166.848
MH	Maloelap	MAV	Maloelap Airport	8.70444	171.23
MH	Enewetak & Ujelang	ENT	Enewetak Auxiliary Airfield	11.3407	162.328
MH	Kwajalein	LOF	Loen Airport	7.7575	168.236
MH	Wotho	WTO	Wotho Airport	10.1733	166.003
MH	Mili	EJT	Enejit Airport	6.0404	171.985
MH	Maloelap	KBT	Kaben Airport	8.90056	170.844
MH	Ailinglaplap	JEJ	Jeh Airport	7.56535	168.962
MH	Arno	TIC	Tinak Airport	7.13333	171.917
MH	Ailinglaplap	AIC	Ailinglaplap Airok Airport	7.27942	168.826
MH	Mili	MIJ	Mili Airport	6.08333	171.733
MH	Lae	LML	Lae Airport	8.92111	166.265
MH	Ailinglaplap	WJA	Woja Airport	7.45083	168.55
MH	Ailuk	AIM	Ailuk Airport	10.2168	169.983
MH	Bikini & Kili	KIO	Kili Airport	5.64452	169.12
MK	Ohrid	OHD	Ohrid St. Paul the Apostle Airport	41.18	20.7423
MK	Skopje	SKP	Skopje Alexander the Great Airport	41.9616	21.6214
ML	Kayes	KNZ	Kenieba Airport	12.833	-11.25
ML	Tombouctou	TOM	Timbuktu Airport	16.7305	-3.00758
ML	Bamako	BKO	Bamako-Senou International Airport	12.5335	-7.94994
ML	Koulikoro	NRM	Keibane Airport	15.217	-7.267
ML	Kayes	KYS	Kayes Airport (Dag-Dag Airport)	14.4812	-11.4044
ML	Segou	SZU	Segou Airport	13.4	-6.15
ML	Gao	GAQ	Gao International Airport (Korogoussou Airport)	16.2484	-0.005456
ML	Tombouctou	GUD	Goundam Airport	16.3614	-3.59972
ML	Kayes	NIX	Nioro Airport	15.2381	-9.57611
ML	Sikasso	KTX	Koutiala Airport	12.383	-5.467
ML	Sikasso	KSS	Sikasso Airport	11.333	-5.7
ML	Mopti	MZI	Mopti Airport (Ambodedjo Airport)	14.5128	-4.07956
ML	Kayes	EYL	Yelimane Airport	15.133	-10.567
MM	Ayeyarwady	VBA	Ann Airport	19.7692	94.0261
MM	Shan	THL	Tachilek Airport	20.4838	99.9354
MM	Shan	NMT	Namtu Airport	23.083	97.383
MM	Sagaing	NYW	Monywa Airport	22.2216	95.0935
MM	Shan	NMS	Nansang Airport	20.8905	97.7359
MM	Shan	MOE	Momeik Airport	23.0925	96.6453
MM	Mandalay	NYU	Nyaung U Airport	21.1788	94.9302
MM	Tanintharyi	VBP	Bokpyin Airport	11.1494	98.7359
MM	Mandalay	NYT	Naypyidaw Airport	19.6235	96.201
MM	Magway	TIO	Tilin Airport	21.7	94.1
MM	Rakhine	GWA	Gwa Airport	17.6	94.5833
MM	Rakhine	KYP	Kyaukpyu Airport	19.4264	93.5348
MM	Yangon	RGN	Yangon International Airport	16.9073	96.1332
MM	Shan	MOG	Monghsat Airport	20.5168	99.2568
MM	Magway	MWQ	Magway Airport	20.1656	94.9414
MM	Magway	KYT	Kyauktu Airport	21.4	94.1333
MM	Kachin	MYT	Myitkyina Airport	25.3836	97.3519
MM	Shan	MGK	Mong Ton Airport	20.2967	98.8989
MM	Rakhine	MGU	Manaung Airport	18.8458	93.6889
MM	Tanintharyi	MGZ	Myeik Airport	12.4398	98.6215
MM	Tanintharyi	KAW	Kawthaung Airport	10.0493	98.538
MM	Sagaing	HOX	Homalin Airport	24.8996	94.914
MM	Tanintharyi	TVY	Dawei Airport	14.1039	98.2036
MM	Shan	LSH	Lashio Airport	22.9779	97.7522
MM	Sagaing	KHM	Khamti Airport	25.9883	95.6744
MM	Sagaing	KMV	Kalaymyo Airport (Kalemyo Airport)	23.1888	94.0511
MM	Ayeyarwady	HEB	Hinthada Airport	17.6333	95.4667
MM	Kachin	BMO	Bhamo Airport	24.269	97.2462
MM	Mon	XYE	Ye Airport	15.3	97.867
MM	Kayin	PAA	Hpa-An Airport	16.8937	97.6746
MM	Mon	MNU	Mawlamyaing Airport	16.4447	97.6607
MM	Kayah	LIW	Loikaw Airport	19.6915	97.2148
MM	Kayin	PPU	Papun Airport	18.0667	97.4498
MM	Shan	KET	Kengtung Airport	21.3016	99.636
MM	Shan	HEH	Heho Airport	20.747	96.792
MM	Ayeyarwady	BSX	Pathein Airport	16.8152	94.7799
MM	Magway	PAU	Pauk Airport	21.4492	94.4869
MM	Magway	PKK	Pakokku Airport	21.4043	95.1113
MM	Rakhine	SNW	Thandwe Airport	18.4607	94.3001
MM	Rakhine	AKY	Sittwe Airport	20.1327	92.8726
MM	Mandalay	VBC	Mandalay Chanmyathazi Airport	21.9405	96.0896
MM	Mandalay	MDL	Mandalay International Airport	21.7022	95.9779
MM	Magway	GAW	Gangaw Airport	22.1747	94.1344
MM	Kachin	PBU	Putao Airport	27.3299	97.4263
MM	Bago	PRU	Pyay Airport	18.8245	95.266
MN	Dornogovi	XRQ	Xinbarag Youqi Baogede Airport	48.5756	116.939
MN	Ulaanbaatar	ULN	Chinggis Khaan International Airport	47.8431	106.767
MN	Ovorhangay	UGT	Bulagtai Airport	43.7493	104.115
MN	Suhbaatar	UUN	Baruun-Urt Airport	46.6603	113.285
MN	Ovorhangay	HJT	Khujirt Airport	46.9258	102.773
MN	Ovorhangay	AVK	Arvaikheer Airport	46.2503	102.802
MN	Omnogovi	DLZ	Dalanzadgad Airport	43.5917	104.43
MN	Hovd	HVD	Khovd Airport	47.9541	91.6282
MN	Arhangay	TSZ	Tsetserleg Airport	47.4654	101.478
MN	Uvs	ULO	Ulaangom Airport	50.0666	91.9383
MN	Dornod	COQ	Choibalsan Airport	48.1357	114.646
MN	Hovd	HBU	Bulgan Airport	46.1006	91.5842
MN	Bayanhongor	BYN	Bayankhongor Airport	46.1633	100.704
MN	Govi-Altay	LTI	Altai Airport	46.3764	96.2211
MN	Bulgan	UGA	Bulgan Airport	48.855	103.476
MN	Hovsgol	HTM	Khatgal Airport	50.436	100.14
MN	Ovorhangay	KHR	Kharkhorin Airport	47.2467	102.826
MN	Hentiy	UNR	Ondorkhaan Airport	47.3049	110.609
MN	Govi-Altay	ULZ	Donoi Airport	47.7093	96.5258
MN	Dzavhan	TNZ	Tosontsengel Airport	48.7389	98.2941
MN	Orhon	ERT	Erdenet Airport	48.9831	104.151
MN	Dundgovi	MXW	Mandalgovi Airport	45.7381	106.269
MN	Hovsgol	MXV	Moron Airport	49.6633	100.099
MN	Bayan-Olgiy	ULG	Olgii Airport	48.9933	89.9225
MN	Ulaanbaatar	UBN	Chinggis Khaan International Airport	47.6516	106.822
MP	Northern Mariana Islands	ROP	Rota International Airport	14.1743	145.243
MP	Northern Mariana Islands	SPN	Saipan International Airport (Francisco C. Ada Int'l)	15.119	145.729
MP	Northern Mariana Islands	TIQ	Tinian International Airport (West Tinian Airport)	14.9992	145.619
MQ	Martinique	FDF	Martinique Aime Cesaire International Airport	14.591	-61.0032
MR	Nouakchott Nord	MBR	M'Bout Airport	16.0333	-12.6
MR	Tiris Zemmour	OUZ	Tazadit Airport	22.7564	-12.4836
MR	Nouakchott Nord	NKC	Nouakchott-Oumtounsy International Airport	18.31	-15.9697
MR	Tagant	MOM	Letfotar Airport	17.75	-12.5
MR	Assaba	KFA	Kiffa Airport	16.59	-11.4062
MR	Nouakchott Nord	LEG	Aleg Airport	17.1667	-13.95
MR	Trarza	OTL	Boutilimit Airport	17.533	-14.683
MR	Nouakchott Nord	AEO	Aioun el Atrouss Airport	16.7113	-9.63788
MR	Adrar	ATR	Atar International Airport	20.5068	-13.0432
MR	Tagant	THI	Tichitt Airport	18.45	-9.517
MR	Nouakchott Nord	THT	Tamchakett Airport	17.233	-10.817
MR	Tiris Zemmour	EMN	Nema Airport	16.622	-7.3166
MR	Gorgol	KED	Kaedi Airport	16.1595	-13.5076
MR	Tagant	TIY	Tidjikja Airport	18.5701	-11.4235
MR	Tiris Zemmour	CGT	Chinguetti Airport	20.5055	-12.3978
MR	Tiris Zemmour	FGD	Fderik Airport	22.667	-12.733
MR	Inchiri	AJJ	Akjoujt Airport	19.733	-14.3832
MR	Tiris Zemmour	TMD	Timbedra Airport	16.233	-8.167
MR	Brakna	BGH	Abbaye Airport	16.6333	-14.2
MR	Guidimaka	SEY	Selibaby Airport	15.1797	-12.2073
MR	Dakhlet Nouadhibou	NDB	Nouadhibou International Airport	20.9331	-17.03
MS	Saint Peter	MNI	John A. Osborne Airport	16.7914	-62.1933
MT	Luqa	MLA	Malta International Airport (Luqa Airport)	35.8575	14.4775
MU	Rodrigues Islands	RRG	Sir Gaetan Duval Airport	-19.7577	63.361
MU	Grand Port	MRU	Sir Seewoosagur Ramgoolam International Airport	-20.4302	57.6836
MV	Baa	NMF	Maafaru International Airport	5.82222	73.4747
MV	Thaa	TMF	Thimarafushi Airport	2.211	73.1533
MV	Laamu	KDO	Kadhdhoo Airport	1.85917	73.5219
MV	Gnaviyani	FVM	Fuvahmulah Airport	-0.309722	73.435
MV	Baa	DRV	Dharavandhoo Airport	5.1561	73.1302
MV	Kaafu	MLE	Velana International Airport	4.19183	73.5291
MV	Haa Dhaalu	FND	Funadhoo Airport	6.16111	73.2872
MV	Noonu	IFU	Ifuru Airport	5.7083	73.025
MV	Gaafu Dhaalu	KDM	Kaadedhdhoo Airport	0.488131	72.9969
MV	Baa	VAM	Villa International Airport	3.47056	72.8358
MV	Seenu	GAN	Gan International Airport	-0.693342	73.1556
MV	Laamu	GKK	Kooddoo Airport	0.7324	73.4336
MV	Haa Dhaalu	HAQ	Hanimaadhoo International Airport	6.74423	73.1705
MW	Mangochi	VUU	Mvuu Camp Airport	-14.8386	35.3014
MW	Karonga	KGJ	Karonga Airport	-9.95357	33.893
MW	Blantyre	BLZ	Chileka International Airport	-15.6791	34.974
MW	Lilongwe	LLW	Lilongwe International Airport (Kamuzu Int'l)	-13.7894	33.781
MW	Kasungu	KBQ	Kasungu Airport	-13.0146	33.4686
MW	Mangochi	MYZ	Monkey Bay Airport	-14.0836	34.9197
MW	Nkhotakota	DWA	Dwanga Airport (Dwangwa Airport)	-12.5183	34.1319
MW	Mangochi	MAI	Mangochi Airport	-14.483	35.267
MW	Mangochi	CMK	Club Makokola Airport	-14.3069	35.1325
MW	Salima	LMB	Salima Airport	-13.7559	34.5842
MW	Mzimba	ZZU	Mzuzu Airport	-11.4447	34.0118
MW	Likoma	LIX	Likoma Airport	-12.0758	34.7372
MW	Chitipa	CEH	Chelinda Airport	-10.55	33.8
MX	Colima	CLQ	Licenciado Miguel de la Madrid Airport	19.277	-103.577
MX	Chiapas	CJT	Copalar Airport	16.1767	-92.0506
MX	Chihuahua	CJS	Abraham Gonzalez International Airport	31.6361	-106.429
MX	Quintana Roo	PCM	Playa del Carmen Airport	20.6225	-87.0822
MX	Baja California	TIJ	Tijuana International Airport	32.5411	-116.97
MX	Baja California Sur	PCO	Punta Colorada Airstrip	23.575	-109.536
MX	Michoacan de Ocampo	MLM	General Francisco J. Mujica International Airport	19.8499	-101.025
MX	Oaxaca	OAX	Xoxocotlan International Air	16.9999	-96.7266
MX	Chiapas	TGZ	Angel Albino Corzo International Airport	16.5636	-93.0225
MX	Baja California	SFH	San Felipe International Airport	30.9302	-114.809
MX	Queretaro	QRO	Queretaro Intercontinental Airport	20.6173	-100.186
MX	San Luis Potosi	SLP	Ponciano Arriaga International Airport	22.2543	-100.931
MX	Baja California Sur	PCV	Punta Chivato Airstrip	27.0692	-111.962
MX	Sonora	HMO	General Ignacio Pesqueira Garcia International Airport	29.0959	-111.048
MX	Jalisco	GDL	Guadalajara International Airport (Miguel Hidalgo y Costilla Int'l)	20.5218	-103.311
MX	Guerrero	ACA	General Juan N. Alvarez International Airport	16.7571	-99.754
MX	Baja California Sur	SGM	San Ignacio Airfield	27.2966	-112.938
MX	Coahuila de Zaragoza	ACN	Ciudad Acuna International Airport	29.3329	-101.099
MX	Puebla	TCN	Tehuacan Airport	18.4972	-97.4199
MX	Sonora	CEN	Ciudad Obregon International Airport	27.3926	-109.833
MX	Quintana Roo	ISJ	Isla Mujeres Airport	21.245	-86.74
MX	Veracruz de Ignacio de la Llave	MTT	Minatitlan/Coatzacoalcos International Airport	18.1034	-94.5807
MX	Chiapas	TAP	Tapachula International Airport	14.7943	-92.37
MX	Nuevo Leon	MTY	General Mariano Escobedo International Airport	25.7785	-100.107
MX	Baja California Sur	LTO	Loreto International Airport	25.9892	-111.348
MX	Baja California Sur	MUG	Mulege Airstrip	26.9053	-111.971
MX	Coahuila de Zaragoza	SLW	Plan de Guadalupe International Airport	25.5495	-100.929
MX	Coahuila de Zaragoza	PDS	Piedras Negras International Airport	28.6274	-100.535
MX	Oaxaca	SCX	Salina Cruz Airport	16.2126	-95.2016
MX	Sonora	PPE	Puerto Penasco International Airport	31.352	-113.305
MX	Tabasco	VSA	Carlos Rovirosa Perez International Airport	17.997	-92.8174
MX	Baja California	MXL	General Rodolfo Sanchez Taboada International Airport	32.6306	-115.242
MX	Baja California Sur	VIB	Villa Constitucion Airport	25.0552	-111.687
MX	Baja California	BHL	Bahia de los Angeles Airport	28.9786	-113.561
MX	Tamaulipas	TAM	General Francisco Javier Mina International Airport	22.2964	-97.8659
MX	Chiapas	PQM	Palenque International Airport	17.5332	-92.0155
MX	Coahuila de Zaragoza	LOV	Venustiano Carranza International Airport	26.9557	-101.47
MX	Veracruz de Ignacio de la Llave	VER	General Heriberto Jara International Airport	19.1459	-96.1873
MX	Baja California Sur	GUB	Guerrero Negro Airport	28.0261	-114.024
MX	Baja California Sur	SJD	Los Cabos International Airport	23.1518	-109.721
MX	Jalisco	LOM	Francisco Primo de Verdad National Airport	21.2581	-101.944
MX	Sinaloa	MZT	General Rafael Buelna International Airport	23.1614	-106.266
MX	Sonora	XAL	Alamos Airport	27.0357	-108.948
MX	Michoacan de Ocampo	ZMM	Zamora National Airport	20.045	-102.276
MX	Michoacan de Ocampo	UPN	Ignacio Lopez Rayon International Airport	19.3967	-102.039
MX	Colima	ZLO	Playa de Oro International Airport	19.1448	-104.559
MX	Aguascalientes	AGU	Lic. Jesus Teran Peredo International Airport	21.7056	-102.318
MX	Sonora	GYM	General Jose Maria Yanez International Airport	27.969	-110.925
MX	Sinaloa	LMM	Valle del Fuerte Federal International Airport	25.6852	-109.081
MX	Tamaulipas	REX	General Lucio Blanco International Airport	26.0089	-98.2285
MX	Michoacan de Ocampo	AZG	Pablo L. Sidar Airport	19.0934	-102.394
MX	Guerrero	ZIH	Ixtapa-Zihuatanejo International Airport	17.6016	-101.461
MX	Chihuahua	NCG	Nuevo Casas Grandes Municipal Airport	30.3974	-107.875
MX	Durango	DGO	General Guadalupe Victoria International Airport	24.1242	-104.528
MX	Michoacan de Ocampo	LZC	Lazaro Cardenas Airport	18.0017	-102.221
MX	Mexico	AZP	Jorge Jimenez Cantu National Airport	19.5748	-99.2888
MX	Baja California	ESE	Ensenada Airport	31.7953	-116.603
MX	Quintana Roo	CZM	Cozumel International Airport	20.5224	-86.9256
MX	Sonora	UAC	San Luis Rio Colorado Airport	32.4453	-114.798
MX	Baja California Sur	AJS	Punta Abreojos Airstrip	26.7272	-113.559
MX	Yucatan	TZM	Cupul National Airport	21.1557	-88.1729
MX	Baja California	SNQ	San Quintin Military Airstrip	30.5288	-115.946
MX	Baja California Sur	LAP	Manuel Marquez de Leon International Airport	24.0727	-110.362
MX	Yucatan	CZA	Chichen Itza International Airport	20.6413	-88.4462
MX	Quintana Roo	TUY	Tulum Airport	20.2273	-87.4382
MX	Guanajuato	BJX	Del Bajio International Airport (Guanajuato Int'l Airport)	20.9935	-101.481
MX	Zacatecas	ZCL	General Leobardo C. Ruiz International Airport	22.8971	-102.687
MX	Guanajuato	CYW	Captain Rogelio Castillo National Airport	20.546	-100.887
MX	Veracruz de Ignacio de la Llave	PAZ	El Tajin National Airport	20.6027	-97.4608
MX	Baja California Sur	SRL	Palo Verde Airport	27.0927	-112.099
MX	Puebla	PBC	Hermanos Serdan International Airport	19.1581	-98.3714
MX	Tamaulipas	NLD	Quetzalcoatl International Airport	27.4439	-99.5705
MX	Oaxaca	HUX	Bahias de Huatulco International Airport	15.7753	-96.2626
MX	Mexico	NLU	Felipe A ngeles International Airport	19.7553	-99.0164
MX	San Luis Potosi	TSL	Tamuin National Airport	22.0383	-98.8065
MX	Tamaulipas	CVM	General Pedro J. Mendez International Airport	23.7033	-98.9565
MX	Morelos	CVJ	General Mariano Matamoros Airport	18.8348	-99.2613
MX	Chihuahua	CUU	General Roberto Fierro Villalobos International Airport	28.7029	-105.965
MX	Quintana Roo	CUN	Cancun International Airport	21.0365	-86.8771
MX	Tamaulipas	MAM	General Servando Canales International Airport	25.7699	-97.5253
MX	Sonora	NOG	Nogales International Airport	31.2261	-110.976
MX	Coahuila de Zaragoza	TRC	Francisco Sarabia International Airport	25.5683	-103.411
MX	Sinaloa	CUL	Bachigualato Federal International Airport	24.7645	-107.475
MX	Baja California Sur	CUA	Ciudad Constitucion Airport	25.0538	-111.615
MX	Quintana Roo	CTM	Chetumal International Airport	18.5047	-88.3268
MX	Nayarit	TPQ	Amado Nervo International Airport	21.4195	-104.843
MX	Mexico	MEX	Mexico City International Airport	19.4363	-99.0721
MX	Veracruz de Ignacio de la Llave	JAL	El Lencero Airport	19.4751	-96.7975
MX	Jalisco	PVR	Licenciado Gustavo Diaz Ordaz International Airport	20.6801	-105.254
MX	Campeche	CPE	Ing. Alberto Acuna Ongay International Airport	19.8168	-90.5003
MX	Oaxaca	IZT	Ixtepec Airport	16.4493	-95.0937
MX	Nuevo Leon	NTR	Del Norte International Airport	25.8656	-100.237
MX	Yucatan	MID	Manuel Crescencio Rejon International Airport	20.937	-89.6577
MX	Sonora	CNA	Cananea National Airport	31.0662	-110.098
MX	Mexico	TLC	Licenciado Adolfo Lopez Mateos International Airport	19.3371	-99.566
MX	Oaxaca	PXM	Puerto Escondido International Airport	15.8769	-97.0891
MX	Tamaulipas	MMC	Ciudad Mante National Airport	22.7432	-99.0174
MX	Campeche	CME	Ciudad del Carmen International Airport	18.6537	-91.799
MY	Pulau Pinang	PEN	Penang International Airport	5.29714	100.277
MY	Sarawak	LSM	Long Semado Airport	4.217	115.6
MY	Sabah	SMM	Semporna Airport	4.45	118.583
MY	Sarawak	ODN	Long Seridan Airport	3.967	115.05
MY	Sabah	LBU	Labuan Airport	5.30068	115.25
MY	Johor	ZJT	Tanjung Pelepas Port Airport	1.58333	110.483
MY	Selangor	SZB	Sultan Abdul Aziz Shah Airport	3.13058	101.549
MY	Sarawak	BTU	Bintulu Airport	3.12385	113.02
MY	Sarawak	MZV	Mulu Airport	4.04833	114.805
MY	Sarawak	MKM	Mukah Airport	2.90639	112.08
MY	Sarawak	TGC	Tanjung Manis Airport	2.17784	111.202
MY	Kedah	AOR	Sultan Abdul Halim Airport	6.18967	100.398
MY	Sarawak	BSE	Sematan Airport	1.81361	109.763
MY	Johor	ZLW	Pasir Gudang Port Airport	5.95	102.083
MY	Perak	TPG	Taiping Airport	4.867	100.717
MY	Johor	MEP	Mersing Airport	2.383	103.867
MY	Selangor	KUL	Kuala Lumpur International Airport	2.74558	101.71
MY	Terengganu	KTE	Kerteh Airport	4.53722	103.427
MY	Sabah	TWU	Tawau Airport	4.32016	118.128
MY	Melaka	MKZ	Malacca International Airport	2.26336	102.252
MY	Perak	IPH	Sultan Azlan Shah Airport	4.56797	101.092
MY	Sarawak	LBP	Long Banga Airport	3.202	115.402
MY	Sabah	GSA	Long Pasia Airport	4.4	115.717
MY	Sabah	LAC	Layang-Layang Airport (Swallow Reef Airport)	7.37157	113.844
MY	Sarawak	BBN	Bario Airport	3.73389	115.479
MY	Terengganu	TGG	Sultan Mahmud Airport	5.38264	103.103
MY	Pulau Pinang	BWH	RMAF Butterworth	5.46592	100.391
MY	Sabah	SDK	Sandakan Airport	5.9009	118.059
MY	Terengganu	RDN	Redang Airport	5.76528	103.007
MY	Pahang	SXT	Sungai Tiang Airport	4.33028	102.395
MY	Sarawak	LWY	Lawas Airport	4.84917	115.408
MY	Perak	SWY	Sitiawan Airport	4.2222	100.699
MY	Sabah	LDU	Lahad Datu Airport	5.03225	118.324
MY	Sabah	TMG	Tommanggong Airport	5.40257	118.658
MY	Kelantan	KBR	Sultan Ismail Petra Airport	6.16685	102.293
MY	Sarawak	LSU	Long Sukang Airport	4.55222	115.494
MY	Sarawak	MYY	Miri Airport	4.32201	113.987
MY	Sarawak	KCH	Kuching International Airport	1.4847	110.347
MY	Sabah	SPT	Sipitang Airstrip	5.08333	115.55
MY	Pahang	TOD	Tioman Airport	2.81818	104.16
MY	Sabah	RNU	Ranau Airport	5.95	116.667
MY	Sarawak	LGL	Long Lellang Airport	3.421	115.154
MY	Johor	JHB	Senai International Airport	1.64131	103.67
MY	Sabah	SPE	Sepulot Airport	4.733	116.467
MY	Kedah	LGK	Langkawi International Airport	6.32973	99.7287
MY	Sarawak	KPI	Kapit Airport	2.01052	112.931
MY	Sarawak	BLG	Belaga Airport	2.65	113.767
MY	Sarawak	LKH	Long Akah Airport	3.3	114.783
MY	Sarawak	LMN	Limbang Airport	4.8083	115.01
MY	Perak	PKG	Pangkor Airport	4.24472	100.553
MY	Sarawak	BKM	Bakelalan Airport	3.974	115.618
MY	Sabah	PAY	Pamol Airport	5.9993	117.4
MY	Sabah	BKI	Kota Kinabalu International Airport	5.93721	116.051
MY	Pahang	KUA	Sultan Haji Ahmad Shah Airport (RMAF Kuantan)	3.77539	103.209
MY	Sarawak	SBW	Sibu Airport	2.2616	111.985
MY	Sabah	KGU	Keningau Airport	5.35749	116.162
MY	Sarawak	MUR	Marudi Airport	4.17898	114.329
MY	Sabah	SXS	Sahabat Airport	5.08778	119.094
MY	Sabah	KUD	Kudat Airport	6.9225	116.836
MY	Sabah	TEL	Telupid Airport	5.62861	117.126
MY	Sarawak	SGG	Simanggang Airport	1.20872	111.453
MZ	Maputo	PDD	Ponta do Ouro Airport	-26.8286	32.8377
MZ	Sofala	RRM	Marromeu Airport	-18.2929	35.9345
MZ	Nampula	MMW	Moma Airport	-16.75	39.2167
MZ	Zambezia	INE	Chinde Airport	-18.59	36.4489
MZ	Zambezia	MJS	Maganja da Costa Airport	-17.3087	37.5
MZ	Nampula	AME	Alto Molocue Airport	-15.6103	37.6814
MZ	Sofala	NTC	Santa Carolina Airport	-21.615	35.338
MZ	Zambezia	UEL	Quelimane Airport	-17.8555	36.8691
MZ	Cabo Delgado	NND	Nangade Airport	-11.073	39.68
MZ	Inhambane	IBL	Indigo Bay Lodge Airport	-21.708	35.4528
MZ	Niassa	FXO	Cuamba Airport	-14.815	36.53
MZ	Sofala	IMG	Inhaminga Airport	-18.41	35.0045
MZ	Manica	VPY	Chimoio Airport	-19.1513	33.429
MZ	Nampula	APL	Nampula Airport	-15.1056	39.2818
MZ	Cabo Delgado	LMZ	Palma Airport	-10.7506	40.4702
MZ	Cabo Delgado	MTU	Montepuez Airport	-13.1219	39.0528
MZ	Inhambane	VNX	Vilankulo Airport	-22.0184	35.3133
MZ	Inhambane	MFW	Magaruque Airport	-21.9672	35.4247
MZ	Niassa	VXC	Lichinga Airport	-13.274	35.2663
MZ	Gaza	TGS	Chokwe Airport	-24.5206	32.9653
MZ	Zambezia	LBM	Luabo Airport	-18.4139	36.1068
MZ	Zambezia	PEB	Pebane Airport	-17.267	38.167
MZ	Cabo Delgado	MZB	Mocimboa da Praia Air	-11.3618	40.3549
MZ	Cabo Delgado	POL	Pemba Airport	-12.9918	40.524
MZ	Inhambane	BCW	Benguerra Island Airport	-21.8533	35.4383
MZ	Inhambane	INH	Inhambane Airport	-23.8764	35.4085
MZ	Inhambane	BZB	Bazaruto Island Airport	-21.5411	35.4729
MZ	Cabo Delgado	MUD	Mueda Airport	-11.6729	39.5631
MZ	Inhambane	DGK	Dugong Beach Lodge Airstrip	-22.1342	35.4436
MZ	Gaza	VJB	Xai-Xai Airport	-25.0378	33.6274
MZ	Cabo Delgado	IBO	Ibo Island Airport	-12.3502	40.6023
MZ	Cabo Delgado	LFB	Lumbo Airport	-15.0331	40.6717
MZ	Zambezia	VJQ	Gurue Airport	-15.5062	36.9904
MZ	Sofala	BEW	Beira Airport	-19.7964	34.9076
MZ	Nampula	MNC	Nacala Airport	-14.4882	40.7122
MZ	Maputo	IHC	Inhaca Airport	-25.9971	32.9294
MZ	Tete	TET	Chingozi Airport	-16.1048	33.6402
MZ	Sofala	CMZ	Caia Airport	-17.8331	35.3341
MZ	Maputo	MPM	Maputo International Airport	-25.9208	32.5726
MZ	Nampula	ANO	Angoche Airport	-16.1819	39.9452
MZ	Zambezia	BJN	Bajone Airport	-17.1833	37.95
NA	Khomas	OGV	Ongava Airstrip	-22.1833	18.5333
NA	Erongo	WVB	Walvis Bay Airport	-22.9799	14.6453
NA	Kunene	TCY	Terrace Bay Airport	-19.9713	13.0249
NA	Karas	AIW	Ai-Ais Airport	-27.995	17.5966
NA	Hardap	SZM	Sesriem Airport	-24.5128	15.7467
NA	Oshana	OND	Ondangwa Airport	-17.8782	15.9526
NA	Oshikoto	OKU	Mokuti Lodge Airport	-18.8128	17.0594
NA	Karas	KAS	Karasburg Airport	-28.0297	18.7385
NA	Khomas	MQG	Midgard Airport	-22.0106	17.37
NA	Oshikoto	NNI	Namutoni Airport	-18.8064	16.9272
NA	Karas	RHN	Skorpion Mine Airport	-27.8764	16.6478
NA	Khomas	WDH	Hosea Kutako International Airport	-22.4799	17.4709
NA	Karas	OMD	Oranjemund Airport	-28.5847	16.4467
NA	Kavango East	BQI	Bagani Airport	-18.1181	21.6244
NA	Oshikoto	HAL	Halali Airport	-19.0285	16.4585
NA	Omaheke	GOG	Gobabis Airport	-22.5044	18.9731
NA	Erongo	MJO	Mount Etjo Airport	-21.0233	16.4528
NA	Kunene	OPW	Opuwa Airport	-18.0614	13.8505
NA	Khomas	ERS	Eros Airport	-22.6122	17.0804
NA	Oshana	OHI	Oshakati Airport	-17.797	15.6993
NA	Zambezi	OMG	Omega Airport	-18.0303	22.1897
NA	Karas	KMP	Keetmanshoop Airport	-26.5398	18.1114
NA	Erongo	ADI	Arandis Airport	-22.4622	14.98
NA	Oshikoto	OKF	Okaukuejo Airport	-19.1492	15.9119
NA	Otjozondjupa	OTJ	Otjiwarongo Airport	-20.4347	16.6608
NA	Erongo	SWP	Swakopmund Airport	-22.6619	14.5681
NA	Zambezi	LHU	Lianshulu Airport	-18.1167	23.3933
NA	Oshikoto	TSB	Tsumeb Airport	-19.2619	17.7325
NA	Otjozondjupa	GFY	Grootfontein Air Base	-19.6022	18.1227
NA	Karas	LUD	Luderitz Airport	-26.6874	15.2429
NA	Kavango East	NDU	Rundu Airport	-17.9565	19.7194
NA	Zambezi	MPA	Katima Mulilo Airport (Mpacha Airport)	-17.6344	24.1767
NC	Province Nord	PDC	Mueo/Nickel Airport	-21.3164	164.999
NC	Province Nord	BMY	Ile Art - Waala Airport	-19.7206	163.661
NC	Province Nord	KNQ	Kone Airport	-21.0543	164.837
NC	Province Sud	ILP	Ile des Pins Airport	-22.5889	167.456
NC	Province Nord	KOC	Koumac Airport	-20.5463	164.256
NC	Province Nord	PUV	Malabou Airport	-20.2892	164.099
NC	Province Nord	TOU	Touho Airport	-20.79	165.259
NC	Province Sud	TGJ	Tiga Airport	-21.0961	167.804
NC	Province Sud	GEA	Noumea Magenta Airport	-22.2583	166.473
NC	Province Sud	NOU	La Tontouta International Airport	-22.0146	166.213
NC	Province des iles Loyaute	MEE	Mare Airport	-21.4817	168.038
NC	Province des iles Loyaute	UVE	Ouvea Airport (Ouloup Airp	-20.6406	166.573
NC	Province des iles Loyaute	LIF	Ouanaham Airport	-20.7748	167.24
NE	Zinder	ZND	Zinder Airport	13.779	8.98376
NE	Niamey	NIM	Diori Hamani International Airport	13.4815	2.18361
NE	Agadez	AJY	Mano Dayak International Airport	16.966	8.00011
NE	Tahoua	THZ	Tahoua Airport	14.8757	5.26536
NE	Maradi	MFQ	Maradi Airport	13.5025	7.12675
NE	Agadez	RLT	Arlit Airport	18.7904	7.36595
NF	Norfolk Island	NLK	Norfolk Island Airport	-29.0416	167.939
NG	Bauchi	BCU	Bauchi State Airport	10.4828	9.744
NG	Delta	QRW	Warri Airport (Osubi Airport)	5.59611	5.81778
NG	Katsina	DKA	Katsina Airport	13.0078	7.66045
NG	Lagos	LOS	Murtala Muhammed International Airport	6.57737	3.32116
NG	Ondo	AKR	Akure Airport	7.24674	5.30101
NG	Akwa Ibom	QUO	Akwa Ibom International Airport	4.8725	8.093
NG	Kaduna	ZAR	Zaria Airport	11.1302	7.68581
NG	Sokoto	SKO	Sadiq Abubakar III International Airport	12.9163	5.20719
NG	Adamawa	YOL	Yola Airport	9.25755	12.4304
NG	Edo	BNI	Benin Airport	6.31698	5.5995
NG	Gombe	GMO	Gombe Lawanti International Airport	10.2983	10.8964
NG	Cross River	CBQ	Margaret Ekpo International Airport	4.97602	8.3472
NG	Kaduna	KAD	Kaduna Airport	10.696	7.32011
NG	Enugu	ENU	Akanu Ibiam International Airport	6.47427	7.56196
NG	Abuja Federal Capital Territory	ABV	Nnamdi Azikiwe International Airport	9.00679	7.26317
NG	Rivers	PHC	Port Harcourt International Airport	5.01549	6.94959
NG	Delta	ABB	Asaba International Airport	6.20417	6.66528
NG	Niger	MXJ	Minna Airport	9.65217	6.46226
NG	Borno	MIU	Maiduguri International Airport	11.8553	13.0809
NG	Kwara	ILR	Ilorin International Airport	8.44021	4.49392
NG	Rivers	PHG	Port Harcourt City Airport	4.84611	7.02139
NG	Imo	QOW	Sam Mbakwe Airport	5.42706	7.20603
NG	Kano	KAN	Mallam Aminu Kano International Airport	12.0476	8.52462
NG	Benue	MDI	Makurdi Airport	7.70388	8.61394
NG	Abuja Federal Capital Territory	JOS	Yakubu Gowon Airport	9.63983	8.86905
NG	Oyo	IBA	Ibadan Airport	7.36246	3.97833
NI	Costa Caribe Norte	BZA	San Pedro Airport	14.0315	-84.6243
NI	Rio San Juan	NCR	San Carlos Airport	11.1334	-84.77
NI	Costa Caribe Sur	BEF	Bluefields Airport	11.991	-83.7741
NI	Costa Caribe Norte	WSP	Waspam Airport	14.7392	-83.9694
NI	Costa Caribe Norte	PUZ	Puerto Cabezas Airport	14.0472	-83.3867
NI	Rivas	ECI	Costa Esmeralda Airport	11.4275	-86.0334
NI	Costa Caribe Sur	NVG	Nueva Guinea Airport	11.6667	-84.45
NI	Costa Caribe Sur	RNI	Corn Island Airport	12.1629	-83.0638
NI	Costa Caribe Norte	SIU	Siuna Airport	13.7272	-84.7778
NI	Costa Caribe Norte	RFS	Rosita Airport	13.8897	-84.4089
NI	Managua	MGA	Augusto C. Sandino International Airport	12.1415	-86.1682
NL	Flevoland	LEY	Lelystad Airport	52.4603	5.52722
NL	Noord-Brabant	EIN	Eindhoven Airport	51.4501	5.37453
NL	Noord-Brabant	WOE	Woensdrecht Air Base	51.4491	4.34203
NL	Noord-Brabant	UDE	Volkel Air Base	51.6564	5.70861
NL	Utrecht	UTC	Soesterberg Air Base	52.1273	5.27619
NL	Drenthe	GRQ	Groningen Airport Eelde	53.1197	6.57944
NL	Fryslan	LWR	Leeuwarden Air Base	53.2286	5.76056
NL	Zuid-Holland	RTM	Rotterdam The Hague Airport	51.9569	4.43722
NL	Noord-Holland	AMS	Amsterdam Airport Schiphol	52.3086	4.76389
NL	Limburg	MST	Maastricht Aachen Airport	50.9117	5.77014
NL	Noord-Brabant	GLZ	Gilze-Rijen Air Base	51.5674	4.93183
NL	Noord-Holland	DHR	De Kooy Airfield	52.9234	4.78062
NL	Overijssel	ENS	Enschede Airport Twente	52.2758	6.88917
NO	Rogaland	HAU	Haugesund Airport	59.3453	5.20836
NO	Finnmark	HVG	Honningsvag Airport	71.0097	25.9836
NO	More og Romsdal	MOL	Molde Airport	62.7447	7.2625
NO	Sor-Trondelag	RRS	Roros Airport	62.5784	11.3423
NO	Ostfold	RYG	Moss Airport	59.3788	10.7854
NO	Sogn og Fjordane	FDE	Forde Airport	61.3911	5.75694
NO	Nordland	MQN	Mo i Rana Airport	66.3639	14.3014
NO	Finnmark	VDS	Vadso Airport	70.0653	29.8447
NO	Vestfold	TRF	Sandefjord Airport	59.1867	10.2586
NO	Telemark	SKE	Skien Airport	59.185	9.56694
NO	Nord-Trondelag	TRD	Trondheim Airport	63.4578	10.924
NO	More og Romsdal	KSU	Kristiansund Airport	63.1118	7.82452
NO	Nordland	SVJ	Svolvaer Airport	68.2433	14.6692
NO	More og Romsdal	AES	Alesund Airport	62.5625	6.1197
NO	Troms	TOS	Tromse Airport	69.6833	18.9189
NO	Sor-Trondelag	OSY	Namsos Airport	64.4722	11.5786
NO	Rogaland	SVG	Stavanger Airport	58.8767	5.63778
NO	Buskerud	GLL	Gol Airport	60.7911	9.04867
NO	Sor-Trondelag	OLA	Orland Airport	63.6989	9.604
NO	Telemark	NTB	Notodden Airport	59.5657	9.21222
NO	Finnmark	KKN	Kirkenes Airport	69.7258	29.8913
NO	Nordland	RET	Rost Airport	67.5278	12.1033
NO	Sogn og Fjordane	FRO	Floro Airport	61.5836	5.02472
NO	Nordland	NVK	Narvik Airport	68.4369	17.3867
NO	Finnmark	HFT	Hammerfest Airport	70.6797	23.6686
NO	Sogn og Fjordane	SOG	Sogndal Airport	61.1561	7.13778
NO	Finnmark	HAA	Hasvik Airport	70.4867	22.1397
NO	Sor-Trondelag	RVK	Rorvik Airport	64.8383	11.1461
NO	Akershus	OSL	Oslo Airport	60.1939	11.1004
NO	Finnmark	ALF	Alta Airport	69.9761	23.3717
NO	Troms	BDU	Bardufoss Airport	69.0558	18.5404
NO	Nordland	SSJ	Sandnessjoen Airport	65.9568	12.4689
NO	Nordland	ANX	Andoya Airport	69.2925	16.1442
NO	Nordland	SKN	Stokmarknes Airport	68.5788	15.0334
NO	Hedmark	HMR	Hamar Airport	60.8181	11.068
NO	Hordaland	BGO	Bergen Airport	60.2934	5.21814
NO	Troms	SOJ	Sorkjosen Airport	69.7868	20.9594
NO	Vest-Agder	KRS	Kristiansand Airport	58.2042	8.08537
NO	Finnmark	BJF	Batsfjord Airport	70.6005	29.6914
NO	Nordland	BNN	Bronnoysund Airport	65.4611	12.2175
NO	Nordland	BOO	Bodo Airport	67.2692	14.3653
NO	Hordaland	SRP	Stord Airport	59.7919	5.34085
NO	Finnmark	MEH	Mehamn Airport	71.0297	27.8267
NO	Finnmark	BVG	Berlevag Airport	70.8714	29.0342
NO	Nordland	MJF	Mosjoen Airport	65.784	13.2149
NO	More og Romsdal	HOV	Orsta-Volda Airport	62.18	6.0741
NO	Nordland	LKN	Leknes Airport	68.1525	13.6094
NO	Sogn og Fjordane	SDN	Sandane Airport	61.83	6.10583
NO	Finnmark	LKL	Lakselv Airport	70.0688	24.9735
NO	Finnmark	VAW	Varddo Air	70.3554	31.0449
NO	Nordland	EVE	Harstad/Narvik Airport	68.4913	16.6781
NO	Oppland	VDB	Fagernes Airport	61.0156	9.28806
NP	Mahakali	SIH	Silgadhi Airport	29.2631	80.936
NP	Sagarmatha	SYH	Syangboche Airport	27.8112	86.7123
NP	Narayani	SIF	Simara Airport	27.1595	84.9801
NP	Janakpur	JKR	Janakpur Airport	26.7088	85.9224
NP	Bagmati	KTM	Tribhuvan International Airport	27.6966	85.3591
NP	Sagarmatha	JIR	Jiri Airport	27.6263	86.2306
NP	Dhawalagiri	BGL	Balewa Airport	28.2128	83.6663
NP	Bheri	KEP	Nepalgunj Airport	28.1036	81.667
NP	Seti	BIT	Baitadi Airport	29.4653	80.5492
NP	Janakpur	RHP	Ramechhap Airport	27.394	86.0614
NP	Seti	BJH	Bajhang Airport	29.539	81.1854
NP	Rapti	RUK	Chaurjahari Airport	28.627	82.195
NP	Sagarmatha	PPL	Phaplu Airport	27.5178	86.5845
NP	Gandaki	PKR	Pokhara Airport	28.2009	83.9821
NP	Bheri	SKH	Surkhet Airport	28.586	81.636
NP	Kosi	RJB	Rajbiraj Airport	26.5101	86.7339
NP	Narayani	GKH	Palungtar Airport	28.0385	84.4664
NP	Bheri	BJU	Bajura Airport	29.502	81.669
NP	Mechi	BDP	Bhadrapur Airport (Chandragadhi Airport)	26.5708	88.0796
NP	Karnali	IMK	Simikot Airport	29.9711	81.8189
NP	Seti	DHI	Dhangadhi Airport	28.7533	80.5819
NP	Sagarmatha	LUA	Tenzing-Hillary Airport	27.6869	86.7297
NP	Sagarmatha	LDN	Lamidanda Airport	27.2531	86.67
NP	Kosi	TMI	Tumlingtar Airport	27.315	87.1933
NP	Rapti	DNP	Tribhuvannagar Airport (Dang Airport)	28.1111	82.2942
NP	Dhawalagiri	JMO	Jomsom Airport	28.7804	83.723
NP	Seti	DAP	Darchula Airport	29.6692	80.5484
NP	Lumbini	BWA	Gautam Buddha Airport	27.5057	83.4163
NP	Kosi	BHP	Bhojpur Airport	27.1474	87.0508
NP	Bagmati	LTG	Langtang Airport	28.2	85.583
NP	Seti	TPU	Tikapur Airport	28.5219	81.123
NP	Narayani	BHR	Bharatpur Airport	27.6781	84.4294
NP	Mahakali	XMG	Mahendranagar Airport	28.9632	80.1479
NP	Karnali	DOP	Dolpa Airport	28.9857	82.8191
NP	Rapti	RPA	Rolpa Airport	28.2673	82.7565
NP	Narayani	MEY	Meghauli Airport	27.5774	84.2288
NP	Seti	FEB	Sanfebagar Airport	29.2366	81.2153
NP	Mechi	TPJ	Taplejung Airport	27.3509	87.6953
NP	Gandaki	NGX	Manang Airport	28.6414	84.0892
NP	Kosi	BIR	Biratnagar Airport	26.4815	87.264
NP	Karnali	JUM	Jumla Airport	29.2742	82.1933
NP	Sagarmatha	RUM	Rumjatar Airport	27.3035	86.5504
NR	Yaren	INU	Nauru International Airport	-0.547458	166.919
NU	Niue	IUE	Niue International Airport (Hanan Int'l)	-19.079	-169.926
NZ	Canterbury	CHC	Christchurch International Airport	-43.4894	172.532
NZ	West Coast	HKK	Hokitika Airport	-42.7136	170.985
NZ	Manawatu-Wanganui	OHA	RNZAF Base Ohakea	-40.206	175.388
NZ	Auckland	GBZ	Great Barrier Aerodrome	-36.2414	175.472
NZ	Otago	ALR	Alexandra Aerodrome	-45.2117	169.373
NZ	Waikato	TKZ	Tokoroa Aerodrome	-38.2367	175.892
NZ	Tasman	KTF	Takaka Aerodrome	-40.8133	172.775
NZ	Waikato	RAG	Raglan Aerodrome	-37.8047	174.86
NZ	Waikato	MTA	Matamata Airport	-37.7344	175.742
NZ	Northland	KKO	Kaikohe Aerodrome	-35.4511	173.817
NZ	Northland	DGR	Dargaville Aerodrome	-35.9397	173.894
NZ	Marlborough	PCN	Picton Aerodrome	-41.3461	173.956
NZ	Manawatu-Wanganui	PMR	Palmerston North Airport	-40.3206	175.617
NZ	Auckland	CMV	Coromandel Aerodrome	-36.7917	175.509
NZ	Canterbury	ASG	Ashburton Aerodrome	-43.9033	171.797
NZ	Waikato	TUO	Taupo Airport	-38.7397	176.084
NZ	Otago	WKA	Wanaka Airport	-44.7222	169.246
NZ	West Coast	WSZ	Westport Airport	-41.7381	171.581
NZ	Canterbury	TWZ	Pukaki Airport	-44.235	170.118
NZ	Chatham Islands Territory	CHT	Chatham Islands / Tuuta Airport	-43.81	-176.457
NZ	West Coast	GMN	Greymouth Airport	-42.4617	171.19
NZ	Auckland	AKL	Auckland Airport	-37.0081	174.792
NZ	Wellington	PPQ	Kapiti Coast Airport	-40.9047	174.989
NZ	Nelson	NSN	Nelson Airport	-41.2983	173.221
NZ	Waikato	THH	Taharoa Aerodrome	-38.1811	174.708
NZ	Otago	OAM	Oamaru Airport	-44.97	171.082
NZ	Northland	KKE	Kerikeri Airport (Bay of Islands Airport)	-35.2628	173.912
NZ	Hawke's Bay	WIR	Wairoa Aerodrome	-39.0069	177.407
NZ	Marlborough	BHE	Woodbourne Airport	-41.5183	173.87
NZ	Manawatu-Wanganui	WAG	Whanganui Airport	-39.9622	175.025
NZ	Waikato	TMZ	Thames Aerodrome	-37.1567	175.55
NZ	Auckland	WIK	Waiheke Island Aerodrome	-36.8089	175.086
NZ	Tasman	MZP	Motueka Aerodrome	-41.1233	172.989
NZ	Bay of Plenty	TRG	Tauranga Airport	-37.6719	176.196
NZ	Southland	WHO	Franz Josef Glacier Aerodrome	-43.3631	170.134
NZ	Northland	WRE	Whangarei Airport	-35.7683	174.365
NZ	Gisborne	GIS	Gisborne Airport	-38.6633	177.978
NZ	Waikato	WTZ	Whitianga Aerodrome	-36.8317	175.679
NZ	Northland	KAT	Kaitaia Airport	-35.07	173.285
NZ	Southland	MON	Mount Cook Aerodrome	-43.765	170.133
NZ	Canterbury	TIU	Richard Pearse Airport	-44.3028	171.225
NZ	Otago	ZQN	Queenstown Airport	-45.0211	168.739
NZ	Otago	DUD	Dunedin International Airport	-45.9281	170.198
NZ	Southland	MFN	Milford Sound Airport	-44.6733	167.923
NZ	Bay of Plenty	WHK	Whakatane Airport	-37.9206	176.914
NZ	Canterbury	KBZ	Kaikoura Aerodrome	-42.425	173.605
NZ	Waikato	HLZ	Hamilton Airport	-37.8667	175.332
NZ	Southland	SZS	Ryan's Creek Aerodrome	-46.8997	168.101
NZ	Hawke's Bay	NPE	Hawke's Bay Airport	-39.4658	176.87
NZ	Wellington	WLG	Wellington International Airport	-41.3272	174.805
NZ	Bay of Plenty	ROT	Rotorua Regional Airport	-38.1092	176.317
NZ	Wellington	MRO	Hood Aerodrome	-40.9733	175.634
NZ	Taranaki	NPL	New Plymouth Airport	-39.0086	174.179
NZ	Southland	IVC	Invercargill Airport	-46.4124	168.313
NZ	Canterbury	GTN	Glentanner Aerodrome	-43.9067	170.128
NZ	Southland	TEU	Te Anau Airport (Manapouri Airport)	-45.5331	167.65
NZ	Auckland	AMZ	Ardmore Airport	-37.0297	174.973
OM	Ad Dakhiliyah	RNM	Qarn Alam Airport	21.383	57.05
OM	Musandam	BYB	Dibba Airport	25.6142	56.2444
OM	Al Wusta	UKH	Mukhaizna Airport	19.3864	56.4014
OM	Janub al Batinah	OHS	Sohar Airport	24.386	56.6254
OM	Janub ash Sharqiyah	NMN	Nomane Airport	-6.32183	145.071
OM	Zufar	KMN	Kamina Airport (Kamina Ville Airport)	-8.64202	25.2529
OM	Shamal al Batinah	MNH	Al-Musannah Airport	23.6406	57.4875
OM	Ad Dakhiliyah	AOM	Adam Airport	22.4919	57.3839
OM	Zufar	OMM	Marmul Airport	18.136	55.1821
OM	Az Zahirah	LKW	Lekhwair Airport	22.805	55.3734
OM	Al Wusta	JNJ	Duqm Jaaluni Airport	19.4749	57.3083
OM	Musandam	KHS	Khasab Airport	26.171	56.2406
OM	Al Wusta	BJQ	Bahja Airport	19.8731	56.0678
OM	Al Wusta	DQM	Duqm International Airport	19.5019	57.6342
OM	Ad Dakhiliyah	MCT	Muscat International Airport	23.5933	58.2844
OM	Zufar	TTH	RAFO Thumrait	17.666	54.0246
OM	Az Zahirah	FAU	Fahud Airport	22.3548	56.4841
OM	Al Buraymi	RMB	Buraimi Airport	24.2411	55.7847
OM	Shamal ash Sharqiyah	MSH	Masirah Air Base	20.6754	58.8905
OM	Shamal ash Sharqiyah	SUH	Sur Airport	22.533	59.483
OM	Zufar	SLL	Salalah International Airport	17.0387	54.0913
OM	Zufar	LRM	La Romana International Airport (Casa de Campo International Airport)	18.4507	-68.9118
PA	Darien	TJC	Ticantiqui Airport	9.4185	-78.4896
PA	Panama	CTE	Carti Airport	9.31347	-79.1016
PA	Herrera	CTD	Chitre Alonso Valderrama Airport	7.98784	-80.4097
PA	Colon	ONX	Enrique Adolfo Jimenez Airport	9.35664	-79.8674
PA	Cocle	RIH	Scarlett Martinez International Airport	8.37588	-80.1279
PA	Darien	PYC	Playon Chico Airport	9.30518	-78.2359
PA	Bocas del Toro	BOC	Bocas del Toro Isla Colon International Airport	9.34085	-82.2508
PA	Panama	BLB	Panama Pacifico International Airport	8.91479	-79.5996
PA	Veraguas	SYP	Ruben Cantu Airport	8.0856	-80.9453
PA	Darien	OGM	Ustupu-Ogobsucum Airport	9.1383	-77.9339
PA	Panama	NBL	Wannukandi Airport	9.4496	-78.9795
PA	Darien	PYV	Yaviza Airport	8.1528	-77.687
PA	Darien	BFQ	Bahia Pina Airport	7.583	-78.2
PA	Los Santos	PDM	Pedasi Airport (Capt. J. Montenegro Airport)	7.55688	-80.0233
PA	Panama	CZJ	Corazon de Jesus Airport	9.4446	-78.5888
PA	Darien	GHE	Garachine Airport	8.0644	-78.3673
PA	Panama	ACU	Achutupo Airport	8.43166	-77.9652
PA	Panama	OTD	Contadora Airport	8.62876	-79.0347
PA	Bocas del Toro	CHX	Changuinola Capitan Manuel Nino International Airport	9.45896	-82.5151
PA	Panama	PAC	Albrook Marcos A. Gelabert International Airport	8.97334	-79.5556
PA	Darien	JQE	Jaque Airport	7.51778	-78.1572
PA	Darien	AIL	Ailigandi Airport	9.2226	-78.0236
PA	Panama	PTY	Tocumen International Airport	9.07136	-79.3835
PA	Darien	UTU	Ustupo Airport	9.1283	-77.9337
PA	Chiriqui	AML	Puerto Armuelles Airport	8.26806	-82.8649
PA	Darien	PUE	Puerto Obaldia Airport	8.667	-77.418
PA	Panama	NMG	San Miguel Airport	8.4566	-78.9339
PA	Darien	NGN	Nargana Airport	9.06667	-78.0167
PA	Panama	TUW	Tubala Airport	9.52	-79.03
PA	Chiriqui	DAV	Enrique Malek International Airport	8.391	-82.435
PA	Panama	SIC	San Jose Airport	8.2622	-79.078
PA	Darien	PLP	Captain Ramon Xatruch Airport	8.40667	-78.1417
PA	Darien	ELE	El Real Airport	8.1072	-77.7252
PA	Darien	MPP	Mulatupo Airport	8.9453	-77.7331
PA	Panama	PVE	El Porvenir Airport	9.558	-78.947
PA	Darien	MPI	Mamitupo Airport	9.1851	-77.9841
PA	Panama	IVI	Viveros Island Airport	8.4693	-79.0016
PA	Darien	SAX	Sambu Airport	8.017	-78.2
PE	Madre de Dios	SYC	Shiringayoc Airport	-11.898	-69.0625
PE	La Libertad	TRU	FAP Captain Carlos Martinez de Pinillos International Airport	-8.08141	-79.1088
PE	San Martin	SQU	Saposoa Airport	-6.96003	-76.7684
PE	Loreto	CUZ	Alejandro Velasco Astete International Airport	-13.5357	-71.9388
PE	San Martin	BLP	Huallaga Airport	-7.06056	-76.5822
PE	Junin	JAU	Francisco Carle Airport	-11.7831	-75.4734
PE	Lambayeque	CIX	FAP Captain Jose Abelardo Quinones Gonzales International Airport	-6.78748	-79.8281
PE	San Martin	JJI	Juanjui Airport	-7.1691	-76.7286
PE	Ica	SJA	San Juan de Marcona Airport	-15.3525	-75.1372
PE	Loreto	YMS	Moises Benzaquen Rengifo Airport	-5.89377	-76.1182
PE	Piura	TYL	Capitan FAP VIctor Montes Arias International Airport	-4.57664	-81.2541
PE	Loreto	IQT	Coronel FAP Francisco Secada Vignetta International Airport	-3.78474	-73.3088
PE	Puno	JUL	Inca Manco Capac International Airport	-15.4671	-70.1582
PE	Cajamarca	CJA	Mayor General FAP Armando Revoredo Iglesias Airport	-7.13918	-78.4894
PE	Cusco	VVN	Las Malvinas Airport	-11.8549	-72.9393
PE	Tumbes	TBP	Cap. FAP Pedro Canga Rodriguez Airport	-3.55253	-80.3814
PE	Ancash	ATA	Comandante FAP German Arias Graziani Airport	-9.34744	-77.5984
PE	Moquegua	ILQ	Ilo Airport	-17.695	-71.344
PE	Ancash	CHM	Tnte. FAP Jaime Montreuil Morales Airport	-9.14961	-78.5238
PE	El Callao	LIM	Jorge Chavez International Airport	-12.0219	-77.1143
PE	Ica	NZC	Maria Reiche Neuman Airport	-14.854	-74.9615
PE	Ayacucho	AYX	Tnte. Gral. Gerardo Perez Pinedo Airport	-10.7292	-73.7667
PE	Huanuco	TGI	Tingo Maria Airport	-9.133	-75.95
PE	Amazonas	RIM	San Nicolas Airport	-6.39231	-77.5012
PE	Arequipa	AQP	Rodriguez Ballon International Airport	-16.3411	-71.5831
PE	Amazonas	CHH	Chachapoyas Airport	-6.20181	-77.8561
PE	Piura	PIU	FAP Captain Guillermo Concha Iberico International Airport	-5.20575	-80.6164
PE	Ucayali	PCL	FAP Captain David Abensur Rengifo International Airport	-8.37794	-74.5743
PE	Loreto	AOP	Alferez FAP Alfredo Vladimir Sara Bauer Airport	-2.79613	-76.4666
PE	Ayacucho	AYP	Coronel FAP Alfredo Mendivil Duarte Airport	-13.1548	-74.2044
PE	San Martin	MBP	Moyobamba Airport	-6.01889	-76.9883
PE	Madre de Dios	IBP	Iberia Airport	-11.4116	-69.4887
PE	San Martin	RIJ	Juan Simons Vela Airport	-6.06786	-77.16
PE	Junin	MZA	Manuel Prado Ugarteche Airport	-11.3254	-74.5356
PE	Apurimac	ANS	Andahuaylas Airport	-13.7064	-73.3504
PE	Tacna	TCQ	Coronel FAP Carlos Ciriani Santa Rosa International Airport	-18.0533	-70.2758
PE	Cajamarca	JAE	Jaen Airport	-5.59248	-78.774
PE	Ica	PIO	Capitan FAP Renan Elias Olivera Airport	-13.7449	-76.2203
PE	Cusco	UMI	Quince Mil Airport	-13.2333	-70.7533
PE	Loreto	TDP	Trompeteros Airport	-3.80601	-75.0393
PE	Cusco	HUU	Alferez FAP David Figueroa Fernandini Airport	-9.87881	-76.2048
PE	Madre de Dios	PEM	Padre Aldamiz International Airport	-12.6136	-69.2286
PE	Ucayali	ALD	Alerta Airport	-11.683	-69.333
PE	San Martin	TPP	Cad. FAP Guillermo del Castillo Paredes Airport	-6.50874	-76.3732
PE	Lima	SMG	Santa Maria Airport	-11.9833	-77
PF	Iles du Vent	NKP	Nukutepipi Airport	-20.7	-143.047
PF	Iles Tuamotu-Gambier	KHZ	Kauehi Airport	-15.7808	-145.124
PF	Iles Tuamotu-Gambier	UOA	Mururoa Airport	-21.8586	-138.82
PF	Iles Tuamotu-Gambier	FAC	Faaite Airport	-16.6867	-145.329
PF	Iles Marquises	UAP	Ua Pou Airport	-9.35167	-140.078
PF	Iles Sous-le-Vent	PPT	Fa'a'a International Airport	-17.5537	-149.607
PF	Iles Marquises	UAH	Ua Huka Airport	-8.93611	-139.552
PF	Iles Tuamotu-Gambier	FHZ	Fakahina Airport	-15.9922	-140.165
PF	Iles du Vent	TPX	Tupai Airport	-16.2423	-151.834
PF	Iles Tuamotu-Gambier	APK	Apataki Airport	-15.5736	-146.415
PF	Iles Tuamotu-Gambier	AHE	Ahe Airport	-14.4281	-146.257
PF	Iles Sous-le-Vent	HUH	Huahine - Fare Airport	-16.6872	-151.022
PF	Iles Australes	RUR	Rurutu Airport	-22.4341	-151.361
PF	Iles Tuamotu-Gambier	FGU	Fangatau Airport	-15.8199	-140.887
PF	Iles Tuamotu-Gambier	AXR	Arutua Airport	-15.2483	-146.617
PF	Iles Tuamotu-Gambier	KKR	Kaukura Airport	-15.6633	-146.885
PF	Iles Tuamotu-Gambier	REA	Reao Airport	-18.4659	-136.44
PF	Iles Tuamotu-Gambier	PKP	Puka-Puka Airport	-14.8095	-138.813
PF	Iles Tuamotu-Gambier	HHZ	Hikueru Airport	-17.5447	-142.614
PF	Iles Tuamotu-Gambier	MVT	Mataiva Airport	-14.8681	-148.717
PF	Iles Tuamotu-Gambier	AAA	Anaa Airport	-17.3526	-145.51
PF	Iles Tuamotu-Gambier	FAV	Fakarava Airport	-16.0541	-145.657
PF	Iles Tuamotu-Gambier	NUK	Nukutavake Airport	-19.285	-138.772
PF	Iles Tuamotu-Gambier	RKA	Aratika-Nord Airport	-15.4853	-145.47
PF	Iles Australes	TUB	Tubuai - Mataura Airport	-23.3654	-149.524
PF	Iles Tuamotu-Gambier	TIH	Tikehau Airport	-15.1196	-148.231
PF	Iles Tuamotu-Gambier	NAU	Napuka Airport	-14.1768	-141.267
PF	Iles Sous-le-Vent	TTI	Tetiaroa Airport	-17.0133	-149.587
PF	Iles Tuamotu-Gambier	KXU	Katiu Airport	-16.3394	-144.403
PF	Iles Tuamotu-Gambier	TKX	Takaroa Airport	-14.4558	-145.025
PF	Iles Tuamotu-Gambier	VHZ	Vahitahi Airport	-18.78	-138.853
PF	Iles Tuamotu-Gambier	TKV	Tatakoto Airport	-17.3553	-138.445
PF	Iles Sous-le-Vent	MAU	Maupiti Airport	-16.4265	-152.244
PF	Iles Tuamotu-Gambier	PUK	Pukarua Airport	-18.2956	-137.017
PF	Iles Tuamotu-Gambier	ZTA	Tureia Airport	-20.7897	-138.57
PF	Iles du Vent	MOZ	Moorea Airport (Temae Airport)	-17.49	-149.762
PF	Iles Tuamotu-Gambier	HOI	Hao Airport	-18.0748	-140.946
PF	Iles Tuamotu-Gambier	GMR	Totegegie Airport (Gambier Island Airport)	-23.0799	-134.89
PF	Iles Tuamotu-Gambier	TKP	Takapoto Airport	-14.7095	-145.246
PF	Iles Tuamotu-Gambier	RGI	Rangiroa Airport	-14.9543	-147.661
PF	Iles Sous-le-Vent	RFP	Raiatea Airport (Uturoa Airport)	-16.7229	-151.466
PF	Iles Australes	RMT	Rimatara Airport	-22.6373	-152.806
PF	Iles Tuamotu-Gambier	NIU	Niau Airport	-16.1191	-146.368
PF	Iles Marquises	AUQ	Atuona Airport	-9.76879	-139.011
PF	Iles Sous-le-Vent	BOB	Bora Bora Airport (Motu Mute Airport)	-16.4444	-151.751
PF	Iles Tuamotu-Gambier	MKP	Makemo Airport	-16.5839	-143.658
PF	Iles Tuamotu-Gambier	XMH	Manihi Airport	-14.4368	-146.07
PF	Iles Tuamotu-Gambier	RRR	Raroia Airport	-16.045	-142.477
PF	Iles Marquises	NHV	Nuku Hiva Airport	-8.7956	-140.229
PF	Iles Australes	RVV	Raivavae Airport	-23.8852	-147.662
PF	Iles Tuamotu-Gambier	TJN	Takume Airport	-15.8547	-142.268
PF	Iles du Vent	PPT	Faa'a International Airport	-17.5567	-149.611
PG	East New Britain	SBV	Sabah Airport	-5.5765	155.049
PG	Morobe	KSB	Kasanombe Airport	-6.3819	146.986
PG	National Capital District (Port Moresby)	SFU	Safia Airport	-9.59306	148.636
PG	Morobe	KSG	Kisengam Airport	-6.362	146.71
PG	Morobe	SGB	Singaua Airport	-6.7	147.133
PG	Central	KSP	Kosipe Airport	-8.45072	147.209
PG	National Capital District (Port Moresby)	SGJ	Sagarai Airport	-10.3833	149.833
PG	Morobe	KSX	Yasuru Airport	-6.6015	146.181
PG	National Capital District (Port Moresby)	SIL	Sila Airport	-9.07356	148.389
PG	East New Britain	MFO	Manguna Airport	-5.57778	151.792
PG	Western Highlands	SIM	Simbai Airport	-5.27861	144.545
PG	East New Britain	KTK	Kunua Airport	-5.7828	154.74
PG	Western	SIZ	Sissano Airport	-2.99944	142.044
PG	National Capital District (Port Moresby)	KUP	Kupiano Airport	-10.0736	148.218
PG	Morobe	SMH	Sapmanga Airport	-6.07528	146.811
PG	Southern Highlands	KUQ	Kuri Airport	-7.13508	143.276
PG	Morobe	SMJ	Sim Airport	-7.75	146.927
PG	Western	KUX	Kuyol Airport	-5.37236	141.624
PG	East New Britain	SMP	Stockholm Airport	-4.358	151.533
PG	West New Britain	KVE	Kitava Island Airport	-8.6285	151.327
PG	Central	SPH	Sopu Airport	-8.3038	147.166
PG	Southern Highlands	KWO	Kawito Airport	-7.97701	142.824
PG	Western Highlands	SPV	Sepik Plains Airport	-3.8821	143.673
PG	Gulf	SGK	Sangapi Airport	-5.12583	144.324
PG	National Capital District (Port Moresby)	SQT	China Strait Airstrip	-10.5628	150.691
PG	East New Britain	KWV	Kurwina Airport	-5.965	155.36
PG	East New Britain	MKN	Malekolon Airport	-4.02343	153.657
PG	Southern Highlands	KWX	Kiwai Island Airport	-8.6883	143.618
PG	Central	MLQ	Malalaua Airport	-8.07139	146.155
PG	Central	ABW	Abau Airport	-10.1956	148.739
PG	Morobe	SSS	Siassi Airport	-5.5965	147.811
PG	East New Britain	KXR	Karoola Airport	-5.1431	154.593
PG	Manus	MMV	Mal Island Airport	-1.39444	144.171
PG	Morobe	KYX	Yalumet Airport	-6.09	147.012
PG	National Capital District (Port Moresby)	SUZ	Suria Airport	-9.032	147.45
PG	Morobe	KZF	Kaintiba Airport	-7.50025	146.034
PG	Morobe	SWE	Siwea Airport	-6.28464	147.581
PG	Morobe	LAB	Lab Lab Airport	-5.7204	148.057
PG	Morobe	SWG	Satwag Airport	-6.13956	147.279
PG	Southern Highlands	LGM	Laiagam Airport	-5.4923	143.488
PG	East New Britain	SWR	Silur Airport	-4.52989	153.054
PG	West New Britain	LGN	Linga Linga Airport	-5.53194	149.734
PG	Morobe	SXA	Sialum Airport	-6.0908	147.596
PG	East New Britain	LHP	Lehu Airport	-6.52749	155.712
PG	West New Britain	SXH	Sehulea Airport	-9.96453	151.162
PG	East New Britain	LMG	Lamassa Airport	-4.7	152.75
PG	West New Britain	SXW	Sauren Airport	-5.9701	148.854
PG	Western	LMI	Lumi Airport	-3.47684	142.041
PG	Manus	MNP	Maron Island Airport	-1.5504	145.017
PG	Morobe	LNC	Lengbati Airport	-6.38461	147.369
PG	Southern Highlands	MPF	Mapoda Airport	-7.979	143.169
PG	Western	LNF	Munbil Airport	-4.85594	141.22
PG	Morobe	MPG	Makini Airport	-6.53222	147.651
PG	Central	LNG	Lese Airport	-8.2799	146.277
PG	New Ireland	MPU	Mabua Airstrip	-2.81139	151.991
PG	Morobe	LNM	Langimar Airport	-7.22314	146.227
PG	Western Highlands	TBA	Tabibuga Airport	-5.5766	144.651
PG	National Capital District (Port Moresby)	LNQ	Loani Airport	-10.5815	150.593
PG	Western Highlands	TBE	Timbunke Airport	-4.19663	143.519
PG	Morobe	LPN	Leron Plains Airport	-6.3917	146.343
PG	Western	MPX	Miyanmin Airport	-4.90306	141.621
PG	Morobe	LSJ	Long Island Airport	-5.3604	147.018
PG	Eastern Highlands	TBQ	Tarabo Airport	-6.46667	145.532
PG	Eastern Highlands	AYU	Aiyura Airport	-6.33806	145.904
PG	Southern Highlands	MQO	Malam Airport	-8.70917	142.65
PG	Western	LTF	Leitre Airport	-2.8337	141.626
PG	Southern Highlands	TCJ	Torembi Airport	-4.0165	143.133
PG	Morobe	LWI	Lowai Airport	-6.3344	146.646
PG	Western Highlands	TCK	Tinboli Airport	-4.0949	143.384
PG	National Capital District (Port Moresby)	MAP	Mamai Airport	-10.2908	149.519
PG	Western	MRH	May River Airport	-4.3615	141.785
PG	Morobe	MBV	Masa Airport	-6.345	147.591
PG	National Capital District (Port Moresby)	TDB	Tetebedi Airport	-9.1586	148.069
PG	Western Highlands	MDM	Munduku Airport	-4.6204	143.452
PG	Central	TEO	Terapo Airport	-8.16972	146.194
PG	West New Britain	MFZ	Meselia Airport	-6.1364	149.118
PG	Morobe	TEP	Teptep Airport	-5.9553	146.559
PG	Southern Highlands	MGG	Margarima Airport	-5.979	143.359
PG	Western	TFB	Tifalmin Airport	-5.1173	141.419
PG	East Sepik	AGG	Angoram Airport	-4.05583	144.074
PG	Western	TFM	Telefomin Airport	-5.12608	141.642
PG	East New Britain	MGP	Manga Airport	-4.147	153.019
PG	East New Britain	MVI	Manetai Airport	-6.12	155.39
PG	Western	MHY	Morehead Airport	-8.71411	141.644
PG	West New Britain	TGL	Tagula Airport	-11.3311	153.203
PG	Northern	AGL	Wanigela Airport	-9.3375	149.156
PG	New Ireland	TIG	Tingwon Airport	-2.6053	149.711
PG	West Sepik	TAJ	Tadji Airport	-3.19819	142.431
PG	Eastern Highlands	MWG	Marawaka Airport	-6.9736	145.885
PG	Gulf	AIE	Aiome Airport	-5.1457	144.731
PG	Southern Highlands	MWI	Maramuni Airport	-5.13	143.483
PG	Western	AIH	Aiambak Airport	-7.34278	141.268
PG	New Ireland	MWU	Mussau Island Airport	-1.5	149.667
PG	Northern	KKD	Kokoda Airport	-8.88468	147.731
PG	Morobe	TKB	Tekadu Airport	-7.6808	146.55
PG	Bougainville	KIE	Aropa Airport	-6.30542	155.728
PG	Western	TKW	Tekin Airport	-5.24367	142.165
PG	Bougainville	IIS	Nissan Island Airport	-4.49972	154.226
PG	Morobe	MXK	Mindik Airport	-6.47167	147.441
PG	Gulf	IHU	Ihu Airport	-7.89756	145.396
PG	East New Britain	TLO	Tol Airport	-4.98083	152.01
PG	New Ireland	ATN	Namatanai Airport	-3.6695	152.438
PG	Western	TLP	Tumolbil Airport	-4.7748	141.013
PG	Milne Bay	AUP	Agaun Airport	-9.93083	149.386
PG	Morobe	MYX	Menyamya Airport	-7.21167	146.019
PG	Central	KGW	Kagi Airport	-9.13592	147.669
PG	Western Highlands	MZN	Minj Airport	-5.86667	144.667
PG	Western	AWB	Awaba Airport	-8.00611	142.748
PG	Eastern Highlands	NBA	Nambaiyufa Airport	-6.2412	145.242
PG	Milne Bay	MIS	Misima Island Airport	-10.6892	152.838
PG	East New Britain	TOK	Torokina Airport	-6.2015	155.063
PG	Southern Highlands	MDU	Mendi Airport	-6.14774	143.657
PG	East New Britain	TON	Tonu Airport	-6.6552	155.433
PG	West New Britain	KDR	Kandrian Airport	-6.19217	149.548
PG	National Capital District (Port Moresby)	NDI	Namudi Airport	-9.47375	148.329
PG	Manus	MAS	Momote Airport	-2.06189	147.424
PG	National Capital District (Port Moresby)	NDN	Nadunumu Airport	-9.14356	147.684
PG	Madang	MAG	Madang Airport	-5.20708	145.789
PG	Western	TRJ	Tarakbits Airport	-5.614	141.042
PG	Eastern Highlands	GKA	Goroka Airport	-6.08169	145.392
PG	Morobe	TSI	Tsile Tsile Airport	-6.8498	146.355
PG	Western Highlands	HGU	Mount Hagen Airport	-5.82679	144.296
PG	New Ireland	TSK	Taskul Airport	-2.546	150.455
PG	Central	MRM	Manari Airport	-9.1908	147.622
PG	Morobe	TSW	Tsewi Airport	-7.0695	146.127
PG	Milne Bay	GUR	Gurney Airport	-10.3115	150.334
PG	Western	NGR	Ningerum Airport	-5.66667	141.117
PG	Northern	PNP	Girua Airport	-8.80454	148.309
PG	New Ireland	NIS	Simberi Airport	-2.66222	151.998
PG	National Capital District (Port Moresby)	POM	Jacksons International Airport	-9.44338	147.22
PG	Madang	TUT	Tauta Airport	-5.8335	145.934
PG	Milne Bay	LSA	Losuia Airport	-8.50582	151.081
PG	Morobe	TWY	Tawa Airport	-7.4463	146.107
PG	Southern Highlands	MXH	Moro Airport	-6.36333	143.238
PG	Madang	NKN	Nankina Airport	-5.837	146.453
PG	West New Britain	GMI	Gasmata Airport	-6.27111	150.331
PG	National Capital District (Port Moresby)	NOO	Naoro Airport	-9.25445	147.621
PG	Madang	SDI	Saidor Airport	-5.62714	146.463
PG	Southern Highlands	NPG	Nipa Airport	-6.1454	143.453
PG	New Ireland	LNV	Lihir Island Airport	-3.04361	152.629
PG	East New Britain	NUG	Nuguria Airstrip	-3.4075	154.738
PG	Western	LMY	Lake Murray Airport	-7.00992	141.494
PG	West New Britain	NUT	Nutuve Airport	-5.63333	151.383
PG	Western	SKC	Suki Airport	-8.0466	141.722
PG	East New Britain	UBI	Buin Airport	-6.72917	155.683
PG	West New Britain	HKN	Hoskins Airport	-5.46217	150.405
PG	National Capital District (Port Moresby)	NWT	Nowata Airport	-9.98417	149.729
PG	Central	HEO	Haelogo Airport	-9.13658	147.598
PG	Morobe	OBM	Morobe Airport	-7.74	147.59
PG	Western	NOM	Nomad River Airport	-6.294	142.234
PG	Morobe	OGE	Ogeramnang Airport	-6.46675	147.364
PG	East New Britain	JAQ	Jacquinot Bay Airport	-5.6525	151.507
PG	Western	OKP	Oksapmin Airport	-5.2261	142.226
PG	Morobe	LAE	Lae Nadzab Airport	-6.5698	146.726
PG	Western	UKU	Nuku Airport	-3.67665	142.484
PG	Northern	ITK	Itokama Airport	-9.20153	148.264
PG	East New Britain	ULE	Sule Airport	-4.97472	151.297
PG	Western	OBX	Obo Airport	-7.59062	141.324
PG	Western	OKV	Okao Airport	-5.55667	141.033
PG	New Ireland	KVG	Kavieng Airport	-2.5794	150.808
PG	Western	OLQ	Olsobip Airport	-5.38972	141.515
PG	Gulf	KUY	Kamusi Airport	-7.42035	143.122
PG	Eastern Highlands	UMC	Umba Airport	-7.0214	145.966
PG	East New Britain	RAB	Rabaul Airport (Tokua Airport)	-4.34046	152.38
PG	Eastern Highlands	OML	Omkalai Airport	-6.179	144.96
PG	Gulf	KRJ	Karawari Airport	-4.59667	143.523
PG	East New Britain	OPB	Open Bay Airport	-4.79473	151.696
PG	Gulf	KRI	Kikori Airport	-7.42438	144.25
PG	Southern Highlands	OPU	Balimo Airport	-8.05	142.933
PG	Central	ONB	Ononge Airport	-8.67436	147.262
PG	Southern Highlands	UPR	Upiara Airport	-8.5411	142.65
PG	Eastern Highlands	MJJ	Moki Airport	-5.7181	145.24
PG	National Capital District (Port Moresby)	URU	Uroubi Airport	-9.5162	148.559
PG	Chimbu	KMR	Karimui Airport	-6.4921	144.823
PG	Eastern Highlands	USO	Usino Airport	-5.5276	145.371
PG	Milne Bay	SAM	Salamo Airport	-9.6701	150.79
PG	National Capital District (Port Moresby)	UUU	Manumu Airport	-9.0746	147.574
PG	Gulf	KMA	Kerema Airport	-7.96361	145.771
PG	Morobe	OSE	Omora Airport	-7.82778	147.081
PG	Western	TBG	Tabubil Airport	-5.27861	141.226
PG	West New Britain	UVO	Uvol Airport	-6.0178	150.956
PG	Gulf	TDS	Sasereme Airport	-7.6217	142.868
PG	Western	OSG	Ossima Airport	-2.91556	141.297
PG	Northern	TFI	Tufi Airport	-9.07595	149.32
PG	East New Britain	OTY	Oria Airport	-6.57761	155.771
PG	Morobe	GAP	Gusap Airport	-6.0532	145.959
PG	National Capital District (Port Moresby)	PAW	Pambwa Airport	-10.5833	151.083
PG	Southern Highlands	TIZ	Tari Airport	-5.845	142.948
PG	Morobe	PDI	Pindiu Airport	-6.44514	147.516
PG	West New Britain	TLW	Talasea Airport	-5.2726	150.009
PG	Western	PGB	Pangoa Airport	-7.0226	141.561
PG	Central	FNE	Fane Airport	-8.54928	147.086
PG	Morobe	PGE	Yegepa Airport	-7.13444	146.156
PG	Central	TPI	Tapini Airport	-8.35667	146.989
PG	Western Highlands	PGN	Pangia Airport	-6.386	144.108
PG	Morobe	FIN	Finschhafen Airport	-6.62175	147.854
PG	Southern Highlands	WAJ	Wawoi Falls Airport	-6.9523	142.656
PG	Western	UNG	Kiunga Airport	-6.12571	141.282
PG	Southern Highlands	PLE	Paiela Airport	-5.3725	142.976
PG	West Sepik	VAI	Vanimo Airport	-2.6926	141.303
PG	National Capital District (Port Moresby)	PMN	Pumani Airport	-9.7469	149.477
PG	Milne Bay	VIV	Vivigani Airfield	-9.30333	150.319
PG	West New Britain	WBC	Wapolu Airport	-9.3376	150.509
PG	Central	EFG	Efogi Airport	-9.15381	147.66
PG	Western Highlands	UAE	Mount Aue Airport	-6.23417	144.665
PG	Gulf	VMU	Baimuru Airport	-7.49686	144.82
PG	Western	WEP	Weam Airport	-8.6184	141.138
PG	Gulf	WAO	Wabo Airport	-6.98944	145.075
PG	Southern Highlands	PMP	Pimaga Airport	-6.49917	143.51
PG	Enga	WBM	Wapenamanda Airport	-5.6433	143.895
PG	Morobe	WGU	Wagau Airport	-6.8519	146.802
PG	Western	WPM	Wipim Airport	-8.78822	142.882
PG	National Capital District (Port Moresby)	PPX	Param Airport	-9.99	149.477
PG	Central	WTP	Woitape Airport	-8.54583	147.253
PG	West New Britain	WIU	Witu Airport	-4.68952	149.44
PG	East Sepik	WWK	Wewak Airport	-3.58383	143.669
PG	East New Britain	WKN	Wakunai Airport	-5.8603	155.222
PG	Western	DAU	Daru Airport	-9.08676	143.208
PG	New Ireland	PUA	Puas Airport	-2.395	150.236
PG	Chimbu	CMU	Chimbu Airport	-6.02429	144.971
PG	Southern Highlands	PUI	Pureni Airport	-5.8429	142.828
PG	West New Britain	CGC	Cape Gloucester Airport	-5.45896	148.432
PG	East New Britain	RAA	Rakanda Airport	-4.2096	152.439
PG	Morobe	BUL	Bulolo Airport	-7.21629	146.65
PG	Madang	WNU	Wanuma Airport	-4.8961	145.321
PG	Bougainville	BUA	Buka Island Airport	-5.42232	154.673
PG	Eastern Highlands	WOA	Wonenara Airport	-6.79686	145.892
PG	Western	BSP	Bensbach Airport	-8.85806	141.259
PG	East New Britain	RAW	Arawa Airport	-6.22056	155.571
PG	Western	BPK	Biangabip Airport	-5.52639	141.745
PG	Southern Highlands	WSA	Wasua Airport	-8.2836	142.87
PG	Western	BOT	Bosset Airport	-7.23726	141.106
PG	National Capital District (Port Moresby)	RAX	Oram Airport	-9.63292	148.048
PG	Western	ABP	Atkamba Airport	-6.06556	141.095
PG	Morobe	WSU	Wasu Airport	-5.96171	147.198
PG	Eastern Highlands	ADC	Andakombe Airport	-7.13722	145.745
PG	Morobe	WTT	Wantoat Airport	-6.1325	146.468
PG	Morobe	AEK	Aseki Airport	-7.3508	146.194
PG	Morobe	WUG	Wau Airport	-7.34556	146.719
PG	National Capital District (Port Moresby)	AFR	Afore Airport	-9.14222	148.391
PG	West New Britain	WUM	Wasum Airport	-6.0491	149.337
PG	Southern Highlands	AGK	Kagua Airport	-6.39639	143.854
PG	Western Highlands	WUV	Wuvulu Island Airport	-1.73611	142.837
PG	Western	AKG	Anguganak Airport	-3.5605	142.217
PG	National Capital District (Port Moresby)	XBN	Biniguni Airport	-9.6425	149.304
PG	Western	AMF	Ama Airport	-4.10111	141.67
PG	National Capital District (Port Moresby)	RBP	Rabaraba Airport	-9.97111	149.832
PG	Western Highlands	AMG	Amboin Airport	-4.6	143.5
PG	Southern Highlands	RGE	Porgera Airport	-5.4792	143.124
PG	Western	AMU	Amanab Airport	-3.586	141.214
PG	Western	XYR	Edwaki Airport	-3.88399	141.792
PG	Central	AOA	Aroa Airport	-9.0254	146.8
PG	Western Highlands	YEQ	Yankisa Airport	-5.10972	143.918
PG	Western Highlands	AOB	Annanberg Airport	-4.90417	144.636
PG	Central	RKU	Kairuku Airport	-8.817	146.524
PG	Eastern Highlands	AON	Arona Airport	-6.25	145.967
PG	Western	RMN	Rumginae Airport	-5.89722	141.272
PG	National Capital District (Port Moresby)	APP	Asapa Airport	-8.97917	148.104
PG	National Capital District (Port Moresby)	RNR	Robinson River Airport	-10.171	148.823
PG	Southern Highlands	APR	April River Airport	-4.67667	142.54
PG	Western Highlands	RUU	Ruti Airport	-5.33444	144.257
PG	National Capital District (Port Moresby)	ARP	Aragip Airport	-9.88333	149.483
PG	Morobe	YVD	Yeva Airport	-7.548	146.188
PG	West New Britain	ASZ	Asirim Airport	-6.00972	150.369
PG	Western	SBC	Selbang Airport	-5.315	141.752
PG	Western	ATP	Aitape Airstrip	-3.14361	142.347
PG	Morobe	ZEN	Zenag Airport	-6.95222	146.616
PG	Western Highlands	AUI	Aua Island Airport	-1.46056	143.065
PG	Western	SBE	Suabi Airport	-6.10444	142.278
PG	Southern Highlands	AUJ	Ambunti Airport	-4.21567	142.823
PG	National Capital District (Port Moresby)	WED	Wedau Airport	-10.0954	150.083
PG	Morobe	AUV	Aumo Airport	-5.73111	148.445
PG	Madang	AWR	Awar Airport	-4.124	144.853
PG	National Capital District (Port Moresby)	AZB	Amazon Bay Airport	-10.2992	149.338
PG	West New Britain	BAA	Bialla Airport	-5.33056	151.008
PG	West New Britain	BAJ	Bali Airport	-4.88333	149.133
PG	National Capital District (Port Moresby)	BAP	Baibara Airport	-10.3432	149.641
PG	Morobe	BCP	Bambu Airport	-5.86361	146.492
PG	Morobe	BDZ	Baindoung Airport	-6.34722	146.942
PG	Central	BEA	Bereina Airport	-8.64	146.508
PG	Madang	BIJ	Biliau Airport	-5.578	146.339
PG	Western	BIZ	Bimin Airport	-5.28611	142.033
PG	Western Highlands	BMH	Bomai Airport	-6.37317	144.637
PG	Southern Highlands	BMZ	Bamu Airport	-7.8485	143.243
PG	National Capital District (Port Moresby)	BNM	Bodinumu Airport	-9.10778	147.667
PG	Eastern Highlands	BNT	Bundi Airport	-5.74222	145.227
PG	Morobe	BNV	Boana Airport	-6.433	146.825
PG	Western Highlands	BNZ	Banz Airport	-5.807	144.623
PG	East New Britain	BOQ	Boku Airport	-6.5427	155.342
PG	East New Britain	BOV	Boang Island Airport	-3.3834	153.281
PG	National Capital District (Port Moresby)	BPB	Boridi Airport	-9.13333	147.533
PG	Morobe	BPD	Bapi Airport	-7.74361	147.021
PG	Eastern Highlands	BRH	Brahman Airport	-5.7	145.367
PG	Morobe	BRP	Biaru Airport	-7.6693	146.759
PG	Western	BVP	Bolovip Airport	-5.3633	141.655
PG	Morobe	BWJ	Bawan Airport	-6.39694	146.882
PG	Western	BWP	Bewani Airport	-3.02167	141.165
PG	Morobe	BXZ	Bunsil Airport	-5.7243	147.867
PG	East New Britain	CPI	Cape Orford Airport	-5.44833	152.082
PG	National Capital District (Port Moresby)	CPN	Cape Rodney Airport	-10.1798	148.379
PG	Western Highlands	CVB	Chungrebu Airport	-4.80662	144.715
PG	National Capital District (Port Moresby)	CVL	Cape Vogel Airport	-9.67	150.02
PG	Madang	DAF	Daup Airport	-4.7403	145.952
PG	National Capital District (Port Moresby)	DAO	Dabo Airport	-8.43194	147.843
PG	Western	DBP	Debepare Airport	-6.30861	141.906
PG	National Capital District (Port Moresby)	DDM	Dodoima Airport	-8.17736	147.809
PG	Morobe	DER	Derim Airport	-6.14472	147.107
PG	Western	DLB	Dalbertis Airport	56.7417	23.8911
PG	Morobe	DNU	Dinangat Airport	-6.1546	146.677
PG	National Capital District (Port Moresby)	DOI	Doini Island Airport	-10.7009	150.722
PG	National Capital District (Port Moresby)	DOO	Dorobisoro Airstrip	-9.46185	147.921
PG	East New Britain	DOS	Dios Airport	-5.5609	154.962
PG	Eastern Highlands	DPU	Dumpu Airport	-5.858	145.705
PG	Morobe	EGA	Engati Airport	-6.9179	146.105
PG	National Capital District (Port Moresby)	EIA	Popondetta Airport	-8.2	147.85
PG	New Ireland	EMI	Emirau Airport	-1.65395	149.976
PG	National Capital District (Port Moresby)	EMO	Emo Airport	-9.1234	148.042
PG	National Capital District (Port Moresby)	EMS	Embessa Airport	-9.447	148.763
PG	Western	EPT	Eliptamin Airport	-5.0412	141.678
PG	Southern Highlands	ERE	Erave Airport	-6.60646	143.9
PG	Central	ERU	Erume Airport	-8.2538	146.975
PG	National Capital District (Port Moresby)	ESA	Esa'ala Airport	-9.87433	150.954
PG	Western	FAQ	Frieda River Airport	-4.61047	141.96
PG	Western	FRQ	Feramin Airport	-5.208	141.699
PG	West New Britain	FUB	Fulleborn Airport	-6.1518	150.626
PG	Western	FUM	Fuma Airport	-6.3933	142.441
PG	Morobe	GAR	Garaina Airport	-7.87563	147.141
PG	West New Britain	GAZ	Guasopa Airport	-9.22592	152.944
PG	Western	GBC	Gasuke Airport	-6.1028	141.739
PG	Western Highlands	GBF	Negarbo Airport	-6.56778	144.703
PG	National Capital District (Port Moresby)	GEW	Gewoia Airport	-9.2263	148.495
PG	Western	GLP	Gulgubip Airport	-5.2808	141.541
PG	National Capital District (Port Moresby)	GOC	Gora Airport	-9.0021	148.236
PG	East New Britain	GOE	Gonaili Airstrip	-5.52772	151.573
PG	National Capital District (Port Moresby)	GRH	Garuahi Airport	-10.2251	150.488
PG	Morobe	GRL	Garasa Airport	-7.98071	147.213
PG	Western	GUE	Guriaso Airport	-3.58317	141.589
PG	Central	GUG	Guari Airport	-8.1286	146.872
PG	Western	GUV	Mougulu Airport	-6.28086	142.421
PG	Western	GVI	Green River Airport	-3.90224	141.171
PG	Morobe	GWN	Gnarowein Airport	-6.555	146.248
PG	Madang	HAZ	Hatzfeldthaven Airport	-4.4033	145.206
PG	Southern Highlands	HBD	Habi Airport	-6.32	142.489
PG	Southern Highlands	HIT	Haivaro Airport	-6.9406	143.059
PG	Morobe	HNI	Heiweni Airport	-7.4223	146.428
PG	Central	HNN	Honinabi Airport	-16.2457	142.177
PG	Eastern Highlands	HOC	Komako Airport	-7.3984	145.883
PG	Morobe	HWA	Hawabango Airport	-7.39299	146.003
PG	Southern Highlands	HYF	Hayfields Airport	-3.69838	143.058
PG	National Capital District (Port Moresby)	IAU	Iaura Airport	-9.78333	148.1
PG	West New Britain	IBI	Iboki Airport	-5.5536	149.19
PG	Morobe	IDN	Indagen Airport	-6.22663	147.244
PG	Madang	ILX	Ileg Airport	-5.4917	145.802
PG	National Capital District (Port Moresby)	IMA	Iamalele Airport	-9.5107	150.525
PG	Western	IMD	Imonda Airport	-3.328	141.157
PG	Morobe	IMN	Imane Airport	-6.7524	146.107
PG	Central	IOK	Iokea Airport	-8.401	146.277
PG	National Capital District (Port Moresby)	IOP	Ioma Airport	-8.3614	147.84
PG	East New Britain	IUS	Inus Airport	-5.7568	155.15
PG	Madang	JOP	Josephstaal Airport	-4.74708	145.007
PG	East New Britain	KAF	Karato Airport	-6.2655	155.305
PG	Southern Highlands	KAK	Kar Airport	-6.23333	143.483
PG	Central	KAQ	Kamulai Airport	-8.15069	146.834
PG	Morobe	KBM	Kabwum Airport	-6.15547	147.191
PG	Southern Highlands	KCJ	Komaio Airport	-7.2714	143.595
PG	Southern Highlands	KDE	Koroba Airport	-5.6952	142.744
PG	Southern Highlands	KDP	Kandep Airport	-5.84061	143.507
PG	Western	KDQ	Kamberatoro Airport	-3.60056	141.052
PG	Eastern Highlands	KEG	Keglsugl Airport	-5.83278	145.097
PG	Morobe	KEX	Kanabea Airport	-7.53889	145.905
PG	Morobe	KGB	Konge Airport	-6.2239	147.215
PG	Central	KGH	Yongai Airport	-8.5289	147.46
PG	Western	KGM	Kungim Airport	-5.671	141.03
PG	Morobe	KIA	Kaiapit Airport	-6.275	146.27
PG	Southern Highlands	KII	Kibuli Airport	-9.00653	142.698
PG	Central	KIQ	Kira Airport	-8.06511	147.332
PG	National Capital District (Port Moresby)	KIZ	Kikinonda Airport	-8.5284	147.931
PG	East New Britain	KJU	Kamiraba Airport	-3.1995	151.908
PG	Western Highlands	KMB	Koinambe Airport	-5.4875	144.607
PG	Morobe	KMF	Kamina Airport	-7.64925	145.957
PG	Western Highlands	KNE	Kanainj Airport	-5.2903	144.707
PG	Morobe	KNL	Kelanoa Airport	-6.01	147.49
PG	Southern Highlands	KOM	Komo-Manda Airport	-6.0682	142.86
PG	Morobe	KOR	Kakoro Airport	-7.83467	146.533
PG	Southern Highlands	KPA	Kopiago Airport	-5.3883	142.498
PG	Western	KPE	Yapsiei Airport	-4.62806	141.094
PG	Southern Highlands	KPF	Kondubol Airport	-8.5336	142.505
PG	Southern Highlands	KPL	Kapal Airport	-8.63018	142.824
PG	Western Highlands	KPM	Kompiam Airport	-5.38167	143.925
PG	Eastern Highlands	KQL	Kol Airport	-5.73117	144.846
PG	Central	KRU	Kerau Airport	-8.27161	147.072
PG	Madang	KRX	Karkar Airport	-4.557	145.94
PH	Palawan	SWL	San Vicente Airport	10.525	119.274
PH	Misamis Oriental	OZC	Labo Airport	8.17851	123.842
PH	La Union	SFE	San Fernando Airport	16.5956	120.303
PH	Pampanga	CRK	Clark International Airport	15.186	120.56
PH	Batanes	BSO	Basco Airport	20.4513	121.98
PH	Capiz	RXS	Roxas Airport	11.5977	122.752
PH	Quezon	BSI	Balesin Airport	14.4194	122.039
PH	Negros Occidental	AAV	Allah Valley Airport	6.36682	124.751
PH	Sulu	JOL	Jolo Airport	6.05367	121.011
PH	Aklan	KLO	Kalibo International Airport	11.6794	122.376
PH	Iloilo	ILO	Iloilo International Airport	10.833	122.493
PH	Palawan	USU	Francisco B. Reyes Airport	12.1215	120.1
PH	Cavite	SGL	Danilo Atienza Air Base	14.4954	120.904
PH	Samar	CYP	Calbayog Airport	12.0727	124.545
PH	Antique	EUQ	Evelio Javier Airport (Antique Airport)	10.766	121.933
PH	Samar	TGB	Tagbita Airport	12.0721	124.546
PH	Mindoro Occidental	LBX	Lubang Airport	13.8554	120.105
PH	Surigao del Sur	TDG	Tandag Airport	9.07211	126.171
PH	Bohol	TAG	Tagbilaran Airport	9.66544	123.854
PH	Leyte	OMC	Ormoc Airport	11.058	124.565
PH	Palawan	CUJ	Culion Airport	11.8553	119.938
PH	Camarines Norte	DTE	Bagasbas Airport	14.1292	122.98
PH	Zamboanga del Sur	PAG	Pagadian Airport	7.83073	123.461
PH	Albay	LGP	Legazpi International Airport	13.1575	123.735
PH	Mindoro Occidental	MBO	Mamburao Airport	13.2081	120.605
PH	Northern Samar	CRM	Catarman National Airport	12.5024	124.636
PH	Cagayan	TUG	Tuguegarao Airport	17.6434	121.733
PH	Masbate	MBT	Moises R. Espinosa Airport (Masbate Airport)	12.3697	123.63
PH	Ilocos Norte	LAO	Laoag International Airport	18.1781	120.532
PH	Aurora	BQA	Dr. Juan C. Angara Airport	15.7293	121.5
PH	Palawan	CYU	Cuyo Airport	10.8581	121.069
PH	Palawan	RZP	Cesar Lim Rodriguez Airport	10.8187	119.508
PH	Zamboanga del Norte	XSO	Siocon Airport	7.71048	122.161
PH	Aklan	MPH	Godofredo P. Ramos Airport (Caticlan Airport)	11.9245	121.954
PH	Negros Occidental	DGT	Sibulan Airport (Dumaguete Airport)	9.33371	123.3
PH	Compostela Valley	MXI	Mati Airport (Imelda R. Marcos Airport)	6.94909	126.274
PH	Surigao del Sur	BPH	Bislig Airport	8.19595	126.322
PH	Isabela	CYZ	Cauayan Airport	16.9299	121.753
PH	Cagayan	LLC	Cagayan North International Airport (Lal-lo Airport)	18.1811	121.745
PH	South Cotabato	GES	General Santos International Airport (Tambler Airport)	6.058	125.096
PH	Davao del Sur	DVO	Francisco Bangoy International Airport	7.12552	125.646
PH	Bukidnon	XMA	Maramag Airport	7.7538	125.033
PH	Surigao del Sur	BNQ	Baganga Airport	7.61194	126.569
PH	Iloilo	ICO	Sicogon Airport	11.4595	123.251
PH	Maguindanao	MLP	Malabang Airport	7.61722	124.059
PH	Zamboanga del Sur	ZAM	Zamboanga International Airport	6.92242	122.06
PH	Palawan	XCN	Coron Airport	12.1211	120.099
PH	Surigao del Norte	IAO	Sayak Airport (Siargao Airport)	9.8591	126.014
PH	Sulu	SSV	Siasi Airport	5.558	120.833
PH	Surigao del Norte	SUG	Surigao Airport	9.75584	125.481
PH	Lanao del Norte	IGN	Maria Cristina Airport (Iligan Airport)	8.13049	124.215
PH	Mindoro Occidental	SJI	San Jose Airport	12.3615	121.047
PH	Tawi-Tawi	TWT	Sanga-Sanga Airport	5.04699	119.743
PH	Misamis Oriental	CGY	Laguindingan Airport	8.6122	124.456
PH	Camiguin	CGM	Camiguin Airport	9.25352	124.707
PH	Aurora	CGG	Casiguran Airport	16.1941	122.065
PH	Cebu	CEB	Mactan-Cebu International Airport	10.3075	123.979
PH	National Capital Region	MNL	Ninoy Aquino International Airport / Villamor Air Base	14.5086	121.02
PH	Bataan	SFS	Subic Bay International Airport	14.7944	120.271
PH	Tawi-Tawi	CDY	Cagayan de Sulu Airport	7.014	118.496
PH	Maguindanao	CBO	Awang Airport	7.16524	124.21
PH	Zamboanga del Norte	DPL	Dipolog Airport	8.60198	123.342
PH	Leyte	TAC	Daniel Z. Romualdez Airport	11.228	125.028
PH	Agusan del Norte	BXU	Bancasi Airport	8.9515	125.479
PH	Catanduanes	VRC	Virac Airport	13.5764	124.206
PH	Marinduque	MRQ	Marinduque Airport	13.361	121.826
PH	Eastern Samar	DSG	Dilasag Airport	16.4458	122.207
PH	Romblon	TBH	Tugdan Airport	12.311	122.085
PH	Palawan	ENI	El Nido Airport	11.2024	119.416
PH	Benguet	BAG	Loakan Airport	16.3751	120.62
PH	Negros Occidental	BCD	Bacolod-Silay International Airport	10.7764	123.015
PH	Sultan Kudarat	LWA	Lebak Airport	6.6739	124.058
PH	Camarines Sur	WNP	Naga Airport	13.5849	123.27
PH	Palawan	PPS	Puerto Princesa International Airport	9.74212	118.759
PH	Zamboanga Sibugay	IPE	Ipil Airport	7.78556	122.602
PK	Sindh	ZIZ	Zamzama Airport	26.7109	67.6673
PK	Punjab	LYP	Faisalabad International Airport	31.365	72.9948
PK	Azad Jammu and Kashmir	XJM	Mangla Airport	33.0501	73.6384
PK	Balochistan	PJG	Panjgur Airport	26.9545	64.1325
PK	Gilgit-Baltistan	KDU	Skardu Airport	35.3355	75.536
PK	Khyber Pakhtunkhwa	CJL	Chitral Airport	35.8866	71.8006
PK	Sindh	HDD	Hyderabad Airport	25.3181	68.3661
PK	Punjab	SKT	Sialkot International Airport	32.5356	74.3639
PK	Sindh	SKZ	Sukkur Airport	27.722	68.7917
PK	Punjab	DEA	Dera Ghazi Khan International Airport	29.961	70.4859
PK	Sindh	DDU	Dadu Airport	26.7408	67.6666
PK	Sindh	MPD	Sindhri Airport	25.6828	69.0728
PK	Balochistan	REQ	Reko Diq Airport	29.0469	62.1968
PK	Khyber Pakhtunkhwa	PAJ	Parachinar Airport	33.9021	70.0716
PK	Balochistan	TUK	Turbat International Airport	25.9864	63.0302
PK	Gilgit-Baltistan	GIL	Gilgit Airport	35.9188	74.3336
PK	Balochistan	KDD	Khuzdar Airport	27.7906	66.6473
PK	Balochistan	GWD	Gwadar International Airport	25.2333	62.3295
PK	Khyber Pakhtunkhwa	TLB	Tarbela Dam Airport	33.9861	72.6114
PK	Punjab	LHE	Allama Iqbal International Airport	31.5216	74.4036
PK	Balochistan	NHS	Nushki Airport	29.539	66.0233
PK	Punjab	RYK	Shaikh Zayed International Airport	28.3839	70.2796
PK	Sindh	RZS	Sawan Airport	26.9662	68.8781
PK	Balochistan	PSI	Pasni Airport	25.2905	63.3451
PK	Balochistan	SUL	Sui Airport	28.6451	69.1769
PK	Balochistan	ORW	Ormara Airport	25.2747	64.586
PK	Balochistan	PZH	Zhob Airport	31.3584	69.4636
PK	Khyber Pakhtunkhwa	SDT	Saidu Sharif Airport	34.8136	72.3528
PK	Punjab	SWN	Sahiwal Airport	31.8894	72.3917
PK	Punjab	GRT	Gujrat Airport	32.6031	74.0771
PK	Khyber Pakhtunkhwa	OHT	PAF Base Kohat	33.57	71.44
PK	Sindh	JAG	PAF Base Shahbaz	28.2842	68.4497
PK	Punjab	SGI	PAF Base Mushaf	32.0486	72.665
PK	Balochistan	TFT	Taftan Airport	28.9642	61.5954
PK	Balochistan	JIW	Jiwani Airport	25.0678	61.8054
PK	Islamabad	ISB	Islamabad International Airport	33.5607	72.8516
PK	Balochistan	UET	Quetta International Airport	30.2514	66.9378
PK	Sindh	BDN	Talhar Airport	24.8415	68.8384
PK	Azad Jammu and Kashmir	RAZ	Rawalakot Airport	33.8497	73.7981
PK	Punjab	ATG	PAF Base Minhas	33.8691	72.4009
PK	Punjab	BHV	Bahawalpur Airport	29.3481	71.718
PK	Punjab	BHW	Bhagatanwala Airport	32.0561	72.9484
PK	Balochistan	LRG	Loralai Airport	30.3555	68.6135
PK	Sindh	KHI	Jinnah International Airport	24.9065	67.1608
PK	Punjab	MWD	PAF Base M.M. Alam	32.5631	71.5707
PK	Khyber Pakhtunkhwa	WAF	Wana Airport	32.3047	69.5704
PK	Khyber Pakhtunkhwa	PEW	Bacha Khan International Airport	33.9939	71.5146
PK	Azad Jammu and Kashmir	MFG	Muzaffarabad Airport	34.339	73.5086
PK	Punjab	MUX	Multan International Airport	30.2032	71.4191
PK	Khyber Pakhtunkhwa	BNP	Bannu Airport	32.9729	70.5279
PK	Sindh	SYW	Sehwan Sharif Airport	26.4731	67.7172
PK	Sindh	WNS	Nawabshah Airport	26.2194	68.3901
PK	Khyber Pakhtunkhwa	DSK	Dera Ismail Khan Airport	31.9094	70.8966
PK	Sindh	MJD	Moenjodaro Airport	27.3352	68.1431
PK	Balochistan	SBQ	Sibi Airport	29.5712	67.8479
PK	Sindh	KCF	Kadanwari Airport	27.1667	69.3167
PK	Gilgit-Baltistan	CHB	Chilas Airport	35.4267	74.0817
PK	Balochistan	DBA	Dalbandin Airport	28.8783	64.3998
PL	Kujawsko-pomorskie	BZG	Bydgoszcz Ignacy Jan Paderewski Airport	53.0968	17.9777
PL	Malopolskie	KRK	John Paul II International Airport Krakow-Balice	50.0777	19.7848
PL	Warminsko-mazurskie	SZY	Olsztyn-Mazury Regional Airport	53.4819	20.9377
PL	Pomorskie	GDN	Gdansk Lech Walesa Airport	54.3776	18.4662
PL	Podlaskie	RZE	Rzeszow-Jasionka Airport	50.11	22.019
PL	Zachodniopomorskie	OSZ	Koszalin-Zegrze Pomorskie Airport	54.0425	16.2656
PL	Lubelskie	BXP	Biala Podlaska Airport	52.0008	23.1325
PL	Dolnoslaskie	WRO	Copernicus Airport Wroclaw	51.1027	16.8858
PL	Lubuskie	IEG	Zielona Gora Airport	52.1385	15.7986
PL	Lubelskie	LUZ	Lublin Airport	51.2403	22.7136
PL	Slaskie	CZW	Czestochowa-Rudniki Airport	50.885	19.2047
PL	Slaskie	KTW	Katowice International Airport	50.4743	19.08
PL	Mazowieckie	WMI	Warsaw Modlin Airport	52.4511	20.6518
PL	Zachodniopomorskie	SZZ	Solidarity Szczecin-Goleniow Airport	53.5847	14.9022
PL	Wielkopolskie	POZ	Pozna awica Henryk Wieniawski Airport	52.421	16.8263
PL	Lodzkie	LCJ	Lodz Wladyslaw Reymont Airport	51.7219	19.3981
PL	Mazowieckie	WAW	Warsaw Chopin Airport	52.1657	20.9671
PL	Mazowieckie	RDO	Radom Airport	51.3892	21.2133
PM	Saint Pierre and Miquelon	FSP	Saint-Pierre Airport	46.7629	-56.1731
PM	Saint Pierre and Miquelon	MQC	Miquelon Airport	47.0955	-56.3803
PR	Carolina	SJU	Luis Munoz Marin International Airport	18.4394	-66.0018
PR	Ponce	PSE	Mercedita Airport	18.0083	-66.563
PR	San Juan	SIG	Fernando Luis Ribas Dominicci Airport	18.4568	-66.0981
PR	San Juan	SJU	Luis MuÃƒÂ±oz MarÃƒÂ­n International Airport	18.4392	-66.0019
PS	Gaza	GZA	Yasser Arafat International Airport	31.2464	34.2761
PT	Regiao Autonoma da Madeira	PXO	Porto Santo Airport	33.0734	-16.35
PT	Faro	FAO	Faro Airport	37.0144	-7.96591
PT	Regiao Autonoma dos Acores	HOR	Horta Airport	38.5199	-28.7159
PT	Regiao Autonoma dos Acores	PIX	Pico Airport	38.5543	-28.4413
PT	Regiao Autonoma dos Acores	FLW	Flores Airport	39.4553	-31.1314
PT	Vila Real	VRL	Vila Real Airport	41.2743	-7.72047
PT	Braganca	BGC	Braganca Airport	41.8578	-6.70713
PT	Regiao Autonoma dos Acores	SJZ	Sao Jorge Airport	38.6655	-28.1758
PT	Lisboa	CAT	Cascais Municipal Aerodrome	38.725	-9.35523
PT	Beja	BYJ	Beja Airport	38.0789	-7.9324
PT	Viseu	VSE	Viseu Airport	40.7255	-7.88899
PT	Regiao Autonoma dos Acores	PDL	Joao Paulo II Airport	37.7412	-25.6979
PT	Porto	OPO	Francisco de Sa Carneiro Airport	41.2481	-8.68139
PT	Regiao Autonoma dos Acores	SMA	Santa Maria Airport	36.9714	-25.1706
PT	Lisboa	SIE	Sines Airport	37.9417	-8.8173
PT	Braga	BGZ	Braga Airport	41.5871	-8.44514
PT	Regiao Autonoma dos Acores	TER	Lajes Field	38.7618	-27.0908
PT	Regiao Autonoma dos Acores	CVU	Corvo Airport	39.6715	-31.1136
PT	Coimbra	CBP	Coimbra Airport	40.1576	-8.46984
PT	Regiao Autonoma da Madeira	FNC	Madeira Airport	32.6979	-16.7745
PT	Regiao Autonoma dos Acores	GRW	Graciosa Airport	39.0922	-28.0298
PT	Lisboa	LIS	Lisbon Portela Airport	38.7813	-9.13592
PT	Faro	PRM	Portimao Airport	37.1493	-8.58396
PT	Vila Real	CHV	Chaves Airport	41.7224	-7.46306
PT	Porto	OPO	Francisco SÃƒÂ¡ Carneiro Airport	41.2356	-8.67806
PW	Airai	ROR	Roman Tmetuchl International Airport	7.36731	134.544
PY	Concepcion	PBT	Puerto Leda Airport	-20.9046	-57.9271
PY	Alto Parana	AGT	Guarani  International Airport	-25.4545	-54.8427
PY	Alto Paraguay	PCJ	Puerto La Victoria Airport	-22.295	-57.8663
PY	Concepcion	CIO	Teniente Coronel Carmelo Peralta Airport	-23.4424	-57.4273
PY	Misiones	AYO	Juan de Ayolas Airport	-27.3706	-56.8541
PY	Itapua	ENO	Teniente Amin Ayub Gonzalez Airport	-27.2274	-55.8375
PY	Boqueron	FLM	Filadelfia Airport	-22.3605	-60.0536
PY	Concepcion	VMI	Dr. Juan Plate Airport	-22.1591	-57.9426
PY	Alto Paraguay	OLK	Fuerte Olimpo Airport	-21.0452	-57.8825
PY	Neembucu	PIL	Carlos Miguel Jimenez Airport	-26.8812	-58.318
PY	Central	ASU	Silvio Pettirossi International Airport	-25.24	-57.52
PY	Concepcion	BFA	Bahia Negra Airport	-20.2246	-58.1792
PY	Amambay	PJC	Dr. Augusto Roberto Fuster International Airport	-22.64	-55.83
PY	Boqueron	ESG	Dr. Luis Maria Argana International Airport	-22.05	-60.62
QA	Ar Rayyan	XJD	Al Udeid Air Base	25.1173	51.315
QA	Ad Dawhah	DOH	Hamad International Airport	25.2731	51.6081
QA	Ad Dawhah	DIA	Doha International Airport	25.2611	51.5651
RE	Reunion	ZSE	Pierrefonds Airport	-21.3209	55.425
RE	Reunion	RUN	Roland Garros Airport	-20.8871	55.5103
RO	Dolj	CRA	Craiova International Airport	44.3181	23.8886
RO	Bihor	OMR	Oradea International Airport	47.0253	21.9025
RO	Bacau	BCM	Bacau International Airport	46.5219	26.9103
RO	Caras-Severin	CSB	Caransebes Airport	45.42	22.2533
RO	Constanta	CND	Mihail Kogalniceanu International Airport	44.3622	28.4883
RO	Satu Mare	SUJ	Satu Mare International Airport	47.7033	22.8857
RO	Iasi	IAS	Iasi International Airport	47.1785	27.6206
RO	Mures	TGM	Targu Mures International Airport	46.4677	24.4125
RO	Sibiu	SBZ	Sibiu International Airport	45.7856	24.0913
RO	Maramures	BAY	Baia Mare Airport	47.6606	23.4673
RO	Suceava	SCV	Suceava International Airport (Stefan cel Mare Int'l)	47.6875	26.3541
RO	Arad	ARW	Arad International Airport	46.1766	21.262
RO	Cluj	CLJ	Cluj-Napoca International Airport	46.7852	23.6862
RO	Timis	TSR	Timisoara Traian Vuia International Airport	45.8099	21.3379
RO	Tulcea	TCE	Tulcea Danube Delta Airport	45.0625	28.7143
RO	Ilfov	OTP	Bucharest Henri CoandÃ„Æ’ International Airport	44.5711	26.085
RS	Beograd	BEG	Belgrade Nikola Tesla Airport	44.8184	20.3091
RS	Nisavski okrug	INI	Nis Constantine the Great Airport	43.3373	21.8537
RS	Zlatiborski okrug	UZC	Uzice-Ponikve Airport	43.898	19.6972
RS	Beograd	BJY	Batajnica Air Base	44.9353	20.2575
RU	Khanty-Mansiyskiy avtonomnyy okrug	URJ	Uray Airport	60.1033	64.8267
RU	Magadanskaya oblast'	SWV	Severo-Evensk Airport	29.1667	70.4333
RU	Kurskaya oblast'	URS	Kursk Vostochny Airport	51.7506	36.2956
RU	Komi, Respublika	USK	Usinsk Airport	66.0047	57.3672
RU	Bashkortostan, Respublika	OKT	Oktyabrsky Airport	54.44	53.3883
RU	Krasnoyarskiy kray	IAA	Igarka Airport	67.4372	86.6219
RU	Orenburgskaya oblast'	OSW	Orsk Airport	51.0725	58.5956
RU	Saha, Respublika	USR	Ust-Nera Airport	64.55	143.115
RU	Kabardino-Balkarskaya Respublika	NAL	Nalchik Airport	43.5129	43.6366
RU	Krasnoyarskiy kray	HTG	Khatanga Airport	71.9781	102.491
RU	Saha, Respublika	CYX	Chersky Airport	68.7406	161.338
RU	Khanty-Mansiyskiy avtonomnyy okrug	IRM	Igrim Airport	63.1988	64.4393
RU	Khanty-Mansiyskiy avtonomnyy okrug	NJC	Nizhnevartovsk Airport	60.9493	76.4836
RU	Tatarstan, Respublika	UUA	Bugulma Airport	54.64	52.8017
RU	Buryatiya, Respublika	UUD	Baikal International Airport	51.8078	107.438
RU	Sakhalinskaya oblast'	UUS	Yuzhno-Sakhalinsk Airport (Khomutovo Airport)	46.8887	142.718
RU	Saha, Respublika	GYG	Magan Airport	62.1035	129.545
RU	Smolenskaya oblast'	LNX	Smolensk South Airport	54.824	32.025
RU	Udmurtskaya Respublika	IJK	Izhevsk Airport	56.8281	53.4575
RU	Khanty-Mansiyskiy avtonomnyy okrug	SGC	Surgut International Airport	61.3437	73.4018
RU	Krasnodarskiy kray	KRR	Krasnodar International Airport (Pashkovsky Airport)	45.0347	39.1705
RU	Komi, Respublika	INA	Inta Airport	66.0548	60.1103
RU	Kurganskaya oblast'	KRO	Kurgan Airport	55.4753	65.4156
RU	Khanty-Mansiyskiy avtonomnyy okrug	RAT	Raduzhny Airport	62.1586	77.3289
RU	Arkhangel'skaya oblast'	ARH	Talagi Airport	64.6003	40.7167
RU	Saha, Respublika	OLZ	Olyokminsk Airport	60.3975	120.471
RU	Stavropol'skiy kray	STW	Stavropol Shpakovskoye Airport	45.1092	42.1128
RU	Sakhalinskaya oblast'	EKS	Shakhtyorsk Airport	49.1903	142.083
RU	Mariy El, Respublika	JOK	Yoshkar-Ola Airport	56.7006	47.9047
RU	Vologodskaya oblast'	VGD	Vologda Airport	59.2825	39.9444
RU	Khabarovskiy kray	KHV	Khabarovsk Novy Airport	48.528	135.188
RU	Saha, Respublika	VHV	Verkhnevilyuysk Airport	63.4581	120.269
RU	Krasnodarskiy kray	EIK	Yeysk Airport	46.68	38.21
RU	Krasnoyarskiy kray	EIE	Yeniseysk Airport	58.4742	92.1125
RU	Sakhalinskaya oblast'	ZZO	Zonalnoye Airport	50.6692	142.761
RU	Omskaya oblast'	OMS	Omsk Tsentralny Airport	54.967	73.3105
RU	Belgorodskaya oblast'	EGO	Belgorod International Airport	50.6438	36.5901
RU	Lipetskaya oblast'	LPK	Lipetsk Airport	52.7028	39.5378
RU	Saha, Respublika	SUY	Suntar Airport	62.185	117.635
RU	Komi, Respublika	VKT	Vorkuta Airport	67.4886	63.9931
RU	Astrakhanskaya oblast'	ASF	Narimanovo Airport	46.2833	48.0063
RU	Arkhangel'skaya oblast'	CSH	Solovki Airport	65.03	35.7333
RU	Rostovskaya oblast'	VLK	Volgodonsk Airport	47.6821	42.0728
RU	Pskovskaya oblast'	VLU	Velikiye Luki Airport	56.3811	30.6081
RU	Chuvashskaya Respublika	CSY	Cheboksary Airport	56.0903	47.3473
RU	Krasnodarskiy kray	AAQ	Anapa Airport	45.0021	37.3473
RU	Khakasiya, Respublika	ABA	Abakan International Airport	53.74	91.385
RU	Yamalo-Nenetskiy avtonomnyy okrug	NUX	Novy Urengoy Airport	66.0694	76.5203
RU	Orenburgskaya oblast'	REN	Orenburg Tsentralny Airport	51.7958	55.4567
RU	Krasnoyarskiy kray	ACS	Achinsk Airport	56.2683	90.5708
RU	Vologodskaya oblast'	VOG	Volgograd International Airport	48.7825	44.3455
RU	Saha, Respublika	BGN	Belaya Gora Airport	68.5566	146.232
RU	Voronezhskaya oblast'	VOZ	Voronezh International Airport (Chertovitskoye Airport)	51.8142	39.2296
RU	Kaluzhskaya oblast'	KLF	Grabtsevo Airport	54.55	36.3667
RU	Tverskaya oblast'	KLD	Migalovo Air Base	56.8247	35.7577
RU	Nenetskiy avtonomnyy okrug	VRI	Varandey Airport	68.8485	58.2014
RU	Tyva, Respublika	KYZ	Kyzyl Airport	51.6694	94.4006
RU	Saha, Respublika	ADH	Aldan Airport	58.6028	125.409
RU	Yamalo-Nenetskiy avtonomnyy okrug	SLY	Salekhard Airport	66.5908	66.611
RU	Tyumenskaya oblast'	TJM	Roshchino International Airport	57.1896	65.3243
RU	Primorskiy kray	AEM	Amgu Airport	45.8413	137.674
RU	Krasnodarskiy kray	AER	Sochi International Airport	43.4499	39.9566
RU	Irkutskaya oblast'	IWA	Ivanovo Yuzhny Airport	56.9394	40.9408
RU	Yamalo-Nenetskiy avtonomnyy okrug	KKQ	Krasnoselkup Airport	65.717	82.455
RU	Permskiy kray	PEE	Perm International Airport (Bolshoye Savino Airport)	57.9145	56.0212
RU	Saha, Respublika	ZKP	Zyryanka Airport	65.7485	150.889
RU	Saha, Respublika	ZIX	Zhigansk Airport	66.7965	123.361
RU	Ingushetiya, Respublika	IGT	Magas Airport (Sleptsovskaya Airport)	43.3223	45.0126
RU	Vologodskaya oblast'	VUS	Veliky Ustyug Airport	60.7883	46.26
RU	Moskva	ZIA	Ramenskoye Airport (Zhukovsky Airport)	55.5533	38.15
RU	Kareliya, Respublika	PES	Petrozavodsk Airport (Besovets Airport)	61.8852	34.1547
RU	Saha, Respublika	PYJ	Polyarny Airport	66.4004	112.03
RU	Primorskiy kray	VVO	Vladivostok International Airport	43.399	132.148
RU	Khanty-Mansiyskiy avtonomnyy okrug	KGP	Kogalym International Airport	62.1904	74.5338
RU	Irkutskaya oblast'	IKT	International Airport Irkutsk	52.268	104.389
RU	Saha, Respublika	VYI	Vilyuysk Airport	63.7567	121.693
RU	Tatarstan, Respublika	KZN	Kazan International Airport	55.6062	49.2787
RU	Buryatiya, Respublika	TLK	Talakan Airport	59.8764	111.044
RU	Khanty-Mansiyskiy avtonomnyy okrug	NYA	Nyagan Airport	62.11	65.615
RU	Komi, Respublika	PEX	Pechora Airport	65.1211	57.1308
RU	Primorskiy kray	TLY	Plastun Airport	44.815	136.292
RU	Yamalo-Nenetskiy avtonomnyy okrug	NYM	Nadym Airport	65.4809	72.6989
RU	Saha, Respublika	NYR	Nyurba Airport	63.295	118.337
RU	Penzenskaya oblast'	PEZ	Penza Airport (Ternovka Airport)	53.1106	45.0211
RU	Khabarovskiy kray	KXK	Komsomolsk-on-Amur Airport	50.409	136.934
RU	Krasnoyarskiy kray	THX	Turukhansk Airport	65.7972	87.9353
RU	Khanty-Mansiyskiy avtonomnyy okrug	KXD	Kondinskoye Airport	59.6551	67.43
RU	Chukotskiy avtonomnyy okrug	PWE	Pevek Airport	69.7833	170.597
RU	Sakhalinskaya oblast'	ITU	Iturup Airport	45.2564	147.955
RU	Kirovskaya oblast'	KVX	Pobedilovo Airport	58.5033	49.3483
RU	Komi, Respublika	SCW	Syktyvkar Airport	61.647	50.8451
RU	Kaliningradskaya oblast'	KGD	Khrabrovo Airport	54.89	20.5926
RU	Krasnoyarskiy kray	NSK	Alykel Airport	69.3111	87.3322
RU	Chukotskiy avtonomnyy okrug	DYR	Ugolny Airport	64.7349	177.741
RU	Saha, Respublika	SYS	Saskylakh Airport	71.9279	114.08
RU	Saratovskaya oblast'	RTW	Saratov Tsentralny Airport	51.565	46.0467
RU	Chukotskiy avtonomnyy okrug	PVS	Provideniya Bay Airport	64.3781	-173.243
RU	Krasnoyarskiy kray	TGP	Podkamennaya Tunguska Airport	61.5897	89.994
RU	Rostovskaya oblast'	TGK	Taganrog Airport	47.1983	38.8492
RU	Tomskaya oblast'	TOF	Bogashevo Airport	56.3803	85.2083
RU	Primorskiy kray	KVR	Kavalerovo Airport	44.2726	135.029
RU	Chukotskiy avtonomnyy okrug	KVM	Markovo Airport	64.667	170.417
RU	Yaroslavskaya oblast'	IAR	Tunoshna Airport	57.5607	40.1574
RU	Altayskiy kray	BAX	Barnaul Airport	53.3638	83.5385
RU	Tyumenskaya oblast'	TOX	Tobolsk Airport	58.1358	68.2319
RU	Murmanskaya oblast'	KVK	Kirovsk-Apatity Airport (Khibiny Airport)	67.4633	33.5883
RU	Khabarovskiy kray	BQG	Bogorodskoye Airport	52.38	140.448
RU	Saha, Respublika	BQJ	Batagay Airport	67.648	134.695
RU	Saha, Respublika	ONK	Olenyok Airport	68.515	112.48
RU	Amurskaya oblast'	BQS	Ignatyevo Airport	50.4254	127.412
RU	Kemerovskaya oblast'	NOZ	Spichenkovo Airport	53.8114	86.8772
RU	Khabarovskiy kray	GVN	Sovetskaya Gavan Airport	48.927	140.034
RU	Arkhangel'skaya oblast'	LDG	Leshukonskoye Airport	64.896	45.723
RU	Yamalo-Nenetskiy avtonomnyy okrug	TQL	Tarko-Sale Airport	64.9308	77.8181
RU	Samarskaya oblast'	KUF	Kurumoch International Airport	53.5049	50.1643
RU	Yamalo-Nenetskiy avtonomnyy okrug	NOJ	Noyabrsk Airport	63.1833	75.27
RU	Krasnodarskiy kray	NOI	Novorossiysk Airport	44.4016	37.7779
RU	Irkutskaya oblast'	BTK	Bratsk Airport	56.3706	101.698
RU	Ryazanskaya oblast'	RZN	Turlatovo Airport	54.5559	39.8552
RU	Irkutskaya oblast'	ODO	Bodaybo Airport	57.8661	114.243
RU	Leningradskaya oblast'	LED	Pulkovo Airport	59.8003	30.2625
RU	Nenetskiy avtonomnyy okrug	NNM	Naryan-Mar Airport	67.64	53.1219
RU	Saha, Respublika	IKS	Tiksi Airport	71.6977	128.903
RU	Orlovskaya oblast'	OEL	Oryol Yuzhny Airport	52.9347	36.0022
RU	Sverdlovskaya oblast'	SVX	Koltsovo International Airport	56.7431	60.8027
RU	Stavropol'skiy kray	MRV	Mineralnye Vody Airport	44.2251	43.0819
RU	Kemerovskaya oblast'	KEJ	Kemerovo International Airport	55.2701	86.1072
RU	Sakhalinskaya oblast'	BVV	Burevestnik Airport	44.92	147.622
RU	Khabarovskiy kray	NLI	Nikolayevsk-on-Amur Airport	53.155	140.65
RU	Mordoviya, Respublika	SKX	Saransk Airport	54.1251	45.2123
RU	Amurskaya oblast'	GDG	Magdagachi Airport	53.4733	125.795
RU	Saratovskaya oblast'	BWO	Balakovo Airport	51.8583	47.7456
RU	Saha, Respublika	SEK	Srednekolymsk Airport	67.4805	153.736
RU	Nizhegorodskaya oblast'	GOJ	Nizhny Novgorod International Airport (Strigino Airport)	56.2301	43.784
RU	Magadanskaya oblast'	GDX	Sokol Airport	59.911	150.72
RU	Saha, Respublika	DPT	Deputatsky Airport	69.3925	139.89
RU	Moskva	OSF	Ostafyevo International Airport	55.5117	37.5072
RU	Krasnodarskiy kray	GDZ	Gelendzhik Airport	44.5821	38.0125
RU	Saha, Respublika	MJZ	Mirny Airport	62.5347	114.039
RU	Tambovskaya oblast'	TBW	Tambov Donskoye Airport	52.8061	41.4828
RU	Khanty-Mansiyskiy avtonomnyy okrug	EZV	Beryozovo Airport	63.921	65.0305
RU	Dagestan, Respublika	MCX	Uytash Airport	42.8168	47.6523
RU	Yamalo-Nenetskiy avtonomnyy okrug	SBT	Sabetta International Airport	71.2192	72.0522
RU	Saratovskaya oblast'	GSV	Saratov Gagarin Airport	51.7128	46.1711
RU	Bryanskaya oblast'	BZK	Bryansk International Airport	53.2142	34.1764
RU	Saha, Respublika	SUK	Sakkyryr Airport	67.792	130.394
RU	Khanty-Mansiyskiy avtonomnyy okrug	EYK	Beloyarsk Airport	63.6869	66.6986
RU	Tul'skaya oblast'	TYA	Klokovo Airport	54.239	37.6
RU	Komi, Respublika	UTS	Ust-Tsilma Airport	65.4373	52.2003
RU	Amurskaya oblast'	TYD	Tynda Airport	55.2842	124.779
RU	Yaroslavskaya oblast'	RYB	Staroselye Airport	58.1042	38.9294
RU	Vologodskaya oblast'	CEE	Cherepovets Airport	59.2736	38.0158
RU	Krasnoyarskiy kray	KJA	Yemelyanovo International Airport	56.1729	92.4933
RU	Chelyabinskaya oblast'	CEK	Chelyabinsk Airport	55.3058	61.5033
RU	Sakhalinskaya oblast'	NGK	Nogliki Airport	51.7801	143.139
RU	Saha, Respublika	MQJ	Moma Airport	66.4509	143.262
RU	Khanty-Mansiyskiy avtonomnyy okrug	OVS	Sovetsky Airport	61.3266	63.6019
RU	Severnaya Osetiya, Respublika	OGZ	Beslan Airport	43.2051	44.6066
RU	Komi, Respublika	UCT	Ukhta Airport	63.5669	53.8047
RU	Chelyabinskaya oblast'	MQF	Magnitogorsk International Airport	53.3931	58.7557
RU	Khanty-Mansiyskiy avtonomnyy okrug	NFG	Nefteyugansk Airport	61.1083	72.65
RU	Novosibirskaya oblast'	OVB	Tolmachevo Airport	55.0126	82.6507
RU	Saha, Respublika	KDY	Teply Klyuch Airport	62.789	136.855
RU	Kalmykiya, Respublika	ESL	Elista Airport	46.3739	44.3309
RU	Saha, Respublika	NER	Chulman Neryungri Airport	56.9139	124.914
RU	Krasnoyarskiy kray	DKS	Dikson Airport	73.5178	80.3797
RU	Yamalo-Nenetskiy avtonomnyy okrug	UEN	Urengoy Airport	65.96	78.437
RU	Sakhalinskaya oblast'	OHH	Okha Airport (Novostroyka Airport)	53.52	142.89
RU	Bashkortostan, Respublika	UFA	Ufa International Airport	54.5575	55.8744
RU	Yamalo-Nenetskiy avtonomnyy okrug	YMK	Mys-Kamenny Airport	68.483	73.567
RU	Khabarovskiy kray	OHO	Okhotsk Airport	59.4101	143.057
RU	Bashkortostan, Respublika	NEF	Neftekamsk Airport	56.1069	54.3472
RU	Irkutskaya oblast'	UIK	Ust-Ilimsk Airport	58.1361	102.565
RU	Bashkortostan, Respublika	BCX	Beloretsk Airport	53.9381	58.34
RU	Chechenskaya Respublika	GRV	Grozny Airport	43.3883	45.6986
RU	Chukotskiy avtonomnyy okrug	KPW	Keperveyem Airport	67.845	166.14
RU	Rostovskaya oblast'	ROV	Platov International Airport	47.4939	39.9247
RU	Saha, Respublika	UKG	Ust-Kuyga Airport	70.011	135.645
RU	Irkutskaya oblast'	UKX	Ust-Kut Airport	56.8567	105.73
RU	Saha, Respublika	ULK	Lensk Airport	60.7206	114.826
RU	Irkutskaya oblast'	KCK	Kirensk Airport	57.773	108.064
RU	Tomskaya oblast'	SWT	Strezhevoy Airport	60.7094	77.66
RU	Ul'yanovskaya oblast'	ULV	Ulyanovsk Baratayevka Airport	54.2683	48.2267
RU	Ul'yanovskaya oblast'	ULY	Ulyanovsk Vostochny Airport	54.401	48.8027
RU	Arkhangel'skaya oblast'	KSZ	Kotlas Airport	61.2358	46.6975
RU	Saha, Respublika	CKH	Chokurdakh Airport	70.6231	147.902
RU	Irkutskaya oblast'	ERG	Erbogachen Airport	61.275	108.03
RU	Moskovskaya oblast'	CKL	Chkalovsky Airport	55.8783	38.0617
RU	Saha, Respublika	YKS	Yakutsk Airport	62.0933	129.771
RU	Saha, Respublika	UMS	Ust-Maya Airport	60.357	134.435
RU	Sakhalinskaya oblast'	DEE	Yuzhno-Kurilsk Mendeleyevo Airport	43.9584	145.683
RU	Nenetskiy avtonomnyy okrug	AMV	Amderma Airport	69.7633	61.5564
RU	Kamchatskiy kray	PKC	Petropavlovsk-Kamchatsky Airport (Yelizovo Airport)	53.1679	158.454
RU	Zabaykal'skiy kray	HTA	Chita International Airport (Kadala Airport)	52.0263	113.306
RU	Yamalo-Nenetskiy avtonomnyy okrug	BVJ	Bovanenkovo Airport	70.3153	68.3336
RU	Altay, Respublika	RGK	Gorno-Altaysk Airport	51.9667	85.8333
RU	Khanty-Mansiyskiy avtonomnyy okrug	HMA	Khanty-Mansiysk Airport	61.0285	69.0861
RU	Pskovskaya oblast'	PKV	Pskov Airport	57.7839	28.3956
RU	Tatarstan, Respublika	NBC	Begishevo Airport	55.5647	52.0925
RU	Kostromskaya oblast'	KMW	Kostroma Airport	57.7969	41.0194
RU	Murmanskaya oblast'	MMK	Murmansk Airport	68.7817	32.7508
RU	Nizhegorodskaya oblast	NVR	Novgorod Airport	58.4933	31.2417
RU	Leningradskaja oblast	RVH	Rzhevka Airport	59.98	30.5883
RU	Rostovskaya Oblast	RVI	Rostov-on-Don Airport	47.2583	39.8183
RU	Moskovskaya Oblast	BKA	Bykovo Airport	55.6226	38.0661
RU	Moskovskaya oblast	SVO	Sheremetyevo Alexander S. Pushkin International Airport	55.9728	37.4147
RW	Sud	BTQ	Butare Airport	-2.59583	29.7367
RW	Ouest	KME	Kamembe Airport	-2.46224	28.9079
RW	Ouest	GYI	Gisenyi Airport	-1.6772	29.2589
RW	Nord	RHG	Ruhengeri Airport	-1.5	29.633
RW	Ville de Kigali	KGL	Kigali International Airport (Kanombe Airport)	-1.96863	30.1395
SA	Tabuk	NUM	Neom Bay Airport	27.9276	35.2887
SA	Al Bahah	ABT	Al-Baha Domestic Airport	20.2961	41.6343
SA	Ash Sharqiyah	AQI	Al Qaisumah/Hafr Al Batin Airport	28.3352	46.1251
SA	Ash Sharqiyah	HOF	Al-Ahsa International Airport	25.2853	49.4852
SA	Al Hudud ash Shamaliyah	RAE	Arar Domestic Airport	30.9066	41.1382
SA	Al Jawf	URY	Gurayat Domestic Airport	31.4124	37.2789
SA	Al Madinah al Munawwarah	ULH	Prince Abdul Majeed bin Abdulaziz Domestic Airport	26.48	38.1289
SA	Tabuk	TUU	Tabuk Regional Airport	28.3654	36.6189
SA	Al Madinah al Munawwarah	MED	Prince Mohammad bin Abdulaziz Airport	24.5534	39.7051
SA	Ash Sharqiyah	DHA	King Abdulaziz Air Base	26.2654	50.152
SA	Najran	SHW	Sharurah Domestic Airport	17.4669	47.1214
SA	Al Hudud ash Shamaliyah	TUI	Turaif Domestic Airport	31.6922	38.7315
SA	Makkah al Mukarramah	JED	King Abdulaziz International Airport	21.6796	39.1565
SA	Asir	KMX	King Khalid Air Base	18.2973	42.8035
SA	Tabuk	EJH	Al Wajh Domestic Airport	26.1986	36.4764
SA	Al Qasim	ZUL	Zilfi Airport	26.35	44.833
SA	Ar Riyad	AKH	Prince Sultan Air Base	24.0627	47.5805
SA	Ar Riyad	SLF	Sulayel Airport	20.4647	45.6196
SA	Al Hudud ash Shamaliyah	RAH	Rafha Domestic Airport	29.6264	43.4906
SA	Ash Sharqiyah	KMC	King Khaled Military City Airport	27.9009	45.5282
SA	Al Jawf	AJF	Al-Jawf Domestic Airport	29.7851	40.1
SA	Asir	AHB	Abha Regional Airport	18.2404	42.6566
SA	Ash Sharqiyah	DMM	King Fahd International Airport	26.4712	49.7979
SA	Ha'il	HAS	Ha'il Regional Airport	27.4379	41.6863
SA	Jazan	GIZ	Jizan Regional Airport (King Abdullah bin Abdulaziz Airport)	16.9011	42.5858
SA	Najran	EAM	Najran Domestic Airport	17.6114	44.4192
SA	Ar Riyad	WAE	Wadi al-Dawasir Domestic Airport	20.5043	45.1996
SA	Makkah al Mukarramah	TIF	Ta'if Regional Airport	21.483	40.5434
SA	Al Qasim	ELQ	Prince Nayef bin Abdulaziz Regional Airport	26.3028	43.7744
SA	Ar Riyad	RUH	King Khalid International Airport	24.9576	46.6988
SA	Al Madinah al Munawwarah	YNB	Yanbu Airport (Yenbo Airport)	24.1442	38.0634
SA	Asir	BHH	Bisha Domestic Airport	19.9844	42.6209
SA	Ar Riyad	DWD	Dawadmi Domestic Airport (King Salman bin Abdul Aziz Domestic Airport)	24.4499	44.1212
SA	Riyadh	RUH	King Khalid International Airport	24.9578	46.6989
SB	Guadalcanal	NAZ	Nana Airport	-10.6758	162.205
SB	Malaita	AFT	Afutara Airport	-9.19139	160.949
SB	Central	TLG	Tulaghi Heliport	-9.108	160.149
SB	Isabel	FRE	Fera Airport (Fera/Maringe Airport)	-8.1075	159.577
SB	Malaita	ONE	Onepusu Airport	-9.16667	161.067
SB	Makira-Ulawa	NNB	Santa Ana Airport	-10.848	162.454
SB	Central	SVY	Savo Airport	-9.167	159.833
SB	Western	RRI	Barora Airport	-7.983	157.567
SB	Isabel	JJA	Jajao Airport	-11.4179	-58.7082
SB	Guadalcanal	PRS	Parasi Airport	-9.64167	161.425
SB	Isabel	VAO	Suavanao Airport	-7.58556	158.731
SB	Western	VEV	Barakoma Airport	-7.91278	156.706
SB	Western	VIU	Viru Harbour Airport	-8.5085	157.69
SB	Western	EGM	Seghe Airport	-8.57889	157.876
SB	Western	RBV	Ramata Airport	-8.16806	157.643
SB	Temotu	SCZ	Santa Cruz/Graciosa Bay/Luova Airport	-10.7203	165.795
SB	Rennell and Bellona	RNL	Rennell/Tingoa Airport	-11.5339	160.063
SB	Western	MUA	Munda Airport	-8.32797	157.263
SB	Makira-Ulawa	RNA	Ulawa Airport	-9.86054	161.98
SB	Central	XYA	Yandina Airport	-9.09282	159.218
SB	Western	MNY	Mono Airport	-7.41694	155.565
SB	Guadalcanal	MBU	Mbambanakira Airport	-9.7475	159.839
SB	Choiseul	CHY	Choiseul Bay Airport	-6.71194	156.396
SB	Western	RIN	Ringgi Cove Airport	-8.12639	157.143
SB	Western	BPF	Batuna Airport	-8.56203	158.119
SB	Rennell and Bellona	BNY	Bellona/Anua Airport	-11.3022	159.798
SB	Choiseul	KGE	Kaghau Airport	-7.3305	157.585
SB	Malaita	TAA	Tarapaina Airport	-9.414	161.358
SB	Guadalcanal	AVU	Avu Avu Airport	-9.86833	160.411
SB	Malaita	ATD	Uru Harbour Airport	-8.87333	161.011
SB	Makira-Ulawa	IRA	Kirakira Airport (Ngorangora Airstrip)	-10.4497	161.898
SB	Guadalcanal	HIR	Honiara International Airport	-9.428	160.055
SB	Western	GTA	Gatokae Aerodrome	-8.73917	158.203
SB	Malaita	OTV	Ontong Java Airport	-5.515	159.528
SB	Western	GEF	Geva Airport	-7.57583	156.597
SB	Malaita	AKS	Auki Gwaunaru'u Airport	-8.70257	160.682
SB	Western	KUE	Kukundu Airport	-8.0262	156.948
SB	Western	BAS	Balalae Airport	-6.99075	155.887
SB	Malaita	KWR	Kwai Harbour Airport	-8.86981	161.004
SB	Rennell and Bellona	RUS	Marau Airport	-9.86167	160.825
SB	Guadalcanal	KWS	Kwailabesi Airport	-8.36051	160.775
SB	Western	GZO	Nusatupe Airport	-8.09778	156.864
SC	English River	FRK	Fregate Island Airport	-4.583	55.95
SC	English River	SEZ	Seychelles International Airport	-4.67434	55.5218
SC	English River	DEI	Denis Island Airport	-3.80222	55.6669
SC	English River	BDI	Bird Island Airport	-3.72472	55.2053
SC	English River	PRI	Praslin Island Airport	-4.31929	55.6914
SC	English River	DES	Desroches Airport	-5.6967	53.6558
SD	South Kordofan	BJE	Baleela Airport	11.1994	28.5231
SD	Kassala	NHF	New Halfa Airport	15.3556	35.7278
SD	Northern	DOG	Dongola Airport	19.1539	30.4301
SD	North Darfur	ELF	El Fasher Airport	13.6149	25.3246
SD	East Darfur	ADV	Ed Daein Airport	11.4023	26.1186
SD	Blue Nile	RSS	Damazin Airport	11.7859	34.3367
SD	Northern	MWE	Merowe Airport	18.4433	31.8433
SD	South Darfur	UYL	Nyala Airport	12.0535	24.9562
SD	South Kordofan	NUD	En Nahud Airport	12.667	28.333
SD	Khartoum	KRT	Khartoum International Airport	15.5895	32.5532
SD	West Darfur	EGN	Geneina Airport	13.4817	22.4672
SD	Kassala	GSU	Azaza Airport	14.133	35.317
SD	Kassala	GBU	Khashm el Girba Airport	14.925	35.878
SD	White Nile	KST	Rabak Airport	13.183	32.733
SD	River Nile	ATB	Atbara Airport	17.7103	34.057
SD	South Kordofan	EBD	El Obeid Airport	13.1532	30.2327
SD	Northern	EDB	El Debba Airport	18.0146	30.9595
SD	Kassala	KSL	Kassala Airport	15.3875	36.3288
SD	Sennar	DNX	Galegu Airport	12.533	35.067
SD	South Kordofan	KDX	Kadugli Airport	11.138	29.7011
SD	Red Sea	PZU	Port Sudan New International Airport	19.4336	37.2341
SD	West Darfur	ZLX	Zalingei Airport	12.9437	23.5631
SD	Gezira	DNI	Wad Medani Airport	14.3836	33.5264
SD	Northern	WHF	Wadi Halfa Airport	21.8027	31.5216
SD	Blue Nile	HGI	Paloich Airport	10.5292	32.5006
SE	Varmlands lan	SCR	Scandinavian Mountains Airport	61.1591	12.8407
SE	Orebro lan	ORB	Orebro Airport	59.2237	15.038
SE	Vastra Gotalands lan	GSE	Goteborg City Airport	57.7747	11.8704
SE	Gavleborgs lan	SOO	Soderhamn Airport (Helsinge Airport)	61.2615	17.0991
SE	Kalmar lan	HLF	Hultsfred-Vimmerby Airport	57.5258	15.8233
SE	Stockholms lan	ARN	Stockholm Arlanda Airport	59.6519	17.9186
SE	Skane lan	AGH	Angelholm-Helsingborg Airport	56.2961	12.8471
SE	Varmlands lan	HFS	Hagfors Airport	60.0201	13.5789
SE	Vasterbottens lan	SQO	Storuman Airport	64.9609	17.6966
SE	Vastra Gotalands lan	THN	Trollhattan-Vanersborg Airport	58.3181	12.345
SE	Ostergotlands lan	NRK	Norrkoping Airport	58.5863	16.2506
SE	Gavleborgs lan	GVX	Gavle-Sandviken Airport	60.5933	16.9514
SE	Blekinge lan	RNB	Ronneby Airport	56.2667	15.265
SE	Kalmar lan	OSK	Oskarshamn Airport	57.3505	16.498
SE	Ostergotlands lan	LPI	Linkoping City Airport	58.4062	15.6805
SE	Orebro lan	KSK	Karlskoga Airport	59.3459	14.4959
SE	Vastra Gotalands lan	KVB	Skovde Airport	58.4564	13.9727
SE	Vasterbottens lan	SFT	Skelleftea Airport	64.6248	21.0769
SE	Vasternorrlands lan	KRF	Hoga Kusten Airport (Kramfors-Solleftea Airport)	63.0486	17.7689
SE	Vastra Gotalands lan	LDK	Lidkoping-Hovby Airport	58.4655	13.1744
SE	Skane lan	KID	Kristianstad Airport	55.9217	14.0855
SE	Vasterbottens lan	HMV	Hemavan Tarnaby Airport	65.8061	15.0828
SE	Dalarnas lan	MXX	Mora-Siljan Airport	60.9579	14.5114
SE	Dalarnas lan	IDB	Idre Airport	61.8697	12.6894
SE	Norrbottens lan	PJA	Pajala Airport	67.2456	23.0689
SE	Norrbottens lan	AJR	Arvidsjaur Airport	65.5903	19.2819
SE	Vasterbottens lan	LYC	Lycksele Airport	64.5483	18.7162
SE	Norrbottens lan	GEV	Gallivare Airport	67.1324	20.8146
SE	Sodermanlands lan	EKT	Eskilstuna Airport	59.3511	16.7084
SE	Jonkopings lan	JKG	Jonkoping Airport	57.7576	14.0687
SE	Gotlands lan	VBY	Visby Airport	57.6628	18.3462
SE	Varmlands lan	TYF	Torsby Airport	60.1576	12.9913
SE	Vasternorrlands lan	OER	Ornskoldsvik Airport	63.4083	18.99
SE	Jamtlands lan	EVG	Sveg Airport	62.0478	14.4229
SE	Kalmar lan	KLR	Kalmar Airport	56.6855	16.2876
SE	Varmlands lan	KSD	Karlstad Airport	59.4447	13.3374
SE	Vastra Gotalands lan	GOT	Goteborg Landvetter Airport	57.6628	12.2798
SE	Kronobergs lan	VXO	Vaxjo Smaland Airport	56.9291	14.728
SE	Hallands lan	HAD	Halmstad Airport (Halmstad City Airport)	56.6911	12.8202
SE	Norrbottens lan	LLA	Lulea Airport (Kallax Airport)	65.5438	22.122
SE	Vasterbottens lan	VHM	Vilhelmina Airport	64.5791	16.8336
SE	Vasterbottens lan	UME	Umea Airport	63.7918	20.2828
SE	Kalmar lan	VVK	Vastervik Airport	57.78	16.5236
SE	Jamtlands lan	OSD	Are Ostersund Airport	63.1944	14.5003
SE	Dalarnas lan	BLE	Dala Airport (Borlange Airport)	60.422	15.5152
SE	Norrbottens lan	KRN	Kiruna Airport	67.822	20.3368
SE	Gavleborgs lan	HUV	Hudiksvall Airport	61.7681	17.0807
SE	Vasternorrlands lan	SDL	Sundsvall-Timra Airport (Midlanda Airport)	62.5281	17.4439
SG	Singapore	TGA	Tengah Air Base	1.38726	103.709
SG	Singapore	SIN	Singapore Changi Airport	1.35019	103.994
SG	Singapore	QPG	Paya Lebar Air Base	1.36042	103.91
SG	Singapore	XSP	Seletar Airport	1.41695	103.868
SH	Ascension	ASI	RAF Ascension Island (Wideawake Field)	-7.9696	-14.3937
SH	Saint Helena	HLE	Saint Helena Airport	-15.9577	-5.64594
SJ	Svalbard and Jan Mayen	LYR	Svalbard Airport	78.2461	15.4656
SK	Trenciansky kraj	LJU	Ljubljana Joze Pucnik Airport (Brnik Airport)	46.2237	14.4576
SK	Presovsky kraj	POV	Presov Air Base	49.0297	21.3156
SK	Bratislavsky kraj	BTS	M. R. Stefanik Airport	48.1702	17.2127
SK	Zilinsky kraj	ILZ	Zilina Airport	49.2315	18.6135
SK	Bratislavsky kraj	POW	Portoroz Airport	45.4734	13.615
SK	Trnavsky kraj	PZY	Piestany Airport	48.6252	17.8284
SK	Banskobystricky kraj	LUE	Bolkovce Airport	48.3394	19.7358
SK	Presovsky kraj	TAT	Poprad-Tatry Airport	49.0736	20.2411
SK	Banskobystricky kraj	SLD	Sliac Airport	48.6378	19.1341
SK	Kosicky kraj	KSC	Kosice International Airport	48.6631	21.2411
SK	Presovsky kraj	MBX	Maribor Edvard Rusjan Airport	46.4799	15.6861
SL	Southern	KBS	Bo Airport	7.9444	-11.761
SL	Western Area	HGS	Hastings Airport	8.39713	-13.1291
SL	Southern	BTE	Sherbro International Airport	7.53242	-12.5189
SL	Eastern	KEN	Kenema Airport	7.89129	-11.1766
SL	Southern	GBK	Gbangbatok Airport	7.767	-12.383
SL	Eastern	WYE	Yengema Airport	8.61047	-11.0454
SL	Western Area	FNA	Lungi International Airport	8.61644	-13.1955
SL	Northern	KBA	Kabala Airport	9.63832	-11.5156
SN	Tambacounda	SMY	Simenti Airport	13.0468	-13.2954
SN	Thies	DSS	Blaise Diagne International Airport	14.67	-17.0733
SN	Tambacounda	TUD	Tambacounda Airport	13.7368	-13.6531
SN	Dakar	DKR	Leopold Sedar Senghor International Airport	14.7397	-17.4902
SN	Tambacounda	NIK	Niokolo-Koba Airport	13.052	-12.7272
SN	Kolda	KDA	Kolda North Airport	12.8985	-14.9681
SN	Ziguinchor	CSK	Cap Skirring Airport	12.3953	-16.748
SN	Matam	MAX	Ouro Sogui Airport	15.5936	-13.3228
SN	Kaolack	KLC	Kaolack Airport	14.1469	-16.0513
SN	Saint-Louis	RDT	Richard Toll Airport	16.433	-15.65
SN	Tambacounda	BXE	Bakel Airport	14.8473	-12.4683
SN	Saint-Louis	POD	Podor Airport	16.683	-14.967
SN	Saint-Louis	XLS	Saint-Louis Airport	16.0508	-16.4632
SN	Kedougou	KGG	Kedougou Airport	12.5723	-12.2203
SN	Ziguinchor	ZIG	Ziguinchor Airport	12.5556	-16.2818
SO	Nugaal	HCM	Eyl Airport	8.104	49.82
SO	Mudug	GLK	Abdullahi Yusuf International Airport	6.78083	47.4547
SO	Bari	CMS	Iskushuban Airport	10.3	50.233
SO	Galguduud	AAD	Adado Airport	6.0958	46.6375
SO	Gedo	LGX	Lugh Ganane Airport	3.8124	42.5459
SO	Mudug	CMO	Obbia Airport	5.36667	48.5167
SO	Sanaag	ERA	Erigavo Airport	10.6421	47.388
SO	Nugaal	GGR	Garowe International Airport	8.45794	48.5674
SO	Woqooyi Galbeed	BBO	Berbera Airport	10.3892	44.9411
SO	Awdal	BXX	Borama Airport	9.9463	43.1495
SO	Bari	BSA	Bender Qassim International Airport	11.2753	49.1494
SO	Banaadir	MGQ	Aden Adde International Airport	2.01444	45.3047
SO	Woqooyi Galbeed	HGA	Hargeisa International Airport (Egal Int'l)	9.51321	44.0824
SO	Sanaag	LKR	Las Khorey Airport	36.084	-115.154
SO	Bari	CXN	Candala Airport	11.494	49.9085
SO	Bari	ALU	Alula Airport	11.9582	50.748
SO	Togdheer	BUO	Burao Airport	9.5275	45.5549
SO	Bay	BIB	Baidoa Airport	3.10222	43.6286
SO	Gedo	GBM	Garbaharey Airport	3.32294	42.2131
SO	Jubbada Hoose	KMU	Kismayo Airport (Kisimayu Airport)	-0.377353	42.4592
SO	Bari	GSR	Qardho Airport	9.517	49.083
SO	Gedo	BSY	Bardera Airport	2.33611	42.3078
SR	Sipaliwini	OEM	Vincent Fayks Airport	3.34528	-55.4425
SR	Sipaliwini	DRJ	Drietabbetje Airstrip	4.11136	-54.6728
SR	Para	PBM	Johan Adolf Pengel International Airport	5.45283	-55.1878
SR	Marowijne	MOJ	Moengo Airstrip	5.6076	-54.4003
SR	Sipaliwini	LDO	Laduani Airstrip	4.37611	-55.4071
SR	Nickerie	ICK	Majoor Henry Fernandes Airport (Nieuw Nickerie Airport)	5.95556	-57.0394
SR	Sipaliwini	KCB	Tepoe Airstrip	3.15	-55.717
SR	Paramaribo	ORG	Zorg en Hoop Airport	5.81108	-55.1907
SR	Sipaliwini	AAJ	Cayana Airstrip	3.89868	-55.5779
SR	Sipaliwini	SMZ	Stoelmans Eiland Airstrip	4.35	-54.4167
SR	Coronie	TOT	Totness Airstrip	5.86583	-56.3275
SR	Marowijne	ABN	Albina Airstrip	5.51272	-54.0501
SR	Sipaliwini	WSO	Washabo Airport	5.21528	-57.1853
SR	Sipaliwini	DOE	Djoemoe Airstrip	4.00571	-55.4816
SR	Nickerie	AGI	Wageningen Airstrip	5.84113	-56.6733
SR	Sipaliwini	BTO	Botopasi Airstrip	4.21751	-55.4471
SS	Lakes	RBX	Rumbek Airport	6.825	29.669
SS	Upper Nile	MAK	Malakal Airport	9.55897	31.6522
SS	Western Bahr el Ghazal	WUU	Wau Airport	7.72583	27.975
SS	Upper Nile	AEE	Adareil Airport	10.0536	32.9594
SS	Central Equatoria	JUB	Juba International Airport	4.87201	31.6011
ST	Sao Tome	TMS	Sao Tome International Airport	0.378175	6.71215
ST	Principe	PCP	Principe Airport	1.66294	7.41174
SV	San Salvador	SAL	Monsenor Oscar Arnulfo Romero International Airport	13.4409	-89.0557
SV	La Paz	ILS	Ilopango International Airport	13.6959	-89.1151
SV	San Salvador	SAL	El Salvador International Airport Saint Ãƒâ€œscar Arnulfo Romero y GaldÃƒÂ¡mez	13.4408	-89.0556
SX	Sint Maarten (Dutch Part)	SXM	Princess Juliana International Airport	18.041	-63.1089
SY	Al Hasakah	KAC	Kamishly Airport	37.0206	41.1914
SY	Halab	ALP	Aleppo International Airport	36.1807	37.2244
SY	Al Ladhiqiyah	LTK	Bassel Al-Assad International Airport	35.4011	35.9487
SY	Dimashq	DAM	Damascus International Airport	33.4115	36.5156
SY	Hims	PMS	Palmyra Airport	34.5574	38.3169
SY	Dayr az Zawr	DEZ	Deir ez-Zor Airport	35.2854	40.176
SZ	Manzini	SHO	King Mswati III International Airport (Sikhuphe Int'l)	38.1421	128.598
SZ	Manzini	MTS	Matsapha Airport	-26.529	31.3075
TC	Turks and Caicos Islands	PIC	Pine Cay Airport	21.8749	-72.0923
TC	Turks and Caicos Islands	MDS	Middle Caicos Airport	21.826	-71.8025
TC	Turks and Caicos Islands	GDT	JAGS McCartney International Airport (Grand Turk Int'l)	21.4445	-71.1423
TC	Turks and Caicos Islands	NCA	North Caicos Airport	21.9175	-71.9396
TC	Turks and Caicos Islands	PLS	Providenciales International Airport	21.7736	-72.2659
TC	Turks and Caicos Islands	XSC	South Caicos Airport	21.5157	-71.5285
TC	Turks and Caicos Islands	SLX	Salt Cay Airport	21.333	-71.2
TD	Hadjer Lamis	NDJ	N'Djamena International Airport	12.1337	15.034
TD	Tandjile	LTC	Lai Airport	9.3979	16.3125
TD	Batha	ATV	Ati Airport	13.2389	18.3133
TD	Kanem	AMO	Mao Airport	14.1456	15.3144
TD	Salamat	AOD	Abou-Deia Airport	11.4773	19.2874
TD	Moyen-Chari	SRH	Sarh Airport	9.14444	18.3744
TD	Batha	OUM	Oum Hadjer Airport	13.2782	19.7103
TD	Guera	MEF	Melfi Airport	11.0602	17.9445
TD	Lac	OTC	Bol-Berim Airport	13.4433	14.7394
TD	Logone-Occidental	PLF	Pala Airport	9.37806	14.925
TD	Salamat	AKM	Zakouma Airport	10.8903	19.8172
TD	Borkou	FYT	Faya-Largeau Airport	17.9171	19.1111
TD	Chari-Baguirmi	OUT	Bousso Airport	10.483	16.717
TD	Hadjer Lamis	BKR	Bokoro Airport	12.383	17.067
TD	Guera	MVO	Mongo Airport	12.167	18.675
TD	Ouaddai	AEH	Abeche Airport	13.847	20.8443
TD	Logone-Occidental	MQQ	Moundou Airport	8.62441	16.0714
TD	Salamat	AMC	Am Timan Airport	11.034	20.274
TD	Mayo-Kebbi-Est	OGR	Bongor Airport	10.2881	15.3811
TG	Maritime	LFW	Lome-Tokoin Airport (Gnassingbe Eyadema Int'l)	6.16561	1.25451
TG	Kara	LRL	Niamtougou International Airport	9.76733	1.09125
TH	Ubon Ratchathani	UBP	Ubon Ratchathani Airport	15.2513	104.87
TH	Loei	LOE	Loei Airport	17.4391	101.722
TH	Phitsanulok	PHS	Phitsanulok Airport	16.7829	100.279
TH	Chachoengsao	PMM	Phanom Sarakham Airport	13.7553	101.395
TH	Nan	NNT	Nan Nakhon Airport	18.8079	100.783
TH	Krabi	KBV	Krabi Airport	8.09912	98.9862
TH	Udon Thani	UTH	Udon Thani International Airport	17.3864	102.788
TH	Trat	TDX	Trat Airport	12.2746	102.319
TH	Trang	TST	Trang Airport	7.50874	99.6166
TH	Nakhon Pathom	KOP	Nakhon Phanom Airport	17.3838	104.643
TH	Surat Thani	USM	Samui Airport	9.54779	100.062
TH	Surat Thani	URT	Surat Thani Airport	9.1326	99.1356
TH	Phuket	HKT	Phuket International Airport	8.1132	98.3169
TH	Narathiwat	NAW	Narathiwat Airport	6.51992	101.743
TH	Chiang Mai	CNX	Chiang Mai International Airport	18.7668	98.9626
TH	Tak	MAQ	Mae Sot Airport	16.6999	98.5451
TH	Krung Thep Maha Nakhon	BKK	Suvarnabhumi Airport	13.6811	100.747
TH	Ranong	UNN	Ranong Airport	9.77762	98.5855
TH	Rayong	UTP	U-Tapao International Airport	12.6799	101.005
TH	Mae Hong Son	PYY	Pai Airport	19.372	98.437
TH	Songkhla	SGZ	Songkhla Airport	7.18656	100.608
TH	Sukhothai	THS	Sukhothai Airport	17.238	99.8182
TH	Chon Buri	PYX	Pattaya Airpark	12.8325	100.949
TH	Nakhon Pathom	KDT	Kamphaeng Saen Airport	14.102	99.9172
TH	Nakhon Ratchasima	NAK	Nakhon Ratchasima Airport	14.9495	102.313
TH	Lampang	LPT	Lampang Airport	18.2709	99.5042
TH	Chumphon	CJM	Chumphon Airport	10.7112	99.3617
TH	Sakon Nakhon	SNO	Sakon Nakhon Airport	17.1951	104.119
TH	Khon Kaen	KKC	Khon Kaen Airport	16.4666	102.784
TH	Krung Thep Maha Nakhon	DMK	Don Mueang International Airport	13.9126	100.607
TH	Pattani	PAN	Pattani Airport	6.78546	101.154
TH	Songkhla	HDY	Hat Yai International Airport	6.93321	100.393
TH	Lop Buri	KKM	Khok Kathiam Air Force Base	14.9494	100.643
TH	Prachuap Khiri Khan	HHQ	Hua Hin Airport	12.6362	99.9515
TH	Buri Ram	BFV	Buriram Airport	15.2295	103.253
TH	Mae Hong Son	HGN	Mae Hong Son Airport	19.3013	97.9758
TH	Nakhon Sawan	TKH	Takhli Royal Thai Air Force Base	15.2773	100.296
TH	Chiang Rai	CEI	Chiang Rai International Airport (Mae Fah Luang Int'l)	19.9523	99.8829
TH	Uttaradit	UTR	Uttaradit Airport	17.617	100.1
TH	Phetchabun	PHY	Phetchabun Airport	16.676	101.195
TH	Tak	TKT	Tak Airport	16.896	99.2533
TH	Roi Et	ROI	Roi Et Airport	16.1168	103.774
TH	Phrae	PRH	Phrae Airport	18.1322	100.165
TH	Surin	PXR	Surin Airport	14.8683	103.498
TH	Nakhon Si Thammarat	NST	Nakhon Si Thammarat Airport	8.53962	99.9447
TJ	Dushanbe	DYU	Dushanbe International Airport	38.5433	68.825
TJ	Sughd	LBD	Khujand Airport	40.2154	69.6947
TJ	Khatlon	TJU	Kulob Airport	37.9881	69.805
TJ	Khatlon	KQT	Bokhtar International Airport	37.8664	68.8647
TL	Dili	VIQ	Viqueque Airport	-8.8838	126.373
TL	Dili	DIL	Presidente Nicolau Lobato International Airport	-8.5464	125.526
TL	Dili	AUT	Atauro Airport	-8.24313	125.606
TL	Dili	KCI	Kon Airport	-8.34919	127.051
TL	Dili	UAI	Suai Airport	-9.30331	125.287
TL	Dili	OEC	Oecusse Airport	-9.19806	124.343
TL	Dili	BCH	Baucau Airport	-8.48903	126.401
TL	Dili	MPT	Maliana Airport	-8.97224	125.215
TM	Lebap	CRZ	Turkmenabat Airport	39.0833	63.6133
TM	Mary	MYP	Mary International Airport	37.6194	61.8967
TM	Balkan	BKN	Balkanabat Airport	39.4806	54.366
TM	Dasoguz	ASB	Ashgabat International Airport	37.9868	58.361
TM	Balkan	KRW	Turkmenbashi International Airport	40.0633	53.0072
TM	Dasoguz	TAZ	Dasoguz Airport	41.7611	59.8267
TN	Gafsa	GAF	Gafsa - Ksar International Airport	34.422	8.8225
TN	Gabes	GAE	Gabes - Matmata International Airport	33.8769	10.1033
TN	Tunis	TUN	Tunis-Carthage International Airport	36.851	10.2272
TN	Tataouine	EBM	El Borma Airport	31.7043	9.25462
TN	Tozeur	TOE	Tozeur-Nefta International Airport	33.9397	8.11056
TN	Sfax	SFA	Sfax-Thyna International Airport	34.718	10.691
TN	Jendouba	TBJ	Tabarka-Ain Draham Internation	36.98	8.87694
TN	Medenine	DJE	Djerba-Zarzis International Airport	33.875	10.7755
TN	Sousse	NBE	Enfidha-Hammamet International Airport	36.0758	10.4386
TN	Monastir	MIR	Monastir Habib Bourguiba International Airport	35.7581	10.7547
TN	Tunis	TUN	TunisÃ¢â‚¬â€œCarthage International Airport	36.8511	10.2272
TO	Tongatapu	EUA	Eua Airport (Kaufana Airport)	-21.3783	-174.958
TO	Tongatapu	TBU	Fua'amotu International Airport	-21.2412	-175.15
TO	Ha'apai	HPA	Lifuka Island Airport (Salote Pilolevu Airport)	-19.777	-174.341
TO	Niuas	NTT	Niuatoputapu Airport	-15.9773	-173.791
TO	Vava'u	VAV	Vava'u International Airport	-18.5853	-173.962
TO	Niuas	NFO	Niuafo'ou Airport	-15.5708	-175.633
TR	Ordu	OGU	Ordu-Giresun Airport	40.966	38.081
TR	Adana	UAB	Incirlik Air Base	37.0021	35.4259
TR	Trabzon	TZX	Trabzon Airport	40.9951	39.7897
TR	Amasya	MZH	Amasya Merzifon Airport	40.8294	35.522
TR	Bursa	YEI	Yenisehir Airport	40.2552	29.5626
TR	Sanliurfa	GNY	Sanliurfa GAP Airport	37.4457	38.8956
TR	Elazig	EZS	Elazig Airport	38.6069	39.2914
TR	Isparta	ISE	Isparta Suleyman Demirel Airport	37.8554	30.3684
TR	Sirnak	NKT	Sirnak Airport	37.3647	42.0582
TR	Hatay	HTY	Hatay Airport	36.3628	36.2822
TR	Istanbul	ISL	Istanbul Ataturk Airport	40.9769	28.8146
TR	Agri	AJI	Agri Airport	39.6545	43.026
TR	Tekirdag	TEQ	Tekirdag Corlu Airport	41.1382	27.9191
TR	Sinop	NOP	Sinop Airport	42.0158	35.0664
TR	Bingol	BGG	Bingol Airport	38.8593	40.596
TR	Kayseri	ASR	Erkilet International Airport	38.7704	35.4954
TR	Istanbul	IST	Istanbul Ataturk Airport	41.2753	28.7519
TR	Balikesir	EDO	Balikesir Koca Seyit Airport	39.5546	27.0138
TR	Kocaeli	KCO	Cengiz Topel Naval Air Station	40.735	30.0833
TR	Batman	BAL	Batman Airport	37.929	41.1166
TR	Kahramanmaras	KCM	Kahramanmaras Airport	37.5388	36.9535
TR	Canakkale	CKZ	Canakkale Airport	40.1377	26.4268
TR	Hakkari	YKO	Hakkari Yuksekova Airport	37.5497	44.2381
TR	Gaziantep	GZT	Gaziantep Oguzeli International Airport	36.9472	37.4787
TR	Antalya	GZP	Gazipasa-Alanya Airport	36.2992	32.3006
TR	Malatya	MLX	Malatya Erhac Airport	38.4353	38.091
TR	Aydin	CII	Aydin Airport (Cildir Airport)	37.815	27.8953
TR	Diyarbakir	DIY	Diyarbakir Airport	37.8939	40.201
TR	Mugla	DLM	Dalaman Airport	36.7131	28.7925
TR	Mardin	MQM	Mardin Airport	37.2233	40.6317
TR	Denizli	DNZ	Denizli Cardak Airport	37.7856	29.7013
TR	Balikesir	BZI	Balikesir Airport (Merkez Airport)	39.6193	27.926
TR	Samsun	SZF	Samsun-Carsamba Airport	41.2545	36.5671
TR	Canakkale	GKD	Gokceada Airport	40.2045	25.8833
TR	Konya	KYA	Konya Airport	37.979	32.5619
TR	Mugla	BXN	Bodrum-Imsik Airport	37.1401	27.6697
TR	Mus	MSR	Mus Airport	38.7478	41.6612
TR	Kutahya	KZR	Zafer Airport	39.1131	30.1281
TR	Istanbul	SAW	Sabiha Gokcen International Airport	40.8986	29.3092
TR	Igdir	IGD	Igdir Airport	39.9766	43.8766
TR	Kastamonu	KFS	Kastamonu Airport	41.3142	33.7958
TR	Mugla	BJV	Milas-Bodrum Airport	37.2506	27.6643
TR	Siirt	SXZ	Siirt Airport	37.9789	41.8404
TR	Afyonkarahisar	AFY	Afyon Airport	38.7264	30.6011
TR	Tokat	TJK	Tokat Airport	40.3074	36.3674
TR	Usak	USQ	Usak Airport	38.6815	29.4717
TR	Nevsehir	NAV	Nevsehir Kapadokya Air	38.7719	34.5345
TR	Sanliurfa	SFQ	Sanliurfa Airport	37.0943	38.8471
TR	Ankara	ANK	Etimesgut Air Base	39.9498	32.6886
TR	Erzincan	ERC	Erzincan Airport	39.7102	39.527
TR	Antalya	AYT	Antalya Airport	36.8987	30.8005
TR	Van	VAN	Van Ferit Melen Airport	38.4682	43.3323
TR	Adiyaman	ADF	Adiyaman Airport	37.7314	38.4689
TR	Adana	ADA	Adana Sakirpasa Airport	36.9822	35.2804
TR	Kars	KSY	Kars Harakani Airport	40.5622	43.115
TR	Sivas	VAS	Sivas Airport	39.8138	36.9035
TR	Balikesir	BDM	Bandirma Airport	40.318	27.9777
TR	Eskisehir	AOE	Anadolu Airport	39.8099	30.5194
TR	Zonguldak	ONQ	Zonguldak Airport	41.5064	32.0886
TR	Erzincan	ERZ	Erzurum Airport	39.9565	41.1702
TR	Ankara	ESB	Esenboga International Airport	40.1281	32.9951
TR	Eskisehir	ESK	Eskisehir Airport	39.7841	30.5821
TR	Rize	RZV	Rize Artvin Airport	41.1692	40.8289
TR	Bursa	BTZ	Bursa Airport	40.2333	29.0092
TR	Ankara	ESB	Ankara EsenboÃ„Å¸a Airport	40.1281	32.995
TT	Tobago	TAB	Arthur Napoleon Raymond Robinson International Airport	11.1497	-60.8322
TT	Port of Spain	POS	Piarco International Airport	10.5954	-61.3372
TV	Funafuti	FUN	Funafuti International Airport	-8.525	179.196
TW	Taipei	TSA	Taipei Songshan Airport	25.0694	121.552
TW	Penghu	WOT	Wang-an Airport	23.3674	119.503
TW	Kaohsiung	KHH	Kaohsiung International Airport	22.5771	120.35
TW	Pingtung	HCN	Hengchun Airport	22.0411	120.73
TW	Taitung	TTT	Taitung Airport (Taitung Fongnian Airport)	22.755	121.102
TW	Hualien	HUN	Hualien Airport	24.0231	121.618
TW	Chiayi	CYI	Chiayi Airport	23.4618	120.393
TW	Taitung	KYD	Lanyu Airport	22.027	121.535
TW	Lienchiang	MFK	Matsu Beigan Airport	26.2242	120.003
TW	Taoyuan	TPE	Taiwan Taoyuan International Airport	25.0777	121.233
TW	Penghu	MZG	Magong Airport	23.5687	119.628
TW	Tainan	TNN	Tainan Airport	22.9504	120.206
TW	Pingtung	PIF	Pingtung South Airport	22.7002	120.482
TW	Kaohsiung	DSX	Dongsha Island Airport	20.7066	116.721
TW	Hsinchu	HSZ	Hsinchu Air Base	24.818	120.939
TW	Penghu	CMJ	Qimei Airport	23.2131	119.418
TW	Taichung	RMQ	Taichung Airport (Taichung Ching Chuan Kang Airport)	24.2647	120.621
TW	Taitung	GNI	Lyudao Airport (Green Island Airport)	22.6739	121.466
TW	Lienchiang	LZN	Matsu Nangan Airport	26.1598	119.958
TW	Kinmen	KNH	Kinmen Airport (Shang Yi Airport)	24.4279	118.359
TZ	Simiyu	SEU	Seronera Airstrip	-2.45806	34.8225
TZ	Mwanza	MWZ	Mwanza Airport	-2.44449	32.9327
TZ	Kilimanjaro	JRO	Kilimanjaro International Airport	-3.42941	37.0745
TZ	Tanga	TGT	Tanga Airport	-5.09236	39.0712
TZ	Arusha	LKY	Lake Manyara Airport	-3.37631	35.8183
TZ	Tabora	TBO	Tabora Airport	-5.07639	32.8333
TZ	Lindi	NCH	Nachingwea Airport	-10.3575	38.7792
TZ	Shinyanga	SHY	Shinyanga Airport	-3.6093	33.5035
TZ	Dar es Salaam	DAR	Julius Nyerere International Airport	-6.87811	39.2026
TZ	Mara	GTZ	Kirawira B Airstrip	-2.16083	34.2256
TZ	Mjini Magharibi	ZNZ	Abeid Amani Karume International Airport	-6.22202	39.2249
TZ	Shinyanga	MWN	Mwadui Airport	-3.52133	33.6155
TZ	Njombe	JOM	Njombe Airport	-9.35	34.8
TZ	Dodoma	DOD	Dodoma Airport	-6.17044	35.7526
TZ	Kagera	BKZ	Bukoba Airport	-1.332	31.8212
TZ	Kusini Pemba	PMA	Pemba Airport	-5.25726	39.8114
TZ	Mtwara	MYW	Mtwara Airport	-10.3391	40.1818
TZ	Ruvuma	SGX	Songea Airport	-10.683	35.583
TZ	Mtwara	XMI	Masasi Airport	-10.733	38.767
TZ	Mbeya	MBI	Mbeya Airport	-8.91994	33.274
TZ	Lindi	LDI	Lindi Airport (Kikwetu Airport)	-9.85111	39.7578
TZ	Mara	MUZ	Musoma Airport	-1.503	33.8021
TZ	Lindi	KIY	Kilwa Masoko Airport	-8.91123	39.5086
TZ	Rukwa	SUT	Sumbawanga Airport	-7.94889	31.6103
TZ	Arusha	ARK	Arusha Airport	-3.36779	36.6333
TZ	Geita	GIT	Geita Airport	-2.81367	32.1725
TZ	Pwani	MFA	Mafia Airport	-7.91748	39.6685
TZ	Kigoma	TKQ	Kigoma Airport	-4.8862	29.6709
TZ	Iringa	IRI	Iringa Airport (Nduli Airport)	-7.66863	35.7521
UA	Chernihivska oblast	CWC	Chernivtsi International Airport	48.2593	25.9808
UA	Khersonska oblast	KHE	Kherson International Airport	46.6758	32.5064
UA	Lvivska oblast	LWO	Lviv Danylo Halytskyi International Airport	49.8125	23.9561
UA	Sumska oblast	UMY	Sumy Airport	50.8583	34.7625
UA	Odeska oblast	ODS	Odessa International Airport	46.4268	30.6765
UA	Luhanska oblast	VSG	Luhansk International Airport	48.4174	39.3741
UA	Ivano-Frankivska oblast	IFO	Ivano-Frankivsk International Airport	48.8842	24.6861
UA	Donetska oblast	DOK	Donetsk International Airport	48.0736	37.7397
UA	Kyiv	IEV	Kyiv International Airport (Zhuliany)	50.4019	30.4519
UA	Dnipropetrovska oblast	KWG	Kryvyi Rih International Airport	48.0433	33.21
UA	Poltavska oblast	MXR	Myrhorod Air Base	13.6457	16.5014
UA	Dnipropetrovska oblast	DNK	Dnipropetrovsk International Airport	48.3572	35.1006
UA	Donetska oblast	MPW	Mariupol International Airport	47.0761	37.4496
UA	Poltavska oblast	PLV	Poltava Airport	49.5686	34.3972
UA	Zhytomyrska oblast	ZTR	Zhytomyr Airport	50.2706	28.7386
UA	Poltavska oblast	KHU	Kremenchuk Airport	49.1342	33.4766
UA	Rivnenska oblast	RWN	Rivne International Airport	50.6071	26.1416
UA	Luhanska oblast	SEV	Severodonetsk Airport	48.9003	38.5417
UA	Cherkaska oblast	CKC	Cherkasy International Airport	49.4156	31.9953
UA	Kharkivska oblast	HRK	Kharkiv International Airport (Osnova Airport)	49.9248	36.29
UA	Sevastopol	UKS	Sevastopol International Airport	44.689	33.571
UA	Zakarpatska oblast	UDJ	Uzhhorod International Airport	48.6343	22.2634
UA	Donetska oblast	KRQ	Kramatorsk Airport	48.7056	37.6289
UA	Volynska oblast	UCK	Lutsk Airport	50.6784	25.4872
UA	Mykolaivska oblast	NLV	Mykolaiv International Airport	47.0579	31.9198
UA	Kyiv	KBP	Boryspil International Airport	50.345	30.8947
UA	Vinnytska oblast	VIN	Havryshivka Vinnytsia International Airport	49.2425	28.6138
UA	Khmelnytska oblast	HMJ	Khmelnytskyi Airport	49.3597	26.9334
UA	Avtonomna Respublika Krym	KHC	Kerch Airport (Voykovo Airport)	45.3725	36.4014
UA	Avtonomna Respublika Krym	SIP	Simferopol International Airport	45.0522	33.9751
UA	Kirovohradska oblast	KGO	Kirovohrad Airport	48.5428	32.285
UA	Khmelnytska oblast	KCP	Kamianets-Podilskyi Airport	48.2669	25.9672
UA	Zaporizka oblast	OZH	Zaporizhia International Airport	47.867	35.3157
UA	Zaporizka oblast	ERD	Berdiansk Airport	46.815	36.7581
UA	Ternopilska oblast	TNL	Ternopil International Airport	49.5242	25.7001
UA	Chernihivska oblast	CEJ	Chernihiv Airport	51.4033	31.16
UG	Tororo	TRY	Tororo Airport	0.683	34.167
UG	Kasese	KSE	Kasese Airport	0.183	30.1
UG	Jinja	JIN	Jinja Airport	0.45	33.2
UG	Arua	RUA	Arua Airport	3.05	30.917
UG	Kanungu	KHX	Kihihi Airstrip	-0.7165	29.6997
UG	Mbarara	MBQ	Mbarara Airport	-0.555278	30.5994
UG	Soroti	SRT	Soroti Airport	1.72769	33.6228
UG	Kampala	EBB	Entebbe International Airport	0.042386	32.4435
UG	Moyo	OYG	Moyo Airport	3.6444	31.7628
UG	Masindi	KCU	Masindi Airport	1.75806	31.7367
UG	Gulu	ULU	Gulu Airport	2.80556	32.2718
UG	Nwoya	PAF	Pakuba Airfield	2.32639	31.4978
UG	Kabale	KBG	Kabalega Falls Airport	2.32872	31.4997
UM	Palmyra Atoll	AWK	Wake Island Airfield	19.2821	166.636
US	Texas	WIB	Wilbarger County Airport (FAA: F05)	34.2257	-99.2838
US	California	HHR	Hawthorne Municipal Airport (Jack Northrop Field)	33.9228	-118.335
US	Texas	SJT	San Angelo Regional Airport (Mathis Field)	31.3577	-100.496
US	Hawaii	HHI	Wheeler Army Airfield	21.4835	-158.04
US	South Carolina	HHH	Hilton Head Airport	32.2244	-80.6975
US	Alaska	HGZ	Hog River Airport	66.2161	-155.669
US	Washington	SKA	Fairchild Air Force Base	47.6151	-117.656
US	Texas	SKF	Kelly Field Annex / Lackland Air Force Base	29.3842	-98.5811
US	Maryland	HGR	Hagerstown Regional Airport (Richard A. Henson Field)	39.7079	-77.7295
US	Alaska	SKK	Shaktoolik Airport	64.3711	-161.224
US	North Carolina	HFF	Mackall Army Airfield	35.0363	-79.4978
US	Connecticut	HFD	Hartford-Brainard Airport	41.7367	-72.6494
US	Alaska	SKW	Skwentna Airport	61.9653	-151.191
US	Mississippi	HEZ	Natchez-Adams County Airport (Hardy-Anders Field)	31.6137	-91.2973
US	Iowa	SLB	Storm Lake Municipal Airport	42.5973	-95.2407
US	Utah	SLC	Salt Lake City International Airport	40.7884	-111.978
US	Oregon	SLE	McNary Field	44.9095	-123.003
US	Arkansas	SLG	Smith Field	36.1919	-94.49
US	California	FOB	Fort Bragg Airport	39.4743	-123.796
US	Oregon	HES	Hermiston Municipal Airport	45.8282	-119.259
US	New York	SLK	Adirondack Regional Airport	44.3853	-74.2062
US	Kansas	SLN	Salina Regional Airport	38.791	-97.6522
US	Illinois	SLO	Salem-Leckrone Airport	38.6429	-88.9642
US	Alaska	SLQ	Sleetmute Airport	61.7005	-157.166
US	Texas	SLR	Sulphur Springs Municipal Airport	33.1598	-95.6211
US	Colorado	SLT	Harriet Alexander Field	38.5383	-106.049
US	Arkansas	HEE	Thompson-Robbins Airport	34.5766	-90.6762
US	Alaska	HED	Herendeen Bay Airport	55.8014	-160.899
US	Kentucky	SME	Lake Cumberland Regional Airport	37.0534	-84.6159
US	California	SMF	Sacramento International Airport	38.6954	-121.591
US	Alaska	SMK	St. Michael Airport	63.4901	-162.11
US	Colorado	HDN	Yampa Valley Airport	40.4812	-107.218
US	Idaho	SMN	Lemhi County Airport	45.1238	-113.881
US	California	SMO	Santa Monica Municipal Airport	34.0158	-118.451
US	Hawaii	HDH	Dillingham Airfield	21.5795	-158.197
US	Nebraska	HDE	Brewster Field	40.4521	-99.3365
US	Alaska	SMU	Sheep Mountain Airport	61.812	-147.507
US	California	SMX	Santa Maria Public Airport (Capt. G. Allan Hancock Field)	34.8989	-120.457
US	California	SNA	John Wayne Airport (Orange County Airport)	33.6757	-117.868
US	South Carolina	HCW	Cheraw Municipal Airport (Lynch Bellinger Field	34.7129	-79.957
US	Alaska	HCR	Holy Cross Airport	62.1883	-159.775
US	New York	HCC	Columbia County Airport	42.2913	-73.7103
US	Texas	HCA	Big Spring McMahon-Wrinkle Airport	32.2126	-101.522
US	Texas	SNK	Winston Field Airport	32.6934	-100.95
US	Oklahoma	SNL	Shawnee Regional Airport	35.3579	-96.9428
US	Alaska	SNP	St. Paul Island Airport	57.1673	-170.22
US	Oklahoma	HBR	Hobart Regional Airport	34.9913	-99.0513
US	California	SNS	Salinas Municipal Airport	36.6628	-121.606
US	Arizona	HBK	Holbrook Municipal Airport	34.9407	-110.138
US	Alaska	HBH	Entrance Island Seaplane Base (Hobart Bay)	57.4122	-133.438
US	Nebraska	SNY	Sidney Municipal Airport (Lloyd W. Carr Field)	41.1013	-102.985
US	Mississippi	HBG	Hattiesburg Bobby L. Chain Municipal Airport	31.2648	-89.2528
US	New Mexico	HBB	Hobbs Industrial Airpark	32.7668	-103.209
US	Pennsylvania	HAR	Capital City Airport	40.2171	-76.8515
US	Alaska	SOL	Solomon State Field Airport	64.5605	-164.446
US	North Carolina	SOP	Moore County Airport	35.2374	-79.3912
US	Ohio	HAO	Butler County Regional Airport	39.3638	-84.522
US	Alaska	SOV	Seldovia Airport	59.4424	-151.704
US	Arizona	SOW	Show Low Regional Airport	34.2655	-110.006
US	Michigan	HAI	Three Rivers Municipal Airport (Dr. Haines Flying Field)	41.9598	-85.5934
US	California	HAF	Half Moon Bay Airport	37.5134	-122.501
US	California	SPA	Spartanburg Downtown Memorial Airport	34.9157	-81.9565
US	Alabama	HAB	Marion County - Rankin Fite Airport	34.1176	-87.9982
US	South Dakota	SPF	Black Hills Airport (Clyde Ice Field)	44.4803	-103.783
US	Florida	SPG	Albert Whitted Airport	27.7651	-82.627
US	Illinois	SPI	Abraham Lincoln Capital Airport	39.8441	-89.6779
US	Arizona	GYR	Phoenix Goodyear Airport	33.4225	-112.376
US	Texas	SPS	Sheppard Air Force Base / Wichita Falls Municipal Airport	33.9888	-98.4919
US	Iowa	SPW	Spencer Municipal Airport	43.1655	-95.2028
US	Arkansas	SPZ	Springdale Municipal Airport	36.1764	-94.1193
US	California	SQA	Santa Ynez Airport	34.6068	-120.076
US	Colorado	GXY	Greeley-Weld County Airport	40.4374	-104.633
US	West Virginia	GWV	Glendale Fokker Field	39.9487	-80.7595
US	Colorado	GWS	Glenwood Springs Municipal Airport	39.5083	-107.311
US	Illinois	SQI	Whiteside County Airport (Jos. H. Bittorf Field)	41.7428	-89.6763
US	Mississippi	GWO	Greenwood-Leflore Airport	33.4943	-90.0847
US	California	SQL	San Carlos Airport	37.5119	-122.25
US	Washington	SQV	Sequim Valley Airport	48.0981	-123.187
US	Texas	GVT	Majors Airport	33.0678	-96.0653
US	Georgia	GVL	Lee Gilmer Memorial Airport	34.2726	-83.8302
US	Virginia	GVE	Gordonsville Municipal Airport	38.156	-78.1658
US	Oklahoma	GUY	Guymon Municipal Airport	36.6851	-101.508
US	Arkansas	SRC	Searcy Municipal Airport	35.2106	-91.7375
US	California	SRF	San Rafael Airport (Hamilton Field)	38.06	-122.51
US	New Mexico	GUP	Gallup Municipal Airport	35.5111	-108.789
US	Alabama	GUF	Jack Edwards Airport	30.2905	-87.6718
US	Florida	SRQ	Sarasota-Bradenton International Airport	27.3954	-82.5544
US	Colorado	GUC	Gunnison-Crested Butte Regional Airport	38.5339	-106.933
US	Alaska	SRV	Stony River Airport	61.7897	-156.589
US	North Carolina	SRW	Rowan County Airport	35.6459	-80.5203
US	Pennsylvania	GTY	Gettysburg Regional Airport	39.8409	-77.2742
US	Mississippi	GTR	Golden Triangle Regional Airport	33.4503	-88.5914
US	Oregon	GTP	Grants Pass Airport	42.5101	-123.388
US	South Carolina	SSC	Shaw Air Force Base	33.9727	-80.4706
US	Texas	SSF	Stinson Municipal Airport	29.337	-98.4711
US	Wisconsin	GTG	Grantsburg Municipal Airport	45.7981	-92.6644
US	Georgia	SSI	Malcolm McKinnon Airport	31.1518	-81.3913
US	Montana	GTF	Great Falls International Airport	47.482	-111.371
US	Alaska	GST	Gustavus Airport	58.4253	-135.707
US	Washington	SSW	Stuart Island Airpark	48.6729	-123.176
US	South Carolina	GSP	Greenville-Spartanburg International Airport	34.8957	-82.2189
US	North Carolina	GSO	Piedmont Triad International Airport	36.0978	-79.9373
US	Minnesota	STC	St. Cloud Regional Airport	45.5466	-94.0599
US	Wisconsin	STE	Stevens Point Municipal Airport	44.5452	-89.5303
US	North Carolina	GSB	Seymour Johnson Air Force Base	35.3394	-77.9606
US	Alaska	STG	St. George Airport	56.5783	-169.662
US	Missouri	STJ	Rosecrans Memorial Airport	39.7719	-94.9097
US	Colorado	STK	Sterling Municipal Airport	40.6153	-103.265
US	Missouri	STL	Lambert-St. Louis International Airport	38.7487	-90.37
US	Minnesota	STP	St. Paul Downtown Airport (Holman Field)	44.9345	-93.06
US	Pennsylvania	STQ	St. Marys Municipal Airport	41.4125	-78.5026
US	Michigan	GRR	Gerald R. Ford International Airport	42.8808	-85.5228
US	California	STS	Charles M. Schulz-Sonoma County A	38.509	-122.813
US	Nebraska	GRN	Gordon Municipal Airport	42.806	-102.175
US	Florida	SUA	Witham Field	27.1817	-80.2211
US	Minnesota	GRM	Grand Marais/Cook County Airport	47.8383	-90.3829
US	Oklahoma	SUD	Stroud Municipal Airport	35.7896	-96.6557
US	Wisconsin	SUE	Door County Cherryland Airport	44.8437	-87.4215
US	Texas	GRK	Killeen-Fort Hood Regional Airport / Robert Gray Army Airfield	31.0672	-97.8289
US	California	SUM	Sumter Airport	33.995	-80.3613
US	Idaho	SUN	Friedman Memorial Airport	43.5044	-114.296
US	Oregon	SUO	Sunriver Airport	43.8763	-121.453
US	Nebraska	GRI	Central Nebraska Regional Airport	40.9675	-98.3096
US	Washington	GRF	Gray Army Airfield	47.0792	-122.581
US	Missouri	SUS	Spirit of St. Louis Airport	38.6621	-90.652
US	California	SUU	Travis Air Force Base	38.2627	-121.927
US	Illinois	GRE	Greenville Airport	38.8362	-89.3784
US	Wisconsin	SUW	Richard I. Bong Airport	46.6897	-92.0947
US	Iowa	SUX	Sioux Gateway Airport (Colonel Bud Day Field)	42.4026	-96.3844
US	Alaska	SVA	Savoonga Airport	63.6864	-170.493
US	South Carolina	GRD	Greenwood County Airport	34.2487	-82.1591
US	New Mexico	SVC	Grant County Airport	32.6365	-108.156
US	California	SVE	Susanville Municipal Airport	40.3757	-120.573
US	North Carolina	SVH	Statesville Regional Airport	35.7653	-80.9539
US	Wisconsin	GRB	Austin Straubel International Airport	44.4851	-88.1296
US	Ohio	GQQ	Galion Municipal Airport	40.7534	-82.7238
US	Minnesota	GPZ	Grand Rapids-Itasca County Airport (Gordon Newstrom Field)	47.2111	-93.5098
US	Mississippi	GPT	Gulfport-Biloxi International Airport	30.4073	-89.0701
US	Georgia	SVN	Hunter Army Airfield	32.01	-81.1457
US	Connecticut	GON	Groton-New London Airport	41.3301	-72.0451
US	Alaska	SVS	Stevens Village Airport	66.0172	-149.055
US	Oregon	GOL	Gold Beach Municipal Airport	42.4134	-124.424
US	Oklahoma	GOK	Guthrie-Edmond Regional Airport	35.8498	-97.4156
US	Alaska	SVW	Sparrevohn LRRS Airport	61.0974	-155.574
US	Alaska	SWD	Seward Airport	60.1269	-149.419
US	Florida	GNV	Gainesville Regional Airport	29.6901	-82.2718
US	Alaska	GNU	Goodnews Airport	59.1174	-161.577
US	Oklahoma	SWO	Stillwater Regional Airport	36.1612	-97.0857
US	New Mexico	GNT	Grants-Milan Municipal Airport	35.1673	-107.902
US	Texas	SWW	Avenger Field	32.4674	-100.467
US	Idaho	GNG	Gooding Municipal Airport	42.9172	-114.765
US	California	GNF	Gansner Field	39.9439	-120.945
US	Utah	GMV	Monument Valley Airport	37.0167	-110.201
US	South Carolina	GMU	Greenville Downtown Airport	34.8479	-82.35
US	Alaska	GMT	Granite Mountain Air Station	65.4021	-161.281
US	Alaska	SXP	Sheldon Point Airport	62.5206	-164.848
US	Alaska	SXQ	Soldotna Airport	60.4757	-151.034
US	Kentucky	GLW	Glasgow Municipal Airport	37.0318	-85.9537
US	Alaska	GLV	Golovin Airport	64.5505	-163.007
US	New York	SXY	Sidney Municipal Airport	42.3026	-75.416
US	Alaska	SYA	Eareckson Air Station	52.7123	174.114
US	Alaska	SYB	Seal Bay Seaplane Base	58.3733	-152.202
US	Texas	GLS	Scholes International Airport at Galveston	29.2653	-94.8604
US	Michigan	GLR	Gaylord Regional Airport	45.0135	-84.7036
US	Tennessee	SYI	Shelbyville Municipal Airport (Bomar Field)	35.5601	-86.4425
US	Minnesota	SYN	Stanton Airfield	44.4755	-93.0163
US	Mississippi	GLH	Mid-Delta Regional Airport	33.4829	-90.9856
US	Texas	GLE	Gainesville Municipal Airport	33.6514	-97.197
US	New York	SYR	Syracuse Hancock International Airport	43.1112	-76.1063
US	Kansas	GLD	Goodland Municipal Airport (Renner Field)	39.3706	-101.699
US	Arizona	GLB	San Carlos Apache Airport	33.3531	-110.667
US	Georgia	SYV	Sylvester Airport	31.5585	-83.8957
US	Tennessee	GKT	Gatlinburg-Pigeon Forge Airport	35.8578	-83.5287
US	Alaska	GKN	Gulkana Airport	62.1549	-145.457
US	Colorado	GJT	Grand Junction Regional Airport (Walker Field)	39.1224	-108.527
US	Missouri	SZL	Whiteman Air Force Base	38.7303	-93.5479
US	California	SZN	Santa Cruz Island Airport	34.0606	-119.915
US	California	SZP	Santa Paula Airport	34.3472	-119.061
US	Colorado	TAD	Perry Stokes Airport	37.2594	-104.341
US	Alaska	TAL	Ralph M. Calhoun Memorial Airport	65.1744	-152.109
US	Florida	GIF	Winter Haven's Gilbert Airport	28.0629	-81.7533
US	Tennessee	GHM	Centerville Municipal Airport	35.8374	-87.4454
US	Montana	GGW	Glasgow Airport (Wokal Field)	48.2125	-106.615
US	Arizona	TBC	Tuba City Airport	36.0928	-111.383
US	Texas	GGG	East Texas Regional Airport	32.384	-94.7115
US	Florida	AAF	Apalachicola Regional Airport	29.7275	-85.0275
US	Pennsylvania	ABE	Lehigh Valley International Airport	40.6521	-75.4408
US	Texas	ABI	Abilene Regional Airport	32.4113	-99.6819
US	South Carolina	GGE	Georgetown County Airport	33.3117	-79.3196
US	Alaska	ABL	Ambler Airport	67.1063	-157.857
US	New Mexico	ABQ	Albuquerque International Sunport	35.0402	-106.609
US	New York	GFL	Floyd Bennett Memorial Airport	43.3412	-73.6103
US	Missouri	TBN	Waynesville-St. Robert Regional Airport (Forney Field)	37.7416	-92.1407
US	South Dakota	ABR	Aberdeen Regional Airport	45.4491	-98.4218
US	Georgia	ABY	Southwest Georgia Regional Airport	31.5355	-84.1945
US	Georgia	TBR	Statesboro-Bulloch County Airport	32.4827	-81.7369
US	North Dakota	GFK	Grand Forks International Airport	47.9493	-97.1761
US	Wyoming	GEY	South Big Horn County Airport	44.5168	-108.083
US	Michigan	ACB	Antrim County Airport	44.9886	-85.1984
US	Massachusetts	ACK	Nantucket Memorial Airport	41.2531	-70.0602
US	Texas	ACT	Waco Regional Airport	31.6113	-97.2305
US	California	ACV	Arcata-Eureka Airport	40.9781	-124.109
US	Washington	GEG	Spokane International Airport	47.6199	-117.534
US	New Jersey	ACY	Atlantic City International Airport	39.4576	-74.5772
US	New Mexico	TCC	Tucumcari Municipal Airport	35.1828	-103.603
US	Delaware	GED	Delaware Coastal Airport	38.6892	-75.3589
US	Michigan	ADG	Lenawee County Airport	41.8677	-84.0773
US	Alaska	ADK	Adak Airport	51.878	-176.646
US	Oklahoma	ADM	Ardmore Municipal Airport	34.303	-97.0196
US	Alaska	ADQ	Kodiak Airport	57.75	-152.494
US	Michigan	GDW	Gladwin Zettel Memorial Airport	43.9706	-84.475
US	Alabama	TCL	Tuscaloosa Regional Airport	33.2206	-87.6114
US	Washington	TCM	McChord Field	47.1377	-122.476
US	Alaska	ADR	Robert F. Swinnie Airport	33.4517	-79.5262
US	Montana	GDV	Dawson Community Airport	47.1387	-104.807
US	Texas	ADS	Addison Airport	32.9686	-96.8364
US	Oklahoma	ADT	Ada Municipal Airport	34.8043	-96.6713
US	New Mexico	TCS	Truth or Consequences Municipal Airport	33.2369	-107.272
US	Alaska	TCT	Takotna Airport	62.9932	-156.029
US	Maryland	ADW	Andrews Field (Andrews Air Force Base)	38.8108	-76.867
US	Massachusetts	GDM	Gardner Municipal Airport	42.55	-72.0161
US	Minnesota	AEL	Albert Lea Municipal Airport	43.6815	-93.3672
US	Alaska	GDH	Golden Horn Lodge Seaplane Base	59.747	-158.875
US	Alaska	AET	Allakaket Airport	66.5518	-152.622
US	Louisiana	AEX	Alexandria International Airport	31.3274	-92.5498
US	South Carolina	GDC	Donaldson Center Airport	34.7583	-82.3764
US	Colorado	AFF	United States Air Force Academy Airfield	38.9697	-104.813
US	Tennessee	GCY	Greeneville-Greene County Municipal Airport	36.193	-82.8151
US	Arizona	GCW	Grand Canyon West Airport	35.9904	-113.816
US	Washington	TDO	South Lewis County Airport (Ed Carlson Memorial Field)	46.4772	-122.806
US	New Hampshire	AFN	Jaffrey Airport-Silver Ranch	42.8051	-72.003
US	Arizona	GCN	Grand Canyon National Park Airport	35.9524	-112.147
US	Wyoming	AFO	Afton Municipal Airport	42.7112	-110.942
US	Texas	AFW	Fort Worth Alliance Airport	32.9876	-97.3188
US	Texas	TDW	Tradewind Airport	35.1699	-101.826
US	Pennsylvania	AGC	Allegheny County Airport	40.3544	-79.9302
US	Ohio	TDZ	Toledo Executive Airport	41.5649	-83.4823
US	Alaska	AGN	Angoon Seaplane Base	57.5036	-134.585
US	New Jersey	TEB	Teterboro Airport	40.8501	-74.0608
US	Kansas	GCK	Garden City Regional Airport	37.9275	-100.724
US	Washington	GCD	Grand Coulee Dam Airport	47.922	-119.083
US	Wyoming	GCC	Gillette-Campbell County Airport	44.3489	-105.539
US	Arkansas	AGO	Magnolia Municipal Airport	33.228	-93.217
US	Alaska	TEH	Tetlin Airport	63.1339	-142.519
US	Georgia	AGS	Augusta Regional Airport at Bush Field	33.3699	-81.9645
US	Alaska	TEK	Tatitlek Airport	60.8714	-146.69
US	California	AHC	Amedee Army Airfield	40.2662	-120.153
US	Massachusetts	GBR	Walter J. Koladza Airport	42.1842	-73.4032
US	Oklahoma	AHD	Ardmore Downtown Executive Airport	34.147	-97.1227
US	Nebraska	AHF	Arapahoe Municipal Airport	40.3395	-99.9065
US	Wisconsin	AHH	Amery Municipal Airport	45.2811	-92.3754
US	Oregon	AHM	Ashland Municipal Airport	42.1903	-122.661
US	Georgia	AHN	Athens Ben Epps Airport	33.9486	-83.3263
US	Nebraska	AIA	Alliance Municipal Airport	42.0532	-102.804
US	Alaska	GBH	Galbraith Lake Airport	68.4797	-149.49
US	Colorado	TEX	Telluride Regional Airport	37.9538	-107.908
US	Illinois	GBG	Galesburg Municipal Airport	40.938	-90.4311
US	Kansas	GBD	Great Bend Municipal Airport	38.3443	-98.8592
US	South Carolina	AIK	Aiken Municipal Airport	33.6494	-81.685
US	Alaska	AIN	Wainwright Airport	70.638	-159.995
US	Iowa	AIO	Atlantic Municipal Airport	41.4073	-95.0469
US	Alabama	AIV	George Downer Airport	33.1065	-88.1978
US	Missouri	AIZ	Lee C. Fine Memorial Airport	38.096	-92.5495
US	Alaska	GAM	Gambell Airport	63.7668	-171.733
US	Alaska	AKB	Atka Airport	52.2203	-174.206
US	Ohio	AKC	Akron Fulton International Airport	41.0375	-81.4669
US	Alaska	AKI	Akiak Airport	60.9029	-161.231
US	Alaska	AKK	Akhiok Airport	56.9387	-154.183
US	Alaska	AKN	King Salmon Airport	58.6768	-156.649
US	Alabama	TGE	Sharpe Field	32.4919	-85.7756
US	Colorado	AKO	Colorado Plains Regional Airport	40.1756	-103.222
US	Alaska	AKP	Anaktuvuk Pass Airport	68.1336	-151.743
US	New York	ALB	Albany International Airport	42.7483	-73.8017
US	Texas	ALE	Alpine-Casparis Municipal Airport	30.3842	-103.684
US	Texas	ALI	Alice International Airport	27.7409	-98.0269
US	Alaska	GAL	Edward G. Pitka Sr. Airport	64.7362	-156.937
US	Maryland	GAI	Montgomery County Airpark	39.1683	-77.166
US	New Mexico	ALM	Alamogordo-White Sands Regional Airport	32.8399	-105.991
US	Oklahoma	GAG	Gage Airport	36.2955	-99.7764
US	Illinois	ALN	St. Louis Regional Airport	38.8903	-90.046
US	Iowa	ALO	Waterloo Regional Airport	42.5571	-92.4003
US	Colorado	ALS	San Luis Valley Regional Airport	37.4349	-105.867
US	Washington	ALW	Walla Walla Regional Airport	46.0949	-118.288
US	Alabama	GAD	Northeast Alabama Regional Airport	33.9726	-86.089
US	Alabama	ALX	Thomas C. Russell Field	32.9147	-85.963
US	Tennessee	THA	Tullahoma Regional Airport (William Northern Field)	35.3801	-86.2464
US	Alaska	ALZ	Alitak Seaplane Base	56.8995	-154.248
US	Texas	AMA	Rick Husband Amarillo International Airport	35.2194	-101.706
US	Nevada	GAB	Gabbs Airport	38.9241	-117.959
US	Arkansas	FYV	Drake Field (Fayetteville Executive Airport)	36.0051	-94.1701
US	Colorado	AMK	Animas Air Park	37.2032	-107.869
US	Michigan	AMN	Gratiot Community Airport	43.3221	-84.688
US	Iowa	AMW	Ames Municipal Airport	41.992	-93.6218
US	Alabama	ANB	Anniston Regional Airport	33.5882	-85.8581
US	Montana	THM	Thompson Falls Airport	47.5735	-115.281
US	Alaska	ANC	Ted Stevens Anchorage International Airport	61.1744	-149.996
US	Alaska	FYU	Fort Yukon Airport	66.5715	-145.25
US	Wyoming	THP	Hot Springs County-Thermopolis Municipal Airport	43.7136	-108.39
US	South Carolina	AND	Anderson Regional Airport	34.4946	-82.7094
US	Tennessee	FYM	Fayetteville Municipal Airport	35.0597	-86.564
US	Alaska	ANI	Aniak Airport	61.5816	-159.543
US	Alaska	ANN	Annette Island Airport	55.0424	-131.572
US	Iowa	FXY	Forest City Municipal Airport	43.2347	-93.6241
US	Pennsylvania	THV	York Airport	39.917	-76.873
US	Maryland	ANP	Lee Airport	38.9429	-76.5684
US	Alaska	ANV	Anvik Airport	62.6467	-160.191
US	Nebraska	ANW	Ainsworth Regional Airport	42.5792	-99.993
US	Kansas	ANY	Anthony Municipal Airport	37.1585	-98.0796
US	Florida	FXE	Fort Lauderdale Executive Airport	26.1973	-80.1707
US	Ohio	AOH	Lima Allen County Airport	40.7069	-84.0267
US	Alaska	FWL	Farewell Airport	62.5093	-153.892
US	Texas	FWH	NAS Fort Worth JRB / Carswell Field	32.7692	-97.4415
US	Pennsylvania	AOO	Altoona-Blair County Airport	40.2964	-78.32
US	Alaska	AOS	Amook Bay Seaplane Base	57.4715	-153.815
US	Colorado	APA	Centennial Airport	39.5701	-104.849
US	California	APC	Napa County Airport	38.2132	-122.281
US	Oklahoma	TIK	Tinker Air Force Base	35.4147	-97.3866
US	Florida	APF	Naples Municipal Airport	26.1526	-81.7753
US	California	FUL	Fullerton Municipal Airport	33.872	-117.98
US	Maryland	APG	Phillips Army Airfield	39.4662	-76.1688
US	Virginia	APH	A.P. Hill Army Airfield	38.0689	-77.3183
US	Michigan	APN	Alpena County Regional Airport	45.0781	-83.5603
US	Georgia	FTY	Fulton County Airport (Charlie Brown Field)	33.7791	-84.5214
US	Tennessee	APT	Marion County Airport (Brown Field)	35.0607	-85.5853
US	California	APV	Apple Valley Airport	34.5753	-117.186
US	Washington	TIW	Tacoma Narrows Airport	47.2679	-122.578
US	Florida	TIX	Space Coast Regional Airport	28.5148	-80.7992
US	Alaska	AQY	Girdwood Airport	60.9661	-149.126
US	Louisiana	ARA	Acadiana Regional Airport	30.0378	-91.8839
US	Texas	FTW	Fort Worth Meacham International Airport	32.8198	-97.3624
US	Michigan	ARB	Ann Arbor Municipal Airport	42.223	-83.7456
US	Kentucky	FTK	Godman Army Airfield	37.9071	-85.9721
US	Alaska	ARC	Arctic Village Airport	68.1147	-145.579
US	Hawaii	FTI	Fitiuta Airport	-14.2172	-169.425
US	Massachusetts	ARE	Antonio (Nery) Juarbe Pol Airport	18.45	-66.6753
US	Arkansas	ARG	Walnut Ridge Regional Airport	36.1247	-90.9251
US	New Mexico	FSU	Fort Sumner Municipal Airport	34.4834	-104.217
US	New York	ART	Watertown International Airport	43.9919	-76.0217
US	Texas	FST	Fort Stockton-Pecos County Airport	30.9157	-102.916
US	Alaska	TKA	Talkeetna Airport	62.3205	-150.094
US	Wisconsin	ARV	Lakeland Airport (Noble F. Lee Memorial Field)	45.9279	-89.7309
US	Arkansas	FSM	Fort Smith Regional Airport	35.3366	-94.3674
US	Alaska	TKE	Tenakee Seaplane Base	57.7797	-135.218
US	California	TKF	Truckee Tahoe Airport	39.32	-120.14
US	Kansas	FSK	Fort Scott Municipal Airport	37.7984	-94.7694
US	Colorado	ASE	Aspen-Pitkin County Airport (Sardy Field)	39.2232	-106.869
US	Alaska	TKI	Tokeen Seaplane Base	55.9371	-133.327
US	Alaska	TKJ	Tok Junction Airport	63.3295	-142.954
US	Oklahoma	FSI	Henry Post Army Airfield (Fort Sill)	34.6498	-98.4022
US	Alaska	TKL	Taku Lodge Seaplane Base	58.4897	-133.943
US	South Dakota	FSD	Sioux Falls Regional Airport (Joe Foss Field)	43.582	-96.7419
US	New Hampshire	ASH	Nashua Airport (Boire Field)	42.7817	-71.5148
US	Texas	ASL	Harrison County Airport	32.5205	-94.3078
US	Alabama	ASN	Talladega Municipal Airport	33.5699	-86.0509
US	Maine	FRY	Eastern Slopes Regional Airport	43.9911	-70.9479
US	Nevada	ASQ	Austin Airport	39.468	-117.195
US	Oregon	AST	Astoria Regional Airport	46.158	-123.879
US	Virginia	FRR	Front Royal-Warren County Airport	38.9175	-78.2535
US	Wisconsin	ASX	John F. Kennedy Memorial Airport	46.5485	-90.919
US	North Dakota	ASY	Ashley Municipal Airport	46.0239	-99.3526
US	Oklahoma	ATE	Antlers Municipal Airport	34.1926	-95.6499
US	Alaska	ATK	Atqasuk Edward Burnell Sr. Memorial Airport	70.4673	-157.436
US	Alaska	TLA	Teller Airport	65.2404	-166.339
US	Georgia	ATL	Hartsfield-Jackson Atlanta International Airport	33.6367	-84.4281
US	Ohio	ATO	Ohio University Airport (Snyder Field)	39.211	-82.2314
US	Alaska	FRN	Bryant Army Airport	61.2664	-149.653
US	New Mexico	ATS	Artesia Municipal Airport	32.8525	-104.468
US	Alaska	TLF	Telida Airport	63.3939	-153.269
US	Alaska	ATT	Atmautluak Airport	60.8667	-162.273
US	Florida	TLH	Tallahassee International Airport	30.3965	-84.3503
US	Alaska	TLJ	Tatalina LRRS Airport	62.8944	-155.977
US	Alaska	ATU	Casco Cove Coast Guard Station	52.8284	173.18
US	Minnesota	FRM	Fairmont Municipal Airport	43.6439	-94.4156
US	Wisconsin	ATW	Appleton International Airport	44.2581	-88.5191
US	Kansas	FRI	Marshall Army Airfield	39.0553	-96.7645
US	New York	FRG	Republic Airport	40.7288	-73.4134
US	California	TLR	Mefford Field Airport	36.1563	-119.326
US	South Dakota	ATY	Watertown Regional Airport	44.914	-97.1547
US	Alaska	TLT	Tuluksak Airport	61.0968	-160.969
US	Washington	FRD	Friday Harbor Airport	48.522	-123.024
US	Florida	FPY	Perry-Foley Airport	30.0693	-83.5806
US	Maine	AUG	Augusta State Airport	44.3206	-69.7973
US	Florida	FPR	St. Lucie County International Airport	27.4951	-80.3683
US	Alaska	AUK	Alakanuk Airport	62.68	-164.66
US	Minnesota	AUM	Austin Municipal Airport	43.665	-92.9334
US	Georgia	TMA	Henry Tift Myers Airport	31.429	-83.4885
US	Florida	TMB	Miami Executive Airport	25.6479	-80.4328
US	New York	FOK	Francis S. Gabreski Airport	40.8437	-72.6318
US	California	AUN	Auburn Municipal Airport	38.9548	-121.082
US	Kansas	FOE	Topeka Regional Airport	38.9509	-95.6636
US	Alabama	AUO	Auburn University Regional Airport	32.6151	-85.434
US	Texas	AUS	Austin-Bergstrom International Airport	30.1945	-97.6699
US	Wisconsin	AUW	Wausau Downtown Airport	44.9262	-89.6266
US	Iowa	FOD	Fort Dodge Regional Airport	42.5515	-94.1926
US	Illinois	AUZ	Aurora Municipal Airport	41.7719	-88.4757
US	North Carolina	AVL	Asheville Regional Airport	35.4362	-82.5418
US	Michigan	FNT	Bishop International Airport	42.9654	-83.7436
US	Alaska	FNR	Funter Bay Seaplane Base	58.2544	-134.898
US	Florida	AVO	Avon Park Executive Airport	27.5912	-81.5278
US	Colorado	FNL	Northern Colorado Regional Airport	40.4518	-105.011
US	Pennsylvania	AVP	Wilkes-Barre/Scranton International Airport	41.3385	-75.7234
US	Arizona	AVW	Marana Regional Airport	32.4096	-111.218
US	California	AVX	Catalina Airport	33.4049	-118.416
US	Arkansas	AWM	West Memphis Municipal Airport	35.1351	-90.2344
US	New York	AXB	Maxson Airfield	44.312	-75.9003
US	Alaska	TNC	Tin City LRRS Airport	65.5631	-167.922
US	Florida	FMY	Page Field	26.5866	-81.8633
US	Oregon	FMU	Florence Municipal Airport	43.9828	-124.111
US	Iowa	FMS	Fort Madison Municipal Airport	40.6593	-91.3268
US	Iowa	AXG	Algona Municipal Airport	43.0779	-94.272
US	New Mexico	FMN	Four Corners Regional Airport	36.7412	-108.23
US	Massachusetts	FMH	Otis Air National Guard Base	41.6584	-70.5214
US	Maryland	FME	Tipton Airport	39.0854	-76.7594
US	Alaska	TNK	Tununak Airport	60.5755	-165.272
US	Minnesota	AXN	Alexandria Municipal Airport (Chandler Field)	45.8663	-95.3947
US	Nevada	FLX	Fallon Municipal Airport	39.4991	-118.749
US	West Virginia	MGW	Morgantown Municipal Airport (Walter L. Bill Hart Field)	39.6429	-79.9163
US	Ohio	MGY	Dayton-Wright Brothers Airport	39.589	-84.2249
US	California	TNP	Twentynine Palms Airport	34.1316	-115.946
US	Wisconsin	MFI	Marshfield Municipal Airport	44.6369	-90.1893
US	Nevada	MFH	Mesquite Airport	36.835	-114.055
US	Kansas	FLV	Sherman Army Airfield	39.3683	-94.9147
US	Florida	TNT	Dade-Collier Training and Transition Airport	25.8618	-80.897
US	Iowa	TNU	Newton Municipal Airport	41.6744	-93.0217
US	South Dakota	MHE	Mitchell Municipal Airport	43.7748	-98.0386
US	Alaska	FLT	Flat Airport	62.4526	-157.989
US	Texas	MFE	McAllen Miller International Airport	26.1758	-98.2386
US	Ohio	MFD	Mansfield Lahm Regional Airport	40.8214	-82.5166
US	California	TOA	Zamperini Field	33.8034	-118.34
US	Kansas	MHK	Manhattan Regional Airport	39.141	-96.6708
US	Georgia	TOC	Toccoa Airport (R.G. LeTourneau Field)	34.5938	-83.2958
US	Missouri	MHL	Marshall Memorial Municipal Airport	39.0958	-93.2029
US	Nebraska	MHN	Hooker County Airport	42.0422	-101.059
US	California	MHR	Sacramento Mather Airport	38.5539	-121.298
US	Alaska	TOG	Togiak Airport	59.0528	-160.397
US	Alabama	TOI	Troy Municipal Airport	31.8604	-86.0121
US	Arkansas	FLP	Marion County Regional Airport	36.2909	-92.5903
US	Ohio	TOL	Toledo Express Airport	41.5868	-83.8078
US	California	MHS	Dunsmuir Municipal-Mott Airport	41.2632	-122.272
US	South Carolina	FLO	Florence Regional Airport	34.1854	-79.7239
US	Kansas	TOP	Philip Billard Municipal Airport	39.0687	-95.6225
US	New Hampshire	MHT	Manchester-Boston Regional Airport	42.9326	-71.4357
US	Wyoming	TOR	Torrington Municipal Airport	42.0645	-104.153
US	California	MHV	Mojave Air and Space Port	35.0594	-118.152
US	Nevada	MEV	Minden-Tahoe Airport	39.0003	-119.751
US	California	MER	Castle Airport	37.3805	-120.568
US	Florida	FLL	Fort Lauderdale-Hollywood International Airport	26.0726	-80.1527
US	Florida	MIA	Miami International Airport	25.7932	-80.2906
US	Arizona	FLG	Flagstaff Pulliam Airport	35.1385	-111.671
US	Wisconsin	FLD	Fond du Lac County Airport	43.7712	-88.4884
US	Florida	TPA	Tampa International Airport	27.9755	-82.5332
US	Virginia	FKN	Franklin Municipal-John Beverly Rose Airport	36.6981	-76.9038
US	North Dakota	MIB	Minot Air Force Base	48.4156	-101.358
US	Florida	TPF	Peter O. Knight Airport	27.9156	-82.4493
US	Minnesota	MIC	Crystal Airport	45.062	-93.3539
US	Nevada	TPH	Tonopah Airport	38.0602	-117.087
US	North Carolina	MEO	Dare County Regional Airport	35.919	-75.6955
US	Texas	MIF	Roy Hurd Memorial Airport	31.5825	-102.909
US	Pennsylvania	FKL	Venango Regional Airport (Chess Lamberton Field)	41.3779	-79.8604
US	Texas	TPL	Draughon-Miller Central Texas Regional Airport	31.1525	-97.4078
US	Tennessee	MEM	Memphis International Airport	35.0424	-89.9767
US	Pennsylvania	MEJ	Port Meadville Airport	41.6265	-80.2147
US	Mississippi	MEI	Meridian Regional Airport (Key Field)	32.3326	-88.7519
US	Utah	FIL	Fillmore Municipal Airport	38.9583	-112.363
US	New York	FID	Elizabeth Field	41.2513	-72.0316
US	Oklahoma	MIO	Miami Municipal Airport	36.9092	-94.8875
US	Nebraska	MIQ	Millard Airport	41.195	-96.1148
US	California	MIT	Shafter Airport (Minter Field)	35.5074	-119.192
US	New Jersey	MIV	Millville Municipal Airport	39.3678	-75.0722
US	Arizona	FHU	Sierra Vista Municipal Airport (Libby Army Airfield)	31.5885	-110.344
US	Iowa	MIW	Marshalltown Municipal Airport	42.1128	-92.9178
US	Kentucky	FFT	Capital City Airport	38.1825	-84.9047
US	Pennsylvania	MDT	Harrisburg International Airport	40.1935	-76.7634
US	Alaska	MDO	Middleton Island Airport	59.4499	-146.307
US	Ohio	FFO	Wright-Patterson Air Force Base	39.8261	-84.0483
US	Oregon	MDJ	Madras Municipal Airport	44.6702	-121.155
US	Minnesota	MJQ	Jackson Municipal Airport	43.65	-94.9867
US	California	TRH	Trona Airport	35.8125	-117.327
US	Tennessee	TRI	Tri-Cities Regional Airport	36.4752	-82.4074
US	Minnesota	FFM	Fergus Falls Municipal Airport (Einar Mickelson Field)	46.2844	-96.1567
US	Texas	TRL	Terrell Municipal Airport	32.7092	-96.2674
US	California	TRM	Jacqueline Cochran Regional Airport	33.6267	-116.16
US	Iowa	FFL	Fairfield Municipal Airport	41.0533	-91.9789
US	North Carolina	FFA	First Flight Airport	36.0182	-75.6713
US	Illinois	MDH	Southern Illinois Airport	37.7781	-89.252
US	Wisconsin	MDF	Taylor County Airport	45.101	-90.3033
US	Nebraska	FET	Fremont Municipal Airport	41.4491	-96.5202
US	Texas	MDD	Midland Airpark	32.0365	-102.101
US	Illinois	FEP	Albertus Airport	42.2462	-89.582
US	New Jersey	MJX	Robert J. Miller Air Park (Ocean County Airport)	39.9275	-74.2924
US	Missouri	TRX	Trenton Municipal Airport	40.0836	-93.5908
US	Iowa	MCW	Mason City Municipal Airport	43.1578	-93.3313
US	Missouri	MKC	Charles B. Wheeler Downtown Airport	39.1232	-94.5928
US	Wisconsin	MKE	General Mitchell International Airport	42.9472	-87.8966
US	Michigan	MKG	Muskegon County Airport	43.1695	-86.2382
US	Florida	MCO	Orlando International Airport	28.4294	-81.309
US	Ohio	FDY	Findlay Airport	41.0135	-83.6687
US	Alaska	TSG	Tanacross Airport	63.3744	-143.336
US	Oklahoma	FDR	Frederick Regional Airport	34.352	-98.9839
US	Maryland	FDK	Frederick Municipal Airport	39.4176	-77.3743
US	Hawaii	MKK	Molokai Airport	21.1529	-157.096
US	New Mexico	TSM	Taos Regional Airport	36.4582	-105.672
US	Tennessee	MKL	McKellar-Sipes Regional Airport	35.5999	-88.9156
US	California	TSP	Tehachapi Municipal Airport	35.135	-118.439
US	Oklahoma	MKO	Davis Field	35.6565	-95.3667
US	Georgia	MCN	Middle Georgia Regional Airport	32.6928	-83.6492
US	Alaska	MCL	McKinley National Park Airport	63.7326	-148.911
US	Nebraska	MCK	McCook Ben Nelson Regional Airport	40.2063	-100.592
US	Arkansas	FCY	Forrest City Municipal Airport	34.942	-90.775
US	Colorado	FCS	Butts Army Airfield (Fort Carson)	38.6784	-104.757
US	Minnesota	MKT	Mankato Regional Airport	44.2216	-93.9187
US	Missouri	MCI	Kansas City International Airport	39.2976	-94.7139
US	Minnesota	FCM	Flying Cloud Airport	44.8272	-93.4571
US	California	FCH	Fresno Chandler Executive Airport	36.7324	-119.82
US	Oregon	TTD	Portland-Troutdale Airport	45.5494	-122.401
US	Montana	FCA	Glacier Park International Airport	48.3105	-114.256
US	Alaska	MCG	McGrath Airport	62.9529	-155.606
US	Florida	MCF	MacDill Air Force Base	27.8493	-82.5212
US	Nebraska	FBY	Fairbury Municipal Airport	40.183	-97.1693
US	Washington	FBS	Friday Harbor Seaplane Base	48.5373	-123.01
US	Wyoming	FBR	Fort Bridger Airport	41.3919	-110.407
US	New Jersey	TTN	Trenton-Mercer Airport	40.2767	-74.8135
US	South Dakota	TTO	Britton Municipal Airport	45.8152	-97.7431
US	Minnesota	FBL	Faribault Municipal Airport	44.3284	-93.3125
US	California	MCE	Merced Regional Airport (MacReady Field)	37.2847	-120.514
US	Florida	MLB	Orlando Melbourne International Airport	28.1028	-80.6453
US	Oklahoma	MLC	McAlester Regional Airport	34.8824	-95.7835
US	Idaho	MLD	Malad City Airport	42.1666	-112.297
US	Alaska	FBK	Ladd Army Airfield	64.8375	-147.614
US	North Carolina	FBG	Simmons Army Airfield	35.1318	-78.9367
US	Utah	MLF	Milford Municipal Airport (Ben and Judy Briscoe Field)	38.6097	-112.986
US	North Carolina	FAY	Fayetteville Regional Airport (Grannis Field)	34.9912	-78.8803
US	Michigan	MCD	Mackinac Island Airport	45.8649	-84.6373
US	California	MCC	McClellan Airfield	38.6676	-121.401
US	Illinois	MLI	Quad City International Airport	41.4485	-90.5075
US	Georgia	MLJ	Baldwin County Airport	33.1542	-83.2407
US	California	FAT	Fresno Yosemite International Airport	36.7762	-119.718
US	Montana	MLK	Malta Airport	48.3669	-107.919
US	Oklahoma	TUL	Tulsa International Airport	36.1984	-95.8881
US	North Dakota	FAR	Hector International Airport	46.9207	-96.8158
US	Alaska	MLL	Marshall Don Hunter Sr. Airport	61.8643	-162.026
US	Mississippi	MCB	McComb-Pike County Airport (John E. Lewis Field)	31.1785	-90.4719
US	Mississippi	TUP	Tupelo Regional Airport	34.2681	-88.7699
US	Missouri	MBY	Omar N. Bradley Airport	39.4639	-92.427
US	Missouri	FAM	Farmington Regional Airport	37.7611	-90.4286
US	Arizona	TUS	Tucson International Airport	32.1161	-110.941
US	Montana	MLS	Miles City Airport (Frank Wiley Field)	46.428	-105.886
US	Maine	MLT	Millinocket Municipal Airport	45.6478	-68.6856
US	Alaska	FAK	False Island Seaplane Base	57.5322	-135.213
US	Louisiana	MLU	Monroe Regional Airport	32.5109	-92.0377
US	Massachusetts	FAJ	Diego Jimenez Torres Airport	18.3089	-65.6619
US	Alaska	MLY	Manley Hot Springs Airport	64.9976	-150.644
US	Michigan	TVC	Cherry Capital Airport	44.7414	-85.5822
US	Minnesota	TVF	Thief River Falls Regional Airport	48.0657	-96.185
US	Georgia	TVI	Thomasville Regional Airport	30.9016	-83.8813
US	California	TVL	Lake Tahoe Airport	38.8939	-119.995
US	Alaska	FAI	Fairbanks International Airport	64.8151	-147.856
US	Virginia	FAF	Felker Army Airfield	37.1325	-76.6088
US	Michigan	MBS	MBS International Airport	43.5329	-84.0796
US	Alaska	TWA	Twin Hills Airport	59.0756	-160.273
US	California	MMH	Mammoth Yosemite Airport	37.6241	-118.838
US	Washington	TWD	Jefferson County International Airport	48.0538	-122.811
US	Alaska	TWE	Taylor Airport	65.6793	-164.799
US	Idaho	TWF	Magic Valley Regional Airport (Joslin Field)	42.4818	-114.488
US	Tennessee	MMI	McMinn County Airport	35.3973	-84.5626
US	Michigan	MBL	Manistee County Blacker Airport	44.2724	-86.2469
US	Minnesota	MML	Southwest Minnesota Regional Airport (Marshall/Ryan Field)	44.4505	-95.8219
US	Massachusetts	MMN	Minute Man Air Field	42.4618	-71.5184
US	South Dakota	MBG	Mobridge Municipal Airport	45.5465	-100.408
US	Florida	EYW	Key West International Airport	24.5561	-81.7596
US	Arkansas	TXK	Texarkana Regional Airport (Webb Field)	33.4537	-93.991
US	Nevada	EYR	Yerington Municipal Airport	39.0041	-119.158
US	Mississippi	MMS	Selfs Airport	34.2315	-90.2896
US	South Carolina	MMT	McEntire Joint National Guard Base	33.9208	-80.8013
US	Alaska	EXI	Excursion Inlet Seaplane Base	58.4205	-135.449
US	New Jersey	MMU	Morristown Municipal Airport	40.7994	-74.4149
US	Massachusetts	MAZ	Eugenio Maria de Hostos Airport	18.2557	-67.1485
US	Alaska	TYE	Tyonek Airport	61.0767	-151.138
US	Missouri	MAW	Malden Regional Airport	36.6006	-89.9922
US	North Carolina	EWN	Coastal Carolina Regional Airport	35.073	-77.0429
US	Michigan	MNM	Menominee-Marinette Twin County Airport	45.1267	-87.6384
US	Kansas	EWK	Newton City/County Airport	38.0582	-97.2745
US	Massachusetts	EWB	New Bedford Regional Airport	41.6761	-70.9569
US	Wyoming	EVW	Evanston-Uinta County Burns Field	41.2748	-111.035
US	Minnesota	EVM	Eveleth-Virginia Municipal Airport	47.4251	-92.4985
US	Texas	TYR	Tyler Pounds Regional Airport	32.3541	-95.4024
US	Tennessee	TYS	McGhee Tyson Airport	35.811	-83.994
US	Arizona	TYZ	Taylor Airport	34.4528	-110.115
US	Ohio	MNN	Marion Municipal Airport	40.6162	-83.0635
US	Michigan	TZC	Tuscola Area Airport	43.4588	-83.4455
US	Alaska	MNT	Minto Al Wright Airport	65.1437	-149.37
US	Virginia	MNZ	Manassas Regional Airport	38.7214	-77.5154
US	Texas	EVA	Ben Bruce Memorial Airpark	30.321	-94.0735
US	Alabama	MOB	Mobile Regional Airport	30.6912	-88.2428
US	Texas	MAF	Midland International Air and Space Port	31.9425	-102.202
US	California	MOD	Modesto City-County Airport (Harry Sham Field)	37.6258	-120.954
US	California	MAE	Madera Municipal Airport	36.9886	-120.112
US	Georgia	MAC	Macon Downtown Airport	32.8221	-83.562
US	Georgia	LZU	Gwinnett County Airport (Briscoe Field)	33.9781	-83.9624
US	Oregon	EUG	Eugene Airport (Mahlon Sweet Airport)	44.1246	-123.212
US	Alabama	EUF	Weedon Field	31.9513	-85.1289
US	Michigan	MOP	Mount Pleasant Municipal Airport	43.6217	-84.7375
US	Georgia	MGR	Moultrie Municipal Airport	31.0849	-83.8033
US	Nevada	EUE	Eureka Airport	39.6042	-116.005
US	Tennessee	MOR	Morristown Regional Airport (Moore-Murrell Airport)	36.1795	-83.3752
US	Alabama	ETS	Enterprise Municipal Airport	31.2997	-85.8999
US	Texas	ETN	Eastland Municipal Airport	32.4135	-98.8098
US	Alaska	MOS	Moses Point Airport	47.777	10.623
US	Mississippi	UBS	Columbus-Lowndes County Airport	33.4654	-88.3803
US	Wisconsin	ETB	West Bend Municipal Airport	43.4222	-88.1279
US	Washington	ESW	Easton State Airport	47.2542	-121.186
US	North Dakota	MOT	Minot International Airport	48.2594	-101.28
US	Nevada	UCC	Yucca Airstrip	36.9458	-116.038
US	Louisiana	UCE	Eunice Airport	30.4663	-92.4238
US	Alaska	MOU	Mountain Village Airport	62.0954	-163.682
US	Minnesota	MOX	Morris Municipal Airport	45.5704	-95.9684
US	Florida	MPB	Miami Seaplane Base	25.7783	-80.1703
US	Tennessee	UCY	Everett-Stewart Regional Airport	36.3818	-88.9854
US	Iowa	EST	Estherville Municipal Airport	43.4074	-94.7464
US	California	UDD	Bermuda Dunes Airport	33.7484	-116.275
US	Arkansas	MPJ	Petit Jean Park Airport	35.1389	-92.9092
US	Pennsylvania	ESP	StroudsburgPocono Airport	41.0358	-75.1606
US	Minnesota	LYU	Ely Municipal Airport	47.8245	-91.8307
US	New Mexico	ESO	Ohkay Owingeh Airport	36.03	-106.046
US	Maryland	ESN	Easton Airport (Newnam Field)	38.8042	-76.069
US	Pennsylvania	MPO	Pocono Mountains Municipal Airport	41.1375	-75.3789
US	Kansas	MPR	McPherson Airport	38.3524	-97.6913
US	Texas	MPS	Mount Pleasant Regional Airport	32.8981	-79.7828
US	Vermont	MPV	Edward F. Knapp State Airport	44.2035	-72.5623
US	Wisconsin	UES	Waukesha County Airport (Crites Field)	43.041	-88.2371
US	Iowa	MPZ	Mount Pleasant Municipal Airport	40.9466	-91.5111
US	Kansas	LYO	Lyons-Rice County Municipal Airport	38.3428	-98.2269
US	Illinois	MQB	Macomb Municipal Airport	40.5201	-90.6524
US	Alaska	UGB	Ugashik Bay Airport	57.4254	-157.74
US	Alaska	UGI	San Juan (Uganik) Seaplane Base	57.7304	-153.321
US	Illinois	UGN	Waukegan National Airport	42.4222	-87.8679
US	Virginia	LYH	Lynchburg Regional Airport (Preston Glenn Field)	37.3267	-79.2004
US	Alaska	UGS	Ugashik Airport	57.5279	-157.399
US	Louisiana	ESF	Esler Airfield (Esler Regional Airport)	31.3949	-92.2958
US	Colorado	LXV	Lake County Airport	39.2203	-106.317
US	Washington	ESD	Orcas Island Airport	48.7082	-122.91
US	Michigan	MQT	Sawyer International Airport	46.3536	-87.3954
US	Washington	UIL	Quillayute Airport	47.9366	-124.563
US	Illinois	UIN	Quincy Regional Airport (Baldwin Field)	39.9427	-91.1946
US	Michigan	ESC	Delta County Airport	45.7227	-87.0937
US	Nebraska	LXN	Jim Kelly Field	40.791	-99.7773
US	Georgia	MQW	Telfair-Wheeler Airport	32.0946	-82.8822
US	Tennessee	MQY	Smyrna Airport	36.009	-86.5201
US	Illinois	LWV	Lawrenceville-Vincennes International Airport	38.7643	-87.6055
US	West Virginia	MRB	Eastern WV Regional Airport (Shepherd Field)	39.4019	-77.9846
US	Tennessee	MRC	Maury County Airport	35.5541	-87.1789
US	Oregon	MFR	Rogue Valley International-Medford Airport	42.3742	-122.873
US	Texas	ERV	Kerrville Municipal Airport (Louis Schreiner Field)	29.9767	-99.0857
US	Texas	MRF	Marfa Municipal Airport	30.3711	-104.018
US	California	UKI	Ukiah Municipal Airport	39.126	-123.201
US	Montana	LWT	Lewistown Municipal Airport	47.0493	-109.467
US	Iowa	UKN	Waukon Municipal Airport	43.2805	-91.4695
US	Alaska	MRI	Merrill Field	61.2135	-149.844
US	Pennsylvania	UKT	Quakertown Airport	40.4352	-75.3819
US	Idaho	LWS	Lewiston-Nez Perce County Airport	46.3745	-117.015
US	Florida	MRK	Marco Island Airport	25.995	-81.6725
US	North Carolina	MRN	Foothills Regional Airport (was Morganton-Lenoir Airport)	35.8202	-81.6114
US	Massachusetts	LWM	Lawrence Municipal Airport	42.7172	-71.1234
US	Nevada	LWL	Wells Municipal Airport (Harriet Field)	41.1171	-114.922
US	Minnesota	ULM	New Ulm Municipal Airport	44.3196	-94.5023
US	Kansas	LWC	Lawrence Municipal Airport	39.0112	-95.2166
US	West Virginia	LWB	Greenbrier Valley Airport	37.8583	-80.3995
US	California	MRY	Monterey Regional Airport	36.587	-121.843
US	New Hampshire	ERR	Errol Airport	44.7925	-71.1642
US	New Mexico	LVS	Las Vegas Municipal Airport	35.6542	-105.142
US	Montana	LVM	Mission Field	45.6994	-110.448
US	Arizona	MSC	Falcon Field Airport	33.4608	-111.728
US	Utah	MSD	Mount Pleasant Airport	39.5266	-111.476
US	Pennsylvania	ERI	Erie International Airport (Tom Ridge Field)	42.0831	-80.1739
US	Virginia	LVL	Lawrenceville/Brunswick Municipal Airport	36.7728	-77.7943
US	Alabama	MSL	Northwest Alabama Regional Airport	34.7453	-87.6102
US	California	LVK	Livermore Municipal Airport	37.6934	-121.82
US	Alaska	UMM	Summit Airport	63.3315	-149.127
US	Wisconsin	MSN	Dane County Regional Airport (Truax Field)	43.1399	-89.3375
US	Montana	MSO	Missoula International Airport	46.9163	-114.091
US	Alaska	UMT	Umiat Airport	69.3711	-152.136
US	Minnesota	MSP	Minneapolis-Saint Paul International Airport (Wold-Chamberlain Field)	44.882	-93.2218
US	New York	MSS	Massena International Airport (Richards Field)	44.9358	-74.8456
US	New York	MSV	Sullivan County International Airport	41.7016	-74.795
US	Alaska	LVD	Lime Village Airport	61.3591	-155.44
US	Louisiana	MSY	Louis Armstrong New Orleans International Airport	29.9934	-90.258
US	Alaska	LUR	Cape Lisburne LRRS Airport	68.8751	-166.11
US	Alaska	UNK	Unalakleet Airport	63.8884	-160.799
US	Michigan	MTC	Selfridge Air National Guard Base	42.6135	-82.8369
US	Hawaii	LUP	Kalaupapa Airport	21.211	-156.974
US	Wisconsin	UNU	Dodge County Airport	43.4266	-88.7032
US	Tennessee	UOS	Franklin County Airport	35.2051	-85.8981
US	Mississippi	UOX	University-Oxford Airport	34.3843	-89.5368
US	Washington	EPH	Ephrata Municipal Airport	47.3076	-119.516
US	Nebraska	EPG	Browns Airport	40.8675	-96.11
US	Mississippi	LUL	Hesler-Noble Field	31.6726	-89.1722
US	Hawaii	UPP	Upolu Airport	20.2653	-155.86
US	Missouri	EOS	Neosho Hugh Robinson Airport	36.8065	-94.391
US	Ohio	LUK	Cincinnati Municipal Airport (Lunken Field)	39.1033	-84.4186
US	Illinois	EOK	Keokuk Municipal Airport	40.4599	-91.4285
US	Wisconsin	ENW	Kenosha Regional Airport	42.5957	-87.9278
US	Utah	ENV	Wendover Airport	40.7187	-114.031
US	Florida	MTH	Florida Keys Marathon Airport	24.7261	-81.0514
US	Arizona	LUF	Luke Air Force Base	33.535	-112.383
US	Colorado	MTJ	Montrose Regional Airport	38.5098	-107.894
US	Alaska	MTM	Metlakatla Seaplane Base	55.131	-131.578
US	Maryland	MTN	Martin State Airport	39.3257	-76.4138
US	Alaska	ENN	Nenana Municipal Airport	64.5473	-149.074
US	Illinois	MTO	Coles County Memorial Airport	39.4779	-88.2792
US	New York	MTP	Montauk Airport	41.0765	-71.9208
US	Wisconsin	MTW	Manitowoc County Airport	44.1288	-87.6806
US	Illinois	ENL	Centralia Municipal Airport	38.5151	-89.0911
US	North Carolina	USA	Concord Regional Airport	35.3878	-80.7091
US	South Carolina	USC	Union County Airport/Troy Shelton Field	40.2249	-83.3519
US	Alaska	MTX	Metro Field	64.8068	-147.762
US	Oklahoma	END	Vance Air Force Base	36.3392	-97.9165
US	Maryland	LTW	St. Mary's County Regional Airport (Captain Walter Francis Duke Regional Airport)	38.3154	-76.5501
US	Alaska	ENA	Kenai Municipal Airport	60.5731	-151.245
US	Oklahoma	LTS	Altus Air Force Base	34.6671	-99.2667
US	Hawaii	MUE	Waimea-Kohala Airport	20.0013	-155.668
US	Pennsylvania	MUI	Muir Army Airfield	40.4348	-76.5694
US	Georgia	MUL	Spence Airport	31.1378	-83.7042
US	California	EMT	San Gabriel Valley Airport	34.0861	-118.035
US	Florida	UST	Northeast Florida Regional Airport	29.9592	-81.3398
US	Idaho	MUO	Mountain Home Air Force Base	43.0436	-115.872
US	Kansas	EMP	Emporia Municipal Airport	38.3321	-96.1912
US	Iowa	MUT	Muscatine Municipal Airport	41.3678	-91.1482
US	Nevada	LSV	Nellis Air Force Base	36.2362	-115.034
US	California	LSN	Los Banos Municipal Airport	37.0629	-120.869
US	Alabama	MVC	Monroe County Airport	31.458	-87.351
US	Wyoming	EMM	Kemmerer Municipal Airport	41.8241	-110.557
US	Minnesota	MVE	Montevideo-Chippewa County Airport	44.9691	-95.7103
US	Mississippi	UTM	Tunica Municipal Airport	34.681	-90.3467
US	Alaska	UTO	Indian Mountain LRRS Airport	65.9928	-153.704
US	Wyoming	LSK	Lusk Municipal Airport	42.7538	-104.405
US	Georgia	LSF	Lawson Army Airfield	32.3373	-84.9913
US	Vermont	MVL	Morrisville-Stowe State Airport	44.5346	-72.614
US	Arizona	MVM	Kayenta Airport	36.7164	-110.228
US	Illinois	MVN	Mount Vernon Airport	38.3219	-88.8535
US	Wisconsin	LSE	La Crosse Regional Airport	43.879	-91.2567
US	Alaska	UUK	Ugnu-Kuparuk Airport	70.3308	-149.598
US	New Mexico	LSB	Lordsburg Municipal Airport	32.3335	-108.692
US	New Mexico	LRU	Las Cruces International Airport	32.2894	-106.922
US	Texas	UVA	Garner Field	29.2113	-99.7436
US	Washington	MVW	Skagit Regional Airport	48.4709	-122.421
US	Massachusetts	MVY	Martha's Vineyard Airport	41.3931	-70.6143
US	Alaska	EMK	Emmonak Airport	62.7861	-164.491
US	Massachusetts	UWA	Ware Airport	42.282	-72.2148
US	Illinois	MWA	Williamson County Regional Airport	37.755	-89.0111
US	New York	ELZ	Wellsville Municipal Airport (Tarantine Field)	42.1095	-77.99
US	Iowa	LRJ	Le Mars Municipal Airport	42.778	-96.1937
US	Nevada	ELY	Ely Airport	39.2997	-114.842
US	Wisconsin	MWC	Lawrence J. Timmerman Airport	43.1104	-88.0344
US	Alaska	ELW	Ellamar Seaplane Base	60.8938	-146.704
US	Alaska	ELV	Elfin Cove Seaplane Base	58.1952	-136.347
US	Georgia	VAD	Moody Air Force Base	30.9678	-83.193
US	Washington	MWH	Grant County International Airport	47.2077	-119.32
US	Texas	ELP	El Paso International Airport	31.8072	-106.378
US	Texas	MWL	Mineral Wells Airport	32.7816	-98.0602
US	Alaska	VAK	Chevak Airport	61.5409	-165.6
US	Washington	ELN	Bowers Field	47.033	-120.531
US	Minnesota	MWM	Windom Municipal Airport	43.9134	-95.1094
US	Ohio	MWO	Middletown Regional Airport (Hook Field)	39.531	-84.3953
US	Arkansas	LRF	Little Rock Air Force Base	34.9169	-92.1497
US	New York	ELM	Elmira/Corning Regional Airport	42.1599	-76.8916
US	Texas	LRD	Laredo International Airport	27.5438	-99.4616
US	Arkansas	MXA	Manila Municipal Airport	35.8944	-90.1546
US	Oklahoma	ELK	Elk City Regional Business Airport	35.4308	-99.3943
US	Utah	MXC	Monticello Airport	37.9324	-109.341
US	South Dakota	LQK	Pickens County Airport	34.81	-82.7029
US	North Carolina	MXE	Laurinburg-Maxton Airport	34.7919	-79.3658
US	California	VBG	Vandenberg Air Force Base	34.7373	-120.584
US	Alabama	MXF	Maxwell Air Force Base	32.3829	-86.3658
US	Alaska	ELI	Elim Airport	64.6147	-162.272
US	Massachusetts	MXG	Marlboro Airport	42.3432	-71.509
US	Iowa	MXO	Monticello Regional Airport	42.2263	-91.1635
US	Washington	LPS	Fishermans Bay/LPS Seaplane Base	48.4839	-122.938
US	Arkansas	ELD	South Arkansas Regional Airport at Goodwin Field	33.221	-92.8133
US	Texas	ELA	Eagle Lake Airport	29.6006	-96.3219
US	Kentucky	EKX	Elizabethtown Regional Airport (Addington Field)	37.686	-85.925
US	Texas	VCT	Victoria Regional Airport	28.8526	-96.9185
US	California	VCV	Southern California Logistics Airport	34.5975	-117.383
US	Alaska	MXY	McCarthy Airport	61.4371	-142.904
US	California	MYF	Montgomery Field Airport	32.8157	-117.14
US	California	LPC	Lompoc Airport	34.6656	-120.468
US	Nevada	EKO	Elko Regional Airport	40.8249	-115.792
US	Georgia	VDI	Vidalia Regional Airport	32.1927	-82.3712
US	West Virginia	EKN	Elkins-Randolph County Airport	38.8894	-79.8571
US	Arizona	MYH	Marble Canyon Airport	36.8116	-111.642
US	Kentucky	LOZ	London-Corbin Airport (Magee Field)	37.0822	-84.0849
US	Alaska	VDZ	Valdez Airport (Pioneer Field)	61.1339	-146.248
US	Alaska	VEE	Venetie Airport	67.0087	-146.366
US	Utah	VEL	Vernal Regional Airport	40.4409	-109.51
US	Virginia	LOW	Louisa County Airport (Freeman Field)	38.0098	-77.9701
US	Alaska	MYK	May Creek Airport	61.3357	-142.687
US	North Dakota	VEX	Tioga Municipal Airport	48.3805	-102.898
US	California	EKA	Murray Field	40.8034	-124.113
US	Idaho	MYL	McCall Municipal Airport	44.8897	-116.101
US	Kentucky	LOU	Bowman Field	38.228	-85.6637
US	Illinois	LOT	Lewis University Airport	41.6073	-88.0962
US	Nevada	VGT	North Las Vegas Airport	36.2107	-115.194
US	South Carolina	MYR	Myrtle Beach International Airport	33.6797	-78.9283
US	Alaska	EIL	Eielson Air Force Base	64.6657	-147.102
US	Alaska	MYU	Mekoryuk Airport	60.3714	-166.271
US	Texas	VHN	Culberson County Airport	31.0578	-104.784
US	California	MYV	Yuba County Airport	39.0978	-121.57
US	Arizona	MZJ	Pinal Airpark	32.5106	-111.328
US	Nevada	LOL	Derby Field	40.0664	-118.565
US	Hawaii	LNY	Lanai Airport	20.7856	-156.951
US	Pennsylvania	LNS	Lancaster Airport	40.1217	-76.2961
US	Alaska	EHM	Cape Newenham LRRS Airport	58.6464	-162.063
US	Alaska	EGX	Egegik Airport	58.1855	-157.375
US	Missouri	VIH	Rolla National Airport	38.1274	-91.7695
US	Wisconsin	LNR	Tri-County Regional Airport	43.2117	-90.1816
US	Virginia	LNP	Lonesome Pine Airport	36.9875	-82.53
US	Ohio	LNN	Lost Nation Airport	41.684	-81.3897
US	California	VIS	Visalia Municipal Airport	36.3187	-119.393
US	Wisconsin	EGV	Eagle River Union Airport	45.9323	-89.2683
US	Nebraska	LNK	Lincoln Airport	40.851	-96.7592
US	Alaska	LNI	Point Lonely Short Range Radar Site	70.9107	-153.242
US	Texas	EGP	Maverick County Memorial International Airport	28.8572	-100.512
US	Wyoming	LND	Hunt Field	42.8152	-108.73
US	Florida	LNA	Palm Beach County Park Airport	26.593	-80.0851
US	Virginia	VJI	Virginia Highlands Airport	36.6871	-82.0333
US	Oregon	LMT	Klamath Falls Airport	42.1561	-121.733
US	Mississippi	LMS	Louisville Winston County Airport	33.1462	-89.0625
US	Mississippi	VKS	Vicksburg Municipal Airport	32.2393	-90.9284
US	Louisiana	NBG	NAS JRB New Orleans (Alvin Callender Field)	29.8253	-90.035
US	Illinois	VLA	Vandalia Municipal Airport	38.9915	-89.1662
US	Texas	MGI	Aransas National Wildlife Refuge Airport	28.323	-96.464
US	Georgia	VLD	Valdosta Regional Airport	30.7825	-83.2767
US	Arizona	VLE	Valle Airport	35.6506	-112.148
US	Alaska	LMA	Lake Minchumina Airport	63.886	-152.302
US	New Jersey	LLY	South Jersey Regional Airport	39.9429	-74.8457
US	Florida	EGI	Duke Field (Eglin Auxiliary Field 3)	30.6504	-86.5229
US	Colorado	EGE	Eagle County Regional Airport	39.6426	-106.918
US	Iowa	EFW	Jefferson Municipal Airport	42.0102	-94.3426
US	Vermont	EFK	Newport State Airport	44.8888	-72.2292
US	Vermont	LLX	Caledonia County Airport	44.5691	-72.018
US	Alaska	NCN	Chenega Bay Airport	60.0773	-147.992
US	Texas	EFD	Ellington Field	29.6073	-95.1588
US	Rhode Island	NCO	Quonset State Airport	41.5971	-71.4121
US	Oregon	LKV	Lake County Airport	42.1611	-120.399
US	New York	LKP	Lake Placid Airport	44.2645	-73.9619
US	Florida	VNC	Venice Municipal Airport	27.0716	-82.4403
US	New Hampshire	EEN	Dillant-Hopkins Airport	42.8984	-72.2708
US	New York	MGJ	Orange County Airport	41.51	-74.2646
US	Alaska	EEK	Eek Airport	60.2137	-162.044
US	California	EED	Needles Airport	34.7663	-114.623
US	Alaska	LKK	Kulik Lake Airport	58.9821	-155.121
US	Washington	LKE	Kenmore Air Harbor Seaplane Base (Seattle Lake Union SPB)	47.629	-122.339
US	California	VNY	Van Nuys Airport	34.2098	-118.49
US	California	EDW	Edwards Air Force Base	34.9054	-117.884
US	Texas	LJN	Texas Gulf Coast Regional Airport	29.1086	-95.4621
US	Maine	LIZ	Loring International Airport	46.9504	-67.8859
US	Georgia	LIY	MidCoast Regional Airport at Wright Army Airfield	31.8891	-81.5623
US	Wisconsin	VOK	Volk Field Air National Guard Base	43.939	-90.2534
US	Kansas	EDK	Captain Jack Thomas/El Dorado Airport	37.7741	-96.8176
US	Alaska	EDF	Elmendorf Air Force Base	61.251	-149.807
US	New Jersey	NEL	NAES Lakehurst (Maxfield Field)	40.0333	-74.3533
US	North Carolina	EDE	Northeastern Regional Airport	36.0277	-76.5671
US	Florida	NEN	NOLF Whitehouse	30.3539	-81.8719
US	Florida	VPS	Destin-Fort Walton Beach Airport / Eglin Air Force Base	30.4832	-86.5254
US	Louisiana	NEW	Lakefront Airport	30.0424	-90.0283
US	Alaska	EDA	Edna Bay Seaplane Base	55.9497	-133.661
US	Florida	VQQ	Cecil Airport	30.2187	-81.8767
US	Massachusetts	VQS	Antonio Rivera Rodriguez Airport	18.1348	-65.4936
US	Wyoming	ECS	Mondell Field	43.8854	-104.318
US	Florida	VRB	Vero Beach Regional Airport	27.6556	-80.4179
US	Nevada	NFL	NAS Fallon (Van Voorhis Field)	39.4166	-118.701
US	Alaska	LIV	Livengood Camp Airport	65.467	-148.653
US	Florida	ECP	Northwest Florida Beaches International Airport	30.3571	-85.7954
US	Arkansas	LIT	Clinton National Airport (Adams Field)	34.7294	-92.2243
US	Hawaii	NGF	MCAS Kaneohe Bay	21.4505	-157.768
US	North Carolina	ECG	Elizabeth City Regional Airport	36.2606	-76.1746
US	Missouri	VRS	Roy Otten Memorial Airfield	38.4278	-92.8752
US	Texas	NGP	NAS Corpus Christi (Truax Field)	27.6926	-97.2911
US	Hawaii	LIH	Lihue Airport	21.976	-159.339
US	Vermont	VSF	Hartness State Airport	43.3436	-72.5173
US	Virginia	NGU	NS Norfolk (Chambers Field)	36.9376	-76.2893
US	Texas	NGW	NOLF Cabaniss Field	27.7027	-97.4389
US	Michigan	ECA	Iosco County Airport	44.3128	-83.4223
US	Colorado	LIC	Limon Municipal Airport	39.2748	-103.666
US	Iowa	EBS	Webster City Municipal Airport	42.4366	-93.8689
US	Maryland	NHK	NAS Patuxent River (Trapnell Field)	38.286	-76.4118
US	Pennsylvania	LHV	William T. Piper Memorial Airport	41.1356	-77.4223
US	Nebraska	VTN	Miller Field	42.8578	-100.548
US	Alabama	NHX	NOLF Barin	30.3891	-87.6353
US	Maine	NHZ	Brunswick Executive Airport	43.8922	-69.9386
US	Alaska	NIB	Nikolai Airport	63.0186	-154.358
US	Alaska	NIN	Ninilchik Airport	60.0207	-151.591
US	Florida	NIP	NAS Jacksonville (Towers Field)	30.2358	-81.6806
US	Texas	NIR	Chase Field Industrial Complex	28.3624	-97.6619
US	Wisconsin	EAU	Chippewa Valley Regional Airport	44.8658	-91.4843
US	Washington	EAT	Pangborn Memorial Airport	47.3989	-120.207
US	Utah	LGU	Logan-Cache Airport	41.7912	-111.852
US	California	NJK	NAF El Centro	32.8292	-115.672
US	Arizona	LGF	Laguna Army Airfield	32.86	-114.397
US	Nebraska	EAR	Kearney Regional Airport	40.727	-99.0068
US	Oregon	LGD	La Grande/Union County Airport	45.2902	-118.007
US	Wyoming	EAN	Phifer Airfield	42.0555	-104.929
US	Alaska	NKI	Naukati Bay Seaplane Base	55.8496	-133.228
US	Georgia	LGC	LaGrange Callaway Airport	33.0089	-85.0726
US	Illinois	VYS	Illinois Valley Regional Airport (Walter A. Duncan Field)	41.3519	-89.1531
US	Alaska	WAA	Wales Airport	65.6226	-168.095
US	California	LGB	Long Beach Airport	33.8177	-118.152
US	California	NKX	MCAS Miramar	32.8684	-117.143
US	California	NLC	NAS Lemoore (Reeves Field)	36.333	-119.952
US	North Dakota	WAH	Harry Stern Airport	46.2441	-96.6074
US	Michigan	NLE	Jerry Tyler Memorial Airport	41.8359	-86.2252
US	Louisiana	LFT	Lafayette Regional Airport	30.2053	-91.9876
US	Virginia	WAL	Wallops Flight Facility	37.9402	-75.4664
US	Alaska	NLG	Nelson Lagoon Airport	56.0075	-161.16
US	North Carolina	LFN	Triangle North Executive Airport (Franklin County Airport)	36.0233	-78.3303
US	California	NLN	Kneeland Airport	40.7193	-123.928
US	Texas	LFK	Angelina County Airport	31.234	-94.75
US	Virginia	LFI	Langley Air Force Base	37.0829	-76.3605
US	Kentucky	LEX	Blue Grass Airport	38.0365	-84.6059
US	Alaska	NME	Nightmute Airport	60.471	-164.701
US	Pennsylvania	WAY	Greene County Airport	39.9001	-80.1331
US	Maine	LEW	Auburn/Lewiston Municipal Airport	44.0485	-70.2835
US	Alaska	WBB	Stebbins Airport	63.516	-162.278
US	South Dakota	LEM	Lemmon Municipal Airport	45.9187	-102.106
US	Alaska	NNK	Naknek Airport	58.7329	-157.02
US	Michigan	WBK	West Branch Community Airport	44.2448	-84.1798
US	Alaska	NNL	Nondalton Airport	59.9802	-154.839
US	Florida	LEE	Leesburg International Airport	28.8231	-81.8087
US	Alaska	WBQ	Beaver Airport	66.3622	-147.407
US	Michigan	WBR	Roben-Hood Airport	43.7226	-85.5041
US	Colorado	WBU	Boulder Municipal Airport	40.0394	-105.226
US	Pennsylvania	WBW	Wilkes-Barre Wyoming Valley Airport	41.2972	-75.8512
US	New Hampshire	LEB	Lebanon Municipal Airport	43.6261	-72.3042
US	Texas	DYS	Dyess Air Force Base	32.4208	-99.8546
US	Alaska	WCR	Chandalar Lake Airport	67.5045	-148.483
US	Oklahoma	WDG	Enid Woodring Regional Airport	36.3792	-97.7911
US	Michigan	LDM	Mason County Airport	43.9625	-86.4079
US	New Jersey	LDJ	Linden Airport	40.6174	-74.2446
US	Washington	WDN	Waldronaire Airport	48.7118	-123.018
US	Georgia	WDR	Barrow County Airport	33.9829	-83.6674
US	Pennsylvania	DYL	Doylestown Airport	40.333	-75.1223
US	Texas	WEA	Parker County Airport	32.7463	-97.6824
US	Connecticut	DXR	Danbury Municipal Airport	41.3715	-73.4822
US	Mississippi	DXE	Bruce Campbell Field	32.4387	-90.1031
US	California	NOT	Marin County Airport (Gnoss Field)	38.1436	-122.556
US	Texas	DWH	David Wayne Hooks Memorial Airport	30.0618	-95.5528
US	Alaska	WFB	Ketchikan Harbor Seaplane Base	55.3499	-131.677
US	Florida	NPA	NAS Pensacola (Forrest Sherman Field)	30.3527	-87.3186
US	Maine	WFK	Northern Aroostook Regional Airport	47.2855	-68.3128
US	Utah	NPH	Nephi Municipal Airport	39.7388	-111.872
US	Florida	LCQ	Lake City Gateway Airport	30.182	-82.5769
US	Ohio	LCK	Rickenbacker International Airport	39.8138	-82.9278
US	Arizona	DVT	Phoenix Deer Valley Airport	33.6883	-112.083
US	Virginia	WGO	Winchester Regional Airport	39.1435	-78.1444
US	Rhode Island	NPT	Newport State Airport	41.5324	-71.2815
US	Illinois	DVN	Davenport Municipal Airport	41.6103	-90.5883
US	Alaska	WHD	Hyder Seaplane Base	55.9033	-130.01
US	Tennessee	NQA	Millington Regional Jetport	35.3567	-89.8703
US	Texas	NQI	NAS Kingsville	27.5072	-97.8097
US	North Dakota	DVL	Devils Lake Regional Airport (Devils Lake Municipal Airport)	48.1142	-98.9088
US	New Hampshire	LCI	Laconia Municipal Airport	43.5727	-71.4189
US	California	WHP	Whiteman Airport	34.2593	-118.413
US	Louisiana	LCH	Lake Charles Regional Airport	30.1261	-93.2233
US	Texas	WHT	Wharton Regional Airport	29.2543	-96.1544
US	Alaska	DUT	Unalaska Airport	53.9001	-166.544
US	Florida	NQX	NAS Key West (Boca Chica Field)	24.5758	-81.6889
US	Florida	NRB	NS Mayport (Admiral David L. McDonald Field)	30.3911	-81.4247
US	Pennsylvania	DUJ	DuBois Regional Airport	41.1783	-78.8987
US	Arizona	DUG	Bisbee Douglas International Airport	31.469	-109.604
US	California	NRC	NASA Crows Landing Airport	37.408	-121.109
US	North Carolina	DUF	Pine Island Airport	36.2535	-75.7885
US	North Carolina	LBT	Lumberton Municipal Airport	34.6099	-79.0594
US	California	WJF	General William J. Fox Airfield	34.7411	-118.219
US	Kansas	LBL	Liberal Mid-America Regional Airport	37.0442	-100.96
US	Oklahoma	NRI	Grand Lake Regional Airport	36.5776	-94.8619
US	Nebraska	LBF	North Platte Regional Airport (Lee Bird Field)	41.1262	-100.684
US	Pennsylvania	LBE	Arnold Palmer Regional Airport	40.2759	-79.4048
US	Oklahoma	DUC	Halliburton Field	34.4709	-97.9599
US	Alaska	WKK	Aleknagik Airport	59.2826	-158.618
US	Hawaii	WKL	Waikoloa Heliport	19.9205	-155.861
US	Oklahoma	DUA	Durant Regional Airport-Eaker Field	33.9423	-96.3945
US	Kansas	WLD	Strother Field	37.1686	-97.0376
US	Washington	DTR	Decatur Shores Airport	48.4998	-122.814
US	Massachusetts	NRR	Jose Aponte de la Torre Airport	18.2453	-65.6434
US	Alaska	WLK	Selawik Airport	66.6001	-159.986
US	Louisiana	DTN	Shreveport Downtown Airport	32.5402	-93.745
US	Minnesota	DTL	Detroit Lakes Airport (Wething Field)	46.8252	-95.8857
US	California	DTH	Furnace Creek Airport	36.4638	-116.881
US	Alaska	WLR	Loring Seaplane Base	55.6013	-131.637
US	California	WLW	Willows-Glenn County Airport	39.5164	-122.218
US	California	NRS	NOLF Imperial Beach (Ream Field)	32.5667	-117.117
US	Texas	LBB	Lubbock Preston Smith International Airport	33.6636	-101.823
US	Nevada	WMC	Winnemucca Municipal Airport	40.8966	-117.806
US	Florida	NSE	NAS Whiting Field - North	30.7242	-87.0219
US	Utah	DTA	Delta Municipal Airport	39.3806	-112.508
US	Arkansas	WMH	Ozark Regional Airport	36.3689	-92.4705
US	California	LAX	Los Angeles International Airport	33.9425	-118.408
US	Alaska	WMK	Meyers Chuck Seaplane Base	55.7396	-132.255
US	Oklahoma	LAW	Lawton-Fort Sill Regional Airport	34.5677	-98.4166
US	Minnesota	NSL	Slayton Municipal Airport	43.9868	-95.7826
US	Alaska	WMO	White Mountain Airport	64.6892	-163.413
US	Nevada	LAS	Harry Reid International Airport	36.0801	-115.152
US	Wyoming	LAR	Laramie Regional Airport	41.3121	-105.675
US	California	NTD	NAS Point Mugu (Naval Base Ventura County)	34.1203	-119.121
US	Alaska	WNA	Napakiak Airport	60.6903	-161.979
US	New York	DSV	Dansville Municipal Airport	42.5709	-77.7131
US	Michigan	LAN	Capital Region International Airport	42.7787	-84.5874
US	New Mexico	LAM	Los Alamos County Airport	35.8798	-106.269
US	Utah	NTJ	Manti-Ephraim Airport	39.3291	-111.615
US	Iowa	DSM	Des Moines International Airport	41.534	-93.6631
US	Florida	LAL	Lakeland Linder International Airport	27.9889	-82.0186
US	Colorado	LAA	Lamar Municipal Airport	38.0697	-102.688
US	Virginia	NTU	NAS Oceana (Apollo Soucek Field)	36.8207	-76.0335
US	Florida	DSI	Destin Executive Airport	30.4001	-86.4715
US	Alaska	NUI	Nuiqsut Airport	70.21	-151.006
US	Alaska	NUL	Nulato Airport	64.7293	-158.074
US	Florida	NUN	NOLF Saufley Field	30.4694	-87.3381
US	Alaska	WOW	Willow Airport	61.7542	-150.052
US	Alaska	NUP	Nunapitchuk Airport	60.9056	-162.44
US	California	NUQ	Moffett Federal Airfield	37.4161	-122.049
US	Montana	DRU	Drummond Airport	46.6208	-113.205
US	Texas	DRT	Del Rio International Airport	29.3742	-100.927
US	Colorado	DRO	Durango-La Plata County Airport	37.1515	-107.754
US	Alaska	KZB	Zachar Bay Seaplane Base	57.553	-153.746
US	Colorado	WPO	North Fork Valley Airport	38.8317	-107.646
US	Washington	NUW	NAS Whidbey Island (Ault Field)	48.3518	-122.656
US	Louisiana	DRI	Beauregard Regional Airport	30.8317	-93.3399
US	Alaska	DRG	Deering Airport	66.0696	-162.766
US	Georgia	WRB	Robins Air Force Base	32.6401	-83.5919
US	Missouri	NVD	Nevada Municipal Airport	37.853	-94.3045
US	Alaska	WRG	Wrangell Airport	56.4843	-132.37
US	New Jersey	WRI	McGuire Air Force Base	40.0156	-74.5917
US	Wyoming	WRL	Worland Municipal Airport	43.9657	-107.951
US	Alaska	DRF	Drift River Airport	60.5889	-152.162
US	California	NVN	Nervino Airport	39.8185	-120.353
US	Michigan	DRE	Drummond Island Airport	46.0093	-83.7439
US	Nevada	DRA	Desert Rock Airport	36.6194	-116.033
US	Alaska	KYU	Koyukuk Airport	64.8761	-157.727
US	Alaska	WSB	Steamboat Bay Seaplane Base	55.5296	-133.642
US	New Mexico	WSD	Condron Army Airfield	32.3415	-106.403
US	Alaska	WSF	Cape Sarichef Airport	61.1821	-149.863
US	Pennsylvania	WSG	Washington County Airport	40.1365	-80.2902
US	New York	WSH	Brookhaven Airport	40.8219	-72.8694
US	Alaska	WSM	Wiseman Airport	67.4046	-150.123
US	Alaska	WSN	South Naknek Airport	58.7034	-157.008
US	New Hampshire	NWH	Parlin Field	40.4625	-74.3306
US	Florida	KYO	Tampa North Aero Park	28.2213	-82.3745
US	Rhode Island	WST	Westerly State Airport	41.3496	-71.8034
US	Washington	WSX	Westsound Seaplane Base	48.6179	-122.953
US	Virginia	MFV	Accomack County Airport	37.6469	-75.7611
US	Virginia	NYG	MCAF Quantico (Turner Field)	38.5017	-77.3053
US	Alaska	KYK	Karluk Airport	57.5671	-154.45
US	Utah	DPG	Michael Army Airfield	40.1994	-112.937
US	Alabama	MGM	Montgomery Regional Airport (Dannelly Field)	32.3006	-86.394
US	Alaska	WTK	Noatak Airport	67.5661	-162.975
US	Alaska	WTL	Tuntutuliak Airport	60.3353	-162.667
US	Illinois	DPA	DuPage Airport	41.9078	-88.2486
US	California	NZY	NAS North Island (Halsey Field)	32.6992	-117.215
US	Alaska	KXA	Kasaan Seaplane Base	55.5374	-132.398
US	Arizona	WTR	Whiteriver Airport	33.8125	-109.987
US	Alaska	KWT	Kwethluk Airport	60.7903	-161.444
US	North Carolina	OAJ	Albert J. Ellis Airport	34.8292	-77.6121
US	Delaware	DOV	Dover Air Force Base	39.1295	-75.466
US	California	OAK	Oakland International Airport	37.7213	-122.221
US	Alaska	KWP	West Point Village Seaplane Base	57.7701	-153.549
US	California	OAR	Marina Municipal Airport	36.6819	-121.762
US	Alaska	KWN	Quinhagak Airport	59.7551	-161.845
US	Alaska	KWK	Kwigillingok Airport	59.8765	-163.169
US	Florida	OBE	Okeechobee County Airport	27.2628	-80.8498
US	Alaska	KWF	Waterfall Seaplane Base	55.2963	-133.243
US	Alaska	OBU	Kobuk Airport	66.9123	-156.897
US	Florida	OCA	Ocean Reef Club Airport	25.3254	-80.2748
US	Alaska	KVL	Kivalina Airport	67.7362	-164.563
US	California	WVI	Watsonville Municipal Airport	36.9357	-121.79
US	Maryland	OCE	Ocean City Municipal Airport	38.3104	-75.124
US	Maine	WVL	Waterville Robert LaFleur Airport	44.5332	-69.6755
US	Illinois	DNV	Vermilion Regional Airport	40.1992	-87.5959
US	Alaska	WWA	Wasilla Airport	61.5717	-149.54
US	New Jersey	WWD	Cape May Airport	39.0085	-74.9083
US	Iowa	DNS	Denison Municipal Airport	41.9864	-95.3807
US	Florida	OCF	Ocala International Airport (Jim Taylor Field)	29.1726	-82.2242
US	Alaska	WWP	North Whale Seaplane Base	56.1163	-133.122
US	Oklahoma	WWR	West Woodward Airport	36.438	-99.5227
US	Alaska	WWT	Newtok Airport	60.9391	-164.641
US	Texas	OCH	A.L. Mangham Jr. Regional Airport	31.578	-94.7095
US	Georgia	DNN	Dalton Municipal Airport	34.7229	-84.8702
US	Georgia	DNL	Daniel Field	33.4665	-82.0394
US	Alaska	WYB	Yes Bay Lodge Seaplane Base	55.9163	-131.801
US	California	OCN	Oceanside Municipal Airport	33.2173	-117.354
US	Alaska	KVC	King Cove Airport	55.1163	-162.266
US	Montana	WYS	Yellowstone Airport	44.6884	-111.118
US	North Carolina	OCW	Washington-Warren Airport (Warren Field)	35.5705	-77.0498
US	California	ODC	Oakdale Airport	37.7563	-120.8
US	Missouri	DMO	Sedalia Regional Airport	38.7074	-93.1759
US	New Mexico	DMN	Deming Municipal Airport	32.2623	-107.721
US	Alaska	KUK	Kasigluk Airport	60.8744	-162.524
US	West Virginia	ODM	Garrett County Airport	39.2808	-79.3374
US	Washington	ODW	A.J. Eisenberg Airport	48.2515	-122.674
US	Wisconsin	OEO	L.O. Simenstad Municipal Airport	45.31	-92.6919
US	Arizona	DMA	Davis-Monthan Air Force Base	32.1665	-110.883
US	Nebraska	OFF	Offutt Air Force Base	41.1183	-95.9125
US	Oregon	DLS	Columbia Gorge Regional Airport (The Dalles Municipal Airport)	45.6185	-121.167
US	Montana	DLN	Dillon Airport	45.2554	-112.553
US	Nebraska	OFK	Norfolk Regional Airport (Karl Stefan Memorial Field)	41.9855	-97.4351
US	Nebraska	OGA	Searle Field	41.1195	-101.77
US	South Carolina	DLL	Dillon County Airport	34.4491	-79.3686
US	Minnesota	DLH	Duluth International Airport	46.8421	-92.1936
US	Alaska	DLG	Dillingham Airport	59.0447	-158.505
US	Texas	DLF	Laughlin Air Force Base	29.3595	-100.778
US	Wisconsin	XES	Grand Geneva Resort Airport	42.6149	-88.3896
US	South Carolina	OGB	Orangeburg Municipal Airport	33.4568	-80.8595
US	Utah	OGD	Ogden-Hinckley Airport	41.1959	-112.012
US	New York	DKK	Chautauqua County/Dunkirk Airport	42.4933	-79.272
US	Hawaii	OGG	Kahului Airport	20.8986	-156.43
US	Alaska	DJN	Delta Junction Airport	64.0504	-145.717
US	New York	OGS	Ogdensburg International Airport	44.6819	-75.4655
US	Alaska	KTS	Brevig Mission Airport	65.3313	-166.466
US	Alaska	KTN	Ketchikan International Airport	55.3556	-131.714
US	New York	OIC	Lt. Warren Eaton Airport	42.5666	-75.5241
US	Alaska	KTH	Tikchik Lodge Seaplane Base	59.9632	-158.477
US	North Dakota	DIK	Dickinson Theodore Roosevelt Regional Airport	46.7974	-102.802
US	Texas	DHT	Dalhart Municipal Airport	36.0226	-102.547
US	Kansas	OJC	Johnson County Executive Airport	38.8476	-94.7376
US	Alaska	KTB	Thorne Bay Seaplane Base	55.688	-132.537
US	Oklahoma	OKC	Will Rogers World Airport	35.3931	-97.6007
US	Oklahoma	OKM	Okmulgee Regional Airport	35.6681	-95.9487
US	Alabama	DHN	Dothan Regional Airport	31.3213	-85.4496
US	Alaska	KSM	St. Mary's Airport	62.0605	-163.302
US	Nebraska	OKS	Garden County Airport	41.401	-102.355
US	Washington	DHB	Deer Harbor Sea Plane Base	48.6167	-123.003
US	Maine	OLD	Old Town Municipal Airport and Seaplane Base (Dewitt Field)	44.9528	-68.6743
US	New York	OLE	Cattaraugus County-Olean Airport	42.2422	-78.3716
US	Wyoming	DGW	Converse County Airport	42.7972	-105.386
US	South Dakota	XMD	Madison Municipal Airport	44.016	-97.0859
US	Montana	OLF	L. M. Clayton Airport	48.0945	-105.575
US	Alaska	OLH	Old Harbor Airport	57.2181	-153.27
US	Washington	OLM	Olympia Regional Airport	46.9694	-122.903
US	Arizona	OLS	Nogales International Airport	31.4177	-110.848
US	Nebraska	OLU	Columbus Municipal Airport	41.448	-97.3426
US	Mississippi	OLV	Olive Branch Airport	34.9787	-89.7869
US	Illinois	OLY	Olney-Noble Airport	38.7207	-88.1749
US	Virginia	DGN	Naval Surface Warfare Center Dahlgren Division	38.3325	-77.0372
US	Arkansas	XNA	Northwest Arkansas Regional Airport	36.2819	-94.3068
US	Iowa	OMA	Eppley Airfield	41.3032	-95.8941
US	Arizona	DGL	Douglas Municipal Airport	31.3426	-109.506
US	Texas	DFW	Dallas/Fort Worth International Airport	32.8968	-97.038
US	Ohio	DFI	Defiance Memorial Airport	41.3375	-84.4288
US	Alaska	OME	Nome Airport	64.5122	-165.445
US	Washington	OMK	Omak Airport	48.4644	-119.518
US	South Dakota	XPR	Pine Ridge Airport	43.0225	-102.511
US	Colorado	DEN	Denver International Airport	39.8617	-104.673
US	Minnesota	ONA	Winona Municipal Airport (Max Conrad Field)	44.0772	-91.7083
US	Iowa	DEH	Decorah Municipal Airport	43.2755	-91.7394
US	Alaska	KQA	Akutan Seaplane Base	54.1338	-165.779
US	Illinois	DEC	Decatur Airport	39.8346	-88.8657
US	New York	ONH	Oneonta Municipal Airport	42.5247	-75.0644
US	Alaska	KPY	Port Bailey Seaplane Base	57.9301	-153.041
US	Nevada	XSD	Tonopah Test Range Airport	37.7988	-116.781
US	Nebraska	ONL	O'Neill Municipal Airport (John L. Baker Field)	42.4699	-98.6881
US	Kansas	DDC	Dodge City Regional Airport	37.7634	-99.9656
US	New Mexico	ONM	Socorro Municipal Airport	34.024	-106.898
US	Oregon	ONO	Ontario Municipal Airport	44.0205	-117.014
US	Alabama	DCU	Pryor Field Regional Airport	34.6527	-86.9454
US	Alaska	DCK	Dahl Creek Airport	66.9433	-156.905
US	Oregon	ONP	Newport Municipal Airport	44.5804	-124.058
US	Idaho	DBS	Dubois Municipal Airport	44.1666	-112.226
US	Alaska	KPV	Perryville Airport	55.906	-159.163
US	California	ONT	Ontario International Airport	34.056	-117.601
US	Iowa	DBQ	Dubuque Regional Airport	42.402	-90.7095
US	Georgia	DBN	W. H. 'Bud' Barron Airport	32.5644	-82.9853
US	Nevada	KPT	Jackpot Airport (Hayden Field)	41.976	-114.658
US	Texas	ONY	Olney Municipal Airport	33.3522	-98.7915
US	Ohio	DAY	Dayton International Airport	39.9024	-84.2194
US	Iowa	OOA	Oskaloosa Municipal Airport	41.0048	-93.3096
US	Alaska	OOK	Toksook Bay Airport	60.5414	-165.087
US	Alaska	KPR	Port Williams Seaplane Base	58.4901	-152.582
US	Alaska	KPN	Kipnuk Airport	59.933	-164.031
US	Alaska	YAK	Yakutat Airport	59.5033	-139.66
US	Virginia	DAN	Danville Regional Airport	36.5729	-79.3361
US	Florida	OPF	Miami-Opa Locka Executive Airport	25.907	-80.2784
US	Texas	DAL	Dallas Love Field	32.8471	-96.8518
US	California	DAG	Barstow-Daggett Airport	34.8537	-116.787
US	Florida	DAB	Daytona Beach International Airport	29.1799	-81.0581
US	Virginia	DAA	Davison Army Airfield	38.715	-77.181
US	Alaska	KPC	Port Clarence Coast Guard Station	65.2537	-166.859
US	Texas	CZT	Dimmit County Airport	28.5222	-99.8236
US	Alaska	CZP	Cape Pole Seaplane Base	55.9663	-133.797
US	Alaska	CZO	Chistochina Airport	62.5635	-144.669
US	Alaska	CZN	Chisana Airport	62.0712	-142.048
US	Louisiana	OPL	St. Landry Parish Airport (Ahart Field)	30.5584	-92.0994
US	Oregon	CZK	Cascade Locks State Airport	45.6769	-121.879
US	Alaska	KPB	Point Baker Seaplane Base	56.3519	-133.623
US	Alaska	CZF	Cape Romanzof LRRS Airport	61.7803	-166.039
US	Alaska	CZC	Copper Center 2 Airport	61.9412	-145.294
US	Alaska	KOZ	Ouzinkie Airport	57.9254	-152.497
US	Alaska	KOY	Olga Bay Seaplane Base	57.1615	-154.23
US	Virginia	ORF	Norfolk International Airport	36.8946	-76.2012
US	Massachusetts	ORH	Worcester Regional Airport	42.2673	-71.8757
US	Alaska	CYT	Yakataga Airport	60.081	-142.495
US	Wyoming	CYS	Cheyenne Regional Airport (Jerry Olson Field)	41.1557	-104.812
US	Alaska	ORI	Port Lions Airport	57.8853	-152.846
US	Alaska	CYM	Chatham Seaplane Base	57.5149	-134.946
US	Alaska	KOT	Kotlik Airport	63.0306	-163.533
US	Alaska	CYF	Chefornak Airport	60.1492	-164.286
US	Florida	ORL	Orlando Executive Airport	28.5455	-81.3329
US	Texas	CXO	Lone Star Executive Airport	30.3518	-95.4145
US	Hawaii	KOA	Kona International Airport at Keahole	19.7388	-156.046
US	California	CXL	Calexico International Airport	32.6695	-115.513
US	Alaska	ORT	Northway Airport	62.9613	-141.929
US	Alaska	CXF	Coldfoot Airport	67.2522	-150.204
US	Alaska	CXC	Chitina Airport	61.5829	-144.427
US	Arizona	CWX	Cochise County Airport	32.2454	-109.895
US	Washington	CWS	Center Island Airport	48.4901	-122.832
US	Iowa	CWI	Clinton Municipal Airport	41.8311	-90.3291
US	Louisiana	CWF	Chennault International Airport	30.2106	-93.1432
US	Alaska	ORV	Robert (Bob) Curtis Memorial Airport	66.8179	-161.019
US	Wisconsin	CWA	Central Wisconsin Airport	44.7776	-89.6668
US	Alaska	KNW	New Stuyahok Airport	59.4499	-157.328
US	New Mexico	CVS	Cannon Air Force Base	34.3828	-103.322
US	Oregon	CVO	Corvallis Municipal Airport	44.4972	-123.29
US	New Mexico	CVN	Clovis Municipal Airport	34.4251	-103.079
US	Missouri	KNT	Kennett Memorial Airport	36.2259	-90.0366
US	Missouri	KNK	Kokhanok Airport	59.4332	-154.804
US	Kentucky	CVG	Cincinnati/Northern Kentucky International Airport	39.0488	-84.6678
US	Missouri	OSB	Grand Glaize-Osage Beach Airport	36.3058	43.1474
US	Texas	CUX	Cuddihy Field	27.7218	-97.5121
US	Michigan	OSC	Oscoda-Wurtsmith Airport	44.4516	-83.3941
US	New Mexico	CUS	Columbus Municipal Airport	39.2557	-85.8971
US	Wisconsin	OSH	Wittman Regional Airport	43.9844	-88.557
US	Utah	KNB	Kanab Municipal Airport	37.0106	-112.531
US	Alaska	KMY	Moser Bay Seaplane Base	57.0256	-154.146
US	Oklahoma	CUH	Cushing Municipal Airport	35.9499	-96.7731
US	South Carolina	CUB	Jim Hamilton-L.B. Owens Airport	33.9705	-80.9952
US	Ohio	OSU	Ohio State University Airport	40.0798	-83.073
US	North Carolina	CTZ	Clinton-Sampson County Airport	34.9756	-78.3646
US	Florida	CTY	Cross City Airport	29.6355	-83.1048
US	New York	CTX	Cortland County Airport (Chase Field	42.5926	-76.2149
US	Arizona	CTW	Cottonwood Airport	34.73	-112.035
US	New York	CTO	Calverton Executive Airpark	40.9151	-72.7919
US	Mississippi	OSX	Kosciusko-Attala County Airport	33.09	-89.5409
US	South Dakota	CTK	Canton Municipal Airport	43.3089	-96.571
US	Pennsylvania	CTH	Chester County G. O. Carlson Airport	39.979	-75.8655
US	Minnesota	OTG	Worthington Municipal Airport	43.6559	-95.584
US	Oregon	OTH	Southwest Oregon Regional Airport	43.4171	-124.246
US	Oregon	OTK	Tillamook Airport	45.4182	-123.814
US	Iowa	OTM	Ottumwa Regional Airport	41.1066	-92.4479
US	Montana	CTB	Cut Bank Municipal Airport	48.6084	-112.376
US	Washington	OTS	Anacortes Airport	48.499	-122.662
US	Tennessee	CSV	Crossville Memorial-Whitson Field	35.9513	-85.085
US	Iowa	CSQ	Creston Municipal Airport	41.0214	-94.3633
US	Nevada	CSN	Carson Airport	39.1922	-119.734
US	Oklahoma	CSM	Clinton-Sherman Airport	35.3398	-99.2005
US	Alaska	OTZ	Ralph Wien Memorial Airport	66.8847	-162.599
US	Alaska	KMO	Manokotak Airport	58.9902	-159.05
US	Georgia	CSG	Columbus Airport	32.5163	-84.9389
US	Colorado	CSE	Buckhorn Ranch Airport	38.8519	-106.928
US	Oklahoma	OUN	University of Oklahoma Westheimer Airport (Max Westheimer Airport)	35.2456	-97.4721
US	Alaska	KLW	Klawock Airport	55.5792	-133.076
US	Mississippi	CRX	Roscoe Turner Airport	34.915	-88.6035
US	West Virginia	CRW	Yeager Airport	38.3731	-81.5932
US	Arkansas	CRT	Z. M. Jack Stell Field	33.1783	-91.8802
US	Texas	CRS	C. David Campbell Field (Corsicana Municipal Airport)	32.0281	-96.4006
US	Texas	CRP	Corpus Christi International Airport	27.7704	-97.5012
US	California	CRO	Corcoran Airport	36.1025	-119.595
US	California	OVE	Oroville Municipal Airport	39.4878	-121.622
US	Washington	KLS	Southwest Washington Regional Airport	46.118	-122.898
US	Florida	CRG	Jacksonville Executive at Craig Airport	30.3363	-81.5144
US	South Carolina	CRE	Grand Strand Airport	33.8117	-78.7239
US	Minnesota	OWA	Owatonna Degner Regional Airport	44.1234	-93.2606
US	Massachusetts	CPX	Benjamin Rivera Noriega Airport	18.3133	-65.3043
US	Illinois	CPS	St. Louis Downtown Airport	38.5707	-90.1562
US	Wyoming	CPR	Casper-Natrona County International Airport	42.908	-106.464
US	California	CPM	Compton/Woodley Airport	33.89	-118.244
US	Kentucky	OWB	Owensboro-Daviess County Airport	37.7401	-87.1668
US	Massachusetts	OWD	Norwood Memorial Airport	42.1905	-71.1729
US	Missouri	COU	Columbia Regional Airport	38.8181	-92.2196
US	Texas	COT	Cotulla-La Salle County Airport	28.4567	-99.2203
US	Colorado	COS	Colorado Springs Airport	38.8058	-104.701
US	Maine	OWK	Central Maine Airport of Norridgewock	44.7155	-69.8665
US	New York	COP	Cooperstown-Westville Airport	42.6292	-74.891
US	New Hampshire	CON	Concord Municipal Airport	43.2027	-71.5023
US	Texas	COM	Coleman Municipal Airport	31.8411	-99.4036
US	Florida	COI	Merritt Island Airport	28.3416	-80.6855
US	Florida	COF	Patrick Air Force Base	28.2349	-80.6101
US	Idaho	COE	Coeur d'Alene Airport	47.7743	-116.82
US	Wyoming	COD	Yellowstone Regional Airport	44.5202	-109.024
US	California	COA	Columbia Airport	38.0304	-120.415
US	Utah	CNY	Canyonlands Field	38.755	-109.755
US	Alaska	KLN	Larsen Bay Airport	57.5351	-153.978
US	Texas	CNW	TSTC Waco Airport	31.6378	-97.0741
US	Kansas	CNU	Chanute Martin Johnson Airport	37.6688	-95.4851
US	California	CNO	Chino Airport	33.9747	-117.637
US	New Mexico	CNM	Cavern City Air Terminal	32.3375	-104.263
US	Kansas	CNK	Blosser Municipal Airport	39.5493	-97.6523
US	New Hampshire	CNH	Claremont Municipal Airport	43.3704	-72.3687
US	Colorado	CNE	Fremont County Airport	38.428	-105.106
US	Connecticut	OXC	Waterbury-Oxford Airport	41.4786	-73.1352
US	Ohio	OXD	Miami University Airport	39.5023	-84.7844
US	Alaska	KLL	Levelock Airport	59.1281	-156.859
US	Wisconsin	CMY	Sparta/Fort McCoy Airport	43.9583	-90.7379
US	Michigan	CMX	Houghton County Memorial Airport	47.1684	-88.4891
US	Alaska	KLG	Kalskag Airport	61.5363	-160.341
US	California	OXR	Oxnard Airport	34.2008	-119.207
US	Alaska	KKU	Ekuk Airport	58.8112	-158.559
US	Texas	OZA	Ozona Municipal Airport	30.7353	-101.203
US	Alabama	OZR	Cairns Army Airfield	31.2757	-85.7134
US	Washington	PAE	Paine Field (Snohomish County Airport)	47.9063	-122.282
US	Kentucky	PAH	Barkley Regional Airport	37.0608	-88.7738
US	Illinois	CMI	University of Illinois Willard Airport	40.0392	-88.2781
US	Ohio	CMH	John Glenn Columbus International Airport	39.998	-82.8919
US	Hawaii	PAK	Port Allen Airport	21.8969	-159.603
US	Florida	PAM	Tyndall Air Force Base	30.0696	-85.5754
US	Florida	CLW	Clearwater Air Park	27.9767	-82.7587
US	North Carolina	CLT	Charlotte Douglas International Airport	35.214	-80.9431
US	Washington	CLS	Chehalis-Centralia Airport	46.677	-122.983
US	California	CLR	Cliff Hatfield Memorial Airport	33.1315	-115.521
US	California	PAO	Palo Alto Airport (Santa Clara County Airport)	37.4611	-122.115
US	Alaska	CLP	Clarks Point Airport	58.8337	-158.529
US	Washington	CLM	William R. Fairchild International Airport	48.1202	-123.5
US	Texas	CLL	Easterwood Airport (Easterwood Field)	30.5886	-96.3638
US	Oklahoma	CLK	Clinton Regional Airport	35.5383	-98.9327
US	Alaska	KKL	Karluk Lake Seaplane Base	57.367	-154.028
US	Alaska	PAQ	Palmer Municipal Airport	61.5949	-149.089
US	Wisconsin	CLI	Clintonville Municipal Airport	44.6138	-88.7313
US	California	CLG	New Coalinga Municipal Airport	36.1631	-120.294
US	Ohio	CLE	Cleveland Hopkins International Airport	41.4117	-81.8498
US	California	CLD	McClellan-Palomar Airport	33.1283	-117.28
US	Alaska	KKK	Kalakaket Creek Air Station	64.4166	-156.82
US	Alaska	CKX	Chicken Airport	64.0713	-141.952
US	Tennessee	CKV	Clarksville-Montgomery County Regional Airport (Outlaw Field)	36.6219	-87.415
US	Alaska	CKU	Cordova Municipal Airport	60.5439	-145.727
US	Washington	CKR	Crane Island Airstrip	48.5978	-122.998
US	Minnesota	CKN	Crookston Municipal Airport (Kirkwood Field)	47.8417	-96.6216
US	Washington	YKM	Yakima Air Terminal (McAllister Field)	46.5682	-120.544
US	South Dakota	YKN	Chan Gurney Municipal Airport	42.9167	-97.3859
US	Alaska	KKI	Akiachak Airport	60.9048	-161.422
US	Mississippi	CKM	Fletcher Field	34.2997	-90.5123
US	Alaska	KKH	Kongiganak Airport	59.9608	-162.881
US	Alaska	KKB	Kitoi Bay Seaplane Base	58.1909	-152.37
US	Arkansas	CKK	Sharp County Regional Airport	36.2649	-91.5626
US	Alaska	KKA	Koyuk Alfred Adams Airport	64.9395	-161.154
US	California	CKE	Lampson Field	38.9906	-122.901
US	Alaska	CKD	Crooked Creek Airport	61.8679	-158.135
US	Arkansas	PBF	Grider Field	34.1731	-91.9356
US	West Virginia	CKB	North Central West Virginia Airport	39.2966	-80.2281
US	Oklahoma	CKA	Kegelman Air Force Auxiliary Field	36.7439	-98.1231
US	New York	PBG	Plattsburgh International Airport	44.6509	-73.4681
US	Florida	PBI	Palm Beach International Airport	26.6832	-80.0956
US	Texas	KIP	Kickapoo Downtown Airport	33.8578	-98.4904
US	Alaska	PCA	Portage Creek Airport	58.9065	-157.714
US	Wisconsin	PCD	Prairie du Chien Municipal Airport	43.0193	-91.1237
US	California	KIC	Mesa Del Rey Airport	36.228	-121.122
US	Alaska	KIB	Ivanof Bay Seaplane Base	55.8975	-159.489
US	New Jersey	PCT	Princeton Airport	40.3992	-74.6589
US	Michigan	CIU	Chippewa County International Airport	46.2508	-84.4724
US	Mississippi	PCU	Poplarville-Pearl River County Airport	30.786	-89.5045
US	Illinois	CIR	Cairo Regional Airport	37.0645	-89.2196
US	Georgia	MGE	Dobbins Air Reserve Base	33.9154	-84.5163
US	Iowa	CIN	Arthur N. Neu Airport	42.0462	-94.789
US	Alaska	CIL	Council Airport	64.8979	-163.703
US	Alaska	CIK	Chalkyitsik Airport	66.645	-143.74
US	Alaska	PDB	Pedro Bay Airport	59.7896	-154.124
US	Colorado	CIG	Craig-Moffat Airport	40.4952	-107.522
US	Iowa	CID	The Eastern Iowa Airport	41.8847	-91.7108
US	California	CIC	Chico Municipal Airport	39.7954	-121.858
US	Oregon	CHZ	Chiloquin State Airport	42.5794	-121.879
US	Georgia	PDK	DeKalb-Peachtree Airport	33.8756	-84.302
US	Oregon	PDT	Eastern Oregon Regional Airport	45.6951	-118.841
US	Oregon	PDX	Portland International Airport	45.5887	-122.598
US	Alaska	PEC	Pelican Seaplane Base	57.9552	-136.236
US	Alaska	CHU	Chuathbaluk Airport	61.5791	-159.216
US	Alaska	KGZ	Glacier Creek Airport	61.4551	-142.381
US	South Carolina	CHS	Charleston International Airport / Charleston Air Force Base	32.8986	-80.0405
US	Alaska	CHP	Circle Hot Springs Airport	65.4855	-144.611
US	Virginia	CHO	Charlottesville-Albemarle Airport	38.1386	-78.4529
US	Alaska	KGX	Grayling Airport	62.8952	-160.066
US	Texas	PEQ	Pecos Municipal Airport	31.3824	-103.511
US	Alaska	KGK	Koliganek Airport	59.7266	-157.259
US	Idaho	CHL	Challis Airport	44.523	-114.218
US	Oklahoma	CHK	Chickasha Municipal Airport	35.0974	-97.9677
US	Oregon	PFC	Pacific City State Airport	45.1998	-123.962
US	Arizona	PGA	Page Municipal Airport	36.9261	-111.448
US	West Virginia	PGC	Grant County Airport	38.9949	-79.1459
US	Florida	PGD	Punta Gorda Airport	26.9202	-81.9905
US	Alaska	KFP	False Pass Airport	54.8474	-163.41
US	Ohio	YNG	Youngstown-Warren Regional Airport	41.2607	-80.6791
US	Tennessee	CHA	Chattanooga Metropolitan Airport (Lovell Field)	35.0353	-85.2038
US	Arizona	CGZ	Casa Grande Municipal Airport	32.9549	-111.767
US	Mississippi	PGL	Trent Lott International Airport	30.4628	-88.5292
US	Maryland	CGS	College Park Airport	38.9806	-76.9223
US	Alaska	PGM	Port Graham Airport	59.3483	-151.832
US	Missouri	CGI	Cape Girardeau Regional Airport	37.2253	-89.5708
US	Colorado	PGO	Stevens Field	37.2863	-107.056
US	Ohio	CGF	Cuyahoga County Airport	41.5651	-81.4864
US	Maryland	CGE	Cambridge-Dorchester Airport	38.5393	-76.0304
US	Arkansas	PGR	Kirk Field	36.0629	-90.5078
US	Arizona	PGS	Grand Canyon Caverns Airport	35.5713	-113.293
US	Alaska	CGA	Craig Seaplane Base	55.4788	-133.148
US	Kansas	CFV	Coffeyville Municipal Airport	37.094	-95.5719
US	Arizona	CFT	Greenlee County Airport	32.9528	-109.21
US	Texas	CFD	Coulter Field	30.7157	-96.3314
US	Colorado	CEZ	Cortez Municipal Airport	37.303	-108.628
US	Kentucky	CEY	Murray-Calloway County Airport	36.6646	-88.3728
US	Alaska	CEX	Chena Hot Springs Airport	65.0518	-146.047
US	Florida	CEW	Bob Sikes Airport	30.7788	-86.5221
US	North Carolina	PGV	Pitt-Greenville Airport	35.6352	-77.3853
US	South Carolina	CEU	Oconee County Regional Airport	34.6719	-82.8865
US	Alaska	KEK	Ekwok Airport	59.3568	-157.471
US	Alaska	CEM	Central Airport	65.5738	-144.783
US	Ohio	PHD	Harry Clever Field	40.4709	-81.4197
US	Virginia	PHF	Newport News/Williamsburg International Airport	37.1319	-76.493
US	Washington	KEH	Kenmore Air Harbor	47.7548	-122.259
US	Florida	PHK	Palm Beach County Glades Airport	26.785	-80.6934
US	California	CEC	Del Norte County Airport (Jack McNamara Field)	41.7802	-124.237
US	Pennsylvania	PHL	Philadelphia International Airport	39.8719	-75.2411
US	Kansas	CEA	Cessna Aircraft Field	37.6486	-97.2506
US	Michigan	PHN	St. Clair County International Airport	42.911	-82.5289
US	New Jersey	CDW	Essex County Airport	40.8752	-74.2814
US	Alaska	CDV	Merle K. (Mudhole) Smith Airport	60.4918	-145.478
US	Texas	CDS	Childress Municipal Airport	34.4338	-100.288
US	Nebraska	CDR	Chadron Municipal Airport	42.8376	-103.095
US	South Carolina	CDN	Woodward Field	34.2836	-80.5649
US	Alaska	CDL	Candle 2 Airport	65.9077	-161.926
US	Florida	CDK	George T. Lewis Airport	29.1342	-83.0505
US	Arkansas	CDH	Harrell Field	33.6228	-92.7634
US	Utah	CDC	Cedar City Regional Airport	37.701	-113.099
US	Alaska	CDB	Cold Bay Airport	55.2061	-162.725
US	Iowa	CCY	Northeast Iowa Regional Airport	43.0726	-92.6108
US	California	CCR	Buchanan Field Airport	37.9897	-122.057
US	Texas	CCG	Crane County Airport	31.4151	-102.363
US	California	CCB	Cable Airport	34.1116	-117.688
US	Alaska	PHO	Point Hope Airport	68.3488	-166.799
US	South Dakota	PHP	Philip Airport	44.0486	-101.599
US	Tennessee	PHT	Henry County Airport	36.3382	-88.3829
US	Mississippi	CBM	Columbus Air Force Base	33.6438	-88.4438
US	Kansas	CBK	Colby Municipal Airport (Shalz Field)	39.4275	-101.047
US	Iowa	CBF	Council Bluffs Municipal Airport	41.2592	-95.7606
US	Maryland	CBE	Greater Cumberland Regional Airport	39.6154	-78.7609
US	Arizona	PHX	Phoenix Sky Harbor International Airport	33.4343	-112.012
US	Illinois	PIA	General Wayne A. Downing Peoria International Airport	40.6642	-89.6933
US	Maine	CAR	Caribou Municipal Airport	46.8715	-68.0179
US	New Mexico	CAO	Clayton Municipal Airpark	36.4462	-103.167
US	Ohio	CAK	Akron-Canton Airport	40.9161	-81.4422
US	Alaska	EAA	Eagle Airport	64.7764	-141.151
US	South Carolina	CAE	Columbia Metropolitan Airport	33.9388	-81.1195
US	Michigan	CAD	Wexford County Airport	44.2753	-85.4189
US	Mississippi	PIB	Hattiesburg-Laurel Regional Airport	31.4671	-89.3371
US	Texas	BZT	Eagle Air Park	28.9822	-95.5797
US	Montana	BZN	Bozeman Yellowstone International Airport (Gallatin Field)	45.7775	-111.153
US	Florida	PIE	St. Pete-Clearwater International Airport	27.9102	-82.6874
US	Idaho	PIH	Pocatello Regional Airport	42.9098	-112.596
US	Alaska	KEB	Nanwalek Airport	59.3521	-151.925
US	California	BZF	Benton Field	40.5749	-122.408
US	Georgia	PIM	Harris County Airport	32.8407	-84.8824
US	Alaska	PIP	Pilot Point Airport	57.5804	-157.572
US	Washington	BYW	Blakely Island Airport	48.579	-122.826
US	South Dakota	PIR	Pierre Regional Airport	44.3827	-100.286
US	California	BYS	Bicycle Lake Army Airfield (Fort Irwin)	35.2805	-116.63
US	Pennsylvania	PIT	Pittsburgh International Airport	40.4915	-80.2329
US	Alaska	PIZ	Point Lay LRRS Airport	69.7329	-163.005
US	Idaho	BYI	Burley Municipal Airport	42.5426	-113.772
US	Arkansas	BYH	Arkansas International Airport	35.9643	-89.944
US	Wyoming	BYG	Johnson County Airport	44.3811	-106.722
US	Arizona	PJB	Payson Airport	34.2568	-111.339
US	Alaska	BYA	Boundary Airport	64.0783	-141.113
US	Alaska	PKA	Napaskiak Airport	60.7029	-161.778
US	West Virginia	PKB	Mid-Ohio Valley Regional Airport	39.3451	-81.4392
US	California	BXS	Borrego Valley Airport	33.259	-116.321
US	Minnesota	PKD	Park Rapids Municipal Airport (Konshok Field)	46.9006	-95.0731
US	Wisconsin	PKF	Park Falls Municipal Airport	45.955	-90.4244
US	Arizona	BXK	Buckeye Municipal Airport	33.4204	-112.686
US	Alaska	KDK	Kodiak Municipal Airport	57.8059	-152.374
US	Alaska	KCR	Colorado Creek Airport	63.5677	-155.989
US	Alaska	KCQ	Chignik Lake Airport	56.255	-158.775
US	Louisiana	BXA	George R. Carr Memorial Air Field	30.8137	-89.865
US	Missouri	PLK	M. Graham Clark Downtown Airport	36.6259	-93.2289
US	North Dakota	BWM	Bowman Municipal Airport	46.1655	-103.301
US	Oklahoma	BWL	Blackwell-Tonkawa Municipal Airport	36.7959	-97.317
US	Alaska	KCN	Chernofski Harbor Seaplane Base	53.4029	-167.52
US	Kentucky	BWG	Bowling Green-Warren County Regional Airport	36.9645	-86.4197
US	Texas	BWD	Brownwood Regional Airport	31.7936	-98.9565
US	California	BWC	Brawley Municipal Airport	32.9929	-115.517
US	Michigan	PLN	Pellston Regional Airport (Emmet County)	45.5709	-84.7967
US	Massachusetts	BVY	Beverly Municipal Airport	42.5842	-70.9165
US	Arkansas	BVX	Batesville Regional Airport	35.7262	-91.6473
US	Alabama	PLR	St. Clair County Airport	33.5588	-86.2491
US	Alaska	BVU	Beluga Airport	61.1722	-151.044
US	Oklahoma	BVO	Bartlesville Municipal Airport	36.7625	-96.0112
US	Alaska	KCL	Chignik Lagoon Airport (Chignik Flats Airport)	56.3112	-158.536
US	California	BUR	Bob Hope Airport	34.2007	-118.359
US	North Dakota	PMB	Pembina Municipal Airport	48.9425	-97.2408
US	Missouri	BUM	Butler Memorial Airport	38.2898	-94.3401
US	California	PMD	Palmdale Regional Airport	34.6294	-118.085
US	Alaska	KCC	Coffman Cove Seaplane Base	56.0032	-132.842
US	New York	BUF	Buffalo Niagara International Airport	42.9405	-78.7322
US	Nebraska	BUB	Cram Field	41.7767	-99.1497
US	Ohio	PMH	Greater Portsmouth Regional Airport	38.8405	-82.8473
US	Nevada	BTY	Beatty Airport	36.8611	-116.787
US	Vermont	BTV	Burlington International Airport	44.4719	-73.1533
US	Alaska	KBW	Chignik Bay Seaplane Base	56.2956	-158.401
US	Alaska	BTT	Bettles Airport	66.9139	-151.529
US	Alaska	PML	Port Moller Airport	56.006	-160.561
US	Louisiana	BTR	Baton Rouge Metropolitan Airport (Ryan Field)	30.5332	-91.1496
US	Arizona	YUM	Yuma International Airport / MCAS Yuma	32.6566	-114.606
US	Massachusetts	PMX	Metropolitan Airport	42.2233	-72.3114
US	Pennsylvania	BTP	Butler County Airport (K.W. Scholter Field)	40.7769	-79.9497
US	Alaska	KBE	Bell Island Hot Springs Seaplane Base	55.9291	-131.572
US	South Carolina	BTN	Marlboro County Jetport	34.6217	-79.7344
US	Montana	BTM	Bert Mooney Airport	45.9548	-112.497
US	Michigan	BTL	W. K. Kellogg Airport	42.3073	-85.2515
US	Oklahoma	PNC	Ponca City Regional Airport	36.732	-97.0998
US	Alaska	BTI	Barter Island LRRS Airport	70.134	-143.582
US	Utah	BTF	Skypark Airport	40.8694	-111.927
US	Alaska	KBC	Birch Creek Airport	66.274	-145.824
US	Pennsylvania	PNE	Northeast Philadelphia Airport	40.0819	-75.0106
US	Maine	PNN	Princeton Municipal Airport	45.2007	-67.5644
US	Florida	PNS	Pensacola International Airport	30.4734	-87.1866
US	Alaska	BSW	Boswell Bay Airport	60.4231	-146.146
US	Arizona	BSQ	Bisbee Municipal Airport	31.364	-109.883
US	Alaska	KAL	Kaltag Airport	64.3191	-158.741
US	Utah	PNU	Panguitch Municipal Airport	37.8452	-112.392
US	Texas	PNX	North Texas Regional Airport	33.7141	-96.6737
US	Hawaii	BSF	Bradshaw Army Airfield	19.7601	-155.554
US	Alaska	KAE	Kake Airport	56.973	-133.946
US	North Carolina	POB	Pope Field (Pope AFB)	35.1709	-79.0145
US	Kentucky	BRY	Samuels Field	37.8143	-85.4996
US	Alaska	BRW	Wiley Post-Will Rogers Memorial Airport	71.2854	-156.766
US	Texas	BRO	Brownsville/South Padre Island International Airport	25.9068	-97.4259
US	Iowa	BRL	Southeast Iowa Regional Airport	40.7832	-91.1255
US	Minnesota	BRD	Brainerd Lakes Regional Airport	46.3983	-94.1381
US	Alaska	BQV	Bartlett Cove Seaplane Base	58.4552	-135.885
US	California	POC	Brackett Field	34.0916	-117.782
US	Massachusetts	BQN	Rafael Hernandez Airport	18.4949	-67.1294
US	Georgia	BQK	Brunswick Golden Isles Airport	31.2588	-81.4665
US	Louisiana	POE	Polk Army Airfield	31.0448	-93.1917
US	Missouri	POF	Poplar Bluff Municipal Airport	36.7739	-90.3249
US	Iowa	POH	Pocahontas Municipal Airport	36.2456	-90.9553
US	Michigan	JXN	Jackson County Airport (Reynolds Field)	42.2598	-84.4594
US	Wisconsin	JVL	Southern Wisconsin Regional Airport	42.6203	-89.0416
US	Texas	BPT	Jack Brooks Regional Airport	29.9508	-94.0207
US	New Jersey	JVI	Central Jersey Regional Airport	40.5244	-74.5984
US	Wyoming	BPI	Miley Memorial Field	42.5851	-110.111
US	New York	POU	Dutchess County Airport	41.6266	-73.8842
US	Wyoming	POY	Powell Municipal Airport	44.8672	-108.793
US	Florida	BOW	Bartow Municipal Airport	27.9434	-81.7834
US	Texas	PPA	Perry Lefors Field	35.613	-100.996
US	Massachusetts	BOS	Logan International Airport	42.3643	-71.0052
US	Alaska	PPC	Prospect Creek Airport	66.8141	-150.644
US	Oregon	BOK	Brookings Airport	42.0746	-124.29
US	Idaho	BOI	Boise Air Terminal (Gowen Field)	43.5644	-116.223
US	Kansas	PPF	Tri-City Airport	37.3299	-95.5062
US	Pennsylvania	JST	John Murtha Johnstown-Cambria County Airport	40.3161	-78.8339
US	Florida	PPM	Pompano Beach Airpark	26.2471	-80.1111
US	Iowa	BNW	Boone Municipal Airport	42.0496	-93.8476
US	Hawaii	JRF	Kalaeloa Airport (John Rodgers Field)	21.3074	-158.07
US	Alaska	PPV	Port Protection Seaplane Base	56.3288	-133.61
US	Oregon	BNO	Burns Municipal Airport	43.5919	-118.955
US	Illinois	JOT	Joliet Regional Airport	41.5178	-88.1755
US	South Carolina	BNL	Barnwell Regional Airport	33.2578	-81.3883
US	Maine	PQI	Northern Maine Regional Airport at Presque Isle	46.689	-68.0448
US	California	BNG	Banning Municipal Airport	33.9231	-116.851
US	Alaska	BNF	Warm Springs Bay Seaplane Base	57.0888	-134.833
US	Tennessee	BNA	Nashville International Airport	36.1245	-86.6782
US	Alaska	PQS	Pilot Station Airport	61.9346	-162.9
US	Alaska	BMX	Big Mountain Air Force Station	59.3612	-155.259
US	Texas	BMT	Beaumont Municipal Airport	30.0707	-94.2158
US	California	PRB	Paso Robles Municipal Airport	35.6729	-120.627
US	New Hampshire	BML	Berlin Regional Airport	44.5754	-71.1759
US	Illinois	BMI	Central Illinois Regional Airport	40.4771	-88.9159
US	Arizona	PRC	Ernest A. Love Field	34.6545	-112.42
US	Utah	BMC	Brigham City Airport	41.5524	-112.062
US	Alaska	JNU	Juneau International Airport	58.355	-134.576
US	Iowa	PRO	Perry Municipal Airport	41.828	-94.1599
US	Illinois	BLV	MidAmerica St. Louis Airport / Scott Air Force Base	38.5452	-89.8352
US	California	BLU	Blue Canyon-Nyack Airport	39.275	-120.71
US	North Dakota	JMS	Jamestown Regional Airport	46.9297	-98.6782
US	New Jersey	BLM	Monmouth Executive Airport	40.1869	-74.1249
US	Washington	BLI	Bellingham International Airport	48.7928	-122.538
US	California	BLH	Blythe Airport	33.6192	-114.717
US	Wisconsin	PRW	Prentice Airport	45.543	-90.2793
US	West Virginia	BLF	Mercer County Airport	37.2958	-81.2077
US	Texas	PRX	Cox Field	33.6366	-95.4508
US	Nevada	BLD	Boulder City Municipal Airport	35.9475	-114.861
US	Oregon	PRZ	Prineville Airport	44.287	-120.904
US	Pennsylvania	PSB	Mid-State Regional Airport	40.8835	-78.0863
US	South Dakota	BKX	Brookings Regional Airport	44.3048	-96.8169
US	West Virginia	BKW	Raleigh County Memorial Airport	37.7873	-81.1242
US	Washington	PSC	Tri-Cities Airport	46.2647	-119.119
US	Missouri	JLN	Joplin Regional Airport	37.1518	-94.4983
US	Massachusetts	PSF	Pittsfield Municipal Airport	42.4268	-73.2929
US	Virginia	BKT	Blackstone Army Airfield (Allen C. Perkinson Airport)	37.0742	-77.9575
US	Alaska	PSG	Petersburg James A. Johnson Airport	56.8017	-132.945
US	Alaska	JLA	Quartz Creek Airport	60.4827	-149.719
US	Texas	JKV	Cherokee County Airport	31.8693	-95.2174
US	Virginia	PSK	New River Valley Airport	37.1373	-80.6785
US	New Hampshire	PSM	Portsmouth International Airport at Pease	43.0779	-70.8233
US	Ohio	BKL	Cleveland Burke Lakefront Airport	41.5175	-81.6833
US	Texas	PSN	Palestine Municipal Airport	31.7797	-95.7063
US	California	PSP	Palm Springs International Airport	33.8297	-116.507
US	Pennsylvania	PSQ	Philadelphia Seaplane Base	39.859	-75.2996
US	Texas	PSX	Palacios Municipal Airport	28.7275	-96.251
US	Hawaii	BKH	Barking Sands PMRF	22.0228	-159.785
US	Missouri	BKG	Branson Airport	36.5321	-93.2005
US	Alaska	BKF	Lake Brooks Seaplane Base	58.5548	-155.777
US	Oregon	BKE	Baker City Municipal Airport	44.8373	-117.809
US	Texas	BKD	Stephens County Airport	32.719	-98.891
US	Alaska	BKC	Buckland Airport	65.9816	-161.149
US	New York	JHW	Chautauqua County-Jamestown Airport	42.1534	-79.258
US	Hawaii	JHM	Kapalua Airport	20.9629	-156.673
US	Alaska	PTA	Port Alsworth Airport	60.2017	-154.326
US	Virginia	PTB	Dinwiddie County Airport	37.1838	-77.5074
US	Ohio	BJJ	Wayne County Airport	40.8748	-81.8883
US	Minnesota	BJI	Bemidji Regional Airport	47.5094	-94.9337
US	Alaska	PTC	Port Alice Seaplane Base	55.803	-133.597
US	Alaska	PTD	Port Alexander Seaplane Base	56.2468	-134.648
US	Colorado	BJC	Rocky Mountain Metropolitan Airport	39.9088	-105.117
US	Mississippi	BIX	Keesler Air Force Base	30.4104	-88.9244
US	Alaska	PTH	Port Heiden Airport	56.9591	-158.633
US	North Dakota	BIS	Bismarck Municipal Airport	46.7727	-100.746
US	Ohio	JFN	Northeast Ohio Regional Airport	41.778	-80.6955
US	Michigan	PTK	Oakland County International Airport	42.6655	-83.4201
US	Montana	BIL	Billings Logan International Airport	45.8077	-108.543
US	Louisiana	PTN	Harry P. Williams Memorial Airport	29.7095	-91.339
US	Missouri	JEF	Jefferson City Memorial Airport	38.5912	-92.1561
US	Kansas	PTS	Atkinson Municipal Airport	37.4478	-94.7311
US	Kansas	PTT	Pratt Regional Airport	37.7016	-98.7469
US	California	BIH	Eastern Sierra Regional Airport	37.3731	-118.364
US	Alaska	PTU	Platinum Airport	59.0114	-161.82
US	Alaska	BIG	Allen Army Airfield	63.9945	-145.722
US	Texas	BIF	Biggs Army Airfield	31.8495	-106.38
US	California	PTV	Porterville Municipal Airport	36.0296	-119.063
US	Pennsylvania	PTW	Heritage Field	40.2396	-75.5567
US	Nebraska	BIE	Beatrice Municipal Airport	40.3013	-96.7541
US	Montana	JDN	Jordan Airport	47.3288	-106.953
US	Colorado	PUB	Pueblo Memorial Airport	38.2891	-104.497
US	Rhode Island	BID	Block Island State Airport	41.1681	-71.5778
US	Utah	PUC	Carbon County Regional Airport	39.6139	-110.751
US	Oregon	JDA	Grant County Regional Airport (Ogilvie Field)	44.4042	-118.963
US	Texas	JCY	LBJ Ranch Airport	30.2518	-98.6225
US	Texas	JCT	Kimble County Airport	30.5113	-99.7635
US	Alaska	ZNC	Nyac Airport	60.9807	-159.994
US	Washington	PUL	Port of Poulsbo Marina Moorage Seaplane Base	47.734	-122.647
US	Kansas	JCI	New Century AirCenter	38.8309	-94.8903
US	Alaska	JBT	Bethel Seaplane Base	60.782	-161.743
US	Arkansas	JBR	Jonesboro Municipal Airport	35.8317	-90.6464
US	Alabama	BHM	Birmingham-Shuttlesworth International Airport	33.5629	-86.7535
US	Florida	JAX	Jacksonville International Airport	30.4941	-81.6879
US	Florida	ZPH	Zephyrhills Municipal Airport	28.2282	-82.1559
US	Washington	PUW	Pullman-Moscow Regional Airport	46.7439	-117.11
US	Texas	JAS	Jasper County Airport (Bell Field)	30.8857	-94.0349
US	Mississippi	JAN	Jackson-Evers International Airport	32.3112	-90.0759
US	Maine	BHB	Hancock County-Bar Harbor Airport	44.45	-68.3615
US	Massachusetts	PVC	Provincetown Municipal Airport	42.0719	-70.2214
US	Arizona	BGT	Bagdad Airport	34.5959	-113.17
US	Maine	BGR	Bangor International Airport	44.8074	-68.8281
US	Alaska	BGQ	Big Lake Airport	61.5361	-149.814
US	Rhode Island	PVD	Theodore Francis Green State Airport	41.7326	-71.4204
US	California	PVF	Placerville Airport	38.7242	-120.753
US	Kentucky	PVL	Pike County Airport	37.5618	-82.5664
US	New York	BGM	Greater Binghamton Airport (Edwin A. Link Field)	42.2087	-75.9798
US	Wyoming	JAC	Jackson Hole Airport	43.6073	-110.738
US	Utah	PVU	Provo Municipal Airport	40.2192	-111.723
US	Texas	PVW	Hale County Airport	34.1681	-101.717
US	Oklahoma	PWA	Wiley Post Airport	35.5342	-97.6471
US	Georgia	BGE	Decatur County Industrial Air Park	30.9715	-84.6374
US	Montana	PWD	Sher-Wood Airport	48.7903	-104.534
US	Texas	BGD	Hutchinson County Airport	35.7009	-101.394
US	Maine	PWM	Portland International Jetport	43.6462	-70.3093
US	South Carolina	BFT	Beaufort County Airport	32.4122	-80.6344
US	Alaska	PWR	Port Walter Seaplane Base	56.381	-134.651
US	Washington	PWT	Bremerton National Airport	47.4902	-122.765
US	Pennsylvania	BFP	Beaver County Airport	40.7725	-80.3914
US	Wyoming	PWY	Ralph Wenz Field	42.7955	-109.807
US	California	IYK	Inyokern Airport	35.6588	-117.83
US	Alabama	BFM	Mobile Downtown Airport	30.6268	-88.0681
US	California	BFL	Meadows Field Airport	35.4336	-119.057
US	Colorado	BFK	Buckley Air Force Base	39.7017	-104.752
US	Washington	BFI	Boeing Field/King County International Airport	47.53	-122.302
US	Arizona	PXL	Polacca Airport	35.7917	-110.423
US	Texas	IWS	West Houston Airport	29.8182	-95.6726
US	Ohio	ZZV	Zanesville Municipal Airport	39.9444	-81.8921
US	Utah	BFG	Bullfrog Basin Airport	37.5458	-110.713
US	Nebraska	BFF	Western Nebraska Regional Airport (William B. Heilig Field)	41.874	-103.596
US	Pennsylvania	BFD	Bradford Regional Airport	41.8031	-78.6401
US	Michigan	IWD	Gogebic-Iron County Airport	46.5275	-90.1314
US	Alaska	PYL	Perry Island Seaplane Base	60.6853	-147.919
US	Massachusetts	PYM	Plymouth Municipal Airport	41.909	-70.7288
US	California	PYS	Paradise Skypark	-51.6867	-57.7785
US	Hawaii	ITO	Hilo International Airport	19.7214	-155.048
US	New York	ITH	Ithaca Tompkins Regional Airport	42.491	-76.4584
US	Wisconsin	ISW	South Wood County Airport (Alexander Field)	44.3603	-89.839
US	Maine	ISS	Wiscasset Airport	43.9614	-69.7126
US	Michigan	ISQ	Schoolcraft County Airport	45.9746	-86.1718
US	New York	ISP	Long Island MacArthur Airport	40.7952	-73.1002
US	North Carolina	ISO	Kinston Regional Jetport (Stallings Field)	35.3314	-77.6088
US	North Dakota	ISN	Sloulin Field International Airport	48.1779	-103.642
US	Florida	ISM	Kissimmee Gateway Airport	28.2898	-81.4371
US	North Carolina	QWG	Wilgrove Air Park	35.2138	-80.6701
US	Wisconsin	RAC	John H. Batten Airport	42.7606	-87.8152
US	Michigan	IRS	Kirsch Municipal Airport	41.8133	-85.439
US	California	RAL	Riverside Municipal Airport	33.9519	-117.445
US	Missouri	IRK	Kirksville Regional Airport	40.0935	-92.5449
US	South Dakota	RAP	Rapid City Regional Airport	44.0453	-103.057
US	Alaska	IRC	Circle City Airport	65.8305	-144.076
US	Texas	IRB	Iraan Municipal Airport	30.9057	-101.892
US	Pennsylvania	IPT	Williamsport Regional Airport	41.2418	-76.9211
US	Texas	RBD	Dallas Executive Airport	32.6809	-96.8682
US	California	RBF	Big Bear City Airport	34.2638	-116.856
US	Oregon	RBG	Roseburg Regional Airport	43.2388	-123.356
US	California	IPL	Imperial County Airport (Boley Field)	32.8342	-115.579
US	California	RBK	French Valley Airport	33.5742	-117.128
US	California	RBL	Red Bluff Municipal Airport	40.1507	-122.252
US	Iowa	IOW	Iowa City Municipal Airport	41.6392	-91.5465
US	Alaska	BET	Bethel Airport	60.7798	-161.838
US	Arizona	INW	Winslow-Lindbergh Regional Airport	35.0219	-110.723
US	North Carolina	INT	Smith Reynolds Airport	36.1337	-80.222
US	South Carolina	RBW	Lowcountry Regional Airport	32.921	-80.6406
US	Alaska	RBY	Ruby Airport	64.7272	-155.47
US	South Dakota	RCA	Ellsworth Air Force Base	44.145	-103.104
US	Washington	RCE	Roche Harbor Seaplane Base	48.6123	-123.139
US	Nevada	INS	Creech Air Force Base	36.5872	-115.673
US	Texas	RCK	H. H. Coffield Regional Airport	30.6316	-96.9897
US	Minnesota	INL	Falls International Airport	48.5662	-93.4031
US	Texas	INK	Winkler County Airport	31.7796	-103.201
US	Michigan	RCT	Nartron Field	43.9	-85.5167
US	Michigan	BEH	Southwest Michigan Regional Airport	42.1286	-86.4285
US	Michigan	IMT	Ford Airport	45.8184	-88.1145
US	Florida	IMM	Immokalee Regional Airport	26.4332	-81.401
US	Nebraska	IML	Imperial Municipal Airport	40.5093	-101.621
US	Alaska	RDB	Red Dog Airport	68.0321	-162.899
US	California	RDD	Redding Municipal Airport	40.509	-122.293
US	Pennsylvania	RDG	Reading Regional Airport (Carl A. Spaatz Field)	40.3785	-75.9652
US	Oregon	RDM	Roberts Field	44.2541	-121.15
US	North Dakota	RDR	Grand Forks Air Force Base	47.9611	-97.4012
US	North Carolina	RDU	Raleigh-Durham International Airport	35.8776	-78.7875
US	Alaska	RDV	Red Devil Airport	61.7881	-157.35
US	Pennsylvania	RED	Mifflin County Airport	40.6774	-77.6268
US	Texas	REE	Reese Airpark	33.5903	-102.037
US	Ohio	ILN	Wilmington Air Park	39.4279	-83.7921
US	North Carolina	ILM	Wilmington International Airport	34.2706	-77.9026
US	Oregon	REO	Rome State Airport	42.5777	-117.885
US	Minnesota	ILL	Willmar Municipal Airport (John L. Rice Field)	45.1177	-95.1304
US	Alaska	ILI	Iliamna Airport	59.7544	-154.911
US	Delaware	ILG	Wilmington Airport (New Castle Airport)	39.6787	-75.6065
US	Texas	ILE	Skylark Field	31.0858	-97.6865
US	Texas	RFG	Rooke Field	28.2886	-97.318
US	Massachusetts	BED	Laurence G. Hanscom Field	42.47	-71.289
US	Kansas	BEC	Beech Factory Airport	37.6945	-97.215
US	Mississippi	RFK	Rollang Field	32.9549	-90.8459
US	Alaska	IKO	Nikolski Air Station	52.9416	-168.849
US	Illinois	IKK	Greater Kankakee Airport	41.0714	-87.8463
US	North Carolina	IKB	Wilkes County Airport	36.2228	-81.0983
US	Oregon	BDY	Bandon State Airport	43.0865	-124.408
US	Montana	BDX	Broadus Airport	45.4725	-105.454
US	Illinois	IJX	Jacksonville Municipal Airport	39.7707	-90.238
US	Texas	RGR	Ranger Municipal Airport	32.4526	-98.6828
US	Wisconsin	RHI	Rhinelander-Oneida County Airport	45.6312	-89.4675
US	Arizona	IGM	Kingman Airport	35.2595	-113.938
US	California	RHV	Reid-Hillview Airport of Santa Clara County	37.3329	-121.819
US	Alaska	IGG	Igiugig Airport	59.324	-155.902
US	Virginia	RIC	Richmond International Airport	37.5052	-77.3197
US	Connecticut	BDR	Igor I. Sikorsky Memorial Airport	41.1635	-73.1262
US	Wisconsin	RIE	Rice Lake Regional Airport (Carl's Field)	45.419	-91.7735
US	Utah	RIF	Richfield Municipal Airport	38.7364	-112.099
US	Colorado	RIL	Garfield County Regional Airport	39.5263	-107.727
US	Arizona	IFP	Laughlin/Bullhead International Airport	35.1574	-114.56
US	California	RIR	Flabob Airport	33.9897	-117.411
US	California	RIV	March Air Reserve Base	33.8807	-117.259
US	Wyoming	RIW	Central Wyoming Regional Airport	43.0642	-108.46
US	Iowa	IFA	Iowa Falls Municipal Airport	42.4708	-93.27
US	Kansas	IDP	Independence Municipal Airport	37.1584	-95.7784
US	Pennsylvania	IDI	Indiana County-Jimmy Stewart Airport	40.6322	-79.1055
US	Idaho	IDH	Idaho County Airport	45.9426	-116.123
US	Maine	RKD	Knox County Regional Airport	44.0601	-69.0992
US	Iowa	IDG	Ida Grove Municipal Airport	42.3325	-95.445
US	South Carolina	RKH	Rock Hill/York County Airport	34.9878	-81.0572
US	Texas	RKP	Aransas County Airport	28.0868	-97.0446
US	Oklahoma	RKR	Robert S. Kerr Airport	35.0216	-94.6213
US	Wyoming	RKS	Southwest Wyoming Regional Airport	41.5942	-109.065
US	Alaska	ICY	Icy Bay Airport	59.969	-141.662
US	Tennessee	RKW	Rockwood Municipal Airport	35.9223	-84.6897
US	Kansas	ICT	Wichita Dwight D. Eisenhower National Airport	37.6499	-97.4331
US	Idaho	ICS	Cascade Airport	44.4938	-116.016
US	Washington	RLD	Richland Airport	46.3056	-119.304
US	Utah	BDG	Blanding Municipal Airport	37.5833	-109.483
US	Iowa	ICL	Schenck Field	40.7218	-95.0264
US	New York	RME	Griffiss International Airport	43.2338	-75.407
US	Illinois	BDF	Rinkenberger RLA Airport	41.2309	-89.6157
US	Minnesota	BDE	Baudette International Airport	48.7284	-94.6122
US	Georgia	RMG	Richard B. Russell Airport	34.3506	-85.158
US	Alaska	RMP	Rampart Airport	65.5079	-150.141
US	California	RMY	Mariposa-Yosemite Airport	37.5109	-120.04
US	Tennessee	RNC	Warren County Memorial Airport	35.6987	-85.8438
US	Texas	RND	Randolph Air Force Base	29.5297	-98.2789
US	Colorado	RNG	Rangely Airport	-40.9398	-108.763
US	Wisconsin	RNH	New Richmond Regional Airport	45.1483	-92.5381
US	Alaska	IAN	Bob Baker Memorial Airport	66.976	-160.437
US	Nevada	RNO	Reno-Tahoe International Airport	39.4991	-119.768
US	Texas	IAH	George Bush Intercontinental Airport	29.9844	-95.3414
US	Washington	RNT	Renton Municipal Airport	47.4931	-122.216
US	New York	IAG	Niagara Falls International Airport	43.1073	-78.9462
US	Virginia	ROA	Roanoke-Blacksburg Regional Airport (Woodrum Field)	37.3255	-79.9754
US	New York	ROC	Greater Rochester International Airport	43.1189	-77.6724
US	California	ROF	Montague Airport (Yreka Rohrer Field)	41.7304	-122.546
US	Arkansas	ROG	Rogers Municipal Airport (Carter Field)	36.3723	-94.1069
US	Virginia	IAD	Washington Dulles International Airport	38.9445	-77.4558
US	Kansas	IAB	McConnell Air Force Base	37.6219	-97.2682
US	Utah	ROL	Roosevelt Municipal Airport	40.2783	-110.051
US	Pennsylvania	HZL	Hazleton Municipal Airport	40.9868	-75.9949
US	Kansas	HYS	Hays Regional Airport	38.8422	-99.2732
US	Wisconsin	HYR	Sawyer County Airport	46.0252	-91.4443
US	New Mexico	ROW	Roswell International Air Center	33.3016	-104.531
US	Minnesota	ROX	Roseau Municipal Airport (Rudy Billberg Field)	48.856	-95.697
US	Alaska	HYL	Hollis Clark Bay Seaplane Base	55.4816	-132.646
US	Alaska	HYG	Hydaburg Seaplane Base	55.2063	-132.828
US	Florida	BCT	Boca Raton Airport	26.3785	-80.1077
US	Louisiana	BCS	Southern Seaplane Airport	29.8661	-90.0222
US	Massachusetts	HYA	Barnstable Municipal Airport (Boardman/Polando Field)	41.6693	-70.2804
US	Florida	HWO	North Perry Airport	26.0012	-80.2407
US	Alaska	HWI	Hawk Inlet Seaplane Base	58.1274	-134.756
US	Utah	BCE	Bryce Canyon Airport	37.7064	-112.145
US	California	HWD	Hayward Executive Airport	37.6592	-122.122
US	Montana	RPX	Roundup Airport	46.4751	-108.541
US	South Carolina	HVS	Hartsville Regional Airport	34.4031	-80.1192
US	Montana	HVR	Havre City-County Airport	48.543	-109.762
US	Connecticut	HVN	Tweed New Haven Airport	41.2637	-72.8868
US	Wisconsin	RRL	Merrill Municipal Airport	45.1989	-89.7129
US	Minnesota	RRT	Warroad International Memorial Airport (Swede Carlson Field)	48.9414	-95.3484
US	Utah	HVE	Hanksville Airport	38.418	-110.704
US	Alaska	RSH	Russian Mission Airport	61.7789	-161.319
US	Washington	RSJ	Rosario Seaplane Base	48.6457	-122.868
US	Kansas	RSL	Russell Municipal Airport	38.8721	-98.8118
US	Alaska	BCC	Bear Creek 3 Airport	63.5733	-156.149
US	Louisiana	RSN	Ruston Regional Airport	32.5144	-92.5917
US	Minnesota	RST	Rochester International Airport	43.9083	-92.5
US	Florida	RSW	Southwest Florida International Airport	26.5362	-81.7552
US	New York	RSX	Rouses Point Seaplane Base	44.9917	-73.3635
US	Kansas	HUT	Hutchinson Municipal Airport	38.0655	-97.8606
US	Alaska	HUS	Hughes Airport	66.0411	-154.263
US	Iowa	RTL	Spirit Lake Municipal Airport	43.3875	-95.1392
US	New Mexico	RTN	Raton Municipal Airport (Crews Field)	36.7415	-104.502
US	Louisiana	HUM	Houma-Terrebonne Airport	29.5665	-90.6604
US	Maine	HUL	Houlton International Airport	46.1231	-67.7921
US	Oklahoma	HUJ	Stan Stamper Municipal Airport	34.0348	-95.5419
US	New Mexico	RUI	Sierra Blanca Regional Airport	33.4628	-105.535
US	Vermont	RUT	Rutland - Southern Vermont Regional Airport	43.5294	-72.9496
US	Iowa	HUD	Humboldt Municipal Airport	42.7361	-94.2452
US	Massachusetts	HUC	Humacao Airport	18.1381	-65.8013
US	Virginia	BCB	Virginia Tech Montgomery Executive Airport	37.2076	-80.4078
US	Alabama	HUA	Redstone Army Airfield	34.6787	-86.6848
US	Ohio	HTW	Lawrence County Airpark	38.4193	-82.4943
US	Utah	RVR	Green River Municipal Airport	38.9614	-110.227
US	Oklahoma	RVS	Richard Lloyd Jones Jr. Airport	36.0396	-95.9846
US	Texas	HTV	Huntsville Municipal Airport (Bruce Brothers Regional)	30.7469	-95.5872
US	Minnesota	RWF	Redwood Falls Municipal Airport	44.5472	-95.0823
US	North Carolina	RWI	Rocky Mount-Wilson Regional Airport	35.8563	-77.8919
US	Wyoming	RWL	Rawlins Municipal Airport (Harvey Field)	41.8056	-107.2
US	Idaho	RXE	Rexburg-Madison County Airport	43.8339	-111.805
US	Pennsylvania	BBX	Wings Field	40.1375	-75.2651
US	West Virginia	HTS	Tri-State Airport (Milton J. Ferguson Field)	38.3667	-82.558
US	New York	HTO	East Hampton Airport	40.9596	-72.2518
US	Michigan	HTL	Roscommon County-Blodgett Memorial Airport	44.3598	-84.6711
US	North Carolina	RZZ	Halifax County Airport	36.4395	-77.7093
US	Nebraska	BBW	Broken Bow Municipal Airport	41.4365	-99.6422
US	Wyoming	SAA	Shively Field	41.4449	-106.824
US	Nevada	HTH	Hawthorne Industrial Airport	38.5444	-118.634
US	California	SAC	Sacramento Executive Airport	38.5125	-121.493
US	Arizona	SAD	Safford Regional Airport	32.8548	-109.635
US	New Mexico	SAF	Santa Fe Municipal Airport	35.6171	-106.089
US	California	SAN	San Diego International Airport	32.7336	-117.19
US	Alabama	HSV	Huntsville International Airport (Carl T. Jones Field)	34.6372	-86.7751
US	Florida	HST	Homestead Air Reserve Base	25.4886	-80.3836
US	Illinois	SAR	Sparta Community Airport (Hunter Field)	38.1489	-89.6987
US	California	SAS	Salton Sea Airport	33.2414	-115.952
US	Texas	SAT	San Antonio International Airport	29.5337	-98.4698
US	Virginia	HSP	Ingalls Field	37.9514	-79.8339
US	Georgia	SAV	Savannah/Hilton Head International Airport	32.1276	-81.2021
US	Alaska	HSL	Huslia Airport	65.6979	-156.351
US	Texas	BBD	Curtis Field	31.1793	-99.3239
US	Texas	BBC	Bay City Municipal Airport	28.9733	-95.8635
US	California	SBA	Santa Barbara Municipal Airport	34.4262	-119.84
US	California	SBD	San Bernardino International Airport	34.0954	-117.235
US	Nebraska	HSI	Hastings Municipal Airport	40.6053	-98.4279
US	Nevada	HSH	Henderson Executive Airport	35.9728	-115.134
US	Illinois	HSB	Harrisburg-Raleigh Airport	37.8113	-88.5503
US	Minnesota	BBB	Benson Municipal Airport	45.3319	-95.6506
US	Arkansas	HRO	Boone County Airport	36.2615	-93.1547
US	Texas	HRL	Valley International Airport	26.2285	-97.6544
US	Wisconsin	SBM	Sheboygan County Memorial Airport	43.7696	-87.8514
US	Utah	SBO	Salina-Gunnison Airport	39.0291	-111.838
US	California	SBP	San Luis Obispo County Regional Airport (McChesney Field)	35.2368	-120.642
US	Colorado	SBS	Steamboat Springs Airport (Bob Adams Field)	40.5163	-106.866
US	Montana	SBX	Shelby Airport	48.5407	-111.871
US	Maryland	SBY	Salisbury-Ocean City-Wicomico Regional Airport	38.3405	-75.5103
US	Nebraska	SCB	Scribner State Airport	41.6103	-96.6299
US	Alaska	SCC	Deadhorse Airport	70.1947	-148.465
US	Pennsylvania	SCE	University Park Airport	40.8493	-77.8487
US	Arizona	SCF	Scottsdale Airport	33.6229	-111.911
US	Washington	HQM	Bowerman Airport	46.9712	-123.937
US	New York	SCH	Schenectady County Airport	42.8525	-73.9289
US	Nevada	BAM	Battle Mountain Airport (Lander County Airport)	40.599	-116.874
US	California	SCK	Stockton Metropolitan Airport	37.8942	-121.238
US	Texas	HPY	Baytown Airport	29.7861	-94.9527
US	Alaska	SCM	Scammon Bay Airport	61.8453	-165.571
US	Hawaii	HPV	Princeville Airport	22.2092	-159.446
US	Iowa	HPT	Hampton Municipal Airport	42.7237	-93.2263
US	New York	HPN	Westchester County Airport	41.067	-73.7076
US	Alaska	HPB	Hooper Bay Airport	61.5239	-166.147
US	Kentucky	SDF	Louisville International Airport (Standiford Field)	38.1744	-85.736
US	Texas	HOU	William P. Hobby Airport	29.6454	-95.2789
US	Arkansas	HOT	Memorial Field Airport	34.478	-93.0962
US	California	SDM	Brown Field Municipal Airport	32.5723	-116.98
US	Alaska	SDP	Sand Point Airport	55.315	-160.523
US	Massachusetts	BAF	Westfield-Barnes Regional Airport	42.1578	-72.7156
US	Kentucky	HOP	Campbell Army Airfield	36.6686	-87.4962
US	South Dakota	HON	Huron Regional Airport	44.3852	-98.2285
US	Alaska	HOM	Homer Airport	59.6456	-151.477
US	Arizona	SDX	Sedona Airport	34.8486	-111.788
US	Montana	SDY	Sidney-Richland Municipal Airport	47.7069	-104.193
US	Washington	SEA	Seattle-Tacoma International Airport	47.449	-122.309
US	California	SEE	Gillespie Field	32.8262	-116.972
US	Florida	SEF	Sebring Regional Airport	27.4564	-81.3424
US	Pennsylvania	SEG	Penn Valley Airport	40.8206	-76.8639
US	Alabama	SEM	Craig Field	32.3439	-86.9878
US	Texas	SEP	Stephenville Clark Regional Airport	32.2153	-98.1777
US	New Mexico	HOB	Lea County Regional Airport	32.6875	-103.217
US	Louisiana	BAD	Barksdale Air Force Base	32.5018	-93.6627
US	California	BAB	Beale Air Force Base	39.1361	-121.437
US	Alaska	HNS	Haines Airport	59.2438	-135.524
US	Florida	SFB	Orlando Sanford International Airport	28.7776	-81.2375
US	Hawaii	HNM	Hana Airport	20.7956	-156.014
US	Washington	SFF	Felts Field	47.6828	-117.323
US	Hawaii	HNL	Daniel K. Inouye International Airport	21.3206	-157.924
US	Alaska	HNH	Hoonah Airport	58.0961	-135.41
US	North Carolina	HNC	Billy Mitchell Airport	35.2328	-75.6178
US	Maine	SFM	Sanford Seacoast Regional Airport	43.3939	-70.708
US	California	SFO	San Francisco International Airport	37.619	-122.375
US	Rhode Island	SFZ	North Central State Airport	41.9208	-71.4914
US	California	HMT	Hemet-Ryan Airport	33.734	-117.023
US	Missouri	SGF	Springfield-Branson National Airport	37.2457	-93.3886
US	Ohio	SGH	Springfield-Beckley Municipal Airport	39.8403	-83.8402
US	New Mexico	HMN	Holloman Air Force Base	32.8525	-106.107
US	Michigan	AZO	Kalamazoo/Battle Creek International Airport	42.2349	-85.5521
US	Texas	SGR	Sugar Land Regional Airport	29.6223	-95.6565
US	Arkansas	SGT	Stuttgart Municipal Airport	34.5995	-91.575
US	Utah	SGU	St. George Regional Airport	37.0364	-113.51
US	Alaska	SGW	Saginaw Seaplane Base	56.8863	-134.158
US	Alaska	SGY	Skagway Airport	59.4601	-135.316
US	Arizona	AZA	Phoenix-Mesa Gateway Airport	33.3078	-111.655
US	Texas	HLR	Hood Army Airfield	31.1387	-97.7145
US	Virginia	SHD	Shenandoah Valley Regional Airport	38.2638	-78.8964
US	Montana	HLN	Helena Regional Airport	46.6068	-111.983
US	Michigan	HLM	Park Township Airport	42.7959	-86.162
US	Alaska	SHG	Shungnak Airport	66.8881	-157.162
US	Alaska	SHH	Shishmaref Airport	66.2496	-166.089
US	California	HLI	Hollister Municipal Airport	36.8933	-121.41
US	West Virginia	HLG	Wheeling Ohio County Airport	40.175	-80.6463
US	Washington	SHN	Sanderson Field	47.2336	-123.148
US	Kansas	HLC	Hill City Municipal Airport	39.3788	-99.8315
US	Wyoming	SHR	Sheridan County Airport	44.7692	-106.98
US	North Carolina	HKY	Hickory Regional Airport	35.7411	-81.3895
US	Georgia	AYS	Waycross-Ware County Airport	31.2491	-82.3955
US	Louisiana	SHV	Shreveport Regional Airport	32.4466	-93.8256
US	Alaska	SHX	Shageluk Airport	62.6923	-159.569
US	Mississippi	HKS	Hawkins Field	32.3345	-90.2222
US	Alaska	HKB	Healy Lake Airport	63.9958	-144.693
US	Missouri	SIK	Sikeston Memorial Municipal Airport	36.8989	-89.5618
US	Arkansas	HKA	Blytheville Municipal Airport	35.9404	-89.8308
US	Alaska	SIT	Sitka Rocky Gutierrez Airport	57.0471	-135.362
US	Oregon	HIO	Hillsboro Airport (Portland-Hillsboro Airport)	45.5404	-122.95
US	New Mexico	AXX	Angel Fire Airport	36.422	-105.29
US	Hawaii	MDY	Henderson Field	28.2017	-177.381
US	Ohio	AXV	Neil Armstrong Airport	40.4934	-84.2989
US	California	SIY	Siskiyou County Airport	41.7781	-122.473
US	California	SJC	San Jose International Airport	37.3626	-121.929
US	Arizona	HII	Lake Havasu City Airport	34.5711	-114.358
US	Oklahoma	AXS	Altus/Quartz Mountain Regional Airport	34.698	-99.3385
US	Utah	HIF	Hill Air Force Base	41.124	-111.973
US	New Hampshire	HIE	Mount Washington Regional Airport	44.3676	-71.5445
US	Minnesota	HIB	Range Regional Airport	47.3866	-92.839
US	Arizona	SJN	St. Johns Industrial Air Park	34.5186	-109.379
US	Ohio	SKY	Griffing Sandusky Airport	41.4333	-82.6522
US	Connecticut	BDL	Bradley International Airport	41.9392	-72.6833
US	Idaho	IDA	Idaho Falls Regional Airport	43.5136	-112.071
US	Illinois	MDW	Chicago Midway International Airport	41.7861	-87.7525
US	Illinois	ORD	Chicago O'Hare International Airport	41.9786	-87.9047
US	Illinois	RFD	Chicago Rockford International Airport	42.1953	-89.0972
US	Maryland	BWI	Baltimore/Washington International Airport	39.1753	-76.6683
US	Michigan	DTW	Detroit Metro Wayne County Airport	42.2125	-83.3533
US	New Jersey	EWR	Newark Liberty International Airport	40.6925	-74.1686
US	New York	JFK	John F. Kennedy International Airport	40.6397	-73.7789
US	New York	LGA	LaGuardia Airport	40.775	-73.875
US	New York	SWF	New York Stewart International Airport	41.5042	-74.1047
US	North Dakota	XWA	Williston Basin International Airport	48.2597	-103.751
US	Virginia	DCA	Ronald Reagan Washington National Airport	38.8522	-77.0378
UY	Rivera	VCH	Vichadero Airport	-31.767	-54.617
UY	Durazno	DZO	Santa Bernardina International Airport	-33.3589	-56.4992
UY	Salto	STY	Nueva Hesperides International Airport	-31.4385	-57.9853
UY	Maldonado	PDP	Capitan de Corbeta Carlos A. Curbelo International Airport	-34.8551	-55.0943
UY	Paysandu	PDU	Tydeo Larre Borges International Airport	-32.3633	-58.0619
UY	Treinta y Tres	TYT	Treinta y Tres Airport	-33.1957	-54.3472
UY	Cerro Largo	MLZ	Cerro Largo International Airport	-32.3379	-54.2167
UY	Artigas	ATI	Artigas International Airport	-30.4007	-56.5079
UY	Colonia	CYR	Colonia Airport (Laguna de los Patos Intn'l Airport)	-34.4564	-57.7706
UY	Tacuarembo	TAW	Tacuarembo Airport	-31.749	-55.9258
UY	Rivera	RVY	Pres. Gral. Oscar D. Gestido International Airport	-30.9746	-55.4762
UY	Montevideo	MVD	Carrasco Gral. Cesareo L. Berisso International Airport	-34.8384	-56.0308
UY	Artigas	BUV	Placeres Airport	-30.3333	-57.0833
UZ	Surxondaryo	TMJ	Termez Airport	37.2867	67.31
UZ	Farg'ona	FEG	Fergana International Airport	40.3588	71.745
UZ	Navoiy	NVI	Navoi International Airport	40.1172	65.1708
UZ	Buxoro	AFS	Zarafshan Airport	41.6139	64.2332
UZ	Qoraqalpog'iston Respublikasi	NCU	Nukus Airport	42.4884	59.6233
UZ	Andijon	AZN	Andizhan Airport	40.7277	72.294
UZ	Buxoro	BHK	Bukhara International Airport	39.775	64.4833
UZ	Xorazm	UGC	Urgench International Airport	41.5843	60.6417
UZ	Namangan	NMA	Namangan Airport	40.9846	71.5567
UZ	Samarqand	SKD	Samarkand International Airport	39.7005	66.9838
UZ	Qashqadaryo	KSQ	Karshi Airport	38.8336	65.9215
VC	Grenadines	PLI	Palm Island Airport	12.587	-61.397
VC	Grenadines	CIW	Canouan Airport	12.699	-61.3424
VC	Grenadines	UNI	Union Island Airport	12.6001	-61.4119
VC	Grenadines	MQS	Mustique Airport	12.8879	-61.1802
VC	Grenadines	BQU	J. F. Mitchell Airport	12.9884	-61.262
VC	Saint George	SVD	Argyle International Airport	13.1443	-61.2109
VE	Carabobo	MYC	Mariscal Sucre Airport	10.25	-67.6494
VE	Vargas	CCS	Simon Bolivar International Airport	10.6012	-66.9912
VE	Sucre	GUI	Guiria Airport	10.5741	-62.3127
VE	Bolivar	ICA	Icabaru Airport	4.33632	-61.7396
VE	Zulia	CBS	Oro Negro Airport	10.3307	-71.3225
VE	Portuguesa	GUQ	Guanare Airport	9.02694	-69.7551
VE	Zulia	MAR	La Chinita International Airport	10.5582	-71.7279
VE	Bolivar	CBL	Tomas de Heres Airport	8.12216	-63.537
VE	Nueva Esparta	PMV	Santiago Marino Caribbean International Airport	10.9126	-63.9666
VE	Anzoategui	BLA	General Jose Antonio Anzoategui International Airport	10.1111	-64.6922
VE	Bolivar	KAV	Kavanayen Airport	5.633	-61.783
VE	Apure	SFD	Las Flecheras Airport	7.88332	-67.444
VE	Bolivar	CAJ	Canaima Airport	6.23199	-62.8544
VE	Zulia	LGY	Lagunillas Airport	10.124	-71.238
VE	Amazonas	PYH	Cacique Aramare Airport	5.61999	-67.6061
VE	Tachira	SVZ	Juan Vicente Gomez International Airport	7.84083	-72.4397
VE	Lara	VCR	Carora Airport	10.1756	-70.0652
VE	Trujillo	VLV	Dr. Antonio Nicolas Briceno Airport	9.34048	-70.5841
VE	Lara	BRM	Jacinto Lara International Airport	10.0427	-69.3586
VE	Apure	PTM	Palmarito Airport	7.56667	-70.1833
VE	Falcon	CZE	Jose Leonardo Chirino Airport	11.4149	-69.6809
VE	Guarico	VDP	Valle de la Pascua Airport	9.22203	-65.9936
VE	Tachira	SCI	Paramillo Airport	7.80132	-72.2029
VE	Bolivar	TMO	Tumeremo Airport	7.24938	-61.5289
VE	Portuguesa	AGV	Oswaldo Guevara Mujica Airport	9.55338	-69.2379
VE	Tachira	LFR	La Fria Airport	8.23917	-72.271
VE	Barinas	SBB	Santa Barbara de Barinas Airport	7.80351	-71.1657
VE	Tachira	STD	Mayor Buenaventura Vivas Airport	7.56538	-72.0351
VE	Carabobo	VLN	Arturo Michelena International Airport	10.1497	-67.9284
VE	Bolivar	SNV	Santa Elena de Uairen Airport	4.555	-61.15
VE	Bolivar	URM	Uriman Airport	5.33333	-62.7667
VE	Guarico	CLZ	Calabozo Airport	8.92466	-67.4171
VE	Apure	GDO	Guasdualito Airport (Vare Maria Airport)	7.23333	-70.8
VE	Carabobo	PBL	Bartolome Salom Airport	10.4805	-68.073
VE	Bolivar	PPH	Parai-tepui Airport	4.56667	-61.4833
VE	Delta Amacuro	TUV	San Rafael Airport	9.08899	-62.0942
VE	Apure	PPZ	Puerto Paez Airport	6.23333	-67.4336
VE	Sucre	CUP	General Jose Francisco Bermudez Airport	10.66	-63.2617
VE	Yaracuy	SNF	Sub Teniente Nestor Arias Airport	10.2787	-68.7552
VE	Sucre	CUM	Antonio Jose de Sucre Airport	10.4503	-64.1305
VE	Barinas	BNS	Barinas Airport	8.615	-70.2142
VE	Bolivar	CXA	Caicara del Orinoco Airport	7.62551	-66.1628
VE	Bolivar	KTV	Kamarata Airport	5.75	-62.416
VE	Merida	MRD	Alberto Carnevalli Airport	8.58208	-71.161
VE	Anzoategui	ELX	El Tigre Airport	9.57	-62.4367
VE	Anzoategui	AAO	Anaco Airport	9.43023	-64.4707
VE	Merida	VIG	Juan Pablo Perez Alfonzo Airport	8.62414	-71.6727
VE	Monagas	MUN	Jose Tadeo Monagas International Airport	9.75453	-63.1474
VE	Delta Amacuro	PDZ	Pedernales Airport	9.97924	-62.2286
VE	Bolivar	EOR	El Dorado Airport	6.73333	-61.5833
VE	Anzoategui	SOM	San Tome Airport	8.94515	-64.1511
VE	Apure	EOZ	Elorza Airport	7.08333	-69.5333
VE	Falcon	LSP	Josefa Camejo International Airport	11.7808	-70.1515
VE	Bolivar	ICC	Andres Miguel Salazar Marcano Airport	10.7944	-63.9816
VE	Bolivar	PZO	Manuel Carlos Piar Guayana Airport	8.28853	-62.7604
VE	Zulia	STB	Miguel Urdaneta Fernandez Airport	8.97455	-71.9433
VE	Miranda	LRV	Los Roques Airport	11.95	-66.67
VE	Zulia	CUV	Casigua El Cubo Airport	8.75814	-72.5363
VG	Virgin Islands, British	TOV	West End Seaplane Base	18.45	-64.5833
VG	Virgin Islands, British	EIS	Terrance B. Lettsome International Airport	18.4448	-64.543
VG	Virgin Islands, British	NGD	Auguste George Airport	18.7272	-64.3297
VG	Virgin Islands, British	VIJ	Virgin Gorda Airport	18.4464	-64.4275
VG	Virgin Islands, British	RAD	Road Town Seaplane Base	18.45	-64.6
VI	Virgin Islands, U.S.	SPB	Charlotte Amalie Harbor Seaplane Base (St. Thomas Seaplane Base)	18.3386	-64.9407
VI	Virgin Islands, U.S.	STX	Henry E. Rohlsen Airport	17.7019	-64.7986
VI	Virgin Islands, U.S.	STT	Cyril E. King Airport	18.3373	-64.9734
VI	Virgin Islands, U.S.	SSB	Christiansted Harbor Seaplane Base (St. Croix Seaplane Base)	17.7472	-64.7049
VI	Virgin Islands, U.S.	SJF	Cruz Bay Seaplane Base	18.3315	-64.796
VN	Quang Ninh	VDO	Van Don International Airport	21.1178	107.414
VN	Dien Bien	DIN	Dien Bien Phu Airport	21.3975	103.008
VN	Quang Nam	TMK	Tam Ky Airport	27.0522	86.8619
VN	Ba Ria - Vung Tau	VTG	Vung Tau Airport	10.3725	107.095
VN	Ba Ria - Vung Tau	HOO	Nhon Co Airport	11.9787	107.564
VN	Ha Noi	HAN	Noi Bai International Airport	21.2212	105.807
VN	Ninh Thuan	PHA	Phan Rang Air Base	11.6335	108.952
VN	Nghe An	VII	Vinh International Airport	18.7376	105.671
VN	Son La	SQH	Na San Airport	21.217	104.033
VN	Soc Trang	SOA	Soc Trang Airfield	9.5814	105.96
VN	Dak Lak	BMV	Buon Ma Thuot Airport	12.6683	108.12
VN	Vinh Long	XVL	Vinh Long Airport	10.2509	105.945
VN	Thanh Hoa	THD	Tho Xuan Airport	19.9017	105.468
VN	Ho Chi Minh	SGN	Tan Son Nhat International Airport	10.8188	106.652
VN	Kon Tum	KON	Kontum Airport	14.35	108.017
VN	Khanh Hoa	NHA	Nha Trang Air Base	12.2275	109.192
VN	Ba Ria - Vung Tau	VCS	Con Dao Airport	8.73183	106.633
VN	Binh Dinh	UIH	Phu Cat Airport	13.955	109.042
VN	Thua Thien-Hue	HUI	Phu Bai International Airport	16.4015	107.703
VN	Lam Dong	DLI	Lien Khuong Airport	11.75	108.367
VN	Gia Lai	PXU	Pleiku Airport	14.0045	108.017
VN	Khanh Hoa	CXR	Cam Ranh International Airport	11.9982	109.219
VN	Quang Binh	VDH	Dong Hoi Airport	17.515	106.591
VN	Quang Ngai	XNG	Quang Ngai Airport	15.1155	108.772
VN	Ca Mau	CAH	Ca Mau Airport	9.17767	105.178
VN	Kien Giang	VKG	Rach Gia Airport	9.95803	105.132
VN	Phu Yen	TBB	Dong Tac Airport	13.0496	109.334
VN	Quang Nam	VCL	Chu Lai International Airport	15.4033	108.706
VN	An Giang	XLO	Long Xuyen Airport	10.3301	105.473
VN	Da Nang	DAD	Da Nang International Airport	16.0439	108.199
VN	Kien Giang	PQC	Phu Quoc International Airport	10.1698	103.993
VN	Can Tho	VCA	Can Tho International Airport	10.0851	105.712
VN	Hai Phong	HPH	Cat Bi International Airport	20.8194	106.725
VU	Shefa	UIQ	Quoin Hill Airfield	-17.54	168.442
VU	Torba	MTV	Mota Lava Airport	-13.666	167.712
VU	Malampa	NUS	Norsup Airport	-16.0797	167.401
VU	Penama	LOD	Longana Airport	-15.3067	167.967
VU	Malampa	LPM	Malekoula Airport (Lamap Airport)	-16.4611	167.829
VU	Malampa	CCV	Craig Cove Airport	-16.265	167.924
VU	Tafea	IPA	Ipota Airport	-18.8564	169.283
VU	Penama	LNE	Lonorore Airport	-15.8656	168.172
VU	Malampa	ULB	Ulei Airport	-16.3297	168.301
VU	Tafea	DLY	Dillon's Bay Airport	-18.7694	169.001
VU	Shefa	LNB	Lamen Bay Airport	-16.5842	168.159
VU	Tafea	FTA	Futuna Airport	-19.5164	170.232
VU	Shefa	TGH	Tongoa Airport	-16.8911	168.551
VU	Tafea	AWD	Aniwa Airport	-19.2346	169.601
VU	Tafea	AUY	Anatom Airport	-20.2492	169.771
VU	Sanma	OLJ	Olpoi Airport (North West Santo Airport)	-14.8817	166.558
VU	Torba	TOH	Torres Airport	-13.328	166.638
VU	Torba	SLH	Vanua Lava Airport	-13.8517	167.537
VU	Penama	MWF	Maewo-Naone Airport	-15	168.083
VU	Tafea	TAH	Whitegrass Airport	-19.4551	169.224
VU	Sanma	SON	Santo-Pekoa International Airport	-15.505	167.22
VU	Torba	ZGU	Gaua Airport	-14.2181	167.587
VU	Penama	RCL	Redcliffe Airport	-15.472	167.835
VU	Malampa	PBJ	Paama Airport	-16.439	168.257
VU	Penama	WLH	Walaha Airport	-15.412	167.691
VU	Shefa	VLI	Bauerfield International Airport	-17.6993	168.32
VU	Shefa	EAE	Siwo Airport	-17.0903	168.343
VU	Shefa	VLS	Valesdir Airport	-16.7961	168.177
VU	Malampa	SWJ	South West Bay Airport	-16.4864	167.447
VU	Penama	SSR	Sara Airport	-15.4708	168.152
WF	Uvea	WLS	Hihifo Airport	-13.2383	-176.199
WF	Uvea	FUT	Pointe Vele Airport	-14.3114	-178.066
WS	Tuamasaga	FGI	Fagali'i Airport	-13.8487	-171.74
WS	Fa'asaleleaga	MXS	Maota Airport	-13.7423	-172.258
WS	Tuamasaga	APW	Faleolo International Airport	-13.83	-172.008
WS	Tuamasaga	AAU	Asau Airport	-13.5051	-172.628
YE	Hajjah	EAB	Abbs Airport	16.0108	43.1767
YE	Ma'rib	WDA	Wadi Ain Airport	14.867	45.55
YE	Hadramawt	SCT	Socotra Airport	12.6307	53.9058
YE	Hadramawt	RIY	Riyan International Airport	14.6626	49.375
YE	Ad Dali'	DHL	Dhala Airport	13.6858	44.1389
YE	Al Mahrah	IHN	Qishn Airport	15.417	51.683
YE	Sa'dah	SYE	Saadah Airport	16.967	43.733
YE	Al Hudaydah	HOD	Hodeida International Airport	14.753	42.9763
YE	Ta'izz	TAI	Taiz International Airport	13.686	44.1391
YE	Sa'dah	BUK	Albuq Airport	17.3467	44.6217
YE	Al Bayda'	BYD	Al Bayda Airport	14.106	45.4411
YE	Amanat al 'Asimah	SAH	Sana'a International Airport (El Rahaba Airport)	15.4763	44.2197
YE	Adan	ADE	Aden International Airport	12.8295	45.0288
YE	Al Mahrah	AAY	Al Ghaydah Airport	16.1917	52.175
YE	Hadramawt	GXF	Sayun Airport	15.9661	48.7883
YE	Abyan	LDR	Lawdar Airport	13.9376	45.6592
YE	Al Hudaydah	KAM	Kamaran Airport	15.3633	42.605
YE	Abyan	DAH	Dathina Airport	13.9376	45.6592
YE	Dhamar	DMR	Dhamar Airport	15.4792	44.2197
YE	Abyan	UKR	Mukeiras Airport	13.9368	45.657
YE	San'a'	RXA	Ar Rawdah Airport	14.45	47.283
YE	Shabwah	AXK	Ataq Airport	14.5513	46.8262
YE	Ma'rib	MYN	Marib Airport	15.4692	45.3269
YE	Shabwah	BHN	Beihan Airport	14.782	45.7201
YE	San'a	SAH	Sana'a International Airport	15.4764	44.2197
YT	Dzaoudzi	DZA	Dzaoudzi-Pamandzi International Airport	-12.8047	45.2811
ZA	Western Cape	PBZ	Plettenberg Bay Airport	-34.0882	23.3287
ZA	Limpopo	ULX	Ulusaba Airstrip	-24.7854	31.3549
ZA	Limpopo	ELL	Ellisras Airport	-23.7267	27.6883
ZA	Limpopo	MWR	Motswari Airstrip	-24.1903	31.3864
ZA	Mpumalanga	ZEC	Secunda Airport	-26.5241	29.1701
ZA	Eastern Cape	CDO	Cradock Airport	-32.1567	25.6456
ZA	Mpumalanga	MQP	Kruger Mpumalanga International Airport	-25.3832	31.1056
ZA	North-West	RVO	Reivilo Airport	-27.5472	24.1725
ZA	Free State	FCB	Ficksburg Airport	-28.8231	27.9089
ZA	Limpopo	THY	P.R. Mphephu Airport	-23.0769	30.3836
ZA	Mpumalanga	SZK	Skukuza Airport	-24.9609	31.5887
ZA	Northern Cape	KIG	Koingnaas Airport	-30.1878	17.2792
ZA	Northern Cape	KIM	Kimberley Airport	-28.8028	24.7652
ZA	Kwazulu-Natal	VYD	Vryheid Airport	-27.7869	30.7964
ZA	Limpopo	TSD	Tshipise Airport	-22.6193	30.1756
ZA	Kwazulu-Natal	DUK	Dukuduku Airport	-28.3684	32.2481
ZA	Limpopo	GIY	Giyani Airport	-23.2833	30.65
ZA	Free State	BFN	Bloemfontein Airport	-29.0927	26.3024
ZA	North-West	MBD	Mahikeng Airport (Mmabatho Airport)	-25.7984	25.548
ZA	Limpopo	MEZ	Messina Airport	-22.356	29.9862
ZA	Free State	WEL	Welkom Airport	-27.9968	26.6633
ZA	Northern Cape	UTN	Upington Airport	-28.3991	21.2602
ZA	Western Cape	SDB	Air Force Base Langebaanweg	-32.9689	18.1603
ZA	Gauteng	WKF	Air Force Base Waterkloof	-25.83	28.2225
ZA	Northern Cape	ALJ	Alexander Bay Airport	-28.575	16.5333
ZA	Northern Cape	AGZ	Aggeneys Airport	-29.2818	18.8139
ZA	Eastern Cape	UTT	Mthatha Airport	-31.5464	28.6734
ZA	Eastern Cape	UTW	Queenstown Airport	-31.9202	26.8822
ZA	Mpumalanga	GSS	Sabi Sabi Airport	-24.9474	31.4488
ZA	Eastern Cape	AFD	Port Alfred Airport	-33.5542	26.8777
ZA	Kwazulu-Natal	DUR	King Shaka International Airport	-29.6144	31.1197
ZA	Western Cape	CPT	Cape Town International Airport	-33.9648	18.6017
ZA	Limpopo	LTA	Tzaneen Airport (Letaba Airport)	-23.8244	30.3293
ZA	Mpumalanga	NGL	Ngala Airfield	-24.389	31.326
ZA	Kwazulu-Natal	PZB	Pietermaritzburg Airport	-29.649	30.3987
ZA	Kwazulu-Natal	PZL	Zulu Inyala Airport	-27.8494	32.3097
ZA	Western Cape	ROD	Robertson Airfield	-33.8122	19.9028
ZA	Limpopo	ADY	Alldays Airport	-22.679	29.0555
ZA	Mpumalanga	NLP	Nelspruit Airport	-25.5	30.9138
ZA	Kwazulu-Natal	RCB	Richards Bay Airport	-28.741	32.0921
ZA	Limpopo	LCD	Louis Trichardt Airport	-23.0619	29.8647
ZA	Kwazulu-Natal	NCS	Newcastle Airport	-27.7706	29.9769
ZA	Gauteng	GCJ	Grand Central Airport	-25.9863	28.1401
ZA	Eastern Cape	BIY	Bhisho Airport	-32.8971	27.2791
ZA	Eastern Cape	JOH	Port St. Johns Airport	-31.6059	29.5198
ZA	Northern Cape	LMR	Finsch Mine Airport	-28.3601	23.4391
ZA	Limpopo	HDS	Air Force Base Hoedspruit	-24.3686	31.0487
ZA	Northern Cape	SIS	Sishen Airport	-27.6486	22.9993
ZA	Eastern Cape	PLZ	Port Elizabeth Airport	-33.9849	25.6173
ZA	Western Cape	GRJ	George Airport	-34.0056	22.3789
ZA	Limpopo	INY	Inyati Airport	-24.7777	31.3855
ZA	Eastern Cape	ELS	East London Airport	-33.0356	27.8259
ZA	Northern Cape	KMH	Johan Pienaar Airport	-27.4567	23.4114
ZA	Western Cape	OUH	Oudtshoorn Airport	-33.607	22.189
ZA	Kwazulu-Natal	LAY	Ladysmith Airport	-28.5817	29.7497
ZA	Kwazulu-Natal	ULD	Ulundi Airport	-28.3206	31.4165
ZA	Free State	HRS	Harrismith Airport	-28.2351	29.1062
ZA	North-West	PCF	Potchefstroom Airport	-26.671	27.0819
ZA	Western Cape	VRE	Vredendal Airport	-31.641	18.5448
ZA	North-West	NTY	Pilanesberg International Airport	-25.3338	27.1734
ZA	Northern Cape	KLZ	Kleinzee Airport	-29.6884	17.094
ZA	Northern Cape	SBU	Springbok Airport	-29.6893	17.9396
ZA	Western Cape	MZY	Mossel Bay Airport	-34.1583	22.0586
ZA	Free State	TCU	Thaba Nchu Airport	-29.3178	26.8228
ZA	North-West	VRU	Vryburg Airport	-26.9824	24.7288
ZA	Kwazulu-Natal	MZQ	Mkuze Airport	-27.6261	32.0443
ZA	Eastern Cape	MZF	Wild Coast Sun Airport	-31.25	29.833
ZA	Kwazulu-Natal	HLW	Hluhluwe Airport	-28.0166	32.2752
ZA	Kwazulu-Natal	VIR	Virginia Airport	-29.7706	31.0584
ZA	Limpopo	LDZ	Londolozi Airport	-24.7478	31.4743
ZA	Limpopo	PHW	Hendrik Van Eck Airport	-23.9372	31.1554
ZA	Mpumalanga	TDT	Tanda Tula Airport	-24.5336	31.3
ZA	Mpumalanga	KOF	Komatipoort Airport	-25.4403	31.93
ZA	Kwazulu-Natal	MGH	Margate Airport	-30.8574	30.343
ZA	North-West	KXE	Klerksdorp Airport (P.C. Pelser Airport)	-26.8711	26.718
ZA	Gauteng	HLA	Lanseria International Airport	-25.9385	27.9261
ZA	Mpumalanga	HZV	Hazyview Airport	-25.0501	31.1319
ZA	Gauteng	QRA	Rand Airport	-26.2425	28.1512
ZA	Gauteng	PRY	Wonderboom Airport	-25.6539	28.2242
ZA	Western Cape	OVG	Air Force Base Overberg	-34.5549	20.2507
ZA	Limpopo	PTG	Polokwane International Airport	-23.8453	29.4586
ZA	Gauteng	JNB	O. R. Tambo International Airport	-26.1392	28.246
ZA	Northern Cape	PRK	Prieska Airport	-29.6836	22.7706
ZA	Mpumalanga	AAM	Mala Mala Airport	-24.8181	31.5446
ZA	Eastern Cape	MBM	Mkambati Airport	-31.2833	29.9667
ZA	Kwazulu-Natal	EMG	Empangeni Airport	-28.72	31.89
ZA	Limpopo	KHO	Khoka Moya Airport	-24.593	31.4151
ZA	Mpumalanga	LLE	Malelane Airport	-25.43	31.5767
ZM	Lusaka	LUN	Kenneth Kaunda International Airport	-15.3308	28.4526
ZM	Southern	LVI	Harry Mwanga Nkumbula International Airport	-17.8218	25.8227
ZM	Western	LXU	Lukulu Airport	-14.3748	23.2495
ZM	Luapula	MNS	Mansa Airport	-11.137	28.8726
ZM	Copperbelt	KIW	Southdowns Airport	-12.9005	28.1499
ZM	Western	MNR	Mongu Airport	-15.2545	23.1623
ZM	Northern	MMQ	Mbala Airport	-8.85917	31.3364
ZM	Western	SJQ	Sesheke Airport	-17.4763	24.3047
ZM	North-Western	BBZ	Zambezi Airport	-13.537	23.1081
ZM	Northern	KAA	Kasama Airport	-10.2167	31.1333
ZM	Lusaka	RYL	Royal Airstrip	-15.7255	29.3021
ZM	Southern	ZGM	Ngoma Airport	-15.9658	25.9333
ZM	North-Western	SLI	Solwezi Airport	-12.1737	26.3651
ZM	Eastern	CIP	Chipata Airport	-13.5583	32.5872
ZM	Northern	ZKB	Kasaba Bay Airport	-8.525	30.663
ZM	Eastern	MFU	Mfuwe Airport	-13.2589	31.9366
ZM	Western	SXG	Senanga Airport	-16.113	23.2982
ZM	Western	KMZ	Kaoma Airport	-14.8	24.783
ZM	Western	KLB	Kalabo Airport	-14.9983	22.6454
ZM	Copperbelt	NLA	Simon Mwansa Kapwepwe International Airport	-12.9981	28.6649
ZM	Copperbelt	CGJ	Kasompe Airport	-12.5728	27.8939
ZW	Masvingo	MJW	Mahenye Airport	-21.231	32.3336
ZW	Manicaland	UTA	Mutare Airport	-18.9975	32.6272
ZW	Mashonaland West	BZH	Bumi Hills Airstrip	-16.817	28.35
ZW	Matabeleland North	VFA	Victoria Falls Airport	-18.0959	25.839
ZW	Masvingo	MVZ	Masvingo Airport	-20.0553	30.8591
ZW	Masvingo	BFO	Buffalo Range Airport	-21.0081	31.5786
ZW	Matabeleland North	HWN	Hwange National Park Airport	-18.6299	27.021
ZW	Matabeleland North	WKI	Hwange Town Airport	-18.363	26.5198
ZW	Midlands	GWE	Thornhill Air Base	-19.4364	29.8619
ZW	Bulawayo	BUQ	Joshua Mqabuko Nkomo International Airport	-20.0174	28.6179
ZW	Manicaland	CHJ	Chipinge Airport	-20.2067	32.6283
ZW	Mashonaland West	KAB	Kariba Airport	-16.5198	28.885
ZW	Harare	HRE	Robert Gabriel Mugabe International Airport	-17.9318	31.0928
\.


--
-- Data for Name: flight_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flight_emissions (id, user_id, "timestamp", departure_airport, destination_airport, flight_distance, emission) FROM stdin;
1	5b889d16-00db-4370-b394-bcff50ef2152	2023-11-12 09:31:39.86953	CGK	PKU	933.2299737578218	147.45033585373585
2	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-13 13:58:07.133592	CGK	PKU	933.2299737578218	147.45033585373585
3	8faf6a6e-265b-461f-b280-90903019b047	2023-12-08 11:08:22.556281	BTH	AHI	2801.6049884530207	0
4	8faf6a6e-265b-461f-b280-90903019b047	2023-12-08 11:10:06.226776	BTH	AHI	2801.6049884530207	442.6535881755773
5	8faf6a6e-265b-461f-b280-90903019b047	2023-12-08 11:18:47.637517	WSR	AKQ	3254.953688833754	514.2826828357331
6	8faf6a6e-265b-461f-b280-90903019b047	2023-12-11 13:41:26.11077	CGK	SIN	882.2368997174198	184.38751204094072
7	8faf6a6e-265b-461f-b280-90903019b047	2023-12-11 13:55:06.152009	CGK	YIA	424.3053712203952	111.59231263096395
8	8faf6a6e-265b-461f-b280-90903019b047	2023-12-11 14:35:37.637284	MES	AHI	3448.747450569815	544.9020971900308
\.


--
-- Data for Name: food_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_emissions (id, user_id, "timestamp", food_type, emission) FROM stdin;
1	5b889d16-00db-4370-b394-bcff50ef2152	2023-11-12 09:33:27.068296	Vegan	1.69
2	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:48:15.703318	Vegetarian	2.85
3	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-13 13:58:11.99908	Vegetarian	2.85
4	8faf6a6e-265b-461f-b280-90903019b047	2023-12-11 14:26:42.429839	Low Meat	3.39
5	8faf6a6e-265b-461f-b280-90903019b047	2023-12-11 14:35:44.926504	Lots of Meat	7.19
\.


--
-- Data for Name: home_appliances_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_appliances_emissions (id, user_id, "timestamp", appliance_type, duration_hours, emission) FROM stdin;
1	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:47:15.785658	Air Conditioner	3	1.83
2	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-13 13:58:19.57211	Air Conditioner	3	1.83
\.


--
-- Data for Name: power_sources_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_sources_emissions (id, user_id, "timestamp", power_source_type, usage_kwh, emission) FROM stdin;
1	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:46:10.180457	electricity	40	26.98
2	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:47:48.771272	water	40	5.96
3	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:47:57.31424	gas	12	24.2562
4	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:51:44.199595	electricity	30	20.235
5	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-13 13:58:15.79057	electricity	30	20.235
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (sid, sess, expire) FROM stdin;
REZlSnU1-7k_foUfrSmvCGTwjHiftm_k	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-15T04:08:02.594Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-15 11:08:03
5sMuAmFogp0_kdfmeDNwtBSArf5wsNxn	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:39:49.806Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:39:50
cOwjjT1zUJsye1vbZPGSfezk-DafAGgP	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:40:11.204Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:40:12
ElKVxyEJ7SQTcJWpEVRTfSSxkb9RpDET	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-15T04:09:48.233Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-15 11:10:07
mcYFQoQhWCLlQaNm7wsVEvdYEsDD60mK	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-15T04:18:39.003Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-15 11:18:40
7aqTlimDEQwSjUmbSAd5MLeoeN_rt3Uv	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-15T04:08:00.158Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-15 11:18:48
cj-Dikho2dhefKML3pykzWffS7AVZG0r	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-15T05:54:33.758Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-15 12:54:34
e09JEJbVjtcpqzUUERnufJC4j1y1IAku	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T06:35:40.472Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 13:35:41
WxN-DeB9UZh9RWE7kQ8MTO6fp9NRLD29	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T06:36:35.457Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 13:36:36
yHgRfyI8syFu9EYe68VvCWDY1Q1PIjVK	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:40:14.791Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:40:15
rT3Iwa6kE3HwAgOWTWP5abVaAg6i45pV	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T06:40:56.636Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 13:40:57
gtA9j6SrYTJpHmbLQ84UJWIoM5MuZjmS	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T06:44:12.570Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 13:44:13
I9oBoGS5hoZP7caBAMYPZqYwMpREd7Wy	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:49:31.684Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:49:32
BZjD89Iql5GmP-rMmWXoAUHbw0w-OH80	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:49:46.434Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:49:47
zUMDXY_q4WMZnvNIgn3Lbz3vwB-xTjDA	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T06:40:53.498Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:26:43
j4z0w1BeAPOsg6QdLu18O_Cz5NtIFUUP	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:34:03.806Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:34:04
72BStpwxxuoToI4R0wgkYx_zWrXMZZrU	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:35:24.161Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:35:25
ohBUqyxAs4t3vKyhpdGNmrKmbt59upc3	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:53:15.919Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:53:16
pwkpkTX-fE63_e4m-sgX7VehwvKxUlFA	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:27:11.328Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:35:45
f5JM0ADzEQ92UkIhYcPkwblQhzQNCb-Q	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:36:20.249Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"passport":{"user":"8faf6a6e-265b-461f-b280-90903019b047"}}	2023-12-18 14:36:21
cnMbKlIHNrAQNLhA-0pPb0i3Ww0KQR9K	{"cookie":{"originalMaxAge":604800000,"expires":"2023-12-18T07:36:23.296Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"}}	2023-12-18 14:36:24
\.


--
-- Data for Name: user_monthly_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_monthly_emissions (id, user_id, year_month, monthly_total_emission) FROM stdin;
2	5b889d16-00db-4370-b394-bcff50ef2152	2023-11-01	157.42873585373585
1	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-01	340.1607358537358502
3	8faf6a6e-265b-461f-b280-90903019b047	2023-11-01	7.398000000000001
4	8faf6a6e-265b-461f-b280-90903019b047	2023-12-01	1808.39819287324587
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, name, email, password_hash, registration_date) FROM stdin;
9935d7c0-f6e0-4977-b259-04a8135baf66	coba2seq	Ini Coba	coba2seq@email.com	$2a$10$JhiFm5fSLwCKQXIxVIinxOGtxEnyovbvitDyDPVm.NcF9rtBGtify	2023-11-09 22:24:37.955965
5b889d16-00db-4370-b394-bcff50ef2152	usertest1	User Test 1	usertest1@email.com	$2a$10$jkx5T.dp6c6Q5Mm3/LRCOuuNJ6dx0.mzo6JuscbdCpHnDIaWQoBWO	2023-11-10 19:03:16.031402
8faf6a6e-265b-461f-b280-90903019b047	usertest2	User Test 2	usertest2@email.com	$2a$10$u8EoFcT.nRWyG.gPoyO3zu9p.9pDEdQzgw7kGbPr5ACe0HDEl1.bO	2023-11-12 09:57:59.519156
\.


--
-- Data for Name: vehicle_emissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_emissions (id, user_id, "timestamp", vehicle_type, distance, fuel_type, emission) FROM stdin;
1	5b889d16-00db-4370-b394-bcff50ef2152	2023-11-12 09:31:11.226954	Car	20	Diesel	4.1442
2	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:48:42.298999	Car	10	Petrol	1.4946000000000002
3	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-12 09:51:07.330322	Train	20	Urban train	0.7098
4	9935d7c0-f6e0-4977-b259-04a8135baf66	2023-11-13 13:58:02.063629	Train	20	Urban train	0.7098
5	8faf6a6e-265b-461f-b280-90903019b047	2023-11-13 14:00:34.801349	Train	40	Urban train	1.4196
6	8faf6a6e-265b-461f-b280-90903019b047	2023-11-13 14:30:27.187948	Car	40	Petrol	5.978400000000001
\.


--
-- Name: flight_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flight_emissions_id_seq', 8, true);


--
-- Name: food_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_emissions_id_seq', 5, true);


--
-- Name: home_appliances_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_appliances_emissions_id_seq', 2, true);


--
-- Name: power_sources_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_sources_emissions_id_seq', 5, true);


--
-- Name: user_monthly_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_monthly_emissions_id_seq', 4, true);


--
-- Name: vehicle_emissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_emissions_id_seq', 6, true);


--
-- Name: flight_emissions flight_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions
    ADD CONSTRAINT flight_emissions_pkey PRIMARY KEY (id);


--
-- Name: food_emissions food_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions
    ADD CONSTRAINT food_emissions_pkey PRIMARY KEY (id);


--
-- Name: home_appliances_emissions home_appliances_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions
    ADD CONSTRAINT home_appliances_emissions_pkey PRIMARY KEY (id);


--
-- Name: power_sources_emissions power_sources_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions
    ADD CONSTRAINT power_sources_emissions_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: user_monthly_emissions user_monthly_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_pkey PRIMARY KEY (id);


--
-- Name: user_monthly_emissions user_monthly_emissions_user_id_year_month_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_user_id_year_month_key UNIQUE (user_id, year_month);


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
-- Name: vehicle_emissions vehicle_emissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions
    ADD CONSTRAINT vehicle_emissions_pkey PRIMARY KEY (id);


--
-- Name: flight_emissions flight_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight_emissions
    ADD CONSTRAINT flight_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: food_emissions food_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_emissions
    ADD CONSTRAINT food_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: home_appliances_emissions home_appliances_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_appliances_emissions
    ADD CONSTRAINT home_appliances_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: power_sources_emissions power_sources_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_sources_emissions
    ADD CONSTRAINT power_sources_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_monthly_emissions user_monthly_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_monthly_emissions
    ADD CONSTRAINT user_monthly_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vehicle_emissions vehicle_emissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_emissions
    ADD CONSTRAINT vehicle_emissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

