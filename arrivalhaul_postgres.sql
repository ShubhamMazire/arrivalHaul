--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    brand_name character varying(255),
    created_date date,
    updated_date date,
    is_active boolean
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_brand_id_seq OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(255),
    created_date date,
    updated_date date,
    is_active boolean
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name character varying(255),
    country_code character varying(255),
    currency character varying(255),
    currency_symbol character varying(10),
    created_date date,
    updated_date date,
    is_active boolean
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_unique_id character varying(255),
    product_name character varying(255),
    product_description text,
    model character varying(255),
    category_id integer,
    subcategory_id integer,
    brand_id integer,
    country_id integer,
    created_date date,
    updated_date date,
    is_active boolean
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_image (
    product_image_id integer NOT NULL,
    product_id integer,
    image_url character varying(1024)
);


ALTER TABLE public.product_image OWNER TO postgres;

--
-- Name: product_image_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_image_product_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_image_product_image_id_seq OWNER TO postgres;

--
-- Name: product_image_product_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_image_product_image_id_seq OWNED BY public.product_image.product_image_id;


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: product_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_source (
    product_source_id integer NOT NULL,
    product_id integer,
    source_id integer,
    source_url character varying(1024)
);


ALTER TABLE public.product_source OWNER TO postgres;

--
-- Name: product_source_product_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_source_product_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_source_product_source_id_seq OWNER TO postgres;

--
-- Name: product_source_product_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_source_product_source_id_seq OWNED BY public.product_source.product_source_id;


--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    source_id integer NOT NULL,
    source_name character varying(255),
    brand_id integer
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: source_price_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source_price_availability (
    source_price_availability_id integer NOT NULL,
    product_id integer,
    source_id integer,
    price character varying(255),
    raw_price character varying(255),
    discount double precision,
    created_date date,
    updated_date date,
    is_available boolean
);


ALTER TABLE public.source_price_availability OWNER TO postgres;

--
-- Name: source_price_availability_source_price_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_price_availability_source_price_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.source_price_availability_source_price_availability_id_seq OWNER TO postgres;

--
-- Name: source_price_availability_source_price_availability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_price_availability_source_price_availability_id_seq OWNED BY public.source_price_availability.source_price_availability_id;


--
-- Name: source_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.source_source_id_seq OWNER TO postgres;

--
-- Name: source_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_source_id_seq OWNED BY public.source.source_id;


--
-- Name: subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategory (
    subcategory_id integer NOT NULL,
    subcategory_name character varying(255),
    category_id integer,
    created_date date,
    updated_date date,
    is_active boolean
);


ALTER TABLE public.subcategory OWNER TO postgres;

--
-- Name: subcategory_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategory_subcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategory_subcategory_id_seq OWNER TO postgres;

--
-- Name: subcategory_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategory_subcategory_id_seq OWNED BY public.subcategory.subcategory_id;


--
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_image product_image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image ALTER COLUMN product_image_id SET DEFAULT nextval('public.product_image_product_image_id_seq'::regclass);


--
-- Name: product_source product_source_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_source ALTER COLUMN product_source_id SET DEFAULT nextval('public.product_source_product_source_id_seq'::regclass);


--
-- Name: source source_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source ALTER COLUMN source_id SET DEFAULT nextval('public.source_source_id_seq'::regclass);


--
-- Name: source_price_availability source_price_availability_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_price_availability ALTER COLUMN source_price_availability_id SET DEFAULT nextval('public.source_price_availability_source_price_availability_id_seq'::regclass);


--
-- Name: subcategory subcategory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory ALTER COLUMN subcategory_id SET DEFAULT nextval('public.subcategory_subcategory_id_seq'::regclass);


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (brand_id, brand_name, created_date, updated_date, is_active) FROM stdin;
1	Montblanc	2024-06-21	2024-06-21	t
2	OMEGA	2024-06-21	2024-06-21	t
3	Blancpain	2024-06-21	2024-06-21	t
4	Chopard	2024-06-21	2024-06-21	t
5	Girard-Perregaux	2024-06-21	2024-06-21	t
6	Ulysse Nardin	2024-06-21	2024-06-21	t
7	Breguet	2024-06-21	2024-06-21	t
8	Tudor	2024-06-21	2024-06-21	t
9	Longines	2024-06-21	2024-06-21	t
10	Breitling	2024-06-21	2024-06-21	t
11	Daniel Wellington	2024-06-21	2024-06-21	t
12	Audemars Piguet	2024-06-21	2024-06-21	t
13	Rolex	2024-06-21	2024-06-21	t
14	Cartier	2024-06-21	2024-06-21	t
15	TAG Heuer	2024-06-21	2024-06-21	t
16	Hublot	2024-06-21	2024-06-21	t
17	Bell & Ross	2024-06-21	2024-06-21	t
18	Swatch	2024-06-21	2024-06-21	t
19	Timex	2024-06-21	2024-06-21	t
20	Citizen	2024-06-21	2024-06-21	t
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, category_name, created_date, updated_date, is_active) FROM stdin;
1	Watch	2024-06-21	2024-06-21	t
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country_name, country_code, currency, currency_symbol, created_date, updated_date, is_active) FROM stdin;
1	Afghanistan	AF	AFN	؋	2024-06-21	2024-06-21	t
2	Åland Islands	AX	EUR	€	2024-06-21	2024-06-21	t
3	Albania	AL	ALL	L	2024-06-21	2024-06-21	t
4	Algeria	DZ	DZD	د.ج	2024-06-21	2024-06-21	t
5	American Samoa	AS	USD	$	2024-06-21	2024-06-21	t
6	Andorra	AD	EUR	€	2024-06-21	2024-06-21	t
7	Angola	AO	AOA	Kz	2024-06-21	2024-06-21	t
8	Anguilla	AI	XCD	$	2024-06-21	2024-06-21	t
9	Antarctica	AQ	 	 	2024-06-21	2024-06-21	t
10	Antigua and Barbuda	AG	XCD	$	2024-06-21	2024-06-21	t
11	Argentina	AR	ARS	$	2024-06-21	2024-06-21	t
12	Armenia	AM	AMD	֏	2024-06-21	2024-06-21	t
13	Aruba	AW	AWG	ƒ	2024-06-21	2024-06-21	t
14	Australia	AU	AUD	$	2024-06-21	2024-06-21	t
15	Austria	AT	EUR	€	2024-06-21	2024-06-21	t
16	Azerbaijan	AZ	AZN	₼	2024-06-21	2024-06-21	t
17	Bahamas	BS	BSD	$	2024-06-21	2024-06-21	t
18	Bahrain	BH	BHD	.د.ب	2024-06-21	2024-06-21	t
19	Bangladesh	BD	BDT	৳	2024-06-21	2024-06-21	t
20	Barbados	BB	BBD	$	2024-06-21	2024-06-21	t
21	Belarus	BY	BYN	Br	2024-06-21	2024-06-21	t
22	Belgium	BE	EUR	€	2024-06-21	2024-06-21	t
23	Belize	BZ	BZD	$	2024-06-21	2024-06-21	t
24	Benin	BJ	XOF	Fr	2024-06-21	2024-06-21	t
25	Bermuda	BM	BMD	$	2024-06-21	2024-06-21	t
26	Bhutan	BT	BTN	Nu.	2024-06-21	2024-06-21	t
27	Bolivia	BO	BOB	Bs.	2024-06-21	2024-06-21	t
28	Bosnia and Herzegovina	BA	BAM	N/A	2024-06-21	2024-06-21	t
29	Botswana	BW	BWP	P	2024-06-21	2024-06-21	t
30	Bouvet Island	BV	 	 	2024-06-21	2024-06-21	t
31	Brazil	BR	BRL	R$	2024-06-21	2024-06-21	t
32	British Indian Ocean Territory	IO	USD	$	2024-06-21	2024-06-21	t
33	British Virgin Islands	VG	USD	$	2024-06-21	2024-06-21	t
34	Brunei	BN	BND	$	2024-06-21	2024-06-21	t
35	Bulgaria	BG	BGN	лв	2024-06-21	2024-06-21	t
36	Burkina Faso	BF	XOF	Fr	2024-06-21	2024-06-21	t
37	Burundi	BI	BIF	Fr	2024-06-21	2024-06-21	t
38	Cambodia	KH	KHR	៛	2024-06-21	2024-06-21	t
39	Cameroon	CM	XAF	Fr	2024-06-21	2024-06-21	t
40	Canada	CA	CAD	$	2024-06-21	2024-06-21	t
41	Cape Verde	CV	CVE	Esc	2024-06-21	2024-06-21	t
42	Caribbean Netherlands	BQ	USD	$	2024-06-21	2024-06-21	t
43	Cayman Islands	KY	KYD	$	2024-06-21	2024-06-21	t
44	Central African Republic	CF	XAF	Fr	2024-06-21	2024-06-21	t
45	Chad	TD	XAF	Fr	2024-06-21	2024-06-21	t
46	Chile	CL	CLP	$	2024-06-21	2024-06-21	t
47	China	CN	CNY	¥	2024-06-21	2024-06-21	t
48	Christmas Island	CX	AUD	$	2024-06-21	2024-06-21	t
49	Cocos (Keeling) Islands	CC	AUD	$	2024-06-21	2024-06-21	t
50	Colombia	CO	COP	$	2024-06-21	2024-06-21	t
51	Comoros	KM	KMF	Fr	2024-06-21	2024-06-21	t
52	Cook Islands	CK	CKD	$	2024-06-21	2024-06-21	t
53	Costa Rica	CR	CRC	₡	2024-06-21	2024-06-21	t
54	Croatia	HR	EUR	€	2024-06-21	2024-06-21	t
55	Cuba	CU	CUC	$	2024-06-21	2024-06-21	t
56	Curaçao	CW	ANG	ƒ	2024-06-21	2024-06-21	t
57	Cyprus	CY	EUR	€	2024-06-21	2024-06-21	t
58	Czechia	CZ	CZK	Kč	2024-06-21	2024-06-21	t
59	Denmark	DK	DKK	kr	2024-06-21	2024-06-21	t
60	Djibouti	DJ	DJF	Fr	2024-06-21	2024-06-21	t
61	Dominica	DM	XCD	$	2024-06-21	2024-06-21	t
62	Dominican Republic	DO	DOP	$	2024-06-21	2024-06-21	t
63	DR Congo	CD	CDF	FC	2024-06-21	2024-06-21	t
64	Ecuador	EC	USD	$	2024-06-21	2024-06-21	t
65	Egypt	EG	EGP	£	2024-06-21	2024-06-21	t
66	El Salvador	SV	USD	$	2024-06-21	2024-06-21	t
67	Equatorial Guinea	GQ	XAF	Fr	2024-06-21	2024-06-21	t
68	Eritrea	ER	ERN	Nfk	2024-06-21	2024-06-21	t
69	Estonia	EE	EUR	€	2024-06-21	2024-06-21	t
70	Eswatini	SZ	SZL	L	2024-06-21	2024-06-21	t
71	Ethiopia	ET	ETB	Br	2024-06-21	2024-06-21	t
72	Falkland Islands	FK	FKP	£	2024-06-21	2024-06-21	t
73	Faroe Islands	FO	DKK	kr	2024-06-21	2024-06-21	t
74	Fiji	FJ	FJD	$	2024-06-21	2024-06-21	t
75	Finland	FI	EUR	€	2024-06-21	2024-06-21	t
76	France	FR	EUR	€	2024-06-21	2024-06-21	t
77	French Guiana	GF	EUR	€	2024-06-21	2024-06-21	t
78	French Polynesia	PF	XPF	₣	2024-06-21	2024-06-21	t
79	French Southern and Antarctic Lands	TF	EUR	€	2024-06-21	2024-06-21	t
80	Gabon	GA	XAF	Fr	2024-06-21	2024-06-21	t
81	Gambia	GM	GMD	D	2024-06-21	2024-06-21	t
82	Georgia	GE	GEL	₾	2024-06-21	2024-06-21	t
83	Germany	DE	EUR	€	2024-06-21	2024-06-21	t
84	Ghana	GH	GHS	₵	2024-06-21	2024-06-21	t
85	Gibraltar	GI	GIP	£	2024-06-21	2024-06-21	t
86	Greece	GR	EUR	€	2024-06-21	2024-06-21	t
87	Greenland	GL	DKK	kr.	2024-06-21	2024-06-21	t
88	Grenada	GD	XCD	$	2024-06-21	2024-06-21	t
89	Guadeloupe	GP	EUR	€	2024-06-21	2024-06-21	t
90	Guam	GU	USD	$	2024-06-21	2024-06-21	t
91	Guatemala	GT	GTQ	Q	2024-06-21	2024-06-21	t
92	Guernsey	GG	GBP	£	2024-06-21	2024-06-21	t
93	Guinea	GN	GNF	Fr	2024-06-21	2024-06-21	t
94	Guinea-Bissau	GW	XOF	Fr	2024-06-21	2024-06-21	t
95	Guyana	GY	GYD	$	2024-06-21	2024-06-21	t
96	Haiti	HT	HTG	G	2024-06-21	2024-06-21	t
97	Heard Island and McDonald Islands	HM	 	 	2024-06-21	2024-06-21	t
98	Honduras	HN	HNL	L	2024-06-21	2024-06-21	t
99	Hong Kong	HK	HKD	$	2024-06-21	2024-06-21	t
100	Hungary	HU	HUF	Ft	2024-06-21	2024-06-21	t
101	Iceland	IS	ISK	kr	2024-06-21	2024-06-21	t
102	India	IN	INR	₹	2024-06-21	2024-06-21	t
103	Indonesia	ID	IDR	Rp	2024-06-21	2024-06-21	t
104	Iran	IR	IRR	﷼	2024-06-21	2024-06-21	t
105	Iraq	IQ	IQD	ع.د	2024-06-21	2024-06-21	t
106	Ireland	IE	EUR	€	2024-06-21	2024-06-21	t
107	Isle of Man	IM	GBP	£	2024-06-21	2024-06-21	t
108	Israel	IL	ILS	₪	2024-06-21	2024-06-21	t
109	Italy	IT	EUR	€	2024-06-21	2024-06-21	t
110	Ivory Coast	CI	XOF	Fr	2024-06-21	2024-06-21	t
111	Jamaica	JM	JMD	$	2024-06-21	2024-06-21	t
112	Japan	JP	JPY	¥	2024-06-21	2024-06-21	t
113	Jersey	JE	GBP	£	2024-06-21	2024-06-21	t
114	Jordan	JO	JOD	د.ا	2024-06-21	2024-06-21	t
115	Kazakhstan	KZ	KZT	₸	2024-06-21	2024-06-21	t
116	Kenya	KE	KES	Sh	2024-06-21	2024-06-21	t
117	Kiribati	KI	AUD	$	2024-06-21	2024-06-21	t
118	Kosovo	XK	EUR	€	2024-06-21	2024-06-21	t
119	Kuwait	KW	KWD	د.ك	2024-06-21	2024-06-21	t
120	Kyrgyzstan	KG	KGS	с	2024-06-21	2024-06-21	t
121	Laos	LA	LAK	₭	2024-06-21	2024-06-21	t
122	Latvia	LV	EUR	€	2024-06-21	2024-06-21	t
123	Lebanon	LB	LBP	ل.ل	2024-06-21	2024-06-21	t
124	Lesotho	LS	LSL	L	2024-06-21	2024-06-21	t
125	Liberia	LR	LRD	$	2024-06-21	2024-06-21	t
126	Libya	LY	LYD	ل.د	2024-06-21	2024-06-21	t
127	Liechtenstein	LI	CHF	Fr	2024-06-21	2024-06-21	t
128	Lithuania	LT	EUR	€	2024-06-21	2024-06-21	t
129	Luxembourg	LU	EUR	€	2024-06-21	2024-06-21	t
130	Macau	MO	MOP	P	2024-06-21	2024-06-21	t
131	Madagascar	MG	MGA	Ar	2024-06-21	2024-06-21	t
132	Malawi	MW	MWK	MK	2024-06-21	2024-06-21	t
133	Malaysia	MY	MYR	RM	2024-06-21	2024-06-21	t
134	Maldives	MV	MVR	.ރ	2024-06-21	2024-06-21	t
135	Mali	ML	XOF	Fr	2024-06-21	2024-06-21	t
136	Malta	MT	EUR	€	2024-06-21	2024-06-21	t
137	Marshall Islands	MH	USD	$	2024-06-21	2024-06-21	t
138	Martinique	MQ	EUR	€	2024-06-21	2024-06-21	t
139	Mauritania	MR	MRU	UM	2024-06-21	2024-06-21	t
140	Mauritius	MU	MUR	₨	2024-06-21	2024-06-21	t
141	Mayotte	YT	EUR	€	2024-06-21	2024-06-21	t
142	Mexico	MX	MXN	$	2024-06-21	2024-06-21	t
143	Micronesia	FM	USD	$	2024-06-21	2024-06-21	t
144	Moldova	MD	MDL	L	2024-06-21	2024-06-21	t
145	Monaco	MC	EUR	€	2024-06-21	2024-06-21	t
146	Mongolia	MN	MNT	₮	2024-06-21	2024-06-21	t
147	Montenegro	ME	EUR	€	2024-06-21	2024-06-21	t
148	Montserrat	MS	XCD	$	2024-06-21	2024-06-21	t
149	Morocco	MA	MAD	د.م.	2024-06-21	2024-06-21	t
150	Mozambique	MZ	MZN	MT	2024-06-21	2024-06-21	t
151	Myanmar	MM	MMK	Ks	2024-06-21	2024-06-21	t
152	Namibia	NA	NAD	$	2024-06-21	2024-06-21	t
153	Nauru	NR	AUD	$	2024-06-21	2024-06-21	t
154	Nepal	NP	NPR	₨	2024-06-21	2024-06-21	t
155	Netherlands	NL	EUR	€	2024-06-21	2024-06-21	t
156	New Caledonia	NC	XPF	₣	2024-06-21	2024-06-21	t
157	New Zealand	NZ	NZD	$	2024-06-21	2024-06-21	t
158	Nicaragua	NI	NIO	C$	2024-06-21	2024-06-21	t
159	Niger	NE	XOF	Fr	2024-06-21	2024-06-21	t
160	Nigeria	NG	NGN	₦	2024-06-21	2024-06-21	t
161	Niue	NU	NZD	$	2024-06-21	2024-06-21	t
162	Norfolk Island	NF	AUD	$	2024-06-21	2024-06-21	t
163	North Korea	KP	KPW	₩	2024-06-21	2024-06-21	t
164	North Macedonia	MK	MKD	den	2024-06-21	2024-06-21	t
165	Northern Mariana Islands	MP	USD	$	2024-06-21	2024-06-21	t
166	Norway	NO	NOK	kr	2024-06-21	2024-06-21	t
167	Oman	OM	OMR	ر.ع.	2024-06-21	2024-06-21	t
168	Pakistan	PK	PKR	₨	2024-06-21	2024-06-21	t
169	Palau	PW	USD	$	2024-06-21	2024-06-21	t
170	Palestine	PS	EGP	E£	2024-06-21	2024-06-21	t
171	Panama	PA	PAB	B/.	2024-06-21	2024-06-21	t
172	Papua New Guinea	PG	PGK	K	2024-06-21	2024-06-21	t
173	Paraguay	PY	PYG	₲	2024-06-21	2024-06-21	t
174	Peru	PE	PEN	S/ 	2024-06-21	2024-06-21	t
175	Philippines	PH	PHP	₱	2024-06-21	2024-06-21	t
176	Pitcairn Islands	PN	NZD	$	2024-06-21	2024-06-21	t
177	Poland	PL	PLN	zł	2024-06-21	2024-06-21	t
178	Portugal	PT	EUR	€	2024-06-21	2024-06-21	t
179	Puerto Rico	PR	USD	$	2024-06-21	2024-06-21	t
180	Qatar	QA	QAR	ر.ق	2024-06-21	2024-06-21	t
181	Republic of the Congo	CG	XAF	Fr	2024-06-21	2024-06-21	t
182	Réunion	RE	EUR	€	2024-06-21	2024-06-21	t
183	Romania	RO	RON	lei	2024-06-21	2024-06-21	t
184	Russia	RU	RUB	₽	2024-06-21	2024-06-21	t
185	Rwanda	RW	RWF	Fr	2024-06-21	2024-06-21	t
186	Saint Barthélemy	BL	EUR	€	2024-06-21	2024-06-21	t
187	Saint Helena, Ascension and Tristan da Cunha	SH	GBP	£	2024-06-21	2024-06-21	t
188	Saint Kitts and Nevis	KN	XCD	$	2024-06-21	2024-06-21	t
189	Saint Lucia	LC	XCD	$	2024-06-21	2024-06-21	t
190	Saint Martin	MF	EUR	€	2024-06-21	2024-06-21	t
191	Saint Pierre and Miquelon	PM	EUR	€	2024-06-21	2024-06-21	t
192	Saint Vincent and the Grenadines	VC	XCD	$	2024-06-21	2024-06-21	t
193	Samoa	WS	WST	T	2024-06-21	2024-06-21	t
194	San Marino	SM	EUR	€	2024-06-21	2024-06-21	t
195	São Tomé and Príncipe	ST	STN	Db	2024-06-21	2024-06-21	t
196	Saudi Arabia	SA	SAR	ر.س	2024-06-21	2024-06-21	t
197	Senegal	SN	XOF	Fr	2024-06-21	2024-06-21	t
198	Serbia	RS	RSD	дин.	2024-06-21	2024-06-21	t
199	Seychelles	SC	SCR	₨	2024-06-21	2024-06-21	t
200	Sierra Leone	SL	SLL	Le	2024-06-21	2024-06-21	t
201	Singapore	SG	SGD	$	2024-06-21	2024-06-21	t
202	Sint Maarten	SX	ANG	ƒ	2024-06-21	2024-06-21	t
203	Slovakia	SK	EUR	€	2024-06-21	2024-06-21	t
204	Slovenia	SI	EUR	€	2024-06-21	2024-06-21	t
205	Solomon Islands	SB	SBD	$	2024-06-21	2024-06-21	t
206	Somalia	SO	SOS	Sh	2024-06-21	2024-06-21	t
207	South Africa	ZA	ZAR	R	2024-06-21	2024-06-21	t
208	South Georgia	GS	SHP	£	2024-06-21	2024-06-21	t
209	South Korea	KR	KRW	₩	2024-06-21	2024-06-21	t
210	South Sudan	SS	SSP	£	2024-06-21	2024-06-21	t
211	Spain	ES	EUR	€	2024-06-21	2024-06-21	t
212	Sri Lanka	LK	LKR	Rs  රු	2024-06-21	2024-06-21	t
213	Sudan	SD	SDG	N/A	2024-06-21	2024-06-21	t
214	Suriname	SR	SRD	$	2024-06-21	2024-06-21	t
215	Svalbard and Jan Mayen	SJ	NOK	kr	2024-06-21	2024-06-21	t
216	Sweden	SE	SEK	kr	2024-06-21	2024-06-21	t
217	Switzerland	CH	CHF	Fr.	2024-06-21	2024-06-21	t
218	Syria	SY	SYP	£	2024-06-21	2024-06-21	t
219	Taiwan	TW	TWD	$	2024-06-21	2024-06-21	t
220	Tajikistan	TJ	TJS	ЅМ	2024-06-21	2024-06-21	t
221	Tanzania	TZ	TZS	Sh	2024-06-21	2024-06-21	t
222	Thailand	TH	THB	฿	2024-06-21	2024-06-21	t
223	Timor-Leste	TL	USD	$	2024-06-21	2024-06-21	t
224	Togo	TG	XOF	Fr	2024-06-21	2024-06-21	t
225	Tokelau	TK	NZD	$	2024-06-21	2024-06-21	t
226	Tonga	TO	TOP	T$	2024-06-21	2024-06-21	t
227	Trinidad and Tobago	TT	TTD	$	2024-06-21	2024-06-21	t
228	Tunisia	TN	TND	د.ت	2024-06-21	2024-06-21	t
229	Turkey	TR	TRY	₺	2024-06-21	2024-06-21	t
230	Turkmenistan	TM	TMT	m	2024-06-21	2024-06-21	t
231	Turks and Caicos Islands	TC	USD	$	2024-06-21	2024-06-21	t
232	Tuvalu	TV	AUD	$	2024-06-21	2024-06-21	t
233	Uganda	UG	UGX	Sh	2024-06-21	2024-06-21	t
234	Ukraine	UA	UAH	₴	2024-06-21	2024-06-21	t
235	United Arab Emirates	AE	AED	د.إ	2024-06-21	2024-06-21	t
236	United Kingdom	GB	GBP	£	2024-06-21	2024-06-21	t
237	United States Minor Outlying Islands	UM	USD	$	2024-06-21	2024-06-21	t
238	United States Virgin Islands	VI	USD	$	2024-06-21	2024-06-21	t
239	United States	US	USD	$	2024-06-21	2024-06-21	t
240	Uruguay	UY	UYU	$	2024-06-21	2024-06-21	t
241	Vanuatu	VU	VUV	Vt	2024-06-21	2024-06-21	t
242	Vatican City	VA	EUR	€	2024-06-21	2024-06-21	t
243	Venezuela	VE	VES	Bs.S.	2024-06-21	2024-06-21	t
244	Vietnam	VN	VND	₫	2024-06-21	2024-06-21	t
245	Wallis and Futuna	WF	XPF	₣	2024-06-21	2024-06-21	t
246	Western Sahara	EH	DZD	دج	2024-06-21	2024-06-21	t
247	Yemen	YE	YER	﷼	2024-06-21	2024-06-21	t
248	Zambia	ZM	ZMW	ZK	2024-06-21	2024-06-21	t
249	Zimbabwe	ZW	ZWL	$	2024-06-21	2024-06-21	t
250	China (Simplified Chinese)	zh-Hans	CNY	¥	2024-06-21	2024-06-21	t
251	Taiwan	zh-TW	TWD	NT$	2024-06-21	2024-06-21	t
252	China	zh	CNY	¥	2024-06-21	2024-06-21	t
253	South Korea	ko	KRW	₩	2024-06-21	2024-06-21	t
254	Israel	he	ILS	₪	2024-06-21	2024-06-21	t
255	Japan	ja	JPY	¥	2024-06-21	2024-06-21	t
256	India	hi	INR	₹	2024-06-21	2024-06-21	t
257	China (Simplified Chinese)	zh-Hans	CNY	¥	2024-06-21	2024-06-21	t
258	Uzbekistan	uz	UZS	лв	2024-06-21	2024-06-21	t
259	Iran	fa	IRR	﷼	2024-06-21	2024-06-21	t
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_unique_id, product_name, product_description, model, category_id, subcategory_id, brand_id, country_id, created_date, updated_date, is_active) FROM stdin;
1	ch_w_chopard_happy_sport	Happy Sport	Happy Sport Referenz 278590 - 3010 Die Happy Sport-Kollektion ist das Sinnbild für die Kreativität und Stärke von Chopard. Ihre verspielten, frei wirbelnden Diamanten tanzen zwischen zwei Saphirgläsern und fangen seit 1993 die Vorstellungskraft ein, als Chopard das das erste Unternehmen war, das Edelstahl und Diamanten kombinierte. Little Diamonds Do Great Things	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
2	de_w_chopard_happy_sport	Happy Sport	Happy Sport Referenz 274808 - 5003 Die Happy Sport-Kollektion ist das Sinnbild für die Kreativität und Stärke von Chopard. Ihre verspielten, frei wirbelnden Diamanten tanzen zwischen zwei Saphirgläsern und fangen seit 1993 die Vorstellungskraft ein, als Chopard das das erste Unternehmen war, das Edelstahl und Diamanten kombinierte. Little Diamonds Do Great Things	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
3	de_w_chopard_l'heure_du_diamant_small_vintage	L'Heure du Diamant Small Vintage	L'Heure du Diamant Small Vintage Referenz 10A378 - 1002 Mit L'Heure du Diamant bringt Chopard die Schönheit der Diamanten zur Geltung. Die Manufaktur ist bekannt für ihre luxuriösen Schmuckuhren und inszeniert die Begegnung von zeitgenössischem Design mit dem König der Edelsteine überaus meisterlich.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
4	de_w_chopard_l'heure_du_diamant_rund	L'Heure du Diamant Rund	L'Heure du Diamant Rund Referenz @10A391 - 5100 Mit L'Heure du Diamant bringt Chopard die Schönheit der Diamanten zur Geltung. Die Manufaktur ist bekannt für ihre luxuriösen Schmuckuhren und inszeniert die Begegnung von zeitgenössischem Design mit dem König der Edelsteine überaus meisterlich.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
5	de_w_chopard_l'heure_du_diamant	L'Heure du Diamant	L'Heure du Diamant Referenz 10A393 - 5106 Mit der L'Heure du Diamant Uhr setzt Chopard die Schönheit der Diamanten perfekt in Szene. Das Haus ist bekannt für meisterhafte Haute Joaillerie Uhren und inszeniert in seinen Ateliers die Begegnung von modernem Design mit dem König der Edelsteine.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
6	de_w_chopard_happy_diamonds_joaillerie	Happy Diamonds Joaillerie	Happy Diamonds Joaillerie Referenz 204445 - 1001 Seit 1976 die erste Happy Diamonds Uhr erfunden wurde, bringen die tanzenden Diamanten die Kollektion auf fröhliche Weise zum Strahlen. Die Happy Diamonds Uhren stehen in erster Linie für einen verspielten und entspannten, unabhängigen Geist, der offen für unbegrenzte Metamorphosen ist. Happy Diamonds wirbeln zwischen zwei Saphirgläsern herum und tanzen unglaublich elegant und pfiffig auf dem Zifferblatt herum. Little Diamonds Do Great Things	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
7	de_w_chopard_imperiale_moonphase	IMPERIALE Moonphase	IMPERIALE Moonphase Referenz 384246 - 1002 Die IMPERIALE Kollektion zeichnet sich durch ein majestätisches, sinnliches, anspruchsvolles und elegantes Design aus, das vom Zeitalter der Grossreiche inspiriert ist. Diese wunderschöne Komplikation zeigt ein Perlmuttzifferblatt, das die majestätischen Mondphasen und die Konstellationen der nördlichen Hemisphäre anzeigt. Eine herrliche Verkörperung der beiden Exzellenz-Bereich von Chopard – Uhrmacherei und Schmuck. A tribute to modern achievers	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
8	de_w_chopard_l'heure_du_diamant_vintage	L'Heure du Diamant Vintage	L'Heure du Diamant Vintage Referenz 10A376 - 1008 Mit L'Heure du Diamant bringt Chopard die Schönheit der Diamanten zur Geltung. Die Manufaktur ist bekannt für ihre luxuriösen Schmuckuhren und inszeniert die Begegnung von zeitgenössischem Design mit dem König der Edelsteine überaus meisterlich.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
9	de_w_chopard_alpine_eagle_xl_chrono	Alpine Eagle XL Chrono	Alpine Eagle XL Chrono Referenz 295393 - 5002 Zur sportlich-schicken Alpine Eagle Kollektion gehört ein Flyback-Chronograph mit 44 mm großem Gehäuse. Das Modell ist vollständig in 18 Karat Ethischem Roségold gefertigt und wie die gesamte Kollektion von der Kraft des Adlers und der Schönheit der Alpen inspiriert. Das Zifferblatt in Bernina-Grau ist eine Hommage an die Farbe des alpinen Gesteins. Das Uhrwerk Chopard 03.05-C ist als Chronometer zertifiziert und verfügt über eine Flyback-Funktion. Die Innovationen, die zur Präzision und Bedienungsfreundlichkeit der Uhr beitragen, werden durch drei Patente geschützt.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
10	de_w_chopard_imperiale	IMPERIALE	IMPERIALE Referenz 388563 - 6007 Mit ihrer minimalistischen und stilisierten Silhouette bietet die IMPERIALE Uhrenkollektion eine moderne Interpretation der grossen Symbole historischer Grossreiche. Die Arabeskenmotive, die von den Stickereien der Tuchwaren inspiriert sind, auf denen Monarchen ihre Insignien ablegten, Zeiger in Schwertform mit Durchbruchsdesign, römische Stundenmarkierungen und eine Krone in Form einer Lotusblume erinnern an ein glorreiches Erbe, während die Form der Bandanstösse ganz in der Tradition antiker Säulen gehalten ist, die für ihre perfekt ausbalancierten Proportionen berühmt sind. A tribute to modern achievers	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
11	de_w_chopard_l.u.c_full_strike_titanium	L.U.C Full Strike Titanium	L.U.C Full Strike Titanium Referenz 168604 - 3002 Das Modell L.U.C Full Strike – 2017 beim Grand Prix d’Horlogerie de Genève mit der wichtigsten Auszeichnung „Aiguille d'Or“ ausgezeichnet – erhält eine neue Farbe. Die neueste Version der ersten Minutenrepetition von Chopard hat ihren Auftritt nun in einem grau-grünen Farbton mit der Bezeichnung „Verdigris“. Die Uhr bewahrt ihren revolutionären technischen Charakter sowie ihre herausragende Klangqualität. Stunden, Viertelstunden und Minuten werden von winzigen Hämmern auf Tonfedern aus Saphirglas angeschlagen. Die herausragende Uhr zeichnet sich durch ihr originelles Design, das Gehäuse in keramisiertem Titan und die Veredelung gemäß den Ansprüchen des Genfer Siegels aus. Wichtigstes Merkmal ist aber ihr außergewöhnlich melodiöses Klangbild. Mit ihrer Eleganz und Raffinesse verkörpert die Uhr die hohen Ansprüche der L.U.C Kollektion, deren Charakteristiken Kompetenz, Einfallsreichtum und Qualität sind.	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
12	de_w_chopard_happy_diamonds_icons	Happy Diamonds Icons	Happy Diamonds Icons Referenz 204292 - 5301 Seit 1976 die erste Happy Diamonds Uhr erfunden wurde, bringen die tanzenden Diamanten die Kollektion auf fröhliche Weise zum Strahlen. Die Happy Diamonds Uhren stehen in erster Linie für einen verspielten und entspannten, unabhängigen Geist, der offen für unbegrenzte Metamorphosen ist. Happy Diamonds wirbeln zwischen zwei absolut transparenten Saphirgläsern herum und vermitteln den Eindruck, dass die Diamanten die Haut berühren. Diamanten am Handgelenk tanzen zu lassen ist ein unglaublich eleganter Ausdruck von Pfiffigkeit ... Little Diamonds Do Great Things	NULL	1	NULL	4	83	2024-06-21	2024-06-21	t
24	ch_w_chopard_happy_diamonds_joaillerie	Happy Diamonds Joaillerie	Happy Diamonds Joaillerie Réf. 209436 - 5002 Depuis 1976 et l'invention de la première montre Happy Diamonds, les diamants mobiles illuminent joyeusement la collection. Les montres Happy Diamonds, c’est d’abord un esprit d’indépendance, ludique et aérien, qui se prête à d’infinies métamorphoses. Evoluant dans la transparence absolue de deux glaces saphir, les Happy Diamonds donnent l’impression que les diamants sont en contact direct avec la peau. Faire danser des diamants sur son poignet, une espièglerie si élégante… Little Diamonds Do Great Things	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
13	ae_w_chopard_alpine_eagle_41	Alpine Eagle 41	Alpine Eagle 41 Ref. Number: 298600 - 3001 Contemporary, refined and assertive, the new sport-chic Alpine Eagle timepiece collection is a contemporary reinterpretation of the St Moritz, the first watch created in 1980 by Karl-Friedrich Scheufele, now copresident of the Chopard house. Imagined and personally designed by him, the Alpine Eagle was driven by his passion for the Alps and by the lofty power of the eagle that reigns supreme there. Crafted from an exclusive, ultra-resistant, light-reflecting metal named Lucent Steel™ –, it beats to the rhythm of a Chronometer-certified movement. Alpine Eagle is dedicated to contemporary eagles, the aspiring men who outperform in their daily lives and whose vision inspires and elevates. With foresight and determination, they act on the challenges of tomorrow and are innately aware of the importance of environmental issues.	NULL	1	NULL	4	235	2024-06-21	2024-06-21	t
14	gb_w_chopard_mille_miglia_gts_power_control	Mille Miglia GTS Power Control	Mille Miglia GTS Power Control Ref. Number: 168566 - 3001 Power, resistance and aesthetics come together in the Mille Miglia GTS Power Control, a resolutely masculine timepiece bearing all the hallmarks of Chopard expertise. Housing the self-winding Chopard Caliber 01.08-C and beating at a frequency of 28,800 v.p.h, this Lucent Steel™ watch on a rubber strap features an emblematic black dial with a power-reserve indicator at 9 o'clock. Chronometer certified by the COSC, the movement is equipped with a stop-seconds function allowing precise adjustments. Water-resistant to 100 meters, the 43mm case is equipped with an anti-reflective, scratch-resistant sapphire crystal. The movement, driven by a tungsten oscillating weight, can be admired through the sapphire crystal case back.	NULL	1	NULL	4	236	2024-06-21	2024-06-21	t
15	hk_w_chopard_mille_miglia_classic_chronograph	Mille Miglia Classic Chronograph	Mille Miglia Classic Chronograph Ref. Number: 168619 - 4001 For 35 years, the heart of Chopard and that of the 1000 Miglia have been beating as one. As the official timekeeper of the world’s most famous regularity race for classic cars, Chopard has created the Mille Miglia Chronograph watch. They share a love of beautiful engineering and performance, born of Karl-Friedrich Scheufele’s personal passion for cars and motor racing.	NULL	1	NULL	4	99	2024-06-21	2024-06-21	t
16	sg_w_chopard_alpine_eagle_41	Alpine Eagle 41	Alpine Eagle 41 Ref. Number: 298600 - 3001 Contemporary, refined and assertive, the new sport-chic Alpine Eagle timepiece collection is a contemporary reinterpretation of the St Moritz, the first watch created in 1980 by Karl-Friedrich Scheufele, now copresident of the Chopard house. Imagined and personally designed by him, the Alpine Eagle was driven by his passion for the Alps and by the lofty power of the eagle that reigns supreme there. Crafted from an exclusive, ultra-resistant, light-reflecting metal named Lucent Steel™ –, it beats to the rhythm of a Chronometer-certified movement. Alpine Eagle is dedicated to contemporary eagles, the aspiring men who outperform in their daily lives and whose vision inspires and elevates. With foresight and determination, they act on the challenges of tomorrow and are innately aware of the importance of environmental issues.	NULL	1	NULL	4	201	2024-06-21	2024-06-21	t
17	us_w_chopard_imperiale	IMPERIALE	IMPERIALE Ref. Number: 388563 - 3006 With its pure, stylised silhouette, the IMPERIALE watch collection offers a contemporary interpretation of the great symbols of historical empires. The arabesque motifs drawn from the embroidery of the draperies on which monarchs placed their insignia, openwork sword-shaped hands, Roman hour-markers and a crown curved like a lotus flower all evoke a glorious heritage, while the shape of the lugs recalls the tradition of ancient columns famed for their perfectly balanced proportions. A tribute to modern achievers	NULL	1	NULL	4	239	2024-06-21	2024-06-21	t
18	ch_w_chopard_l.u.c_1860_flying_tourbillon	L.U.C 1860 Flying Tourbillon	L.U.C 1860 Flying Tourbillon Réf. 161990 - 0001 Vingt-cinq ans après le premier modèle de la collection L.U.C, Chopard loge son calibre à tourbillon volant innovant L.U.C 96.24-L dans le boîtier extra-plat de sa première montre L.U.C 1860. Ce faisant, la Manufacture préserve les proportions optimales de son modèle historique avec un diamètre de 36,5 mm pour une épaisseur de seulement 8,20 mm. Le nouveau modèle L.U.C 1860 Flying Tourbillon est façonné en or éthique jaune 18 carats, et s’habille d’un élégant cadran en or jaune 18 carats guilloché à la main. Le fond transparent qui laisse admirer son mouvement unique est protégé par un élégant capot à l’intérieur duquel est soigneusement gravé à la main un motif de ruche unique. Chopard est la seule Manufacture dont les montres à tourbillon volant sont certifiées à la fois Chronomètre et Poinçon de Genève : le modèle L.U.C 1860 Flying Tourbillon appartient à cette catégorie de montres rares. Il est d’ailleurs édité en une série exclusive et très limitée de 10 pièces.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
19	ch_w_chopard_l.u.c_xp_esprit_de_fleurier	L.U.C XP Esprit de Fleurier	L.U.C XP Esprit de Fleurier Réf. 131944 - 5007 Pour cette montre L.U.C XP Esprit de Fleurier en or rose et diamants, l'émail Grand Feu est à l'honneur sur le cadran à fond d'or, tandis que son mouvement - le Calibre L.U.C 96.23-L conçu et réalisé par la Manufacture Chopard - est entièrement décoré de gravures florales, un art rare parfaitement maîtrisé par les artisans de Chopard.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
20	ch_w_chopard_l'heure_du_diamant_round	L'HEURE DU DIAMANT ROUND	L'HEURE DU DIAMANT ROUND Réf. @10A391 - 5300 Avec sa montre L'Heure du Diamant, Chopard saisit avec talent toute la beauté du diamant. Passés maîtres dans le domaine de la montre joaillière de luxe, les artisans de la Maison ont orchestré la rencontre entre le design contemporain et la reine des pierres précieuses.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
21	ch_w_chopard_l'heure_du_diamant_octagonal	L'Heure Du Diamant Octagonal	L'Heure Du Diamant Octagonal Réf. 13A097 - 1112 Avec L’Heure du Diamant, Chopard saisit avec maestria la beauté du diamant. Maîtres de la montre joaillière, les artisans de la Manufacture ont orchestré la rencontre entre la création contemporaine et la reine des pierres précieuses.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
22	ch_w_chopard_l'heure_du_diamant	L'Heure du Diamant	L'Heure du Diamant Réf. 13A386 - 5107 Avec L'Heure du Diamant, Chopard saisit merveilleusement la beauté des diamants. Reconnus pour leur maîtrise dans le domaine des montres de haute joaillerie, les artisans de la Maison ont orchestré une rencontre entre le design contemporain et la reine des pierres précieuses.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
23	ch_w_chopard_l’heure_du_diamant_oval_medium	L’Heure du Diamant Oval Medium	L’Heure du Diamant Oval Medium Réf. @13A390 - 5100 Avec L'Heure du Diamant, Chopard saisit merveilleusement la beauté des diamants. Reconnus pour leur maîtrise dans le domaine des montres de haute joaillerie, les artisans de la Maison ont orchestré une rencontre entre le design contemporain et la reine des pierres précieuses.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
398	de_w_daniel_wellington_8824483905860_quadro_mini_melrose	{"Quadro Mini Melrose"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini in der klassischen Version hat ein austauschbares Mesh-Armband in Roségold.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
25	ch_w_chopard_alpine_eagle_33_frozen	Alpine Eagle 33 Frozen	Alpine Eagle 33 Frozen Réf. 295384 - 1003 Inspirées par la grâce de l'aigle et la majesté des Alpes, les montres sport-chic de Chopard accueillent la montre diamant Alpine Eagle Frozen 33. Réalisés en or éthique blanc 18 carats, son boîtier de 33 mm de diamètre et son bracelet intégré sont entièrement sertis de diamants pleine taille tandis que la lunette est sertie de diamants taille trapèze. Dotée d'un savoir-faire technique à la hauteur de son esthétique impressionnante, cette version joaillière de la montre des aigles contemporains est équipée du mouvement Chopard 09.01-C à remontage automatique avec une réserve de marche de 42 heures. Grâce à son abondance de diamants, rappelant de minuscules flocons de neige scintillant sur les sommets alpins, cette montre diamant de luxe brille d'une aura éthique et responsable.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
26	fr_w_chopard_alpine_eagle_41	Alpine Eagle 41	Alpine Eagle 41 Réf. 298600 - 3001 À la fois élégante et sportive, la nouvelle collection Alpine Eagle propose une interprétation moderne de la St. Moritz, première montre créée par Karl-Friedrich Scheufele, aujourd'hui coprésident de Chopard, sortie en 1980. Né de la passion de son créateur pour le massif alpin et inspiré de la noblesse de l'aigle, ce garde-temps sorti tout droit de l'imagination de M. Scheufele a été façonné dans un métal exclusif, réfléchissant et ultra-résistant du nom de Lucent Steel™ et renferme un mouvement certifié chronomètre. Alpine Eagle rend hommage aux « aigles » d'aujourd'hui – des personnes ambitieuses qui se dépassent au quotidien et dont la vision est une source d'inspiration pour leurs pairs. Avant-gardistes et déterminés, ils relèvent avec panache les défis de demain et connaissent d'instinct l'importance des questions environnementales.	NULL	1	NULL	4	76	2024-06-21	2024-06-21	t
27	ch_w_chopard_l.u.c_time_traveler_one	L.U.C Time Traveler One	L.U.C Time Traveler One Ref. 161942 - 5001 Eleganza impeccabile, qualità perfetta e sofisticazione tecnica d'avanguardia rendono gli orologi L.U.C i segnatempo ideali per il gentiluomo moderno che apprezza quanto di più raffinato la vita abbia da offrire. Ideale per i viaggiatori internazionali, l'orologio in oro rosa 18 carati L.U.C Time Traveler One vanta una complicazione che mostra contemporaneamente tutti i fusi orari.	NULL	1	NULL	4	217	2024-06-21	2024-06-21	t
28	it_w_chopard_ice_cube	Ice Cube	Ice Cube Ref. @827702 - 1259 Sin dal suo lancio nel 1999, la collezione Ice Cube ha offerto successive interpretazioni della sua estetica moderna ispirata a minuscoli cubetti di ghiaccio. Simboleggiando perfezione e miracolosa geometria, il cubo è una fonte di ispirazione in tutti i campi creativi. Selezionando questa figura, la collezione Ice Cube osa giocare sulla sua rara natura, la sua estetica dirompente, nonché sugli infiniti lampi scintillanti di luce riflessi dalle sue molteplici sfaccettature. Minimalist Elegance	NULL	1	NULL	4	109	2024-06-21	2024-06-21	t
29	jp_w_chopard_l'heure_du_diamant_round	L'Heure du Diamant Round	L'Heure du Diamant Round Ref. @10A391 - 5100 ショパールがダイヤモンドの美しさを巧みに表現したルール・ドゥ・ディアマンで。ラグジュアリー ジュエリーウォッチの世界における名匠であるショパールのアルチザンたちの手によって、“プレシャスストーンの女王”にコンテンポラリーなデザインが施されました。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
30	jp_w_chopard_ハッピースポーツ	ハッピースポーツ	ハッピースポーツ Ref. 275372 - 1001 ハッピースポーツ コレクションは、ショパールの創造性と大胆さを象徴しています。2枚のサファイアクリスタルの間で生き生きと自由に舞う陽気なジェムは、1993年にショパールがスティールとダイヤモンドを組み合わせた初のメゾンとなって以来、イマジネーションを永遠の形に残します。ショパールは、高度な時計製造技術を駆使し、フェミニンな「ハッピースポーツ オーバル」のために特別に開発された機械式自動巻きムーブメントを搭載しました。 Little Diamonds Do Great Things	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
31	jp_w_chopard_ルール・ドゥ・ディアマン	ルール・ドゥ・ディアマン	ルール・ドゥ・ディアマン Ref. 10A393 - 5106 ダイヤモンドの美しさを匠の技で表現した、ショパールの「ルール・ドゥ・ディアマン」ウォッチ。ジュエリーウォッチの世界における名匠であるメゾンの職人たちが、プレシャスストーンの女王にコンテンポラリーなデザインを施しました。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
32	jp_w_chopard_ルール・ドゥ・ディアマン_ラウンド	ルール・ドゥ・ディアマン ラウンド	ルール・ドゥ・ディアマン ラウンド Ref. 10A178 - 1321 ダイヤモンドの美しさを巧みに表現したショパールの「ルール・ドゥ・ディアマン」。ラグジュアリー ジュエリー＆ウォッチの世界における名匠として、メゾンの職人たちは、コンテンポラリーなデザインとプレシャスストーンの女王とのコラボレーションを成し遂げました。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
33	jp_w_chopard_ハッピーダイヤモンド_ジョワイアリー	ハッピーダイヤモンド ジョワイアリー	ハッピーダイヤモンド ジョワイアリー Ref. 204445 - 1001 1976年に最初のハッピーダイヤモンド ウォッチが制作されて以来、ムービングダイヤモンドは、このコレクションに喜びと輝きをもたらしてきました。ハッピーダイヤモンド ウォッチは、自立した精神を陽気で軽やかなイメージに仕上げた最初のアイテムで、ここからコレクションは様々な形に変化を遂げていきます。2枚の透明なサファイアクリスタルの間でクルクルと揺れ動くハッピーダイヤモンドが、文字盤の周りを舞い踊りながら、遊び心をエレガントに表現します。 Little Diamonds Do Great Things	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
34	jp_w_chopard_インペリアーレ_ムーンフェイズ	インペリアーレ ムーンフェイズ	インペリアーレ ムーンフェイズ Ref. 384246 - 1002 インペリアーレ コレクションには、帝国時代をイメージした、センシュアルでエレガント、そして威厳あふれるエレガントなデザインが採用されています。この美しいコンプリケーションウォッチのマザーオブパールの文字盤には、壮麗なムーンフェイズと北半球の星座が表示されています。時計とジュエリーという2つの分野におけるショパールの卓越性が、洗練された形で表現された作品。A tribute to modern achievers	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
45	kr_w_chopard_디아망트	디아망트	디아망트 제품 번호 13A386 - 5107 쇼파드는 디아망트 컬렉션을 통해 다이아몬드의 아름다움을 포착합니다. 럭셔리 주얼리 시계의 대가인 쇼파드 장인들이 모던한 디자인과 보석의 여왕인 다이아몬드의 눈부신 조화를 선보입니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
3344	us_w_daniel_wellington_8884231242041_quadro_lumine_bezel_5-link_two-tone_mop	{"Quadro Lumine Bezel 5-Link Two-Tone MOP"}	None	NULL	1	NULL	11	239	2024-06-21	2024-06-21	t
35	jp_w_chopard_アルパイン_イーグル_xl_クロノ	アルパイン イーグル XL クロノ	アルパイン イーグル XL クロノ Ref. 295393 - 5002 スポーティー＆シックな「アルパイン イーグル」コレクションに、フライバック機能付きクロノグラフを搭載した18Kエシカルローズゴールド製の44mmモデルが加わります。コレクションのすべてのモデルと同様に、アルプスの美しさとそこに飛翔する威厳あるイーグルの勇姿からのインスピレーションを得て生まれたタイムピースで、アルプスの岩山の色にオマージュを捧げる「ベルニナグレー」カラーが文字盤を彩ります。フライバック機能を備えたクロノメーター認定ムーブメント「Chopard 03.05-C」が取得した3つの特許は、その卓越した精度とスムーズな操作性を向上させるイノベーションを証明しています。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
36	jp_w_chopard_ルール・ドゥ・ディアマン_ヴィンテージ	ルール・ドゥ・ディアマン ヴィンテージ	ルール・ドゥ・ディアマン ヴィンテージ Ref. 10A376 - 1008 ショパールがダイヤモンドの美しさを巧みに表現したルール・ドゥ・ディアマンで。ラグジュアリー ジュエリーウォッチの世界における名匠であるショパールのアルチザンたちの手によって、“プレシャスストーンの女王”にコンテンポラリーなデザインが施されました。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
37	jp_w_chopard_インペリアーレ	インペリアーレ	インペリアーレ Ref. 388563 - 6007 ピュアでスタイリッシュなシルエットが特徴のインペリアーレ ウォッチは、帝国時代の威厳ある紋章を現代的な感覚で表現したコレクションです。君主の衣服に刺繍された紋章からインスピレーションを得たアラベスク模様、オープンワークを施した剣型針、ローマ数字のアワーマーカー、そしてハスの花のようなカーブを描いたリューズなどの様々なディテールはいずれも、栄光の時代の壮麗な伝統を思い起こさせます。また、ラグの形は、見事な均整を備えるかつての伝統的な円柱をイメージしたものです。A tribute to modern achievers	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
38	jp_w_chopard_l.u.c_フル_ストライク_チタン	L.U.C フル ストライク チタン	L.U.C フル ストライク チタン Ref. 168604 - 3002 2017年にジュネーブ ウォッチメイキング グランプリの最優秀賞である「金の針賞」に輝いた「L.U.C フル ストライク」に、新たなカラーバージョンが登場しました。ショパール史上初となるミニッツリピーター搭載ウォッチの最新モデルは、グレーグリーンの色合い――「ベルディグリ（緑青）」カラーを纏います。革新的な技術仕様も独創的な音のクオリティも失われることなく、ハンマーがサファイア製ゴングを打ち、時（アワー）、15分（クォーター）、分（ミニット）を知らせます。真に傑出したこのタイムピースは、独創的なデザイン、セラマイズドチタン製ケース、ジュネーブ・シールを取得した美しい仕上げに加え、その比類なき音色が際立ち、「L.U.C」コレクションが誇る優れた専門技術、独創性そして高い品質を体現するエレガントで洗練された逸品です。	NULL	1	NULL	4	112	2024-06-21	2024-06-21	t
39	kr_w_chopard_l.u.c_xp_에스프리_드_플뢰리에	L.U.C XP 에스프리 드 플뢰리에	L.U.C XP 에스프리 드 플뢰리에 제품 번호 131944 - 5007 L.U.C XP 에스프리 드 플뢰리에 로즈 골드 및 다이아몬드 시계의 골드 베이스 다이얼 위에서는 고온 처리 과정을 거친 에나멜이 시선을 사로잡습니다. 쇼파드 매뉴팩처에서 설계 및 제작한 L.U.C 칼리버 96.23-L 무브먼트 전체에는 쇼파드 장인의 진귀한 예술로 손꼽히는 플로럴 인그레이빙이 장식되어 있습니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
40	kr_w_chopard_l.u.c_1860_플라잉_투르비옹	L.U.C 1860 플라잉 투르비옹	L.U.C 1860 플라잉 투르비옹 제품 번호 161990 - 0001 쇼파드가 L.U.C 컬렉션을 처음 선보인 지 25년 만에, 울트라-씬 케이스에 혁신적인 플라잉 투르비옹 칼리버 L.U.C 96.24-L을 탑재한 L.U.C 1860 시계를 선보입니다. 이를 통해 메종은 직경 36.5mm, 두께 8.20mm에 불과한 역사적인 모델의 최적의 비율을 유지하였습니다. 새로운 L.U.C 1860 플라잉 투르비옹 모델은 윤리적으로 채굴된 18K 옐로우 골드로 제작되었으며, 수공 기요셰가 돋보이는 우아한 18K 옐로우 골드 다이얼이 특징입니다. 독특한 움직임을 감상할 수 있는 투명 케이스백은 수공 인그레이빙으로 완성된 유니크한 벌집 모티프가 내부에 장식된 우아한 커버로 보호됩니다. 쇼파드는 플라잉 투르비옹 시계로 크로노미터 인증과 제네바 홀마크 인증을 모두 받은 유일한 매뉴팩처입니다. L.U.C 1860 플라잉 투르비옹은 리미티드 에디션으로 10피스만 한정 출시됩니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
41	kr_w_chopard_l'heure_du_diamant_round	L'HEURE DU DIAMANT ROUND	L'HEURE DU DIAMANT ROUND 제품 번호 10A178 - 5301 쇼파드는 디아망트 워치를 통해 다이아몬드의 아름다움을 포착합니다. 럭셔리 주얼리 시계의 대가인 쇼파드 장인들이 모던한 디자인과 보석의 여왕인 다이아몬드의 눈부신 조화를 선보입니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
42	kr_w_chopard_l’heure_du_diamant_oval_medium	L’Heure du Diamant Oval Medium	L’Heure du Diamant Oval Medium 제품 번호 @13A390 - 5100 쇼파드는 디아망트 컬렉션을 통해 다이아몬드의 아름다움을 포착합니다. 럭셔리 주얼리 시계의 대가인 쇼파드 장인들이 모던한 디자인과 보석의 여왕인 다이아몬드의 눈부신 조화를 선보입니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
43	kr_w_chopard_해피_스포츠	해피 스포츠	해피 스포츠 제품 번호 278573 - 4001 해피 스포츠 컬렉션은 쇼파드 특유의 창의성과 대담함을 상징합니다. 1993년, 쇼파드는 스틸과 다이아몬드를 결합한 최초의 메종이 되었습니다. 2개의 사파이어 크리스탈 사이에서 자유롭게 회전하며 유쾌하게 춤추는 젬스톤을 선보인 이후 메종은 지금까지도 다양한 작품을 통해 풍성한 상상력을 표현합니다. 쇼파드가 워치메이킹 전문성을 바탕으로 여성스러운 케이스를 위해 특별히 개발된 오토매틱 와인딩 기계식 무브먼트를 장착한 30mm 해피 스포츠 모델을 선보입니다. 작은 다이아몬드의 커다란 기적을 만나보세요.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
44	kr_w_chopard_l'heure_du_diamant_(디아망트)_octagonal	L'Heure Du Diamant (디아망트) Octagonal	L'Heure Du Diamant (디아망트) Octagonal 제품 번호 13A097 - 1111 쇼파드는 디아망트 컬렉션을 통해 다이아몬드의 아름다움을 선사합니다. 럭셔리 주얼리 시계의 대가인 쇼파드 장인들이 모던한 디자인과 보석의 여왕인 다이아몬드의 눈부신 조화를 선보입니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
3376	us_w_daniel_wellington_9165142720825_iconic_motion	{"Iconic Motion"}	None	NULL	1	NULL	11	239	2024-06-21	2024-06-21	t
46	kr_w_chopard_해피_다이아몬드_주얼리	해피 다이아몬드 주얼리	해피 다이아몬드 주얼리 제품 번호 209436 - 1002 최초의 해피 다이아몬드 시계가 탄생한 1976년 이래로 무빙 다이아몬드는 해피 다이아몬드 컬렉션을 환하게 밝히고 있습니다. 해피 다이아몬드 아이콘은 무한한 가능성을 지닌 자유로운 정신을 유쾌하고 가볍게 표현하는 시계입니다 2개의 투명한 사파이어 크리스탈 사이에서 움직이는 무빙 다이아몬드는 스톤이 피부에 직접 닿아있는 듯한 느낌을 선사합니다. 손목 위에서 춤추는 다이아몬드는 즐겁고 우아한 매력을 마음껏 발산합니다... Little Diamonds Do Great Things	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
47	kr_w_chopard_알파인_이글_33_프로즌	알파인 이글 33 프로즌	알파인 이글 33 프로즌 제품 번호 295384 - 1003 독수리의 우아함과 알프스의 장엄함에서 영감을 받은 쇼파드의 세련된 스포츠 스타일 시계 컬렉션에서 알파인 이글 33 프로즌을 선보입니다. 18캐럿 윤리적 화이트 골드로 제작된 직경 33mm 케이스와 통합형 브레이슬릿을 전부 풀 컷 다이아몬드로 세팅하였으며, 베젤은 트라페즈 컷 다이아몬드로 세팅했습니다. 현대 사회를 살아가는 야망 있는 남성을 위한 알파인 이글 워치는 탁월한 디자인과 기술력을 자랑합니다. 주얼리를 장식한 버전에는 쇼파드 09.01-C 오토매틱 와인딩 무브먼트가 장착되어 있으며, 42시간의 파워 리저브를 제공합니다. 풍성한 다이아몬드의 광채가 알프스 산맥의 정상에서 빛나는 눈송이를 연상시키는 이 다이아몬드 시계는 윤리적인 주얼리 산업을 추구하는 쇼파드의 약속이 반영된 작품입니다.	NULL	1	NULL	4	209	2024-06-21	2024-06-21	t
48	ru_w_chopard_mille_miglia_classic_chronograph	Mille Miglia Classic Chronograph	Mille Miglia Classic Chronograph Артикул 168619 - 3005 Часы с новым дизайном Mille Miglia Classic Chronograph появились в коллекции Chopard Mille Miglia. Корпус диаметром 40,5 миллиметров изготовлен из Lucent Steel™, эксклюзивного сплава, состоящего на 80% из переработанной стали. Циферблат напоминает о черно-белом «шахматном» флаге, знаменующем победный финиш автомобильной гонки. Этот циферблат, символ спортивного духа, получил название «La Gara», что по-итальянски означает «гонка». Великолепное стекло типа glass box максимально его открывает, обеспечивая оптимальную читаемость. Механизм с функцией хронографа, отмечен за свою точность сертификатом хронометра. Дух соревнования и чувство товарищества, энергия и динамика, скорость и стиль — с 1988 года Chopard ежегодно вдохновляется этими качествами знаменитой итальянской гонки классических машин 1000 Miglia для дизайна часов коллекции Mille Miglia.	NULL	1	NULL	4	184	2024-06-21	2024-06-21	t
49	ru_w_chopard_happy_diamonds_icons	Happy Diamonds Icons	Happy Diamonds Icons Артикул 203957 - 1214 С момента появления в 1976 году первых часов Happy Diamonds танцующие бриллианты всегда оживляли коллекцию своей жизнерадостной аурой. Часы Happy Diamonds отличаются прежде всего игривым и беззаботным духом свободы, призывающим к бесконечным метаморфозам. Кружащиеся между двух абсолютно прозрачных сапфировых стекол бриллианты Happy Diamonds будто касаются кожи. Знаменитая модель теперь представлена в комплекте с новыми длинными и гибкими кожаными ремешками, которые дважды оборачиваются вокруг запястья, усиливая завораживающий эффект этих наручных часов, излучающих радостное очарование. Little Diamonds Do Great Things	NULL	1	NULL	4	184	2024-06-21	2024-06-21	t
50	ch_w_daniel_wellington_8133606670643_iconic_link	{"Iconic Link"}	Hinter der Iconic Link, einer modernen Interpretation eines klassischen Entwurfs, stecken viele Jahre Designarbeit und akribische Handwerkskunst. Die Iconic Link ziert ein luxuriöses Metallarmband mit dreiteiligen Gliedern; jedes Segment besteht aus sich verjüngenden, individuell gefertigten Edelstahlteilen – so entsteht ein nahtloser Übergang vom Gehäuse bis zum Verschluss. <br>Die markante Linienführung des leicht erhöhten Mittelteils sorgt dafür, dass es sich mühelos ins Gehäuse einfügt, während unser charakteristisches Ziffernblatt ein frisches, modernes Bild abgibt. <br>Die Iconic Link ist in lebhaft silberglänzendem Edelstahl (316L) oder mit feiner Roségoldauflage erhältlich. <br>Das Gliederarmband lässt sich perfekt an dein Handgelenk anpassen – entweder von deinem örtlichen Uhrmacher oder in einem unserer Daniel Wellington Geschäfte.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
51	ch_w_daniel_wellington_8133601820979_classic_sheffield	{"Classic Sheffield"}	Spurlos scheinen die Zeitläufte an der eleganten Classic Sheffield Herrenuhr in roségold mit ihrem Armband aus tiefschwarzem Leder und ihrer zeitlos-schönen Schlichtheit vorüberzuziehen. Dabei muss Schlichtheit keineswegs zwingend mit Langeweile einhergehen, wie dieses minimalistische Statement zweifelsohne beweist. <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington roségold Herrenuhr mit Uhrenarmband aus Leder der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
52	ch_w_daniel_wellington_8133612372275_quadro_pressed_evergold	{"Quadro Pressed Evergold"}	Die Quadro Pressed Evergold ist aus allen Blickwinkeln wunderschön – mit Absicht! Diese goldene Damenuhr vereint unser charakteristisches quadratisches, grünes Zifferblatt mit einem raffinierten goldenen Mesh-Armband. Es ist aus Edelstahl mit goldenem Finish gefertigt und mit einer glitzernden, stoffähnlichen Textur verwoben, die sich angenehm am Handgelenk anfühlt. Wenn du deinem Look einen besonderen Touch geben willst, wähle diese Uhr oder eine andere aus unserer Kollektion quadratischer Uhren mit grünem Zifferblatt. <br><br>Goldene Damenuhr mit quadratischem grünem Zifferblatt. Mit goldenem Mesh-Armband. <a href="https://www.danielwellington.com/color-dials/" rel="nofollow">Uhren mit grünem Zifferblatt online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
292	ch_w_daniel_wellington_8824461984068_classic_multi-eye_mesh_graphite	{"Classic Multi-Eye Mesh Graphite"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Grau, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Mesh-Armband in Grau, um den Look zu verändern.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
53	ch_w_daniel_wellington_8507983266116_quadro_mini_evergold_gold_emerald	{"Quadro Mini Evergold Gold Emerald"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr hat ein kompaktes Quadro-Zifferblatt in Smaragd mit einem raffinierten Sonnenschliff und zwei Indexen für einen minimalistischen Look.\nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Goldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
54	ch_w_daniel_wellington_8824462770500_bound_3-link_gold	{"Bound 3-Link Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Gold passt exakt zur Breite des 3-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
55	ch_w_daniel_wellington_8133599166771_classic_bristol	{"Classic Bristol"}	Die Classic-Kollektion wurde für Damen und Herren geschaffen, die klare Linien und schlichtes Design zu schätzen wissen. Mit ihrem puristischen Ziffernblatt, eingebunden in makellos dunkelbraunes Leder, sorgt diese elegante Herrenuhr in roségold an jedem Handgelenk für einen eleganten und stilvollen Auftritt. Ganz unabhängig davon, ob dieser im Alltagsoutfit oder in Abendgarderobe erfolgt.  Mit nur 6 mm ist diese ultraflache klassische Daniel Wellington Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser eleganten Daniel Wellington roségold Herrenuhr mit Lederarmband machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
56	ch_w_daniel_wellington_8507983167812_quadro_mini_evergold_gold_amber	{"Quadro Mini Evergold Gold Amber"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt in Bernstein mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look. \nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Goldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
57	ch_w_daniel_wellington_8824462049604_classic_multi-eye_ashfield_onyx	{"Classic Multi-Eye Ashfield Onyx"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Schwarz, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Mesh-Armband in Schwarz, um den Look zu verändern.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
58	ch_w_daniel_wellington_8824462115140_elan_lumine_gold	{"Elan Lumine Gold"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband in Gold und kleinen Kristallen auf weißem Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
59	ch_w_daniel_wellington_8133609455923_petite_melrose	{"Petite Melrose"}	<p>CLASSIC AND CHIC. Petite Melrose Light Pink features a charming light pink dial and an undeniably elegant rose gold mesh strap. This watch elevates your everyday outfit, your mood and your spirit.</p>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
60	ch_w_daniel_wellington_8133607293235_petite_ashfield	{"Petite Ashfield"}	 EDEL UND ELEGANT Feiern Sie die neue Saison auf zeitlose Art und Weise mit der Petite Ashfield. Diese ultradünne Uhr liegt geschmeidig am Arm und zeichnet sich durch ein mattschwarzes Mesh-Armband und ein elegantes schwarzes Zifferblatt aus. Erhältlich mit Details in Rotgold oder Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
61	ch_w_daniel_wellington_8507983397188_quadro_mini_melrose_rose_gold_champagne	{"Quadro Mini Melrose Rose Gold Champagne"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr hat ein kompaktes Quadro-Zifferblatt in Champagner mit einem raffinierten Sonnenschliff und zwei Indexen für einen minimalistischen Look.\nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Roségoldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
62	ch_w_daniel_wellington_8506412433732_iconic_chronograph_link_onyx_s	{"Iconic Chronograph Link Onyx S"}	Der Iconic Chronograph Link wird dich oft auf dein Handgelenk schauen lassen, und zwar nicht nur, um die Zeit zu überprüfen. Erstens das Design: Der klassische Chronographen-Look fügt sich nahtlos in unser minimalistisches Zifferblattdesign in Schwarz mit Sonnenschliff-Finish ein. Und dann sind da noch die drei Hilfszifferblätter, die mehrere Stoppuhr-Funktionen bieten und für makellose Präzision sorgen. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das Armband kann in Sekundenschnelle ohne Werkzeug ausgetauscht werden. So kannst du es mit anderen Armbändern und Stilen kombinieren, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
63	ch_w_daniel_wellington_8133606572339_iconic_link	{"Iconic Link"}	Die Iconic Link White mag zwar eine goldene Damenuhr sein, aber ihr Charisma ist das, was wirklich glänzt. Dieses Modell zieht die Aufmerksamkeit mit dem goldenen Gliederarmband auf sich und besticht durch sein designbetontes Zifferblatt. Das weiße Zifferblatt ist mit unserem charakteristischen Zwölf-Ziffern-Zifferblatt versehen, das dem klassischen Design einen modernen Touch verleiht und die Iconic White Link von anderen goldenen Uhren für Frauen abhebt. Natürlich ist Gold sehr vielseitig, also trage sie jeden Tag für einen außergewöhnlichen Look. Die ultimative goldene Uhr für Frauen. Goldenes Gliederarmband und weißes Zifferblatt. <a href="https://www.danielwellington.com/gold-watches/" rel="nofollow">Golduhren für Frauen online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
64	ch_w_daniel_wellington_8133606277427_iconic_link_arctic	{"Iconic Link Arctic"}	Die Iconic Link Arctic verfügt über ein dunkelblaues Strahlenschliff-Zifferblatt. Eine Farbe, die den Himmel, das Meer, Gelassenheit und Ruhe symbolisiert. Hergestellt aus poliertem Edelstahl, erhältlich mit einem strahlenden Silber-Finish. Eine zeitlose und klassische Uhr, die deinem Look eine einzigartige Note verleiht.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
543	de_w_daniel_wellington_8133601558835_classic_roselyn	{"Classic Roselyn"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold oder Silber und unserem traditionellen NATO Armband in Rubinrot, ist Classic Roselyn ein schlichter Begleiter für tagsüber und abends.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
65	ch_w_daniel_wellington_8133601788211_classic_sheffield	{"Classic Sheffield"}	Mit ihrem schwarzen Armband aus echtem italienischem Leder und dem markanten Ziffernblatt ist die Classic Sheffield Silber Herrenuhr ein anspruchsvoller Zeitmesser, der Ihrem Stil Selbstvertrauen und Ausstrahlung verleiht. Die Classic Sheffield Herrenuhr mit Uhrenarmband aus Leder ist das perfekte Accessoire für den modernen Gentleman. Mit ihrem schwarzen, italienischen Lederarmband und dem markanten Zifferblatt setzt diese silberne Uhr setzt ein Zeichen, egal, ob Sie im Büro oder in der Stadt unterwegs sind. Die Classic Sheffield Silber Herrenuhr ist ein Muss für jeden Mann, der gut aussehen will. Das Edelstahlgehäuse sorgt für eine lange Lebensdauer der Uhr, und das schwarze Armband aus italienischem Echtleder ist sowohl stilvoll als auch komfortabel.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
66	ch_w_daniel_wellington_8133613093171_quadro_pressed_unitone	{"Quadro Pressed Unitone"}	Die Quadro Unitone verfügt über ein nahtlos zum rechteckigen Ziffernblatt passendes Mesh-Armband in Gold. Sie ist aus poliertem Edelstahl gefertigt und setzt einen zarten Akzent. Eine zeitlose Damenuhr in gold, die bei jeder Gelegenheit den Ton angibt. <br> Mit ihrem zarten Mesh-Armband und dem polierten, rechteckigen Zifferblatt ist die Quadro Unitone der perfekte Begleiter für jeden Anlass. Ganz gleich, ob Sie sich für einen Abend in Schale werfen oder sich nur ums Geschäftliche kümmern, diese Damenuhr in gold verleiht Ihnen immer einen Hauch von Raffinesse. Außerdem ist sie aus robustem Edelstahl gefertigt, damit Sie all Ihre Abenteuer unbeschadet überstehen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
67	ch_w_daniel_wellington_8824483807556_quadro_mini_sterling	{"Quadro Mini Sterling"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini in der klassischen Version hat ein austauschbares Mesh-Armband in Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
68	ch_w_daniel_wellington_8134510149939_classic_mesh_onyx_black	{"Classic Mesh Onyx Black"}	Obwohl sie ultradünn und federleicht ist, verfügt die die Classic Mesh Onyx Black über eine ganze Menge Tiefe. Das schwarze Zifferblatt mit Sonnenschliff ist aus jedem Blickwinkel eine Augenweide, da es das Licht einfängt und reflektiert. Das Mesh-Armband fügt sich perfekt in das Stück ein und sorgt dank seiner gewebten Struktur dennoch für Aufmerksamkeit. Trage diese triumphale, minimalistische Uhr zu eleganten und lässigen Outfits und entdecke ihr Potenzial, indem du die Armbänder wechselst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
69	ch_w_daniel_wellington_8134510477619_classic_st_mawes_arctic	{"Classic St Mawes Arctic"}	Die neue Classic St Mawes Artic weiß, was es heißt, mutig zu sein. Das tiefblaue Zifferblatt mit strahlendem Finish, umrahmt von Roségold, ist ein starkes Argument für minimalistische, aber stilvolle Eleganz. Das austauschbare Lederband unterstreicht die raffinierte Ausstrahlung und verleiht dem Stück Vielseitigkeit. Wähle ein passendes NATO-Armband, wenn du einen lässigeren Look anstrebst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
70	ch_w_daniel_wellington_8133606408499_iconic_link	{"Iconic Link"}	Hinter der Iconic Link, einer modernen Interpretation eines klassischen Entwurfs, stecken viele Jahre Designarbeit und akribische Handwerkskunst. Die Iconic Link ziert ein luxuriöses Metallarmband mit dreiteiligen Gliedern; jedes Segment besteht aus sich verjüngenden, individuell gefertigten Edelstahlteilen – so entsteht ein nahtloser Übergang vom Gehäuse bis zum Verschluss. <br>Die markante Linienführung des leicht erhöhten Mittelteils sorgt dafür, dass es sich mühelos ins Gehäuse einfügt, während unser charakteristisches Ziffernblatt ein frisches, modernes Bild abgibt. <br>Die Iconic Link ist in lebhaft silberglänzendem Edelstahl (316L) oder mit feiner Roségoldauflage erhältlich. <br>Das Gliederarmband lässt sich perfekt an dein Handgelenk anpassen – entweder von deinem örtlichen Uhrmacher oder in einem unserer Daniel Wellington Geschäfte.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
71	ch_w_daniel_wellington_8506412368196_iconic_chronograph_link_onyx_b	{"Iconic Chronograph Link Onyx B"}	Der Iconic Chronograph Link wird dich oft auf dein Handgelenk schauen lassen, und zwar nicht nur, um die Zeit zu überprüfen. Erstens das Design: Der klassische Chronographen-Look trifft auf ultramodernen Geschmack in monochromem Schwarz mit elegantem Sonnenschliff-Finish. Und dann sind da noch die drei Hilfszifferblätter, die mehrere Stoppuhr-Funktionen bieten und für makellose Präzision sorgen. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das Armband kann in Sekundenschnelle ohne Werkzeug ausgetauscht werden. Du kannst es also entweder gegen Metall- oder Stoffarmbänder austauschen, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
72	ch_w_daniel_wellington_8133609324851_petite_lumine_pressed_sterling	{"Petite Lumine Pressed Sterling"}	Die Petite Lumine Pressed Mesh ist gewagt minimalistisch und setzt auf Brillanz statt auf übermäßige Details. Dank der kleinen, funkelnden Kristalle, die die Zeiger markieren, leuchtet das Zifferblatt von innen heraus. Das Armband, das mit glitzerndem Metall gewebt ist, ergänzt diese bemerkenswerte Uhr und lässt sie noch mehr strahlen. Wähle aus drei verfügbaren Farben deinen bevorzugten Glanz aus.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
73	ch_w_daniel_wellington_8134510215475_classic_mesh_onyx	{"Classic Mesh Onyx"}	Mit der Classic Mesh Onyx ist Großartiges gerade noch besser geworden. Unser unverwechselbarer Zeitmesser bekommt eine neue Zifferblattfarbe mit Sonnenschliff-Finish für einen raffinierten Look. Das Mesh-Armband verleiht der Uhr Textur und Glanz und fordert uns heraus, selbst in einem minimalistischen Stück Komplexität zu entdecken. Außerdem macht das austauschbare Armband diese Uhr vielseitig und absolut zeitlos. Ein zweites Armband kann deinen Zeitmesser in eine ganz neue Uhr verwandeln!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
74	ch_w_daniel_wellington_8133612765491_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Das Beste daran, dass heutige Stile so facettenreich sind? Du musst nicht klassisch gekleidet sein, um eine klassische Damenuhr wie die Quadro Pressed Sheffield zu tragen. Ganz im Gegenteil, diese minimalistische Uhr mit dem eleganten quadratischen weißen Zifferblatt und dem schlichten hochwertigen Lederarmband wertet deinen Freizeitlook auf. Das Gehäuse ist aus Edelstahl gefertigt und mit strahlendem Goldfinish versehen, das für die richtige Portion Glanz sorgt. Hole dir diesen Zeitmesser oder entdecke andere klassische Uhren für Frauen aus unserer Kollektion und gönne dir eine überraschende Kombination.  <br><br>Klassische Damenuhr in Gold. Schwarzes Lederarmband und quadratisches weißes Zifferblatt. <a href="https://www.danielwellington.com/womens-watches/" rel="nofollow">Klassische Uhren für Frauen online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
86	ch_w_daniel_wellington_8824462868804_bound_9-link_gold	{"Bound 9-Link Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Gold passt exakt zur Breite des 9-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
5617	li_w_hublot_414.ni.1123.rx_big_bang_meca-10_titanium_45_mm	Big Bang MECA-10 Titanium 45 mm	Entdecken Sie die Uhr Big Bang MECA-10 Titanium in 45 mm mit Armband aus Kautschuk. Schwarz 45mm Titan	NULL	1	NULL	16	127	2024-06-21	2024-06-21	t
75	ch_w_daniel_wellington_8133601722675_classic_sheffield	{"Classic Sheffield"}	Wenn du eine klassische Luxusuhr suchst, ist diese genau richtig. Die Classic Sheffield ist die perfekte Uhr, die hochwertig aussieht und sich auch so anfühlt, ohne teuer zu sein. Mit elegantem schwarzen Zifferblatt und passendem schwarzen Lederarmband bietet sie alles, was du von einer exklusiven goldenen Herrenuhr erwartest: Präsenz, Charakter und zeitlosen Stil. Die Goldplattierung hat genau die richtige Menge an Glanz, um einen durchdachten Look mit verspieltem Akzent zu erzielen. Mach sie zu deinem Klassiker für jeden Tag.<br><br>Goldene Herrenuhr mit schwarzem Zifferblatt und schwarzem Lederarmband. Klassische Luxusuhr. <a href="https://www.danielwellington.com/mens-watches/" rel="nofollow">Herrenuhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
76	ch_w_daniel_wellington_8133606900019_iconic_link_lumine	{"Iconic Link Lumine"}	Die Lumine ziert ein elfenbeinweißes Ziffernblatt besetzt mit funkelnden Kristallen. Das exklusive Design verleiht unserem charakteristischen Ziffernblatt eine neue und leuchtende Silhouette. Ihre Zweifarbigkeit erhält die Lumine durch polierten Edelstahl mit lebendigem Silberfinish im Zusammenspiel mit kontrastierenden Elementen im Armband und im Gehäuse in raffiniertem Roségold. Diese einmalige Kombination gibt dieser Uhr ihren eleganten und anmutigen Look.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
77	ch_w_daniel_wellington_8824462147908_elan_lumine_silver	{"Elan Lumine Silver"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband in Silber und kleinen Kristallen auf weißem Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
78	ch_w_daniel_wellington_8823882449220_quadro_roman_numerals_sterling	{"Quadro Roman Numerals Sterling"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
79	ch_w_daniel_wellington_8133613060403_quadro_pressed_sterling	{"Quadro Pressed Sterling"}	Die Quadro ist unsere erste Uhr mit eckigem Zifferblatt. Hergestellt aus poliertem Edelstahl und erhältlich in einem lebendigen Silberfinish. Die rechteckige Uhr hat ein klares, minimalistisches Aussehen und Gefühl. Die Quadro Sterling Silber Uhr ist perfekt für die moderne Frau. Mit ihrem klaren und minimalistischen Design ist diese Armbanduhr perfekt für jede Gelegenheit. Das polierte Edelstahlgehäuse und das quadratische Zifferblatt in Weiß sind elegant und zeitlos. Egal, ob Sie sich schick anziehen oder nicht, diese Damenuhr wird immer gut aussehen und Ihren Look aufwerten. Und mit ihrem bequemen Mesh-Armband werden Sie sie nie mehr ablegen wollen!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
80	ch_w_daniel_wellington_8824462442820_bound_black_crocodile_rose_gold	{"Bound Black Crocodile Rose Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Roségold passt exakt zur Breite des schwarzen Lederarmbands mit Krokoprägung — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
81	ch_w_daniel_wellington_8133610733875_petite_st_mawes	{"Petite St Mawes"}	Für eine etwas kleinere Golduhr für Frauen hat die Petite Mawes eine Menge zu sagen. Sie spricht von schlichter Eleganz, Minimalismus und den kleinen Freuden des Lebens. Mit ihrem weißen Zifferblatt, das von einem Edelstahlgehäuse mit strahlender Goldbeschichtung umrahmt wird, ist diese Uhr auch eine vielseitige Ergänzung für deinen Kleiderschrank. Das braune Lederarmband passt sowohl zu lässigen als auch zu eleganten Looks. Sie passt auch in dein Budget, denn sie ist eine der günstigsten kleinen Uhren für Frauen. <br><br>Kleine goldene Uhr für Frauen. Mit weißem Zifferblatt und braunem Lederarmband. <a href="https://www.danielwellington.com/petite-collection/">Kleine Uhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
82	ch_w_daniel_wellington_8133612831027_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Beeindrucken Sie mit der Quadro - unserer quadratischen Damenuhr mit elegantem Lederarmband in schwarz. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Ausführung erhältlich. Mit ihrem eleganten rechteckigen Zifferblatt in weiß und dem bequemen Mesh-Armband ist die Quadro perfekt, um Ihren Look aufzuwerten.  Egal ob Sie sich schick anziehen oder nicht, diese vielseitige Roségold Damenuhr mit Lederarmband macht immer eine gute Figur. Das rechteckige Zifferblatt in Weiß wird von einem Roségoldenen Gehäuse eingerahmt und verleiht der rechteckigen Uhr eine schlichte Eleganz. Das schwarze Lederarmband verleiht ihr einen Hauch von Raffinesse und rundet den Look ab. Egal, ob Sie ins Büro oder zum Abendessen gehen, mit der Quadro setzen Sie ein Zeichen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
83	ch_w_daniel_wellington_8133612503347_quadro_pressed_melrose	{"Quadro Pressed Melrose"}	Die Quadro Melrose ist eine elegante und raffinierte Damenuhr mit einem quadratischen Zifferblatt in Weiß- und Roségold. Dieser vielseitige Zeitmesser aus poliertem Edelstahl ist perfekt, um Ihren Look aufzuwerten. Ganz gleich, ob Sie sich schick oder unschick anziehen, die rechteckige Damenuhr mit Mesh-Armband in Roségold sieht immer gut aus.  Mit der Quadro Melrose behalten Sie die Zeit im Griff! Das rechteckige weiße Zifferblatt ist leicht ablesbar, und das Mesh-Armband ist bequem und stilvoll. Die Quadro Melrose ist eine elegante und anspruchsvolle Damenuhr, gefertigt aus poliertem Edelstahl in Weiß- und Roségold. Mit ihrem vielseitigen quadratischen Ziffernblatt ist diese Damenuhr perfekt für alle Anlässe.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
84	ch_w_daniel_wellington_8133606965555_iconic_link_unitone	{"Iconic Link Unitone"}	Die Iconic Link Unitone ist eine elegante und schicke Uhr in Roségold, die ein Statement setzt. Mit ihrem passenden Metallgliederarmband und roségoldenen Zifferblatt ist diese Damenuhr perfekt für jeden Anlass. Ganz gleich, ob Sie sich für ein besonderes Ereignis herausputzen oder Ihrem Alltagslook einen Hauch von Luxus verleihen möchten, die Iconic Link Unitone Damenuhr mit Gliederarmband ist die perfekte Wahl. Mit ihrem klassischen Design und den luxuriösen Materialien wird die Iconic Link Unitone Roségold Uhr zu einem wertvollen Erinnerungsstück. Diese Uhr ist das perfekte Accessoire, um sich schick zu machen oder Ihrem Alltagslook einen Hauch von Luxus zu verleihen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
85	ch_w_daniel_wellington_8133606342963_iconic_link	{"Iconic Link"}	Für manche ist die Iconic Link Black ihre erste goldene Uhr. Aber für die meisten ist sie die Letzte. Diese goldene Uhr für Frauen hat ein elegantes schwarzes Zifferblatt, gehalten von einem luxuriösen Gliederarmband. Jedes Glied ist einzeln aus massivem Edelstahl gefertigt und hat ein strahlendes Goldfinish. Kein Wunder, dass die Iconic Link Black eine so beliebte Uhr in unserer Kollektion goldener Uhren für Frauen ist. Sie vereint das Beste aus beiden Welten: sie zelebriert den Minimalismus – auf glamouröse Weise. <br><br>Die ultimative goldene Uhr für Frauen. Goldenes Gliederarmband und schwarzes Zifferblatt. <a href="https://eu.danielwellington.com/de-de/collections/gold-watches/" title="Goldene uhren">Goldene uhren</a>.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
87	ch_w_daniel_wellington_8134511264051_petite_5-link_evergold	{"Petite 5-Link Evergold"}	Die Petite 5-Link Evergold ist sowohl bei formellen als auch bei legeren Anlässen der absolute Hingucker. Dank des schlanken, vergoldeten 5-gliedrigen Armbands kann dieser minimalistische Zeitmesser problemlos Schmuck ersetzen oder dein Armband-Ensemble ergänzen. Das schlichte, eierschalenweiße Zifferblatt unterstreicht das verschlungene Armband, während die goldenen Indexe dessen Glanz widerspiegeln. Der Wechsel des Armbands ist ganz einfach, also entscheide dich für ein Leder- oder NATO-Armband für einen radikal anderen Stil.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
88	ch_w_daniel_wellington_8134511919411_quadro_lumine_5-link_two-tone	{"Quadro Lumine 5-link two-tone"}	Die Quadro Lumine Two-Tone macht aus dem Kontrast eine Kunstform. Das kühle Silber vermischt sich mit der warmen Vergoldung des Uhrenarmbands. Dann heben sich die hochwertig schimmernden Kristalle von dem minimalistischen weißen Zifferblatt ab. Schließlich fügen sich die Glieder des Uhrenarmbands wie Puzzleteile ineinander, sodass ein nahtloser Fluss entsteht. Hier ist ein spektakuläres Stück, das du mit Selbstvertrauen tragen kannst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
89	ch_w_daniel_wellington_8133610766643_petite_st_mawes	{"Petite St Mawes"}	 DIE SCHÖNHEIT DER EINFACHHEIT Das weiße Zifferblatt der Petite ist mit seiner minimalistischen Schönheit und dem Glanz des zeitlosen St. Mawes-Armbands einzigartig. St. Mawes ist eines unserer begehrtesten Armbänder und besteht aus echtem italienischem Leder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
90	ch_w_daniel_wellington_8133608440115_petite_dover	{"Petite Dover"}	Inspiriert von den weißen Kreidefelsen in Dover, ist unsere Petite Dover Roségold Uhr das Must-Have des Sommers. Mit ihrem elfenbeinfarbenen Ziffernblatt, Details in Roségold und einem reinweißen NATO-Armband ist sie der Inbegriff des Sommers. Mit nur 6 mm ist diese ultraflache Uhr den ganzen Tag und Abend über bequem zu tragen. Egal, ob Sie in der Stadt oder am Strand unterwegs sind, diese Uhr mit weißem Zifferblatt lässt Sie immer gut aussehen und das NATO-Armband sorgt den ganzen Tag über für maximalen Tragekomfort. Verleihen Sie Ihrem Alltagsstil einen Hauch von Eleganz mit unserer Petite Dover Uhr in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
91	ch_w_daniel_wellington_8133611880755_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano in Weiß ist eine Uhr, die... Zeit verlangt. Sie will entdeckt und einfach nur bewundert werden. Das einzigartige Perlmuttmuster des Zifferblatts, die ovale Konstellation glitzernder Kristalle, die die Zeiger hervorheben, und das neuen Studio-Uhrenarmband setzen eine Vielzahl fantasievoller Akzente. Diese Uhr ist in drei Farben erhältlich, wobei jede neue Version noch glamouröser ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
92	ch_w_daniel_wellington_8824484102468_quadro_mini_sheffield_gold	{"Quadro Mini Sheffield Gold"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Gold-Version der Quadro Mini hat ein austauschbares schwarzes Armband aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
93	ch_w_daniel_wellington_8824461754692_classic_multi-eye_st_mawes_amber	{"Classic Multi-Eye St Mawes Amber"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Amber, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Lederarmband in Braun und roségoldenen Details.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
94	ch_w_daniel_wellington_8823882514756_petite_roman_numerals_5-link_gold	{"Petite Roman Numerals 5-Link Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem 5-Glieder-Armband in Gold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
95	ch_w_daniel_wellington_8133612732723_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Die Quadro ist unsere erste Uhr mit einem quadratischen Zifferblatt. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Beschichtung erhältlich. Die Quadro ist die perfekte Damenuhr, um Ihren Look auf das nächste Level zu bringen. Diese rechteckige Damenuhr ist der Traum einer jeden Minimalistin und eignet sich perfekt, um ein subtiles Statement abzugeben. Mit ihrem polierten Edelstahlgehäuse und dem schlanken, quadratischen schwarzen Zifferblatt macht diese schwarze Damenuhr immer eine gute Figur. Diese rechteckige Damenuhr wird immer auffallen, egal wie Sie gekleidet sind und mit ihrem bequemen Lederarmband werden Sie sie nie mehr ablegen wollen!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
96	ch_w_daniel_wellington_8133608735027_petite_emerald	{"Petite Emerald"}	Die atemberaubende Petite Emerald Damenuhr ist perfekt für stilvolle Frauen, die ihrem Look einen Hauch von Glamour und eine einzigartige Note verleihen wollen. Die kleine Uhr mit dem schönen dunkelgrünen Zifferblatt mit Strahlenschliff ist aus poliertem Edelstahl gefertigt und mit einer veredelten Goldauflage versehen. Dunkelgrün ist eine Farbe, die Gleichgewicht, Harmonie und Glück symbolisiert. Mit ihrem japanischen Quarzwerk für eine präzise Zeitmessung und dem verstellbaren Mesh-Armband ist diese kleine grüne Damenuhr perfekt für jede Gelegenheit. Die Gehäusedicke von nur 6 mm macht sie perfekt für den Alltag.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
97	ch_w_daniel_wellington_8133608669491_petite_durham	{"Petite Durham"}	 FÜR DEN WAHREN KENNER Geschätzt für ihren Vintage-Look verfügt das Durham-Armband über eine einzigartige Patina, dessen Leder durch das Tragen erst richtig zum Leuchten kommt. Das minimalistische Design der Petite und das weiße Zifferblatt ergeben mit dem Durham-Armband eine aufregende und stilvolle Kombination.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
98	ch_w_daniel_wellington_8134510084403_classic_mesh_graphite	{"Classic Mesh Graphite"}	Monochrome Uhren werden stark unterschätzt und die Classic Mesh Graphite ist das perfekte Beispiel dafür. Dieser absolut moderne Zeitmesser bringt industrielle Inspiration in unser Classic-Design ein, ohne dabei Kompromisse bei der Raffinesse einzugehen. Das schlichte Zifferblatt mit Sonnenschliff lädt uns ein, satte Grautöne zu erkunden, während das Mesh-Armband das ganze Stück stützt und atmen lässt. Spiele mit Stilen und experimentiere, indem du das Armband veränderst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
99	ch_w_daniel_wellington_8133611913523_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano in Weiß ist eine Uhr, die... Zeit verlangt. Sie will entdeckt und einfach nur bewundert werden. Das einzigartige Perlmuttmuster des Zifferblatts, die ovale Konstellation glitzernder Kristalle, die die Zeiger hervorheben, und das neuen Studio-Uhrenarmband setzen eine Vielzahl fantasievoller Akzente. Diese Uhr ist in drei Farben erhältlich, wobei jede neue Version noch glamouröser ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
100	ch_w_daniel_wellington_8623173828932_quadro_lumine_bezel_evergold_mop	{"Quadro Lumine Bezel Evergold MOP"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
13482	au_w_ulysse_nardin_8165-182b-black_diver	Diver		NULL	1	NULL	6	14	2024-06-21	2024-06-21	t
101	ch_w_daniel_wellington_8133599658291_classic_cornwall	{"Classic Cornwall"}	Mit ihrem markanten Ziffernblatt und dem ganz in Schwarz gehaltenen NATO-Armband ist die Classic Cornwall Silber Herrenuhr ein echter Blickfang, welcher die zeitlose Eleganz unserer Classic Collection verkörpert. Mit ihrem eleganten Design und faszinierenden Aussehen ist diese Uhr ein moderner Klassiker für jeden Anlass. Das silberne Gehäuse verleiht Ihrem Look einen Hauch von Luxus. Mit ihrem eleganten schwarzen Zifferblatt und dem komplett schwarzen NATO-Armband aus Stoff ist diese Herrenuhr perfekt für jede Gelegenheit. Ganz gleich, ob Sie sich für einen Abend in Schale werfen oder einfach nur eine zuverlässige Uhr für den Alltag suchen, die Classic Cornwall Natoband Uhr ist die richtige Wahl für Sie.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
102	ch_w_daniel_wellington_8133610996019_petite_sterling	{"Petite Sterling"}	Die Petite Sterling Damenuhr in Silber mit schwarzem Zifferblatt ist eine außergewöhnliche Kombination von Stil und Haltung. Sie ist ein echtes Design-Statement und die perfekte Uhr für jeden Anlass. <br> Diese elegante und raffinierte Damenuhr ist perfekt für jede Gelegenheit, ob Sie nun an einer formellen Veranstaltung teilnehmen, Tennis spielen oder einfach einen sonnigen Tag genießen. Mit ihrem hauchdünnen 6-mm-Gehäuse und dem silbernen Mesh-Armband ist diese kleine Uhr perfekt für alle, die einen luxuriösen, hochwertigen Zeitmesser suchen. Das schwarze Zifferblatt mit silbernen Details ist stilvoll und zeitlos.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
103	ch_w_daniel_wellington_8133606244659_iconic_link_amber	{"Iconic Link Amber"}	Die Iconic Link verfügt über ein hellbraunes Zifferblatt mit Strahlenschliff. Eine lebendige Farbe, die Wärme, Energie und Dynamik ausstrahlt. Hergestellt aus poliertem Edelstahl, erhältlich mit einer veredelten Roségold-Auflage. Eine auffällige Uhr, die deinem Look eine einzigartige Note verleiht.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
104	ch_w_daniel_wellington_8824462606660_bound_durham_gold	{"Bound Durham Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Gold passt exakt zur Breite des braunen Lederarmbands mit Krokoprägung — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
105	ch_w_daniel_wellington_8824484266308_quadro_mini_lumine_bezel_silver	{"Quadro Mini Lumine Bezel Silver"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini Lumine Bezel hat kleine, glitzernde Kristalle und ein austauschbares Mesh-Armband in Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
106	ch_w_daniel_wellington_8133611258163_petite_unitone	{"Petite Unitone"}	Die Petite Unitone Damenuhr ist sowohl raffiniert als auch schick. Ihr Gehäuse aus poliertem Edelstahl und ihr silbernes Mesh-Armband sind perfekt aufeinander abgestimmt und machen sie zu einem zarten Schmuckstück für jede Gelegenheit. Das japanische Quarzwerk dieser kleinen Edelstahl Uhr sorgt für eine genaue Zeitmessung, während die Gehäusedicke von 6 mm einen angenehmen Tragekomfort gewährleistet.  Wenn Sie also eine kleine Damenuhr suchen, die einen großen Eindruck macht, dann ist die Daniel Wellington Petite Unitone mit einem silbernen Mesh-Armband genau das Richtige für Sie. Nehmen Sie diese Silber Uhr in Ihre Damenuhren Sammlung auf und haben Sie jahrelang Freude an ihr.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
107	ch_w_daniel_wellington_8133609652531_petite_pressed_melrose	{"Petite Pressed Melrose"}	Die Petite Pressed Melrose ist die perfekte Damenuhr mit Mesh-Armband für alle, die die Schönheit der kleinen Dinge zu schätzen wissen. Gefertigt aus poliertem Edelstahl mit einer Auflage aus edlem Roségold, ist diese Damenuhr sowohl stilvoll als auch anspruchsvoll. Das weiße Zifferblatt verleiht ihr einen Hauch von Eleganz und macht sie zu einem perfekten Accessoire für jedes Outfit. <br> Diese zierliche und feminine Damenuhr in roségold ist perfekt für das tägliche Tragen. Das weiße Zifferblatt macht sie leicht ablesbar, während das flache Design dafür sorgt, dass sie den ganzen Tag über bequem zu tragen ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
108	ch_w_daniel_wellington_8133611159859_petite_unitone	{"Petite Unitone"}	Die Petite Unitone Damenuhr ist die perfekte Ergänzung zu jedem Outfit. Das goldene Mesh-Armband und das Zifferblatt sind perfekt aufeinander abgestimmt. Ihr 6 mm dünnes Edelstahlgehäuse ist elegant, zierlich und ein echter Blickfang. Mit ihrem japanischen Quarzwerk ür eine präzise Zeitmessung und dem längenverstellbaren Armband ist diese kleine Uhr perfekt für jede Gelegenheit. Die doppelt beschichtete Edelstahlkonstruktion dieser Gold Damenuhr garantiert Langlebigkeit. Die Petite Unitone ist das perfekte Accessoire, egal ob Sie sich schick anziehen oder nicht. Genießen Sie es mit dieser Gold Damenuhr, die Zeit stilvoll verstreichen zu lassen!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
109	ch_w_daniel_wellington_8133606375731_iconic_link	{"Iconic Link"}	Hinter der Iconic Link, einer modernen Interpretation eines klassischen Entwurfs, stecken viele Jahre Designarbeit und akribische Handwerkskunst. Die Iconic Link ziert ein luxuriöses Metallarmband mit dreiteiligen Gliedern; jedes Segment besteht aus sich verjüngenden, individuell gefertigten Edelstahlteilen – so entsteht ein nahtloser Übergang vom Gehäuse bis zum Verschluss. <br>Die markante Linienführung des leicht erhöhten Mittelteils sorgt dafür, dass es sich mühelos ins Gehäuse einfügt, während unser charakteristisches Ziffernblatt ein frisches, modernes Bild abgibt. <br>Die Iconic Link ist in lebhaft silberglänzendem Edelstahl (316L) oder mit feiner Roségoldauflage erhältlich. <br>Das Gliederarmband lässt sich perfekt an dein Handgelenk anpassen – entweder von deinem örtlichen Uhrmacher oder in einem unserer Daniel Wellington Geschäfte.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
110	ch_w_daniel_wellington_8591970533700_iconic_chronograph_sheffield_rg	{"Iconic Chronograph Sheffield RG"}	Der Iconic Chronograph Sheffield stattet dich mit fast allem aus, was du für einen erfolgreichen Tag brauchen könntest. Fangen wir mit dem Stil an: Der klassische Chronographen-Look fügt sich nahtlos in unser minimalistisches Zifferblattdesign in Weiß ein, das durch einen Rahmen aus Roségold akzentuiert wird. Mit seinen drei Hilfszifferblättern bietet er außerdem mehrere Stoppuhr-Funktionen und sorgt für makellose Präzision. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das hochwertige Nappalederband kann in Sekundenschnelle und ohne Werkzeug ausgetauscht werden. Du kannst es also entweder gegen Metall- oder Stoffarmbänder austauschen, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
111	ch_w_daniel_wellington_8891799863620_bound_black_crocodile_gold	{"Bound Black Crocodile Gold"}	None	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
133	ch_w_daniel_wellington_8623174058308_quadro_lumine_bezel_sterling_black_mop	{"Quadro Lumine Bezel Sterling Black MOP"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
5669	ae_w_hublot_642.ox.0180.rx_spirit_of_big_bang_king_gold_42_mm	Spirit of Big Bang King Gold 42 mm	Discover the Spirit of Big Bang King Gold in 42 mm with Rubber strap Black 42mm King Gold	NULL	1	NULL	16	235	2024-06-21	2024-06-21	t
112	ch_w_daniel_wellington_8507983364420_quadro_mini_melrose_rose_gold_blush	{"Quadro Mini Melrose Rose Gold Blush"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt in Rosa mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look.\nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Roségoldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
113	ch_w_daniel_wellington_8133608079667_petite_cornwall	{"Petite Cornwall"}	Die Petite Cornwall steht für die reine Essenz von Einfachheit und Stil. Mit dem ganz in Schwarz gehaltenen NATO-Armband und dem schwarzen Zifferblatt wird diese klare und elegante Uhr zu ihrem alltäglichen und stilvollen Begleiter. <br> Sie suchen nach einer vielseitigen und stilvollen Damenuhr, die Ihren Alltagslook aufwertet? Dann ist die Petite Cornwall NATO Uhr in Schwarz/Silber genau das richtige für Sie. Mit ihrem schwarzen NATO-Armband und dem schlichten schwarzen Zifferblatt ist diese Uhr perfekt, um jedem Outfit einen Hauch von Klasse zu verleihen. Durch das flache Design ist sie den ganzen Tag über bequem zu tragen, und das silberne Gehäuse verleiht ihr genau den richtigen Schimmer. Egal, ob Sie sich für die Arbeit schick machen oder in der Stadt unterwegs sind, diese kleine Damenuhr mit Uhrenarmband aus Stoff wird Ihren Stil auf jeden Fall aufwerten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
114	ch_w_daniel_wellington_8133601755443_classic_sheffield	{"Classic Sheffield"}	Mit ihrem schwarzen Armband aus echtem italienischem Leder und dem markanten Ziffernblatt ist die Classic Sheffield Roségold Herrenuhr ein anspruchsvoller Zeitmesser, der Ihrem Stil Selbstvertrauen und Ausstrahlung verleiht. Egal, ob Sie sich für einen besonderen Anlass herausputzen oder einfach nur Ihren Alltagslook aufpeppen möchten, die Classic Sheffield Herrenuhr in Roségold mit schwarzem Zifferblatt ist die perfekte Wahl. Sie bietet eine raffinierte Möglichkeit, Ihrem Outfit Stil zu verleihen und mit ihrem schwarzen, italienischen Lederarmband und dem auffälligen Zifferblatt ist diese Herrenuhr ein echter Hingucker. Mit ihrer robusten Konstruktion und ihrem stilvollen Design ist die Classic Sheffield Herrenuhr ein unverzichtbares Accessoire für jeden Mann, der gut aussehen möchte.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
115	ch_w_daniel_wellington_8133612208435_quadro_pressed_evergold	{"Quadro Pressed Evergold"}	Ecken und Kanten können sehr feminin sein. Die Pressed Evergold Black bringt das perfekt zur Geltung. Diese quadratische Golduhr für Frauen wirkt dank ihres schwarzen Ziffernblatts zierlich und mutig zugleich. Das Mesh-Armband aus Edelstahl mit goldenem Finish verleiht der Uhr eine glänzende, stoffartige Textur und sorgt für umfassenden Tragekomfort. Wenn dein Look also nur einen kleinen Schubs braucht, um etwas Abwechslung zu erhalten, dann wähle eine unserer quadratischen Damenuhren.<br><br>Kleine goldene Damenuhr mit goldenem Mesh-Armband und quadratischem Zifferblatt in Schwarz. <a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow">Kleine Damenuhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
116	ch_w_daniel_wellington_8623173763396_quadro_lumine_bezel_5-link_two-tone_mop	{"Quadro Lumine Bezel 5-Link Two-Tone MOP"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
117	ch_w_daniel_wellington_8823882350916_petite_roman_numerals_5-link_silver	{"Petite Roman Numerals 5-Link Silver"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem 5-Glieder-Armband in Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
118	ch_w_daniel_wellington_8824462999876_bound_9-link_silver	{"Bound 9-Link Silver"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Silber passt exakt zur Breite des 9-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
119	ch_w_daniel_wellington_8133606703411_iconic_link_emerald	{"Iconic Link Emerald"}	Die Iconic Link Emerald rüttelt die von Minimalismus und unzähligen Grautönen dominierte Modewelt auf. Mit ihrem mutigen smaragdgrünen Zifferblatt beweist sie, wie intensiv und bereichernd Farbe sein kann. Eine Erfahrung, die wir uns nicht vorenthalten sollten. Das goldene Gliederarmband aus schimmerndem Edelstahl bildet den perfekten Rahmen für das smaragdgrüne Zifferblatt und rundet diese goldene Damenuhr ab. Alles in allem ist sie eine unserer gewagtesten Golduhren mit grünem Zifferblatt auf dem Markt. <br><br>Goldene Damenuhr mit grünem Zifferblatt. Mit goldenem Gliederarmband und Verschluss. <a href="https://www.danielwellington.com/gold-watches/" rel="nofollow">Golduhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
120	ch_w_daniel_wellington_8133606506803_iconic_link_capri	{"Iconic Link Capri"}	Die Iconic Link Capri fällt mit ihrem blauen Zifferblatt sofort ins Auge. Der Pastellton erinnert an den blauen Himmel über Capri in den stilvollen 80er Jahren. Sie ist aus rostfreiem Stahl gefertigt und erhältlich mit elegantem Silberfinish. Trotz ihres Retro-Flairs wirkt dieses mutige Design ausgesprochen modern. <br><br> Die Iconic Link Capri bringt mit ihrem himmelblauen Zifferblatt frischen Wind. Ihr klares Design verleiht dem 80er-Jahre-Beach-Style eine moderne Note. Das silberne Edelstahlarmband ist der perfekte Ausgleich zu dem seidenmatten, farbigen Zifferblatt. Trage sie mit Selbstvertrauen und verleihe deinen Outfits einen frohen und stilvollen Touch.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
121	ch_w_daniel_wellington_8133607555379_petite_bondi	{"Petite Bondi"}	Die Petite Bondi mit ihrem weißen Lederarmband und dem eierschalenweißen Zifferblatt signalisiert zugleich Einfachheit und Anmut. Diese kleine Damenuhr schmiegt sich sanft an den Arm und verleiht Ihrem Stil frische Energie. <br> Ihr schlichtes Design wird durch ein weißes Lederarmband und ein eierschalenweißes Zifferblatt ergänzt und macht sie perfekt für jede Gelegenheit. Mit ihrem ultradünnen 6-mm-Gehäuse aus Roségold ist diese kleine Uhr sehr angenehm zu tragen. Ganz gleich, ob Sie sich für eine formelle Veranstaltung herausputzen oder einfach nur im Park spazieren gehen, mit der Petite Bondi fühlen Sie sich sicher und stilvoll.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
171	ch_w_daniel_wellington_8133611323699_petite_york	{"Petite York"}	ÜBERZEUGUNG UND STIL Die elegante Petite mit dem schwarzen Zifferblatt und dem dunkelbraunen Armband aus italienischem Leder mit Krokodil-Prägung steht für einen anspruchsvollen Look.  Dies ist eine Uhr, an der man viele Jahre seine Freude hat.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
11879	fr_w_tudor_m79950-0002_ranger	Ranger	['Calibre Manufacture MT5402 (COSC)', 'Boîtier en acier, 39 mm', 'Cadran noir']	NULL	1	NULL	8	76	2024-06-21	2024-06-21	t
122	ch_w_daniel_wellington_8133610373427_petite_sheffield	{"Petite Sheffield"}	Die Petite mit eierschalweißem Zifferblatt und einem klassischen schwarzen Sheffield-Lederarmband passt zu jedem Anlass. Mit einem hauchdünnen 6-mm-Gehäuse in Roségold besticht diese elegante Damenuhr durch ihren zeitlosen Stil. Eine echte Design-Ikone. <br> Diese kleine Uhr ist ein eleganter und stilvoller Zeitmesser, der sich für jeden Anlass eignet. Ob Sie an einer formellen Veranstaltung teilnehmen, Tennis spielen oder einen sonnigen Tag im Country Club genießen, diese ultraflache Daniel Wellington Uhr ist der ideale Begleiter für alle Gelegenheiten und sieht immer schick und raffiniert aus. Das ultraschlanke 6-mm-Gehäuse aus Roségold macht diese Uhr sehr angenehm zu tragen, und das schwarze Lederarmband verleiht ihr einen zeitlosen Look.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
123	ch_w_daniel_wellington_8133607227699_petite_amber	{"Petite Amber"}	Die Petite Amber ist eine hellbraune Damenuhr mit einem Strahlenschliff. Sie ist aus poliertem Edelstahl gefertigt und mit einer raffinierten Roségold-Auflage versehen. Ihr 6 mm dünnes Gehäuse und wirkt zart und elegant zugleich. Das japanische Quarzwerk dieser kleinen Uhr sorgt für eine genaue Zeitmessung, während die Breite von 12 mm und die verstellbare Länge des Armbands von 150-205 mm für einen bequemen Sitz sorgen. <br> Mit ihrem hellbraunen Zifferblatt und dem Strahlenschliff verleiht diese kleine Damenuhr jedem Look einen Hauch von Wärme und Energie. Ein wunderschöner Zeitmesser in roségold, perfekt, um jedem Outfit einen Hauch von Eleganz zu verleihen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
124	ch_w_daniel_wellington_8133612601651_quadro_pressed_melrose	{"Quadro Pressed Melrose"}	Die Quadro Pressed Melrose hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem eleganten gepressten Mesharmband.    Eine quadratische Uhr ist ein elegantes Accessoire, besonders mit dem schlanken Mesharmband. Diese Uhr ist Teil unserer<a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow"> Quadro Kollektion.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
125	ch_w_daniel_wellington_8824462082372_classic_multi-eye_evergold_onyx	{"Classic Multi-Eye Evergold Onyx"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Schwarz, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Mesh-Armband in Gold, um den Look zu verändern.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
126	ch_w_daniel_wellington_8507983200580_quadro_mini_evergold_gold_blush	{"Quadro Mini Evergold Gold Blush"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt in Rosa mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look.\nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Goldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
127	ch_w_daniel_wellington_8824462278980_elan_lumine_unitone_gold	{"Elan Lumine Unitone Gold"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband und kleinen Kristallen auf goldenem Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
128	ch_w_daniel_wellington_8506412400964_iconic_chronograph_link_onyx_g	{"Iconic Chronograph Link Onyx G"}	Der Iconic Chronograph Link wird dich oft auf dein Handgelenk schauen lassen, und zwar nicht nur, um die Zeit zu überprüfen. Erstens das Design: Der klassische Chronographen-Look trifft auf modernen Geschmack beim schwarzen Zifferblatt mit Sonnenschliff, das von einem luxuriösen Goldarmband eingerahmt wird. Und dann sind da noch die drei Hilfszifferblätter, die mehrere Stoppuhr-Funktionen bieten und für makellose Präzision sorgen. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das Armband kann in Sekundenschnelle ohne Werkzeug ausgetauscht werden. So kannst du es mit anderen Armbändern und Stilen kombinieren, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
129	ch_w_daniel_wellington_8133612536115_quadro_pressed_melrose_emerald	{"Quadro Pressed Melrose Emerald"}	Die Quadro Melrose ist eine wunderschöne und einzigartige quadratische Damenuhr in roségold mit grünem Zifferblatt, die jedes Outfit aufwerten kann. Die polierte Edelstahlkonstruktion und die Roségoldbeschichtung verleihen ihr ein luxuriöses Aussehen, während das bequeme Mesh-Armband dafür sorgt, dass Sie sie den ganzen Tag über tragen können, ohne sich unwohl zu fühlen. <br> Diese rechteckige roségold Damenuhr ist perfekt geeignet, um jedem Outfit einen Hauch von Luxus zu verleihen. Egal, ob Sie sich schick oder unschick anziehen, diese Uhr mit grünem Zifferblatt wird Ihren Look auf jeden Fall aufwerten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
130	ch_w_daniel_wellington_8133612142899_quadro_pressed_ashfield	{"Quadro Pressed Ashfield"}	Die Quadro Pressed Ashfield macht uns neugierig. Sie fordert uns heraus, Grenzen zu testen und auszuloten, wie weit wir für Schönheit und originelles Design gehen. Diese kleine Damenuhr ist mit ihrem Mesh-Armband und dem tiefschwarzen Zifferblatt fast zu 100 % schwarz und unglaublich ausdrucksstark. Die goldenen Details dieser quadratischen Uhr glänzen geschmackvoll vor dem monochromen Hintergrund von Zifferblatt und Armband. Nimm die Einladung zur Neugier an und hole dir die Quadro Pressed Ashfield. Oder entdecke andere schwarze Uhren aus unserer Kollektion.<br><br>Quadratische Uhr mit schwarzem Mesh-Armband, schwarzem Zifferblatt und goldenen Details. Kleine Damenuhr. <a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow">Schwarze Uhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
131	ch_w_daniel_wellington_8824462475588_bound_crocodile_emerald_sunray_rose_gold	{"Bound Crocodile Emerald Sunray Rose Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Gold passt exakt zur Breite des smaragdgrünen Lederarmbands mit Krokoprägung — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
132	ch_w_daniel_wellington_8133599330611_classic_cambridge	{"Classic Cambridge"}	Inspiriert von der klaren Farbgebung klassischer Flaggengestaltung zelebriert dieses rot-weiß-blau gestreifte Natoband an dieser klassischen Herrenuhr in Roségold den American Way of Fashion. Gepaart mit der schlichten Eleganz des extrem flachen Ziffernblatts macht es diese Uhr im Job und auch danach zum stets passenden Accessoire. Mit nur 6 mm ist diese ultraflache Daniel Wellington Roségold Uhr mit rot weiß blauem Band der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser Daniel Wellington Roségold Herrenuhr machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
134	ch_w_daniel_wellington_8507983429956_quadro_mini_melrose_rose_gold_emerald	{"Quadro Mini Melrose Rose Gold Emerald"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr hat ein kompaktes Quadro-Zifferblatt in Smaragd mit einem raffinierten Sonnenschliff und zwei Indexen für einen minimalistischen Look.\nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Roségoldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
135	ch_w_daniel_wellington_8133606310195_iconic_link_automatic	{"Iconic Link Automatic"}	Die Iconic Link Automatic Herrenuhr ist unsere bisher hochentwickeltste Uhr. Ausgestattet mit einem Automatikwerk, das durch die Bewegung deines Handgelenks angetrieben wird. Das Leuchtzifferblatt der Silber Automatikuhr hat im Dunkeln leuchtende Angaben und Zeiger, eine vergrößerte Datumsanzeige und ist bis auf 100 Meter wasserdicht. Die Silber Automatikuhr für Herren ist mit kratzfestem Saphirglas an der Vorder- und Rückseite ausgestattet und das Automatikwerk im Inneren ist sichtbar.  Eine Uhr, die dich in allen Situationen begleitet. Egal, ob du in der Stadt unterwegs bist oder die freie Natur erkundest, dieser vielseitige Zeitmesser wird dir ein zuverlässiger Begleiter sein. Dank des flachen Gehäuses lässt sich die Silber Automatikuhr den ganzen Tag lang bequem tragen, während das minimalistische Design dafür sorgt, dass sie jedes Outfit ergänzt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
136	ch_w_daniel_wellington_8623173730628_quadro_lumine_bezel_5-link_melrose	{"Quadro Lumine Bezel 5-Link Melrose"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
137	ch_w_daniel_wellington_8824462803268_bound_9-link_emerald_sunray	{"Bound 9-Link Emerald Sunray"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Roségold passt exakt zur Breite des 9-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt in Smaragdgrün.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
138	ch_w_daniel_wellington_8623173960004_quadro_lumine_bezel_melrose_pink_mop	{"Quadro Lumine Bezel Melrose Pink MOP"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
139	ch_w_daniel_wellington_8134511886643_quadro_lumine_5-link_melrose	{"Quadro Lumine 5-Link Melrose"}	Die Quadro Lumine 5-Link Melrose strahlt aus jedem Blickwinkel. Das vergoldete Armband strahlt mit jedem Glied um die Wette, während das aus Perlmutt gefertigte Zifferblatt dem Schmuckstück seinen eigenen, raffinierten Glanz verleiht. Nicht zu vergessen sind die hochwertigen Kristalle, die die Indexe markieren. Die kleinen, aber bemerkenswert brillanten Steine vervollständigen diesen besonderen Zeitmesser, der dein Outfit oder sogar deinen Tag verschönern kann.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
140	ch_w_daniel_wellington_8133611684147_quadro_lumine_pressed_evergold	{"Quadro Lumine Pressed Evergold"}	Die Quadro Lumine Pressed Mesh ist definitiv eine faszinierende Uhr. Der quadratische Uhrenkopf ist mit schimmernden kristallbesetzten Zeigern versehen, die in einer runden Anzeige angeordnet sind. Gleichzeitig bildet das stoffähnliche Armband einen zarten Kontrast zum weißen, leuchtenden Uhrenkopf. Zusammen bilden sie eine vielseitige und einzigartige Uhr, die in drei leuchtenden Farben erhältlich ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
141	ch_w_daniel_wellington_8133611716915_quadro_lumine_pressed_melrose	{"Quadro Lumine Pressed Melrose"}	Die Quadro Lumine Pressed Mesh ist definitiv eine faszinierende Uhr. Der quadratische Uhrenkopf ist mit schimmernden kristallbesetzten Zeigern versehen, die in einer runden Anzeige angeordnet sind. Gleichzeitig bildet das stoffähnliche Armband einen zarten Kontrast zum weißen, leuchtenden Uhrenkopf. Zusammen bilden sie eine vielseitige und einzigartige Uhr, die in drei leuchtenden Farben erhältlich ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
142	ch_w_daniel_wellington_8133610275123_petite_sheffield	{"Petite Sheffield"}	<h3>EINE SCHÖNHEIT IN SCHWARZ</h3>Die Petite mit dem schwarzen Zifferblatt in Rotgold oder Silber passt perfekt zum verführerischen Leder des Sheffield-Armbands. Ein echter Hingucker, der nie unbemerkt bleiben wird.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
143	ch_w_daniel_wellington_8824483905860_quadro_mini_melrose	{"Quadro Mini Melrose"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini in der klassischen Version hat ein austauschbares Mesh-Armband in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
144	ch_w_daniel_wellington_8134511493427_petite_lumine_5-link_melrose	{"Petite Lumine 5-Link Melrose"}	Die Petite Lumine 5-Link Melrose hat einen königlichen Namen und das aus gutem Grund. Betrachte zunächst ihre Qualitäten: Diese Uhr ist aus vergoldetem 316L-Edelstahl gefertigt und hat ein Zifferblatt aus Perlmutt, das jede Uhr einzigartig macht. Außerdem ist sie mit hochwertigen Kristallen verziert. Zweitens unterstreicht das 5-gliedrige Armband das juwelenartige Aussehen des Schmuckstücks. Kurzum, sie ist die perfekte Wahl, wenn du deine Outfits sofort aufwerten möchten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
145	ch_w_daniel_wellington_8133606768947_iconic_link_emerald	{"Iconic Link Emerald"}	Die Iconic Link Emerald besticht durch ein glänzendes smaragdgrünes Zifferblatt. Es gibt sie in poliertem Edelstahl mit lebhaftem Silberfinish oder raffinierter Roségoldbeschichtung. Eine Uhr, die Ihrer Kollektion einen Hauch von Farbe verleiht und durch ihr auffälliges Design Aufmerksamkeit erregt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
146	ch_w_daniel_wellington_8134510182707_classic_mesh_onyx	{"Classic Mesh Onyx"}	Modern oder klassisch? Diese Uhr vereint das Beste aus beiden Welten. Das minimalistische, ultradünne Zifferblatt mit unseren charakteristischen zwölf Indizes wird durch das Mesh-Armband in zeitlosem Gold perfekt unterstützt und betont. Das Sonnenschliff-Finish des Ziffernblatts sorgt für eine weitere Ebene der mühelosen Raffinesse. Dieser Zeitmesser hat auch ein austauschbares Armband, sodass du ihn sportlich machen kannst, indem du ihn mit einem NATO-Armband kombinierst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
172	ch_w_daniel_wellington_8133613388083_quadro_studio	{"Quadro Studio"}	<p>The Quadro Studio features a delicate and petite, glossy emerald green dial, complemented by the sleek Piano strap. Crafted with polished stainless steel and available in a refined rose gold plating. A retro statement with timeless appeal.</p>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
5618	li_w_hublot_414.ci.1123.rx_big_bang_meca-10_black_magic_45_mm	Big Bang Meca-10 Black Magic 45 mm	Entdecken Sie die Uhr Big Bang MECA-10 Black Magic in 45 mm mit Armband aus Kautschuk. Schwarz 45mm Keramik	NULL	1	NULL	16	127	2024-06-21	2024-06-21	t
147	ch_w_daniel_wellington_8134510412083_classic_st_mawes_amber	{"Classic St Mawes Amber"}	Dank der Classic St Mawes Amber können wir jetzt den Reichtum und die Vielseitigkeit von Braun- und Bernsteintönen voll ausschöpfen. Die Sonnenschliffoptik des Zifferblatts verleiht ihr einen satinierten Look, der das Licht reflektiert und eine ansonsten minimalistische Uhr interessant macht. Das italienische Lederarmband verschmilzt fast mit dem Zifferblatt und macht den Zeitmesser zu einer runden Sache. Das Uhrenarmband lässt sich leicht abnehmen, damit du andere Armbänder und Stile ausprobieren kannst. Wir ermutigen dich zum Experimentieren!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
148	ch_w_daniel_wellington_8133609292083_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano in Weiß ist der Beweis, dass Natur der ultimative Luxus sein kann. Jedes Zifferblatt ist sorgfältig aus Perlmutt gefertigt und hat ein einzigartiges Muster. Glitzernde Kristalle heben die Zeiger hervor und verleihen dem Zifferblatt einen sanften Glanz. Zur Uhr gehört unser neues Studio-Gliederarmband aus glänzendem Metall, dessen wolkenähnliches, erhabenes Muster das Perlmutt widerspiegelt. Wähle aus den drei verfügbaren Farben deinen Favoriten und genieße eine Uhr wie keine andere.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
149	ch_w_daniel_wellington_8823882383684_quadro_roman_numerals_melrose	{"Quadro Roman Numerals Melrose"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
150	ch_w_daniel_wellington_8133612405043_quadro_pressed_melrose	{"Quadro Pressed Melrose"}	Mit ihrem polierten Edelstahlgehäuse in Roségold und dem eleganten, rechteckigen schwarzen Zifferblatt ist die Quadro Uhr perfekt, um Ihren Look aufzuwerten. Egal, ob Sie sich schick anziehen oder nicht, diese vielseitige Damenuhr wird immer gut aussehen. Und mit ihrem bequemen Mesh-Armband werden Sie sie nie mehr ablegen wollen! Die Quadro in Roségold mit schwarzem Zifferblatt ist die perfekte Damenuhr, um Ihren Look zu unterstreichen. Sie ist aus poliertem Edelstahl gefertigt und hat ein bequemes Armband aus Mesh. Das rechteckige Zifferblatt ist gut ablesbar, und die Roségoldbeschichtung verleiht ihr einen Hauch von Luxus.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
151	ch_w_daniel_wellington_8133609783603_petite_pressed_sterling	{"Petite Pressed Sterling"}	Die Petite Pressed Sterling ist unsere bisher filigranste Uhr. Diese Damenuhr, die entworfen wurde, um jeden Tag getragen zu werden, spiegelt die Schönheit der kleinen Dinge wider. Sie ist aus poliertem Edelstahl hergestellt und hat ein lebhaftes Silber-Finish. Werte deinen Look mit einer anmutigen Note auf. <br> Das weiße Zifferblatt ist schlicht und einfach gehalten, so dass die Zeit leicht abzulesen ist. Die Petite Pressed Sterling Silber Uhr für Damen ist die perfekte Wahl, egal ob Sie sich für einen besonderen Anlass herausputzen oder Ihrem Alltagslook ein wenig Luxus verleihen möchten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
152	ch_w_daniel_wellington_8133608046899_petite_cornwall	{"Petite Cornwall"}	Die Petite Cornwall steht für die reine Essenz von Einfachheit und Stil. Mit dem ganz in Schwarz gehaltenen NATO-Armband und dem schwarzen Zifferblatt wird diese klare und elegante Uhr zu ihrem alltäglichen und stilvollen Begleiter. <br> Die Petite Cornwall ist die perfekte Uhr für Frauen, die Eleganz und Schlichtheit schätzen. Ihr schwarzes NATO-Armband und ihr schwarzes Zifferblatt sorgen für einen klaren und raffinierten Look, während ihr dünnes 6-mm-Gehäuse aus Roségold den ganzen Tag über für Tragekomfort sorgt. Egal, ob Sie sich schick anziehen oder nicht, diese stilvolle Damenuhr mit schwarzem Uhrenarmband aus Stoff passt zu jedem Outfit.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
153	ch_w_daniel_wellington_8133610242355_petite_sheffield	{"Petite Sheffield"}	Die Petite Sheffield ist das Äquivalent zum "Kleinen Schwarzen". Sie strahlt zeitlose Eleganz und Raffinesse aus. Umrahmt in einem Edelstahlgehäuse ergänzt diese kleine Uhr in Gold und Schwarz jeden Look. Das tiefschwarze Zifferblatt kontrastiert wunderbar mit der glänzenden Goldplattierung und sorgt für einen glamourösen Effekt. Das schwarze Armband aus echtem italienischem Leder unterstreicht die Eleganz dieser kultigen Uhr zusätzlich. Sie passt außerdem zu lässigen Styles.<br><br>Kleine Uhr in Gold und Schwarz für Frauen. Schwarzes Lederarmband und schwarzes Zifferblatt. Schwarze Uhren online kaufen bei Daniel Wellington.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
154	ch_w_daniel_wellington_8133607031091_iconic_link_unitone	{"Iconic Link Unitone"}	Die Iconic Link Unitone ist eine elegante und schicke Uhr in Roségold, die ein Statement setzt. Mit ihrem passenden Metallgliederarmband und roségoldenen Zifferblatt ist diese Damenuhr perfekt für jeden Anlass. Ganz gleich, ob Sie sich für ein besonderes Ereignis herausputzen oder Ihrem Alltagslook einen Hauch von Luxus verleihen möchten, die Iconic Link Unitone Damenuhr mit Gliederarmband ist die perfekte Wahl. Mit ihrem klassischen Design und den luxuriösen Materialien wird die Iconic Link Unitone roségold Uhr zu einem wertvollen Erinnerungsstück. Diese Uhr ist das perfekte Accessoire, um sich schick zu machen oder Ihrem Alltagslook einen Hauch von Luxus zu verleihen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
155	ch_w_daniel_wellington_8824484200772_quadro_mini_lumine_bezel_rose_gold	{"Quadro Mini Lumine Bezel Rose Gold"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini Lumine Bezel hat kleine, glitzernde Kristalle und ein austauschbares Mesh-Armband in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
156	ch_w_daniel_wellington_8133612929331_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Die Quadro Sheffield Damenuhr hat ein quadratisches grünes Zifferblatt und ein Rosévergoldetes Gehäuse. Sie ist aus poliertem Edelstahl gefertigt und wird mit einem bequemen Lederarmband in schwarz geliefert. Dieser stilvolle Zeitmesser ist perfekt, um jeden Look aufzuwerten, egal ob Sie sich schick oder unschick kleiden. Das raffinierte grüne Zifferblatt ist perfekt, um Ihrem Alltagslook einen Hauch von Eleganz zu verleihen. Das komfortable schwarze Lederarmband dieser rechteckigen Damenuhr sorgt für einen bequemen und stilvollen Sitz. Und die polierte Edelstahlkonstruktion sorgt für Langlebigkeit und ein raffiniertes Finish. Egal, ob Sie im Büro oder in der Stadt unterwegs sind, diese Roségoldene Damenuhr wird immer ein Statement setzen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
157	ch_w_daniel_wellington_8133612568883_quadro_pressed_melrose	{"Quadro Pressed Melrose"}	Die Quadro Melrose ist eine wunderschöne und einzigartige quadratische Damenuhr in roségold mit grünem Zifferblatt, die jedes Outfit aufwerten kann. Die polierte Edelstahlkonstruktion und die Roségoldbeschichtung verleihen ihr ein luxuriöses Aussehen, während das bequeme Mesh-Armband dafür sorgt, dass Sie sie den ganzen Tag über tragen können, ohne sich unwohl zu fühlen. <br> Diese rechteckige roségold Damenuhr ist perfekt geeignet, um jedem Outfit einen Hauch von Luxus zu verleihen. Egal, ob Sie sich schick oder unschick anziehen, diese Uhr mit grünem Zifferblatt wird Ihren Look auf jeden Fall aufwerten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
9844	it_w_rolex_m126200-0002_datejust_36	Datejust 36	Scopri l’orologio Datejust 36 in acciaio Oystersteel sul Sito Ufficiale Rolex. Modello: m126200-0002	NULL	1	NULL	13	109	2024-06-21	2024-06-21	t
158	ch_w_daniel_wellington_8133611487539_quadro_coral	{"Quadro Coral"}	Die Quadro Coral hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem NATO-Armband in Nudepink.  Quadratische Uhren sind absolut angesagt. Mit dieser farbenfrohen Uhr setzt du den Trend.  <a href="https://www.danielwellington.comecklaces/?colorText=Rose%20Gold" rel="nofollow"> Kombiniere sie mit einer unserer roségoldenen Halsketten.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
159	ch_w_daniel_wellington_8133600969011_classic_oxford	{"Classic Oxford"}	Diese klassische Herrenuhr für höchste ästhetische Ansprüche wurde mit großer Liebe zum Detail entwickelt. Die klaren Farben des rot-blauen Natobands und das minimalistische Design des Ziffernblatts machen diese roségold Uhr zum perfekten Accessoire.  Mit nur 6 mm ist diese ultraflache Daniel Wellington Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit der rot blauen Daniel Wellington Herrenuhr machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
160	ch_w_daniel_wellington_8133610602803_petite_st_mawes	{"Petite St Mawes"}	Für eine kleine goldene Damenuhr hat die Petite Mawes eine Menge zu sagen. Sie spricht von schlichter Eleganz, Minimalismus und den kleinen Freuden des Lebens. Mit ihrem schwarzen Zifferblatt, das von einem Edelstahlgehäuse mit strahlender Goldbeschichtung umrahmt wird, ist diese Uhr auch eine vielseitige Ergänzung für deinen Kleiderschrank. Das braune Lederarmband passt sowohl zu lässigen als auch zu eleganten Looks. Sie passt auch in dein Budget, denn sie ist eine der günstigsten Luxusuhren für Frauen. <br><br>Goldene Damenuhr mit schwarzem Zifferblatt und braunem Lederarmband. <a href="https://www.danielwellington.com/womens-watches/">Luxusuhren für Frauen online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
161	ch_w_daniel_wellington_8133609554227_petite_pressed_ashfield	{"Petite Pressed Ashfield"}	Die Petite Pressed Ashfield ist eine atemberaubende Damenuhr, die sich für jeden Anlass eignet. Mit poliertem Edelstahl und einer Auflage aus edlem Roségold ist diese Uhr schick und elegant. Das schwarze Zifferblatt verleiht der Edelstahl Uhr einen Hauch von Raffinesse, während das bequeme Mesh-Armband dafür sorgt, dass sie zu Ihrer Lieblingsuhr für den Alltag wird. <br> Ganz gleich, ob Sie sich für einen besonderen Anlass herausputzen oder Ihrem Alltagsstil einen eleganten Touch verleihen möchten, die Petite Pressed Ashfield wird mit Sicherheit zu Ihrem neuen Lieblingsaccessoire. Die aus poliertem Edelstahl und Roségold gefertigte Armbanduhr mit schwarzem Zifferblatt ist elegant und raffiniert zugleich.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
162	ch_w_daniel_wellington_8133602017587_classic_somerset	{"Classic Somerset"}	Die Classic Somerset Roségold Herrenuhr mit Lederarmband ist ein wunderschön gestalteter Zeitmesser, der zu jedem Outfit passt. Mit ihrem eierschalenweißen Zifferblatt und dem ultradünnen 6-mm-Gehäuse aus Roségold ist diese Uhr sowohl elegant als auch praktisch. Das marineblaue Lederarmband wurde mit dem Gedanken an Vielseitigkeit entworfen und macht sie zum perfekten Begleiter für jedes Outfit.  Egal, ob Sie sich schick oder leger kleiden, diese dunkelblaue Daniel Wellington Uhr mit Uhrenarmband aus Leder verleiht Ihrem Stil einen Hauch von Eleganz. Wenn Sie auf der Suche nach einer klassischen Herrenuhr sind, die Schönheit und Funktion vereint, ist die Classic Somerset genau das Richtige für Sie.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
163	ch_w_daniel_wellington_8823882219844_petite_roman_numerals_melrose	{"Petite Roman Numerals Melrose"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
164	ch_w_daniel_wellington_8133611946291_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano in Weiß ist eine Uhr, die... Zeit verlangt. Sie will entdeckt und einfach nur bewundert werden. Das einzigartige Perlmuttmuster des Zifferblatts, die ovale Konstellation glitzernder Kristalle, die die Zeiger hervorheben, und das neuen Studio-Uhrenarmband setzen eine Vielzahl fantasievoller Akzente. Diese Uhr ist in drei Farben erhältlich, wobei jede neue Version noch glamouröser ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
165	ch_w_daniel_wellington_8824484036932_quadro_mini_sheffield_rose_gold	{"Quadro Mini Sheffield Rose Gold"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Roségold-Version der Quadro Mini hat ein austauschbares schwarzes Armband aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
166	ch_w_daniel_wellington_8133613355315_quadro_studio	{"Quadro Studio"}	Die Quadro Studio verfügt über ein zierliches, weißes, quadratisches Zifferblatt, ergänzt durch das elegante Piano-Armband. Sie ist aus poliertem Edelstahl gefertigt und in schillerndem Silberfinish erhältlich. Ein Retro-Statement mit zeitlosem Reiz.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
167	ch_w_daniel_wellington_8623173566788_petite_lumine_bezel_melrose_pink_mop	{"Petite Lumine Bezel Melrose Pink MOP"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
168	ch_w_daniel_wellington_8133609488691_petite_melrose_pearl	{"Petite Melrose Pearl"}	Die Petite Pearl hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem eleganten Mesharmband.   <br>  Diese Perlmutt-Uhr ist eine wunderschöne Mischung aus Roségold und rosa schimmernder Perle. Sie ist eine kleine Uhr aus unserer <a href="https://www.danielwellington.com/petite-collection/" rel="nofollow"> Petite Kollektion.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
169	ch_w_daniel_wellington_8162231353651_petite_cherry_blossom	{"Petite Cherry Blossom"}	Hast du jemals versucht, den Frühling zu tragen?! Mit der Petite Cherry Blossom kannst du genau das tun. Dieser kleine, aber spektakuläre Zeitmesser fängt die Schönheit der blühenden Kirschbäume ein. Das aus echtem Perlmutt gefertigte Zifferblatt lässt bei jeder Bewegung des Handgelenks zarte Rosatöne aufblitzen. Das austauschbare Armband aus Nappaleder sorgt dafür, dass sich diese Sonderedition so weich anfühlt, wie sie aussieht.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
170	ch_w_daniel_wellington_8823882318148_petite_roman_numerals_sterling	{"Petite Roman Numerals Sterling"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
12244	it_w_tudor_m91450-0008_1926	1926	['Cassa in acciaio, 36\\xa0mm', 'Quadrante nero']	NULL	1	NULL	8	109	2024-06-21	2024-06-21	t
173	ch_w_daniel_wellington_8133609193779_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano zeigt maximalen Glamour auf kleinstem Raum. Glitzernde Kristalle werfen mit einem einzigartigen, von der Natur selbst entworfenen Muster Licht auf das schillernde schwarze Zifferblatt. Das neue, in drei luxuriösen Farben erhältliche Studio-Armband aus Mesh passt in Stil und Komplexität zu den anderen Elementen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
174	ch_w_daniel_wellington_8133609259315_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano in Weiß ist der Beweis, dass Natur der ultimative Luxus sein kann. Jedes Zifferblatt ist sorgfältig aus Perlmutt gefertigt und hat ein einzigartiges Muster. Glitzernde Kristalle heben die Zeiger hervor und verleihen dem Zifferblatt einen sanften Glanz. Zur Uhr gehört unser neues Studio-Gliederarmband aus glänzendem Metall, dessen wolkenähnliches, erhabenes Muster das Perlmutt widerspiegelt. Wähle aus den drei verfügbaren Farben deinen Favoriten und genieße eine Uhr wie keine andere.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
175	ch_w_daniel_wellington_8540071756100_quadro_pressed_sheffield_w_29x36,5	{"Quadro Pressed Sheffield W 29x36,5"}	Beeindrucken Sie mit der Quadro - unserer quadratischen Damenuhr mit elegantem Lederarmband in schwarz. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Ausführung erhältlich. Mit ihrem eleganten rechteckigen Zifferblatt in weiß und dem bequemen Mesh-Armband ist die Quadro perfekt, um Ihren Look aufzuwerten.  Egal ob Sie sich schick anziehen oder nicht, diese vielseitige Roségold Damenuhr mit Lederarmband macht immer eine gute Figur. Das rechteckige Zifferblatt in Weiß wird von einem Roségoldenen Gehäuse eingerahmt und verleiht der rechteckigen Uhr eine schlichte Eleganz. Das schwarze Lederarmband verleiht ihr einen Hauch von Raffinesse und rundet den Look ab. Egal, ob Sie ins Büro oder zum Abendessen gehen, mit der Quadro setzen Sie ein Zeichen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
176	ch_w_daniel_wellington_8823882416452_quadro_roman_numerals_sheffield_rose_gold	{"Quadro Roman Numerals Sheffield Rose Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr in Roségold die perfekte Symbiose aus retro und trendy. Mit austauschbarem Armband in Schwarz aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
177	ch_w_daniel_wellington_8133601558835_classic_roselyn	{"Classic Roselyn"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold oder Silber und unserem traditionellen NATO Armband in Rubinrot, ist Classic Roselyn ein schlichter Begleiter für tagsüber und abends.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
178	ch_w_daniel_wellington_8133608636723_petite_durham	{"Petite Durham"}	Geschätzt für ihren Vintage-Look verfügt das Durham-Armband über eine einzigartige Patina, dessen Leder durch das Tragen erst richtig zum Leuchten kommt. Das schwarze Zifferblatt passt perfekt zum hellbraunen Armband dieser minimalistischen Petite Uhr. <br> Diese im Vintage-Stil gehaltene Damenuhr ist das perfekte Accessoire für jedes Outfit. Das schwarze Zifferblatt und das silberne Gehäuse werden durch ein hellbraunes Lederarmband akzentuiert, was ihr einen einzigartigen und stilvollen Look verleiht. Das flache 6-mm-Gehäuse ist den ganzen Tag über bequem zu tragen und macht diese Uhr zur perfekten Wahl für jede Frau. Die Petite Durham in silber mit schwarzem Zifferblatt ist das perfekte Accessoire für jedes Outfit und wird sicher zu Ihrer neuen Lieblingsuhr.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
179	ch_w_daniel_wellington_8133609161011_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano zeigt maximalen Glamour auf kleinstem Raum. Glitzernde Kristalle werfen mit einem einzigartigen, von der Natur selbst entworfenen Muster Licht auf das schillernde schwarze Zifferblatt. Das neue, in drei luxuriösen Farben erhältliche Studio-Armband aus Mesh passt in Stil und Komplexität zu den anderen Elementen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
180	ch_w_daniel_wellington_8133609128243_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano zeigt maximalen Glamour auf kleinstem Raum. Glitzernde Kristalle werfen mit einem einzigartigen, von der Natur selbst entworfenen Muster Licht auf das schillernde schwarze Zifferblatt. Das neue, in drei luxuriösen Farben erhältliche Studio-Armband aus Mesh passt in Stil und Komplexität zu den anderen Elementen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
181	ch_w_daniel_wellington_8133609619763_petite_pressed_melrose	{"Petite Pressed Melrose"}	Die Petite Pressed Melrose in roségold ist eine zarte und schöne Damenuhr, die sich für jeden Anlass eignet. Das roségoldene Finish und das schwarze Zifferblatt verleihen ihr einen Hauch von Eleganz, während das Mesh-Armband einen Hauch von Spaß und Flair verleiht. Diese Uhr wird sicher zu Ihrem neuen Lieblingsaccessoire! <br> Die Petite Pressed Melrose ist die perfekte Alltagsuhr. Mit ihrem raffinierten Roségold-Overlay und dem schwarzen Zifferblatt ist diese Damenuhr zart und schön zugleich. Das Mesh-Armband in roségold verleiht Ihrem Look einen Hauch von Anmut.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
182	ch_w_daniel_wellington_8133611815219_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano ist eine fesselnde Uhr aus kostbaren Materialien, die entspannte Raffinesse ausstrahlen. Das Zifferblatt ist aus Perlmutt gefertigt, so dass jedes Stück ein von der Natur geschaffenes Unikat ist. Die Zeiger sind mit glitzernden Kristallen besetzt, die dem minimalistischen Design einen Hauch von Luxus verleihen. Um das Bild zu vervollständigen, darf natürlich das elegante Studio-Uhrenarmband nicht fehlen. Wähle aus drei verfügbaren Farben deinen Favoriten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
183	ch_w_daniel_wellington_8133612634419_quadro_pressed_rouge	{"Quadro Pressed Rouge"}	Die Quadro Rouge hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem gepressten Lederarmband mit Krokoprägung in Nudepink.    Eine kleine, quadratische Uhr mit einzigartigem Perlmutt-Zifferblatt. Zusammen mit dem Lederarmband in Nudepink wertet sie jedes Outfit auf. Finde weitere quadratische Uhren in unserer <a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow">Quadro Kollektion.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
184	ch_w_daniel_wellington_8133613125939_quadro_pressed_unitone	{"Quadro Pressed Unitone"}	Die Quadro Unitone verfügt über ein nahtlos zum rechteckigen Ziffernblatt passendes Mesh-Armband in Roségold. Die Damenuhr ist aus poliertem Edelstahl gefertigt und setzt einen zarten Akzent. Ein zeitloses Stück, das bei jeder Gelegenheit den Ton angibt. <br> Mit ihrem Mesh-Armband und dem rechteckigen Zifferblatt in Roségold ist diese Armbanduhr für Damen elegant und zeitlos. Das polierte Edelstahlgehäuse setzt einen zarten Akzent und ist perfekt für jede Gelegenheit. Egal, ob Sie sich schick anziehen oder nicht, diese roségold Damenuhr sieht immer gut aus!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
9984	it_w_rolex_m126300-0005_datejust_41	Datejust 41	Scopri l’orologio Datejust 41 in acciaio Oystersteel sul Sito Ufficiale Rolex. Modello: m126300-0005	NULL	1	NULL	13	109	2024-06-21	2024-06-21	t
185	ch_w_daniel_wellington_8133610701107_petite_st_mawes	{"Petite St Mawes"}	Die Petite Damenuhr mit dem schwarzen Zifferblatt und dem St. Mawes-Armband ist eine verführerische und attraktive Kombination. Das dünne 6-mm-Gehäuse in Silber ist elegant und schlank, während das braune Armband aus echtem italienischem Leder für einen Hauch von Luxus sorgt. St. Mawes ist eines unserer begehrtesten Armbänder. <br> Diese Petite St. Mawes Damenuhr ist das perfekte Accessoire für jeden formellen oder legeren Anlass. Mit ihrem schwarzen Zifferblatt und dem schönen St. Mawes-Armband aus Leder zieht diese Uhr alle Blicke auf sich. Egal, ob Sie zur Arbeit gehen oder in der Stadt unterwegs sind, diese Daniel Wellington Uhr ist die perfekte Ergänzung für Ihre Garderobe.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
186	ch_w_daniel_wellington_8133613257011_quadro_studio	{"Quadro Studio"}	Die Quadro Studio verfügt über ein zierliches, schwarzes, quadratisches Zifferblatt, ergänzt durch das elegante Piano-Armband. Sie ist aus poliertem Edelstahl gefertigt und in schillerndem Silberfinish erhältlich. Ein Retro-Statement mit zeitlosem Reiz.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
187	ch_w_daniel_wellington_8133612863795_quadro_pressed_sheffield_emerald	{"Quadro Pressed Sheffield Emerald"}	Die Quadro Sheffield Damenuhr hat ein quadratisches grünes Zifferblatt und ein Rosévergoldetes Gehäuse. Sie ist aus poliertem Edelstahl gefertigt und wird mit einem bequemen Lederarmband in schwarz geliefert. Dieser stilvolle Zeitmesser ist perfekt, um jeden Look aufzuwerten, egal ob Sie sich schick oder unschick kleiden. Das raffinierte grüne Zifferblatt ist perfekt, um Ihrem Alltagslook einen Hauch von Eleganz zu verleihen. Das komfortable schwarze Lederarmband dieser rechteckigen Damenuhr sorgt für einen bequemen und stilvollen Sitz. Und die polierte Edelstahlkonstruktion sorgt für Langlebigkeit und ein raffiniertes Finish. Egal, ob Sie im Büro oder in der Stadt unterwegs sind, diese Roségoldene Damenuhr wird immer ein Statement setzen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
188	ch_w_daniel_wellington_8133613191475_quadro_studio	{"Quadro Studio"}	Die Quadro Studio verfügt über ein zierliches, schwarzes, quadratisches Zifferblatt, ergänzt durch das elegante Piano-Armband. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Beschichtung erhältlich. Ein Retro-Statement mit zeitlosem Reiz.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
189	ch_w_daniel_wellington_8133613289779_quadro_studio	{"Quadro Studio"}	Die Quadro Studio verfügt über ein zierliches, weißes, quadratisches Zifferblatt, ergänzt durch das elegante Piano-Armband. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Beschichtung erhältlich. Ein Retro-Statement mit zeitlosem Reiz.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
190	ch_w_daniel_wellington_8133613453619_quadro_studio	{"Quadro Studio"}	<p>The Quadro Studio features a delicate and petite, glossy emerald green dial, complemented by the sleek Piano strap. Crafted with polished stainless steel and available in a refined rose gold plating. A retro statement with timeless appeal.</p>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
191	ch_w_daniel_wellington_8134511460659_petite_lumine_5-link_melrose	{"Petite Lumine 5-Link Melrose"}	Alle Edelsteine der Natur in einer Uhr? Das ist die Petite Lumine Melrose. Dieses kleine Wunderwerk ist aus rostfreiem Stahl gefertigt und mit hochkonzentriertem Gold beschichtet. Das Zifferblatt selbst ist einzigartig, denn es ist aus Perlmutt gefertigt. Anstelle der üblichen Indexe sind die Stunden mit hochwertig schimmernden Kristallen markiert. Als i-Tüpfelchen gibt es ein 5-gliedriges Armband, das wie ein Juwel aussieht und sich anfühlt, und schon hast du die perfekte Uhr!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
192	ch_w_daniel_wellington_8134511853875_quadro_lumine_5-link_melrose	{"Quadro Lumine 5-Link Melrose"}	Trendsetter, die Quadro Lumine 5-Link Melrose ist die Uhr für dich. Von Schmuck inspirierte Uhren sind in Mode, und dieses Stück ist ein leuchtendes Beispiel dafür. Das 5-gliedrige, rosévergoldete Armband sieht aus und fühlt sich an wie ein Designerarmband, während die schimmernden Kristalle der Uhr eine raffinierte Ausstrahlung verleihen. Das Perlmutt-Zifferblatt macht sie mit seinem einzigartigen, von der Natur geschaffenen Muster noch besonderer. Eine modische Uhr, die nie alt wird.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
193	ch_w_daniel_wellington_8162231517491_quadro_cherry_blossom	{"Quadro Cherry Blossom"}	Kirschblüten sind immer schön, auch wenn sie viereckig sind. Die Quadro Cherry Blossom kombiniert die Schönheit von Pastelltönen mit dem raffinierten Schimmer von echtem Perlmutt. In einem Gehäuse aus rosévergoldetem Edelstahl bringt diese monochrome Uhr Farbe mit feinen Details und klaren Designlinien in Einklang. Trage sie im Frühling oder wann immer dein Outfit aufblühen soll.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
194	ch_w_daniel_wellington_8162231419187_quadro_lavender_mop	{"Quadro Lavender MOP"}	Die Laufstege können nicht genug von Lavendel bekommen, und wir auch nicht. Die Quadro Lavender bringt deine Outfits zum Strahlen, ohne die Funktionalität zu beeinträchtigen, die du von einer Qualitätsuhr erwartest. Das Zifferblatt ist aus echtem Perlmutt gefertigt und das eckige Gehäuse aus Roségold verleiht dieser Sonderedition den kultigen Daniel Wellington-Look. Das Lederarmband lässt sich leicht wechseln, sodass du mit mehreren Styles spielen kannst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
195	ch_w_daniel_wellington_8506412335428_iconic_chronograph_link_graphite_gm	{"Iconic Chronograph Link Graphite GM"}	Der Iconic Chronograph Link wird dich oft auf dein Handgelenk schauen lassen, und zwar nicht nur, um die Zeit zu überprüfen. Erstens das Design: Der klassische Chronographen-Look trifft auf einen ultramodernen Geschmack in monochromem Grau mit einem eleganten Sonnenschliff-Finish. Und dann sind da noch die drei Hilfszifferblätter, die mehrere Stoppuhr-Funktionen bieten und für makellose Präzision sorgen. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das Armband kann in Sekundenschnelle ohne Werkzeug ausgetauscht werden. So kannst du es mit anderen Armbändern und Stilen kombinieren, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
196	ch_w_daniel_wellington_8540071035204_quadro_pressed_ashfield_b_29x36,5	{"Quadro Pressed Ashfield B 29x36,5"}	Die Quadro Ashfield in Roségold mit schwarzem Mesh-Armband ist eine stilvolle und vielseitige rechteckige Damenuhr, die jedes Outfit aufwertet. Mit poliertem Edelstahl und einem eleganten, quadratischen schwarzen Zifferblatt ist diese Uhr perfekt für die moderne Frau.  <br> Die Quadro ist unsere erste Uhr mit einem eckigen Zifferblatt und eignet sich perfekt, um jedem Outfit einen Hauch von Raffinesse zu verleihen. Mit ihrem polierten Edelstahlgehäuse in Roségold und dem schlichten schwarzen Zifferblatt ist diese vielseitige Damenuhr immer im Trend. Und dank des bequemen Mesh-Armbands werden Sie diese rechteckige Damenuhr nie mehr ablegen wollen. Es rundet den Look ab und sorgt für hohen Tragekomfort den ganzen Tag über.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
209	ch_w_daniel_wellington_8623173697860_quadro_lumine_bezel_5-link_arctic_s	{"Quadro Lumine Bezel 5-Link Arctic S"}	Die Quadro ist an sich schon cool, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version vorstellen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
197	ch_w_daniel_wellington_8133610438963_petite_sheffield	{"Petite Sheffield"}	Die Petite mit eierschalweißem Zifferblatt und einem klassischen schwarzen Sheffield-Lederarmband passt zu jedem Anlass. Eine echte Design-Ikone. <br> Mit ihrem schlichten, eierschalenweißen Zifferblatt und dem stilvollen schwarzen Lederarmband ist diese kleine Damenuhr sowohl elegant als auch unaufdringlich. Mit ihrem 6 mm dünnen Gehäuse in Silber ist sie zudem ultraleicht und angenehm zu tragen. Egal, ob Sie an einer formellen Veranstaltung teilnehmen oder nur Besorgungen machen, diese Uhr sieht immer schick und raffiniert aus. Dank dem ultraschlanken und leichten Gehäuse ist sie den ganzen Tag über bequem zu tragen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
198	ch_w_daniel_wellington_8133610307891_petite_sheffield	{"Petite Sheffield"}	Diese elegante Petite Sheffield Damenuhr ist perfekt für jeden formellen oder legeren Anlass. Mit ihrem schwarzen Lederarmband und dem silbernen Gehäuse ist diese Uhr sowohl stilvoll als auch funktionell. Mit ihrem schwarzen Zifferblatt mit silbernen Akzenten passt sie zu jedem Outfit. Und dank des ultradünnen 6-mm-Designs lässt sie sich den ganzen Tag lang bequem tragen. Ob Sie eine Hochzeit besuchen oder Tennis spielen, diese Daniel Wellington Uhr ist das perfekte Accessoire. <br> Diese kleine Uhr ist perfekt für die moderne Frau, die sich einen Hauch von Eleganz und Raffinesse in ihrem Leben wünscht. Diese Uhr zieht alle Blicke auf sich, egal wohin Sie gehen, und mit ihrem bequemen Lederarmband werden Sie sie gar nicht mehr ablegen wollen!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
199	ch_w_daniel_wellington_8540071690564_quadro_pressed_sheffield_b_29x36,5	{"Quadro Pressed Sheffield B 29x36,5"}	Die Quadro ist unsere erste Uhr mit einem quadratischen Zifferblatt. Sie ist aus poliertem Edelstahl gefertigt und in einer raffinierten Roségold-Beschichtung erhältlich. Die Quadro ist die perfekte Damenuhr, um Ihren Look auf das nächste Level zu bringen. Diese rechteckige Damenuhr ist der Traum einer jeden Minimalistin und eignet sich perfekt, um ein subtiles Statement abzugeben. Mit ihrem polierten Edelstahlgehäuse und dem schlanken, quadratischen schwarzen Zifferblatt macht diese schwarze Damenuhr immer eine gute Figur. Diese rechteckige Damenuhr wird immer auffallen, egal wie Sie gekleidet sind und mit ihrem bequemen Lederarmband werden Sie sie nie mehr ablegen wollen!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
200	ch_w_daniel_wellington_8133610668339_petite_st_mawes	{"Petite St Mawes"}	<h3>ENTSPANNTE ELEGANZ</h3>Die Petite mit dem schwarzen Zifferblatt und dem St. Mawes-Armband ist eine verführerische und attraktive Kombination. St. Mawes ist eines unserer begehrtesten Armbänder und besteht aus echtem italienischem Leder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
201	ch_w_daniel_wellington_8133610799411_petite_st_mawes	{"Petite St Mawes"}	 DIE SCHÖNHEIT DER EINFACHHEIT Das weiße Zifferblatt der Petite ist mit seiner minimalistischen Schönheit und dem Glanz des zeitlosen St. Mawes-Armbands einzigartig. St. Mawes ist eines unserer begehrtesten Armbänder und besteht aus echtem italienischem Leder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
202	ch_w_daniel_wellington_8133611389235_petite_york	{"Petite York"}	<h3>EXQUISITES DESIGN</h3>Mit ihrem dunkelbraunen York-Armband aus italienischem Leder mit Krokodil-Prägung und einem geschmackvollen, eierschalenweißen Zifferblatt ist dies eine Uhr, die die Zeiten überdauern wird.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
203	ch_w_daniel_wellington_8133611127091_petite_suffolk	{"Petite Suffolk"}	Featuring a rustic red strap made from genuine leather, Classic Suffolk is the ultimate staple and is sure to catch the eyes of everyone you meet. With a slim design, an egg-shell white dial and details in rose gold or stainless steel, this sophisticated	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
204	ch_w_daniel_wellington_8133611356467_petite_york	{"Petite York"}	Diese kleine Damenuhr in roségold ist das perfekte Accessoire für eine anspruchsvolle Frau. Mit ihrem dunkelbraunen, krokodilgeprägten italienischen Lederarmband und dem elfenbeinfarbenen, weißen Zifferblatt zieht diese Uhr alle Blicke auf sich. Das dünne 6-mm-Gehäuse aus Roségold macht sie zu einer perfekten Ergänzung für jedes Outfit, egal ob Sie an einer formellen Veranstaltung teilnehmen oder Tennis spielen. <br> Die Petite York Damenuhr in Weiß und Roségold ist mit ihrem eleganten Design und zeitlosen Stil perfekt für jede formelle Veranstaltung oder jeden besonderen Anlass. Halten Sie die Zeit mit Präzision und Raffinesse mit Daniel Wellington.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
205	ch_w_daniel_wellington_8162231320883_petite_bluebell	{"Petite Bluebell"}	Der Frühling hat viele Leckerbissen zu bieten, aber die Sonderausgabe Petite Bluebell ist der schönste. Dieser zarte Zeitmesser hat ein echtes Perlmutt-Zifferblatt und goldene Details für einen farbenfrohen Schimmer. Das Lederarmband ist aus hochwertigem italienischem Leder gefertigt und austauschbar, sodass du ganz einfach andere Stile und Kombinationen ausprobieren kannst. Genau wie ihre Namensvetterin bringt die Petite Bluebell Frische in deine Outfits. Also füge sie jetzt deiner Kollektion hinzu.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
206	ch_w_daniel_wellington_8134511821107_quadro_5-link_evergold	{"Quadro 5-Link Evergold"}	Du bist noch unschlüssig, ob du dich für einen minimalistischen oder einen anspruchsvolleren Stil entscheiden sollst? Habe beides mit dem neuen Quadro Evergold mit einem 5-gliedrigen Armband. Diese schlichte Uhr hat das minimalistische DW-Design, das du liebst, und einen Hauch von Luxus dank des vergoldeten Wechselarmbands. Das matte, eierschalenweiße Zifferblatt und das goldene Armband ergänzen sich gegenseitig zu einem vielseitigen Zeitmesser, der bei jeder Gelegenheit auffällt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
207	ch_w_daniel_wellington_8162231484723_quadro_bluebell	{"Quadro Bluebell"}	Heiße den Frühling auch in deiner Garderobe willkommen – mit der Sonderedition Quadro Bluebell. Dieser zarte Zeitmesser wird deinen Stil dank des farbenfrohen Schimmers, den das Perlmutt-Zifferblatt erzeugt, auffrischen. Die raffinierten Markierungen und die Lünette in Roségold ergänzen das Pastellblau und sorgen für zusätzlichen Glanz. Das Uhrenarmband ist unglaublich weich, da es aus hochwertigem Nappaleder gefertigt ist. Außerdem ist es austauschbar, sodass du auch andere Stile ausprobieren kannst.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
208	ch_w_daniel_wellington_8591970599236_iconic_chronograph_st_mawes_arctic_rg	{"Iconic Chronograph St Mawes Arctic Rg"}	Der Iconic Chronograph St Mawes stattet dich mit fast allem aus, was du für einen erfolgreichen Tag brauchst. Fangen wir mit dem Stil an: Der klassische Chronographen-Look fügt sich nahtlos in unser minimalistisches Zifferblattdesign in Blau mit einem strahlenden Sonnenschliff ein. Mit seinen drei Hilfszifferblättern bietet er außerdem mehrere Stoppuhr-Funktionen und sorgt für makellose Präzision. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das hochwertige Nappalederband kann in Sekundenschnelle und ohne Werkzeug ausgetauscht werden. Du kannst es also entweder gegen Metall- oder Stoffarmbänder austauschen, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
897	au_w_daniel_wellington_8971686347051_quadro_mini_melrose	{"Quadro Mini Melrose"}	<p>The cool corners of Quadro, shrunk down into our smallest watch ever. This Quadro Mini Lumine Bezel features carefully-set crystals and an interchangeable rose gold mesh strap.</p>	NULL	1	NULL	11	14	2024-06-21	2024-06-21	t
210	ch_w_daniel_wellington_8540071133508_quadro_pressed_melrose_w_29x36,5	{"Quadro Pressed Melrose W 29x36,5"}	Die Quadro Melrose ist eine elegante und raffinierte Damenuhr mit einem quadratischen Zifferblatt in Weiß- und Roségold. Dieser vielseitige Zeitmesser aus poliertem Edelstahl ist perfekt, um Ihren Look aufzuwerten. Ganz gleich, ob Sie sich schick oder unschick anziehen, die rechteckige Damenuhr mit Mesh-Armband in Roségold sieht immer gut aus.  Mit der Quadro Melrose behalten Sie die Zeit im Griff! Das rechteckige weiße Zifferblatt ist leicht ablesbar, und das Mesh-Armband ist bequem und stilvoll. Die Quadro Melrose ist eine elegante und anspruchsvolle Damenuhr, gefertigt aus poliertem Edelstahl in Weiß- und Roségold. Mit ihrem vielseitigen quadratischen Ziffernblatt ist diese Damenuhr perfekt für alle Anlässe.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
211	ch_w_daniel_wellington_8507983233348_quadro_mini_evergold_gold_champagne	{"Quadro Mini Evergold Gold Champagne"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr hat ein kompaktes Quadro-Zifferblatt in Champagner mit einem raffinierten Sonnenschliff und zwei Indexen für einen minimalistischen Look. \nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Goldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
212	ch_w_daniel_wellington_8823882580292_quadro_roman_numerals_5-link_gold	{"Quadro Roman Numerals 5-Link Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem 5-Glieder-Armband in Gold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
213	ch_w_daniel_wellington_8674843951428_iconic_nato_green/purple	{"Iconic NATO Green/Purple"}	Unsere NATO-Armbänder: Du kennst sie, du liebst sie – und jetzt sind sie noch besser. Hergestellt aus 100 % recyceltem Nylon und einer neuen Köperwebtechnik, erhältst du den Look unserer ursprünglichen NATO, aber mit einem dickeren, schwereren Griff. Wenn du das mit der Starpower unserer Iconic-Uhren kombinierst, hast du das Rezept für einen echten Glow-up.  \n\n \n\nDetails: \n\nIconic-Uhr in Roségold mit weißem 28-mm-Zifferblatt  \n\nGrünes NATO-Armband mit lila Streifen. Hergestellt aus 100 % recyceltem Nylon mit glänzenderem Garn – für mehr Premium-Qualität auf höchstem Niveau \n\nDas Armband kann mit jedem unserer NATOs ausgetauscht werden (auch mit den Originalen)  \n\nTeil der Iconic-Kollektion	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
214	ch_w_daniel_wellington_8824461852996_classic_multi-eye_st_mawes_arctic_rose_gold	{"Classic Multi-Eye St Mawes Arctic Rose Gold"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Blau, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Lederarmband in Braun und roségoldenen Details.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
215	ch_w_daniel_wellington_8824461951300_classic_multi-eye_sterling_onyx	{"Classic Multi-Eye Sterling Onyx"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Schwarz, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Mesh-Armband in Silber, um den Look zu verändern.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
216	ch_w_daniel_wellington_8824462639428_bound_black_crocodile_silver	{"Bound Black Crocodile Silver"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Silber passt exakt zur Breite des schwarzen Lederarmbands mit Krokoprägung — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
217	ch_w_daniel_wellington_8133599101235_classic_bristol	{"Classic Bristol"}	Mit ihrem luxuriösen schwarzen Ziffernblatt und dem dunkelbraunen Lederarmband erweckt die Classic Bristol roségold Herrenuhr die Vorstellung müheloser Eleganz. Egal mit welchem Stil sie kombiniert wird - diese exquisite Uhr mit Lederarmband ist stets ein Blickfang. Diese klassische Herrenuhr ist perfekt für den anspruchsvollen Gentleman, der sich einen eleganten Zeitmesser wünscht, der nie aus der Mode kommen wird. Das dunkelbraune Lederarmband und das roségoldene Gehäuse sind beide unglaublich stilvoll, und das schwarze Zifferblatt ist schlicht und raffiniert. Egal, ob Sie sich schick anziehen oder nicht, diese elegante Herrenuhr mit Lederarmband ist immer eine gute Wahl.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
218	ch_w_daniel_wellington_8133599985971_classic_durham	{"Classic Durham"}	Mit ihrem eleganten schwarzen Ziffernblatt und dem hellbraunen Armband aus echtem amerikanischem Leder ist die Classic Durham die richtige Wahl für den wahren Connaisseur. Dank der Behandlung mit Pflanzenöl verfügt die Durham über einen einzigartigen Pull-Up-Effekt, wodurch die wunderschöne und höchst individuelle Patina des Armbands zur Geltung kommt. <br> Die Classic Black Durham mit schwarzem Zifferblatt und hellbraunem Armband ist die perfekte Damenuhr für alle, die echten Stil und Qualität zu schätzen wissen. Die silbernen Details dieser Damenuhr mit Lederarmband verleihen ihr einen Hauch von Eleganz, während das schlichte Design sie so vielseitig macht, dass sie jeden Tag getragen werden kann.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
219	ch_w_daniel_wellington_8824483742020_quadro_mini_evergold	{"Quadro Mini Evergold"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini in der klassischen Version hat ein austauschbares Mesh-Armband in Gold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
220	ch_w_daniel_wellington_8133601526067_classic_roselyn	{"Classic Roselyn"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold und unserem traditionellen NATO Armband in Rubinrot, ist die Classic Roselyn Herrenuhr mit Uhrenarmband aus Stoff ein schlichter Begleiter für tagsüber und abends. Diese elegante, raffinierte Natoband Uhr unterstreicht Ihren Stil mit ihrem schlanken Gehäuse, den roségoldenen Details und dem traditionellen rubinroten NATO-Armband aus Stoff. Ganz gleich, ob Sie sich für einen besonderen Anlass herausputzen oder Ihrem Alltagslook einen Hauch von Luxus verleihen möchten, die Classic Roselyn Herrenuhr ist das perfekte Accessoire. Mit ihren klassischen Merkmalen und ihrem modernen Design ist die Classic Roselyn Herrenuhr ein Muss für jede Garderobe.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
221	ch_w_daniel_wellington_8133601624371_classic_roselyn	{"Classic Roselyn"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold und unserem traditionellen NATO Armband in Rubinrot, ist die Classic Roselyn Silber Herrenuhr ein schlichter Begleiter für tagsüber und abends. <br> Ob Sie an einer formellen Veranstaltung teilnehmen oder einen Abend in der Stadt verbringen, mit der Classic Roselyn Natoband Uhr sehen Sie immer gut aus. Die Classic Roselyn ist die perfekte Herrenuhr für einen eleganten Gentleman. Mit ihrem eleganten, schlichten Design und dem vielseitigen roten NATO-Armband lässt sie sich zu jedem Anlass tragen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
12245	it_w_tudor_m91451-0001_1926	1926	['Cassa in acciaio, 36\\xa0mm', 'Lunetta in oro rosa']	NULL	1	NULL	8	109	2024-06-21	2024-06-21	t
222	ch_w_daniel_wellington_8133602115891_classic_southampton	{"Classic Southampton"}	Kreisrundes Ziffernblatt in Elfenbeinweiß, eingefasst in einem ultraflachen Gehäuse, gehalten von einem Natoband in Rosa, Weiß und Blau _x0096_ diese Uhr strahlt Lebensfreude, puristische Eleganz und klassisches Flair gleichermaßen aus. Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club _x0096_ mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
223	ch_w_daniel_wellington_8133602050355_classic_southampton	{"Classic Southampton"}	Diese Damenuhr in Roségold mit ihrem kreisrunden Ziffernblatt in Elfenbeinweiß, eingefasst in einem ultraflachen Gehäuse, gehalten von einem Natoband in Rosa, Weiß und Blau strahlt Lebensfreude, puristische Eleganz und klassisches Flair gleichermaßen aus. Mit nur 6 mm ist diese ultraflache Daniel Wellington Damenuhr mit Uhrenarmband aus Stoff der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit den Natoband Uhren von Daniel Wellington machen Sie überall eine gute Figur. Dank den austauschbaren Armbändern können Sie auch eine der beliebten anderen Farbkombinationen verwenden, um Ihre Uhr zu akzentuieren.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
224	ch_w_daniel_wellington_8133602345267_classic_st_mawes	{"Classic St Mawes"}	Die Classic St Mawes fordert uns heraus zu überdenken, wie eine goldene Uhr für Männer aussehen sollte. Das ultradünne Gehäuse aus Edelstahl mit einer langlebigen Goldbeschichtung fühlt sich luxuriös an und beweist, dass eine goldene Uhr auffällig sein kann, ohne protzig zu sein. Das mattschwarze Zifferblatt gleicht den Goldglanz aus, während das braune Lederarmband mit seiner weichen, organischen Textur den Tragekomfort abrundet. Trage sie jeden Tag und genieße den zeitlosen Reiz eines echten Klassikers.<br><br>Goldene Herrenuhr mit schwarzem Zifferblatt und braunem Lederarmband. Luxuriöse Uhren. <a href="https://www.danielwellington.com/watches/" rel="nofollow">Luxuriöse Uhren zu tollen Preisen online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
225	ch_w_daniel_wellington_8133602967859_classic_warwick	{"Classic Warwick"}	Blau wie der Himmel und das Meer, grün wie die Natur um uns herum Farben, die auch in dieser Uhr eine überaus harmonische Verbindung eingehen. Im Zusammenspiel mit dem klassisch gestalteten Ziffernblatt wurde hier eine Armbanduhr geschaffen, die ihrem Träger nicht nur zu besonderen Anlässen einen eleganten Auftritt garantiert. Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
226	ch_w_daniel_wellington_8133603000627_classic_warwick	{"Classic Warwick"}	Blau wie der Himmel und das Meer, grün wie die Natur um uns herum _x0096_ Farben, die auch in dieser Uhr eine überaus harmonische Verbindung eingehen. Im Zusammenspiel mit dem klassisch gestalteten Ziffernblatt wurde hier eine Armbanduhr geschaffen, die ihrem Träger nicht nur zu besonderen Anlässen einen eleganten Auftritt garantiert. Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club _x0096_ mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
227	ch_w_daniel_wellington_8133602410803_classic_st_mawes	{"Classic St Mawes"}	Mit ihrem edlen braunen Lederarmband und dem eleganten schwarzen Ziffernblatt beweist die Classic St. Mawes Silber Herrenuhr, das technische Perfektion nicht nur eine Vision sein muss, sondern Wirklichkeit ist. Diese anspruchsvolle Herrenuhr ist das perfekte Accessoire für jeden stilvollen Mann. Das klassische silberne Gehäuse und das braune Lederarmband sind sowohl schick als auch praktisch, während das schwarze Zifferblatt einen auffälligen Kontrast bildet, der sicher alle Blicke auf sich zieht. Egal, ob Sie sich für einen besonderen Anlass herausputzen oder einfach nur Ihrem Alltagsstil einen Hauch von Klasse verleihen wollen, diese Uhr mit Uhrenarmband aus Leder wird Sie beeindrucken.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
228	ch_w_daniel_wellington_8133603164467_classic_york	{"Classic York"}	Das schöne braune Armband mit Krokodil-Prägung, das schwarze Ziffernblatt und das flache Gehäuse von 6 mm machen diese Herrenuhr in Roségold zu einem handwerklich perfekten Zeitmesser. Inspiriert von den alten Zeiten wurde die Classic York Herrenuhr mit braunem Lederarmband entwickelt, um auch heute zu beeindrucken. Diese Roségold Herrenuhr ist ein anspruchsvoller und stilvoller Zeitmesser, der Eindruck macht. Das edle Lederarmband mit Krokodilprägung und das schwarze Zifferblatt bilden den perfekten Hintergrund für das roségoldene Gehäuse und machen diese Uhr zu einem Must-have für jeden anspruchsvollen Gentleman. Das schlanke 6-mm-Gehäuse und das Quarzwerk machen diese Uhr zu einem technischen Meisterwerk, während das braune Lederarmband dafür sorgt, dass sie den ganzen Tag über bequem zu tragen ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
229	ch_w_daniel_wellington_8133603262771_classic_york	{"Classic York"}	In diesem Meisterwerk der Perfektion ruht das nur 6 mm hohe Gehäuse mit Ziffernblatt in Elfenbeinweiß in einem Armband aus dunkelbraunen Krokodilleder: Eine von weniger schnelllebigen Zeiten inspirierte Herrenuhr, an der Sie lange Freude haben werden.  <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington roségold Herrenuhr mit braunem Lederarmband der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
230	ch_w_daniel_wellington_8133603098931_classic_winchester	{"Classic Winchester"}	Nicht ohne Absicht und dabei höchst dezent wurde die Classic Winchester mit ihrer Farbgestaltung zum subtilen Eyecatcher. Lebensfrohes Rosa in der Mitte, umgeben von klassischem Marineblau, ergibt in dieser Uhr den perfekten Mix aus Eleganz und Statement, gekrönt von einem makellos in Roségold schimmernden Gehäuse. <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington Damenuhr mit Natoband der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Nato-Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
289	ch_w_daniel_wellington_8133611782451_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano ist eine fesselnde Uhr aus kostbaren Materialien, die entspannte Raffinesse ausstrahlen. Das Zifferblatt ist aus Perlmutt gefertigt, so dass jedes Stück ein von der Natur geschaffenes Unikat ist. Die Zeiger sind mit glitzernden Kristallen besetzt, die dem minimalistischen Design einen Hauch von Luxus verleihen. Um das Bild zu vervollständigen, darf natürlich das elegante Studio-Uhrenarmband nicht fehlen. Wähle aus drei verfügbaren Farben deinen Favoriten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
231	ch_w_daniel_wellington_8133603197235_classic_york	{"Classic York"}	Das schöne braune Armband mit Krokodil-Prägung, das schwarze Ziffernblatt und das flache Gehäuse von 6 mm machen diese Uhr zu einem handwerklich perfekten Zeitmesser. Inspiriert von den alten Zeiten wurde die Classic York entwickelt, um auch heute zu beeindrucken. <br> Egal, ob Sie etwas Einzigartiges und Auffälliges suchen oder einfach nur einen klassischen und eleganten Zeitmesser, die Classic Black York Silver 36mm Damenuhr ist die perfekte Wahl für Sie! Mit ihrem schönen Armband mit Krokodilprägung, dem schwarzen Zifferblatt und dem flachen 6-mm-Gehäuse ist diese Uhr ein echter Hingucker und gleichzeitig elegant. Diese exquisite Damenuhr wurde für die modebewusste Frau von heute kreiert, die auf der Suche nach etwas Zeitlosem ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
232	ch_w_daniel_wellington_8133607620915_petite_bondi	{"Petite Bondi"}	 KLASSISCHES DESIGN TRIFFT AUF MODERNEN MINIMALISMUS Die Petite Bondi mit ihrem weißen Lederarmband und dem eierschalenweißen Zifferblatt signalisiert zugleich Einfachheit und Anmut. Diese ultraflache Uhr schmiegt sich sanft an den Arm und verleiht Ihrem Stil frische Energie. Erhältlich in Rotgold oder Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
233	ch_w_daniel_wellington_8133606867251_iconic_link	{"Iconic Link"}	Featuring a glossy sunray dial in Light Pink and a luxurious rose gold-plated bracelet, the Iconic Link commands attention with its striking design, adding a subtle pop of color to your collection. The link bracelet can be adjusted for a perfect fit at your local watchmaker or Daniel Wellington store.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
234	ch_w_daniel_wellington_8133607063859_iconic_link_unitone	{"Iconic Link Unitone"}	Die Iconic Link Unitone ist unsere erste einfarbige Uhr mit einem nahtlos passenden luxuriösen Metallgliederarmband und Zifferblatt. Erhältlich in poliertem Edelstahl mit lebhaftem Silber-Finish, veredeltem Roségold oder Goldplattierung. Diese einzigartige Ergänzung der Iconic Link-Kollektion macht die Unitone zu einer unbestreitbar eleganten Uhr, der bei jeder Gelegenheit den Ton angibt. Diese elegante Damenuhr hat ein silbernes Finish und ein luxuriöses Metallgliederarmband. Egal, ob Sie sich schick oder leger kleiden, diese Uhr ist für jeden Anlass geeignet. Die Iconic Link Unitone Silber Damenuhr besticht durch ihr raffiniertes Design und ihren zeitlosen Charme.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
235	ch_w_daniel_wellington_8133607751987_petite_bristol	{"Petite Bristol"}	 EIN WUNDERSCHÖNER KLASSIKER Diese Petite Uhr mit schwarzem Zifferblatt und Bristol-Armband steht für unaufgeregte Eleganz. Diese markante Kombination ist immer aktuell. Erhältlich in Rotgold oder Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
236	ch_w_daniel_wellington_8133607817523_petite_bristol	{"Petite Bristol"}	Die Petite Bristol mit ihrem weißen Lederarmband und dem eierschalenweißen Zifferblatt signalisiert zugleich Einfachheit und Anmut. Diese ultraflache Uhr in Roségold schmiegt sich sanft an den Arm und verleiht Ihrem Stil frische Energie. <br> Die Petite Bristol Damenuhr ist das perfekte Accessoire für jede Frau, die einen Hauch von Eleganz und Schlichtheit sucht. Das ultraschlanke Design mit roségoldenem Gehäuse macht sie zu einer guten Wahl für Frauen, die eine bequeme und stilvolle Uhr suchen, die sie nicht beschwert. Mit ihrem weißen Lederarmband und dem eierschalenweißen Zifferblatt passt diese Uhr zu jedem Outfit, egal ob Sie sich schick oder leger kleiden. Wenn Sie also auf der Suche nach einer schönen, minimalistischen Damenuhr sind, die Ihren Look vervollständigt, ist die Petite Bristol die perfekte Wahl.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
237	ch_w_daniel_wellington_8133607850291_petite_bristol	{"Petite Bristol"}	 KLASSISCHES DESIGN TRIFFT AUF MODERNEN MINIMALISMUS Die Petite Bristol mit ihrem weißen Lederarmband und dem eierschalenweißen Zifferblatt signalisiert zugleich Einfachheit und Anmut. Diese ultraflache Uhr schmiegt sich sanft an den Arm und verleiht Ihrem Stil frische Energie. Erhältlich in Rotgold oder Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
238	ch_w_daniel_wellington_8133607948595_petite_coral	{"Petite Coral"}	Die Petite Coral hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem NATO-Armband in Nudepink.   <br> Mit einer pinkfarbenen Uhr mit Perlmutt-Zifferblatt gibst du deinem Outfit einen Farbakzent. <a href="https://www.danielwellington.com/mother-of-pearl/" rel="nofollow"> Entdecke hier alle Perlmutt-Uhren!</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
239	ch_w_daniel_wellington_8133608243507_petite_cornwall	{"Petite Cornwall"}	SCHMALES GEHÄUSE. MAXIMALE WIRKUNG. Mit dem eierschalenweißen Zifferblatt und dem schwarzen NATO-Armband ist die Petite Cornwall ein echter Hingucker. Mit ihrem eleganten Design und faszinierenden Aussehen ist diese Uhr ein moderner Klassiker für jeden Anlass.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
240	ch_w_daniel_wellington_8133608407347_petite_dover	{"Petite Dover"}	Mit ihrem reinweißen NATO-Armband ist die Petite Dover der Inbegriff des Sommers. Diese minimalistische Armbanduhr ziert ein schwarzes Ziffernblatt und Details in Roségold. Ein sommerlich sportlicher Klassiker für jeden Anlass.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
241	ch_w_daniel_wellington_8133608997171_petite_lumine_pressed_evergold	{"Petite Lumine Pressed Evergold"}	Die Petite Lumine Pressed Mesh ist gewagt minimalistisch und setzt auf Brillanz statt auf übermäßige Details. Dank der kleinen, funkelnden Kristalle, die die Zeiger markieren, leuchtet das Zifferblatt von innen heraus. Das Armband, das mit glitzerndem Metall gewebt ist, ergänzt diese bemerkenswerte Uhr und lässt sie noch mehr strahlen. Wähle aus drei verfügbaren Farben deinen bevorzugten Glanz aus.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
242	ch_w_daniel_wellington_8133608145203_petite_cornwall	{"Petite Cornwall"}	<h3>SCHMALES GEHÄUSE. MAXIMALE WIRKUNG.</h3>Mit dem eierschalenweißen Zifferblatt und dem schwarzen NATO-Armband ist die Petite Cornwall ein echter Hingucker. Mit ihrem eleganten Design und faszinierenden Aussehen ist diese Uhr ein moderner Klassiker für jeden Anlass.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
243	ch_w_daniel_wellington_8133608571187_petite_durham	{"Petite Durham"}	<h3>FÜR DEN WAHREN KENNER</h3>Geschätzt für ihren Vintage-Look verfügt das Durham-Armband über eine einzigartige Patina, dessen Leder durch das Tragen erst richtig zum Leuchten kommt. Das schwarze Zifferblatt passt perfekt zum hellbraunen Armband dieser minimalistischen Petite Uhr.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
254	ch_w_daniel_wellington_8133599723827_classic_cornwall	{"Classic Cornwall"}	Die Classic Cornwall Roségold Herrenuhr steht für Einfachheit und Stil. Die Kombination aus einem weißen Zifferblatt mit einem ganz in Schwarz gehaltenen NATO-Armband, macht diese schlichte und elegante roségold Uhr mit Uhrenarmband aus Stoff nicht zuletzt du deinem alltäglichen Modebegleiter. Für den Mann, der einen Hauch von Luxus mit seinem Alltagsstil verbinden möchte, haben wir die perfekte Uhr. Die Cornwall Natoband Uhr mit weißem Zifferblatt und roségoldenen Akzenten ist das perfekte Accessoire für jedes Outfit. Mit ihrem komplett schwarzen NATO-Armband ist sie einfach zu tragen und perfekt für jede Gelegenheit.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
244	ch_w_daniel_wellington_8133598773555_classic_bayswater	{"Classic Bayswater"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold und unserem traditionellen NATO Armband in Nachtblau, ist Classic Bayswater Herrenuhr mit schwarzem Zifferblatt ein schlichter Begleiter für tagsüber und abends. Diese Uhr mit blauem Uhrenarmband aus Stoff ist das perfekte Accessoire für jeden Anlass und lässt sich mühelos mit vielen Outfits kombinieren. Unsere Bayswater Herrenuhr mit schwarzem Zifferblatt ist ein moderner Klassiker mit schlankem Gehäuse und roségoldenen Details. Diese elegante Natoband Uhr ist perfekt für jeden Mann, der seiner Alltagsgarderobe einen Hauch von Luxus verleihen möchte. Ganz gleich, ob Sie sich schick anziehen oder nicht, diese Daniel Wellington Uhr mit Uhrenarmband aus Stoff wird immer gut an Ihrem Handgelenk aussehen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
245	ch_w_daniel_wellington_8133598871859_classic_bayswater	{"Classic Bayswater"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Silber und unserem traditionellen NATO Armband in Nachtblau, ist die Classic Bayswater Herrenuhr mit weißem Zifferblatt ein schlichter Begleiter für tagsüber und abends. Ganz gleich, ob Sie sich schick oder leger kleiden, diese silberne Uhr wird immer gut an Ihrem Handgelenk aussehen. Egal, zu welchem Stil sie getragen wird, diese Herrenuhr ist die perfekte Kombination aus klassisch und elegant. Die schicke Natoband Uhr mit blauem Uhrenarmband aus Stoff ist das perfekte Accessoire für jeden Anlass und lässt sich mühelos mit vielen Outfits kombinieren. Unsere Bayswater Herrenuhr mit weißem Zifferblatt ist ein moderner Klassiker mit schlankem Gehäuse für optimalen Tragekomfort und zeitlosen Stil.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
246	ch_w_daniel_wellington_8133599134003_classic_bristol	{"Classic Bristol"}	Mit ihrem luxuriösen schwarzen Ziffernblatt und dem dunkelbraunen Lederarmband erweckt die Classic Bristol die Vorstellung müheloser Eleganz. Egal mit welchem Stil sie kombiniert wird - diese exquisite Uhr ist stets ein Blickfang.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
247	ch_w_daniel_wellington_8133598839091_classic_bayswater	{"Classic Bayswater"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold und unserem traditionellen NATO Armband in Nachtblau, ist die Classic Bayswater Herrenuhr mit weißem Zifferblatt ein schlichter Begleiter für tagsüber und abends. Diese Natoband Uhr mit blauem Uhrenarmband aus Stoff ist das perfekte Accessoire für jeden Anlass und lässt sich mühelos mit vielen Outfits kombinieren. Unsere Roségold Bayswater Herrenuhr mit weißem Zifferblatt ist ein moderner Klassiker mit schlankem Gehäuse, an dem Sie jahrelang Freude haben werden. Das blaue NATO-Stoffarmband ist stilvoll und bequem und macht die Bayswater Herrenuhr ein Must-Have für jeden modebewussten Mann.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
248	ch_w_daniel_wellington_8133598806323_classic_bayswater	{"Classic Bayswater"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold oder Silber und unserem traditionellen NATO Armband in Nachtblau, ist Classic Bayswater ein schlichter Begleiter für tagsüber und abends.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
249	ch_w_daniel_wellington_8133599494451_classic_canterbury	{"Classic Canterbury"}	Inspiriert von der klaren Farbgebung klassischer Flaggengestaltung zelebriert dieses rot-weiß-blau gestreifte Natoband den American Way of Fashion. Gepaart mit der schlichten Eleganz des extrem flachen Ziffernblatts macht es diese roségold Herrenuhr im Job und auch danach zum stets passenden Accessoire. Mit nur 6 mm ist diese ultraflache roségold Daniel Wellington Uhr mit rot weiß blauem Band der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser klassischen Daniel Wellington Uhr in roségold machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
250	ch_w_daniel_wellington_8133599199539_classic_bristol	{"Classic Bristol"}	Die Classic-Kollektion wurde für Damen und Herren geschaffen, die klare Linien und schlichtes Design zu schätzen wissen. Mit ihrem puristischen Ziffernblatt, eingebunden in makellos dunkelbraunes Leder, sorgt diese elegante Herrenuhr in silber an jedem Handgelenk für einen eleganten und stilvollen Auftritt. Ganz unabhängig davon, ob dieser im Alltagsoutfit oder in Abendgarderobe erfolgt.  Mit nur 6 mm ist diese ultraflache klassische Daniel Wellington Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser Daniel Wellington Herrenuhr mit Lederarmband machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
251	ch_w_daniel_wellington_8133599527219_classic_canterbury	{"Classic Canterbury"}	Inspiriert von der klaren Farbgebung klassischer Flaggengestaltung zelebriert dieses rot-weiß-blau gestreifte Natoband den American Way of Fashion. Gepaart mit der schlichten Eleganz des extrem flachen Ziffernblatts macht es diese Silber Herrenuhr im Job und auch danach zum stets passenden Accessoire.  Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr mit rot weiß blauem Band der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser klassischen Daniel Wellington Uhr in silber machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
252	ch_w_daniel_wellington_8133599363379_classic_cambridge	{"Classic Cambridge"}	Inspiriert von der klaren Farbgebung klassischer Flaggengestaltung zelebriert dieses rot-weiß-blau gestreifte Natoband an dieser klassischen Herrenuhr in Silber den American Way of Fashion. Gepaart mit der schlichten Eleganz des extrem flachen Ziffernblatts macht es diese klassische Silber Uhr im Job und auch danach zum stets passenden Accessoire.  Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr mit rot weiß blauem Band der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser Daniel Wellington Silber Herrenuhr machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
253	ch_w_daniel_wellington_8133599756595_classic_cornwall	{"Classic Cornwall"}	Die Classic Cornwall Silber Herrenuhr steht für Einfachheit und Stil. Die Kombination aus einem weißen Zifferblatt mit einem ganz in Schwarz gehaltenen NATO-Armband, macht diese schlichte und elegante Uhr mit Uhrenarmband aus Stoff nicht zuletzt du deinem alltäglichen Modebegleiter. Die Classic Cornwall Silber Herrenuhr mit Natoband ist ein Muss für jeden Mann, der einen Hauch von Klasse in seine Alltagsgarderobe bringen möchte. Das weiße Zifferblatt und das schwarze NATO-Uhrenarmband aus Stoff sind schlicht und elegant und machen diese Uhr zum perfekten Begleiter für jeden formellen oder legeren Anlass.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
290	ch_w_daniel_wellington_8623173435716_petite_lumine_bezel_5-link_melrose	{"Petite Lumine Bezel 5-Link Melrose"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
255	ch_w_daniel_wellington_8133599887667_classic_dover	{"Classic Dover"}	Mit ihrem elfenbeinfarbenen Ziffernblatt und Details in Roségold wird diese elegante Uhr mit Sicherheit dein täglicher Begleiter für das gewisse Etwas. Das reinweiße NATO-Armband macht diese weiße Herrenuhr zum modernen Klassiker für jeden Anlass.  Diese ultraschlanke Uhr in Weiß- und Roségold wertet dein Outfit mit ihren raffinierten Details auf. Dieser moderne Klassiker mit weißen NATO-Armband kann vom Büro bis zum Fitnessstudio getragen werden, ohne dass du einen Takt aussetzen musst. Diese Roségold Herrenuhr mit weißem Zifferblatt für höchste ästhetische Ansprüche wurde mit großer Liebe zum Detail entwickelt. Die roségoldenen Details verleihen ihr einen Hauch von Luxus, während das weiße Zifferblatt sie klassisch hält.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
256	ch_w_daniel_wellington_8133599953203_classic_durham	{"Classic Durham"}	Mit ihrem eleganten schwarzen Ziffernblatt und dem hellbraunen Armband aus echtem amerikanischem Leder ist die Classic Durham roségold Herrenuhr die richtige Wahl für den wahren Connaisseur. Dank der Behandlung mit Pflanzenöl verfügt die Durham über einen einzigartigen Pull-Up-Effekt, wodurch die wunderschöne und höchst individuelle Patina des Armbands zur Geltung kommt. Die Classic Durham Herrenuhr in Roségold und braunem Lederarmband ist die perfekte Wahl für jeden anspruchsvollen Gentleman. Egal, ob Sie an einer formellen Veranstaltung teilnehmen, eine Partie Tennis spielen oder einen sonnigen Tag im Country Club genießen, mit dieser Uhr in Roségold haben Sie immer einen schönen Begleiter.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
257	ch_w_daniel_wellington_8133599854899_classic_dover	{"Classic Dover"}	Dein Stil zeigt, wer du bist. In der Classic Dover Roségold Herrenuhr sind Handwerkskunst und Design perfekt vereint. Mit ihrem all-black Ziffernblatt und Details in Roségold ist diese Uhr ein echtes Must-Have. Die Classic Dover ist ein Muss für jeden Gentleman, der seinen tadellosen Stil unter Beweis stellen möchte. Mit ihrem ganz in Schwarz gehaltenen Zifferblatt und den roségoldenen Details ist diese Uhr mit weißem Mesh-Armband perfekt für jede Gelegenheit. Mit einer Dicke von nur 6 mm ist sie ultradünn und lässt sich den ganzen Tag und Abend über bequem tragen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
258	ch_w_daniel_wellington_8133600051507_classic_durham	{"Classic Durham"}	Mit ihrem eierschalenfarbenen Zifferblatt, dem minimalistischen Gehäuse und dem eleganten hellbraunen Lederarmband, das aus amerikanischem Leder gefertigt wurde, ist die Classic Durham eine spektakuläre Ergänzung unserer repräsentativen Classic-Kollektion. Diese superdünne (6mm) Armbanduhr passt zu jeder Gelegenheit und ist sowohl in Rotgold als auch in Silber erhältlich. <br><br>  Das Durham-Lederband wird mit Pflanzenöl behandelt, wodurch eine einzigartige Farbgebung in Vintage-Optik entsteht. Durch regelmäßiges Tragen erhält das Band somit seinen individuellen Look.<br><br>  Alle Armbänder von Daniel Wellington sind austauschbar und lassen sich im Handumdrehen wechseln. Mit einem sorgfältig ausgewählten Sortiment an verspielten NATO-Armbändern lässt sich eine einzigartige Uhr für jeden Wochentag gestalten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
259	ch_w_daniel_wellington_8133600215347_classic_glasgow	{"Classic Glasgow"}	Mit ihrer maritimen Ausstrahlung verkörpert diese zeitlos-elegante Silber Herrenuhr mit blau-weißem Natoband das Flair eines herrlichen Sommertags am Meer. Und ist damit die richtige Wahl für alle, die um die Bedeutung des perfekten Accessoires wissen.  Mit nur 6 mm ist diese ultraflache Daniel Wellington Silber Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit der blau-weißen Daniel Wellington Herrenuhr mit Natoband machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
260	ch_w_daniel_wellington_8133601165619_classic_reading	{"Classic Reading"}	Die Classic Reading Silber Herrenuhr verfügt über ein schwarzes Lederarmband mit Krokodil-Prägung, ein schwarzes Ziffernblatt und ein extra flaches Gehäuse von 6 mm. Ob Sie an einer offiziellen Veranstaltung teilnehmen, eine Partie Tennis spielen oder einen sonnigen Tag im Country Club genießen - mit dieser silbernen Uhr haben Sie stets einen schönen Begleiter. <br> Die Classic Reading Silber Herrenuhr mit Krokoleder Armband ist ein unaufdringlicher Zeitmesser, der sich für jeden formellen oder legeren Anlass eignet. Das schwarze Zifferblatt und das silberne Gehäuse sind klassisch und elegant, während das Lederarmband mit Krokodilprägung einen Hauch von Luxus verleiht. Diese Daniel Wellington Uhr ist perfekt für jeden Mann, der einen raffinierten Zeitmesser sucht, der zu jedem Outfit getragen werden kann.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
261	ch_w_daniel_wellington_8133601263923_classic_reading	{"Classic Reading"}	Schlichtheit und Eleganz vereinen sich in der Classic Reading Silber Herrenuhr. Diese Uhr verfügt über ein schwarzes Krokodillederarmband, ein eierschalenweißes Zifferblatt und ein hauchdünnes 6-mm-Gehäuse. Sie ist das perfekte Accessoire für jeden Anlass, ob Sie nun an einer formellen Veranstaltung teilnehmen oder einen sonnigen Tag im Country Club genießen. Mit ihrem klassischen Design wird diese silberne Daniel Wellington Herrenuhr sicher beeindrucken. Die Classic Reading Silber Herrenuhr von Daniel Wellington ist die perfekte Wahl für jeden Mann, der einen anspruchsvollen und stilvollen Zeitmesser sucht. Das schwarze Lederarmband mit Kroko-Prägung und das weiße Zifferblatt sind klassisch und schick, während das 6 mm dicke Uhrengehäuse unglaublich dünn und leicht ist. Diese Uhr eignet sich perfekt für jeden Anlass und ist angenehm zu tragen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
262	ch_w_daniel_wellington_8133601001779_classic_oxford	{"Classic Oxford"}	Dieser Klassiker für höchste ästhetische Ansprüche wurde mit großer Liebe zum Detail entwickelt. Die klaren Farben des Natobands und das minimalistische Design des Ziffernblatts machen diese Uhr zum perfekten Accessoire. Mit nur 6 mm ist diese ultraflache Daniel Wellington Uhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club _x0096_ mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
263	ch_w_daniel_wellington_8133601231155_classic_reading	{"Classic Reading"}	Das Design der Classic Reading Roségold Herrenuhr aus unserer Flagship-Kollektion Classic steht für Schlichtheit und lässige Eleganz. Sie besticht mit einem schwarzen Krokodillederarmband, einem eierschalenweißen Zifferblatt und einem hauchdünnen 6mm-Uhrengehäuse. Ein moderner Klassiker, der sich für jede Gelegenheit eignet. <br> Egal, ob Sie an einer offiziellen Veranstaltung teilnehmen, Tennis spielen oder einen sonnigen Tag im Country-Club genießen - diese Daniel Wellington Roségold Herrenuhr mit schwarzem Krokoleder Armband ist ein schlichter, aber eleganter Zeitmesser. Und nicht nur das: Sie können die Armbänder austauschen, um die Uhr für jeden Wochentag individuell zu gestalten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
264	ch_w_daniel_wellington_8133601591603_classic_roselyn	{"Classic Roselyn"}	Mit klassischen Merkmalen, wie dem schmalen Gehäuse, Details in Roségold oder Silber und unserem traditionellen NATO Armband in Rubinrot, ist Classic Roselyn ein schlichter Begleiter für tagsüber und abends.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
265	ch_w_daniel_wellington_8133609685299_petite_pressed_sheffield	{"Petite Pressed Sheffield"}	Die Petite Sheffield ist eine zeitlose Damenuhr aus poliertem Edelstahl mit schickem Roségold-Finish. Ihr schwarzes Zifferblatt verleiht jedem Look einen eleganten Touch, während das Lederarmband für einen angenehmen Tragekomfort sorgt. Diese vielseitige Roségold Damenuhr eignet sich für jeden Anlass, egal ob Sie sich schick anziehen oder nicht. Die Petite Sheffield Damenuhr in Roségold mit schwarzem Lederarmband ist perfekt, um jedes Outfit aufzuwerten. Sie ist aus poliertem Edelstahl mit schickem Roségold-Finish gefertigt und hat ein schwarzes Zifferblatt, das ihr einen Hauch von Raffinesse zu verleiht. Diese elegante Damenuhr mit Lederarmband ist perfekt für jede Gelegenheit!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
266	ch_w_daniel_wellington_8133609718067_petite_pressed_sheffield	{"Petite Pressed Sheffield"}	Die Petite Sheffield Damenuhr ist perfekt für jeden Anlass. Mit ihrer großen Auswahl an Zifferblattgrößen und dem schicken Lederarmband in schwarz passt sie sich nahtlos jedem Look an. Sie ist aus poliertem Edelstahl mit Roségold-Overlay gefertigt und mit einem weißen Zifferblatt erhältlich. Verleihen Sie Ihrem Look einen eleganten Touch mit dieser zeitlosen Damenuhr. <br> Ganz gleich, ob Sie sich für einen besonderen Anlass in Schale werfen oder Ihrem Alltagslook einen raffinierten Akzent verleihen möchten, die Petite Sheffield roségold Damenuhr mit schwarzem Lederarmband wird mit Sicherheit Ihr neues Lieblingsaccessoire werden.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
267	ch_w_daniel_wellington_8133609816371_petite_reading	{"Petite Reading"}	<h3>ZEITLOSES SCHWARZ</h3>Die Petite mit dem schwarzen Zifferblatt und dem Reading-Armband zeigt eine wunderschöne Kombination aus einem klaren Minimalismus und einem Leder mit Krokodil-Prägung. Schwarze Eleganz und Stil in Perfektion.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
268	ch_w_daniel_wellington_8133609849139_petite_reading	{"Petite Reading"}	Die Petite mit dem schwarzen Zifferblatt und dem Reading-Armband zeigt eine wunderschöne Kombination aus einem klaren Minimalismus und einem Leder mit Krokodil-Prägung. Schwarze Eleganz und Stil in Perfektion. <br> Die Petite Reading ist eine elegante, raffinierte Damenuhr, die sich für jeden Anlass eignet. Mit ihrem schwarzen Zifferblatt und dem schwarzen Krokoleder-Armband hat sie ein schlichtes, minimalistisches Design, das elegant und stilvoll ist. Mit einer Höhe von nur 6 Millimetern ist sie ultradünn und auch über längere Zeiträume bequem zu tragen. Egal, ob Sie an einer formellen Veranstaltung teilnehmen, Tennis spielen oder einen sonnigen Tag im Country Club genießen, diese ultraflache Daniel Wellington Uhr ist der perfekte Begleiter für jede Gelegenheit.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
269	ch_w_daniel_wellington_8133609881907_petite_reading	{"Petite Reading"}	Die Petite Reading Damenuhr in Weiß/Roségold ist die perfekte Wahl für anspruchsvolle Frauen, die eine stilvolle und bequeme Uhr für jeden Tag suchen. In dieser wunderschönen Kombination aus einem klaren Minimalismus und schwarzem Leder in klassischer Krokodil-Prägung trifft Weiß auf Schwarz. Passend zum Anzug oder zu Jeans und T-Shirt für einen lässigeren Look.  Das dünne 6-mm-Gehäuse ist Rosévergoldet und sieht mit dem weißen Zifferblatt und dem schwarzen Lederarmband fantastisch aus. Ultraflach und sehr angenehm zu tragen, ist diese kleine Damenuhr die perfekte Wahl für jeden Tag und jeden Abend.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
270	ch_w_daniel_wellington_8133609914675_petite_reading	{"Petite Reading"}	EIN ZEITLOSES STIL-STATEMENT In dieser wunderschönen Kombination aus einem klaren Minimalismus und schwarzem Leder in klassischer Krokodil-Prägung trifft Weiß auf Schwarz. Passend zum Anzug oder zu Jeans und T-Shirt für einen lässigeren Look.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
271	ch_w_daniel_wellington_8133602738483_classic_suffolk	{"Classic Suffolk"}	Featuring a rustic red strap made from genuine leather, Classic Suffolk is the ultimate staple and is sure to catch the eyes of everyone you meet. With a slim design, an egg-shell white dial and details in rose gold or stainless steel, this sophisticated	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
272	ch_w_daniel_wellington_8133609980211_petite_rosewater	{"Petite Rosewater"}	Die Petite Rosewater besitzt ein elfenbeinweißes Ziffernblatt und ein bezauberndes, rosafarbenes NATO-Armband. Diese Uhr verleiht deinem Look einen dezenten, aber aufregenden Farbtupfer, der perfekt zum Sommer passt. Das zarte rosafarbene Armband mit eleganten Details in Roségold macht die Rosewater zu einem beliebten Accessoire, das jedem Outfit besonderen Glanz verleiht.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
273	ch_w_daniel_wellington_8133606539571_iconic_link_ceramic	{"Iconic Link Ceramic"}	Die Iconic Link Ceramic ist unsere erste Uhr, aus Keramik besteht. Mit silbernen Akzenten an den Zeigern und Details des Zifferblatts, die sich nahtlos an die glänzende Oberfläche der Keramikglieder anpassen. Diese einzigartige Ergänzung der Iconic Link Kollektion ist ein neues Statement Piece. Die kleine schwarze Uhr, die jeder in seiner Sammlung braucht. Beachte, dass Keramik durch harte Stöße abplatzen oder springen kann. Dies kommt jedoch nicht häufig vor.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
274	ch_w_daniel_wellington_8133607457075_petite_bondi	{"Petite Bondi"}	 Klassisches Design trifft modernen Minimalismus  Die Petite Bondi ist das Must-have der Saison. Diese ultradünne Uhr liegt angenehm am Arm und zeichnet sich durch ein weißes Lederarmband, ein schwarzes Zifferblatt und Details in Roségold aus.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
275	ch_w_daniel_wellington_8133607129395_iconic_motion	{"Iconic Motion"}	Die Iconic Motion ist unsere erste wasserfeste Uhr. Ausgestattet mit einem verbesserten bis zu 10 ATM wasserdichten Uhrenkopf und einem neu entworfenen Armband aus einem synthetischen Gummi namens FKM. Erhältlich mit  Farbakzenten in Roségold oder in Silber, die der Uhr ihren gewagten und aufregenden Look verleihen. Entworfen für einen aktiven Lebensstil ist diese Uhr ein Statement, das Stil und Funktionalität in sich vereint.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
276	ch_w_daniel_wellington_8623173468484_petite_lumine_bezel_5-link_two-tone_mop	{"Petite Lumine Bezel 5-Link Two-Tone MOP"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
277	ch_w_daniel_wellington_8133606932787_iconic_link_mint	{"Iconic Link Mint"}	Die Iconic Link Mint ist mit ihrem pistaziengrünen Zifferblatt kaum zu übersehen. Inspiriert vom Beach-Stil der 80er Jahre, fügt dieses moderne Retro-Stück deinem Look Frische hinzu. Sie ist aus rostfreiem Stahl gefertigt und mit Silberbeschichtung erhältlich. Mache sie jeden Tag zum Style-Statement oder trage sie, wenn du einen Farbklecks brauchst. <br><br> Die Iconic Link Mint ist mehr als ein eleganter Zeitmesser mit frischem grünen Zifferblatt. Vielmehr ist sie eine Anspielung auf die 80er Jahre im Miami Beach-Style, der schon unzählige Comebacks hatte. Das Edelstahlarmband mit Silberfinish kontrastiert mit dem seidenmatten Zifferblatt. Sie ist ein wahres Schmuckstück für dein Handgelenk.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
10020	it_w_rolex_m278240-0002_datejust_31	Datejust 31	Scopri l’orologio Datejust 31 in acciaio Oystersteel sul Sito Ufficiale Rolex. Modello: m278240-0002	NULL	1	NULL	13	109	2024-06-21	2024-06-21	t
278	ch_w_daniel_wellington_8133607522611_petite_bondi	{"Petite Bondi"}	Die Petite Bondi ist das Must-have der Saison. Die ultradünne Uhr liegt angenehm am Arm und zeichnet sich durch ein weißes Lederarmband, ein schwarzes Zifferblatt und Details in Edelstahl aus. <br> Egal, ob Sie im Büro oder in der Stadt unterwegs sind, die Petite Bondi ist ein echter Hingucker. Diese ultraflache und modische Uhr ist perfekt für jede Gelegenheit, ob Tag oder Nacht. Das schwarze Zifferblatt und die silbernen Edelstahlelemente sind ein echter Blickfang und elegant, während das weiße Lederarmband einen bequemen Sitz garantiert. Mit einem Durchmesser von nur 32 mm ist diese Uhr perfekt für alle, die einen kleineren Zeitmesser bevorzugen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
279	ch_w_daniel_wellington_8623173534020_petite_lumine_bezel_evergold_mop	{"Petite Lumine Bezel Evergold MOP"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
280	ch_w_daniel_wellington_8623173632324_petite_lumine_bezel_sterling_black_mop	{"Petite Lumine Bezel Sterling Black MOP"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
281	ch_w_daniel_wellington_8674843918660_iconic_black_nato_white_dial	{"Iconic Black NATO White Dial"}	Our NATO straps: you know ‘em, you love ‘em – and now they’re even better. Made with100% recycled nylon and a new twill weaving technique, you’ll get the look of our original NATO, but with a thicker, heavier feel. Pair that with the star power of our Iconic watches, and you’ve got the recipe for a serious glow up.  \nThe details: \n\nIconic watch in silver with 40mm white dial  \n\nBlack NATO strap made from 100% recycled nylon with glossier thread – for more premium, next-level quality \n\nStrap can be swapped with any of our NATOs (including the originals)  \n\nPart of the Iconic collection	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
282	ch_w_daniel_wellington_8674843984196_iconic_nato_grey/black	{"Iconic NATO Grey/Black"}	Our NATO straps: you know ‘em, you love ‘em – and now they’re even better. Made with100% recycled nylon and a new twill weaving technique, you’ll get the look of our original NATO, but with a thicker, heavier feel. Pair that with the star power of our Iconic watches, and you’ve got the recipe for a serious glow up.  <ul>\n<li>The details: \n\nIconic watch in silver with 36mm white dial  \n\nGrey NATO strap with black stripe.</li>\n<li>Made from 100% recycled nylon with glossier thread – for more premium, next-level quality \n\nStrap can be swapped with any of our NATOs (including the originals) </li>\n<li>Part of the Iconic collection.</li>\n</ul> 	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
283	ch_w_daniel_wellington_8133607784755_petite_bristol	{"Petite Bristol"}	Diese Petite Uhr in Silber mit schwarzem Zifferblatt und Bristol-Armband steht für unaufgeregte Eleganz. Diese markante Kombination ist immer aktuell. <br> Unsere Petite Bristol ist ein klassischer Zeitmesser mit modernem Touch und perfekt für die modebewusste Frau, die ein Zeichen setzen möchte. Das Lederarmband in Dunkelbraun ist zart und feminin, während das schwarze Zifferblatt einen Hauch von Schärfe verleiht. Mit ihrem schlanken Design und der bequemen Passform kann diese kleine Damenuhr den ganzen Tag und die ganze Nacht getragen werden. Ganz gleich, ob Sie sich für einen besonderen Anlass herausputzen oder einfach nur Ihren Alltagslook aufpeppen möchten, unsere Petite Bristol Uhr ist ein echter Hingucker.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
284	ch_w_daniel_wellington_8823882285380_petite_roman_numerals_sheffield_rose_gold	{"Petite Roman Numerals Sheffield Rose Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr in Roségold die perfekte Symbiose aus retro und trendy. Mit austauschbarem Armband in Schwarz aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
285	ch_w_daniel_wellington_8133612896563_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Ecken und Kanten können sehr feminin sein. Die Pressed Evergold Emerald bringt das perfekt zur Geltung. Diese quadratische Golduhr für Frauen wirkt dank ihres smaragdgrünen Zifferblatts zierlich und mutig zugleich. Das Mesh-Armband aus Edelstahl mit goldenem Finish verleiht der Uhr eine glänzende, stoffartige Textur und sorgt für umfassenden Tragekomfort. Wenn dein Look also nur einen kleinen Schubs braucht, um etwas Abwechslung zu erhalten, dann wähle eine unserer quadratischen Damenuhren.<br><br>Quadratische Damenuhr in Gold. Goldenes Mesh-Armband mit wunderschönem smaragdgrünem Zifferblatt. <a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow">Quadratische Damenuhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
286	ch_w_daniel_wellington_8674843885892_iconic_black_nato_black_dial	{"Iconic Black NATO Black Dial"}	Our NATO straps: you know ‘em, you love ‘em – and now they’re even better. Made with100% recycled nylon and a new twill weaving technique, you’ll get the look of our original NATO, but with a thicker, heavier feel. Pair that with the star power of our Iconic watches, and you’ve got the recipe for a serious glow up.  \nThe details: \n\nIconic watch in silver with 40mm black dial  \n\nBlack NATO strap made from 100% recycled nylon with glossier thread –  for more premium, next-level quality \n\nStrap can be swapped with any of our NATOs (including the originals)  \n\nPart of the Iconic collection.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
287	ch_w_daniel_wellington_8133613158707_quadro_pressed_unitone	{"Quadro Pressed Unitone"}	Die Quadro Unitone Damenuhr verfügt über ein nahtlos zum rechteckigen Ziffernblatt passendes Mesh-Armband in Silber. Sie ist aus poliertem Edelstahl gefertigt und setzt einen zarten Akzent. Ein zeitloses Stück, das bei jeder Gelegenheit den Ton angibt. <br> Setzen Sie ein Zeichen mit der Quadro Unitone Silber Uhr. Das schlichte und raffinierte Design der rechteckigen Uhr passt zu jedem Anlass, und die polierte Edelstahlkonstruktion sorgt dafür, dass die Uhr viele Jahre lang hält. Ganz gleich, ob Sie sich schick oder dezent kleiden, diese Damenuhr verleiht Ihrem Look einen Hauch von Eleganz.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
288	ch_w_daniel_wellington_8162231386419_petite_lavender	{"Petite Lavender"}	Die Petite Lavender ist genau der Anstoß, den du brauchst, um weitere Frühlingsstyles zu entdecken. Pastellfarben lassen sich gut mit anderen Farben kombinieren. Also lass deiner Fantasie freien Lauf. Das austauschbare Uhrenarmband aus hochwertigem Nappaleder ermöglicht noch mehr Kombinationen. Das schimmernde Zifferblatt aus echtem Perlmutt verleiht dieser Sonderedition Glanz und macht sie zu einem Must-have für Frühling und Sommer.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
291	ch_w_daniel_wellington_8623173370180_petite_lumine_bezel_5-link_arctic_s	{"Petite Lumine Bezel 5-Link Arctic S"}	Die Petite ist unser Original, keine Frage – aber dürfen wir dir diese komplett aufgemotzte Version ans Herz legen, wenn du dich ein bisschen extra fühlst? Passt am besten zu glänzenden Handgelenken, Karaoke oder zu gar nichts. ;)	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
293	ch_w_daniel_wellington_8824462213444_elan_lumine_rose_gold	{"Elan Lumine Rose Gold"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband in Roségold und kleinen Kristallen auf weißem Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
294	ch_w_daniel_wellington_8824462704964_bound_3-link_rose_gold	{"Bound 3-Link Rose Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Roségold passt exakt zur Breite des 3-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
295	ch_w_daniel_wellington_8133612699955_quadro_pressed_sheffield	{"Quadro Pressed Sheffield"}	Das Beste daran, dass heutige Stile so facettenreich sind? Du musst nicht klassisch gekleidet sein, um eine klassische Damenuhr wie die Quadro Pressed Sheffield zu tragen. Ganz im Gegenteil, diese minimalistische Uhr mit dem eleganten quadratischen schwarzen Zifferblatt und dem schlichten schwarzen Lederarmband wertet deinen Freizeitlook auf. Das Gehäuse ist aus Edelstahl gefertigt und mit strahlendem Goldfinish versehen, das für die richtige Portion Glanz sorgt. Hole dir diesen Zeitmesser oder entdecke andere schwarze Uhren für Frauen aus unserer Kollektion und gönne dir eine überraschende Kombination.  <br><br>Klassische Damenuhr in Gold. Schwarzes Lederarmband und quadratisches schwarzes Zifferblatt. Schwarze Uhren für Frauen online kaufen bei Daniel Wellington.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
296	ch_w_daniel_wellington_8824462311748_elan_lumine_unitone_silver	{"Elan Lumine Unitone SIlver"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband und kleinen Kristallen auf silbernem Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
297	ch_w_daniel_wellington_8823882547524_petite_roman_numerals_sheffield_gold	{"Petite Roman Numerals Sheffield Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr in Gold die perfekte Symbiose aus retro und trendy. Mit austauschbarem Armband in Schwarz aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
298	ch_w_daniel_wellington_8133601132851_classic_reading	{"Classic Reading"}	Die Classic Reading Roségold Herrenuhr verfügt über ein schwarzes Lederarmband mit Krokodil-Prägung, ein schwarzes Ziffernblatt und ein extra flaches Gehäuse von 6 mm. Ob Sie an einer offiziellen Veranstaltung teilnehmen, eine Partie Tennis spielen oder einen sonnigen Tag im Country Club genießen - mit dieser Uhr in Roségold haben Sie stets einen schönen Begleiter. Mit ihrem raffinierten Stil und ihrer tadellosen Verarbeitung wird die Classic Reading Herrenuhr mit schwarzem Zifferblatt mit Sicherheit zu Ihrer Lieblingsuhr für jede Gelegenheit. Das schwarze Krokolederarmband und das roségoldene Gehäuse sind die perfekte Kombination aus Klassik und Moderne und machen diese Uhr so vielseitig, dass sie zu jedem Outfit getragen werden kann. Egal, ob Sie sich schick anziehen oder nicht, diese Daniel Wellington Herrenuhr wird immer gut an Ihrem Handgelenk aussehen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
299	ch_w_daniel_wellington_8133600182579_classic_glasgow	{"Classic Glasgow"}	Mit ihrer maritimen Ausstrahlung verkörpert diese zeitlos-elegante roségold Armbanduhr mit blau-weißem Natoband das Flair eines herrlichen Sommertags am Meer. Damit ist diese klassische Uhr die richtige Wahl für alle, die um die Bedeutung des perfekten Accessoires wissen.  Mit nur 6 mm ist diese ultraflache Daniel Wellington roségold Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit dieser Daniel Wellington Natoband Uhr in roségold machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
300	ch_w_daniel_wellington_8824462377284_elan_lumine_malachite_rose_gold	{"Elan Lumine Malachite Rose Gold"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband in Roségold und kleinen Kristallen auf einem Zifferblatt aus echtem Malachit. \n\nMalachit ist ein Naturstein. Abweichungen in der Struktur sind normal – dein Stück ist immer ein Unikat.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
301	ch_w_daniel_wellington_8133609062707_petite_lumine_pressed_melrose	{"Petite Lumine Pressed Melrose"}	Die Petite Lumine Pressed Mesh ist gewagt minimalistisch und setzt auf Brillanz statt auf übermäßige Details. Dank der kleinen, funkelnden Kristalle, die die Zeiger markieren, leuchtet das Zifferblatt von innen heraus. Das Armband, das mit glitzerndem Metall gewebt ist, ergänzt diese bemerkenswerte Uhr und lässt sie noch mehr strahlen. Wähle aus drei verfügbaren Farben deinen bevorzugten Glanz aus.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
302	ch_w_daniel_wellington_8133612175667_quadro_pressed_ashfield	{"Quadro Pressed Ashfield"}	Die Quadro Ashfield in Roségold mit schwarzem Mesh-Armband ist eine stilvolle und vielseitige rechteckige Damenuhr, die jedes Outfit aufwertet. Mit poliertem Edelstahl und einem eleganten, quadratischen schwarzen Zifferblatt ist diese Uhr perfekt für die moderne Frau.  <br> Die Quadro ist unsere erste Uhr mit einem eckigen Zifferblatt und eignet sich perfekt, um jedem Outfit einen Hauch von Raffinesse zu verleihen. Mit ihrem polierten Edelstahlgehäuse in Roségold und dem schlichten schwarzen Zifferblatt ist diese vielseitige Damenuhr immer im Trend. Und dank des bequemen Mesh-Armbands werden Sie diese rechteckige Damenuhr nie mehr ablegen wollen. Es rundet den Look ab und sorgt für hohen Tragekomfort den ganzen Tag über.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
303	ch_w_daniel_wellington_8133606474035_iconic_link_blush	{"Iconic Link Blush"}	Die Iconic Link Blush ist dank ihres pinkfarbenen Ziffernblatts ein echter Hingucker. Als Teil unserer von den 80er Jahren inspirierten limitierten Auflage versetzt dich dieser umwerfende Zeitmesser sofort in einen heißen Sommertag an der französischen Riviera. Sie ist aus Edelstahl gefertigt für einen dezenten Glanz. Kurz gesagt, ein stilvolles Must-have mit 80er-Jahre-Vibes.   <br><br> Inspiriert von der Strandmode der 80er Jahre, setzt die Iconic Link Blush heute ein starkes Statement. Das unerwartete pinkfarbene Zifferblatt widersetzt sich dem Farbminimalismus. Wähle das Metallarmband aus poliertem Edelstahl aus – und du hast eine wirklich originelle Uhr. Trage sie gleich heute, um deinen besonderen Look hervorzuheben.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
346	de_w_daniel_wellington_8133606900019_iconic_link_lumine	{"Iconic Link Lumine"}	Die Lumine ziert ein elfenbeinweißes Ziffernblatt besetzt mit funkelnden Kristallen. Das exklusive Design verleiht unserem charakteristischen Ziffernblatt eine neue und leuchtende Silhouette. Ihre Zweifarbigkeit erhält die Lumine durch polierten Edelstahl mit lebendigem Silberfinish im Zusammenspiel mit kontrastierenden Elementen im Armband und im Gehäuse in raffiniertem Roségold. Diese einmalige Kombination gibt dieser Uhr ihren eleganten und anmutigen Look.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
304	ch_w_daniel_wellington_8133607162163_iconic_motion	{"Iconic Motion"}	Die Iconic Motion ist unsere erste wasserfeste Uhr. Ausgestattet mit einem verbesserten bis zu 10 ATM wasserdichten Uhrenkopf und einem neu entworfenen Armband aus einem synthetischen Gummi namens FKM. Mit Farbakzenten in Silber, die der Uhr ihren gewagten und aufregenden Look verleihen. Entworfen für einen aktiven Lebensstil ist diese Uhr ein Statement, das Stil und Funktionalität in sich vereint. Egal, ob Sie im Fitnessstudio schwitzen oder ein Bad im Pool nehmen, diese Uhr hält alles aus. Und dank ihres eleganten Designs sehen Sie immer gut aus, während Sie die Zeit im Blick behalten. Diese schwarze Herrenuhr mit Gummiband kann mit Ihrem aktiven Lebensstil Schritt halten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
305	ch_w_daniel_wellington_8133611979059_quadro_lumine_pressed_sterling	{"Quadro Lumine Pressed Sterling"}	Die Quadro Lumine Pressed Mesh ist definitiv eine faszinierende Uhr. Der quadratische Uhrenkopf ist mit schimmernden kristallbesetzten Zeigern versehen, die in einer runden Anzeige angeordnet sind. Gleichzeitig bildet das stoffähnliche Armband einen zarten Kontrast zum weißen, leuchtenden Uhrenkopf. Zusammen bilden sie eine vielseitige und einzigartige Uhr, die in drei leuchtenden Farben erhältlich ist.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
306	ch_w_daniel_wellington_8133610340659_petite_sheffield	{"Petite Sheffield"}	Manche sehen eine zierliche Damenuhr, wir sehen beeindruckendes Design. Jedes Element der Petite Sheffield ist ausgefeilt bis zur Perfektion. Das weiße Zifferblatt fügt sich nahtlos in das vergoldete Gehäuse aus Edelstahl ein, während das minimalistische schwarze Lederarmband das Design auf raffinierte Weise verankert. Kein Wunder, dass eine goldene Uhr wie die Petite Sheffield zum Klassiker unter den Damenuhren geworden ist. Trage sie mit dem Selbstbewusstsein einer echten Design-Ikone.<br><br>Klassische, kleine Uhr für Frauen. Goldene Uhr mit weißem Zifferblatt und schwarzem Lederarmband. <a href="https://www.danielwellington.com/womens-watches/">Klassische Damenuhren online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
307	ch_w_daniel_wellington_8824461918532_classic_multi-eye_sterling_arctic	{"Classic Multi-Eye Sterling Arctic"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Blau, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Mesh-Armband in Silber, um den Look zu verändern.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
308	ch_w_daniel_wellington_8133610111283_petite_rouge	{"Petite Rouge"}	Die Petite Rouge hat ein rosa schimmerndes Perlmutt-Zifferblatt. Eine elegante Uhr für jeden Tag. Jede Uhr ist einmalig und unverwechselbar durch das wunderschöne natürliche Schillern des Perlmutts. Sie ist aus Edelstahl gefertigt und mit edlem Roségold überzogen. Ergänzt wird sie von dem gepressten Lederarmband mit Krokoprägung in Nudepink.    Diese einzigartige Uhr ist perfekt für dich, wenn du bunte Accessoires zu deinem Outfit hinzufügen möchtest. <a href="https://www.danielwellington.com/bracelets/?colorText=Rose%20Gold" rel="nofollow"> Ein Armband aus Roségold kann deinen Look noch mehr aufzuwerten. </a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
309	ch_w_daniel_wellington_8133611749683_quadro_lumine_pressed_piano	{"Quadro Lumine Pressed Piano"}	Die Quadro Lumine Pressed Piano ist eine fesselnde Uhr aus kostbaren Materialien, die entspannte Raffinesse ausstrahlen. Das Zifferblatt ist aus Perlmutt gefertigt, so dass jedes Stück ein von der Natur geschaffenes Unikat ist. Die Zeiger sind mit glitzernden Kristallen besetzt, die dem minimalistischen Design einen Hauch von Luxus verleihen. Um das Bild zu vervollständigen, darf natürlich das elegante Studio-Uhrenarmband nicht fehlen. Wähle aus drei verfügbaren Farben deinen Favoriten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
310	ch_w_daniel_wellington_8133611225395_petite_unitone	{"Petite Unitone"}	Zart, feminin und perfekt für jede Gelegenheit - das ist die Petite Unitone Damenuhr. Mit ihrem roségoldenen Mesh-Armband und Zifferblatt ist diese polierte Edelstahluhr ein echtes Unikat. Sie ist mit einem japanischen Quarzwerk ausgestattet, das für eine genaue Zeitmessung sorgt. Egal, ob Sie sich schick anziehen oder nicht, diese Armbanduhr sieht immer fabelhaft aus. <br> Die kleine Uhr aus poliertem Edelstahl ist zierlich, aber dennoch ein echter Blickfang und eignet sich für jeden Anlass. Das doppelt beschichtete Edelstahlgehäuse sorgt für eine lange Lebensdauer und das Mesh-Armband ist für die meisten Handgelenke verstellbar und kann auf 150 mm gekürzt oder auf 205 mm verlängert werden.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
311	ch_w_daniel_wellington_8507983331652_quadro_mini_melrose_rose_gold_amber	{"Quadro Mini Melrose Rose Gold Amber"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt in Bernstein mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look. \nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Roségoldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
312	ch_w_daniel_wellington_8134511526195_petite_lumine_5-link_two-tone	{"Petite Lumine 5-link two-tone"}	Die Petite Lumine 5-Link ist eine Uhr, die gerne als Schmuckstück durchgeht. Dieser vielseitige Zeitmesser hat sowohl die Eleganz einer Qualitätsuhr als auch den kostbaren Charme von Designerschmuck. Das austauschbare Armband mit 5 Gliedern unterstreicht die Schlichtheit des weißen Zifferblatts, das mit glitzernden Kristallen verziert ist. Kombiniere die Uhr mit einfachen Armreifen, wie dem Classic-Armband, oder trage sie als luxuriösen Akzent zu einem lässigen Outfit.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
313	ch_w_daniel_wellington_8591970566468_iconic_chronograph_st_mawes_amber_rg	{"Iconic Chronograph St Mawes Amber RG"}	Der Iconic Chronograph St Mawes stattet dich mit fast allem aus, was du für einen erfolgreichen Tag brauchst. Fangen wir mit dem Stil an: Der klassische Chronographen-Look fügt sich nahtlos in unser minimalistisches Zifferblattdesign in Bernstein mit einem strahlenden Sonnenschliff ein. Mit seinen drei Hilfszifferblättern bietet er außerdem mehrere Stoppuhr-Funktionen und sorgt für makellose Präzision. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das hochwertige Nappalederband kann in Sekundenschnelle und ohne Werkzeug ausgetauscht werden. Du kannst es also entweder gegen Metall- oder Stoffarmbänder austauschen, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
347	de_w_daniel_wellington_8134510215475_classic_mesh_onyx	{"Classic Mesh Onyx"}	Mit der Classic Mesh Onyx ist Großartiges gerade noch besser geworden. Unser unverwechselbarer Zeitmesser bekommt eine neue Zifferblattfarbe mit Sonnenschliff-Finish für einen raffinierten Look. Das Mesh-Armband verleiht der Uhr Textur und Glanz und fordert uns heraus, selbst in einem minimalistischen Stück Komplexität zu entdecken. Außerdem macht das austauschbare Armband diese Uhr vielseitig und absolut zeitlos. Ein zweites Armband kann deinen Zeitmesser in eine ganz neue Uhr verwandeln!	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
314	ch_w_daniel_wellington_8507983462724_quadro_mini_melrose_rose_gold_onyx	{"Quadro Mini Melrose Rose Gold Onyx"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt aus Onyx mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look. \nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Roségoldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
315	ch_w_daniel_wellington_8133609226547_petite_lumine_pressed_piano	{"Petite Lumine Pressed Piano"}	Die Petite Lumine Pressed Piano in Weiß ist der Beweis, dass Natur der ultimative Luxus sein kann. Jedes Zifferblatt ist sorgfältig aus Perlmutt gefertigt und hat ein einzigartiges Muster. Glitzernde Kristalle heben die Zeiger hervor und verleihen dem Zifferblatt einen sanften Glanz. Zur Uhr gehört unser neues Studio-Gliederarmband aus glänzendem Metall, dessen wolkenähnliches, erhabenes Muster das Perlmutt widerspiegelt. Wähle aus den drei verfügbaren Farben deinen Favoriten und genieße eine Uhr wie keine andere.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
316	ch_w_daniel_wellington_8133609390387_petite_melrose	{"Petite Melrose"}	Diese Petite Melrose verfügt über ein schwarzes Zifferblatt, das zugleich für klassische Eleganz und einen unverbrauchten Stil steht. Mit dieser Uhr können Sie nahtlos vom Büro zur Party auf der Dachterrasse wechseln. <br> Mit ihren roségoldenen Akzenten und dem schwarzen Zifferblatt ist diese Petite Melrose eine klassische und doch stilvolle Damenuhr, die zu jeder Frau passt. Das Mesh-Armband sorgt für einen bequemen und sicheren Sitz, während das 6-mm-Gehäuse ultraflach und schick ist. Die Petite Melrose ist das perfekte Accessoire, und wird immer schick aussehen. Egal, ob Sie an einer formellen Veranstaltung teilnehmen oder Tennis spielen, die Petite Melrose ist der perfekte Begleiter für jede Aktivität.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
317	ch_w_daniel_wellington_8133607326003_petite_ashfield	{"Petite Ashfield"}	 EDEL UND ELEGANT Feiern Sie die neue Saison auf zeitlose Art und Weise mit der Petite Ashfield. Diese ultradünne Uhr liegt geschmeidig am Arm und zeichnet sich durch ein mattschwarzes Mesh-Armband und ein elegantes schwarzes Zifferblatt aus. Erhältlich mit Details in Rotgold oder Silber.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
318	ch_w_daniel_wellington_8133606637875_iconic_link	{"Iconic Link"}	Hinter der Iconic Link, einer modernen Interpretation eines klassischen Entwurfs, stecken viele Jahre Designarbeit und akribische Handwerkskunst. Die Iconic Link ziert ein luxuriöses Metallarmband mit dreiteiligen Gliedern; jedes Segment besteht aus sich verjüngenden, individuell gefertigten Edelstahlteilen – so entsteht ein nahtloser Übergang vom Gehäuse bis zum Verschluss. <br>Die markante Linienführung des leicht erhöhten Mittelteils sorgt dafür, dass es sich mühelos ins Gehäuse einfügt, während unser charakteristisches Ziffernblatt ein frisches, modernes Bild abgibt. <br>Die Iconic Link ist in lebhaft silberglänzendem Edelstahl (316L) oder mit feiner Roségoldauflage erhältlich. <br>Das Gliederarmband lässt sich perfekt an dein Handgelenk anpassen – entweder von deinem örtlichen Uhrmacher oder in einem unserer Daniel Wellington Geschäfte.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
319	ch_w_daniel_wellington_8134510051635_classic_mesh_arctic	{"Classic Mesh Arctic"}	Die Classic Mesh Arctic ist ein vielseitiges Stück, das viel zu bieten hat. Das blaue Zifferblatt mit Sonnenschliff erinnert an polare Gewässer, während das silberne Armband dem Zeitmesser einen schneeweißen Glanz verleiht. Dank ihres schlanken Profils und des abgeschrägten Gehäuses liegt es auch gut am Handgelenk. Als Gesamtzeitmesser drückt diese Uhr die ruhige und doch anspruchsvolle Eleganz eines modernen Klassikers aus. Kombiniere sie mit jedem Stil oder wechsle die Armbänder für einen individuellen Look.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
320	ch_w_daniel_wellington_8507983298884_quadro_mini_evergold_gold_onyx	{"Quadro Mini Evergold Gold Onyx"}	Die Quadro Mini wurde an der Schnittstelle zwischen Uhren und Schmuck entwickelt und hat viel zu bieten. Unsere bisher kleinste Uhr verfügt über ein kompaktes Quadro-Zifferblatt aus Onyx mit einem raffinierten Sonnenschliff-Finish und zwei Indexmarkierungen für einen minimalistischen Look. \nDas stoffähnliche Maschenarmband hat den zarten Charme eines eleganten Armbands; es ist jedoch austauschbar, was dem Stück noch mehr Vielseitigkeit verleiht. Wie die meisten unserer Uhren ist auch dieser Zeitmesser aus robustem 316L-Edelstahl gefertigt und mit einer hochwertigen Goldbeschichtung versehen. Trage sie also als Uhr und liebe sie als exquisites Schmuckstück!	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
321	ch_w_daniel_wellington_8824462541124_bound_crocodile_champagne_sunray_gold	{"Bound Crocodile Champagne Sunray Gold"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Roségold passt exakt zur Breite des smaragdgrünen Lederarmbands mit Krokoprägung — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
322	ch_w_daniel_wellington_8823882481988_quadro_roman_numerals_5-link	{"Quadro Roman Numerals 5-Link"}	With vintage-inspired design details—like the Roman Numeral dial and blue steel hands—this version of our Quadro watch strikes just the right balance between old-school and trending now. Features an interchangeable 5-link strap in silver.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
323	ch_w_daniel_wellington_8824484168004_quadro_mini_lumine_bezel_gold	{"Quadro Mini Lumine Bezel Gold"}	Die coole Formgebung der Quadro, minimiert zu unserer kleinsten Uhr ever. Die Quadro Mini Lumine Bezel hat kleine, glitzernde Kristalle und ein austauschbares Mesh-Armband in Gold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
324	ch_w_daniel_wellington_8133608767795_petite_evergold	{"Petite Evergold"}	Die Petite Evergold 36 ist der neueste Zuwachs in unserer Petite Collection. Sie ziert ein schwarzes Ziffernblatt und unser klassisches Mesh-Armband in hellgold. Diese Grand Petite verleiht deinem Look augenblicklich eine smarte Note.   Das Mesh Armband der Petite 36 Kollektion hat ein schlankeres Profil und ist daher nicht mit den Armbändern unserer Classic 36 austauschbar.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
348	de_w_daniel_wellington_8823882449220_quadro_roman_numerals_sterling	{"Quadro Roman Numerals Sterling"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Silber.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
421	de_w_daniel_wellington_8823882219844_petite_roman_numerals_melrose	{"Petite Roman Numerals Melrose"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Petite Uhr die perfekte Symbiose aus retro und trendy. Mit austauschbarem Mesh-Armband in Roségold.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
325	ch_w_daniel_wellington_8133600018739_classic_durham	{"Classic Durham"}	Mit ihrem weißen Zifferblatt, dem minimalistischen Gehäuse und dem eleganten hellbraunen Lederarmband, das aus amerikanischem Leder gefertigt wurde, ist die Classic Durham Herrenuhr in roségold eine spektakuläre Ergänzung unserer repräsentativen Classic-Kollektion. Diese superdünne (6mm) Armbanduhr passt zu jeder Gelegenheit und ist sowohl in Rotgold als auch in Silber erhältlich.  Das Durham-Lederband wird mit Pflanzenöl behandelt, wodurch eine einzigartige Farbgebung in Vintage-Optik entsteht. Durch regelmäßiges Tragen erhält das Band somit seinen individuellen Look. Alle Armbänder von Daniel Wellington sind austauschbar und lassen sich im Handumdrehen wechseln. Mit einem sorgfältig ausgewählten Sortiment an verspielten NATO-Armbändern lässt sich eine einzigartige Uhr für jeden Wochentag gestalten.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
326	ch_w_daniel_wellington_8133599625523_classic_cornwall	{"Classic Cornwall"}	Mit ihrem markanten Ziffernblatt und dem ganz in Schwarz gehaltenen NATO-Armband ist die Classic Cornwall roségold Herrenuhr ein echter Blickfang, welcher die zeitlose Eleganz unserer Classic Collection verkörpert. Mit ihrem eleganten Design und faszinierenden Aussehen ist diese Uhr mit Uhrenarmband aus Stoff ein moderner Klassiker für jeden Anlass. Die Natoband Uhr ist aus den besten Materialien gefertigt und für eine lange Lebensdauer ausgelegt. Egal, ob Sie sich für einen besonderen Anlass herausputzen oder einfach nur im Alltag tragen, die Classic Cornwall roségold Herrenuhr mit schwarzem Zifferblatt ist immer stilvoll.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
327	ch_w_daniel_wellington_8823882613060_quadro_roman_numerals_sheffield_gold	{"Quadro Roman Numerals Sheffield Gold"}	Mit Designdetails, die vom Vintage inspiriert wurden – etwa dem römischen Zifferblatt und den blauen Zeigern – ist diese Version unserer Quadro Uhr in Gold die perfekte Symbiose aus retro und trendy. Mit austauschbarem Armband in Schwarz aus italienischem Echtleder.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
328	ch_w_daniel_wellington_8133602378035_classic_st_mawes	{"Classic St Mawes"}	Mit ihrem edlen braunen Lederarmband und dem eleganten schwarzen Ziffernblatt beweist die Classic St. Mawes Roségold Herrenuhr, dass technische Perfektion nicht nur eine Vision sein muss, sondern Wirklichkeit ist. Die Classic St. Mawes Herrenuhr ist das perfekte Accessoire für jeden Gentleman. Mit ihrem roségoldenen Gehäuse, dem braunen Lederband und dem schwarzen Zifferblatt strahlt diese Uhr Luxus und Raffinesse aus. Ganz gleich, ob Sie sich für einen besonderen Anlass herausputzen oder einfach Ihrem Alltagslook einen Hauch von Klasse verleihen wollen, die Classic St. Mawes Roségold Herrenuhr wird Sie sicher beeindrucken. Diese Uhr ist ein wahres Kunstwerk, das mit Präzision und aus den besten Materialien hergestellt wird.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
329	ch_w_daniel_wellington_8133611028787_petite_sterling	{"Petite Sterling"}	Mit ihrem weißen Zifferblatt sowie dem modernen und neuen Look ist die Petite Sterling bereits jetzt ein Design-Klassiker. Eine stilvolle Damenuhr, die modern und zeitlos zugleich ist. <br> Sie verfügt über ein elegantes weißes Zifferblatt mit silbernen Akzenten und ein stilvolles Mesh-Armband. Die Petite Sterling ist perfekt für jede Gelegenheit, ob Sie nun an einer formellen Veranstaltung teilnehmen, Tennis spielen oder einfach einen sonnigen Tag genießen. Mit ihrem schlanken 6-mm-Gehäuse und dem bequemen Mesh-Armband ist die Petite Sterling das perfekte Accessoire für jede Dame.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
330	ch_w_daniel_wellington_8506412269892_iconic_chronograph_link_arctic_s	{"Iconic Chronograph Link Arctic S"}	Der Iconic Chronograph Link wird dich oft auf dein Handgelenk schauen lassen, und zwar nicht nur, um die Zeit zu überprüfen. Erstens das Design: Der klassische Chronographen-Look fügt sich nahtlos in unser minimalistisches Zifferblattdesign in Blau mit Sonnenschliff-Finish ein. Und dann sind da noch die drei Hilfszifferblätter, die mehrere Stoppuhr-Funktionen bieten und für makellose Präzision sorgen. \nUnd als ob das nicht schon beeindruckend genug wäre, sieh dir das Armband an. Das Armband kann in Sekundenschnelle ohne Werkzeug ausgetauscht werden. So kannst du es mit anderen Armbändern und Stilen kombinieren, immer mit der Gewissheit eines ikonischen Looks.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
331	ch_w_daniel_wellington_8824461885764_classic_multi-eye_st_mawes_arctic_silver	{"Classic Multi-Eye St Mawes Arctic Silver"}	Dieses Update unserer Classic Watch geht einen Schritt weiter mit einem Multifunktion-Zifferblatt in Blau, mit dem du die Sekunden im Blick hast. Mit auswechselbarem Lederarmband in Braun und silbernen Details.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
332	ch_w_daniel_wellington_8133609423155_petite_melrose	{"Petite Melrose"}	Die Petite Melrose verfügt über ein eierschalenweißes Zifferblatt und ein elegantes Mesh-Armband aus Rotgold. Diese Uhr erhebt Ihre alltägliche Erscheinung, Stimmung und Haltung. <br> Die Petite Melrose ist die perfekte Uhr für jede Frau, die ihrem Alltagslook einen Hauch von Eleganz verleihen möchte. Das roségoldene Mesh-Armband und das weiße Zifferblatt sind ein echter Blickfang und schick, während das schlanke 6-mm-Gehäuse für hohen Tragekomfort sorgt. Egal, ob Sie sich für eine formelle Veranstaltung herausputzen oder einfach nur einen sonnigen Tag genießen, diese schöne Daniel Wellington Damenuhr wird Ihr Lieblingsaccessoire sein.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
333	ch_w_daniel_wellington_8133601886515_classic_sheffield	{"Classic Sheffield"}	Spurlos scheinen die Zeitläufte an der eleganten Classic Sheffield Herrenuhr mit ihrem Armband aus tiefschwarzem Leder und ihrer zeitlos-schönen Schlichtheit vorüberzuziehen. Dabei muss Schlichtheit keineswegs zwingend mit Langeweile einhergehen, wie dieses minimalistische Statement zweifelsohne beweist.  <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington Silber Herrenuhr der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
334	ch_w_daniel_wellington_8133606834483_iconic_link_emerald	{"Iconic Link Emerald"}	Die Iconic Link Emerald Gliederarmband Uhr in Silber besticht durch ein glänzendes smaragdgrünes Zifferblatt. Dieser lebhafte Zeitmesser ist aus poliertem Edelstahl gefertigt, hat ein leuchtend silbernes Finish und ein smaragdgrünes Zifferblatt. Eine Uhr, die Ihrer Kollektion einen Hauch von Farbe verleiht und durch ihr auffälliges Design Aufmerksamkeit erregt. Mit ihrem schlanken, modernen Design ist diese Silber Uhr perfekt für jeden Mann, der mit seinem Stil ein Statement setzen möchte. Egal, ob Sie sich für eine formelle Veranstaltung herausputzen oder einfach nur Ihren Alltag bestreiten, diese smaragdgrüne Uhr wird Ihren Look aufpeppen und mit ihrem auffälligen Design die Blicke auf sich ziehen.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
396	de_w_daniel_wellington_8133606768947_iconic_link_emerald	{"Iconic Link Emerald"}	Die Iconic Link Emerald besticht durch ein glänzendes smaragdgrünes Zifferblatt. Es gibt sie in poliertem Edelstahl mit lebhaftem Silberfinish oder raffinierter Roségoldbeschichtung. Eine Uhr, die Ihrer Kollektion einen Hauch von Farbe verleiht und durch ihr auffälliges Design Aufmerksamkeit erregt.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
335	ch_w_daniel_wellington_8133612241203_quadro_pressed_evergold	{"Quadro Pressed Evergold"}	Bei der Quadro Pressed Evergold White ist die Jury noch unentschieden. Ist sie eine goldene Uhr oder ein edles Schmuckstück? Diese goldene Damenuhr bringt Funktionalität und Ästhetik perfekt in Einklang. Das zarte goldene Mesh-Armband schimmert geschmackvoll und ergänzt das quadratische Zifferblatt mit den abgerundeten Kanten. Das schlichte weiße Zifferblatt mit Strahlenschliff spiegelt das glitzernde Gold des Armbands wider und lässt das Gesamtdesign lässig wirken. Was denkst du? Ist diese Quadro ein Schmuckstück oder eine unserer schönsten quadratischen Uhren?<br><br>Kleine goldene Damenuhr mit goldenem Mesh-Armband und quadratischem Zifferblatt in Weiß. <a href="https://www.danielwellington.com/quadro-collection/" rel="nofollow">Quadratische Uhren für Frauen online kaufen bei Daniel Wellington.</a>	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
336	ch_w_daniel_wellington_8133602443571_classic_st_mawes	{"Classic St Mawes"}	Als überaus würdiger Vertreter unserer Flaggschiff-Kollektion Classic schenkt Ihnen die Classic St. Mawes roségold Herrenuhr höchsten Tragekomfort. Das Gesamtwerk aus elegantem Gehäuse, klassischem Lederarmband und makellos rundem Ziffernblatt führt den Beweis, dass technische Perfektion wahr werden kann.  <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington Herrenuhr in roségold mit braunem Lederarmband der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
337	ch_w_daniel_wellington_8133608800563_petite_evergold	{"Petite Evergold"}	Die Petite Evergold 36 ist der neueste Zuwachs in unserer Petite Collection. Sie ziert ein elfenbeinweißes Ziffernblatt und unser klassisches Mesh-Armband in hellgold. Optimiere dein Outfit mit einem dezenten Goldtupfer und zeige der Welt mit dieser brandneuen Grand Petite, wer du bist.  Das Mesh Armband der Petite 36 Kollektion hat ein schlankeres Profil und ist daher nicht mit den Armbändern unserer Classic 36 austauschbar.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
338	ch_w_daniel_wellington_8824462737732_bound_3-link_silver	{"Bound 3-Link Silver"}	Mit schlanken geometrischen Kanten und in zwei Größen zur Auswahl bringt unsere Bound Kollektion die perfekte Symmetrie an dein Handgelenk. Das geschwungene rechteckige Gehäuse dieser Uhr in Silber passt exakt zur Breite des 3-gliedrigen Armbands — und sorgt für ein nahtlos integriertes Zifferblatt.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
339	ch_w_daniel_wellington_8824462344516_elan_lumine_unitone_rose_gold	{"Elan Lumine Unitone Rose Gold"}	Als erstes Crossover unserer Schmuck- und Uhren-Kollektion hat die Elan Lumine die gleiche feine Silhouette und Logo-Design-Details wie die Stücke aus der namengebenden Schmuckfamilie. Mit 3-Glieder-Armband und kleinen Kristallen auf einem Zifferblatt in Roségold.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
340	ch_w_daniel_wellington_8133602476339_classic_st_mawes	{"Classic St Mawes"}	Als überaus würdiger Vertreter unserer Flaggschiff-Kollektion Classic schenkt Ihnen die Classic St. Mawes Silber Herrenuhr höchsten Tragekomfort. Das Gesamtwerk aus elegantem Gehäuse, klassischem Lederarmband und makellos rundem Ziffernblatt führt den Beweis, dass technische Perfektion wahr werden kann.  <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington Herrenuhr in silber mit braunem Lederarmband der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Uhrbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	217	2024-06-21	2024-06-21	t
341	de_w_daniel_wellington_8133601820979_classic_sheffield	{"Classic Sheffield"}	Spurlos scheinen die Zeitläufte an der eleganten Classic Sheffield Herrenuhr in roségold mit ihrem Armband aus tiefschwarzem Leder und ihrer zeitlos-schönen Schlichtheit vorüberzuziehen. Dabei muss Schlichtheit keineswegs zwingend mit Langeweile einhergehen, wie dieses minimalistische Statement zweifelsohne beweist. <br> Mit nur 6 mm ist diese ultraflache Daniel Wellington roségold Herrenuhr mit Uhrenarmband aus Leder der ideale Begleiter für jede Gelegenheit. Ob bei offiziellen Anlässen, auf dem Tennisplatz oder im Country Club mit Daniel Wellington machen Sie überall eine gute Figur. Mit den austauschbaren Armbändern haben Sie zudem stets die passende Farbe zur Hand.	NULL	1	NULL	11	83	2024-06-21	2024-06-21	t
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_image (product_image_id, product_id, image_url) FROM stdin;
1	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-universe.jpg
2	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/rings-precious-lace-2.png
3	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/happy-clock-2023.png
4	1	https://objects-prod.cdn.chopard.com/w_100,h_100,f_auto,b_white,c_pad,q_auto,dpr_4/ProductsAssets/Web/278590-3010_01.png
5	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_fashion_week_2023_bis.png
6	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_overview_alipne_summit.png
7	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_LUC_skull_2023.png
8	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_overview_products_ae_2.png
9	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278608-6001_01.png
10	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278559-3011_01.png
11	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_overview_event_MM.png
12	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Chopard_Hotel_Vendome_Vignette.png
13	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationavigation_Mille_Miglia.png
14	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_05.png
15	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_sustainability-milestones.jpg
16	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-lheure-du-diamant-watches.png
17	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-Queen_of_Kalahari.jpg
18	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278620-6001_01.png
19	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/aoe_antony_dsk.png
20	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/298630-3001_40_.jpg
21	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationecklaces-pendants-lheure-du-diamant-4.png
22	1	https://objects-prod.cdn.chopard.com/image/upload/q_auto,f_auto,dpr_auto/t_merchandising-teaseravigation/Sunglasses_red_carpet_push_teaser.png
23	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_push_menu_MM_2024_bw.png
24	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/classing-rqcing-clock-2023-bis.png
25	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-3012_01.png
26	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3012_01.png
27	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/bracelets-happy-diamonds.png
28	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-mens-watches-2.png
29	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/earrings-happy-hearts.png
30	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_watches_wonders_AE_TT_menu_3.png
31	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/earrings-precious-lace-2.png
32	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-women-accessories-2023.png
33	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationecklaces-pendants-happy-hearts-2.png
34	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-clocks-2023.png
35	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/design-drafting-artisan-3.png
36	1	https://objects-prod.cdn.chopard.com/image/upload/q_auto,f_auto,dpr_autoavigationav_jewellery_ice_cube_WW.png
37	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/mens-bags-2023.png
38	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/mens-cufflinks-2023.png
39	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/rings-happy-diamonds-3.png
40	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationecklaces-pendants-ice-cube-2.png
41	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/mens-scarve-2023.png
42	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278608-6001_01.png
43	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/rollerball-pens-2023.png
44	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/metiers-dart.png
45	1	https://objects-prod.cdn.chopard.com/w_100,h_100,f_auto,b_white,c_pad,q_auto,dpr_auto/ProductsAssets/Web/278590-3010_01.png
46	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_04.png
47	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_40.png
48	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/earrings-lheure-du-diamant-2.png
49	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/womens-bags-2023.png
50	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/our-history.jpg
51	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/earrings-happy-diamonds.png
52	1	https://objects-prod.cdn.chopard.com/e_trim/w_100,c_lpad,ar_1:1,g_center/c_lpad,w_200/ProductsAssets/Web/278590-3010_01.png
53	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/wedding-rings.png
54	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/men-mille-miglia2.png
55	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/bracelets-ice-cube.png
56	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/w_iw,h_ih,c_lpad,g_center/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_01.png
57	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3013_01.png
58	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-men-accessories-2023.png
59	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/ballpoints-pens-2022.png
60	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/womens-sunglasses-2023.png
61	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-Red_Carpet.jpg
62	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_menu_la_maison_Cannes.png
63	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-writing-instruments-2023.png
64	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/perfume-men-2.png
65	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/imperiale-clock-2023.png
66	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278582-3008_01.png
67	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Womens-perfume-2023.png
68	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_sustainability-universe.jpg
69	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3001_01.png
70	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_awareness-raising-and-engagement-02.png
71	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-3012_01.png
72	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/DSC09401-127.jpg
73	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_overview_event_Julia.jpg
74	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/298600-3001_01.png
75	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/298600-3001_01.png
76	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_Lunar_New_Year.png
77	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3001_01.png
78	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_40.png
79	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_06.png
80	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/bracelets-precious-2.png
81	1	https://objects-prod.cdn.chopard.com/e_trim/w_100,c_lpad,ar_1:1,g_center/c_lpad,w_200/ProductsAssets/Web/278590-6015_01.png
82	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/rings-happy-hearts-3.png
83	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-happy-diamonds-watches-2.png
84	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigationav_savoir_faire_overview_la_maison.jpg
85	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/collection-luc-shadow-2.png
86	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-necklaces-pendants-2.png
87	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/womens-scarves-2023.png
88	1	https://objects-prod.cdn.chopard.com/image/upload/q_auto,f_auto,dpr_autoavigation/push_teaser_highlights_MM.png
89	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/happy-hearts-jewellery.png
90	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/bracelets-happy-hearts.png
91	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278559-3011_01.png
92	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-6013_01.png
93	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/fountain-pens.png
94	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/mens-smaller-leather-goods-2023.png
95	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-6015_01.png
96	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278620-6001_01.png
97	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/rings-ice-cube-2.png
98	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-6026_01.png
99	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278608-6004_01.png
100	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/@827702-1259_01.png
101	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/key-chains-men-2023.png
102	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-6013_01.png
103	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-Precious_Lace.jpg
104	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-6015_01.png
105	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/Chopard_Hotel_Vendome_Vignette.png
106	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-earrings-4.png
107	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-universe/q_auto,f_auto,dpr_autoavigationav_push_menu_Cannes_2024.png
108	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/aoe_lorena_mob_nav.png
109	1	https://objects-prod.cdn.chopard.com/image/upload/q_auto,f_auto,dpr_autoavigation/push_teaser_mille_miglia_collection_2023.png
110	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-luc.png
111	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278608-6001_01.png
112	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278608-6004_01.png
113	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/exceptional-poincon-geneve.png
114	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-Carolines_Dreams.jpg
115	1	https://objects-prod.cdn.chopard.com/e_trim/w_100,c_lpad,ar_1:1,g_center/c_lpad,w_200/ProductsAssets/Web/278590-3012_01.png
116	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/womens-bracelets-2023.png
117	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationecklaces-pendants-happy-diamonds-2.png
118	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278582-3008_01.png
119	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_05.png
120	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-3011_01.png
121	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-imperiale-watches-2.png
122	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-collections-jewellery-2.png
123	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Haute_Joaillerie-Mega_menu-Animal_world.jpg
124	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3002_01.png
125	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278620-6002_01.png
126	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3013_01.png
127	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3012_01.png
128	1	https://objects-prod.cdn.chopard.com/e_trim/w_100,c_lpad,ar_1:1,g_center/c_lpad,w_200/ProductsAssets/Web/278590-3013_01.png
129	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/ice-cube-jewellery-2.png
130	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/earrings-ice-cube.png
131	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_aespa_x_chopard_4.png
132	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_Chopard_x_Julia_Roberts_4.png
133	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-happy-sport.png
134	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/happy-diamonds-jewellery-2.png
135	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/engagement-rings.png
136	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/@827702-1259_01.png
137	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/clocks-classic-2022.png
138	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-womens-watches-5.png
139	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-6026_01.png
140	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/women-alpine-eagle.png
141	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/Legacy_Header_desktop_01.jpg
142	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/vendome_next.jpg
143	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/happy-diamonds-campaign-our-legacy-2.png
144	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_800,g_center/ProductsAssets/Web/278590-3002_01.png
145	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_environmental-responsibility.jpg
146	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationav_responsible-sourcing-02.png
147	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_04.png
148	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/grand-complications-2.png
149	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigationecklaces-pendants-precious-lace-4.png
150	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278620-6002_01.png
151	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/men-alpine-eagle.png
152	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-bracelets.png
153	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/w_iw,h_ih,c_lpad,g_center/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_01.png
154	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/bracelets-men-2022-2.png
155	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278573-3011_01.png
156	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/womens-small-leather-goods-2023.png
157	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-highlight/q_auto,f_auto,dpr_autoavigation/social-wall-5.png
158	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_auto/e_trim/c_lpad,w_iw,h_ih/c_lpad,ar_1:1,w_400,d_Placeholders:nav-catalog-placeholder.png,g_center,e_sharpen:60/ProductsAssets/Web/278608-6001_01.png
159	1	https://objects-prod.cdn.chopard.com/q_auto,f_auto,dpr_4/c_pad,ar_1:1,w_1490,e_sharpen:60/ProductsAssets/Web/278590-3010_06.png
160	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/sunglasses-men-2022.png
161	1	https://objects-prod.cdn.chopard.com/image/upload/t_navigation-card-portrait/q_auto,f_auto,dpr_autoavigation/all-rings-4.png
\.


--
-- Data for Name: product_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_source (product_source_id, product_id, source_id, source_url) FROM stdin;
1	1	4	https://www.chopard.com/de-ch/watch/278590-3010.html
2	2	4	https://www.chopard.com/de-de/watch/274808-5003.html
3	3	4	https://www.chopard.com/de-de/watch/10A378-1002.html
4	4	4	https://www.chopard.com/de-de/watch/%4010A391-5100.html
5	5	4	https://www.chopard.com/de-de/watch/10A393-5106.html
6	6	4	https://www.chopard.com/de-de/watch/204445-1001.html
7	7	4	https://www.chopard.com/de-de/watch/384246-1002.html
8	8	4	https://www.chopard.com/de-de/watch/10A376-1008.html
9	9	4	https://www.chopard.com/de-de/watch/295393-5002.html
10	10	4	https://www.chopard.com/de-de/watch/388563-6007.html
11	11	4	https://www.chopard.com/de-de/watch/168604-3002.html
12	12	4	https://www.chopard.com/de-de/watch/204292-5301.html
13	13	4	https://www.chopard.com/en-ae/watch/298600-3001.html
14	14	4	https://www.chopard.com/en-gb/watch/168566-3001.html
15	15	4	https://www.chopard.com/en-hk/watch/168619-4001.html
16	16	4	https://www.chopard.com/en-sg/watch/298600-3001.html
17	17	4	https://www.chopard.com/en-us/watch/388563-3006.html
18	18	4	https://www.chopard.com/fr-ch/watch/161990-0001.html
19	19	4	https://www.chopard.com/fr-ch/watch/131944-5007.html
20	20	4	https://www.chopard.com/fr-ch/watch/%4010A391-5300.html
21	21	4	https://www.chopard.com/fr-ch/watch/13A097-1112.html
22	22	4	https://www.chopard.com/fr-ch/watch/13A386-5107.html
23	23	4	https://www.chopard.com/fr-ch/watch/%4013A390-5100.html
24	24	4	https://www.chopard.com/fr-ch/watch/209436-5002.html
25	25	4	https://www.chopard.com/fr-ch/watch/295384-1003.html
26	26	4	https://www.chopard.com/fr-fr/watch/298600-3001.html
27	27	4	https://www.chopard.com/it-ch/watch/161942-5001.html
28	28	4	https://www.chopard.com/it-it/ring/%40827702-1259.html
29	29	4	https://www.chopard.com/ja-jp/watch/%4010A391-5100.html
30	30	4	https://www.chopard.com/ja-jp/watch/275372-1001.html
31	31	4	https://www.chopard.com/ja-jp/watch/10A393-5106.html
32	32	4	https://www.chopard.com/ja-jp/watch/10A178-1321.html
33	33	4	https://www.chopard.com/ja-jp/watch/204445-1001.html
34	34	4	https://www.chopard.com/ja-jp/watch/384246-1002.html
35	35	4	https://www.chopard.com/ja-jp/watch/295393-5002.html
36	36	4	https://www.chopard.com/ja-jp/watch/10A376-1008.html
37	37	4	https://www.chopard.com/ja-jp/watch/388563-6007.html
38	38	4	https://www.chopard.com/ja-jp/watch/168604-3002.html
39	39	4	https://www.chopard.com/ko-kr/watch/131944-5007.html
40	40	4	https://www.chopard.com/ko-kr/watch/161990-0001.html
41	41	4	https://www.chopard.com/ko-kr/watch/10A178-5301.html
42	42	4	https://www.chopard.com/ko-kr/watch/%4013A390-5100.html
43	43	4	https://www.chopard.com/ko-kr/watch/278573-4001.html
44	44	4	https://www.chopard.com/ko-kr/watch/13A097-1111.html
45	45	4	https://www.chopard.com/ko-kr/watch/13A386-5107.html
46	46	4	https://www.chopard.com/ko-kr/watch/209436-1002.html
47	47	4	https://www.chopard.com/ko-kr/watch/295384-1003.html
48	48	4	https://www.chopard.com/ru-ru/watch/168619-3005.html
49	49	4	https://www.chopard.com/ru-ru/watch/203957-1214.html
50	50	11	https://eu.danielwellington.com/de-ch/products/iconic-link-eggshell-white-silver?variant=44486286934323
51	51	11	https://eu.danielwellington.com/de-ch/products/classic-sheffield-eggshell-white-rose-gold?variant=44486267765043
52	52	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-evergold-green-gold?variant=44486299517235
53	53	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-evergold-g-emerald?variant=46615328063812
54	54	11	https://eu.danielwellington.com/de-ch/products/bound-3-link-gold
55	55	11	https://eu.danielwellington.com/de-ch/products/classic-bristol-eggshell-white-rose-gold?variant=44486256886067
56	56	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-evergold-g-amber?variant=46615327965508
57	57	11	https://eu.danielwellington.com/de-ch/products/classic-multi-eye-ashfield-onyx?variant=47795765117252
58	58	11	https://eu.danielwellington.com/de-ch/products/elan-lumine-gold?variant=47795765215556
59	59	11	https://eu.danielwellington.com/de-ch/products/petite-melrose-light-pink-rose-gold?variant=44486292799795
60	60	11	https://eu.danielwellington.com/de-ch/products/petite-ashfield-black-rose-gold?variant=44486288015667
61	61	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-melrose-rg-champagne?variant=46615328194884
62	62	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-link-onyx-silver?variant=46609516757316
63	63	11	https://eu.danielwellington.com/de-ch/products/iconic-link-eggshell-white-gold?variant=44486286639411
64	64	11	https://eu.danielwellington.com/de-ch/products/iconic-link-arctic-blue-silver?variant=44486285820211
65	65	11	https://eu.danielwellington.com/de-ch/products/classic-sheffield-black-silver?variant=44486267699507
66	66	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-unitone-gold-gold?variant=44486301253939
67	67	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-sterling?variant=47795818365252
68	68	11	https://eu.danielwellington.com/de-ch/products/classic-mesh-onyx-black-black-black?variant=44491751489843
69	69	11	https://eu.danielwellington.com/de-ch/products/classic-st-mawes-arctic-blue-rose-gold?variant=44491752309043
70	70	11	https://eu.danielwellington.com/de-ch/products/iconic-link-black-silver?variant=44486286246195
71	71	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-link-onyx-black?variant=46609516691780
72	72	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-sterling-eggshell-white-silver?variant=44486292472115
73	73	11	https://eu.danielwellington.com/de-ch/products/classic-mesh-onyx-black-silver?variant=44491751555379
74	74	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-eggshell-white-gold?variant=44486300893491
75	75	11	https://eu.danielwellington.com/de-ch/products/classic-sheffield-black-gold?variant=44486267601203
76	76	11	https://eu.danielwellington.com/de-ch/products/iconic-link-lumine-eggshell-white-rose-gold?variant=44486287327539
77	77	11	https://eu.danielwellington.com/de-ch/products/elan-lumine-silver?variant=47795765281092
78	78	11	https://eu.danielwellington.com/de-ch/products/quadro-roman-numerals-sterling?variant=47793167565124
79	79	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sterling-eggshell-white-silver?variant=44486301221171
80	80	11	https://eu.danielwellington.com/de-ch/products/bound-black-crocodile-rose-gold?variant=47795766034756
81	81	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-eggshell-white-gold?variant=44486295191859
82	82	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-eggshell-white-rose-gold?variant=44486300959027
83	83	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-eggshell-white-rose-gold?variant=44486300565811
84	84	11	https://eu.danielwellington.com/de-ch/products/iconic-link-unitone-gold-gold?variant=44486287491379
85	85	11	https://eu.danielwellington.com/de-ch/products/iconic-link-black-gold?variant=44486286016819
86	86	11	https://eu.danielwellington.com/de-ch/products/bound-9-link-gold?variant=47795766886724
87	87	11	https://eu.danielwellington.com/de-ch/products/petite-5-link-evergold-eggshell-white-gold?variant=44491757519155
88	88	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-5-link-two-tone-eggshell-white-silver-gold?variant=44491759812915
89	89	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-eggshell-white-rose-gold?variant=44486295257395
90	90	11	https://eu.danielwellington.com/de-ch/products/petite-dover-eggshell-white-rose-gold?variant=44486291095859
91	91	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-piano-white-mother-of-pearl-gold?variant=44486298009907
92	92	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-sheffield-gold?variant=47795818922308
93	93	11	https://eu.danielwellington.com/de-ch/products/classic-multi-eye-st-mawes-amber-rose-gold?variant=47795764756804
94	94	11	https://eu.danielwellington.com/de-ch/products/petite-roman-numerals-5-link-gold?variant=47793167663428
95	95	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-black-rose-gold?variant=44486300860723
96	96	11	https://eu.danielwellington.com/de-ch/products/petite-emerald-green-gold?variant=44486291587379
97	97	11	https://eu.danielwellington.com/de-ch/products/petite-durham-eggshell-white-rose-gold?variant=44486291423539
98	98	11	https://eu.danielwellington.com/de-ch/products/classic-mesh-graphite-graphite-grey-graphite?variant=44491751424307
99	99	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-piano-white-mother-of-pearl-rose-gold?variant=44486298075443
100	100	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-evergold-g-mop?variant=46993293181252
101	101	11	https://eu.danielwellington.com/de-ch/products/classic-cornwall-black-silver?variant=44486258229555
102	102	11	https://eu.danielwellington.com/de-ch/products/petite-sterling-black-silver?variant=44486295978291
103	103	11	https://eu.danielwellington.com/de-ch/products/iconic-link-amber-brown-rose-gold?variant=44486285787443
104	104	11	https://eu.danielwellington.com/de-ch/products/bound-durham-gold?variant=47795766427972
105	105	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-lumine-bezel-silver?variant=47795819118916
106	106	11	https://eu.danielwellington.com/de-ch/products/petite-unitone-silver-silver?variant=44486296666419
107	107	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-melrose-eggshell-white-rose-gold?variant=44486293061939
108	108	11	https://eu.danielwellington.com/de-ch/products/petite-unitone-gold-gold?variant=44486296437043
109	109	11	https://eu.danielwellington.com/de-ch/products/iconic-link-black-rose-gold?variant=44486286147891
110	110	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-sheffield-white-rose-gold?variant=46885411422532
111	111	11	https://eu.danielwellington.com/de-ch/products/bound-black-crocodile-gold?variant=48017150509380
112	112	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-melrose-rg-blush?variant=46615328162116
113	113	11	https://eu.danielwellington.com/de-ch/products/petite-cornwall-black-silver?variant=44486290407731
114	114	11	https://eu.danielwellington.com/de-ch/products/classic-sheffield-black-rose-gold?variant=44486267666739
115	115	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-evergold-black-gold?variant=44486298403123
116	116	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-5-link-two-tone-mop?variant=46993293115716
117	117	11	https://eu.danielwellington.com/de-ch/products/petite-roman-numerals-5-link-silver?variant=47793167434052
118	118	11	https://eu.danielwellington.com/de-ch/products/bound-9-link-silver?variant=47795767148868
119	119	11	https://eu.danielwellington.com/de-ch/products/iconic-link-emerald-green-gold?variant=44486287032627
120	120	11	https://eu.danielwellington.com/de-ch/products/iconic-link-capri-blue-silver?variant=44486286508339
121	121	11	https://eu.danielwellington.com/de-ch/products/petite-bondi-eggshell-white-rose-gold?variant=44486288539955
122	122	11	https://eu.danielwellington.com/de-ch/products/petite-sheffield-eggshell-white-rose-gold?variant=44486294503731
123	123	11	https://eu.danielwellington.com/de-ch/products/petite-amber-brown-rose-gold?variant=44486287819059
124	124	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-pink-mother-of-pearl-rose-gold?variant=44486300696883
125	125	11	https://eu.danielwellington.com/de-ch/products/classic-multi-eye-evergold-onyx?variant=47795765182788
8855	8855	13	https://www.rolex.com/es/watches/datejust/m278243-0019
126	126	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-evergold-g-blush?variant=46615327998276
127	127	11	https://eu.danielwellington.com/de-ch/products/elan-lumine-unitone-gold?variant=47795765838148
128	128	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-link-onyx-gold?variant=46609516724548
129	129	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-emerald-green-rose-gold?variant=44486300631347
130	130	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-ashfield-black-gold?variant=44486298304819
131	131	11	https://eu.danielwellington.com/de-ch/products/bound-crocodile-emerald-sunray-rose-gold?variant=47795766100292
132	132	11	https://eu.danielwellington.com/de-ch/products/classic-cambridge-eggshell-white-rose-gold?variant=44486257344819
133	133	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-sterling-black-mop?variant=46993293705540
134	134	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-melrose-rg-emerald?variant=46615328227652
135	135	11	https://eu.danielwellington.com/de-ch/products/iconic-link-automatic-black-silver?variant=44486285951283
136	136	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-5-link-melrose?variant=46993293082948
137	137	11	https://eu.danielwellington.com/de-ch/products/bound-9-link-emerald-sunray-rose-gold?variant=47795766755652
138	138	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-melrose-pink-mop?variant=46993293345092
139	139	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-5-link-melrose-white-mother-of-pearl-rose-gold?variant=44491759780147
140	140	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-evergold-eggshell-white-gold?variant=44486297780531
141	141	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-melrose-eggshell-white-rose-gold?variant=44486297846067
142	142	11	https://eu.danielwellington.com/de-ch/products/petite-sheffield-black-rose-gold?variant=44486294274355
143	143	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-melrose?variant=47795818496324
144	144	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-5-link-melrose-white-mother-of-pearl-rose-gold?variant=44491758272819
145	145	11	https://eu.danielwellington.com/de-ch/products/iconic-link-emerald-green-rose-gold?variant=44486287098163
146	146	11	https://eu.danielwellington.com/de-ch/products/classic-mesh-onyx-black-gold?variant=44491751522611
147	147	11	https://eu.danielwellington.com/de-ch/products/classic-st-mawes-amber-brown-rose-gold?variant=44491752276275
148	148	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-piano-white-mother-of-pearl-silver?variant=44486292439347
149	149	11	https://eu.danielwellington.com/de-ch/products/quadro-roman-numerals-melrose?variant=47793167499588
150	150	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-black-rose-gold?variant=44486300467507
151	151	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-sterling-eggshell-white-silver?variant=44486293193011
152	152	11	https://eu.danielwellington.com/de-ch/products/petite-cornwall-black-rose-gold?variant=44486290374963
153	153	11	https://eu.danielwellington.com/de-ch/products/petite-sheffield-black-gold?variant=44486294110515
154	154	11	https://eu.danielwellington.com/de-ch/products/iconic-link-unitone-rose-gold-rose-gold?variant=44486287556915
155	155	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-lumine-bezel-rose-gold?variant=47795819020612
156	156	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-green-rose-gold?variant=44486301090099
157	157	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-green-rose-gold?variant=44486300664115
158	158	11	https://eu.danielwellington.com/de-ch/products/quadro-coral-pink-mother-of-pearl-rose-gold?variant=44486297682227
159	159	11	https://eu.danielwellington.com/de-ch/products/classic-oxford-eggshell-white-rose-gold?variant=44486263079219
160	160	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-black-gold?variant=44486294995251
161	161	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-ashfield-black-rose-gold?variant=44486292963635
162	162	11	https://eu.danielwellington.com/de-ch/products/classic-somerset-eggshell-white-rose-gold?variant=44486268289331
163	163	11	https://eu.danielwellington.com/de-ch/products/petite-roman-numerals-melrose?variant=47793167270212
164	164	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-piano-white-mother-of-pearl-silver?variant=44486298108211
165	165	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-sheffield-rose-gold?variant=47795818791236
166	166	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-eggshell-white-silver?variant=44486302171443
167	167	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-bezel-melrose-pink-mop?variant=46993292919108
168	168	11	https://eu.danielwellington.com/de-ch/products/petite-melrose-pearl-pink-mother-of-pearl-rose-gold?variant=44486292865331
169	169	11	https://eu.danielwellington.com/de-ch/products/petite-cherry-blossom-pink-mother-of-pearl-rose-gold?variant=44620053807411
170	170	11	https://eu.danielwellington.com/de-ch/products/petite-roman-numerals-sterling?variant=47793167401284
171	171	11	https://eu.danielwellington.com/de-ch/products/petite-york-black-silver?variant=44486297289011
172	172	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-emerald-rose-gold?variant=44486302204211
173	173	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-piano-black-mother-of-pearl-silver?variant=44486292341043
174	174	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-piano-white-mother-of-pearl-rose-gold?variant=44486292406579
175	175	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-eggshell-white-rose-gold-29x36?variant=46716922954052
176	176	11	https://eu.danielwellington.com/de-ch/products/quadro-roman-numerals-sheffield-rose-gold?variant=47793167532356
177	177	11	https://eu.danielwellington.com/de-ch/products/classic-roselyn-black-silver?variant=44486267273523
178	178	11	https://eu.danielwellington.com/de-ch/products/petite-durham-black-silver?variant=44486291390771
179	179	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-piano-black-mother-of-pearl-rose-gold?variant=44486292308275
180	180	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-piano-black-mother-of-pearl-gold?variant=44486292275507
181	181	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-melrose-black-rose-gold?variant=44486293029171
182	182	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-pressed-piano-black-mother-of-pearl-silver?variant=44486297977139
183	183	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-rouge-pink-mother-of-pearl-rose-gold?variant=44486300729651
184	184	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-unitone-rose-gold-rose-gold?variant=44486301286707
185	185	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-black-silver?variant=44486295126323
186	186	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-black-silver?variant=44486301385011
187	187	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-emerald-green-rose-gold?variant=44486301024563
188	188	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-black-rose-gold?variant=44486301352243
189	189	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-eggshell-white-rose-gold?variant=44486301778227
190	190	11	https://eu.danielwellington.com/de-ch/products/quadro-studio-green-rose-gold?variant=44486302269747
191	191	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-5-link-melrose-pink-mother-of-pearl-rose-gold?variant=44491758240051
192	192	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-5-link-melrose-pink-mother-of-pearl-rose-gold?variant=44491759747379
193	193	11	https://eu.danielwellington.com/de-ch/products/quadro-cherry-blossom-pink-mother-of-pearl-rose-gold?variant=44620053971251
194	194	11	https://eu.danielwellington.com/de-ch/products/quadro-lavender-purple-mother-of-pearl-rose-gold?variant=44620053872947
195	195	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-link-graphite?variant=46609516659012
196	196	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-ashfield-black-rose-gold-29x36?variant=46716922233156
197	197	11	https://eu.danielwellington.com/de-ch/products/petite-sheffield-eggshell-white-silver?variant=44486294569267
198	198	11	https://eu.danielwellington.com/de-ch/products/petite-sheffield-black-silver?variant=44486294372659
199	199	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-black-rose-gold-29x36?variant=46716922921284
200	200	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-black-rose-gold?variant=44486295093555
201	201	11	https://eu.danielwellington.com/de-ch/products/petite-st-mawes-eggshell-white-silver?variant=44486295290163
202	202	11	https://eu.danielwellington.com/de-ch/products/petite-york-eggshell-white-silver?variant=44486297387315
203	203	11	https://eu.danielwellington.com/de-ch/products/petite-suffolk-eggshell-white-rose-gold?variant=44486296305971
204	204	11	https://eu.danielwellington.com/de-ch/products/petite-york-eggshell-white-rose-gold?variant=44486297354547
205	205	11	https://eu.danielwellington.com/de-ch/products/petite-bluebell-blue-mother-of-pearl-rose-gold?variant=44620053774643
206	206	11	https://eu.danielwellington.com/de-ch/products/quadro-5-link-evergold-eggshell-white-gold?variant=44491759714611
207	207	11	https://eu.danielwellington.com/de-ch/products/quadro-bluebell-blue-mother-of-pearl-rose-gold?variant=44620053938483
208	208	11	https://eu.danielwellington.com/de-ch/products/iconic-chronograph-st-mawes-arctic-rose-gold?variant=46885411488068
209	209	11	https://eu.danielwellington.com/de-ch/products/quadro-lumine-bezel-5-link-arctic-s?variant=46993293050180
210	210	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-melrose-eggshell-white-rose-gold-29x36?variant=46716922364228
211	211	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-evergold-g-champagne?variant=46615328031044
212	212	11	https://eu.danielwellington.com/de-ch/products/quadro-roman-numerals-5-link-gold?variant=47793167728964
213	213	11	https://eu.danielwellington.com/de-ch/products/iconic-nato-green-purple-rose-gold?variant=47172522934596
214	214	11	https://eu.danielwellington.com/de-ch/products/classic-multi-eye-st-mawes-arctic-rose-gold?variant=47795764855108
215	215	11	https://eu.danielwellington.com/de-ch/products/classic-multi-eye-sterling-onyx?variant=47795765018948
216	216	11	https://eu.danielwellington.com/de-ch/products/bound-black-crocodile-silver?variant=47795766493508
217	217	11	https://eu.danielwellington.com/de-ch/products/classic-bristol-black-rose-gold?variant=44486256754995
218	218	11	https://eu.danielwellington.com/de-ch/products/classic-durham-black-silver?variant=44486258917683
219	219	11	https://eu.danielwellington.com/de-ch/products/quadro-mini-evergold?variant=47795818299716
220	220	11	https://eu.danielwellington.com/de-ch/products/classic-roselyn-black-rose-gold?variant=44486267207987
221	221	11	https://eu.danielwellington.com/de-ch/products/classic-roselyn-eggshell-white-silver?variant=44486267404595
222	222	11	https://eu.danielwellington.com/de-ch/products/classic-southampton-eggshell-white-silver?variant=44486268879155
223	223	11	https://eu.danielwellington.com/de-ch/products/classic-southampton-eggshell-white-rose-gold?variant=44486268322099
224	224	11	https://eu.danielwellington.com/de-ch/products/classic-st-mawes-black-gold?variant=44486269108531
225	225	11	https://eu.danielwellington.com/de-ch/products/classic-warwick-eggshell-white-rose-gold?variant=44486270222643
226	226	11	https://eu.danielwellington.com/de-ch/products/classic-warwick-eggshell-white-silver?variant=44486270255411
227	227	11	https://eu.danielwellington.com/de-ch/products/classic-st-mawes-black-silver?variant=44486269305139
228	228	11	https://eu.danielwellington.com/de-ch/products/classic-york-black-rose-gold?variant=44486270419251
229	229	11	https://eu.danielwellington.com/de-ch/products/classic-york-eggshell-white-rose-gold?variant=44486270517555
230	230	11	https://eu.danielwellington.com/de-ch/products/classic-winchester-eggshell-white-rose-gold?variant=44486270353715
231	231	11	https://eu.danielwellington.com/de-ch/products/classic-york-black-silver?variant=44486270452019
232	232	11	https://eu.danielwellington.com/de-ch/products/petite-bondi-eggshell-white-silver?variant=44486288572723
233	233	11	https://eu.danielwellington.com/de-ch/products/iconic-link-light-pink-rose-gold?variant=44486287262003
234	234	11	https://eu.danielwellington.com/de-ch/products/iconic-link-unitone-silver-silver?variant=44486287589683
235	235	11	https://eu.danielwellington.com/de-ch/products/petite-bristol-black-rose-gold?variant=44486289883443
236	236	11	https://eu.danielwellington.com/de-ch/products/petite-bristol-eggshell-white-rose-gold?variant=44486289948979
237	237	11	https://eu.danielwellington.com/de-ch/products/petite-bristol-eggshell-white-silver?variant=44486290047283
238	238	11	https://eu.danielwellington.com/de-ch/products/petite-coral-pink-mother-of-pearl-rose-gold?variant=44486290211123
239	239	11	https://eu.danielwellington.com/de-ch/products/petite-cornwall-eggshell-white-silver?variant=44486290604339
240	240	11	https://eu.danielwellington.com/de-ch/products/petite-dover-black-rose-gold?variant=44486291030323
241	241	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-pressed-evergold-eggshell-white-gold?variant=44486291915059
242	242	11	https://eu.danielwellington.com/de-ch/products/petite-cornwall-eggshell-white-rose-gold?variant=44486290506035
243	243	11	https://eu.danielwellington.com/de-ch/products/petite-durham-black-rose-gold?variant=44486291292467
244	244	11	https://eu.danielwellington.com/de-ch/products/classic-bayswater-black-rose-gold?variant=44486256001331
245	245	11	https://eu.danielwellington.com/de-ch/products/classic-bayswater-eggshell-white-silver?variant=44486256197939
246	246	11	https://eu.danielwellington.com/de-ch/products/classic-bristol-black-silver?variant=44486256787763
247	247	11	https://eu.danielwellington.com/de-ch/products/classic-bayswater-eggshell-white-rose-gold?variant=46436817109316
248	248	11	https://eu.danielwellington.com/de-ch/products/classic-bayswater-black-silver?variant=44486256066867
249	249	11	https://eu.danielwellington.com/de-ch/products/classic-canterbury-eggshell-white-rose-gold?variant=44486257574195
250	250	11	https://eu.danielwellington.com/de-ch/products/classic-bristol-eggshell-white-silver?variant=44486256918835
251	251	11	https://eu.danielwellington.com/de-ch/products/classic-canterbury-eggshell-white-silver?variant=44486257869107
252	252	11	https://eu.danielwellington.com/de-ch/products/classic-cambridge-eggshell-white-silver?variant=44486257410355
253	253	11	https://eu.danielwellington.com/de-ch/products/classic-cornwall-eggshell-white-silver?variant=44486258458931
254	254	11	https://eu.danielwellington.com/de-ch/products/classic-cornwall-eggshell-white-rose-gold?variant=44486258393395
255	255	11	https://eu.danielwellington.com/de-ch/products/classic-dover-eggshell-white-rose-gold?variant=44486258753843
256	256	11	https://eu.danielwellington.com/de-ch/products/classic-durham-black-rose-gold?variant=44486258852147
257	257	11	https://eu.danielwellington.com/de-ch/products/classic-dover-black-rose-gold?variant=44486258721075
258	258	11	https://eu.danielwellington.com/de-ch/products/classic-durham-eggshell-white-silver?variant=44486259015987
259	259	11	https://eu.danielwellington.com/de-ch/products/classic-glasgow-eggshell-white-silver?variant=44486259245363
260	260	11	https://eu.danielwellington.com/de-ch/products/classic-reading-black-silver?variant=44486264095027
261	261	11	https://eu.danielwellington.com/de-ch/products/classic-reading-eggshell-white-silver?variant=44486265569587
262	262	11	https://eu.danielwellington.com/de-ch/products/classic-oxford-eggshell-white-silver?variant=44486263144755
263	263	11	https://eu.danielwellington.com/de-ch/products/classic-reading-eggshell-white-rose-gold?variant=44486264521011
264	264	11	https://eu.danielwellington.com/de-ch/products/classic-roselyn-eggshell-white-rose-gold?variant=44486267371827
265	265	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-sheffield-black-rose-gold?variant=44486293094707
266	266	11	https://eu.danielwellington.com/de-ch/products/petite-pressed-sheffield-eggshell-white-rose-gold?variant=44486293127475
267	267	11	https://eu.danielwellington.com/de-ch/products/petite-reading-black-rose-gold?variant=44486293225779
268	268	11	https://eu.danielwellington.com/de-ch/products/petite-reading-black-silver?variant=44486293291315
269	269	11	https://eu.danielwellington.com/de-ch/products/petite-reading-eggshell-white-rose-gold?variant=44486293356851
270	270	11	https://eu.danielwellington.com/de-ch/products/petite-reading-eggshell-white-silver?variant=44486293389619
271	271	11	https://eu.danielwellington.com/de-ch/products/classic-suffolk-eggshell-white-rose-gold?variant=44486269927731
272	272	11	https://eu.danielwellington.com/de-ch/products/petite-rosewater-eggshell-white-rose-gold?variant=44486293553459
273	273	11	https://eu.danielwellington.com/de-ch/products/iconic-link-ceramic-black-black?variant=44486286541107
274	274	11	https://eu.danielwellington.com/de-ch/products/petite-bondi-black-rose-gold?variant=44486288376115
275	275	11	https://eu.danielwellington.com/de-ch/products/iconic-motion-black-rose-gold?variant=44486287687987
276	276	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-bezel-5-link-two-tone-mop?variant=46993292820804
277	277	11	https://eu.danielwellington.com/de-ch/products/iconic-link-mint-green-silver?variant=44486287458611
278	278	11	https://eu.danielwellington.com/de-ch/products/petite-bondi-black-silver?variant=44486288474419
279	279	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-bezel-evergold-g-mop?variant=46993292886340
280	280	11	https://eu.danielwellington.com/de-ch/products/petite-lumine-bezel-sterling-black-mop?variant=46993292984644
281	281	11	https://eu.danielwellington.com/de-ch/products/iconic-black-nato-white-dial-silver?variant=47172522901828
282	282	11	https://eu.danielwellington.com/de-ch/products/iconic-nato-grey-black-silver?variant=47172522967364
283	283	11	https://eu.danielwellington.com/de-ch/products/petite-bristol-black-silver?variant=44486289916211
284	284	11	https://eu.danielwellington.com/de-ch/products/petite-roman-numerals-sheffield-rose-gold?variant=47793167368516
285	285	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-sheffield-green-gold?variant=44486301057331
286	286	11	https://eu.danielwellington.com/de-ch/products/iconic-black-nato-black-dial-silver?variant=47172522869060
287	287	11	https://eu.danielwellington.com/de-ch/products/quadro-pressed-unitone-silver-silver?variant=44486301319475
288	288	11	https://eu.danielwellington.com/de-ch/products/petite-lavender-purple-mother-of-pearl-rose-gold?variant=44620053840179
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (source_id, source_name, brand_id) FROM stdin;
1	w_montblanc	1
2	w_omega	2
3	w_blancpain	3
4	w_chopard	4
5	w_girard_perregaux	5
6	w_ulysse_nardin	6
7	w_breguet	7
8	w_tudor	8
9	w_longines	9
10	w_breitling	10
11	w_daniel_wellington	11
12	w_audemars_piguet	12
13	w_rolex	13
14	w_cartier	14
15	w_tag_heuer	15
16	w_hublot	16
17	w_bell_ross	17
18	w_swatch	18
19	w_timex	19
20	w_citizen	20
\.


--
-- Data for Name: source_price_availability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source_price_availability (source_price_availability_id, product_id, source_id, price, raw_price, discount, created_date, updated_date, is_available) FROM stdin;
1	1	4	5970.00	5970.00	0	2024-06-21	2024-06-21	t
2	2	4	32100.00	32100.00	0	2024-06-21	2024-06-21	t
3	3	4	71600.00	71600.00	0	2024-06-21	2024-06-21	t
4	4	4	80099.99	80099.99	0	2024-06-21	2024-06-21	t
5	5	4	94100.00	94100.00	0	2024-06-21	2024-06-21	t
6	6	4	57100.00	57100.00	0	2024-06-21	2024-06-21	t
7	7	4	74700.00	74700.00	0	2024-06-21	2024-06-21	t
8	8	4	82700.00	82700.00	0	2024-06-21	2024-06-21	t
9	9	4	83062.00	83062.00	0	2024-06-21	2024-06-21	t
10	10	4	14161.00	14161.00	0	2024-06-21	2024-06-21	t
11	11	4	NULL	NULL	0	2024-06-21	2024-06-21	t
12	12	4	21800.00	21800.00	0	2024-06-21	2024-06-21	t
13	13	4	NULL	NULL	0	2024-06-21	2024-06-21	t
14	14	4	NULL	NULL	0	2024-06-21	2024-06-21	t
15	15	4	86000.00	86000.00	0	2024-06-21	2024-06-21	t
16	16	4	21100.00	21100.00	0	2024-06-21	2024-06-21	t
17	17	4	7140.00	7140.00	0	2024-06-21	2024-06-21	t
18	18	4	NULL	NULL	0	2024-06-21	2024-06-21	t
19	19	4	NULL	NULL	0	2024-06-21	2024-06-21	t
20	20	4	69100.00	69100.00	0	2024-06-21	2024-06-21	t
21	21	4	53300.00	53300.00	0	2024-06-21	2024-06-21	t
22	22	4	61100.00	61100.00	0	2024-06-21	2024-06-21	t
23	23	4	83100.00	83100.00	0	2024-06-21	2024-06-21	t
24	24	4	53100.00	53100.00	0	2024-06-21	2024-06-21	t
25	25	4	NULL	NULL	0	2024-06-21	2024-06-21	t
26	26	4	NULL	NULL	0	2024-06-21	2024-06-21	t
27	27	4	26700.00	26700.00	0	2024-06-21	2024-06-21	t
28	28	4	NULL	NULL	0	2024-06-21	2024-06-21	t
29	29	4	10956000	10956000	0	2024-06-21	2024-06-21	t
30	30	4	8778000	8778000	0	2024-06-21	2024-06-21	t
31	31	4	12881000	12881000	0	2024-06-21	2024-06-21	t
32	32	4	8426000	8426000	0	2024-06-21	2024-06-21	t
33	33	4	50500.00	50500.00	0	2024-06-21	2024-06-21	t
34	34	4	10285000	10285000	0	2024-06-21	2024-06-21	t
35	35	4	69800.00	69800.00	0	2024-06-21	2024-06-21	t
36	36	4	71400.00	71400.00	0	2024-06-21	2024-06-21	t
37	37	4	1859000	1859000	0	2024-06-21	2024-06-21	t
38	38	4	NULL	NULL	0	2024-06-21	2024-06-21	t
39	39	4	NULL	NULL	0	2024-06-21	2024-06-21	t
40	40	4	NULL	NULL	0	2024-06-21	2024-06-21	t
41	41	4	NULL	NULL	0	2024-06-21	2024-06-21	t
42	42	4	NULL	NULL	0	2024-06-21	2024-06-21	t
43	43	4	NULL	NULL	0	2024-06-21	2024-06-21	t
44	44	4	NULL	NULL	0	2024-06-21	2024-06-21	t
45	45	4	NULL	NULL	0	2024-06-21	2024-06-21	t
46	46	4	NULL	NULL	0	2024-06-21	2024-06-21	t
47	47	4	NULL	NULL	0	2024-06-21	2024-06-21	t
48	48	4	NULL	NULL	0	2024-06-21	2024-06-21	t
49	49	4	NULL	NULL	0	2024-06-21	2024-06-21	t
50	50	11	€169	€169	0	2024-06-21	2024-06-21	t
51	51	11	€169	€169	0	2024-06-21	2024-06-21	t
52	52	11	€165	€165	0	2024-06-21	2024-06-21	t
53	53	11	€149	€149	0	2024-06-21	2024-06-21	t
54	54	11	€245	€245	0	2024-06-21	2024-06-21	t
55	55	11	€169	€169	0	2024-06-21	2024-06-21	t
56	56	11	€149	€149	0	2024-06-21	2024-06-21	t
57	57	11	€209	€209	0	2024-06-21	2024-06-21	t
58	58	11	€219	€219	0	2024-06-21	2024-06-21	t
59	59	11	€116	€116	0	2024-06-21	2024-06-21	t
60	60	11	€145	€145	0	2024-06-21	2024-06-21	t
61	61	11	€149	€149	0	2024-06-21	2024-06-21	t
62	62	11	€279	€279	0	2024-06-21	2024-06-21	t
63	63	11	€169	€169	0	2024-06-21	2024-06-21	t
64	64	11	€169	€169	0	2024-06-21	2024-06-21	t
65	65	11	€169	€169	0	2024-06-21	2024-06-21	t
66	66	11	€165	€165	0	2024-06-21	2024-06-21	t
67	67	11	€149	€149	0	2024-06-21	2024-06-21	t
68	68	11	€179	€179	0	2024-06-21	2024-06-21	t
69	69	11	€169	€169	0	2024-06-21	2024-06-21	t
70	70	11	€169	€169	0	2024-06-21	2024-06-21	t
71	71	11	€279	€279	0	2024-06-21	2024-06-21	t
72	72	11	€149	€149	0	2024-06-21	2024-06-21	t
73	73	11	€179	€179	0	2024-06-21	2024-06-21	t
74	74	11	€145	€145	0	2024-06-21	2024-06-21	t
75	75	11	€169	€169	0	2024-06-21	2024-06-21	t
76	76	11	€259	€259	0	2024-06-21	2024-06-21	t
77	77	11	€219	€219	0	2024-06-21	2024-06-21	t
78	78	11	€165	€165	0	2024-06-21	2024-06-21	t
79	79	11	€165	€165	0	2024-06-21	2024-06-21	t
80	80	11	€165	€165	0	2024-06-21	2024-06-21	t
81	81	11	€139	€139	0	2024-06-21	2024-06-21	t
82	82	11	€145	€145	0	2024-06-21	2024-06-21	t
83	83	11	€165	€165	0	2024-06-21	2024-06-21	t
84	84	11	€169	€169	0	2024-06-21	2024-06-21	t
85	85	11	€169	€169	0	2024-06-21	2024-06-21	t
86	86	11	€259	€259	0	2024-06-21	2024-06-21	t
87	87	11	€179	€179	0	2024-06-21	2024-06-21	t
88	88	11	€229	€229	0	2024-06-21	2024-06-21	t
89	89	11	€139	€139	0	2024-06-21	2024-06-21	t
90	90	11	€119	€119	0	2024-06-21	2024-06-21	t
91	91	11	€199	€199	0	2024-06-21	2024-06-21	t
92	92	11	€145	€145	0	2024-06-21	2024-06-21	t
93	93	11	€199	€199	0	2024-06-21	2024-06-21	t
94	94	11	€189	€189	0	2024-06-21	2024-06-21	t
95	95	11	€145	€145	0	2024-06-21	2024-06-21	t
96	96	11	€145	€145	0	2024-06-21	2024-06-21	t
97	97	11	€139	€139	0	2024-06-21	2024-06-21	t
98	98	11	€179	€179	0	2024-06-21	2024-06-21	t
99	99	11	€199	€199	0	2024-06-21	2024-06-21	t
100	100	11	€229	€229	0	2024-06-21	2024-06-21	t
101	101	11	€149	€149	0	2024-06-21	2024-06-21	t
102	102	11	€145	€145	0	2024-06-21	2024-06-21	t
103	103	11	€135	€135	0	2024-06-21	2024-06-21	t
104	104	11	€165	€165	0	2024-06-21	2024-06-21	t
105	105	11	€169	€169	0	2024-06-21	2024-06-21	t
106	106	11	€145	€145	0	2024-06-21	2024-06-21	t
107	107	11	€145	€145	0	2024-06-21	2024-06-21	t
108	108	11	€145	€145	0	2024-06-21	2024-06-21	t
109	109	11	€135	€135	0	2024-06-21	2024-06-21	t
110	110	11	€259	€259	0	2024-06-21	2024-06-21	t
111	111	11	€165	€165	0	2024-06-21	2024-06-21	t
112	112	11	€149	€149	0	2024-06-21	2024-06-21	t
113	113	11	€95	€95	0	2024-06-21	2024-06-21	t
114	114	11	€169	€169	0	2024-06-21	2024-06-21	t
115	115	11	€165	€165	0	2024-06-21	2024-06-21	t
116	116	11	€245	€245	0	2024-06-21	2024-06-21	t
117	117	11	€189	€189	0	2024-06-21	2024-06-21	t
118	118	11	€259	€259	0	2024-06-21	2024-06-21	t
119	119	11	€169	€169	0	2024-06-21	2024-06-21	t
120	120	11	€135	€135	0	2024-06-21	2024-06-21	t
121	121	11	€139	€139	0	2024-06-21	2024-06-21	t
122	122	11	€139	€139	0	2024-06-21	2024-06-21	t
123	123	11	€145	€145	0	2024-06-21	2024-06-21	t
124	124	11	€189	€189	0	2024-06-21	2024-06-21	t
125	125	11	€209	€209	0	2024-06-21	2024-06-21	t
126	126	11	€149	€149	0	2024-06-21	2024-06-21	t
127	127	11	€219	€219	0	2024-06-21	2024-06-21	t
128	128	11	€279	€279	0	2024-06-21	2024-06-21	t
129	129	11	€165	€165	0	2024-06-21	2024-06-21	t
130	130	11	€165	€165	0	2024-06-21	2024-06-21	t
131	131	11	€165	€165	0	2024-06-21	2024-06-21	t
132	132	11	€149	€149	0	2024-06-21	2024-06-21	t
133	133	11	€229	€229	0	2024-06-21	2024-06-21	t
134	134	11	€149	€149	0	2024-06-21	2024-06-21	t
135	135	11	€369	€369	0	2024-06-21	2024-06-21	t
136	136	11	€235	€235	0	2024-06-21	2024-06-21	t
137	137	11	€259	€259	0	2024-06-21	2024-06-21	t
138	138	11	€229	€229	0	2024-06-21	2024-06-21	t
139	139	11	€235	€235	0	2024-06-21	2024-06-21	t
140	140	11	€169	€169	0	2024-06-21	2024-06-21	t
141	141	11	€169	€169	0	2024-06-21	2024-06-21	t
142	142	11	€139	€139	0	2024-06-21	2024-06-21	t
143	143	11	€149	€149	0	2024-06-21	2024-06-21	t
144	144	11	€209	€209	0	2024-06-21	2024-06-21	t
145	145	11	€169	€169	0	2024-06-21	2024-06-21	t
146	146	11	€179	€179	0	2024-06-21	2024-06-21	t
147	147	11	€169	€169	0	2024-06-21	2024-06-21	t
148	148	11	€189	€189	0	2024-06-21	2024-06-21	t
149	149	11	€165	€165	0	2024-06-21	2024-06-21	t
150	150	11	€165	€165	0	2024-06-21	2024-06-21	t
151	151	11	€145	€145	0	2024-06-21	2024-06-21	t
152	152	11	€119	€119	0	2024-06-21	2024-06-21	t
153	153	11	€149	€149	0	2024-06-21	2024-06-21	t
154	154	11	€169	€169	0	2024-06-21	2024-06-21	t
155	155	11	€169	€169	0	2024-06-21	2024-06-21	t
156	156	11	€145	€145	0	2024-06-21	2024-06-21	t
157	157	11	€165	€165	0	2024-06-21	2024-06-21	t
158	158	11	€149	€149	0	2024-06-21	2024-06-21	t
159	159	11	€149	€149	0	2024-06-21	2024-06-21	t
160	160	11	€149	€149	0	2024-06-21	2024-06-21	t
161	161	11	€145	€145	0	2024-06-21	2024-06-21	t
162	162	11	€169	€169	0	2024-06-21	2024-06-21	t
163	163	11	€165	€165	0	2024-06-21	2024-06-21	t
164	164	11	€199	€199	0	2024-06-21	2024-06-21	t
165	165	11	€145	€145	0	2024-06-21	2024-06-21	t
166	166	11	€169	€169	0	2024-06-21	2024-06-21	t
167	167	11	€199	€199	0	2024-06-21	2024-06-21	t
168	168	11	€165	€165	0	2024-06-21	2024-06-21	t
169	169	11	€179	€179	0	2024-06-21	2024-06-21	t
170	170	11	€165	€165	0	2024-06-21	2024-06-21	t
171	171	11	€139	€139	0	2024-06-21	2024-06-21	t
172	172	11	€169	€169	0	2024-06-21	2024-06-21	t
173	173	11	€189	€189	0	2024-06-21	2024-06-21	t
174	174	11	€189	€189	0	2024-06-21	2024-06-21	t
175	175	11	€199	€199	0	2024-06-21	2024-06-21	t
176	176	11	€149	€149	0	2024-06-21	2024-06-21	t
177	177	11	€149	€149	0	2024-06-21	2024-06-21	t
178	178	11	€149	€149	0	2024-06-21	2024-06-21	t
179	179	11	€189	€189	0	2024-06-21	2024-06-21	t
180	180	11	€189	€189	0	2024-06-21	2024-06-21	t
181	181	11	€145	€145	0	2024-06-21	2024-06-21	t
182	182	11	€199	€199	0	2024-06-21	2024-06-21	t
183	183	11	€169	€169	0	2024-06-21	2024-06-21	t
184	184	11	€165	€165	0	2024-06-21	2024-06-21	t
185	185	11	€149	€149	0	2024-06-21	2024-06-21	t
186	186	11	€169	€169	0	2024-06-21	2024-06-21	t
187	187	11	€145	€145	0	2024-06-21	2024-06-21	t
188	188	11	€169	€169	0	2024-06-21	2024-06-21	t
189	189	11	€169	€169	0	2024-06-21	2024-06-21	t
190	190	11	€169	€169	0	2024-06-21	2024-06-21	t
191	191	11	€209	€209	0	2024-06-21	2024-06-21	t
192	192	11	€235	€235	0	2024-06-21	2024-06-21	t
193	193	11	€199	€199	0	2024-06-21	2024-06-21	t
194	194	11	€199	€199	0	2024-06-21	2024-06-21	t
195	195	11	€279	€279	0	2024-06-21	2024-06-21	t
196	196	11	€219	€219	0	2024-06-21	2024-06-21	t
197	197	11	€139	€139	0	2024-06-21	2024-06-21	t
198	198	11	€139	€139	0	2024-06-21	2024-06-21	t
199	199	11	€199	€199	0	2024-06-21	2024-06-21	t
200	200	11	€111	€111	0	2024-06-21	2024-06-21	t
201	201	11	€119	€119	0	2024-06-21	2024-06-21	t
202	202	11	€149	€149	0	2024-06-21	2024-06-21	t
203	203	11	€139	€139	0	2024-06-21	2024-06-21	t
204	204	11	€119	€119	0	2024-06-21	2024-06-21	t
205	205	11	€179	€179	0	2024-06-21	2024-06-21	t
206	206	11	€219	€219	0	2024-06-21	2024-06-21	t
207	207	11	€199	€199	0	2024-06-21	2024-06-21	t
208	208	11	€259	€259	0	2024-06-21	2024-06-21	t
209	209	11	€235	€235	0	2024-06-21	2024-06-21	t
210	210	11	€219	€219	0	2024-06-21	2024-06-21	t
211	211	11	€149	€149	0	2024-06-21	2024-06-21	t
212	212	11	€219	€219	0	2024-06-21	2024-06-21	t
213	213	11	€139	€139	0	2024-06-21	2024-06-21	t
214	214	11	€199	€199	0	2024-06-21	2024-06-21	t
215	215	11	€209	€209	0	2024-06-21	2024-06-21	t
216	216	11	€169	€169	0	2024-06-21	2024-06-21	t
217	217	11	€169	€169	0	2024-06-21	2024-06-21	t
218	218	11	€169	€169	0	2024-06-21	2024-06-21	t
219	219	11	€149	€149	0	2024-06-21	2024-06-21	t
220	220	11	€119	€119	0	2024-06-21	2024-06-21	t
221	221	11	€149	€149	0	2024-06-21	2024-06-21	t
222	222	11	€149	€149	0	2024-06-21	2024-06-21	t
223	223	11	€149	€149	0	2024-06-21	2024-06-21	t
224	224	11	€169	€169	0	2024-06-21	2024-06-21	t
225	225	11	€149	€149	0	2024-06-21	2024-06-21	t
226	226	11	€119	€119	0	2024-06-21	2024-06-21	t
227	227	11	€135	€135	0	2024-06-21	2024-06-21	t
228	228	11	€169	€169	0	2024-06-21	2024-06-21	t
229	229	11	€169	€169	0	2024-06-21	2024-06-21	t
230	230	11	€149	€149	0	2024-06-21	2024-06-21	t
231	231	11	€135	€135	0	2024-06-21	2024-06-21	t
232	232	11	€139	€139	0	2024-06-21	2024-06-21	t
233	233	11	€169	€169	0	2024-06-21	2024-06-21	t
234	234	11	€169	€169	0	2024-06-21	2024-06-21	t
235	235	11	€149	€149	0	2024-06-21	2024-06-21	t
236	236	11	€139	€139	0	2024-06-21	2024-06-21	t
237	237	11	€139	€139	0	2024-06-21	2024-06-21	t
238	238	11	€139	€139	0	2024-06-21	2024-06-21	t
\.


--
-- Data for Name: subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategory (subcategory_id, subcategory_name, category_id, created_date, updated_date, is_active) FROM stdin;
\.


--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 20, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 259, true);


--
-- Name: product_image_product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_image_product_image_id_seq', 67865, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 14857, true);


--
-- Name: product_source_product_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_source_product_source_id_seq', 14857, true);


--
-- Name: source_price_availability_source_price_availability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_price_availability_source_price_availability_id_seq', 14857, true);


--
-- Name: source_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_source_id_seq', 20, true);


--
-- Name: subcategory_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategory_subcategory_id_seq', 1, false);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (product_image_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product_source product_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_source
    ADD CONSTRAINT product_source_pkey PRIMARY KEY (product_source_id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (source_id);


--
-- Name: source_price_availability source_price_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_price_availability
    ADD CONSTRAINT source_price_availability_pkey PRIMARY KEY (source_price_availability_id);


--
-- Name: subcategory subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id);


--
-- Name: product product_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- Name: product product_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: product_image product_image_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_source product_source_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_source
    ADD CONSTRAINT product_source_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_source product_source_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_source
    ADD CONSTRAINT product_source_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- Name: product product_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategory(subcategory_id);


--
-- Name: source source_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- Name: source_price_availability source_price_availability_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_price_availability
    ADD CONSTRAINT source_price_availability_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: source_price_availability source_price_availability_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_price_availability
    ADD CONSTRAINT source_price_availability_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- Name: subcategory subcategory_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- PostgreSQL database dump complete
--

