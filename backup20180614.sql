--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-06-14 09:42:17 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16394)
-- Name: taxon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxon (
    id integer NOT NULL,
    anc integer,
    name text,
    nreg text,
    nest text,
    eco text,
    geo text,
    doubt smallint DEFAULT 0,
    extinct smallint DEFAULT 0,
    namept text,
    nameen text,
    namezh text,
    ref text
);


ALTER TABLE public.taxon OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16402)
-- Name: taxon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxon_id_seq OWNER TO postgres;

--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 186
-- Name: taxon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxon_id_seq OWNED BY public.taxon.id;


--
-- TOC entry 2008 (class 2604 OID 16404)
-- Name: taxon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon ALTER COLUMN id SET DEFAULT nextval('public.taxon_id_seq'::regclass);


--
-- TOC entry 2129 (class 0 OID 16394)
-- Dependencies: 185
-- Data for Name: taxon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxon (id, anc, name, nreg, nest, eco, geo, doubt, extinct, namept, nameen, namezh, ref) FROM stdin;
1	\N	Vida	\N	\N	\N	\N	0	0	vida	life	生活	\N
2	1	Bacteria	\N	\N	\N	\N	0	0	bactérias	\N	\N	\N
3	1	Archaea+Eukarya	\N	\N	\N	\N	0	0	\N	\N	\N	\N
4	3	Archaea	\N	\N	\N	\N	0	0	arqueobactérias	\N	\N	\N
5	3	Eukarya	\N	\N	\N	\N	0	0	eucariontes	\N	\N	\N
6	5	Archaeplastida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
7	5	Chromalveolates	\N	\N	\N	\N	1	0	\N	\N	\N	\N
8	5	Excavates	\N	\N	\N	\N	1	0	\N	\N	\N	\N
9	5	Unikonts	\N	\N	\N	\N	1	0	\N	\N	\N	\N
10	9	Amebozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
11	9	Opisthokonts	\N	\N	\N	\N	0	0	\N	\N	\N	\N
12	11	Fungi+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
13	11	Metazoa+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
14	12	Fungi	\N	\N	\N	\N	0	0	fungos	\N	\N	\N
15	12	Nucleariidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
16	13	Ichthyosporea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
17	13	Filasterea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
19	18	Choanoflagellates	\N	\N	\N	\N	0	0	coanoflagelados	\N	\N	\N
20	18	Metazoa	\N	\N	\N	\N	0	0	animais|metazoários	animals	\N	\N
21	20	Parazoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
22	20	non-Parazoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
23	21	Placozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
24	21	Porifera	\N	\N	\N	\N	0	0	poríferos	\N	\N	\N
25	22	Mesozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
26	22	Eumetazoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
27	25	Monoblastozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
28	25	Dicyemida=Rhombozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
29	25	Orthonectida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
30	26	Radiata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
31	26	Bilateria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
32	30	Ctenophora	\N	\N	\N	\N	0	0	\N	\N	\N	\N
33	30	Cnidaria	\N	\N	\N	\N	0	0	cnidários	\N	\N	\N
34	31	Protostomia	\N	\N	\N	\N	0	0	protostômios	\N	\N	\N
35	31	Deuterostomia	\N	\N	\N	\N	0	0	deuterostômios	\N	\N	\N
36	34	Lophotrochozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
37	34	Ecdysozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
38	36	Lophophorata	\N	\N	\N	\N	1	0	\N	\N	\N	\N
39	36	Spiralia	162814	\N	\N	\N	0	0	\N	\N	\N	\N
40	38	Phoronida	14	\N	\N	\N	0	0	\N	\N	\N	\N
41	38	Brachiopoda	385	\N	\N	\N	0	0	\N	\N	\N	\N
42	38	Bryozoa	5k	\N	\N	\N	1	0	\N	\N	\N	\N
43	38	Entoprocta	150	\N	\N	\N	1	0	\N	\N	\N	\N
44	39	Platyzoa	29044	\N	\N	\N	0	0	\N	\N	\N	\N
45	39	Trochozoa	133770	\N	\N	\N	0	0	\N	\N	\N	\N
46	44	Gastrotricha	790	\N	\N	\N	0	0	\N	\N	\N	\N
47	44	Platyhelminthes	25k	\N	\N	\N	0	0	platelmintos|vermes chatos|vermes achatados	\N	\N	\N
48	44	Gnathifera	3254	\N	\N	\N	0	0	\N	\N	\N	\N
49	48	Micrognathozoa	1	\N	\N	\N	0	0	\N	\N	\N	\N
50	48	Cycliophora	3	\N	\N	\N	0	0	\N	\N	\N	\N
51	48	Gnathostomulida	100	\N	\N	\N	0	0	\N	\N	\N	\N
52	48	Acanthocephala	1150	\N	\N	\N	0	0	\N	\N	\N	\N
53	48	Rotifera	2k	\N	\N	\N	0	0	rotíferos	\N	\N	\N
54	45	Nemertea	1200	\N	\N	\N	0	0	\N	\N	\N	\N
55	45	Mollusca	115k	\N	\N	\N	0	0	moluscos	\N	\N	\N
56	45	Annelida	17k	\N	\N	\N	0	0	anelídeos	\N	\N	\N
57	56	Echiura	150	\N	\N	\N	1	0	\N	\N	\N	\N
58	56	Sipuncula	320	\N	\N	\N	1	0	\N	\N	\N	\N
59	37	"Cycloneuralia"	30616	\N	\N	\N	0	0	\N	\N	\N	\N
60	37	Panarthropoda	1001250	\N	\N	\N	0	0	\N	\N	\N	\N
61	59	Scalidophora	266	\N	\N	\N	0	0	\N	\N	\N	\N
62	59	Nematoida	30350	\N	\N	\N	0	0	\N	\N	\N	\N
63	61	Kinorhyncha	150	\N	\N	\N	0	0	\N	\N	\N	\N
64	61	Loricifera	100	\N	\N	\N	0	0	\N	\N	\N	\N
65	61	Priapulida	16	\N	\N	\N	0	0	\N	\N	\N	\N
66	62	Nematoda	30k	500k	\N	\N	0	0	nematódeos|vermes cilíndricos	\N	\N	\N
67	62	Nematomorpha	350	\N	\N	\N	0	0	\N	\N	\N	\N
68	60	Lobopodia	\N	\N	\N	\N	0	1	\N	\N	\N	\N
69	60	Onycophora	100	\N	\N	\N	0	0	onicóforos	\N	\N	\N
71	60	Arthropoda	1M	\N	\N	\N	0	0	artrópodes	\N	\N	\N
72	35	Chaetognatha	120	\N	\N	\N	0	0	\N	\N	\N	\N
73	35	Ambulacraria	7515	\N	\N	\N	0	0	\N	\N	\N	\N
74	35	Chordata	66545	\N	\N	\N	0	0	cordados	\N	\N	\N
75	73	Hemichordata	120	\N	\N	\N	0	0	hemicordados	\N	\N	\N
76	73	Acoelomorpha	393	\N	\N	\N	0	0	\N	\N	\N	\N
78	74	Urochordata=Tunicata	2500	\N	\N	\N	0	0	tunicados|urocordados	\N	\N	\N
79	74	Cephalochordata	25	\N	\N	\N	0	0	cefalocordados	\N	\N	\N
80	74	Craniata	64020	\N	\N	\N	0	0	craniados	\N	\N	\N
81	80	Myxini	20	\N	\N	\N	0	0	feiticeiras	\N	\N	\N
82	80	Vertebrata	64k	\N	\N	\N	0	0	vertebrados	\N	\N	\N
83	82	Petromyzontiformes="Agnatha"	40	\N	\N	\N	0	0	lampreias	\N	\N	\N
84	82	Gnathostomata	55180	\N	\N	\N	0	0	mandibulados	\N	\N	\N
85	84	Chondrichthyes	880-1k+	\N	\N	\N	0	0	peixes cartilaginosos	\N	\N	\N
86	84	Osteichthyes+Acanthodii	\N	\N	\N	\N	0	0	\N	\N	\N	\N
87	86	Acanthodii	\N	\N	\N	\N	0	1	\N	\N	\N	\N
88	86	Osteichthyes	54300	\N	\N	\N	0	0	peixes ósseos	\N	\N	\N
89	88	Actinopterygii	27k	\N	\N	\N	0	0	peixes de nadadeira raiada	\N	\N	\N
90	88	Sarcopterygii	27300	\N	\N	\N	0	0	peixes de nadadeira lobada	\N	\N	\N
91	90	Actinistia=Coelacanthiformes	2	\N	\N	oi(w) Ic	0	0	\N	\N	\N	\N
92	90	Rhipidistia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
93	92	Dipnoi	6	\N	清	Hs T?	0	0	\N	\N	\N	\N
94	92	Tetrapoda	27290+	\N	\N	\N	0	0	tetrápodas	\N	\N	\N
95	94	Lissamphibia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
96	94	Amniota	21825+	\N	\N	\N	0	0	amniotas	\N	\N	\N
97	95	Amphibia	5465+	\N	\N	\N	0	0	anfíbios	\N	\N	\N
98	96	Sauropsida="Reptilia"	17025	\N	\N	\N	0	0	répteis	\N	\N	\N
99	96	Synapsida	4800	\N	\N	\N	0	0	\N	\N	\N	\N
100	99	Therapsida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
101	100	Mammalia	4800	\N	\N	\N	0	0	mamíferos	mammals	\N	\N
102	98	Anapsida	300	\N	\N	\N	0	0	\N	\N	\N	\N
103	98	Diapsida=Sauria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
104	102	Chelonia=Testudines	300	\N	\N	\N	0	0	quelônios|tartarugas+cágados+jabutis	\N	\N	\N
105	103	Lepidosauromorpha	7702	\N	\N	\N	0	0	\N	\N	\N	\N
106	103	Archosauromorpha	9023+	\N	\N	\N	0	0	\N	\N	\N	\N
107	105	Rhynchocephalia=Sphenodontia	2	\N	\N	nz	0	0	tuatara	\N	\N	\N
108	105	Squamata	7700	\N	\N	\N	0	0	lagartos	\N	\N	\N
109	106	Crocodilia=Crocodylomorpha	23	\N	\N	\N	0	0	crocodilos|jacarés	\N	\N	\N
110	106	Dinosauria+Pterosauria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
111	110	Pterosauria	\N	\N	飞	\N	0	1	pterossauros	\N	\N	\N
112	110	Dinosauria	\N	\N	\N	\N	0	0	dinossauros	\N	\N	\N
113	112	Ornithischia	\N	\N	\N	\N	0	1	\N	\N	\N	\N
114	112	Saurischia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
115	114	Sauropodomorpha	\N	\N	\N	\N	0	1	\N	\N	\N	\N
116	114	Theropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
117	116	/Archaeopteryx	\N	\N	\N	\N	0	1	\N	\N	\N	\N
118	116	Aves	9k+	\N	飞!	\N	0	0	aves	\N	\N	\N
119	97	Apoda=Gymnophiona	255	\N	\N	T	0	0	cecílias	\N	\N	\N
120	97	Batrachia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
121	120	Caudata=Urodela	\N	\N	\N	\N	0	0	salamandras	\N	\N	\N
122	120	Anura=Salientia	\N	\N	化沃(外)	\N	0	0	sapos+rãs+pererecas	\N	\N	\N
123	104	Pleurodira	66	\N	\N	\N	0	0	\N	\N	\N	\N
124	104	Cryptodira	204-214+	\N	\N	\N	0	0	\N	\N	\N	\N
125	123	Chelidae	40	\N	水 15-50cm	Ms a ng	0	0	\N	\N	\N	\N
126	125	/Chelus	\N	\N	\N	Ms	0	0	matamatá	\N	\N	\N
127	125	/Chelodina	\N	\N	\N	a	0	0	\N	\N	\N	\N
128	123	Pelomedusidae+Podocnemidae	26	\N	\N	\N	0	0	\N	\N	\N	\N
129	128	Pelomedusidae	18	\N	清	F ml	0	0	\N	\N	\N	\N
130	128	Podocnemidae	8	\N	水	Ms(n) m	0	0	\N	\N	\N	\N
131	130	/Podocnemis	\N	\N	\N	\N	0	0	\N	\N	\N	\N
132	131	/Podocnemis expansa	\N	\N	<90cm	r.A r.O	0	0	\N	\N	\N	\N
133	129	/Pelusios	\N	\N	\N	F	0	0	\N	\N	\N	\N
134	124	Chelydridae	3	\N	清慢底	Mnc Sse	0	0	\N	\N	\N	\N
135	124	Chelonidae+Dermochelyidae	7	\N	\N	\N	0	0	\N	\N	\N	\N
136	124	Kinosternidae+Trionychidae+...	49	\N	\N	\N	0	0	\N	\N	\N	\N
137	124	Testudinidae+...	150+	\N	\N	\N	0	0	\N	\N	\N	\N
138	135	Cheloniidae	6	\N	海大 0,7-1,5m	T t	0	0	\N	\N	\N	\N
139	135	Dermochelyidae	1	\N	久150y+ 海很大 2,4m+ 850kg+	f	0	0	\N	\N	\N	\N
140	136	Trionychidae+Carettochelyidae	26	\N	\N	\N	0	0	\N	\N	\N	\N
141	136	Dermatemydidae+Kinosternidae	23	\N	\N	\N	0	0	\N	\N	\N	\N
142	140	Trionychidae	25	\N	清 25-130cm	MnFS	0	0	\N	\N	\N	\N
143	140	Carettochelyidae	1	\N	清 70cm	a(n) ng	0	0	\N	\N	\N	\N
144	141	Dermatemydidae	1	\N	清 65cm	xMc	0	0	\N	\N	\N	\N
145	141	Kinosternidae	22	\N	木清慢底 11-40cm	Mn-s	0	0	\N	\N	\N	\N
146	137	Emydidae	40	\N	清汢土 12-60cm	Mn-s ESFn	0	0	\N	\N	\N	\N
147	137	Testudinidae+Bataguridae	110+	\N	\N	\N	0	0	\N	\N	\N	\N
148	147	Bataguridae	65	\N	水汢土 12-75cm	McS	0	0	\N	\N	\N	\N
149	147	Testudinidae	40-50+	\N	土挖(小) 15cm-1m	T t	0	0	jabutis	\N	\N	\N
150	71	Trilobites	\N	\N	\N	\N	0	1	trilobitas	\N	\N	\N
151	71	Chelicerata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
152	71	Myriapoda	\N	\N	\N	\N	0	0	centopeias	\N	\N	\N
153	71	Hexapoda+Crustacea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
154	153	Crustacea	\N	\N	\N	\N	1	0	crustáceos	\N	\N	\N
155	153	Hexapoda	\N	\N	\N	\N	0	0	hexápodes	\N	\N	\N
156	151	Pycnogonida=Pantopoda	\N	\N	\N	\N	0	0	aranhas-do-mar	\N	\N	\N
157	151	Xiphosura	\N	\N	\N	\N	0	0	límulos|caranguejos-ferradura	\N	\N	\N
158	151	Eurypterida	\N	\N	\N	\N	0	1	escorpiões-do-mar	\N	\N	\N
159	151	Arachnida	\N	\N	\N	\N	0	0	aracnídeos	\N	\N	\N
160	152	Symphyla	\N	\N	\N	\N	0	0	\N	\N	\N	\N
161	152	Chilopoda	\N	\N	\N	\N	0	0	lacraias|lacraus|quilópodes	\N	\N	\N
162	152	Diplopoda	\N	\N	\N	\N	0	0	embuás|piolhos-de-cobra|gongolôs|diplópodes	\N	\N	\N
163	152	Pauropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
164	155	Entognatha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
165	155	Insecta+Diplura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
166	164	Collembola	6k	\N	\N	\N	0	0	colêmbolos	\N	\N	\N
167	164	Protura	205	\N	\N	\N	0	0	proturos	\N	\N	\N
168	165	Diplura	650	\N	\N	\N	0	0	dipluros	\N	\N	\N
169	165	Insecta	\N	\N	\N	\N	0	0	insetos	\N	\N	\N
170	169	Monocondylia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
171	169	Dicondylia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
172	170	Archaeognatha	255-470	\N	\N	\N	0	0	\N	\N	\N	\N
173	171	Apterygota	\N	\N	\N	\N	0	0	\N	\N	\N	\N
174	173	Monura	\N	\N	\N	\N	0	1	monuros	\N	\N	\N
175	173	Thysanura	450	\N	\N	\N	0	0	traças|traças-de-livros	\N	\N	\N
176	171	Pterygota	\N	\N	飞	\N	0	0	\N	\N	\N	\N
177	176	Paleoptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
178	176	Neoptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
179	177	Ephemeroptera	2,1k	\N	\N	\N	0	0	aleluias|efêmeras|efemerópteros	\N	\N	\N
180	177	Odonata	5-6k	\N	捕	\N	0	0	libélulas|jacintas|lavadeiras	\N	\N	\N
181	178	"Exopterygota"	\N	\N	\N	\N	1	0	\N	\N	\N	\N
182	178	Endopterygota	\N	\N	化(全)	\N	0	0	\N	\N	\N	\N
183	181	Plecoptera	3,5k	\N	\N	\N	0	0	plecópteros	\N	\N	\N
184	181	Embioptera	360	2k	\N	\N	0	0	\N	\N	\N	\N
185	181	Zoraptera	34	\N	\N	\N	0	0	\N	\N	\N	\N
186	181	Dermaptera	1,8k	\N	\N	\N	0	0	tesourinhas	\N	\N	\N
187	181	Orthoptera	20-24k	\N	植	\N	0	0	grilos+gafanhotos+esperanças	\N	\N	\N
188	181	Dictyoptera	\N	\N	\N	\N	1	0	\N	\N	\N	\N
189	181	Paraneoptera="Hemipteroids"	\N	\N	\N	\N	1	0	\N	\N	\N	\N
190	188	Mantodea	2,3k	\N	捕	\N	0	0	põe-mesa|louva-a-deus	\N	\N	\N
191	188	Phasmatodea	3k	\N	\N	\N	0	0	bicho-pau	\N	\N	\N
192	188	Notoptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
193	188	Grylloblattodea	25	\N	\N	\N	0	0	\N	\N	\N	\N
194	188	Blattaria	4k	\N	\N	\N	0	0	baratas	\N	\N	\N
195	194	Isoptera	3k	\N	\N	\N	1	0	cupins	\N	\N	\N
196	189	Psocoptera	2,6k	\N	\N	\N	0	0	\N	\N	\N	\N
197	189	Thysanoptera	4,1k	\N	\N	\N	0	0	\N	\N	\N	\N
198	189	Phthiraptera	5,6k	\N	\N	\N	0	0	\N	\N	\N	\N
199	198	"Mallophaga"	5k	\N	\N	\N	0	0	\N	\N	\N	\N
200	198	"Anoplura"	600	\N	\N	\N	0	0	piolhos	\N	\N	\N
201	189	Hemiptera	85k	\N	\N	\N	0	0	\N	\N	\N	\N
202	201	Sternorrhyncha	\N	\N	\N	\N	0	0	pulgões|afídeos	\N	\N	\N
203	201	Heteroptera+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
204	203	Auchenorrhyncha	\N	\N	\N	\N	1	0	cigarras+cigarrinhas+soldadinhos	\N	\N	\N
205	203	Heteroptera+Coleorrhyncha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
206	205	Coleorrhyncha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
207	205	Heteroptera	\N	\N	\N	\N	0	0	barbeiros|percevejos	true bugs	\N	\N
208	204	Cicadomorpha=Clypeorrhyncha=Clypeata	\N	\N	植	\N	0	0	\N	\N	\N	\N
209	204	Fulgoromorpha=Archaeorrhyncha	\N	\N	\N	\N	0	0	\N	planthoppers	\N	\N
210	208	Cicadoidea	\N	\N	\N	\N	0	0	cigarras	\N	\N	\N
211	208	Cercopoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
212	208	Membracoidea	\N	\N	\N	\N	0	0	cigarrinhas	\N	\N	\N
213	207	Enicocephalomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
214	207	non-Enicocephalomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
215	214	Dipsocoromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
216	214	non-Dipsocoromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
217	216	Gerromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
218	216	non-Gerromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
219	218	Nepomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
220	218	non-Nepomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
221	220	Leptopodomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
222	220	non-Leptopodomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
223	222	Pentatomomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
224	222	Cimicomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
225	182	Neuropterida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
226	182	Mecopterida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
227	182	Strepsiptera	300	\N	\N	\N	0	0	\N	\N	\N	\N
228	182	Hymenoptera	153k	1,15M	\N	\N	0	0	vespas+formigas+abelhas|himenópteros	\N	\N	\N
229	182	Coleoptera	350-375k	\N	\N	\N	0	0	besouros|coleópteros	\N	\N	\N
230	226	Amphiesmenoptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
231	230	Trichoptera	7,1k	\N	\N	\N	0	0	tricópteros	\N	\N	\N
232	230	Lepidoptera	120k	\N	子(木水)	\N	0	0	mariposas+borboletas|lepidópteros	\N	\N	\N
233	226	Antliophora	\N	\N	\N	\N	0	0	\N	\N	\N	\N
234	233	Protodiptera	\N	\N	\N	\N	0	1	\N	\N	\N	\N
235	233	Mecoptera	550	\N	\N	\N	0	0	\N	\N	\N	\N
236	233	Siphonaptera	2,4k	\N	寄	\N	0	0	pulgas	\N	\N	\N
238	225	Raphidioptera	210	\N	\N	\N	0	0	\N	\N	\N	\N
239	225	Megaloptera	300	\N	捕	\N	0	0	\N	\N	\N	\N
240	225	Neuroptera	4,5-6k	\N	捕	\N	0	0	formiga-leão	\N	\N	\N
241	108	Iguania	\N	\N	\N	\N	0	0	\N	\N	\N	\N
242	108	Scleroglossa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
243	241	Chamaeleonidae	160	\N	采林-漠木!土	qF mEsSs-k >h cal fl	0	0	camaleões	\N	\N	\N
244	241	"Agamidae"	300	\N	漠-林采	q!f(1sp)F!S!a!Es	0	0	\N	\N	\N	\N
245	241	Iguanidae	924+	\N	\N	\N	0	0	\N	\N	\N	\N
246	242	Amphisbaenia	130	\N	挖舌(分)	T sT	0	0	anfisbena|cobra-cega|cobra-de-duas-cabeças	\N	\N	\N
247	242	Serpentes	2828	\N	舌(分)	\N	0	0	serpentes|cobras|ofídeos	\N	\N	\N
248	242	G+S+A	\N	\N	\N	\N	0	0	\N	\N	\N	\N
249	248	Gekkota	\N	\N	\N	\N	0	0	lagartixas	\N	\N	\N
250	248	Autarchoglossa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
251	250	Scincomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
252	250	Anguimorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
253	251	Scincoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
254	251	Lacertoidea	\N	\N	舌(分)	\N	0	0	\N	\N	\N	\N
255	252	Platynota	\N	\N	舌(分)	\N	0	0	\N	\N	\N	\N
256	252	Diploglossa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
257	256	Shinisauridae	1	\N	汢清鱼虫 25cm	ch	1	0	\N	\N	\N	\N
258	256	Xenosauridae	6	\N	肉虫胎?孕?汢-半漠	Mc	0	0	\N	\N	\N	\N
259	256	Anguidae	95	\N	肉虫众(无支)卵孕漠-林土!半挖!木 10cm-1,5m	Mn-s E om ch(s)	0	0	\N	\N	\N	\N
260	256	Anniellidae	2	\N	无支	cal	1	0	\N	\N	\N	\N
261	255	Helodermatidae	2	\N	卵肉慢毒半漠!无尾 25-40cm	us(sw) x-gu	0	0	\N	\N	\N	\N
262	255	Varanidae+Lanthanotidae	74	\N	\N	\N	0	0	\N	\N	\N	\N
263	262	Lanthanotidae	1	\N	挖汢夜目(小)支(小)卵 20cm	b	0	0	\N	\N	\N	\N
264	262	Varanidae	73	\N	虫果肉!木汢土!卵 20cm-3m,<75kg	FScs ml I png a	0	0	\N	\N	\N	\N
265	209	Fulgoridae	125g	\N	\N	\N	0	0	\N	\N	\N	\N
266	209	Derbidae	~1700	\N	植(成)菌(子)专(众成)	T!sTt	0	0	\N	\N	\N	\N
267	209	Cixiidae	2000+	\N	\N	G	0	0	\N	\N	\N	\N
268	253	Scincidae	1,2k	\N	日!肉植虫!挖!土!木水漠山草 5-20cm	\N	0	0	\N	\N	\N	\N
269	253	Cordylidae+Gerrhosauridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
270	269	Cordylidae	~70	\N	日虫土!石!挖(1sp)朴(1sp)尾(朿)!小-中孕!卵几无支	Fss	0	0	\N	\N	\N	\N
271	269	Gerrhosauridae	\N	\N	石-沙卵! 10-70cm	Fss m	0	0	\N	\N	\N	\N
272	254	Xantusiidae	23	\N	孕!日虫!植专(众) 4-12cm	Mc-n(s)	0	0	\N	night lizards	\N	\N
273	254	L+T+G	\N	\N	\N	\N	0	0	\N	\N	\N	\N
274	273	Lacertidae	300+	\N	小!-大虫!米尾(长)厷!孤(几)孕(3sp) <9-46cm	EFS	0	0	\N	wall lizards|true lizards|lacertas	\N	\N
275	273	Teiioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
276	275	Teiidae	230	\N	孤(众)日肉!虫!植卵	M	0	0	\N	\N	\N	\N
277	275	Gymnophthalmidae	250+	\N	众(支后小)漠山林(土泽)夜天虫卵	TMc-s	0	0	\N	spectacled lizards|microteiids	\N	\N
278	276	/Ameiva	\N	\N	\N	\N	0	0	\N	\N	\N	\N
279	276	/Tupinambis	7	\N	<2m	Ms pa	0	0	teiús|jacurarus	tegus	\N	\N
280	122	Bombinanura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
281	122	Leiopelmatidae+Ascaphidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
282	281	Leiopelmatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
283	281	Ascaphidae	\N	\N	流沃(内)	Mn	0	0	\N	\N	\N	\N
284	280	Bombinatoridae+Discoglossidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
285	280	Pipanura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
286	284	Bombinatoridae	10	\N	水! 7cm	ES ph b	0	0	\N	\N	\N	\N
287	284	Discoglossidae=Alytidae	11	\N	土水	EFnw	0	0	\N	\N	\N	\N
288	285	Pipoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
289	285	Acosmanura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
290	288	Pipidae	30	\N	水无舌 4-19cm	Ms(T) Fss	0	0	\N	\N	\N	\N
291	288	Rhinophrynidae	1	\N	挖舌(não enrola) 8cm	Mc-n(s)	0	0	\N	\N	\N	\N
292	289	Pelobatoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
293	289	Neobatrachia	5k+	\N	\N	\N	0	0	\N	\N	\N	\N
294	292	Scaphiopodidae	7	\N	漠!挖支(后坚)	x(n)-ca(s)	0	0	\N	\N	\N	\N
295	292	M+P+P	\N	\N	\N	\N	0	0	\N	\N	\N	\N
296	295	Megophryidae	70-100	\N	林山 2-12,5cm	qSse I-ph b	0	0	\N	\N	\N	\N
297	295	Pelodytidae	3	\N	挖 5cm	Esw cau Mn(†)	0	0	\N	\N	\N	\N
298	295	Pelobatidae	4	\N	挖!(土沙)暂(子:杀) <10cm	E meFnwSw	0	0	\N	\N	\N	\N
299	293	Heleophrynidae	7	\N	水山石平 <6cm	fs	0	0	\N	ghost frogs	\N	\N
300	293	Sooglossoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
301	300	Sooglossoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
302	300	Myobatrachoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
303	302	Myobatrachoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
304	302	Ranoidea+Hyloidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
305	304	Ranoidea	\N	\N	几无化	\N	0	0	\N	\N	\N	\N
306	304	Hyloidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
307	301	Sooglossidae	4	\N	朽石无化(1sp) 4cm	y	0	0	\N	\N	\N	\N
308	301	Nasikabatrachidae	1	\N	挖虫(Isoptera)山	i(w)	0	0	\N	purple frog	\N	\N
309	303	Myobatrachidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
310	303	Calyptocephalellidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
311	101	Prototheria	5	\N	卵	\N	0	0	\N	\N	\N	\N
312	311	Monotremata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
313	101	Theria	4k+	\N	孕	\N	0	0	\N	\N	\N	\N
314	313	Metatheria	323	\N	\N	\N	0	0	\N	\N	\N	\N
315	313	Eutheria	3,7k+	\N	\N	\N	0	0	\N	\N	\N	\N
316	314	Marsupialia	\N	\N	\N	\N	0	0	marsupiais	\N	\N	\N
317	315	Placentalia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
319	312	Tachyglossa	4	\N	土虫	a	0	0	equidna	\N	\N	\N
320	316	Australidelphia	214	\N	\N	\N	0	0	\N	\N	\N	\N
321	316	Ameridelphia	109	\N	\N	\N	0	0	\N	\N	\N	\N
322	320	Microbiotheria	1	\N	25g	N	0	0	\N	\N	\N	\N
323	320	Dasyuromorphia	71	\N	5g-20kg	a	0	0	\N	\N	\N	\N
324	323	/Thylacinus	6	\N	肉	a ng	0	1	tigre-da-Tasmânia	Tasmanian tiger|Tasmanian wolf	\N	\N
325	323	/Sarcophilus	1	\N	肉捕死	ta	0	0	diabo-da-Tasmânia	Tasmanian devil	\N	\N
326	320	Peramelemorphia	20	\N	100g-5kg	a	0	0	\N	\N	\N	\N
327	320	Notoryctemorphia	2	\N	挖 50kg	a	0	0	\N	marsupial moles	\N	\N
328	320	Diprotodontia	120	\N	12g-90kg	a! nz	0	0	\N	\N	\N	\N
329	328	Vombatiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
330	329	Phascolarctidae	1	\N	\N	\N	0	0	coala	koala	\N	\N
331	329	Vombatidae	3	\N	\N	\N	0	0	vombates	wombats	\N	\N
332	328	Phalangeriformes	\N	\N	木	\N	0	0	possums	possums	\N	\N
333	328	Macropodiformes	\N	\N	\N	\N	0	0	cangurus	kangaroos	\N	\N
334	321	Paucituberculata	6	\N	15-40g	N	0	0	\N	\N	\N	\N
335	321	Didelphimorphia	103	\N	大(捕Serpentes...) 20g-6kg	N!Mn	0	0	\N	\N	\N	\N
336	305	Rhacophoridae	\N	\N	翔	b	0	0	sapos planadores	gliding frogs	\N	\N
337	317	Atlantogenata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
338	317	Boreoeutheria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
339	337	Xenarthra	30	\N	\N	\N	0	0	\N	\N	\N	\N
340	337	Afrotheria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
341	339	Pilosa	10	\N	\N	\N	0	0	\N	\N	\N	\N
342	339	Cingulata	20	\N	\N	\N	0	0	tatus	\N	\N	\N
343	340	Afroinsectiphilia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
344	340	Paenungulata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
345	343	Macroscelidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
346	343	Afrosoricida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
347	343	Tubulidentata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
348	346	Chrysochloridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
349	346	Tenrecidae	34	\N	\N	F m ma	0	0	\N	\N	\N	\N
350	344	Hyracoidea	7	\N	\N	\N	1	0	\N	\N	\N	\N
351	344	Sirenia+Proboscidea	\N	\N	植	\N	0	0	\N	\N	\N	\N
352	351	Sirenia	4	\N	水	\N	0	0	peixe-boi	manatee	\N	\N
353	351	Proboscidea	3	\N	\N	\N	0	0	elefantes	elephant	\N	\N
354	341	Folivora	6	\N	植木	\N	0	0	bicho-preguiça	sloth	\N	\N
355	341	Vermilingua	4	\N	土虫	\N	0	0	tamanduá	\N	\N	\N
356	338	Euarchontoglires	\N	\N	\N	\N	0	0	\N	\N	\N	\N
357	338	Laurasiatheria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
358	356	Glires	\N	\N	\N	\N	0	0	\N	\N	\N	\N
359	356	Euarchonta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
360	358	Lagomorpha	\N	\N	\N	\N	0	0	coelhos+lebres	\N	\N	\N
361	358	Rodentia	\N	\N	\N	\N	0	0	roedores	rodents	\N	\N
362	359	Scandentia	20	\N	\N	\N	0	0	musaranhos-arborícolas	\N	\N	\N
363	359	Primatomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
364	363	Dermoptera	2	\N	翔	\N	0	0	colugos|lêmures-voadores	\N	\N	\N
365	363	Primates	437	\N	\N	\N	0	0	primatas	primates	\N	\N
366	357	Eulipotyphla="Insectivora"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
367	357	Ferungulata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
368	367	Cetartiodactyla	\N	\N	\N	\N	0	0	\N	\N	\N	\N
369	367	Pegasoferae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
370	369	Chiroptera	955	\N	飞	\N	0	0	\N	\N	\N	\N
371	369	Zooamata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
372	371	Perissodactyla	\N	\N	\N	\N	0	0	\N	\N	\N	\N
373	371	Ferae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
374	373	Pholidota	7	\N	夜虫(专Formicidae|Isoptera)	TFS	0	0	pangolins	pangolins|scaly anteaters	\N	\N
375	373	Carnivora	\N	\N	肉!(捕)	\N	0	0	carnívoros	carnivores	\N	\N
376	352	Dugongidae	1	\N	\N	S	0	0	\N	\N	\N	\N
377	352	Trichechidae	3	\N	社海清	M	0	0	\N	\N	\N	\N
378	353	Elephantiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
379	378	Elephantidae	3	\N	社	\N	0	0	\N	\N	\N	\N
380	372	Hippomorpha	7	\N	\N	\N	0	0	\N	\N	\N	\N
381	380	Equidae	7	\N	社	\N	0	0	\N	\N	\N	\N
382	372	Ceratomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
383	382	Tapiridae	4	\N	\N	\N	0	0	anta|tapir	\N	\N	\N
384	382	Rhinocerotidae	5	\N	\N	\N	0	0	rinocerontes	\N	\N	\N
385	368	Tylopoda	6	\N	\N	\N	1	0	\N	\N	\N	\N
386	385	Camelidae	6	\N	\N	\N	0	0	\N	\N	\N	\N
387	386	Lamini	\N	\N	\N	\N	0	0	lhamas	\N	\N	\N
388	386	Camelini	\N	\N	\N	\N	0	0	camelos	\N	\N	\N
389	368	Cetruminantia+Suina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
390	389	Suina	22	\N	杂社	\N	0	0	porcos+queixadas+caititus+javalis	pigs	\N	\N
391	390	Suidae	16-18	\N	\N	\N	0	0	porcos+javalis	\N	\N	\N
392	390	Tayassuidae	4	\N	\N	\N	0	0	queixadas+caititus	\N	\N	\N
393	389	Cetruminantia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
394	393	Cetancodontamorpha	92	\N	\N	\N	0	0	\N	\N	\N	\N
395	394	Cetancodonta	92	\N	\N	\N	0	0	\N	\N	\N	\N
396	395	Hippopotamidae	2	\N	社汢	\N	0	0	hipopótamos	\N	\N	\N
397	395	Cetacea	90	\N	\N	\N	0	0	cetáceos	cetaceans	\N	\N
400	393	Ruminantia	222	\N	植	\N	0	0	ruminantes	\N	\N	\N
401	400	Tragulina	10	\N	\N	\N	0	0	\N	\N	\N	\N
402	401	Tragulidae	10	\N	林	\N	0	0	\N	\N	\N	\N
403	400	Pecora	212	\N	\N	\N	0	0	\N	\N	\N	\N
404	403	Antilocapridae	1	\N	很快 30-50km/h! <96km/h	Mn	0	0	\N	\N	\N	\N
405	403	Giraffidae	2	\N	\N	\N	0	0	girafas	\N	\N	\N
406	403	Moschidae	7	\N	\N	\N	0	0	\N	\N	\N	\N
407	403	Cervidae	62	\N	\N	\N	0	0	cervos|veados|alces	deer	\N	\N
408	403	Bovidae	140	\N	社	\N	0	0	\N	\N	\N	\N
409	375	Caniformia	164	\N	\N	\N	0	0	\N	\N	\N	\N
410	375	Feliformia	123	\N	\N	\N	0	0	\N	\N	\N	\N
412	409	Arctoidea	127	\N	\N	\N	0	0	\N	\N	\N	\N
413	412	Ursoidea	8	\N	\N	\N	0	0	ursos	bears	\N	\N
414	413	Ursidae	8	\N	肉!植	\N	0	0	ursos	bears	\N	\N
415	412	Pinnipedia	34	\N	汢	\N	0	0	\N	\N	\N	\N
416	412	Musteloidea	85	\N	\N	\N	0	0	\N	\N	\N	\N
417	415	Odobenidae	1	\N	\N	\N	0	0	morsas	walrus	\N	\N
418	415	Otariidae	14	\N	\N	\N	0	0	leões-marinhos+lobos-marinhos	eared seals	\N	\N
419	415	Phocidae	19	\N	\N	\N	0	0	focas	true seals|earless seals	\N	\N
420	416	Ailuridae	1	\N	\N	\N	0	0	\N	\N	\N	\N
421	416	Mephitidae	10	\N	\N	\N	0	0	\N	\N	\N	\N
422	416	Mustelidae	55	\N	\N	\N	0	0	\N	\N	\N	\N
423	416	Procyonidae	19	\N	\N	\N	0	0	\N	\N	\N	\N
424	410	Nandiniidae	1	\N	\N	\N	0	0	\N	\N	\N	\N
425	410	Feloidea	42	\N	\N	\N	0	0	\N	\N	\N	\N
426	410	Viverroidea	80	\N	\N	\N	0	0	\N	\N	\N	\N
427	425	Prinonodontidae	2	\N	\N	\N	0	0	\N	\N	\N	\N
428	425	Felidae	40	\N	\N	\N	0	0	gatos	cats	\N	\N
429	426	Viverridae	35	\N	\N	\N	0	0	\N	\N	\N	\N
430	426	Herpestoidea	45	\N	\N	\N	0	0	\N	\N	\N	\N
431	430	Hyaenidae	4	\N	兵	\N	0	0	hienas	\N	\N	\N
432	430	Eupleridae	8	\N	\N	\N	0	0	\N	\N	\N	\N
433	430	Herpestidae	33	\N	\N	\N	0	0	\N	\N	\N	\N
434	370	Megachiroptera	186	\N	大	\N	0	0	raposas-voadoras	\N	\N	\N
435	370	Microchiroptera	769	\N	小	\N	0	0	morcegos	bats	\N	\N
436	435	Emballonuroidea	51	\N	\N	\N	0	0	\N	\N	\N	\N
437	435	non-Emballonuroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
438	437	R+R	\N	\N	\N	\N	0	0	\N	\N	\N	\N
439	437	non-RR	\N	\N	\N	\N	0	0	\N	\N	\N	\N
440	438	Rhinopomatoidea	5	\N	\N	\N	0	0	\N	\N	\N	\N
441	438	Rhinolophoidea	155	\N	\N	\N	0	0	\N	\N	\N	\N
442	439	Noctilionoidea	150	\N	\N	\N	0	0	\N	\N	\N	\N
443	439	N+M+V	\N	\N	\N	\N	0	0	\N	\N	\N	\N
444	443	Nataloidea	12	\N	\N	\N	0	0	\N	\N	\N	\N
445	443	M+V	\N	\N	\N	\N	0	0	\N	\N	\N	\N
446	445	Molossoidea	82	\N	\N	\N	0	0	\N	\N	\N	\N
447	445	Vespertilionoidea	314	\N	\N	\N	0	0	\N	\N	\N	\N
448	365	Strepsirrhini	129	\N	\N	\N	0	0	\N	\N	\N	\N
449	365	Haplorrhini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
450	449	Tarsii	10	\N	\N	\N	0	0	\N	\N	\N	\N
451	449	Anthropoidea=Simiiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
452	451	Catarrhini	159	\N	\N	\N	0	0	\N	\N	\N	\N
453	451	Platyrrhini	139	\N	\N	\N	0	0	\N	\N	\N	\N
454	453	Callitrichidae	42	\N	\N	\N	0	0	\N	\N	\N	\N
455	453	Cebidae	17	\N	\N	\N	0	0	\N	\N	\N	\N
457	453	Pitheciidae	42	\N	\N	\N	0	0	\N	\N	\N	\N
458	453	Atelidae	28	\N	\N	\N	0	0	\N	\N	\N	\N
459	452	Cercopithecidae	135	\N	\N	\N	0	0	\N	\N	\N	\N
462	460	Hominidae	7	\N	\N	\N	0	0	\N	\N	\N	\N
463	360	Ochotonidae	30	\N	\N	\N	0	0	\N	pikas	\N	\N
464	360	Leporidae	60	\N	挖	\N	0	0	coelhos+lebres	\N	\N	\N
465	361	Hystricomorpha	352	\N	\N	\N	0	0	\N	\N	\N	\N
466	361	Sciuromorpha	315	\N	\N	\N	0	0	\N	\N	\N	\N
467	361	A+C+M	\N	\N	\N	\N	0	0	\N	\N	\N	\N
468	465	Ctenodactylidae	5	\N	\N	\N	0	0	\N	\N	\N	\N
469	465	Hystricognathi	347	\N	\N	\N	0	0	\N	\N	\N	\N
470	469	Hystricidae	11	\N	土大皮(朿)	\N	0	0	\N	\N	\N	\N
471	469	Bathyergomorpha	22	\N	\N	\N	0	0	\N	\N	\N	\N
472	469	Phiomorpha	25	\N	\N	V	0	0	\N	\N	\N	\N
473	469	Caviomorpha	289	\N	\N	Ms!Mn	0	0	\N	\N	\N	\N
474	466	Gliridae	29	\N	翔	\N	0	0	esquilos-voadores	\N	\N	\N
475	466	Aplodontiidae+Sciuridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
476	475	Aplodontiidae	1	\N	\N	\N	0	0	\N	\N	\N	\N
477	475	Sciuridae	285	\N	\N	\N	0	0	esquilos	squirrels	\N	\N
478	477	/Cynomys	\N	\N	挖	\N	0	0	\N	\N	\N	\N
479	467	Anomaluromorpha	9	\N	\N	\N	0	0	\N	\N	\N	\N
480	467	Castorimorpha	88	\N	\N	\N	0	0	\N	\N	\N	\N
481	467	Myomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
482	481	Myodonta	1463	\N	\N	\N	0	0	\N	\N	\N	\N
483	479	Pedetidae	2	\N	\N	\N	0	0	\N	\N	\N	\N
484	479	Anomaluroidae	7	\N	\N	\N	0	0	\N	\N	\N	\N
485	480	Castoridae	2	\N	水	\N	0	0	castores	\N	\N	\N
486	480	Geomyoidea	86	\N	\N	\N	0	0	\N	\N	\N	\N
487	482	Dipodoidea	50+	\N	\N	\N	0	0	\N	\N	\N	\N
488	482	Muroidea	1413	\N	\N	\N	0	0	\N	\N	\N	\N
489	488	Spalacidae	37	\N	\N	\N	0	0	\N	\N	\N	\N
490	488	Eumuroida	1376	\N	\N	\N	0	0	\N	\N	\N	\N
491	488	Platacanthomyidae	2	\N	\N	\N	0	0	\N	\N	\N	\N
492	490	Calomyscidae	8	\N	\N	\N	0	0	\N	\N	\N	\N
493	490	Nesomyidae	68	\N	\N	\N	0	0	\N	\N	\N	\N
494	490	Cricetidae	600	\N	\N	\N	0	0	hamsters+lemmings+ratos-do-novo-mundo	\N	\N	\N
495	490	Muridae	700	\N	\N	\N	0	0	gerbis+ratos-do-velho-mundo	\N	\N	\N
496	118	Palaeognathae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
497	496	Notopalaeognathae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
498	497	non-Rheiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
499	498	Tinamiformes+Dinornithiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
500	499	Tinamiformes	\N	\N	\N	\N	0	0	\N	tinamous	\N	\N
501	499	Dinornithiformes	\N	\N	\N	\N	0	1	\N	moa	\N	\N
502	496	Struthioniformes	2	\N	\N	\N	0	0	avestruz	ostriches	\N	\N
503	497	Rheiformes	3	\N	\N	Ms	0	0	ema	\N	\N	\N
504	498	Novaeratitae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
505	504	Apterygiformes+Aepyornithiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
506	505	Apterygiformes	5	\N	\N	nz	0	0	kiwis	kiwis	\N	\N
507	505	Aepyornithiformes	\N	\N	\N	\N	0	1	\N	elephant bird	\N	\N
508	504	Casuariiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
509	508	Casuariidae	\N	\N	\N	\N	0	0	casuar	\N	\N	\N
510	508	Dromaiidae	\N	\N	\N	\N	0	0	emu	\N	\N	\N
511	500	Tinamidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
512	511	Nothurinae	18	\N	开	Ms	0	0	\N	\N	\N	\N
513	511	Tinaminae	29	\N	林	NMcs	0	0	\N	\N	\N	\N
514	118	Neognathae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
515	514	Galloanserae	\N	\N	\N	\N	0	0	\N	fowl	\N	\N
516	514	Neoaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
517	515	Galliformes	250+	\N	迁定仅社	\N	0	0	galináceos	gamefowl|landfowl	\N	\N
518	515	Anseriformes	161	\N	水杂迁(众) 30cm-1,8m 200g-20kg	\N	0	0	patos+gansos+cisnes	\N	\N	\N
519	516	Strisores	\N	\N	\N	\N	0	0	\N	\N	\N	\N
520	516	Columbaves+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
521	520	Columbaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
522	520	Gruiformes+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
523	522	Gruiformes	150+	\N	\N	\N	0	0	carão+jacamins+carquejas+saracuras+grous+...	rails+cranes	\N	\N
524	522	Aequorlitornithes+Inopinaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
525	524	Aequorlitornithes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
526	524	Inopinaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
527	519	Caprimulgiformes	\N	\N	夜虫!果	\N	0	0	(bacuraus|curiangos)+urutaus+...	nightjars+potoos+...	\N	\N
528	519	Apodiformes	450	\N	\N	\N	0	0	\N	\N	\N	\N
529	528	Apodidae	\N	\N	\N	\N	0	0	andorinhões	swifts	\N	\N
530	528	Hemiprocnidae	4	\N	\N	i Sse I ng is	0	0	\N	treeswifts	\N	\N
531	528	Trochilidae	322	\N	甘伏(torpor) 5-23cm <2g-24g <80km/h	M ak-tf	0	0	beija-flor|colibri	hummingbirds	\N	\N
532	527	Steatornithidae	1	\N	夜果西(交洞)回	Ms(n) tr	0	0	guácharos	oilbirds	\N	\N
533	527	Aegothelidae	10	\N	\N	ng! a im nc	0	0	\N	owlet-nightjars	\N	\N
534	527	Podargidae	15	\N	\N	i Ssw a	0	0	\N	frogmouths	\N	\N
535	527	Nyctibiidae	5	\N	\N	\N	0	0	urutaus	potoos	\N	\N
460	452	Hominoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
461	460	Hylobatidae	17	\N	\N	Sse I b	0	0	gibões	gibbons	\N	\N
536	527	Caprimulgidae	~100	\N	夜夕虫	G	0	0	curiangos|bacuraus	nightjars+nighthawks	\N	\N
537	521	Otidimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
538	521	Columbimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
539	537	Musophagiformes	\N	\N	\N	\N	0	0	\N	turacos	\N	\N
540	537	Otidiformes+Cuculiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
541	540	Otidiformes	\N	\N	\N	\N	0	0	\N	bustards	\N	\N
542	540	Cuculiformes	\N	\N	\N	\N	0	0	cucos	cuckoos	\N	\N
543	538	Columbiformes	310	\N	\N	\N	0	0	pombos|pombas	pigeons|doves	\N	\N
544	538	Mesitornithiformes+Pteroclidiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
545	544	Mesitornithiformes	\N	\N	\N	\N	0	0	\N	mesites	\N	\N
546	544	Pteroclidiformes	\N	\N	\N	\N	0	0	\N	sandgrouse	\N	\N
547	525	Mirandornithes+Charadriiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
548	547	Mirandornithes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
549	547	Charadriiformes	~350	\N	\N	\N	0	0	gaivotas+...	waders+...	\N	\N
550	548	Phoenicopteriformes	6	\N	\N	\N	0	0	flamingos	flamingos	\N	\N
551	548	Podicipediformes	22	\N	\N	\N	0	0	mergulhões	grebes	\N	\N
552	525	Eurypygimorphae+Aequornithes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
553	552	Eurypygimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
554	552	Aequornithes	\N	\N	\N	\N	0	0	\N	waterbirds	\N	\N
555	553	Phaethontiformes	\N	\N	\N	\N	0	0	\N	tropicbirds	\N	\N
556	553	Eurypygiformes	\N	\N	\N	\N	0	0	(pavãozinho-do-pará|pavão-papa-moscas)+...	sunbittern+kagu	\N	\N
557	526	Opisthocomiformes	1	\N	\N	Ms(n)	0	0	cigana|jacu-cigano	hoatzin	\N	\N
558	526	Telluraves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
559	558	Afroaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
560	558	Australaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
561	559	Accipitrimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
562	559	non-Accipitrimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
565	562	Strigiformes	\N	\N	\N	\N	0	0	corujas	owls	\N	\N
566	562	Coraciimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
567	566	Coliidae	\N	\N	\N	\N	0	0	\N	mouse birds	\N	\N
568	566	Cavitaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
569	568	Leptosomatiformes	\N	\N	\N	\N	0	0	\N	cuckoo roller	\N	\N
570	568	Eucavitaves	\N	\N	\N	\N	0	0	\N	\N	\N	\N
571	570	Trogoniformes	\N	\N	\N	\N	0	0	\N	trogons	\N	\N
572	570	Picocoraciae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
573	572	Bucerotiformes	\N	\N	\N	\N	0	0	\N	hornbills	\N	\N
574	572	Coraciiformes+Piciformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
575	574	Coraciiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
576	574	Piciformes	450+	\N	\N	\N	0	0	\N	\N	\N	\N
577	576	Galbuli	\N	\N	\N	\N	0	0	\N	\N	\N	\N
578	576	Pici	\N	\N	\N	\N	0	0	\N	\N	\N	\N
579	577	Galbulidae	18	\N	\N	x-Ms	0	0	arirambas	jacamars	\N	\N
580	577	Bucconidae	38	\N	\N	x-Ms	0	0	bico-de-brasa+joão-bobo+...	puffbirds	\N	\N
581	578	Ramphastides	~200	\N	\N	\N	0	0	tucanos	toucans+barbets	\N	\N
582	578	Picides	~120	\N	\N	\N	0	0	pica-paus	woodpeckers+honeyguides	\N	\N
583	560	Cariamiformes=Cariamae	\N	\N	70-90cm	\N	0	0	seriemas	\N	\N	\N
584	583	Cariamidae	\N	\N	\N	\N	0	0	seriemas	\N	\N	\N
585	583	Phorusrhacids	\N	\N	肉不飞 1-3m	\N	0	1	\N	terror birds	\N	\N
586	583	Eufalconimorphae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
587	586	Falconiformes	60	\N	捕日	\N	0	0	falcões	falcons	\N	\N
588	587	Falconidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
589	588	Falconinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
590	588	Polyborinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
591	586	Psittacopasserae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
592	591	Psittaciformes	393	\N	\N	\N	0	0	araras+papagaios+periquitos+maritacas+cacatuas+...	macaws+parrots+parakeets+cockatoos+...	\N	\N
594	228	Xyelidae	<50	\N	植(子)	Hn!N	0	0	\N	\N	\N	\N
595	228	non-Xyelidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
596	595	Tenthredinoidea	7k	\N	植(子)	\N	0	0	\N	\N	\N	\N
597	595	non-Tenthredinoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
598	597	Pamphilioidea=Megalodontoidea	250	\N	植(子)	tMnES	0	0	\N	\N	\N	\N
599	597	non-Pamphilioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
600	599	Cephoidea	100	\N	植(子)	ES	0	0	\N	stem sawflies	\N	\N
601	599	non-Cephoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
602	601	Anaxyelidae	1	\N	植(子)	\N	0	0	\N	\N	\N	\N
603	601	non-Anaxyelidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
604	603	Siricidae	150	\N	植(子)	\N	0	0	\N	horntails|wood wasps	\N	\N
605	603	non-Siricidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
606	605	Xiphydrioidea	120	\N	\N	Hn!N	0	0	\N	wood wasps	\N	\N
607	605	Vespina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
608	607	Orussoidea	70	\N	寄	\N	0	0	\N	parasitic wood wasps	\N	\N
609	607	Apocrita	\N	\N	身(cintura fina=pecíolo)	\N	0	0	\N	\N	\N	\N
610	609	Roproniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
611	609	Stephanoidea	323	\N	林!寄 0,3-10cm	GT!	0	0	\N	\N	\N	\N
612	609	Diaprioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
613	612	Maamingidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
614	612	non-Maamingidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
615	614	Austroniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
616	614	Diapriidae	2,3k	4k	寄(Diptera|Formicidae|Coleoptera) 2-4mm! <8mm	G	0	0	\N	\N	\N	\N
617	614	Monomachidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
618	609	Proctotrupomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
619	618	C+M+P	\N	\N	\N	\N	0	0	\N	\N	\N	\N
620	619	Platygastroidea	4k	\N	寄	\N	0	0	\N	\N	\N	\N
621	619	Chalcidoidea+Mymarommatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
622	621	Chalcidoidea	22k	500k	寄!植很小! >0,13mm	\N	0	0	\N	\N	\N	\N
623	621	Mymarommatidae	10	\N	寄? 0,3mm!	G	0	0	\N	\N	\N	\N
624	618	Cynipoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
625	624	Cynipoidea	3k	\N	寄!植	\N	0	0	\N	\N	\N	\N
626	624	Heloridae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
627	626	Heloridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
628	626	P+P+V	\N	\N	\N	\N	0	0	\N	\N	\N	\N
629	628	Pelecinidae	3	\N	寄(larvas de Scarabaeidae no solo) <7cm	M	0	0	\N	\N	\N	\N
630	628	Vanhorniidae	5	\N	寄(Eucnemidae)	MnS	0	0	\N	\N	\N	\N
631	628	Proctotrupidae	\N	\N	开泽 3,1-7,4mm	\N	0	0	\N	\N	\N	\N
632	609	Evanioidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
633	632	Trigonaloidea	90	\N	寄	G	0	0	\N	\N	\N	\N
634	632	Megalyroidea	49	\N	寄 2,9-22mm	Hs a! m!	0	0	\N	\N	\N	\N
635	632	Ceraphronoidea+Evanioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
636	635	Ceraphronoidea	800	\N	寄!	\N	0	0	\N	\N	\N	\N
637	635	Evanioidea	1150+	\N	寄	\N	0	0	\N	\N	\N	\N
748	747	Parabasalids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
638	609	Ichneumonoidea+Aculeata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
639	638	Ichneumonoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
640	638	Aculeata	\N	\N	朿	\N	0	0	\N	\N	\N	\N
641	639	Braconidae	17k	40k	寄! 1-40mm	\N	0	0	\N	\N	\N	\N
642	639	Ichneumonidae	24k+	60-100k+	寄 0,3-13cm	\N	0	0	\N	\N	\N	\N
643	640	Chrysidoidea=Bethyloidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
644	640	Vespoidea+Spheciformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
645	644	Vespoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
646	644	Spheciformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
647	643	Plumariidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
648	643	non-Plumariidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
649	648	Scolebythidae	\N	\N	寄(Coleoptera)	TMF a	0	0	\N	\N	\N	\N
650	648	non-Scolebythidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
651	650	Bethylidae+Chrysididae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
652	651	Bethylidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
653	651	Chrysididae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
654	650	D+E+S	\N	\N	\N	\N	0	0	\N	\N	\N	\N
655	654	Sclerogibbidae	\N	\N	寄(Embioptera)	\N	0	0	\N	\N	\N	\N
656	654	Embolemidae+Dryinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
657	656	Embolemidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
658	656	Dryinidae	1,4k	\N	寄(Hemiptera) <1cm	G	0	0	\N	\N	\N	\N
659	646	Heterogynaidae	8	\N	漠!林(1sp)女(不飞)!日!夜(1sp) 1,5-5mm	m bo om me(e)	0	0	\N	\N	\N	\N
660	646	non-Heterogynaidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
661	660	Ampulicidae	170	\N	寄(Blattaria)	T!	0	0	\N	\N	\N	\N
662	660	non-Ampulicidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
663	662	Sphecidae	\N	\N	捕	\N	0	0	\N	\N	\N	\N
664	662	Crabronidae+Apoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
665	664	Crabronidae	9k	\N	\N	\N	0	0	\N	\N	\N	\N
666	664	Apoidea	\N	\N	甘粉(子)	\N	0	0	\N	\N	\N	\N
667	645	Sierolomorphidae	~10	\N	罕女(几无羽)厷(弱-力)	Hn	0	0	\N	\N	\N	\N
668	645	non-Sierolomorphidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
669	668	M+S+T	\N	\N	\N	\N	0	0	\N	\N	\N	\N
670	668	non-M+S+T	\N	\N	\N	\N	0	0	\N	\N	\N	\N
671	669	Tiphiidae	\N	\N	寄(Scarabaeidae)! <3cm	\N	0	0	\N	\N	\N	\N
672	669	Sapygidae+Mutillidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
673	672	Sapygidae	80	\N	寄(Apoidea)	\N	0	0	\N	\N	\N	\N
674	672	Mutillidae	8k	\N	沙!漠!女(无羽)	GT!	0	0	feiticeira|chiadeira	velvet ant	\N	\N
675	670	Pompilidae+Rhopalosomatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
676	670	non-Pompilidae+Rhopalosomatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
677	675	Rhopalosomatidae	68	\N	寄(Orthoptera 子)	G	0	0	\N	\N	\N	\N
678	675	Pompilidae	5k	\N	捕!寄	G	0	0	\N	\N	\N	\N
679	676	Bradynobaenidae	\N	\N	漠	\N	0	0	\N	\N	\N	\N
680	676	non-Bradynobaenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
681	680	Formicidae	12,5k	22k	社	G	0	0	formigas	ants	\N	\N
682	680	Scoliidae+Vespidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
683	682	Scoliidae	560	\N	寄(Scarabaeidae 子)	G	0	0	\N	\N	\N	\N
684	682	Vespidae	5k	\N	\N	G	0	0	vespas|marimbondos|cabas	\N	\N	\N
685	684	Euparagiinae	10	\N	漠	us(sw)-x(nw)	0	0	\N	\N	\N	\N
686	684	non-Euparaginae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
687	686	Masarinae	14g	\N	漠子(粉甘)	Fs Mns	0	0	\N	pollen wasps	\N	\N
688	686	non-Masarinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
689	688	Eumeninae	3200+	\N	捕	G	0	0	\N	potter wasps|mason wasps	\N	\N
690	688	non-Eumeninae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
691	690	Stenogastrinae	45	\N	几社 10-25mm	\N	0	0	\N	hover wasps	\N	\N
692	690	Vespinae+Polistinae	\N	\N	社	\N	0	0	\N	\N	\N	\N
693	692	Vespinae	\N	\N	社	\N	0	0	\N	\N	\N	\N
694	692	Polistinae	1100	\N	社	\N	0	0	\N	\N	\N	\N
695	694	Polistini	300	\N	捕	\N	0	0	\N	\N	\N	\N
696	694	Mischocyttarini	200+	\N	\N	N!R	0	0	\N	\N	\N	\N
697	694	Ropalidiini	~283	\N	\N	F(T) i-mp A	0	0	\N	\N	\N	\N
698	694	Epiponini	19g	\N	\N	N!R	0	0	\N	\N	\N	\N
699	693	/Provespa	3	\N	夜	Sse	0	0	\N	hornets	\N	\N
700	693	/Vespa	22	\N	<5,5cm	\N	0	0	\N	hornets	\N	\N
701	693	/Dolichovespula	23	\N	\N	Hn	0	0	\N	yellowjackets	\N	\N
702	693	/Vespula	23	\N	\N	Hn	0	0	\N	yellowjackets	\N	\N
703	6	Glaucophytes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
704	6	Plantae+Rhodophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
705	704	Rhodophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
707	7	Hacrobia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
708	7	non-Hacrobia	\N	\N	\N	\N	1	0	\N	\N	\N	\N
709	708	Alveolates+Stramenopiles	\N	\N	\N	\N	0	0	\N	\N	\N	\N
710	709	Alveolates	\N	\N	\N	\N	0	0	\N	\N	\N	\N
711	709	Stramenopiles	\N	\N	\N	\N	0	0	diatomáceas+algas-marrons+...	diatoms+phaeophytes+...	\N	\N
712	708	Rhizaria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
713	712	Radiolaria	\N	\N	\N	\N	0	0	\N	\N	\N	\N
714	712	Cercozoa+Foraminifera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
715	714	Cercozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
716	714	Foraminifera	\N	\N	壳	\N	0	0	\N	\N	\N	\N
717	710	Ciliates	\N	\N	\N	\N	0	0	ciliados	\N	\N	\N
718	710	Myzozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
719	718	Apicomplexa+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
721	719	/Chromera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
722	719	Colpodellids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
723	719	Apicomplexa=Sporozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
724	720	Perkinsids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
725	720	Ellobiopsids	\N	\N	\N	\N	1	0	\N	\N	\N	\N
727	710	/Colponema	\N	\N	\N	\N	0	0	\N	\N	\N	\N
728	723	/Cryptosporidium	\N	\N	\N	\N	1	0	\N	\N	\N	\N
729	723	Protococcidiorida	\N	\N	\N	\N	1	0	\N	\N	\N	\N
730	723	Agamococcidiorida	\N	\N	\N	\N	1	0	\N	\N	\N	\N
731	723	Gregarina	\N	\N	\N	\N	1	0	\N	\N	\N	\N
732	723	Coccidia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
733	723	Hematozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
734	733	Piroplasmorida+Haemospororida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
735	734	Piroplasmorida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
737	736	Leucocytozoon	\N	\N	\N	\N	0	0	\N	\N	\N	\N
738	736	Plasmodiidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
739	738	/Haemoproteus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
740	738	Garniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
741	738	Plasmodiidae	10g	\N	\N	\N	0	0	\N	\N	\N	\N
742	741	/Plasmodium	\N	\N	\N	\N	1	0	parasitas-da-malária	malaria parasites	\N	\N
743	8	Malawimonads	2	\N	\N	\N	0	0	\N	\N	\N	\N
744	8	Preaxostyla	\N	\N	\N	\N	0	0	\N	\N	\N	\N
745	744	/Trimastix	\N	\N	\N	\N	0	0	\N	\N	\N	\N
746	744	Oxymonads	\N	\N	\N	\N	0	0	\N	\N	\N	\N
747	8	Parabasalids+Fornicata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
749	747	Fornicata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
750	748	/Trichomonas	\N	\N	\N	\N	0	0	\N	\N	\N	\N
751	749	/Giardia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
720	718	Dinoflagellata+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
736	734	Haemospororida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
752	8	Discicristates+Jakobida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
753	752	Discicristates	\N	\N	\N	\N	0	0	\N	\N	\N	\N
754	752	Jakobida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
755	753	Euglenozoa	\N	\N	\N	\N	0	0	\N	\N	\N	\N
756	753	Heterolobosea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
757	755	/Calkinsia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
758	755	/Postgaardi	\N	\N	\N	\N	0	0	\N	\N	\N	\N
759	755	Euglenida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
760	755	Diplonemida+Kinetoplastida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
761	760	Diplonemida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
762	760	Kinetoplastida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
763	762	Prokinetoplastina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
764	759	/Euglena	\N	\N	\N	\N	0	0	\N	\N	\N	\N
765	762	Bodonida+Trypanosomatida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
766	765	Bodonida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
767	765	Trypanosomatida	20g	\N	\N	\N	0	0	\N	\N	\N	\N
768	767	/Leishmania	\N	\N	\N	\N	0	0	\N	\N	\N	\N
769	767	/Trypanosoma	\N	\N	\N	\N	0	0	\N	\N	\N	\N
770	706	Prasinophytes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
771	706	Chlorophyceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
772	771	Ulvophyceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
773	771	Chlorophyceae+Trebouxiophyceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
774	773	Chlorophyceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
775	773	Trebouxiophyceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
776	706	Streptophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
777	776	Chlorokybales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
778	776	non-Chlorokybales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
779	778	Klebsormidiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
780	778	non-Klebsormidiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
781	780	Zygnematales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
782	780	non-Zygnematales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
783	782	Charales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
784	782	Coleochaetales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
786	785	Marchantiophyta	\N	\N	\N	\N	0	0	\N	liverworts	\N	\N
787	785	Bryophyta+...	\N	\N	estômatos	\N	0	0	\N	\N	\N	\N
788	787	Bryophyta	\N	\N	\N	\N	0	0	musgos	mosses	\N	\N
789	787	Anthocerotophyta+Tracheophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
847	845	non-Nymphaeales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
790	789	Anthocerotophyta	~200	\N	\N	\N	0	0	\N	hornworts	\N	\N
792	791	Lycophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
793	791	Euphyllophyta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
794	792	Lycopodiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
795	792	Isoëtales+Selaginellales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
796	795	Isoëtales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
797	795	Selaginellales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
799	793	Spermatophyta	\N	\N	\N	\N	0	0	plantas-com-sementes	seed plants	\N	\N
800	798	Equisetales	~20	\N	\N	\N	0	0	cavalinhas	horsetails	\N	\N
801	798	non-Equisetales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
802	801	Ophioglossales+Psilotales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
803	802	Ophioglossales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
804	802	Psilotales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
805	801	Marattiales+...+Polypodiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
806	805	Marattiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
807	805	non-Marattiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
808	807	Osmundales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
809	807	non-Osmundales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
810	809	Hymenophyllales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
811	809	non-Hymenophyllales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
812	811	Gleicheniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
813	811	non-Gleicheniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
814	813	Schizaeales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
815	813	non-Schizaeales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
816	815	Salviniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
817	815	Cyatheales+Polypodiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
818	817	Cyatheales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
819	817	Polypodiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
820	799	Gymnospermae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
822	820	Cycadales+Ginkgoales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
823	820	Pinales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
824	822	Cycadales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
825	822	Ginkgoales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
826	824	Cycadaceae	\N	\N	\N	\N	0	0	cicas	\N	\N	\N
827	824	Zamiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
828	823	Pinaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
829	823	Cupressaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
830	828	Gnetaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
832	830	Ephedraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
833	830	Welwitschiaceae+Gnetaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
834	833	Welwitschiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
835	833	Gnetaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
836	829	Araucariaceae+Podocarpaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
838	836	Podocarpaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
839	829	Cupressaceae+Taxaceae+Sciadopityaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
840	839	Sciadopityaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
841	839	Cupressaceae+Taxaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
848	847	Austrobaileyales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
831	828	Pinaceae	\N	\N	\N	\N	0	0	pinheiros+...	\N	\N	\N
843	841	Cupressaceae	~135	\N	\N	\N	0	0	ciprestes+sequoias+...	\N	\N	\N
842	841	Taxaceae	~30	\N	\N	\N	0	0	\N	\N	\N	\N
837	836	Araucariaceae	\N	\N	\N	\N	0	0	araucárias	\N	\N	\N
845	821	non-Amborellales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
849	847	non-Austrobaileyales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
850	849	Chloranthales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
851	849	Magnoliids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
852	849	Monocots+Eudicots+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
853	851	Canellales+Piperales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
854	853	Canellales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
856	851	Magnoliales+Laurales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
844	821	Amborellales	1	\N	\N	nc	0	0	\N	\N	\N	\N
859	852	Monocots	\N	\N	\N	\N	0	0	monocotiledôneas	\N	\N	\N
860	852	Eudicots+Ceratophyllales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
862	860	Eudicots	\N	\N	\N	\N	0	0	\N	\N	\N	\N
861	860	Ceratophyllales	\N	\N	水单	\N	0	0	\N	\N	\N	\N
863	859	Acorales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
864	859	non-Acorales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
866	864	non-Alismatales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
867	866	Petrosaviales	\N	\N	\N	Se	0	0	\N	\N	\N	\N
868	866	non-Petrosaviales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
791	789	Tracheophyta	\N	\N	\N	\N	0	0	\N	\N	\N	COLE TCH, BACHELIER JB, HILGER HH (2018) Tracheophyte Phylogeny Poster
846	845	Nymphaeales	\N	\N	\N	\N	0	0	(nenúfar+vitória-régia)	\N	\N	\N
865	864	Alismatales	~4,5k	\N	\N	\N	0	0	\N	\N	\N	\N
869	868	Dioscoreales+Pandanales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
871	869	Pandanales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
872	868	Liliales+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
874	872	Asparagales+Commelinids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
876	874	Commelinids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
878	876	Poales+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
879	878	Commelinales+Zingiberales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
883	862	Ranunculales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
884	862	non-Ranunculales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
885	884	Proteales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
886	884	non-Proteales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
887	886	Trochodendrales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
888	886	non-Trochodendrales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
889	888	Buxales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
890	888	Core_Eudicots	\N	\N	\N	\N	0	0	\N	\N	\N	\N
891	890	Gunnerales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
892	890	Pentapetalae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
893	892	Dilleniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
894	892	Superasterids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
895	892	Superrosids	\N	\N	estípulas	\N	0	0	\N	\N	\N	\N
896	894	Berberidopsidales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
897	894	non-Berberidopsidales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
898	897	Santalales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
899	897	non-Santalales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
901	899	Asterids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
902	901	Cornales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
903	901	Ericales+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
905	903	Lamiids+Campanulids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
906	905	Lamiids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
907	905	Campanulids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
908	906	Icacinales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
909	906	non-Icacinales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
910	909	Metteniusales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
911	909	non-Metteniusales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
912	911	Garryales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
913	911	non-Garryales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
915	913	Vahliales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
918	913	Boraginales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
919	907	Aquifoliales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
920	907	non-Aquifoliales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
922	920	non-Asterales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
923	922	Escalloniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
924	922	non-Escalloniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
925	924	Bruniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
926	924	non-Bruniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
928	926	Paracryphiales+Dipsacales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
929	928	Paracryphiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
930	928	Dipsacales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
931	895	Saxifragales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
932	895	Rosids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
933	932	Vitales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
934	932	Malvids+Fabids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
935	934	Malvids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
936	934	Fabids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
937	935	Geraniales+Myrtales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
938	937	Geraniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
940	935	Crossosomatales+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
941	940	Crossosomatales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
942	940	non-Crossosomatales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
943	942	Picramniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
944	942	non-Picramniales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
946	944	non-Sapindales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
947	946	Huerteales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
948	946	Malvales+Brassicales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
951	936	Zygophyllales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
952	936	non-Zygophyllales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
953	952	C+O+M	\N	\N	\N	\N	0	0	\N	\N	\N	\N
954	952	Fabales+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
955	953	Celastrales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
956	953	Oxalidales+Malpighiales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
959	954	non-Fabales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
962	959	Cucurbitales+Fagales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
18	13	Metazoa+Choanoflagellates	\N	\N	\N	\N	0	0	\N	\N	\N	\N
563	561	Cathartiformes	\N	\N	死	\N	0	0	urubus	New World vultures	\N	\N
564	561	Accipitriformes	\N	\N	捕	\N	0	0	águias+gaviões	hawks+...	\N	\N
965	229	Archostemata	42	\N	\N	\N	0	0	\N	\N	\N	\N
966	229	Adephaga+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
967	965	Jurodidae	1	\N	\N	\N	0	0	\N	\N	\N	\N
968	965	Ommatidae	6	\N	\N	\N	0	0	\N	\N	\N	\N
969	965	Cupedidae	33	\N	菌	\N	0	0	\N	\N	\N	\N
970	966	Adephaga	40k+	\N	\N	\N	0	0	\N	\N	\N	\N
971	966	Myxophaga+Polyphaga	\N	\N	\N	\N	0	0	\N	\N	\N	\N
972	971	Myxophaga	~90	\N	\N	\N	0	0	\N	\N	\N	\N
973	971	Polyphaga	~300k	\N	\N	\N	0	0	\N	\N	\N	\N
974	970	Gyrinidae	13g	\N	\N	\N	0	0	\N	\N	\N	\N
975	970	Haliplidae	238	\N	\N	\N	0	0	\N	\N	\N	\N
976	970	Meruidae	1	\N	\N	\N	0	0	\N	\N	\N	\N
977	970	Trachypachidae+Carabidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
978	977	Trachypachidae	2g	\N	\N	\N	0	0	\N	\N	\N	\N
979	977	Carabidae	30k+	\N	\N	\N	0	0	\N	\N	\N	\N
980	970	Noteridae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
981	980	Noteridae	13g	\N	\N	\N	0	0	\N	\N	\N	\N
982	980	non-Noteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
983	982	Amphizoidae	5	\N	\N	\N	0	0	\N	\N	\N	\N
984	982	non-Amphizoidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
985	984	Aspidytidae	2	\N	\N	\N	0	0	\N	\N	\N	\N
986	984	Hygrobiidae+Dytiscidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
880	879	Commelinales	885+	\N	\N	\N	0	0	\N	\N	\N	\N
904	903	Ericales	\N	\N	\N	\N	0	0	(castanha-do-pará+kiwi)	\N	\N	\N
873	872	Liliales	\N	\N	\N	\N	0	0	(lírio)	\N	\N	\N
957	956	Oxalidales	\N	\N	\N	\N	0	0	(carambola)	\N	\N	\N
870	869	Dioscoreales	\N	\N	\N	\N	0	0	(cará+inhame)	\N	\N	\N
950	948	Brassicales	\N	\N	\N	\N	0	0	(mamão+repolho+couve+couve-flor+brócolis+nabo+mostarda)	\N	\N	\N
927	926	Apiales	\N	\N	\N	\N	0	0	(cenoura+cominho+salsão|aipo+coentro+salsa|salsinha+anis|erva-doce+ginseng+cicuta)	\N	\N	\N
900	899	Caryophyllales	\N	\N	\N	\N	0	0	(beterraba+espinafre+cactos+quinoa+buganvília)	\N	\N	\N
939	937	Myrtales	\N	\N	\N	\N	0	0	(goiaba+jabuticaba+romã+camu-camu+cravo-da-índia+pau-doce+eucalipto+quaresmeira+castanholeira|amendoeira-da-praia)	\N	\N	\N
963	962	Cucurbitales	\N	\N	\N	\N	0	0	(abóbora|jerimum|moranga+melão+melancia+abobrinha+pepino+cabaça+begônia)	\N	\N	\N
987	986	Hygrobiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
988	986	Dytiscidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
989	972	Lepiceridae=Cyathoceridae=Haplochelidae	3	\N	\N	\N	0	0	\N	\N	\N	\N
990	972	Torridincolidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
991	990	Torridincolidae	34	\N	水	\N	0	0	\N	\N	\N	\N
992	990	non-Torridincolidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
993	992	Hydroscaphidae	20	\N	水	\N	0	0	\N	\N	\N	\N
994	992	Sphaeriusidae=Microsporidae	23	\N	\N	\N	0	0	\N	\N	\N	\N
995	973	Scarabaeiformia+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
996	973	Cucujiformia+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
997	995	"Staphyliniformia"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
998	995	Scarabaeiformia=Scarabaeoidea=Lamellicornia	35k	\N	\N	\N	0	0	\N	\N	\N	\N
999	997	Staphylinoidea	48k	\N	捕!菌	\N	0	0	\N	\N	\N	\N
1000	997	Hydrophiloidea+Histeroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1001	1000	Hydrophiloidea	2,8k	\N	水捕	\N	0	0	\N	\N	\N	\N
1002	1000	Histeroidea	3,9k	\N	肉死虫	\N	0	0	\N	\N	\N	\N
1003	996	Bostrichiformia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1004	996	Elateriformia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1005	996	Cucujiformia	\N	\N	菌	\N	0	0	\N	\N	\N	\N
1006	1003	Derodontoidea	42	\N	2-6mm	\N	0	0	\N	\N	\N	\N
1007	1003	Bostrichoidea	3150	\N	\N	\N	0	0	\N	\N	\N	\N
1008	1007	Anobiidae	\N	\N	\N	\N	0	0	\N	deathwatch beetles	\N	\N
1009	1007	Bostrichidae	\N	\N	\N	\N	0	0	\N	horned powderpost beetles	\N	\N
1011	1007	Jacobsoniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1012	1007	Nosodendridae	\N	\N	\N	\N	0	0	\N	wounded-tree beetles	\N	\N
1010	1007	Dermestidae	~600	\N	死! 1-12mm	\N	0	0	\N	skin beetles	\N	\N
1013	1004	Dascilloidea	180	\N	\N	\N	0	0	\N	\N	\N	\N
1014	1004	Scirtoidea=Eucinetoidea=Clamboidea	4f	\N	\N	\N	0	0	\N	\N	\N	\N
1015	1004	Byrrhoidea=Dryopoidea	3,8k	\N	水!	\N	0	0	\N	\N	\N	\N
1016	1004	Buprestoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1017	1016	Schizopodidae	7	\N	\N	\N	0	0	\N	\N	\N	\N
1019	1004	Elateroidea	18f,23k	\N	捕!	\N	0	0	\N	\N	\N	\N
1018	1016	Buprestidae	~15k	\N	金	\N	0	0	\N	jewel beetles|metallic wood-boring beetles	\N	\N
1020	1019	Lampyridae	2,1k	\N	光	T-t	0	0	vaga-lumes	fireflies|lightning bugs	\N	\N
1021	1019	Elateridae	9300	\N	光(几)	G	0	0	vaga-lumes+...	click beetles|wireworms	\N	\N
1022	1005	Lymexyloidea	7g	\N	\N	\N	0	0	\N	\N	\N	\N
1023	1005	Cleroidea	7f	\N	捕!植	\N	0	0	\N	\N	\N	\N
1024	1005	Cucujoidea	36f,~19k	\N	\N	\N	0	0	\N	\N	\N	\N
1025	1024	Coccinellidae	6k+	\N	捕!植 0,8-18mm	G	0	0	joaninhas	ladybugs|ladybirds|lady beetles	\N	\N
1026	1005	Tenebrionoidea	35k	\N	\N	\N	0	0	\N	\N	\N	\N
1028	1027	Chrysomelidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1029	1027	Cerambycidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1027	1005	Chrysomeloidea	9+f,58k	\N	植	\N	0	0	\N	\N	\N	\N
1030	1005	Curculionoidea	7f,80k+	\N	植	\N	0	0	\N	\N	\N	\N
1031	666	Melittidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1032	666	non-Melittidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1033	1032	Andrenidae+...	\N	\N	舌(短)	\N	0	0	\N	\N	\N	\N
1034	1032	Apidae+Megachilidae	\N	\N	舌(长)	\N	0	0	\N	\N	\N	\N
1035	1033	Andrenidae	\N	\N	\N	\N	0	0	\N	mining bees	\N	\N
1036	1033	Halictidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1037	1036	Halictidae	\N	\N	\N	\N	0	0	\N	sweat bees	\N	\N
1038	1036	Colletidae+Stenotritidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1039	1038	Colletidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1040	1038	Stenotritidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1041	1034	Megachilidae	\N	\N	\N	\N	0	0	\N	mason bees|leafcutter bees	\N	\N
1042	1034	Apidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1043	1042	Xylocopinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1044	1042	Nomadinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1045	1042	Apinae	13t	\N	\N	\N	0	0	\N	\N	\N	\N
1046	1045	Apini	\N	\N	\N	\N	0	0	abelhas-corbiculadas	corbiculate bees	\N	\N
1047	1046	Apina	7	\N	社	V >M	0	0	\N	honey bees	\N	\N
1048	1046	Euglossina	~200	\N	仅!	Mc-s us(1sp)	0	0	abelhas-das-orquídeas	orchid bees	\N	\N
1049	1046	Bombina	250+	\N	社!	\N	0	0	mamangabas|mamangavas	bumblebees	\N	\N
1050	1046	Meliponina	~500	\N	社	T sT	0	0	abelhas-sem-ferrão	stingless bees|stingless honey bees|meliponines	\N	\N
1051	681	Leptanillinae	67	\N	\N	\N	0	0	\N	\N	\N	\N
1052	681	non-Leptanillinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1053	1052	Martialinae	1	\N	\N	br	0	0	\N	\N	\N	\N
1054	1052	non-Martialinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1055	1054	Poneroids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1056	1054	Formicoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1057	1055	Amblyoponinae	141	\N	\N	\N	0	0	\N	\N	\N	\N
1058	1055	non-Amblyoponinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1059	1058	Proceratiinae	144	\N	\N	\N	0	0	\N	\N	\N	\N
1060	1058	non-Proceratiinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1061	1060	Ponerinae	1376	\N	\N	\N	0	0	\N	\N	\N	\N
1063	1062	Agroecomyrmecinae	2	\N	\N	\N	0	0	\N	\N	\N	\N
1064	1062	Paraponerinae	5	\N	\N	\N	0	0	\N	\N	\N	\N
1065	1056	Dolichoderinae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1066	1056	Formicinae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1067	1065	Dorylinae	808	\N	\N	\N	0	0	\N	\N	\N	\N
1068	1065	non-Dorylinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1069	1068	Myrmeciinae+Pseudomyrmecinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1070	1069	Myrmeciinae	94	\N	\N	\N	0	0	\N	\N	\N	\N
1071	1069	Pseudomyrmecinae	256	\N	\N	\N	0	0	\N	\N	\N	\N
1072	1068	Aneuretinae+Dolichoderinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1073	1072	Aneuretinae	1	\N	\N	\N	0	0	\N	\N	\N	\N
1074	1072	Dolichoderinae	838	\N	\N	\N	0	0	\N	\N	\N	\N
1075	1066	Formicinae	4011	\N	\N	\N	0	0	\N	\N	\N	\N
1076	1066	non-Formicinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1077	1076	Myrmicinae	7374	\N	\N	\N	0	0	\N	\N	\N	\N
1078	1076	Ectatomminae+Heteroponerinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1079	1078	Ectatomminae	264	\N	\N	\N	0	0	\N	\N	\N	\N
1080	1078	Heteroponerinae	33	\N	\N	\N	0	0	\N	\N	\N	\N
877	876	Arecales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1082	877	Dasypogonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1083	882	Bromeliads	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1084	882	non-Bromeliads	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1086	1083	Typhaceae	51	\N	\N	\N	0	0	\N	\N	\N	\N
1085	1083	Bromeliaceae	3475	\N	\N	\N	0	0	bromélias (abacaxi)	\N	\N	\N
1087	1084	Cyperids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1088	1084	non-Cyperids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1089	1087	Mayacaceae+Rapateaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1092	1087	Thurniaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1090	1089	Mayacaceae	5	\N	\N	x-ar cb us(se) Fc	0	0	\N	\N	\N	\N
1091	1089	Rapateaceae	94	\N	\N	T Ms Fw	0	0	\N	\N	\N	\N
1094	1092	Cyperaceae+Juncaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1093	1092	Thurniaceae	4	\N	\N	Ms(n) fs	0	0	\N	\N	\N	\N
1140	855	Piperaceae+Saururaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1096	1094	Juncaceae	~464	\N	\N	G	0	0	juncos+...	rushes+...	\N	\N
1097	1088	Xyrids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1098	1088	non-Xyrids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
821	799	Angiospermae=Magnoliophyta	\N	\N	\N	\N	0	0	plantas-com-flores	flowering plants	\N	COLE TCH, HILGER HH, STEVENS PF, CARVALHO FA (2017) FILOGENIA das ANGIOSPERMAS – SISTEMÁTICA das PLANTAS com FLORES
1141	1140	Piperaceae	~3,6k	\N	\N	T	0	0	(pimenta-do-reino)	pepper family	\N	\N
1100	1097	Xyridaceae	<400	\N	\N	T! sT!	0	0	\N	\N	\N	\N
1101	1098	Graminids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1102	1098	Restiids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1104	1101	non-Flagellariaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1142	1140	Saururaceae	7	\N	\N	Ses Mn	0	0	\N	\N	\N	\N
1144	858	non-Calycanthaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1106	1104	Ecdeiocoleaceae+Joinvilleaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1110	1102	non-Anarthriaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1103	1101	Flagellariaceae	5	\N	\N	T sT SF a oip	0	0	\N	\N	\N	\N
1107	1106	Ecdeiocoleaceae	3	\N	\N	a(sw)	0	0	\N	\N	\N	\N
1108	1106	Joinvilleaceae	4	\N	\N	mp-I op	0	0	\N	\N	\N	\N
1145	1144	Siparunaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1105	1104	Poaceae=Gramineae	~12k	\N	\N	G	0	0	gramíneas(cereais|arroz+milho+trigo+aveia+cevada+cana-de-açúcar+bambu)	grasses	\N	\N
1109	1102	Anarthriaceae	10	\N	\N	a(sw)	0	0	\N	\N	\N	\N
1111	1110	Centrolepidaceae	~35	\N	\N	a nz Ms(s) S(se)	1	0	\N	\N	\N	\N
1146	1144	Lauraceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1112	1110	Restionaceae	520	\N	5cm-3m	\N	1	0	\N	restiads|restios	\N	\N
1114	881	non-Musaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1148	1145	Atherospermataceae+Gomortegaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1113	881	Musaceae	~91	\N	\N	TFS	0	0	(banana)	\N	\N	\N
1115	1114	Zingiberineae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1116	1114	Heliconiaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1117	1115	Zingiberariae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1118	1115	Cannariae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1120	1116	Strelitziineae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1121	1117	Zingiberaceae	~1,6k	\N	\N	TFSM	0	0	(gengibre|mangarataia)	ginger family	\N	\N
1122	1117	Costaceae	~143	\N	\N	T	0	0	\N	\N	\N	\N
1123	1118	Cannaceae	10	\N	\N	us(s)-ar(n)	0	0	\N	canna lily	\N	\N
1124	1118	Marantaceae	~570	\N	\N	\N	0	0	\N	arrowroot family|prayer-plant family	\N	\N
1125	1120	Lowiaceae	17	\N	\N	ch(s)-b	0	0	\N	\N	\N	\N
1126	1120	Strelitziaceae	7	\N	\N	Fs m Ms(n)	0	0	(planta-do-viajante)	(traveller's tree)	\N	\N
1152	1146	Monimiaceae+Lauraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1119	1116	Heliconiaceae	~194	\N	\N	T!M! op(w) im	0	0	helicônia|caeté|bananeira-do-mato	heliconias|lobster-claws|toucan peak (beak?)|wild plantains|false bird-of-paradise	\N	\N
1127	1077	Myrmicini	216	\N	\N	\N	0	0	\N	\N	\N	\N
1128	1077	non-Myrmicini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1129	1128	Pogonomyrmecini	92	\N	\N	\N	0	0	\N	\N	\N	\N
1130	1128	non-Pogonomyrmecini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1131	1130	Stenammini	493	\N	\N	\N	0	0	\N	\N	\N	\N
1132	1130	non-Stenammini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1134	1132	non-Solenopsidini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1136	1134	Crematogastrini	3035	\N	\N	\N	0	0	\N	\N	\N	\N
1143	858	Calycanthaceae	10	\N	\N	t(q)T	0	0	\N	sweetshrubs|spicebushes	\N	\N
1147	1145	Siparunaceae	~75	\N	\N	Fw N	0	0	\N	\N	\N	\N
1133	1132	Solenopsidini	15-20g,858	\N	\N	\N	0	0	\N	\N	\N	\N
1149	1148	Atherospermataceae	14	\N	\N	Hs!	0	0	\N	southern sassafrases	\N	\N
1135	1134	Attini	30-46g,2678	\N	菌	M	0	0	(saúvas|cortadeiras)	fungus-growing ants	\N	\N
1138	854	Winteraceae	~75	\N	\N	T-t Hs!	0	0	\N	\N	\N	\N
1137	854	Canellaceae	25	\N	\N	TFM	0	0	\N	\N	\N	\N
1139	855	Aristolochiaceae	~400	\N	\N	\N	0	0	\N	birthwort family	\N	\N
1150	1148	Gomortegaceae	1	\N	\N	cl	0	0	\N	\N	\N	\N
1151	1146	Hernandiaceae	~58	\N	\N	T	0	0	\N	\N	\N	\N
1095	1094	Cyperaceae	~5,5k	\N	\N	T!S!Ms!	0	0	(tiririca)	sedges	\N	\N
1156	857	non-Myristicaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1158	1156	non-Magnoliaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1159	1158	Degeneriaceae+Himantandraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1162	1158	Eupomatiaceae+Annonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1155	857	Myristicaceae	~440	\N	\N	FS op M	0	0	\N	nutmeg family	\N	\N
70	60	Tardigrada	1150	\N	\N	\N	0	0	tardígrados|ursos d'água	water bear	\N	\N
1099	1097	Eriocaulaceae	~1207	\N	灭(几)	T!M!	0	0	(sempre-vivas)	pipewort family	\N	\N
1157	1156	Magnoliaceae	~219	\N	\N	sTMn(e)-x Mc cb TMs i(s-e) k Sse ch jp ko	0	0	\N	magnolia family	\N	\N
1160	1159	Degeneriaceae	2	\N	\N	fj	0	0	\N	\N	\N	\N
1161	1159	Himantandraceae	2	\N	\N	T Sse a	0	0	\N	\N	\N	\N
1163	1162	Eupomatiaceae	3	\N	林	a(e) ng	0	0	\N	\N	\N	\N
855	853	Piperales	\N	\N	\N	\N	0	0	\N	\N	\N	Angiosperm Phylogeny Group (2016). "An update of the Angiosperm Phylogeny Group classification for the orders and families of flowering plants: APG IV". Botanical Journal of the Linnean Society. 181 (1): 1–20. doi:10.1111/boj.12385.
726	720	Dinoflagellata	\N	\N	水清咸海!浮常光(几)	G	0	0	\N	\N	\N	\N
706	704	Plantae=Viridiplantae	\N	\N	\N	\N	0	0	plantas+algas	\N	\N	http://tolweb.org/Green_plants/2382
798	793	Monilophyta	\N	\N	\N	\N	0	0	(samambaias)	(ferns)	\N	\N
1165	1	Virus	~5k	\N	寄	\N	1	0	vírus	viruses	\N	\N
785	782	Embryophyta	\N	\N	\N	\N	0	0	plantas terrestres	land plants	\N	COLE TCH, HILGER HH (2013) Bryophyte Phylogeny Poster
858	856	Laurales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Laurales\r\nAngiosperm Phylogeny Group (2009). "An update of the Angiosperm Phylogeny Group classification for the orders and families of flowering plants: APG III" (PDF). Botanical Journal of the Linnean Society. 161 (2): 105–121. doi:10.1111/j.1095-8339.2009.00996.x. Retrieved 2013-07-06.
857	856	Magnoliales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Magnoliales\r\nAngiosperm Phylogeny Group (2009). "An update of the Angiosperm Phylogeny Group classification for the orders and families of flowering plants: APG III" (PDF). Botanical Journal of the Linnean Society. 161 (2): 105–121. doi:10.1111/j.1095-8339.2009.00996.x. Retrieved 2013-07-06.
1258	1256	Urticaceae	\N	\N	\N	\N	0	0	(urtiga+embaúba)	\N	\N	\N
1153	1152	Monimiaceae	~217	\N	\N	T sT Hs!	0	0	(boldo)	\N	\N	\N
881	879	Zingiberales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Zingiberales\r\nSass, C; Iles, WJ; Barrett, CF; Smith, SY; Specht, CD (21 January 2016). "Revisiting the Zingiberales: using multiplexed exon capture to resolve ancient and recent phylogenetic splits in a charismatic plant lineage". PeerJ. 4: e1584. doi:10.7717/peerj.1584. PMC 4727956 Freely accessible. PMID 26819846.
882	878	Poales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Poales\r\nBouchenak-Khelladi, Yanis; Muasya, A. Muthama; Linder, H. Peter (2014). "A revised evolutionary history of Poales: origins and diversification". Botanical Journal of the Linnean Society. 175 (1): 4–16. doi:10.1111/boj.12160. ISSN 0024-4074.
1166	933	Vitaceae	14g,~910	\N	\N	\N	0	0	(uva)	(grape)	\N	\N
958	956	Malpighiales	~16k	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Malpighiales\r\nXi, Z.; Ruhfel, B. R.; Schaefer, H.; Amorim, A. M.; Sugumaran, M.; Wurdack, K. J.; Endress, P. K.; Matthews, M. L.; Stevens, P. F.; Mathews, S.; Davis, C. C. (2012). "Phylogenomics and a posteriori data partitioning resolve the Cretaceous angiosperm radiation Malpighiales". Proceedings of the National Academy of Sciences. 109 (43): 17519. doi:10.1073/pnas.1205818109. PMC 3491498 Freely accessible. PMID 23045684.
1168	958	clusioids+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1169	958	malpighioids+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1167	958	euphorbioids+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1170	1167	euphorbioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1171	1167	parietal_clade+Humiriaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1172	1170	Euphorbiaceae+Peraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1174	1172	Peraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1175	1170	phyllanthoids+linoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1176	1175	phyllanthoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1177	1175	linoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1178	1176	Picrodendraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1179	1176	Phyllanthaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1181	1177	Ixonanthaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1182	1171	Humiriaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1183	1171	parietal_clade	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1184	1183	Achariaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1185	1183	salicoids+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1186	1185	salicoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1187	1185	Violaceae+Goupiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1189	1187	Goupiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1190	1186	Lacistemataceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1191	1190	Lacistemataceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1192	1190	non-Lacistemataceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1193	1192	Samydaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1194	1192	Salicaceae+Scyphostegiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1195	1194	Salicaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1196	1194	Scyphostegiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1197	1186	Malesherbiaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1198	1197	Malesherbiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1199	1197	Passifloraceae+Turneraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1201	1199	Turneraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1200	1199	Passifloraceae	\N	\N	\N	\N	0	0	(maracujá)	(passion fruit)	\N	\N
1188	1187	Violaceae	\N	\N	\N	\N	0	0	(violeta)	\N	\N	\N
1180	1177	Linaceae	\N	\N	\N	\N	0	0	(linho|linhaça)	\N	\N	\N
1202	1168	clusioids+ochnoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1203	1202	clusioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1204	1202	ochnoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1205	1168	Ctenolophonaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1206	1205	Ctenolophonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1207	1205	Rhizophoraceae+Erythroxylaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1208	1207	Rhizophoraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1210	1168	Pandaceae+Irvingiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1211	1210	Pandaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1212	1210	Irvingiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1213	1203	Calophyllaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1214	1213	Calophyllaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1215	1213	Hypericaceae+Podostemaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1216	1215	Hypericaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1217	1215	Podostemaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1218	1203	Clusiaceae+Bonnetiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1220	1218	Bonnetiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1219	1218	Clusiaceae=Guttiferae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1221	1204	Ochnaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1222	1204	Quiinaceae+Medusagynaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1223	1222	Quiinaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1224	1222	Medusagynaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1225	1169	chrysobalanoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1226	1169	malpighioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1228	1169	putranjivoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1229	1228	Putranjivaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1230	1228	Lophopyxidaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1227	1169	Caryocaraceae	\N	\N	\N	\N	0	0	(pequi)	\N	\N	\N
1231	1226	Centroplacaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1232	1226	Malpighiaceae+Elatinaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1234	1232	Elatinaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1233	1232	Malpighiaceae	\N	\N	\N	\N	0	0	(acerola)	\N	\N	\N
1235	1225	Balanopaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1236	1225	Chrysobalanaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1237	1236	Chrysobalanaceae+Euphroniaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1238	1237	Chrysobalanaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1239	1237	Euphroniaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1240	1236	Dichapetalaceae+Trigoniaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1241	1240	Dichapetalaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1242	1240	Trigoniaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1209	1207	Erythroxylaceae	\N	\N	\N	\N	0	0	(coca)	\N	\N	\N
961	959	Rosales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Rosales\r\nShu-dong Zhang, De-zhu Li; Soltis, Douglas E.; Yang, Yang; Ting-shuang, Yi (July 2011). "Multi-gene analysis provides a well-supported phylogeny of Rosales". Molecular Phylogenetics and Evolution. 60 (1): 21–28. doi:10.1016/j.ympev.2011.04.008. PMID 21540119.
1244	961	non-Rosaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1245	1244	Rhamnaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1246	1245	Rhamnaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1247	1245	Elaeagnaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1248	1247	Elaeagnaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1249	1247	Barbeyaceae+Dirachmaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1250	1249	Barbeyaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1251	1249	Dirachmaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1252	1244	urticalean_rosids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1253	1252	Ulmaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1254	1252	Cannabaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1256	1254	Moraceae+Urticaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1257	1256	Moraceae	1,1k+	\N	\N	\N	0	0	(amora+figo+jaca+fruta-pão)	mulberry family|fig family	\N	\N
1255	1254	Cannabaceae	~170	\N	\N	\N	0	0	(cânhamo|maconha)	(hemp|marijuana)	\N	\N
1173	1172	Euphorbiaceae	~7,5k	\N	\N	\N	0	0	(mandioca|macaxeira|aipim|maniva|maniwa+mamona+seringueira|borracha)	\N	\N	\N
1259	891	Gunneraceae	63	\N	\N	\N	0	0	\N	\N	\N	\N
1260	891	Myrothamnaceae	2	\N	\N	\N	0	0	\N	\N	\N	\N
914	913	Solanales	\N	\N	\N	\N	0	0	(batata-doce+batata+tomate+pimenta+pimentão+pimenta-de-cheiro+beringela+tabaco)	\N	\N	\N
1262	916	non-Rubiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1264	1262	non-Gentianaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1265	1264	Loganiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1266	1264	Apocynaceae+Gelsemiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
916	913	Gentianales	16k+	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Gentianales<br>Backlund M, Oxelman B, Bremer B (2000). "Phylogenetic relationships within the Gentianales based on NDHF and RBCL sequences, with particular reference to the Loganiaceae". American Journal of Botany. 87: 1029–1043. doi:10.2307/2657003.
1311	964	Nothofagaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1283	1282	Amaryllidaceae	~1,6k	\N	\N	\N	0	0	(cebola+alho+cebolinha)	\N	\N	\N
1263	1262	Gentianaceae	~1,6k	\N	\N	\N	0	0	\N	\N	\N	\N
1243	961	Rosaceae	4828	\N	\N	\N	0	0	(maçã+pêra+marmelo+ameixa+cereja+pêssego+nêspera+morango+amêndoa+rosa)	\N	\N	\N
1267	1266	Apocynaceae	5k+	\N	\N	\N	0	0	(beijo|maria-sem-vergonha)	\N	\N	\N
1268	1266	Gelsemiaceae	12	\N	\N	\N	0	0	\N	\N	\N	\N
949	948	Malvales	\N	\N	\N	\N	0	0	(cacau+cupuaçu+quiabo+algodão+juta+urucum+hibisco)	\N	\N	\N
1261	916	Rubiaceae	~13,5k	\N	\N	\N	0	0	(café+jenipapo+nôni)	\N	\N	\N
1372	1365	Trichoceridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1373	1365	Tipulidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1350	1348	Culicidae	3,5k+	\N	女(血)!	\N	0	0	pernilongos|muriçocas|carapanãs	mosquitoes	\N	\N
1352	1350	Culicinae	108g,3k+	\N	\N	\N	0	0	\N	\N	\N	\N
875	874	Asparagales	\N	\N	\N	\N	0	0	\N	\N	\N	https://en.wikipedia.org/wiki/Asparagales\r\nChase, Mark W.; Reveal, James L.; Fay, Michael F. (2009), "A subfamilial classification for the expanded asparagalean families Amaryllidaceae, Asparagaceae and Xanthorrhoeaceae", Botanical Journal of the Linnean Society, 161 (2): 132–136, doi:10.1111/j.1095-8339.2009.00999.x\r\nStevens, P.F. (2016) [2001], Angiosperm Phylogeny Website:, Missouri Botanical Gardens, retrieved 7 February 2016
1269	875	Orchidaceae	~28k	\N	\N	\N	0	0	orquídeas	orchids	\N	\N
1270	875	non-Orchidaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1271	1270	Hypoxidaceae+Boryaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1272	1270	Tecophilaeaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1273	1272	Tecophilaeaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1274	1272	non-Tecophilaeaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1275	1274	Doryanthaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1276	1274	non-Doryanthaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1277	1276	Iridaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1278	1276	non-Iridaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1279	1278	Xeronemataceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1280	1278	non-Xeronemataceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1281	1280	Xanthorrhoeaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1282	1280	Core_Asparagales	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1284	1282	Asparagaceae	\N	\N	\N	\N	0	0	(agave|sisal+espada-de-são-jorge)	\N	\N	\N
1285	865	Tofieldiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1286	865	non-Tofieldiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1288	1286	non-Araceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1289	1288	Alismataceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1290	1289	Alismataceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1291	1289	Butomaceae+Hydrocharitaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1292	1291	Butomaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1293	1291	Hydrocharitaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1294	1288	Aponogetonaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1295	1294	Aponogetonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1296	1294	non-Aponogetonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1297	1296	Scheuchzeriaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1298	1296	non-Scheuchzeriaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1299	1298	Juncaginaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1300	1298	non-Juncaginaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1301	1300	Maundiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1302	1300	non-Maundiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1303	1302	Potamogetonaceae+Zosteraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1304	1303	Potamogetonaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1305	1303	Zosteraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1306	1302	Posidoniaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1307	1306	Posidoniaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1308	1306	Ruppiaceae+Cymodoceaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1309	1308	Ruppiaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1310	1308	Cymodoceaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1164	1162	Annonaceae	~2,4k	\N	\N	T! t NFO	0	0	(araticum+fruta-do-conde+graviola+biribá+envira)	custard apple family	\N	\N
1312	964	non-Nothofagaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1081	877	Arecaceae=Palmae	\N	\N	\N	\N	0	0	palmeiras (coco+açaí+buriti+tucumã+pupunha+bacaba+patauá+dendê)	palm trees	\N	\N
921	920	Asterales	\N	\N	\N	\N	0	0	(alface+chicória+alcachofra+boldo+camomila+absinto+girassol+crisântemo+margarida+dente-de-leão+picão+carrapicho+carqueja)	\N	\N	\N
1313	1312	Fagaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
960	954	Fabales	\N	\N	\N	\N	0	0	(legumes)|(feijão+amendoim+ervilha+lentilha+soja+ingá+jatobá+copaíba+sucupira+angelim)	\N	\N	\N
917	913	Lamiales	~23,8k	\N	\N	\N	0	0	(manjericão+hortelã|menta+alecrim+erva-cidreira+azeitona|azeite+orégano+gergelim|sésamo+boldo+sálvia+ipê|pau-d'árco+jacarandá)	\N	\N	\N
1154	1152	Lauraceae	~2850	\N	\N	G	0	0	(louro+abacate+canela+cânfora)	laurel family	\N	\N
945	944	Sapindales	\N	\N	\N	\N	0	0	(manga+caju+taperebá+cajá+laranja+limão+tangerina+lima+toranja+guaraná+arruda+andiroba+mirra+incenso+breu+mogno+cedro-branco)	\N	\N	\N
1314	1312	non-Fagaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1315	1314	Myricaceae+Juglandaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1316	1315	Myricaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1318	1314	Casuarinaceae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1319	1318	Casuarinaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1320	1318	Ticodendraceae+Betulaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1321	1320	Ticodendraceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1317	1315	Juglandaceae	\N	\N	\N	\N	0	0	(noz)	\N	\N	\N
1322	1320	Betulaceae	\N	\N	\N	\N	0	0	(avelã)	\N	\N	\N
964	962	Fagales	\N	\N	\N	\N	0	0	(noz+avelã)	\N	\N	https://en.wikipedia.org/wiki/Fagales<br>Angiosperm Phylogeny Group (2009). "An update of the Angiosperm Phylogeny Group classification for the orders and families of flowering plants: APG III" (PDF). Botanical Journal of the Linnean Society. 161 (2): 105–121. doi:10.1111/j.1095-8339.2009.00996.x. Retrieved 2013-07-06.
1287	1286	Araceae	~3750	\N	\N	N!	0	0	(inhame+taioba+jibóia+cipó-titica)	arum family|aroids	\N	\N
1323	77	Pelmatozoa	635	\N	立	\N	0	0	\N	\N	\N	\N
1324	77	Eleutherozoa	~5,5k	\N	\N	\N	0	0	\N	\N	\N	\N
1326	1324	Echinozoa	2,2-2,35k	\N	\N	\N	0	0	\N	\N	\N	\N
1327	1324	Asterozoa	3,1-3,3k	\N	\N	\N	0	0	\N	\N	\N	\N
1328	1326	Holothuroidea	1,25-1,4k	\N	\N	\N	0	0	pepinos-do-mar	sea cucumbers	\N	\N
1325	1323	Crinoidea	~600	\N	\N	\N	0	0	lírios-do-mar|crinóides|comatulídeos	sea lilies+feather stars|comatulids	\N	\N
1330	1327	Ophiuroidea	2064	\N	\N	\N	0	0	ofiuroides|ofiúros|serpentes-do-mar	brittle stars|ophiuroids	\N	http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0031940
1331	1327	Asteroidea	~1,5k	\N	\N	\N	0	0	estrelas-do-mar	starfish|sea stars	\N	\N
77	73	Echinodermata	7k	\N	海	\N	0	0	equinodermos	\N	\N	http://tolweb.org/Echinodermata/2497
1329	1326	Echinoidea	~950	\N	\N	\N	0	0	ouriços-do-mar+bolachas-da-praia	sea urchins+sand dollars	\N	\N
318	312	Platypoda	1	\N	汢清虫毒(朿支后男)	a(e)	0	0	ornitorrincos	\N	\N	\N
1332	237	Culicomorpha+Ptychopteromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1333	1332	Culicomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1334	1332	Ptychopteromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1335	1334	Tanyderidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1336	1334	Ptycopteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1337	1333	Thaumaleidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1338	1337	Thaumaleidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1339	1337	Simuliidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1340	1339	Simuliidae	\N	\N	\N	\N	0	0	piuns	\N	\N	\N
1341	1339	Chironomidae+Ceratopogonidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1342	1341	Chironomidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1343	1341	Ceratopogonidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1344	1333	Culicidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1345	1344	Dixidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1346	1344	non-Dixidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1347	1346	Corethrellidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1349	1348	Chaoboridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1348	1346	Chaoboridae+Culicidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1374	1368	Muscomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1375	1368	non-Muscomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1376	1375	Stratiomyomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1354	1352	/Aedes	126	\N	日吃(夕)	\N	0	0	\N	\N	\N	\N
1377	1375	Xylophagidae+Tabanomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1378	1377	Xylophagidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1356	237	Blephariceromorpha+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1358	1356	non-Blephariceromorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1357	1356	Blephariceromorpha	\N	\N	山	\N	0	0	\N	\N	\N	\N
1359	1358	Bibionomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1360	1358	non-Bibionomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1379	1377	Tabanomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
237	233	Diptera	158k+	\N	\N	\N	0	0	moscas+mosquitos+pernilongos|muriçocas|carapanãs+mutucas+piuns+borrachudos	flies+mosquitoes	\N	http://www.tolweb.org/Diptera/8226
1361	1360	"Psychodomorpha"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1362	1360	Psychodidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1364	1362	non-Psychodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1365	1364	Tipulomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1367	1366	Anisopodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1368	1366	Brachycera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1366	1364	Anisopodidae+Brachycera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1380	1379	Vermileonidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1381	1379	non-Vermileonidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1382	1381	"Rhagionidae"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1384	1383	Pelecorhynchidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1363	1362	Psychodidae	6bf,2,6k+	\N	\N	\N	0	0	mosca-de-banheiro|mosca-dos-filtros	drain flies|sink flies|filter flies|sewer gnats|moth flies	\N	\N
1385	1383	non-Pelecorhynchidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1369	1363	Phlebotominae	7g	\N	女(血)	\N	0	0	mosquito-palha|birigui|cangalha|tatuquira	sand fly	\N	\N
1386	1385	Oreoleptidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1387	1385	Athericidae+Tabanidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1370	1369	/Lutzomyia	~400	\N	介(Leishmania)	\N	0	0	\N	\N	\N	\N
1371	1369	/Phlebotomus	19	\N	介(Leishmania)	\N	0	0	\N	\N	\N	\N
1388	1387	Athericidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1351	1350	Anophelinae	1g,~460	\N	\N	\N	0	0	\N	\N	\N	\N
1353	1351	/Anopheles	~460	\N	介(Plasmodium)	\N	0	0	mosquitos-da-malária	\N	\N	\N
1355	1352	/Culex	1k+	\N	介(Virus|Nematoda|Apicomplexa)	\N	0	0	\N	\N	\N	\N
1412	1410	Phoridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1389	1387	Tabanidae	~4455	\N	女(血)男(甘植)捕(子)汢(子)	G	0	0	mutucas	horseflies	\N	\N
1383	1381	Tabanoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1390	1374	"Nemestrinoidea"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1391	1390	Acroceridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1392	1390	Nemestrinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1393	1374	Asiloidea+Eremoneura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1395	1393	Eremoneura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1394	1393	Asiloidea	10f	\N	\N	\N	0	0	\N	\N	\N	\N
1396	1394	Asilidae	7k+	\N	捕	G	0	0	\N	robber flies|assassin flies	\N	\N
1397	1395	"Empidoidea"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1398	1395	Cyclorrhapha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1399	1398	"Aschiza"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1400	1398	Schizophora	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1401	1399	Syrphoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1402	1399	Platypezoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1403	1401	Pipunculidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1404	1401	Syrphidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1405	1402	Platypezoidea_ss	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1406	1402	Phoroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1407	1405	Opetiidae	\N	\N	\N	\N	1	0	\N	\N	\N	\N
1408	1405	Platypezidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1409	1406	Lonchopteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1410	1406	Ironomyiidae+Phoridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1411	1410	Ironomyiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1413	1400	Acalyptratae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1414	1400	Calyptratae	\N	\N	\N	\N	1	0	\N	\N	\N	\N
1415	1413	Conopoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1416	1413	Sciomyzoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1417	1415	Conopoidea+Tephritoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1418	1417	Conopoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1419	1417	Tephritoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1420	1415	Nerioidea+Diopsoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1421	1420	Nerioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1422	1420	Diopsoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1423	1415	Ctenostylidae	\N	\N	\N	\N	1	0	\N	\N	\N	\N
1424	1416	Sciomyzoidea+Lauxanioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1425	1424	Sciomyzoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1426	1424	Lauxanioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1427	1424	Natalimyzidae	\N	\N	\N	\N	1	0	\N	\N	\N	\N
1428	1416	Ephydroidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1429	1428	Ephydroidea+Sphaeroceroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1430	1429	Sphaeroceroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1432	1428	Opomyzoidea+Carnoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1433	1432	Opomyzoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1434	1432	Carnoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1431	1429	Ephydroidea	5f	\N	\N	\N	0	0	\N	\N	\N	\N
1435	1431	Drosophilidae	4k+	\N	\N	\N	0	0	\N	\N	\N	\N
1436	1414	Hippoboscoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1437	1414	Oestroidea+Muscoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1438	1437	Oestroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1439	1437	Muscoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1440	1436	Glossinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1441	1436	non-Glossinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1442	1441	Hippoboscidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1443	1441	Streblidae+Nycteribiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1444	1443	Streblidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1445	1443	Nycteribiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1446	1438	Mystacinobiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1447	1438	non-Mystacinobiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1448	1447	Tachinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1450	1447	Rhinophoridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1452	1447	"Calliphoridae"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1449	1447	Sarcophagidae	~2,5k	\N	胎 4-23mm	\N	0	0	\N	flesh flies	\N	\N
1451	1447	Oestridae	~150	\N	子(寄内Mammalia)	\N	0	0	\N	botflies|warble flies|heel flies|gadflies	\N	\N
1453	1451	Cuterebrinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1454	1451	Gasterophilinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1455	1451	Hypodermatinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1456	1451	Oestrinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1457	1453	/Cuterebra	\N	\N	寄(Rodentia...)	\N	0	0	\N	rodent bots	\N	\N
1458	1453	/Dermatobia	\N	\N	寄(Primates)	\N	0	0	\N	\N	\N	\N
1459	1458	/D.hominis	\N	\N	\N	\N	0	0	berne|bicheira	\N	\N	\N
1460	1439	Scathophagidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1461	1439	non-Scathophagidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1462	1461	Anthomyiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1463	1461	Fanniidae+Muscidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1465	1463	Muscidae	~4k	\N	\N	\N	0	0	(mosca-doméstica)	(house flies|stable flies)	\N	\N
1464	1463	Fanniidae	285	\N	\N	\N	0	0	\N	\N	\N	\N
1467	462	Homininae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1469	1467	Hominini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1471	1469	Hominina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1470	1469	Panina	2	\N	\N	\N	0	0	chimpanzés	chimpanzees|chimps	\N	\N
1472	1470	/Pan	2	\N	\N	\N	0	0	chimpanzés	chimpanzees|chimps	\N	\N
1473	1471	/Homo	1	\N	杂	G	0	0	humanos	humans	\N	\N
1474	1466	/Pongo	3	\N	\N	\N	0	0	orangotangos	orangutans	\N	\N
1466	462	Ponginae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1475	1468	/Gorilla	2	\N	植	\N	0	0	gorilas	gorillas	\N	\N
1468	1467	Gorillini	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1476	1473	/H.sapiens	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1477	1476	/H.s.sapiens	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1478	1476	/H.s.neanderthalensis	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1479	1471	/Australopithecus	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1480	1471	/Ardipithecus	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1481	1471	/Paranthropus	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1482	89	Cladistia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1483	89	Actinopteri	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1539	1518	Neoteleostei	16,4k	\N	\N	\N	0	0	\N	\N	\N	\N
1486	1485	/E. calabaricus	\N	\N	\N	Fw,c	0	0	\N	reedfish|ropefish|snakefish	\N	\N
1485	1484	/Erpetoichthys	1	\N	\N	\N	0	0	\N	\N	\N	\N
1487	1484	/Polypterus	13	\N	\N	F	0	0	\N	\N	\N	\N
1484	1482	Polypteriformes	14	\N	清捕 <1m	F	0	0	\N	bichirs	\N	\N
1488	1483	Chondrostei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1489	1483	Neopterygii	~26,75k	\N	\N	\N	0	0	\N	\N	\N	\N
1490	1488	Acipenseriformes=Chondrostea	29	\N	泳底清岸 1-6m	Hn	0	0	(esturjão,peixe-espátula)	sturgeon	\N	\N
1491	1489	Lepisosteiformes	7	\N	清咸	Mnc	0	0	\N	gars	\N	\N
1492	1489	Halecostomi	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1493	1492	Halecomorphi	1	\N	\N	\N	0	0	\N	\N	\N	\N
1541	1539	Ateleopodomorpha	12	\N	\N	\N	0	0	\N	\N	\N	\N
1540	1539	Stenopterygii	400	\N	\N	\N	0	0	\N	\N	\N	\N
1542	1539	Cyclosquamata+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1494	1492	Teleostei	~26,74k	\N	沃(外)!	\N	0	0	\N	\N	\N	\N
1495	1494	Elopomorpha	877	\N	海!清	G	0	0	\N	\N	\N	\N
1496	1495	Elopiformes	9	\N	\N	\N	0	0	\N	\N	\N	\N
1498	1494	Osteoglossomorpha	222	\N	清!	T!	0	0	\N	\N	\N	\N
1499	1497	Albuliformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1500	1497	Notacanthiformes+Anguilliformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1501	1500	Notacanthiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1544	1542	non-Cyclosquamata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1497	1495	non-Elopiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1502	1500	Anguilliformes	~800	\N	捕!	\N	0	0	enguias	eels	\N	\N
1503	1498	Osteoglossiformes	220	\N	\N	Ms F a Ss	0	0	(pirarucu,aruanã)	\N	\N	\N
1504	1498	Hiodontiformes	2	\N	\N	\N	1	0	\N	\N	\N	\N
1505	1503	Pantodontoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1506	1503	non-Pantodontoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1507	1505	Pantodontidae	\N	\N	清	F	0	0	\N	freshwater butterflyfish|African butterflyfish	\N	\N
1508	1506	Osteoglossoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1509	1506	Notopteroidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1510	1508	Osteoglossidae	10	\N	\N	\N	0	0	(pirarucu,aruanã)	\N	\N	\N
1511	1509	Notopteroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1512	1509	Mormyroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1513	1511	Notopteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1514	1512	Gymnarchidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1515	1512	Mormyridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1516	1494	Clupeocephala	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1517	1516	Otocephala=Ostarioclupeomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1519	1517	Ostariophysi	~8,24k	\N	\N	\N	0	0	\N	\N	\N	\N
1521	1520	Clupeiformes	400	\N	\N	\N	0	0	\N	\N	\N	\N
1522	1521	Clupeidae	\N	\N	\N	\N	0	0	(sardinhas+arengues+sável+anchoveta)	\N	\N	\N
1523	1521	Engraulidae	\N	\N	\N	\N	0	0	(anchovas)	\N	\N	\N
1546	1544	Acanthomorpha	15,5k	\N	\N	\N	0	0	\N	\N	\N	\N
1520	1517	Clupeomorpha	\N	\N	海!社食溯!过	G	0	0	\N	\N	\N	\N
1524	1519	Gonorynchiformes	40	\N	\N	\N	0	0	\N	milkfishes	\N	\N
1525	1519	Otophysi	~8,2k	\N	\N	\N	0	0	\N	\N	\N	\N
1529	1527	Gymnotiformes+Siluriformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1545	1544	Scopelomorpha	250	\N	\N	\N	0	0	\N	\N	\N	\N
1530	1529	Gymnotiformes	~200	\N	夜!清众电	TMs	0	0	(poraquê)	\N	\N	\N
1553	1552	Gadidae	\N	\N	海中!底肉产	Hn!	0	0	\N	cods|codfishes|true cods	\N	\N
1518	1516	Euteleostei	~17k	\N	\N	\N	0	0	\N	\N	\N	\N
1532	1518	Protacanthopterygii	500	\N	\N	\N	0	0	\N	\N	\N	\N
1533	1532	Esociformes	10	\N	清	t Hn	0	0	\N	\N	\N	\N
1534	1533	Esocidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1535	1534	/Esox	\N	\N	\N	\N	0	0	lúcio	\N	\N	\N
1536	1532	Salmoniformes	190	\N	\N	\N	0	0	\N	\N	\N	\N
1537	1536	Salmonidae	\N	\N	\N	\N	0	0	salmões+trutas	\N	\N	\N
1538	1532	Osmeriformes	290	\N	\N	\N	0	0	\N	\N	\N	\N
1543	1542	Cyclosquamata	230	\N	\N	\N	0	0	\N	\N	\N	\N
1548	1546	non-Lampridiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1549	1548	Polymixiiformes	10	\N	\N	\N	0	0	\N	\N	\N	\N
1550	1548	non-Polymixiiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1551	1550	Percopsiformes	9	\N	\N	\N	0	0	\N	\N	\N	\N
1547	1546	Lampridiformes=Lampriformes=Allotriognathi	23	\N	\N	\N	0	0	\N	\N	\N	\N
1554	1552	Merlucciidae	5g	\N	\N	f oa op	0	0	merluzas	hakes	\N	\N
1552	1550	Gadiformes=Anacanthini	10f	\N	\N	\N	0	0	\N	\N	\N	\N
1555	1550	Acanthopterygii	~14,8k	\N	\N	\N	0	0	\N	\N	\N	\N
1556	1555	Berycimorphaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1557	1556	Beryciformes	\N	\N	\N	\N	0	0	\N	alfonsinos+whalefishes	\N	\N
1558	1556	Trachichthyiformes	\N	\N	\N	\N	0	0	\N	pinecone fishes+slimeheads	\N	\N
1559	1555	non-Berycimorphaceae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1560	1559	Holocentrimorphaceae	\N	\N	\N	\N	0	0	\N	squirrelfish+soldier fishes	\N	\N
1561	1559	Percomorpha	\N	\N	\N	\N	0	0	\N	(tuna+seahorses+gobies+cichlids+flatfish+wrasse+perches+anglerfish+pufferfish)	\N	\N
1562	1561	"Perciformes"	~10k	\N	海!	G	1	0	\N	\N	\N	\N
1563	1561	Smegmamorpha	2k+	\N	\N	\N	0	0	\N	\N	\N	\N
1564	1563	Synbranchiformes	~100	\N	\N	\N	0	0	\N	swamp eels	\N	\N
1565	1564	Synbranchidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1566	1565	/Synbranchus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1567	1566	/S. marmoratus	\N	\N	\N	\N	0	0	muçum	\N	\N	\N
1568	1563	Gasterosteiformes	275	\N	\N	\N	0	0	\N	\N	\N	\N
1569	1568	Gasterosteoidei	\N	\N	\N	\N	0	0	\N	sticklebacks	\N	\N
1528	1527	Characiformes	~1,7k	\N	\N	MsF	0	0	(pacus+tambaquis+matrinxãs+piranhas+aracus)	\N	\N	\N
1571	1570	Syngnathidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1572	1571	Hippocampinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1573	1572	/Hippocampus	54	\N	\N	\N	0	0	cavalos-marinhos	seahorses	\N	\N
1570	1568	Syngnathoidei	\N	\N	\N	\N	0	0	\N	(seahorses)	\N	\N
1574	1562	Labroidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1641	1637	Tridacnidae	\N	\N	10-137cm	\N	0	0	\N	\N	\N	\N
1575	1574	Cichlidae	~1,65k	2-3k	\N	\N	0	0	(tilápias+tucunarés+acarás+acarás-disco)	\N	\N	\N
1527	1525	Characiphysi	~4,9k	\N	\N	\N	0	0	\N	\N	\N	\N
1526	1525	Cypriniformes	~4,25k	\N	\N	Sse! SFMnc	0	0	(carpas)	\N	\N	\N
1531	1529	Siluriformes	~3k	\N	夜	\N	0	0	(surubins+pirararas+piraíbas+jaús+cambebas)	\N	\N	\N
1576	55	Aplacophora+Polyplacophora	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1579	55	Conchifera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1577	1576	Aplacophora	320	\N	\N	\N	0	0	\N	\N	\N	\N
1578	1576	Polyplacophora	940	\N	\N	\N	0	0	\N	\N	\N	\N
1580	1579	Monoplacophora	29	\N	\N	\N	0	0	\N	\N	\N	\N
1582	1579	G+C+S	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1640	1636	Anomalodesmata	\N	\N	挖	\N	0	0	\N	\N	\N	\N
1586	1583	Orthogastropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1642	1577	Solenogastres=Neomeniomorpha	\N	\N	捕(Cnidaria)!	\N	0	0	\N	\N	\N	\N
1659	1653	Anostomidae+Chilodontidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1585	1582	non-Gastropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1587	1585	Scaphopoda	400-600	\N	\N	\N	0	0	\N	\N	\N	\N
1588	1585	Cephalopoda	800	\N	\N	\N	0	0	(polvos+lulas)	\N	\N	\N
1643	1577	Caudofoveata=Chaetodermomorpha	150	\N	挖	\N	0	0	\N	\N	\N	\N
1645	1578	Chitonina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1583	1582	Gastropoda	\N	\N	\N	\N	0	0	(caramujos+caracóis+lesmas+conchas-da-praia)	\N	\N	\N
1581	1579	Bivalvia	~10k	\N	\N	\N	0	0	(ostras+conchas-da-praia)	\N	\N	\N
1589	1588	Nautiloidea	6	\N	\N	oip T sT	0	0	\N	\N	\N	\N
1590	1588	non-Nautiloidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1592	1590	Ammonoidea	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1591	1590	Coleoidea	800	\N	\N	\N	0	0	\N	\N	\N	\N
1593	1591	Belemnoidea	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1594	1591	non-Belemnoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1596	1594	Decapodiformes=Decabrachia	500	\N	\N	\N	0	0	lulas+sépias	\N	\N	\N
1597	1595	Vampyromorpha=Vampyromorphida	1	\N	\N	\N	0	0	\N	\N	\N	\N
1598	1595	Octopoda	\N	\N	\N	\N	0	0	polvos	octopuses	\N	\N
1595	1594	Octopodiformes	300	\N	\N	\N	0	0	\N	\N	\N	\N
1599	1598	Cirrina=Cirrata	42	\N	\N	\N	0	0	\N	\N	\N	\N
1600	1598	Incirrina=Incirrata	215+	\N	\N	\N	0	0	\N	\N	\N	\N
1601	1589	/Nautilus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1602	1589	/Allonautilus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1603	1587	Gadilida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1604	1587	Dentaliida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1584	1583	Eogastropoda=Prosobranchia	18k	\N	海清土(4k)	\N	0	0	\N	\N	\N	\N
1605	1586	Vestigastropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1606	1586	Cocculinoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1607	1586	Neritopsina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1608	1586	Apogastropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1609	1608	Caenogastropoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1610	1608	Heterobranchia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1611	1610	Heterostropha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1612	1610	Euthyneura	22k	\N	\N	\N	0	0	\N	\N	\N	\N
1614	1612	Nudibranchia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1646	1578	Acanthochitonina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1616	1581	Heterodonta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1617	1581	Pteriomorpha	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1618	1581	Protobranchia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1619	1581	Palaeoheterodonta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1621	1619	Unionoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1620	1619	Trigoniida	1g	\N	\N	a	0	0	\N	\N	\N	\N
1622	1620	/Trigonia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1623	1618	Nuclanoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1624	1618	Nuculida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1625	1618	Solemyoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1627	1617	Eupteriomorphia	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1626	1617	Arcoida	\N	\N	\N	\N	0	0	arcas	\N	\N	\N
1628	1627	Limoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1630	1627	Pterioida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1631	1627	Pectinoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1632	1627	Ostreoida	\N	\N	\N	\N	0	0	ostras	\N	\N	\N
1629	1627	Mytiloida	\N	\N	\N	\N	0	0	mexilhões	\N	\N	\N
1633	1630	Pinnoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1634	1630	Pterioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1635	1616	Archiheterodonta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1636	1616	Euheterodonta	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1637	1636	Veneroida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1638	1636	Lucinoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1639	1636	Myoida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1644	1578	Lepidopleurina	\N	\N	小	\N	0	0	\N	\N	\N	\N
1615	1612	Pulmonata	20k	\N	土!清	G T t	0	0	caracóis+lesmas+caramujos	\N	\N	\N
1613	1612	Opisthobranchia	2k	\N	海!	\N	0	0	\N	\N	\N	\N
1062	1060	non-Ponerinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
411	409	Canidae	37	\N	兵	\N	0	0	cachorros|cães+lobos+raposas	dogs+wolves+foxes	\N	\N
1647	1528	Citharinidae+Distichodontidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1651	1648	Hemiodontidae	29	\N	清 <50cm	Ms	0	0	\N	\N	\N	\N
1652	1651	/Hemiodus	\N	\N	\N	\N	0	0	charuto	\N	\N	\N
1653	1648	Curimatidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1654	1648	Lebiasinidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1662	1653	Prochilodontidae+Curimatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1670	1660	/Leporinus	\N	\N	\N	\N	0	0	piau+aracu+camunaro?	\N	\N	\N
1660	1659	Anostomidae	140+	\N	清 15-60cm	am!	0	0	\N	\N	\N	\N
1668	1654	Lebiasinidae	~67	\N	清虫(子专Diptera)小! 2-7cm	Ms cr pa	0	0	\N	\N	\N	\N
1671	1660	/Leporellus	\N	\N	\N	\N	0	0	charuto	\N	\N	\N
1661	1659	Chilodontidae	8	\N	头下 <7cm	Ms	0	0	\N	\N	\N	\N
1664	1662	Curimatidae	~100	\N	清植过食	Ms-c(s)	0	0	\N	\N	\N	\N
1672	1663	/Prochilodus	13	\N	\N	\N	0	0	\N	\N	\N	\N
1663	1662	Prochilodontidae	21	\N	<80cm	Ms(n-s)	0	0	\N	\N	\N	\N
1673	1672	/P. lineatus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1674	1672	/P. nigricans	\N	\N	\N	\N	0	0	curimatã	\N	\N	\N
1665	1654	Hepsetidae	2	\N	\N	F	0	0	\N	\N	\N	\N
1666	1654	Ctenoluciidae	7	\N	清捕长 <1m	Ms pa	0	0	\N	\N	\N	\N
1669	1668	/Copella	\N	\N	\N	\N	0	0	tetras	\N	\N	\N
1655	1648	Parodontidae	~32	\N	清山底	pa(e)Ms	0	0	\N	\N	\N	\N
1649	1647	Citharinidae	8	\N	清过食 <84cm <18kg	FT	0	0	\N	\N	\N	\N
1657	1648	Crenuchidae	74	\N	清 <10cm!	Ms-pa	0	0	\N	\N	\N	\N
1650	1647	Distichodontidae	90	\N	植捕清	F	0	0	\N	\N	\N	\N
1658	1648	Characidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1648	1528	Characidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
399	397	Mysticeti	15	\N	过 2 narinas	\N	0	0	baleias	whales	\N	\N
1676	1667	/Hoplerythrinus	3	\N	\N	\N	0	0	\N	\N	\N	\N
1675	1667	/Erythrinus	2	\N	\N	\N	0	0	\N	\N	\N	\N
1677	1667	/Hoplias	13	\N	\N	\N	0	0	traíra|lobó	\N	\N	\N
1667	1654	Erythrinidae	16	\N	清虫(子)鱼(成) <90cm	cr-ar	0	0	\N	\N	\N	\N
1678	1668	/Nannostomus	\N	\N	\N	\N	0	0	\N	pencilfish	\N	\N
1656	1648	Gasteropelecidae	9	\N	清表	Mc-s	0	0	\N	freshwater hatchetfishes	\N	\N
1679	1657	/Characidium	\N	\N	\N	\N	0	0	charuto	\N	\N	\N
1680	1658	/Colossoma	\N	\N	\N	\N	0	0	tambaqui	\N	\N	\N
1681	1658	/Salminus	\N	\N	\N	\N	0	0	dourado	\N	\N	\N
1682	1658	/Brycon	\N	\N	\N	\N	0	0	matrinxã	\N	\N	\N
1683	1658	/Piaractus	\N	\N	\N	\N	0	0	pacu	\N	\N	\N
1684	1658	/Chalcinus	\N	\N	\N	\N	0	0	sardinha	\N	\N	\N
1685	1658	/Triportheus	\N	\N	\N	\N	0	0	sardinha	\N	\N	\N
1686	1663	/Semaprochilodus	\N	\N	\N	\N	0	0	jaraqui	\N	\N	\N
1687	1530	Gymnotoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1688	1530	Sternopygoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1689	1687	Gymnotidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1690	1689	/Gymnotus	31-36	\N	<1m	\N	0	0	\N	\N	\N	\N
1691	1689	/Electrophorus	\N	\N	电(<600V) <20kg <2m	\N	0	0	\N	\N	\N	\N
1692	1691	/E. electricus	\N	\N	\N	\N	0	0	poraquê	electric eel	\N	\N
1693	1688	Hypopomidae+Rhamphichthyidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1694	1693	Hypopomidae	20	\N	泽目(很小) 9-35cm	N am! pa-Ms	0	0	\N	\N	\N	\N
1695	1693	Rhamphichthyidae	16	\N	夜(日捕)	Ms	0	0	\N	\N	\N	\N
1696	1688	Sternopygidae+Apteronotidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1697	1696	Sternopygidae	30	\N	深(<20m) <1,4m	pa Ms	0	0	\N	glass knifefishes|rattail knifefishes	\N	\N
1698	1696	Apteronotidae	84	\N	虫鱼几植 <1,3m	pa Ms	0	0	\N	\N	\N	\N
1700	1531	Loricaroidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1702	1699	Siluroidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1753	399	Balaenidae+Neobalaenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1699	1531	Diplomystoidei+Siluroidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1703	1700	Nematogenyidae+Trichomycteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1704	1703	Nematogenyidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1706	1700	Callichthyidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1707	1706	Callichthyidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1708	1706	Astroblepidae+Loricariidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1709	1708	Astroblepidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1769	398	Physeteroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1711	1701	Diplomystidae	6	\N	虫底灭 <32cm	Ms	0	0	\N	\N	\N	\N
1701	1699	Diplomystoidei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1712	1702	Hypsidoroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1713	1702	non-Hypsidoroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1714	1712	Hypsidoridae	\N	\N	\N	\N	0	1	\N	\N	\N	\N
1715	1713	Cetopsoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1716	1713	non-Cetopsoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1717	1715	Cetopsidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1718	1716	Siluroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1719	1716	non-Siluroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1720	1718	Siluridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1721	1719	Bagridae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1723	1721	Arioidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1724	1721	Ictaluroidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1725	1723	Arioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1726	1723	Mochokidae+Claroteidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1727	1726	Mochokidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1728	1726	Claroteidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1729	1725	Pangasiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1730	1724	Ictaluroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1731	1724	Clarioidea+Sisoroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1732	1731	Clarioidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1733	1731	Sisoroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1734	1730	Plotosidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1735	1730	Ictaluridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1736	1732	Clariidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1737	1733	Ailiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1738	1733	Sisoridae+Bagridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1739	1738	Sisoridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1740	1738	Bagridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1722	1719	Doradoidea+Pimelodoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1741	1722	Doradoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1742	1722	Pimelodoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1743	1741	Aspredinidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1744	1741	Doradidae+Auchenipteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1745	1744	Doradidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1746	1744	Auchenipteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1747	1742	Heptapteridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1748	1742	Pseudopimelodidae+Pimelodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1749	1748	Pseudopimelodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1750	1748	Pimelodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1705	1703	Trichomycteridae	207	\N	<2,6cm!	N	0	0	(cambeba)	\N	\N	\N
1710	1708	Loricariidae	680+	\N	夜!杂清	cr pa Ms T sT	0	0	(cascudo+acari+bodó)	\N	\N	\N
1762	1756	/B. edeni	\N	\N	\N	\N	0	0	\N	Bryde's whale	\N	\N
398	397	Odontoceti	75	\N	肉兵 1 narina	\N	0	0	golfinhos+botos	dolphins+river dolphins	\N	\N
1751	399	Eschrichtiidae	\N	\N	\N	\N	0	0	\N	gray whale	\N	\N
1752	399	Balaenopteridae	\N	\N	\N	\N	0	0	\N	rorquals	\N	\N
1756	1752	/Balaenoptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1757	1752	/Megaptera	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1763	1756	/B. acutorostrata	\N	\N	\N	\N	0	0	\N	minke whale	\N	\N
1755	1753	Neobalaenidae	\N	\N	\N	\N	1	0	\N	pygmy right whale	\N	\N
1758	1757	/M. novaeangliae	\N	\N	\N	\N	0	0	\N	humpback whale	\N	\N
1759	1756	/B. musculus	\N	\N	\N	\N	0	0	\N	blue whale	\N	\N
1760	1756	/B. physalus	\N	\N	\N	\N	0	0	\N	fin whale	\N	\N
1761	1756	/B. borealis	\N	\N	\N	\N	0	0	\N	sei whale	\N	\N
1754	1753	Balaenidae	\N	\N	\N	\N	1	0	\N	right whales	\N	\N
1764	1754	/Balaena	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1765	1754	/Eubalaena	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1766	1764	/B. mysticetus	\N	\N	\N	\N	0	0	\N	Greenland right whale|bowhead whale	\N	\N
1767	1765	/E. australis	\N	\N	\N	Hs	0	0	\N	\N	\N	\N
1768	1765	/E. glacialis	\N	\N	\N	Hn	0	0	\N	\N	\N	\N
1770	398	non-Physeteroidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1772	1769	Physeteridae	\N	\N	\N	\N	0	0	cachalote|cacharréu	giant sperm whale	\N	\N
1771	1769	Kogiidae	\N	\N	\N	\N	0	0	\N	dwarf sperm whale|pygmy sperm whale	\N	\N
1773	1770	Platanistidae	\N	\N	\N	r.G r.I	0	0	\N	\N	\N	\N
1774	1770	non-Platanistidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1775	1774	Ziphiidae	\N	\N	\N	\N	0	0	\N	beaked whales	\N	\N
1776	1774	non-Ziphiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1777	1776	Lipotidae	\N	\N	\N	r.Y	0	0	\N	\N	\N	\N
1778	1776	Delphinoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1779	1778	Delphinoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1780	1778	Pontoporiidae+Iniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1782	1780	Iniidae	\N	\N	\N	r.A	0	0	\N	\N	\N	\N
1781	1780	Pontoporiidae	\N	\N	\N	r.L	0	0	\N	\N	\N	\N
1784	1779	Monodontidae+Phocoenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1832	1831	Amblypygi	70	\N	夜 4-45mm	T sT	0	0	\N	\N	\N	\N
1787	1785	/Delphinapterus	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1789	1785	/Monodon	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1785	1784	Monodontidae	2	\N	\N	\N	0	0	narval+beluga	\N	\N	\N
1790	1789	/M. monoceros	\N	\N	\N	\N	0	0	narval	narwhal	\N	\N
1788	1787	/D. leucas	\N	\N	\N	\N	0	0	beluga	beluga	\N	\N
1786	1784	Phocoenidae	\N	\N	\N	\N	0	0	toninhas|marsuínos	porpoises	\N	\N
1836	1835	Uropygi	85	\N	<65mm	\N	0	0	\N	\N	\N	\N
1783	1779	Delphinidae	40	\N	50-200kg! <40000kg 1,2-9m 孕(10-12 meses, 1子)	\N	0	0	\N	\N	\N	\N
1791	1783	Delphininae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1792	1783	Lissodelphininae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1794	1783	Stenoninae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1796	1791	/Delphinus	2	\N	80-150kg! <235kg 1,9-2,5m	\N	0	0	\N	\N	\N	\N
1797	1791	/Lagenodelphis	1	\N	深 200kg 2,75m	T	0	0	\N	\N	\N	\N
1798	1791	Sousa	4	\N	岸 100-139kg! 1,8-2,6m	T sT	0	0	\N	\N	\N	\N
1799	1791	/Stenella	5	\N	\N	T t	0	0	\N	\N	\N	\N
1800	1791	/Tursiops	3	\N	久40y 2-4m 150-650kg	G	0	0	\N	\N	\N	\N
1837	1835	Schizomida	80	\N	土 <3mm	T sT	0	0	\N	\N	\N	\N
1801	1792	/Lissodelphis	2	\N	深!快社(100s-3k) 2-2,5m 80-100kg 久40y	t!	0	0	\N	\N	\N	\N
1802	1792	/Cephalorhynchus	4	\N	小	\N	0	0	\N	\N	\N	\N
1795	1783	/Lagenorhynchus	6	\N	\N	\N	0	0	\N	\N	\N	\N
1803	1794	/Steno	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1805	1803	/S. bredanensis	\N	\N	远 2,1-2,8m 90-150kg	T	0	0	\N	\N	\N	\N
1804	1794	/Sotalia	3	\N	\N	Mc-s r.A	0	0	boto tucuxi	\N	\N	\N
1793	1783	Orcininae	9	\N	\N	\N	0	0	\N	\N	\N	\N
1806	1793	/Grampus	1	\N	深岸 3-4,3m 300-500kg	T t	0	0	\N	\N	\N	\N
1807	1793	/Globicephala	2	\N	久45y(男)-60y(女) 6,5-7,2m 1300-3200kg	\N	0	0	\N	\N	\N	\N
1808	1793	/Feresa	1	\N	2m 社10-30+	\N	0	0	\N	\N	\N	\N
1811	1793	/Peponocephala	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1809	1793	/Orcaella	2	\N	岸 1,8-2,75m <130kg	oip	0	0	\N	\N	\N	\N
1810	1793	/Orcinus	1	\N	岸! 6-8m <6000kg+	f!G	0	0	\N	\N	\N	\N
1813	1811	/P. electra	\N	\N	久20y(男)-30y+(女) 3m 200kg 捕(Teuthida)	T	0	0	\N	\N	\N	\N
1812	1793	/Pseudorca	1	\N	岸 4,9-6,1m 1200-2200kg	\N	0	0	\N	\N	\N	\N
1814	159	Scorpiones+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1815	159	Araneae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1816	1814	Scorpiones	1,5-2k	\N	夜!土!木林漠岸 3-9cm!	T! sT!	0	0	escorpiões	scorpions	\N	\N
1817	1814	non-Scorpiones	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1819	1817	non-Opiliones	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1840	1838	Opilioacarida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1818	1817	Opiliones=Phalangida	4,5k	\N	肉!死! <1-20mm 5-10mm!	\N	0	0	opiliões	harvestmen|harvesters|daddy longlegs	\N	\N
1841	1838	Holothyrida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1842	1838	Ixodida	~900	\N	\N	\N	0	0	\N	\N	\N	\N
1821	1819	Pseudoscorpiones	2k	\N	土石木岸死 <8mm!	G	0	0	\N	\N	\N	\N
1820	1819	Solifugae	900	\N	肉杂日!漠土挖无毒	q T sT	0	0	\N	\N	\N	\N
1822	1815	Ricinulei+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1823	1815	Acari+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1825	1823	Pycnogonida+Palpigradi	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1829	1822	non-Ricinulei	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1831	1829	non-Araneae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1833	1831	non-Amblypygi	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1834	1833	Thelyphonida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1835	1833	non-Thelyphonida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
456	453	Aotidae	10	\N	夜	\N	0	0	\N	\N	\N	\N
1826	1825	Pycnogonida=Pantopoda	1k	\N	\N	\N	0	0	\N	\N	\N	\N
1827	1825	Palpigradi	60	\N	土 <3mm!	T sT	0	0	\N	\N	\N	\N
1828	1822	Ricinulei	33	\N	pesados 5-10mm	N F	0	0	\N	\N	\N	\N
1824	1823	Acari	44k+	1M+	\N	\N	0	0	\N	\N	\N	\N
1863	1861	Liphistiidae	8g,~100	\N	穴夜(男)久众y	\N	0	0	\N	\N	\N	\N
1864	1862	Mygalomorphae=Orthognatha	2,6k	\N	\N	\N	0	0	(aranhas-caranguejeiras)	(tarantulas)	\N	\N
1843	1838	Mesostigmata	\N	\N	\N	\N	0	0	(varroa)	mites	\N	\N
1845	1842	Ixodidae+Argasidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1860	1855	Oribatida=Cryptostigmata	~6,6k	\N	0.2-1.4mm	\N	0	0	\N	moss mites|beetle mites	\N	\N
1830	1829	Araneae	~40k	120-200k	无支(<0.5-90mm)	\N	0	0	aranhas	spiders	\N	\N
1848	1846	/Ixodes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1846	1845	Ixodidae	14g,700+	\N	\N	\N	0	0	carrapatos	hard ticks|scale ticks	\N	\N
1847	1845	Argasidae	~200	\N	\N	\N	0	0	carrapatos	soft ticks	\N	\N
1844	1842	Nuttalliellidae	1	\N	\N	\N	0	0	\N	\N	\N	\N
1849	1844	/Nuttalliella	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1850	1849	/N. namaqua	\N	\N	共	Fs	0	0	\N	\N	\N	\N
1851	1843	Sejoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1852	1843	Trigynaspida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1853	1843	Monogynaspida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1854	1839	Trombidiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1855	1839	Sarcoptiformes	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1856	1854	Prostigmata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1857	1854	Sphaerolichida	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1858	1855	Astigmata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1859	1855	Endeostigmata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1839	1824	Acariformes=Actinotrichida	32k+	~1M	\N	\N	0	0	\N	\N	\N	\N
1838	1824	Parasitiformes	12k+	100-200k	\N	\N	0	0	\N	\N	\N	\N
1861	1830	Mesothelae	87	\N	\N	Sse ch jp ml su	0	0	\N	\N	\N	\N
1862	1830	Opisthothelae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1865	1862	Araneomorphae=Labidognatha	37k	\N	\N	\N	0	0	\N	\N	\N	\N
1866	1864	Atypoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1867	1864	non-Atypoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1871	1867	Paratropidae	8	\N	\N	Mc(s) Ms(n)	1	0	\N	\N	\N	\N
1869	1866	Antrodiaetidae	30	\N	\N	us(e,w) jp	0	0	\N	\N	\N	\N
1868	1866	Mecicobothriidae	9	\N	<1-2cm+ <1cm!	Mn(s) Ms(s)	0	0	\N	\N	\N	\N
1870	1866	Atypidae	43	\N	土穴丝!	MnFES	0	0	\N	\N	\N	\N
1872	1867	"Hexathelidae"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1874	1867	Bipectina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1873	1867	"Dipluridae"	\N	\N	小-中 3-15mm	T! t	0	0	\N	\N	\N	\N
1875	1874	Idiopidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1876	1874	Theraphosidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1879	1875	Ctenizidae	120	\N	夜!中	M(T) F(s,n) Es S a oc	0	0	\N	\N	\N	\N
1881	1875	Idiopidae	275	\N	\N	Mcs F m i Sse oc	0	0	\N	\N	\N	\N
1877	1875	Actinopodidae	42	\N	\N	Ms-c a	0	0	\N	\N	\N	\N
1878	1875	Migidae	90	\N	小	Ms(s) Fc-s m a(e,w) nz nc	0	0	\N	\N	\N	\N
1880	1875	Cyrtaucheniidae	126	\N	\N	Mn-s F Es Sc tl	0	0	\N	\N	\N	\N
1882	1876	Microstigmatidae	15	\N	土丝!(小)	Ms Fs	0	0	\N	\N	\N	\N
1883	1876	Nemesiidae	300+	\N	穴大支(广)	\N	0	0	\N	\N	\N	\N
1887	1883	/Atmetochilus	\N	\N	女(4cm+)	\N	0	0	\N	\N	\N	\N
1884	1876	Barychelidae+Theraphosidae	\N	\N	sobem vidro	\N	0	0	\N	\N	\N	\N
1885	1884	Barychelidae	300	\N	\N	T a	0	0	\N	\N	\N	\N
1886	1884	Theraphosidae	900	\N	草林山漠木土虫捕肉(大)丝!毛(很大)	Mn(s) Mc-s F Ss oc a Es om(w)	0	0	\N	\N	\N	\N
1889	1865	Neocribellatae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1888	1865	Hypochilidae	12	\N	支(长)	us(e,w) ch	0	0	\N	\N	\N	\N
1890	1889	Austrochiloidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1891	1889	Araneoclada	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1892	1890	Austrochilidae	9	\N	山(林)	Ms(s) ta	0	0	\N	\N	\N	\N
1893	1890	Gradungulidae	16	\N	中-大	a nz	0	0	\N	\N	\N	\N
1894	1891	Haplogynae	\N	\N	目!(6)	\N	0	0	\N	\N	\N	\N
1895	1891	Entelegynae	\N	\N	目!(8)	\N	0	0	\N	\N	\N	\N
1938	1929	Oecobiidae	100	\N	目(6-8) 漠(大) 众专(捕Formicidae) 2mm-2cm	G	0	0	\N	\N	\N	\N
1896	1894	Filistatidae	100	\N	cribelo	Mn-s Fc-n Sc-s oc m	0	0	\N	\N	\N	\N
1897	1894	non-Filistatidae	\N	\N	无cribelo	\N	0	0	\N	\N	\N	\N
1898	1897	non-"Scytodoids"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1899	1897	"Scytodoids"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1901	1898	non-Caponiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1903	1901	Dysderoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1907	1903	Orsolobidae+Oonopidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1900	1898	Caponiidae	70	\N	几捕(Araneae)目(2)! 2-5mm	Fc Fs Mn(c)-s	0	0	\N	\N	\N	\N
1902	1901	Tetrablemiidae	126	\N	土朽穴几目(4)	T	0	0	\N	\N	\N	\N
1904	1903	Trogloraptoridae	1	\N	穴 7,6cm	Mn(Oregon)	0	0	\N	\N	\N	\N
1905	1903	Segestriidae	106	\N	目(6)	G	0	0	\N	\N	\N	\N
1906	1903	Dysderidae	500	\N	目(6)	ES	0	0	\N	\N	\N	\N
1908	1907	Orsolobidae	180	\N	\N	Fs Ms a nz	0	0	\N	\N	\N	\N
1909	1907	Oonopidae	2,3k	\N	目(6)! 1-3mm!	G	0	0	\N	\N	\N	\N
1910	1899	Pholcoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1911	1899	Leptonetoidea+Scytodoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1912	1911	Leptonetoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1913	1911	Scytodoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1914	1910	Diguetidae+Plectreuridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1939	1929	Hersiliidae	150	\N	10-18mm	T sT	0	0	\N	\N	\N	\N
1915	1914	Diguetidae	15	\N	\N	\N	0	0	\N	\N	\N	\N
1917	1914	Plectreuridae	33	\N	目(8)	\N	0	0	\N	\N	\N	\N
1916	1910	Pholcidae	1k	\N	身2-10mm 支50mm 目(6-8)	G	0	0	\N	\N	\N	\N
1919	1912	Telemidae+Leptonetidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1918	1912	Ochyroceratidae	154	\N	目(6)	\N	0	0	\N	\N	\N	\N
1921	1919	Leptonetidae	200	\N	目(6)	\N	0	0	\N	\N	\N	\N
1920	1919	Telemidae	57	\N	目(6)	\N	0	0	\N	\N	\N	\N
1922	1913	Periegopidae	3	\N	目(6) 8mm	\N	0	0	\N	\N	\N	\N
1923	1913	non-Periegopidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1924	1923	"Sicariidae"	132	\N	目(6) picada necrosante	\N	0	0	\N	\N	\N	\N
1925	1923	Drymusidae+Scytodidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1926	1925	Drymusidae	10	\N	\N	Ms cb fs(2)	0	0	\N	false violin spider	\N	\N
1927	1925	Scytodidae	220	\N	\N	G	0	0	\N	spitting spider	\N	\N
1928	1924	/Loxosceles	\N	\N	\N	\N	0	0	aranha-marrom	violin spiders	\N	\N
1929	1895	Eresoidea	350	\N	目(8)	\N	0	0	\N	\N	\N	\N
1930	1895	"Palpimanoidea"	\N	\N	目(8)	\N	0	0	\N	\N	\N	\N
1931	1895	"Clubionidae"	541	\N	\N	\N	1	0	\N	\N	\N	\N
1932	1895	Miturgidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1933	1932	Nicodamidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1934	1932	Cryptothelidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1935	1932	Cycloctenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1937	1932	Miturgidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1940	1929	Eresidae	100	\N	社	V! br	0	0	\N	velvet spiders	\N	\N
1936	1932	Zodariidae	828	\N	小-中象(Formicidae)	T-t(q)	0	0	\N	ant spiders	\N	\N
1942	1930	Palpimanidae	130	\N	目(6) 支上(很大)	Ms F me Sc,se i I	0	0	\N	\N	\N	\N
1941	1930	Stenochilidae	12	\N	\N	Sse i I	0	0	\N	\N	\N	\N
1963	1950	Philodromidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1945	1944	/H. palpimanoides	\N	\N	\N	nz	0	0	\N	\N	\N	\N
1951	1948	Amaurobiidae	300-600	\N	\N	M Fnsc ES a(e) nz ta	0	0	\N	\N	\N	\N
1957	1956	Tengellidae	30	\N	目(8)	M m(1) nz(1)	0	0	\N	\N	\N	\N
1944	1943	/Huttonia	21	\N	\N	\N	0	0	\N	\N	\N	\N
1943	1930	Huttoniidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1946	1895	Orbiculariae+RTA	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1948	1946	RTA	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1958	1956	Lycosoidea	4k	\N	目(8)	\N	0	0	\N	\N	\N	\N
1952	1948	Agelenidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1956	1948	Tengellidae+Lycosoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1949	1948	Dictynoidea	6f,1640	\N	目(8)	\N	0	0	\N	\N	\N	\N
1955	1952	Titanoecidae	46	\N	\N	MESI ng	0	0	\N	\N	\N	\N
1954	1952	Amphinectidae	180	\N	\N	Ms(w) us(s) a nz	0	0	\N	\N	\N	\N
1953	1952	Agelenidae	0,5-1,2k	\N	社 4-20mm(身)! <10cm(支)	\N	0	0	\N	\N	\N	\N
1959	1953	/Tegenaria	\N	\N	0,53m/s	\N	0	0	\N	\N	\N	\N
1960	1950	Zoridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1961	1950	Selenopidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1962	1950	Sparassidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1965	1950	Salticidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1966	1965	Gnaphosoidea+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1967	1965	C+A+S	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1968	1966	Corinnidae+Liocranidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1969	1966	Gnaphosoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1970	1968	Corinnidae	\N	\N	\N	\N	0	0	\N	ant-mimic spiders	\N	\N
1971	1968	Liocranidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1972	1969	Gallieniellidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1973	1969	Lamponidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1974	1969	Trochanteriidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1975	1969	Cithaeronidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1976	1969	Ammoxenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1977	1969	Gnaphosidae+Prodidomidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1978	1977	Gnaphosidae	\N	\N	\N	\N	0	0	\N	ground spiders	\N	\N
1979	1977	Prodidomidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1981	1967	Anyphaenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1982	1967	Salticidae	\N	5k+	目(4小上,4大前)	G	0	0	\N	jumping spiders	\N	\N
1980	1967	Clubionidae	\N	\N	\N	\N	0	0	\N	sac spiders	\N	\N
1964	1950	Thomisidae	\N	\N	\N	\N	0	0	\N	crab spiders	\N	\N
1950	1948	Dionycha	17f	\N	\N	\N	0	0	\N	\N	\N	http://tolweb.org/Dionycha/2692
1983	1958	Acanthoctenidae+Zoropsidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1984	1983	Acanthoctenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1985	1983	Zoropsidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1987	1958	Lycosidae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1988	1987	Pisauridae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1989	1987	Psechridae+...	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1991	1988	Trechaleidae+Lycosidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1992	1991	Trechaleidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2045	2044	/Anelosimus	74	\N	社	\N	0	0	\N	\N	\N	\N
593	591	Passeriformes	~5250	\N	迟	\N	0	0	pássaros|passarinhos	passerines|perching birds	\N	\N
2047	593	Acanthisittidae=Xenicidae	3	\N	\N	nz	0	0	\N	New Zealand wrens	\N	\N
2048	593	non-Acanthisittidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1993	1991	Lycosidae	~2,3k	\N	<1-30mm	G	0	0	(aranha-de-grama)	wolf spiders	\N	\N
1990	1988	Pisauridae	330	\N	\N	G	0	0	\N	\N	\N	\N
1986	1958	Ctenidae	470	\N	\N	T sT	0	0	\N	wandering spiders	\N	\N
1994	1986	/Phoneutria	8	\N	身3,5-5cm 支<17cm	T Ms! Mc(1)	0	0	aranha-armadeira|armadeira	Brazilian wandering spiders	\N	\N
1995	1989	Psechridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1996	1989	non-Psechridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1997	1996	Stiphidiidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1998	1996	Senoculidae+Oxyopidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
1999	1998	Senoculidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2000	1998	Oxyopidae	~420	\N	\N	\N	0	0	\N	lynx spiders	\N	\N
2001	1947	Deinopoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2002	1947	Araneoidea	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2003	2001	Deinopidae	\N	\N	\N	\N	0	0	\N	ogre-faced spiders|net-casting spiders	\N	\N
2004	2001	Uloboridae	\N	\N	\N	\N	0	0	\N	hackled-band orb weavers	\N	\N
2005	2002	Araneidae	\N	\N	\N	\N	0	0	\N	common orb weavers	\N	\N
2006	2002	non-Araneidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2007	2006	Nephilidae+Tetragnathidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2008	2007	Nephilidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2009	2007	Tetragnathidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2010	2006	Reduced_piriform	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2011	2010	Linyphioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2012	2010	non-Linyphioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2014	2011	Pimoidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2013	2011	Linyphiidae	\N	\N	\N	\N	0	0	\N	sheet-web weavers|dwarf spiders	\N	\N
2015	2012	Theridioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2016	2012	non-Theridioids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2017	2015	Nesticidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2019	2016	Synotaxidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2020	2016	Clawless_female	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2021	2020	Synaphridae+Cyatholipidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2022	2021	Synaphridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2023	2021	Cyatholipidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2024	2020	Symphytognathoids	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2025	2024	Theridiosomatidae	\N	\N	\N	\N	0	0	\N	ray spiders	\N	\N
2026	2024	non-Theridiosomatidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2027	2026	Mysmenidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2028	2026	Anapidae+Symphytognathidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2029	2028	Anapidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2030	2028	Symphytognathidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2031	2018	Latrodectinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2032	2018	non-Latrodectinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2033	2031	/Latrodectus	31	\N	\N	\N	0	0	viúvas-negras	widow spiders	\N	\N
2034	2031	Steatoda+Crustulina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2035	2034	/Steatoda	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2036	2034	/Crustulina	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2037	2032	Pholcommatinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2038	2032	non-Pholcommatinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2039	2038	Argyrodinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2040	2038	non-Argyrodinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2041	2040	Hadrotarsinae+Spintharinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2042	2041	Hadrotarsinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2043	2041	Spintharinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2044	2040	Anelosimus+Theridiinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2046	2044	Theridiinae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2051	2049	Eurylaimides	50	\N	\N	V! T oi M(1)	0	0	\N	\N	\N	\N
1947	1946	Orbiculariae	16f	\N	\N	\N	0	0	\N	\N	\N	http://tolweb.org/Orbiculariae/2698\r\nGriswold, C. E., J. A. Coddington, G. Hormiga, and N. Scharff. 1998. Phylogeny of the orb-web building spiders (Araneae, Orbiculariae: Deinopoidea, Araneoidea). Zoological Journal of the Linnean Society 123:1-99.\r\nLopardo, L. and G. Hormiga. 2008. Phylogenetic placement of the Tasmanian spider Acrobleps hygrophilus (Araneae, Anapidae) with comments on the evolution of the capture web in Araneoidea. Cladistics 24(1):1-33. doi:10.1111/j.1096-0031.2007.00173.x
2018	2015	Theridiidae	2,2k+	\N	\N	G	0	0	(viúva-negra)	(cobweb weavers+black widows)	\N	http://tolweb.org/Theridiidae/2797<br>Agnarsson, I. 2006. Phylogenetic placement of Echinotheridion (Araneae: Theridiidae) - do male sexual organ removal, emasculation, and sexual cannibalism in Echinotheridion and Tidarren represent evolutionary replicas? Invertebr. Syst. 20:415-429.
2052	2049	Tyrannides	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2049	2048	Suboscines="Tyranni"	1k+	\N	\N	Ms!	0	0	\N	\N	\N	\N
2050	2048	Oscines="Passeri"	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2053	2052	Tyranni	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2054	2052	Furnarii	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2056	2053	Cotingidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2057	2053	Tityridae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2058	2053	Tyrannidae	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2059	2053	/Calyptura	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2060	2059	/C. cristata	\N	\N	\N	\N	0	0	\N	\N	\N	\N
2055	2053	Pipridae	60	\N	林!果!虫跳小抱(女18-21d)育(女13-15d)西(2)木 8-30g 7-15cm	MT	0	0	\N	\N	\N	\N
\.


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 186
-- Name: taxon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxon_id_seq', 2060, true);


--
-- TOC entry 2010 (class 2606 OID 16406)
-- Name: taxon taxon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (id);


--
-- TOC entry 2011 (class 2606 OID 16407)
-- Name: taxon taxon_anc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_anc_fkey FOREIGN KEY (anc) REFERENCES public.taxon(id);


-- Completed on 2018-06-14 09:42:17 -03

--
-- PostgreSQL database dump complete
--

