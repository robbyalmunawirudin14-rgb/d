--
-- PostgreSQL database dump
--

\restrict mRln0MhsYjBW4I3WjqS7CSWJ9LABtukmcoL6OeiuCPff19q3ypFU2cz34TnYrgR

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-12-09 08:57:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 229 (class 1255 OID 41288)
-- Name: autofill_kode_kab(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.autofill_kode_kab() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.kode_kab := SUBSTRING(NEW.kode_kec FROM 1 FOR 4);
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.autofill_kode_kab() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 41247)
-- Name: DPL_Desa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DPL_Desa" (
    id_dpl_desa integer NOT NULL,
    nama_dpl character varying(255),
    kode_desa bigint,
    id_prodi integer,
    id_dpl_kec bigint
);


ALTER TABLE public."DPL_Desa" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 41155)
-- Name: DPL_Kec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DPL_Kec" (
    id_dpl_kec integer NOT NULL,
    nama_dpl character varying(255),
    kode_kec integer,
    id_prodi integer
);


ALTER TABLE public."DPL_Kec" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41043)
-- Name: Desa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Desa" (
    kode_desa bigint NOT NULL,
    nama_desa character varying(255),
    kode_kec integer
);


ALTER TABLE public."Desa" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41013)
-- Name: Fakultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fakultas" (
    id_fakultas integer NOT NULL,
    nama_fakultas character varying(255),
    id_univ integer
);


ALTER TABLE public."Fakultas" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41012)
-- Name: Fakultas_id_fakultas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Fakultas_id_fakultas_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Fakultas_id_fakultas_seq" OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 219
-- Name: Fakultas_id_fakultas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Fakultas_id_fakultas_seq" OWNED BY public."Fakultas".id_fakultas;


--
-- TOC entry 223 (class 1259 OID 41033)
-- Name: Kabupaten; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kabupaten" (
    kode_kab integer NOT NULL,
    nama_kab character varying(255)
);


ALTER TABLE public."Kabupaten" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41038)
-- Name: Kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kecamatan" (
    kode_kec integer NOT NULL,
    nama_kecamatan character varying(255),
    kode_kab integer
);


ALTER TABLE public."Kecamatan" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 41006)
-- Name: Mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mahasiswa" (
    id_mhs integer NOT NULL,
    nama_mhs character varying(255),
    id_prodi integer,
    id_dpl_des bigint
);


ALTER TABLE public."Mahasiswa" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41005)
-- Name: Mahasiswa_id_mhs_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Mahasiswa_id_mhs_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Mahasiswa_id_mhs_seq" OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 217
-- Name: Mahasiswa_id_mhs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Mahasiswa_id_mhs_seq" OWNED BY public."Mahasiswa".id_mhs;


--
-- TOC entry 222 (class 1259 OID 41020)
-- Name: Prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Prodi" (
    id_prodi integer NOT NULL,
    nama_prodi character varying(255),
    id_fakultas integer
);


ALTER TABLE public."Prodi" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41019)
-- Name: Prodi_id_prodi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Prodi_id_prodi_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Prodi_id_prodi_seq" OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 221
-- Name: Prodi_id_prodi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Prodi_id_prodi_seq" OWNED BY public."Prodi".id_prodi;


--
-- TOC entry 226 (class 1259 OID 41074)
-- Name: Universitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Universitas" (
    id_univ integer NOT NULL,
    nama_univ character varying(255)
);


ALTER TABLE public."Universitas" OWNER TO postgres;

--
-- TOC entry 4778 (class 2604 OID 41016)
-- Name: Fakultas id_fakultas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fakultas" ALTER COLUMN id_fakultas SET DEFAULT nextval('public."Fakultas_id_fakultas_seq"'::regclass);


--
-- TOC entry 4777 (class 2604 OID 41009)
-- Name: Mahasiswa id_mhs; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahasiswa" ALTER COLUMN id_mhs SET DEFAULT nextval('public."Mahasiswa_id_mhs_seq"'::regclass);


--
-- TOC entry 4779 (class 2604 OID 41023)
-- Name: Prodi id_prodi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prodi" ALTER COLUMN id_prodi SET DEFAULT nextval('public."Prodi_id_prodi_seq"'::regclass);


--
-- TOC entry 4966 (class 0 OID 41247)
-- Dependencies: 228
-- Data for Name: DPL_Desa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DPL_Desa" (id_dpl_desa, nama_dpl, kode_desa, id_prodi, id_dpl_kec) FROM stdin;
1	dadang	3203132009	1	1
2	dudung	3203012002	4	2
7	suherman	3203022018	7	5
3	didin	3203232006	5	3
4	maman	3203232014	8	3
5	mumun	3203262006	12	4
6	icih	3203012003	15	2
8	tatang	3203042007	10	6
9	cici	3203082011	3	7
10	ucu	3203152004	13	8
11	Dr. Yuni Lestari, M.Pd	3203012001	11	3
12	Ir. Dedi Rahmat, M.T	3203012002	4	3
13	Hj. Rika Susanti, M.E	3203012003	5	3
14	Tri Handayani, M.Agr	3203012004	8	3
15	Drs. Wahyu Permana, S.H., M.H.	3203012005	1	3
16	Dr. Denny Kuswara, M.Pd	3203022002	12	2
17	Ir. Bayu Prasetya, M.T	3203022006	4	2
18	Hj. Reni Apriani, M.E	3203022007	6	2
19	Triyono Setiabudi, M.Agr	3203022008	9	2
20	Dr. Ratna Dewi, S.H., M.H.	3203022009	1	2
21	Ir. Ade Sulaeman, M.T	3203052001	4	1
22	Drs. Roni Kurnia, M.Pd	3203052002	11	1
23	Hj. Rina Kusumawati, M.E	3203052004	5	1
24	Wawan Prabowo, M.Agr	3203052005	8	1
25	Dr. Farhan Syah, S.H., M.H.	3203052006	1	1
26	Dra. Rini Wulandari, M.Pd	3203312001	14	5
27	Ir. Asep Firdaus, M.T	3203312002	3	5
28	Hj. Nia Yuliani, M.E	3203312003	6	5
29	Yudi Setiadi, M.Agr	3203312004	8	5
30	Dr. Rahmat Satria, S.H., M.H.	3203312005	1	5
31	Melati Riandani, M.Pd	3203142001	12	7
32	Ir. Rendi Kurniawan, M.T	3203142002	3	7
33	Hj. Dina Husna, M.E	3203142003	5	7
34	Trias Wibawa, M.Agr	3203142004	8	7
35	Dra. Siti Mariam, M.Pd	3203112001	11	8
36	Ir. Dadan Permadi, M.T	3203112002	2	8
37	Hj. Yayah Rohayati, M.E	3203112003	6	8
38	Rizky Firmansyah, M.Agr	3203112004	10	8
43	Dra. Nani Apriliyani, M.Pd	3203152001	15	5
44	Ir. Maman Sutisna, M.T	3203152002	3	5
45	Hj. Nuraini Fitria, M.E	3203152003	5	5
46	Andri Setiawan, M.Agr	3203152004	8	5
47	Dra. Melani Rahayu, M.Pd	3203272001	12	1
48	Ir. Asep Nugraha, M.T	3203272002	4	1
49	Hj. Rahmi Nurjanah, M.E	3203272003	6	1
50	Aji Wiratama, M.Agr	3203272004	9	1
\.


--
-- TOC entry 4965 (class 0 OID 41155)
-- Dependencies: 227
-- Data for Name: DPL_Kec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DPL_Kec" (id_dpl_kec, nama_dpl, kode_kec, id_prodi) FROM stdin;
1	kakang	320313	1
2	kekeng	320301	4
3	kikin	320323	5
4	damar	320326	8
5	jeksen	320302	12
6	lulu	320304	15
8	yayan	320315	6
7	bieber	320308	9
11	Dr. Rachmat Surya, S.H., M.H.	320305	1
12	Dra. Siti Maharani, M.Pd.	320302	11
13	Ir. Andika Perdana, M.T.	320301	4
14	Tri Wahyudi, M.Agr.	320305	8
15	Hj. Rina Kusumawati, S.E.I., M.E.	320331	5
16	M. Fajar Prasetyo, M.Eng.	320308	3
17	Drs. Wahyu Setiabudi, M.Si.	320314	12
18	Dra. Nurhayati Susanti, M.Ag.	320311	6
19	Ir. Lestari Ramadhani, M.Kom.	320315	4
20	H. Deni Kurniawan, S.Pd., M.Kom.	320327	4
\.


--
-- TOC entry 4963 (class 0 OID 41043)
-- Dependencies: 225
-- Data for Name: Desa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Desa" (kode_desa, nama_desa, kode_kec) FROM stdin;
3203012001	Babakan Karet	320301
3203012002	Nagrak	320301
3203012003	Sukamaju	320301
3203012004	Mekarsari	320301
3203012005	Limbangansari	320301
3203011006	Pamoyanan	320301
3203011007	Sawahgede	320301
3203011008	Bojongherang	320301
3203011009	Sayang	320301
3203011010	Solokpandan	320301
3203011011	Muka	320301
3203032001	Cipetir	320303
3203032002	Cihaur	320303
3203032003	Cimanggu	320303
3203032004	cibaregbeg	320303
3203032005	Sukaraharja	320303
3203032006	Peuteuycondong	320303
3203032007	Mayak	320303
3203032008	Cikondang	320303
3203032009	Cibokor	320303
3203032010	Selagedang	320303
3203032011	Karangnunggal	320303
3203032012	Kanoman	320303
3203032013	Sukamaju	320303
3203032014	Girimulia	320303
3203032015	Cisala	320303
3203032016	Cibadak	320303
3203032017	Sukamanah	320303
3203032018	Salamnunggal	320303
3203042001	Rancagoong	320304
3203042002	Sukasari	320304
3203042003	Sirnagalih	320304
3203042004	Sukakerta	320304
3203042005	Cibinonghilir	320304
3203042006	Rahong	320304
3203042007	Munjul	320304
3203042008	Sindangsari	320304
3203042009	Ciharashas	320304
3203042010	Mulyasari	320304
3203052001	Ciranjang	320305
3203052002	Sindangjaya	320305
3203052004	Cibiuk	320305
3203052005	Gunungsari	320305
3203052006	Karangwangi	320305
3203052007	Nanggalamekar	320305
3203052008	Kertajaya	320305
3203052009	Sindangsari	320305
3203052012	Mekargalih	320305
3203062001	Hegarmanah	320306
3203062002	Bojongpicung	320306
3203062004	Cibarengkok	320306
3203062006	Kemang	320306
3203062007	Sukajaya	320306
3203062008	Jati	320306
3203062009	Cikondang	320306
3203062010	Sukarama	320306
3203062012	Sukaratu	320306
3203062013	Neglasari	320306
3203062014	Jatisari	320306
3203072001	Sukarmanah	320307
3203072002	Bojong	320307
3203072003	Sindanglaka	320307
3203072004	Maleber	320307
3203072005	Ciherang	320307
3203072006	Sukamantri	320307
3203072007	Sukasarana	320307
3203072008	Sukasari	320307
3203072009	Babakancaringin	320307
3203072010	Sabandar	320307
3203072011	Sindangasih	320307
3203072012	Sukataris	320307
3203072013	Langensari	320307
3203072014	Hegarmanah	320307
3203072015	Sukajadi	320307
3203072016	Sukamulya	320307
3203082001	Kademangan	320308
3203082002	Bobojong	320308
3203082003	Jamali	320308
3203082004	Cikidangbayabang	320308
3203082005	Mande	320308
3203082006	Mulyasari	320308
3203082007	Ciandam	320308
3203082008	Sukamanah	320308
3203082009	Leuwikoja	320308
3203082010	Mekarjaya	320308
3203082011	Kutawaringin	320308
3203082012	Murnisari	320308
3203092001	Selajambe	320309
3203092002	Sukamulya	320309
3203092003	Panyusuhan	320309
3203092004	Tanjungsari	320309
3203092005	Sidangraja	320309
3203092006	Mekarjaya	320309
3203092007	Sukasirna	320309
3203092008	Sukaluyu	320309
3203092009	Babakansari	320309
3203092010	Hegarmanah	320309
3203102001	Ciherang	320310
3203102003	Cibodas	320310
3203102005	Sukanagalih	320310
3203102007	Cipendawa	320310
3203102010	Ciputri	320310
3203102012	Gadag	320310
3203102013	Sukatani	320310
3203112001	Sukamanah	320311
3203112002	Gasol	320311
3203112003	Cijedil	320311
3203112004	Cibeureum	320311
3203112005	Nyalindung	320311
3203112006	Mangunkerta	320311
3203112007	Sarampad	320311
3203112008	Talaga	320311
3203112009	Sukajaya	320311
3203112010	Cibulakan	320311
3203112011	Benjot	320311
3203112012	Sukamulya	320311
3203112013	Wangunjaya	320311
3203112014	Cirumput	320311
3203112015	Padaluyu	320311
3203112016	Galudra	320311
3203132001	Cikanyere	320313
3203132002	Cikancana	320313
3203132003	Ciwalen	320313
3203132004	Kawungluwuk	320313
3203132005	Cibadak	320313
3203132006	Sukamahi	320313
3203132007	Sukaresmi	320313
3203132008	Cibanteng	320313
3203132009	Kubang	320313
3203132010	Pakuon	320313
3203132011	Rawabelut	320313
3203122001	Sukagalih	320312
3203122002	Gudang	320312
3203122003	Cinangsi	320312
3203122004	Cijagang	320312
3203122005	Majalaya	320312
3203122006	Kamurang	320312
3203122007	Warudoyong	320312
3203122008	Ciramagirang	320312
3203122009	Mekarjaya	320312
3203122010	Sukamulya	320312
3203122011	Padajaya	320312
3203122012	Cigunungherang	320312
3203122013	Neglasari	320312
3203122014	Mekargalih	320312
3203122015	Lembahsari	320312
3203122016	Mentengsari	320312
3203122017	Mekarsari	320312
3203122018	Mekarmulya	320312
3203142001	Sukanagara	320314
3203142002	Sukajembar	320314
3203142003	Sukakarya	320314
3203142004	Ciguha	320314
3203142005	Sukamekar	320314
3203142006	Gunungsari	320314
3203142007	Sukalaksana	320314
3203142008	Sukarame	320314
3203142009	Sindangsari	320314
3203142010	Jayagiri	320314
3203162001	Pasawahan	320316
3203162002	Sindangresmi	320316
3203162003	Sindanghayu	320316
3203162004	Simpang	320316
3203162005	Sukagalih	320316
3203162006	Bungbangsari	320316
3203162007	Cisujen	320316
3203162008	Hegarmanah	320316
3203162009	Waringinsari	320316
3203152001	Cidadap	320315
3203152002	Cimenteng	320315
3203152003	Susukan	320315
3203152004	Sukajadi	320315
3203152005	Sukadana	320315
3203152006	Margaluyu	320315
3203152007	Karyamukti	320315
3203152008	Campaka	320315
3203152009	Wangunjaya	320315
3203152010	Girimukti	320315
3203152011	Mekarjaya	320315
3203172003	Sukasari	320317
3203172006	Pasirdalem	320317
3203172008	Talagasari	320317
3203172009	Bojongkasih	320317
3203172010	Wargaasih	320317
3203172011	Sukaraharja	320317
3203172014	Sukakerta	320317
3203172016	Neglasari	320317
3203172017	Sukaresmi	320317
3203172019	Wargasari	320317
3203172020	Sukaraja	320317
3203172021	Kadupandak	320317
3203172022	Gandasari	320317
3203172023	Sindangsari	320317
3203182001	Pagelaran	320318
3203182002	Pangadegan	320318
3203182004	Gelaranyar	320318
3203182005	Buniwangi	320318
3203182007	Sindangkerta	320318
3203182008	Pasirbaru	320318
3203182009	Bunijaya	320318
3203182010	Situbuh	320318
3203182011	Mekarsari	320318
3203182012	Kertaraharja	320318
3203182013	Selagedang	320318
3203182014	Padamaju	320318
3203182015	Karangharja	320318
3203182018	Sukamaju	320318
3203202001	Pananggapan	320320
3203202002	Cikangkare	320320
3203202003	Sukajadi	320320
3203202004	Panyindangan	320320
3203202005	Padasuka	320320
3203202006	Cimaskara	320320
3203202007	Pamoyanan	320320
3203202008	Batulawang	320320
3203202009	Sukamekar	320320
3203202010	Hamerang	320320
3203202011	Girijaya	320320
3203202012	Wargaluyu	320320
3203202013	Mekarmukti	320320
3203202014	Ciburial	320320
3203222004	Sukamanah	320322
3203222005	Bojongkaso	320322
3203222006	Bunisari	320322
3203222007	Wanasari	320322
3203222010	Sinarlaut	320322
3203222014	Neglasari	320322
3203222016	Karangsari	320322
3203222017	Mulyasari	320322
3203222018	Tanjung Sari	320322
3203222019	Mekarsari	320322
3203222022	Wangunjaya	320322
3203212001	Saganten	320321
3203212002	Muaracikadu	320321
3203212003	Jatisari	320321
3203212004	Sirnagalih	320321
3203212005	Jayagiri	320321
3203212006	Kertasari	320321
3203212007	Girimukti	320321
3203212008	Talagasari	320321
3203212009	Hegarsari	320321
3203212010	Mekarlaksana	320321
3203212011	Kertamukti	320321
3203192001	Tanggeung	320319
3203192002	Rawagede	320319
3203192003	Cilongsong	320319
3203192004	Margaluyu	320319
3203192005	Karangtengah	320319
3203192006	Pagermaneuh	320319
3203192007	Bojongpetir	320319
3203192009	Pasirjambu	320319
3203192010	Sirnajaya	320319
3203192013	Kertajaya	320319
3203192014	Sukajaya	320319
3203192015	Padaluyu	320319
3203252001	Cibanggala	320325
3203252002	Campakawarna	320325
3203252003	Sukasirna	320325
3203252004	Campakamulya	320325
3203252005	Sukabungah	320325
3203232001	Cidamar	320323
3203232002	Cibuluh	320323
3203232003	Cisalak	320323
3203232004	Cimaragang	320323
3203232005	Mekarjaya	320323
3203232006	Kertajadi	320323
3203232007	Sukapura	320323
3203232008	Gelar Pawitan	320323
3203232009	Karangwangi	320323
3203232010	Karyabakti	320323
3203232011	Jayapura	320323
3203232012	Neglasari	320323
3203232013	Puncakbaru	320323
3203232014	Gelarwangi	320323
3203242001	Naringgul	320324
3203242002	Balegede	320324
3203242003	Wangunjaya	320324
3203242004	Mekarsari	320324
3203242005	Cinerang	320324
3203242006	Wanasari	320324
3203242007	Sukabakti	320324
3203242008	Malati	320324
3203242009	Wangunsari	320324
3203242010	Sukamulya	320324
3203242011	Margasari	320324
3203262001	Kalapanunggal	320326
3203262002	Cikadu	320326
3203262003	Mekarwangi	320326
3203262004	Padaluyu	320326
3203262005	Sukamulya	320326
3203262006	Cisaranten	320326
3203262007	Mekarlaksana	320326
3203262008	Sukaluyu	320326
3203262009	Mekarjaya	320326
3203262010	Sukamanah	320326
3203272001	Bangbayang	320327
3203272002	Songgom	320327
3203272003	Sukaratu	320327
3203272004	Cikancana	320327
3203272005	Kebonpeuteuy	320327
3203272006	Gekbrong	320327
3203272007	Cikahuripan	320327
3203272008	Cintaasih	320327
3203282001	Cipanas	320328
3203282002	Cimacan	320328
3203282003	Ciloto	320328
3203282004	Sindanglaya	320328
3203282005	Batulawang	320328
3203282006	Palasari	320328
3203282007	Sindangjaya	320328
3203302001	Pusakasari	320330
3203302002	Walahir	320330
3203302003	Purabaya	320330
3203302004	Puncakwangi	320330
3203302005	Sukajaya	320330
3203302006	Nagasari	320330
3203302007	Sukasirna	320330
3203302008	Sukamulya	320330
3203302009	Sirnasari	320330
3203302010	Karyamukti	320330
3203302011	Mandalawangi	320330
3203302012	Sindangsari	320330
3203292001	Parakantugu	320329
3203292002	Cijati	320329
3203292003	Bojonglarang	320329
3203292004	Padaasih	320329
3203292005	Cibodas	320329
3203292006	Sukamahi	320329
3203292007	Sukaluyu	320329
3203292008	Caringin	320329
3203292009	Sinarbakti	320329
3203292010	Sukamaju	320329
3203312001	Haurwangi	320331
3203312002	Cihea	320331
3203312003	Ramasari	320331
3203312004	Mekarwangi/Sukatani	320331
3203312005	Mekarwangi	320331
3203312006	Kertasari	320331
3203312007	Cipeuyeum	320331
3203312008	Kertamukti	320331
3203322001	Simpang	320332
3203322002	Kalibaru	320332
3203322003	Pusakajaya	320332
3203322004	Kubang	320332
3203322005	Girimukti	320332
3203322006	Karangjaya	320332
3203322007	Mekarmulya	320332
3203322008	Girijaya	320332
3203322009	Padamulya	320332
3203022002	Jambudipa	320302
3203022006	Cisarandi	320302
3203022007	Cikaroya	320302
3203022008	Bunikasih	320302
3203022009	Ciwalen	320302
3203022010	Tegallega	320302
3203022011	Sukawangi	320302
3203022014	Bunisari	320302
3203022016	Sukamulya	320302
3203022017	Cieundeur	320302
3203022018	Mekarwangi	320302
\.


--
-- TOC entry 4958 (class 0 OID 41013)
-- Dependencies: 220
-- Data for Name: Fakultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fakultas" (id_fakultas, nama_fakultas, id_univ) FROM stdin;
1	Hukum	1
2	FKIP	1
3	Teknik	1
4	Sains_Terapan	1
5	Ekonomi_dan_Bisnis_Islam	1
\.


--
-- TOC entry 4961 (class 0 OID 41033)
-- Dependencies: 223
-- Data for Name: Kabupaten; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kabupaten" (kode_kab, nama_kab) FROM stdin;
3203	Cianjur
\.


--
-- TOC entry 4962 (class 0 OID 41038)
-- Dependencies: 224
-- Data for Name: Kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kecamatan" (kode_kec, nama_kecamatan, kode_kab) FROM stdin;
320332	Pasirkuda	3203
320301	Cianjur	3203
320302	Warungkondang	3203
320303	Cibeber	3203
320304	Cilaku	3203
320305	Ciranjang	3203
320306	Bojongpicung	3203
320307	Karangtengah	3203
320308	Mande	3203
320309	Sukaluyu	3203
320310	Pacet	3203
320311	Cugenang	3203
320312	Cikalongkulon	3203
320313	Sukaresmi	3203
320314	Sukanagara	3203
320315	Campaka	3203
320316	Takokak	3203
320317	Kadupandak	3203
320318	Pagelaran	3203
320319	Tanggeung	3203
320320	Cibinong	3203
320321	Sindangbarang	3203
320322	Agrabinta	3203
320323	Cidaun	3203
320324	Naringgul	3203
320325	Campakamulya	3203
320326	Cikadu	3203
320327	Gekbrong	3203
320328	Cipanas	3203
320329	Cijati	3203
320330	Leles	3203
320331	Haurwangi	3203
\.


--
-- TOC entry 4956 (class 0 OID 41006)
-- Dependencies: 218
-- Data for Name: Mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mahasiswa" (id_mhs, nama_mhs, id_prodi, id_dpl_des) FROM stdin;
310	Dina	5	\N
311	Elisa	5	\N
312	Ellen	5	\N
313	Elya	5	\N
314	Emma	5	\N
315	Emilia	5	\N
316	Eva	5	\N
317	Farah	5	\N
318	Fatin	5	\N
319	Felisya	5	\N
320	Fiora	5	\N
321	Gisella	5	\N
322	Gabriella	5	\N
323	Gracia	5	\N
324	Gwen	5	\N
325	Ghina	5	\N
326	Hana	5	\N
327	Hani	5	\N
328	Harumi	5	\N
329	Helena	5	\N
330	Hilda	5	\N
331	Indah	5	\N
332	Intan	5	\N
333	Inara	5	\N
334	Isabella	5	\N
335	Ivana	5	\N
336	Jihan	5	\N
337	Jasmine	5	\N
338	Jelita	5	\N
339	Jenifer	5	\N
340	Jesica	5	\N
341	Kaila	5	\N
342	Kalista	5	\N
343	Kamila	5	\N
344	Karina	5	\N
345	Kezia	5	\N
346	Keysha	5	\N
347	Kirana	5	\N
348	Lala	5	\N
349	Laras	5	\N
350	Larissa	5	\N
351	Latifa	5	\N
352	Laura	5	\N
353	Leona	5	\N
354	Lidya	5	\N
355	Liona	5	\N
356	Maira	5	\N
357	Manda	5	\N
358	Marisa	5	\N
359	Maura	5	\N
360	Melani	5	\N
361	Melinda	5	\N
362	Meta	5	\N
363	Mira	5	\N
364	Mirna	5	\N
365	Misha	5	\N
366	Nadia	5	\N
367	Nadira	5	\N
234	Prasetyo	11	2
245	Romi	11	3
256	Ubaid	9	4
276	Zain	9	6
287	Aqila	9	7
294	Berliani	9	8
304	Debora	5	9
309	Dewi	5	10
2	Purnama	14	2
16	Rendra	6	1
17	Fikri	6	2
18	Ilham	6	3
19	Galih	6	4
20	Yoga	6	5
21	Gilang	6	6
22	Raka	6	7
23	Hafiz	6	8
25	Kevin	6	10
26	Satrio	6	11
27	Tama	6	12
28	Tegar	6	13
29	Yusuf	7	14
30	Zidane	7	15
31	Bintang	7	1
32	Fauzan	7	2
33	Roni	7	1
34	Andre	7	2
36	Rizki	7	4
37	Nopal	7	5
38	Seno	7	6
40	Wahyu	7	8
42	Alif	7	10
41	Samsul	7	11
39	Hendra	7	12
43	Bagong	7	5
44	Evan	7	6
45	Vito	10	4
47	Leon	10	1
48	Eko	10	2
49	Adi	10	7
50	Fahri	10	8
51	Mahesa	10	9
52	Fajar	10	10
54	Reyhan	13	12
55	Dani	13	13
56	Rangga	13	14
57	Aiman	13	15
58	Zaki	13	2
59	Rafi	13	3
60	Haris	13	6
61	Dion	13	5
63	Nanda	13	8
64	Farhan	13	7
65	Toni	13	9
66	Rafli	13	10
67	Rendi	13	\N
68	Bryan	13	\N
69	Sigit	13	\N
70	Owen	13	\N
71	Arya	13	\N
72	Beni	13	\N
74	Dika	2	\N
75	Evan	2	\N
76	Fahmi	2	\N
77	Gerry	2	\N
78	Harlan	2	\N
79	Iqbal	2	\N
80	Jefri	2	\N
81	Kanaya	2	\N
82	Lazu	2	\N
83	Mario	2	\N
85	Patrick	2	\N
86	Riko	2	\N
87	Rama	2	\N
88	Samuel	2	\N
89	Toni	2	\N
90	Umar	2	\N
91	Vian	2	\N
92	Wildan	2	\N
93	Xavier	2	\N
94	Yogi	2	\N
96	Awan	12	\N
97	Bayu	12	\N
98	Cahyo	12	\N
99	Davin	12	\N
100	Erlan	12	\N
101	Fadhil	12	\N
102	Gani	12	\N
103	Hafidz	12	\N
104	Ihsan	12	\N
105	Jodi	12	\N
107	Bagas	12	\N
108	Chandra	12	\N
109	Dimas	12	\N
110	Erwin	12	\N
111	Fadli	12	\N
112	Gilang	12	\N
113	Hendra	12	\N
114	Ivan	12	\N
115	Joko	12	\N
116	Kevin	12	\N
118	Mahesa	12	\N
216	Lazuardi	11	\N
217	Leon	11	\N
218	Lukas	11	\N
219	Lutfi	11	\N
223	Michael	11	1
265	Virgiawan	9	5
189	Halim	8	\N
190	Hamzah	8	\N
191	Hans	8	\N
192	Harits	8	\N
193	Haikal	8	\N
194	Hendra	8	\N
195	Hendri	8	\N
196	Ilham	8	\N
197	Imran	8	\N
198	Indra	8	\N
200	Irfan	8	\N
201	Irsan	8	\N
202	Ivan	8	\N
203	Jafar	8	\N
204	Jefri	8	\N
205	Jeno	8	\N
206	Jihan	8	\N
207	Joko	8	\N
209	Jordan	8	\N
210	Josep	8	\N
211	Kamal	8	\N
212	Kurnia	8	\N
213	Kevin	8	\N
214	Kenzo	8	\N
215	Krisna	8	\N
220	Luthfan	11	\N
221	Mahesa	11	\N
222	Maulana	11	\N
224	Miko	11	\N
225	Milan	11	\N
226	Nabil	11	\N
227	Nanda	11	\N
228	Naufal	11	\N
229	Naura	11	\N
230	Natan	11	\N
231	Naufan	11	\N
232	Omar	11	\N
233	Owen	11	\N
235	Pram	11	\N
236	Rafi	11	\N
237	Rafiq	11	\N
238	Raihan	11	\N
239	Rangga	11	\N
240	Rendra	11	\N
241	Reyhan	11	\N
242	Rico	11	\N
243	Rizal	11	\N
244	Rizki	11	\N
246	Satria	11	\N
247	Seno	11	\N
248	Sultan	11	\N
249	Surya	11	\N
250	Syarif	11	\N
251	Tama	11	\N
252	Tegar	11	\N
253	Tito	9	\N
254	Tomi	9	\N
255	Troy	9	\N
257	Umar	9	\N
258	Valen	9	\N
259	Valentino	9	\N
260	Vian	9	\N
261	Victor	9	\N
262	Vieno	9	\N
263	Vigo	9	\N
264	Vino	9	\N
266	Wildan	9	\N
267	William	9	\N
268	Wisnu	9	\N
269	Wahyu	9	\N
270	Wira	9	\N
271	Xavier	9	\N
272	Yanuar	9	\N
273	Yahya	9	\N
274	Yura	9	\N
275	Yusuf	9	\N
277	Zaky	9	\N
278	Zidan	9	\N
279	Zidane	9	\N
280	Zikri	9	\N
281	Ayla	9	\N
282	Azzahra	9	\N
283	Aulia	9	\N
284	Aurelia	9	\N
285	Amara	9	\N
286	Anisa	9	\N
288	Aira	9	\N
289	Ayesha	9	\N
290	Almira	9	\N
291	Bella	9	\N
292	Belinda	9	\N
293	Berliana	9	\N
295	Bianca	9	\N
296	Caitlin	9	\N
297	Celine	9	\N
298	Citra	9	\N
299	Claudia	9	\N
300	Cornelia	9	\N
301	Dania	5	\N
302	Dara	5	\N
303	Dea	5	\N
305	Delia	5	\N
306	Diah	5	\N
307	Diana	5	\N
308	Dinda	5	\N
3	Anggodo	14	3
4	Tantama	14	4
5	Bertram	14	5
7	Claudius	14	7
8	Matthias	14	8
9	Purnama	14	9
10	Raharjo	14	10
11	Aldi	14	11
12	Bagas	14	12
14	Raihan	6	14
15	Dimas	6	15
1	Adi 	14	1
6	Simon	14	6
13	Putra	14	13
374	Orlin	5	\N
375	Olivya	5	\N
376	Putri	5	\N
377	Prameswari	5	\N
379	Prita	5	\N
380	Qanita	5	\N
381	Qaila	5	\N
382	Qiana	5	\N
383	Qistina	5	\N
384	Qinara	5	\N
385	Rafaela	5	\N
386	Rafania	5	\N
387	Raisa	5	\N
388	Rania	5	\N
390	Ratu	5	\N
391	Regina	5	\N
392	Reina	5	\N
393	Rena	5	\N
394	Renata	5	\N
395	Resti	5	\N
396	Rina	5	\N
397	Risa	5	\N
398	Rizka	5	\N
399	Safira	5	\N
401	Salma	5	\N
402	Sania	5	\N
403	Sasha	5	\N
404	Saskia	5	\N
405	Selena	5	\N
406	Sella	5	\N
407	Shania	5	\N
408	Shafira	5	\N
409	Sheila	5	\N
410	Sherly	5	\N
412	Sintia	5	\N
413	Sofi	5	\N
414	Sofia	5	\N
415	Sonya	5	\N
416	Talita	5	\N
417	Tania	5	\N
418	Tari	5	\N
419	Tiara	5	\N
420	Tika	5	\N
421	Ulfa	5	\N
423	Ulya	5	\N
424	Ute	5	\N
425	Vania	5	\N
426	Vanessa	5	\N
427	Vera	5	\N
428	Veronika	5	\N
430	Viona	5	\N
431	Widya	5	\N
432	Winda	4	\N
433	Winny	4	\N
434	Wulan	4	\N
435	Yasmin	4	\N
436	Yolanda	4	\N
437	Yohana	4	\N
438	Yumna	4	\N
439	Yura	4	\N
441	Zahra	4	\N
442	Zalfa	4	\N
443	Zamira	4	\N
444	Zara	4	\N
445	Ziva	4	\N
446	Aaron	4	\N
447	Abraham	4	\N
448	Abrar	4	\N
449	Adlan	4	\N
450	Adham	4	\N
452	Ahmad	4	\N
453	Akmal	4	\N
454	Ammar	4	\N
455	Ariq	4	\N
456	Arkan	4	\N
457	Arvino	4	\N
458	Arya	4	\N
459	Asca	4	\N
460	Aslam	4	\N
461	Ayman	4	\N
463	Bahar	4	\N
464	Bahri	4	\N
465	Bastian	4	\N
466	Bayu	4	\N
467	Bernard	4	\N
468	Bilal	4	\N
469	Bilqis	4	\N
470	Bimo	4	\N
471	Brama	4	\N
472	Cesar	4	\N
474	Chris	4	\N
475	Crisna	4	\N
476	Dandhi	4	\N
477	Danang	4	\N
478	Daniel	4	\N
479	Darius	4	\N
480	Dionisius	4	\N
481	Dylan	4	\N
483	Eduard	4	\N
484	Edward	4	\N
485	Egaran	4	\N
486	Elano	4	\N
487	Elroy	4	\N
488	Emir	4	\N
489	Emiliano	4	\N
560	Luqman	4	\N
562	Mael	4	\N
563	Mahdi	4	\N
564	Malik	4	\N
565	Marcel	4	\N
566	Marco	4	\N
567	Marius	4	\N
568	Markus	1	\N
569	Marvin	1	\N
570	Masaji	1	\N
571	Matsuri	1	\N
573	Maverick	1	\N
574	Miqdad	1	\N
575	Mirza	1	\N
576	Nabil	1	\N
577	Nadir	1	\N
578	Nafis	1	\N
579	Nashir	1	\N
580	Nathan	1	\N
582	Neo	1	\N
583	Nicholas	1	\N
584	Nicko	1	\N
585	Niel	1	\N
586	Niko	1	\N
587	Nizar	1	\N
589	Nolan	1	\N
590	Nugraha	1	\N
591	Oji	1	\N
592	Olin	1	\N
593	Osama	1	\N
594	Oscar	1	\N
595	Othello	1	\N
596	Pablo	1	\N
598	Pasha	1	\N
599	Patrick	1	\N
600	Piero	1	\N
601	Raden	1	\N
602	Raditya	1	\N
603	Rafiandra	1	\N
604	Rafli	1	\N
605	Ragil	1	\N
607	Rakha	1	\N
608	Rama	1	\N
609	Ramzi	1	\N
610	Rangin	1	\N
611	Rasan	1	\N
612	Ray	1	\N
613	Rayden	1	\N
614	Reagan	1	\N
616	Reiano	1	\N
617	Reno	1	\N
618	Revaldo	1	\N
619	Revan	1	\N
620	Rhandy	1	\N
621	Ricko	1	\N
622	Rio	1	\N
623	Rivan	1	\N
625	Ryandi	1	\N
626	Ryo	1	\N
627	Sabian	1	\N
628	Sadid	1	\N
629	Saifan	1	\N
630	Salim	1	\N
632	Samuel	1	\N
633	Sandi	1	\N
634	Sani	1	\N
635	Satriawan	1	\N
636	Satya	1	\N
637	Saul	1	\N
639	Selvino	1	\N
640	Septian	1	\N
641	Sergio	1	\N
642	Shadi	1	\N
643	Shane	1	\N
644	Shawn	1	\N
645	Silas	1	\N
646	Steven	1	\N
647	Storm	1	\N
648	Syabil	1	\N
649	Syahdan	1	\N
651	Syamil	1	\N
652	Syauqi	1	\N
653	Tajul	1	\N
654	Tama	1	\N
655	Tanish	1	\N
656	Tanzil	1	\N
657	Tarmizi	1	\N
658	Taufik	1	\N
659	Tayo	1	\N
660	Thariq	1	\N
661	Theo	1	\N
663	Timo	1	\N
664	Timothy	1	\N
665	Tobias	1	\N
666	Tomi	1	\N
667	Tristan	1	\N
668	Troyan	1	\N
669	Tsabit	1	\N
670	Ubay	1	\N
671	Ulil	1	\N
672	Usman	1	\N
674	Varel	1	\N
675	Vasco	1	\N
676	Vernon	1	\N
368	Naomi	5	\N
369	Nayla	5	\N
370	Nirmala	5	\N
371	Nisa	5	\N
372	Novi	5	\N
373	Nurul	5	\N
378	Pricilla	5	\N
389	Rara	5	\N
400	Salsabila	5	\N
411	Sinta	5	\N
422	Ummi	5	\N
429	Vina	5	\N
440	Yuni	4	\N
451	Afif	4	\N
462	Azka	4	\N
473	Chiko	4	\N
482	Eden	4	\N
490	Evan	4	\N
491	Fadrin	4	\N
492	Fariz	4	\N
493	Fauzan	4	\N
494	Fauzi	4	\N
495	Felix	4	\N
496	Ferdi	4	\N
497	Fernando	4	\N
498	Ferry	4	\N
499	Fiqry	4	\N
500	Fikram	4	\N
501	Finoza	4	\N
502	Fredrick	4	\N
503	Gaber	4	\N
504	Genta	4	\N
505	Gerry	4	\N
506	Gibran	4	\N
507	Gio	4	\N
508	Giovanni	4	\N
509	Grego	4	\N
510	Gusta	4	\N
511	Habib	4	\N
512	Hadiyan	4	\N
513	Hakim	4	\N
514	Hamdi	4	\N
515	Haris	4	\N
516	Hasan	4	\N
517	Hilmi	4	\N
518	Hisyam	4	\N
519	Hudson	4	\N
520	Husein	4	\N
521	Ibrahim	4	\N
522	Idham	4	\N
523	Ikram	4	\N
524	Ilzam	4	\N
525	Imam	4	\N
526	Isa	4	\N
527	Ismail	4	\N
528	Izzan	4	\N
529	Jafar	4	\N
530	Jalal	4	\N
531	Jamal	4	\N
532	James	4	\N
533	Jared	4	\N
534	Jason	4	\N
535	Jayden	4	\N
536	Jerry	4	\N
537	Joe	4	\N
538	Joel	4	\N
539	Jordi	4	\N
540	Jovan	4	\N
541	Kadir	4	\N
542	Kaisar	4	\N
543	Kavin	4	\N
544	Kayden	4	\N
545	Kenan	4	\N
546	Kenny	4	\N
547	Kiano	4	\N
548	Kimi	4	\N
549	Kinan	4	\N
550	Kyo	4	\N
551	Lance	4	\N
552	Lani	4	\N
553	Laskar	4	\N
554	Lauri	4	\N
555	Lendo	4	\N
556	Liam	4	\N
557	Lionel	4	\N
558	Logan	4	\N
559	Lorenzo	4	\N
561	Maddox	4	\N
572	Mauro	1	\N
581	Neal	1	\N
588	Noah	1	\N
597	Pandu	1	\N
606	Raja	1	\N
24	Ryan	6	9
35	Dede	7	3
46	Jordi	10	3
53	Ian	10	11
62	Reza	13	4
73	Cesar	2	\N
84	Nizar	2	\N
95	Zeyan	2	\N
106	Aldi	12	\N
117	Lutfi	12	\N
119	Naufal	12	\N
120	Owen	12	\N
121	Putra	3	\N
122	Raihan	3	\N
123	Seno	3	\N
124	Tegar	3	\N
125	Yudha	3	\N
126	Aulia	3	\N
127	Bella	3	\N
128	Citra	3	\N
129	Dewi	3	\N
130	Elisa	3	\N
131	Farah	3	\N
132	Gisella	3	\N
133	Hana	3	\N
134	Indah	3	\N
135	Jihan	3	\N
136	Kirana	3	\N
137	Larissa	3	\N
138	Melani	3	\N
139	Nadira	3	\N
140	Olivia	3	\N
141	Prameswari	3	\N
142	Qanita	3	\N
143	Raisa	3	\N
144	Salsabila	3	\N
145	Tania	3	\N
146	Aditya	3	\N
147	Aldo	3	\N
148	Anggara	3	\N
149	Ardi	15	\N
150	Bagas	15	\N
151	Bima	15	\N
152	Bintang	15	\N
153	Brandon	15	\N
154	Cahya	15	\N
155	Cakra	15	\N
156	Candra	15	\N
157	Dafa	15	\N
158	Damar	15	\N
159	David	15	\N
160	Davin	15	\N
161	Dewangga	15	\N
162	Dhani	15	\N
163	Dimas	15	\N
164	Dion	15	\N
165	Dito	15	\N
166	Eka	15	\N
167	Elvan	15	\N
168	Elvino	15	\N
169	Erland	15	\N
170	Erwin	15	\N
171	Fadil	15	\N
172	Fahri	15	\N
173	Fajar	15	\N
174	Farhan	15	\N
175	Febri	15	\N
176	Ferdy	15	\N
177	Fikri	15	\N
178	Fino	15	\N
179	Firman	15	\N
180	Flores	15	\N
181	Gading	15	\N
182	Galang	8	\N
183	Gavin	8	\N
184	Ghani	8	\N
185	Gilang	8	\N
186	Hadi	8	\N
187	Hafiz	8	\N
188	Hafidz	8	\N
199	Iqbal	8	\N
208	Jonathan	8	\N
615	Rehan	1	\N
624	Roy	1	\N
631	Sameer	1	\N
638	Sebastian	1	\N
650	Syahrizal	1	\N
662	Thiago	1	\N
673	Uwais	1	\N
677	Viaan	1	\N
678	Vicko	1	\N
679	Victorino	1	\N
680	Vidyan	1	\N
681	Vigo	1	\N
682	Vilano	1	\N
683	Vino	1	\N
684	Vinsen	1	\N
685	Vivaldi	1	\N
686	Wahdan	1	\N
687	Wahib	1	\N
688	Walid	1	\N
689	Warren	1	\N
690	Wayne	1	\N
691	Wisnandar	1	\N
692	Wison	1	\N
693	Wiyoga	1	\N
694	Xander	1	\N
695	Yahya	1	\N
696	Yasir	1	\N
697	Yazdan	1	\N
698	Yesaya	1	\N
699	Yovan	1	\N
700	Yuki	1	\N
701	Zaeem	1	\N
702	Zafran	1	\N
703	Zahir	1	\N
704	Zaydan	1	\N
705	Zevan	1	\N
706	Zidqi	1	\N
707	Zikran	1	\N
708	Zinedine	1	\N
709	Zio	1	\N
710	Zizou	1	\N
711	Zoral	1	\N
712	Zulfan	1	\N
713	Zulham	1	\N
714	Zulhakim	1	\N
715	Zyad	1	\N
716	Ryo	1	\N
717	Sabian	1	\N
718	Sadid	1	\N
719	Saifan	1	\N
720	Salim	1	\N
721	Sameer	1	\N
722	Samuel	1	\N
723	Sandi	1	\N
724	Sani	1	\N
725	Satriawan	1	\N
726	Satya	1	\N
727	Saul	1	\N
728	Sebastian	1	\N
729	Selvino	1	\N
730	Septian	1	\N
731	Sergio	1	\N
732	Shadi	1	\N
733	Shane	1	\N
734	Shawn	1	\N
735	Silas	1	\N
736	Steven	1	\N
737	Storm	1	\N
738	Syabil	1	\N
739	Syahdan	1	\N
740	Syahrizal	1	\N
741	Syamil	1	\N
742	Syauqi	1	\N
743	Tajul	1	\N
744	Tama	1	\N
745	Tanish	1	\N
\.


--
-- TOC entry 4960 (class 0 OID 41020)
-- Dependencies: 222
-- Data for Name: Prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Prodi" (id_prodi, nama_prodi, id_fakultas) FROM stdin;
1	ilmu hukum	1
4	teknik_informatika	3
3	teknik_sipil	3
2	teknik_industri	3
5	ekonomi_syariah	5
6	perbankan_syariah	5
7	akuntansi_syariah	5
8	agroteknologi	4
9	agribisnis	4
10	administrasi_bisnis_internasional	4
11	pendidikan_bahasa_inggris	2
12	pendidikan_jasmani_kesehatan_dan_rekreasi	2
13	pendidikan_matematika	2
14	pendidikan_pancasila_dan_kewarganegaraan	2
15	pendidikan_bahasa_dan_sastra_indonesia	2
\.


--
-- TOC entry 4964 (class 0 OID 41074)
-- Dependencies: 226
-- Data for Name: Universitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Universitas" (id_univ, nama_univ) FROM stdin;
1	Universitas Suryakancana
\.


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 219
-- Name: Fakultas_id_fakultas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fakultas_id_fakultas_seq"', 5, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 217
-- Name: Mahasiswa_id_mhs_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Mahasiswa_id_mhs_seq"', 895, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 221
-- Name: Prodi_id_prodi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Prodi_id_prodi_seq"', 15, true);


--
-- TOC entry 4797 (class 2606 OID 41251)
-- Name: DPL_Desa DPL_Desa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Desa"
    ADD CONSTRAINT "DPL_Desa_pkey" PRIMARY KEY (id_dpl_desa);


--
-- TOC entry 4795 (class 2606 OID 41246)
-- Name: DPL_Kec DPL_Kec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Kec"
    ADD CONSTRAINT "DPL_Kec_pkey" PRIMARY KEY (id_dpl_kec);


--
-- TOC entry 4791 (class 2606 OID 41069)
-- Name: Desa Desa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Desa"
    ADD CONSTRAINT "Desa_pkey" PRIMARY KEY (kode_desa);


--
-- TOC entry 4783 (class 2606 OID 41018)
-- Name: Fakultas Fakultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fakultas"
    ADD CONSTRAINT "Fakultas_pkey" PRIMARY KEY (id_fakultas);


--
-- TOC entry 4787 (class 2606 OID 41037)
-- Name: Kabupaten Kabupaten_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kabupaten"
    ADD CONSTRAINT "Kabupaten_pkey" PRIMARY KEY (kode_kab);


--
-- TOC entry 4789 (class 2606 OID 41042)
-- Name: Kecamatan Kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kecamatan"
    ADD CONSTRAINT "Kecamatan_pkey" PRIMARY KEY (kode_kec);


--
-- TOC entry 4781 (class 2606 OID 41011)
-- Name: Mahasiswa Mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahasiswa"
    ADD CONSTRAINT "Mahasiswa_pkey" PRIMARY KEY (id_mhs);


--
-- TOC entry 4785 (class 2606 OID 41025)
-- Name: Prodi Prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prodi"
    ADD CONSTRAINT "Prodi_pkey" PRIMARY KEY (id_prodi);


--
-- TOC entry 4793 (class 2606 OID 41078)
-- Name: Universitas Universitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Universitas"
    ADD CONSTRAINT "Universitas_pkey" PRIMARY KEY (id_univ);


--
-- TOC entry 4809 (class 2620 OID 41289)
-- Name: Kecamatan tg_autofill_kode_kab; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tg_autofill_kode_kab BEFORE INSERT ON public."Kecamatan" FOR EACH ROW EXECUTE FUNCTION public.autofill_kode_kab();


--
-- TOC entry 4803 (class 2606 OID 41063)
-- Name: Desa fk_desa_kec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Desa"
    ADD CONSTRAINT fk_desa_kec FOREIGN KEY (kode_kec) REFERENCES public."Kecamatan"(kode_kec);


--
-- TOC entry 4806 (class 2606 OID 41273)
-- Name: DPL_Desa fk_dpldes_des; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Desa"
    ADD CONSTRAINT fk_dpldes_des FOREIGN KEY (kode_desa) REFERENCES public."Desa"(kode_desa);


--
-- TOC entry 4807 (class 2606 OID 41278)
-- Name: DPL_Desa fk_dpldes_dplkec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Desa"
    ADD CONSTRAINT fk_dpldes_dplkec FOREIGN KEY (id_dpl_kec) REFERENCES public."DPL_Kec"(id_dpl_kec);


--
-- TOC entry 4808 (class 2606 OID 41262)
-- Name: DPL_Desa fk_dpldes_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Desa"
    ADD CONSTRAINT fk_dpldes_prod FOREIGN KEY (id_prodi) REFERENCES public."Prodi"(id_prodi);


--
-- TOC entry 4804 (class 2606 OID 41158)
-- Name: DPL_Kec fk_dplkec_kec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Kec"
    ADD CONSTRAINT fk_dplkec_kec FOREIGN KEY (kode_kec) REFERENCES public."Kecamatan"(kode_kec);


--
-- TOC entry 4805 (class 2606 OID 41163)
-- Name: DPL_Kec fk_dplkec_prodi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DPL_Kec"
    ADD CONSTRAINT fk_dplkec_prodi FOREIGN KEY (id_prodi) REFERENCES public."Prodi"(id_prodi);


--
-- TOC entry 4800 (class 2606 OID 41094)
-- Name: Fakultas fk_fakultas_univ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fakultas"
    ADD CONSTRAINT fk_fakultas_univ FOREIGN KEY (id_univ) REFERENCES public."Universitas"(id_univ);


--
-- TOC entry 4802 (class 2606 OID 41058)
-- Name: Kecamatan fk_kec_kab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kecamatan"
    ADD CONSTRAINT fk_kec_kab FOREIGN KEY (kode_kab) REFERENCES public."Kabupaten"(kode_kab);


--
-- TOC entry 4798 (class 2606 OID 41084)
-- Name: Mahasiswa fk_mhs-prodi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahasiswa"
    ADD CONSTRAINT "fk_mhs-prodi" FOREIGN KEY (id_prodi) REFERENCES public."Prodi"(id_prodi);


--
-- TOC entry 4799 (class 2606 OID 41267)
-- Name: Mahasiswa fk_mhs_dpldes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mahasiswa"
    ADD CONSTRAINT fk_mhs_dpldes FOREIGN KEY (id_dpl_des) REFERENCES public."DPL_Desa"(id_dpl_desa);


--
-- TOC entry 4801 (class 2606 OID 41053)
-- Name: Prodi fk_prodi_fakultas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prodi"
    ADD CONSTRAINT fk_prodi_fakultas FOREIGN KEY (id_fakultas) REFERENCES public."Fakultas"(id_fakultas);


-- Completed on 2025-12-09 08:57:31

--
-- PostgreSQL database dump complete
--

\unrestrict mRln0MhsYjBW4I3WjqS7CSWJ9LABtukmcoL6OeiuCPff19q3ypFU2cz34TnYrgR

