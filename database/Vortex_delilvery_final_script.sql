--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 12.6

-- Started on 2024-01-20 12:03:17 -05

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

--
-- TOC entry 197 (class 1259 OID 16921)
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id integer NOT NULL,
    identification character varying(11) NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    phone character varying(10),
    address character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16919)
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drivers_id_seq OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 196
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- TOC entry 199 (class 1259 OID 16946)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_type character varying(20),
    address character varying(50),
    conductor_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16944)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 198
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 201 (class 1259 OID 16961)
-- Name: parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    value text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.parameters OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16959)
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameters_id_seq OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 200
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- TOC entry 203 (class 1259 OID 16976)
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    model character varying(4) NOT NULL,
    plate character varying(7),
    ability character varying(7),
    conductor_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16974)
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicles_id_seq OWNER TO postgres;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 202
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- TOC entry 3021 (class 2604 OID 16924)
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- TOC entry 3024 (class 2604 OID 16949)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 16964)
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 16979)
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- TOC entry 3167 (class 0 OID 16921)
-- Dependencies: 197
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, identification, last_name, first_name, phone, address, created_at, updated_at) FROM stdin;
1	A1234567890	González	Juan	1234567890	Calle Principal 123	2024-01-19 23:34:26.148727	2024-01-19 23:34:26.148727
2	B9876543210	Pérez	María	9876543210	Avenida Secundaria 456	2024-01-19 23:34:26.148727	2024-01-19 23:34:26.148727
65815	1070658457	Garzón Gómez	Armando	3216974532	Kr 14 E 12 - 85	2024-01-20 06:13:15.438	2024-01-20 06:13:15.438
65816	1070658457	Garzón Gómez	Armando	3216974532	Kr 14 E 12 - 85	2024-01-20 16:16:01.751	2024-01-20 16:16:01.751
65817	1070658457	Garzón Gómez	Armando	3216974532	Kr 14 E 12 - 85	2024-01-20 16:16:09.188	2024-01-20 16:16:09.188
65818	1070658457	Garzón Gómez	Armando	3216974532	Kr 14 E 12 - 85	2024-01-20 16:16:13.116	2024-01-20 16:16:13.116
\.


--
-- TOC entry 3169 (class 0 OID 16946)
-- Dependencies: 199
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_type, address, conductor_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 16961)
-- Dependencies: 201
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameters (id, name, value, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 16976)
-- Dependencies: 203
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (id, model, plate, ability, conductor_id, created_at, updated_at) FROM stdin;
123124	2019	AJE3289	35KG	2	2024-01-20 16:16:33.152	2024-01-20 16:17:24.273
123125	2019	AJE3289	35KG	2	2024-01-20 16:16:36.595	2024-01-20 16:17:24.281
123126	2019	AJE3289	35KG	2	2024-01-20 16:16:41.396	2024-01-20 16:17:24.285
123127	2019	AJE3289	35KG	\N	2024-01-20 16:16:44.988	2024-01-20 16:45:12.627
123123	2019	AJE3289	35KG	\N	2024-01-20 06:02:50.764	2024-01-20 16:46:00.305
\.


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 196
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 2, true);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 198
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 200
-- Name: parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parameters_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 202
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicles_id_seq', 1, false);


--
-- TOC entry 3034 (class 2606 OID 16928)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- TOC entry 3036 (class 2606 OID 16953)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 16973)
-- Name: parameters parameters_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_name_key UNIQUE (name);


--
-- TOC entry 3040 (class 2606 OID 16971)
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 16983)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- TOC entry 3043 (class 2606 OID 16954)
-- Name: orders orders_conductor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_conductor_id_fkey FOREIGN KEY (conductor_id) REFERENCES public.drivers(id);


--
-- TOC entry 3044 (class 2606 OID 16984)
-- Name: vehicles vehicles_conductor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_conductor_id_fkey FOREIGN KEY (conductor_id) REFERENCES public.drivers(id);


-- Completed on 2024-01-20 12:03:17 -05

--
-- PostgreSQL database dump complete
--

