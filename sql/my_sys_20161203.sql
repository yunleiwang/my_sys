--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crf_infos; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE crf_infos (
    id integer NOT NULL,
    name character varying,
    description character varying,
    seq integer,
    crf_type integer,
    follow integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE crf_infos OWNER TO wangyunlei;

--
-- Name: crf_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE crf_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crf_infos_id_seq OWNER TO wangyunlei;

--
-- Name: crf_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE crf_infos_id_seq OWNED BY crf_infos.id;


--
-- Name: item_form_metaelements; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE item_form_metaelements (
    id integer NOT NULL,
    no character varying,
    parentno character varying,
    item_id integer,
    crf_info_id integer,
    section_id integer,
    header character varying,
    subheader character varying,
    parent_id integer,
    ordinal integer,
    required boolean,
    show_item boolean,
    trigger character varying,
    options_index character varying,
    item_group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE item_form_metaelements OWNER TO wangyunlei;

--
-- Name: item_form_metaelements_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE item_form_metaelements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_form_metaelements_id_seq OWNER TO wangyunlei;

--
-- Name: item_form_metaelements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE item_form_metaelements_id_seq OWNED BY item_form_metaelements.id;


--
-- Name: item_group_metaelements; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE item_group_metaelements (
    id integer NOT NULL,
    no character varying,
    parentno character varying,
    item_group_id integer,
    crf_info_id integer,
    header character varying,
    subheader character varying,
    repeat_number integer,
    repeat_max integer,
    item_id integer,
    seq integer,
    show_group boolean,
    repeating_group boolean,
    options_index character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE item_group_metaelements OWNER TO wangyunlei;

--
-- Name: item_group_metaelements_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE item_group_metaelements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_group_metaelements_id_seq OWNER TO wangyunlei;

--
-- Name: item_group_metaelements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE item_group_metaelements_id_seq OWNED BY item_group_metaelements.id;


--
-- Name: item_groups; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE item_groups (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE item_groups OWNER TO wangyunlei;

--
-- Name: item_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE item_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_groups_id_seq OWNER TO wangyunlei;

--
-- Name: item_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE item_groups_id_seq OWNED BY item_groups.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    name character varying,
    description character varying,
    units character varying,
    header character varying,
    left_item_text character varying,
    right_item_text character varying,
    phi_status boolean,
    item_data_type character varying,
    response_type character varying,
    options_text character varying,
    options_value character varying,
    default_value character varying,
    regexp character varying,
    regexp_error_msg character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE items OWNER TO wangyunlei;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO wangyunlei;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE menus (
    id integer NOT NULL,
    name_cn character varying,
    name_en character varying,
    menu_id integer,
    link character varying,
    seq integer,
    icon_class character varying,
    belong_to character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    menu_type integer,
    hidden integer
);


ALTER TABLE menus OWNER TO wangyunlei;

--
-- Name: menus_crf_infos; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE menus_crf_infos (
    id integer NOT NULL,
    menu_id integer,
    crf_info_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE menus_crf_infos OWNER TO wangyunlei;

--
-- Name: menus_crf_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE menus_crf_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_crf_infos_id_seq OWNER TO wangyunlei;

--
-- Name: menus_crf_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE menus_crf_infos_id_seq OWNED BY menus_crf_infos.id;


--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_id_seq OWNER TO wangyunlei;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE menus_id_seq OWNED BY menus.id;


--
-- Name: patient_visits; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE patient_visits (
    id integer NOT NULL,
    patient_id integer,
    visiting_time date,
    telephone character varying,
    home_address character varying,
    degree_of_education character varying,
    occupation character varying,
    responsible_doctor character varying,
    person_filing character varying,
    created_date date,
    created_unit character varying,
    marital_status character varying,
    contact_name character varying,
    contact_relationship character varying,
    contact_address character varying,
    contact_phone character varying,
    visit_type character varying,
    patient_source character varying,
    admission_number character varying,
    admission_date date,
    discharge_date date,
    outpatient_number character varying,
    diagnostic_types character varying,
    diagnostic_degree character varying,
    diagnostic_anoxia character varying,
    other_diseases character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE patient_visits OWNER TO wangyunlei;

--
-- Name: patient_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE patient_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_visits_id_seq OWNER TO wangyunlei;

--
-- Name: patient_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE patient_visits_id_seq OWNED BY patient_visits.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    file_number character varying,
    id_number character varying,
    name character varying,
    gender character varying,
    birthday date,
    nation character varying,
    native_place character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_type integer
);


ALTER TABLE patients OWNER TO wangyunlei;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO wangyunlei;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: public_libs; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE public_libs (
    id integer NOT NULL,
    table_name character varying,
    item_name character varying,
    item_text character varying,
    item_value character varying,
    pinyin character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public_libs OWNER TO wangyunlei;

--
-- Name: public_libs_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE public_libs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public_libs_id_seq OWNER TO wangyunlei;

--
-- Name: public_libs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE public_libs_id_seq OWNED BY public_libs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO wangyunlei;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE sections (
    id integer NOT NULL,
    name character varying,
    title character varying,
    subtitle character varying,
    seq integer,
    parent_id integer,
    crf_info_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sections OWNER TO wangyunlei;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sections_id_seq OWNER TO wangyunlei;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE sections_id_seq OWNED BY sections.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    username character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO wangyunlei;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO wangyunlei;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY crf_infos ALTER COLUMN id SET DEFAULT nextval('crf_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY item_form_metaelements ALTER COLUMN id SET DEFAULT nextval('item_form_metaelements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY item_group_metaelements ALTER COLUMN id SET DEFAULT nextval('item_group_metaelements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY item_groups ALTER COLUMN id SET DEFAULT nextval('item_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY menus_crf_infos ALTER COLUMN id SET DEFAULT nextval('menus_crf_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY patient_visits ALTER COLUMN id SET DEFAULT nextval('patient_visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY public_libs ALTER COLUMN id SET DEFAULT nextval('public_libs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: crf_infos; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY crf_infos (id, name, description, seq, crf_type, follow, created_at, updated_at) FROM stdin;
148	相关并发症病史及其他疾病史、用药史		\N	\N	\N	2016-11-30 10:57:45.225	2016-11-30 10:57:45.225
150	个人史		\N	\N	\N	2016-11-30 11:44:21.34	2016-11-30 11:44:21.34
164	家族史		\N	\N	\N	2016-11-30 16:05:52.526	2016-11-30 16:05:52.526
165	体格检查		\N	\N	\N	2016-11-30 16:06:50.606	2016-11-30 16:06:50.606
166	辅助检查		\N	\N	\N	2016-11-30 16:07:50.276	2016-11-30 16:07:50.276
167	影像学检查		\N	\N	\N	2016-11-30 16:08:43.377	2016-11-30 16:08:43.377
168	生化组合		\N	\N	\N	2016-11-30 16:10:35.533	2016-11-30 16:10:35.533
169	心梗六项、BNP		\N	\N	\N	2016-11-30 16:11:16.201	2016-11-30 16:11:16.201
170	凝血四项、D二聚体		\N	\N	\N	2016-11-30 16:11:38.554	2016-11-30 16:11:38.554
171	性激素六项		\N	\N	\N	2016-11-30 16:11:59.479	2016-11-30 16:11:59.479
172	血常规		\N	\N	\N	2016-11-30 16:12:24.641	2016-11-30 16:12:24.641
173	血气分析		\N	\N	\N	2016-11-30 16:12:34.305	2016-11-30 16:12:34.305
174	血脂四项		\N	\N	\N	2016-11-30 16:12:52.969	2016-11-30 16:12:52.969
175	游离甲功		\N	\N	\N	2016-11-30 16:13:16.868	2016-11-30 16:13:16.868
176	1,打鼾评估		\N	\N	\N	2016-11-30 16:13:49.34	2016-11-30 16:13:49.34
177	2,Epworth嗜睡量表（ESS评分）		\N	\N	\N	2016-11-30 16:14:17.454	2016-11-30 16:14:17.454
178	3,STOP‐Bang问卷		\N	\N	\N	2016-11-30 16:14:33.908	2016-11-30 16:14:33.908
179	4,Berlin睡眠质量评估问卷		\N	\N	\N	2016-11-30 16:14:56.285	2016-11-30 16:14:56.285
180	5、鼻炎评估		\N	\N	\N	2016-11-30 16:15:15.922	2016-11-30 16:15:15.922
181	6、Asthma相关评分表		\N	\N	\N	2016-11-30 16:15:33.448	2016-11-30 16:15:33.448
182	7、COPD评分表		\N	\N	\N	2016-11-30 16:15:54.157	2016-11-30 16:15:54.157
183	8、美国麻醉医师问卷（ASA checklist）		\N	\N	\N	2016-11-30 16:16:13.768	2016-11-30 16:16:13.768
185	治疗		\N	\N	\N	2016-11-30 16:17:40.516	2016-11-30 16:17:40.516
186	标本记录		\N	\N	\N	2016-11-30 16:18:12.406	2016-11-30 16:18:12.406
142	主诉及现病史		\N	\N	\N	2016-11-30 10:45:41.528	2016-11-30 10:45:41.528
187	睡眠呼吸暂停综合征流行病学调查表		\N	0	\N	2016-12-03 21:59:48.291	2016-12-03 21:59:48.291
\.


--
-- Name: crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('crf_infos_id_seq', 187, true);


--
-- Data for Name: item_form_metaelements; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_form_metaelements (id, no, parentno, item_id, crf_info_id, section_id, header, subheader, parent_id, ordinal, required, show_item, trigger, options_index, item_group_id, created_at, updated_at) FROM stdin;
1658	\N	\N	1421	142	167			\N	\N	t	t			\N	2016-11-30 10:45:41.815	2016-11-30 10:45:41.815
1659	\N	\N	1422	142	167			\N	\N	t	t			\N	2016-11-30 10:45:41.85	2016-11-30 10:45:41.85
1660	\N	\N	1423	142	167			\N	\N	t	t			\N	2016-11-30 10:45:41.881	2016-11-30 10:45:41.881
1661	\N	\N	1424	142	168			\N	\N	t	t			\N	2016-11-30 10:45:41.913	2016-11-30 10:45:41.913
1662	\N	\N	1425	142	168			\N	\N	t	t			\N	2016-11-30 10:45:41.948	2016-11-30 10:45:41.948
1663	\N	\N	1426	142	168			\N	\N	t	t			\N	2016-11-30 10:45:41.974	2016-11-30 10:45:41.974
1664	\N	\N	1427	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.009	2016-11-30 10:45:42.009
1665	\N	\N	1428	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.042	2016-11-30 10:45:42.042
1666	\N	\N	1429	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.08	2016-11-30 10:45:42.08
1667	\N	\N	1430	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.107	2016-11-30 10:45:42.107
1668	\N	\N	1431	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.137	2016-11-30 10:45:42.137
1669	\N	\N	1432	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.175	2016-11-30 10:45:42.175
1670	\N	\N	1433	142	168			\N	\N	t	t			\N	2016-11-30 10:45:42.254	2016-11-30 10:45:42.254
2290	\N	\N	1555	150	218			\N	\N	t	t		0	\N	2016-11-30 11:44:22.507	2016-11-30 11:44:22.507
2291	\N	\N	1556	150	218			2290	\N	t	t		0	\N	2016-11-30 11:44:22.521	2016-11-30 11:44:22.521
2292	\N	\N	1557	150	218			2290	\N	t	t		0	\N	2016-11-30 11:44:22.595	2016-11-30 11:44:22.595
2293	\N	\N	1558	150	218			2290	\N	t	t		1	\N	2016-11-30 11:44:22.608	2016-11-30 11:44:22.608
2294	\N	\N	1559	150	218			2290	\N	t	t		1	\N	2016-11-30 11:44:22.621	2016-11-30 11:44:22.621
2295	\N	\N	1560	150	218			2290	\N	t	t		1	\N	2016-11-30 11:44:22.636	2016-11-30 11:44:22.636
2296	\N	\N	1561	150	218			\N	\N	t	t		0	\N	2016-11-30 11:44:22.649	2016-11-30 11:44:22.649
2297	\N	\N	1562	150	218			2296	\N	t	t		0	\N	2016-11-30 11:44:22.667	2016-11-30 11:44:22.667
2298	\N	\N	1563	150	218			2296	\N	t	t		0	\N	2016-11-30 11:44:22.682	2016-11-30 11:44:22.682
2299	\N	\N	1564	150	218			2296	\N	t	t		0	\N	2016-11-30 11:44:22.695	2016-11-30 11:44:22.695
2300	\N	\N	1565	150	218			2296	\N	t	t		0	\N	2016-11-30 11:44:22.713	2016-11-30 11:44:22.713
2301	\N	\N	1566	150	218			\N	\N	t	t		0	\N	2016-11-30 11:44:22.724	2016-11-30 11:44:22.724
2302	\N	\N	1567	150	218			2301	\N	t	t		0	\N	2016-11-30 11:44:22.737	2016-11-30 11:44:22.737
2303	\N	\N	1568	150	218			2301	\N	t	t		0	\N	2016-11-30 11:44:22.751	2016-11-30 11:44:22.751
2649	\N	\N	1912	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.724	2016-11-30 16:17:40.724
2650	\N	\N	1913	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.748	2016-11-30 16:17:40.748
2651	\N	\N	1914	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.767	2016-11-30 16:17:40.767
2652	\N	\N	1915	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.787	2016-11-30 16:17:40.787
2653	\N	\N	1916	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.809	2016-11-30 16:17:40.809
2654	\N	\N	1917	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.829	2016-11-30 16:17:40.829
2655	\N	\N	1918	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.849	2016-11-30 16:17:40.849
2656	\N	\N	1919	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.868	2016-11-30 16:17:40.868
2657	\N	\N	1920	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.887	2016-11-30 16:17:40.887
2658	\N	\N	1921	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.904	2016-11-30 16:17:40.904
2659	\N	\N	1922	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.923	2016-11-30 16:17:40.923
2660	\N	\N	1923	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.94	2016-11-30 16:17:40.94
2661	\N	\N	1924	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.967	2016-11-30 16:17:40.967
2662	\N	\N	1925	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:40.992	2016-11-30 16:17:40.992
2663	\N	\N	1926	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.019	2016-11-30 16:17:41.019
2664	\N	\N	1927	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.052	2016-11-30 16:17:41.052
2665	\N	\N	1928	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.917	2016-11-30 16:17:41.917
2666	\N	\N	1929	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.936	2016-11-30 16:17:41.936
2667	\N	\N	1930	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.959	2016-11-30 16:17:41.959
2668	\N	\N	1931	185	254			2661	\N	t	t		0	\N	2016-11-30 16:17:41.981	2016-11-30 16:17:41.981
2669	\N	\N	1932	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.004	2016-11-30 16:17:42.004
2670	\N	\N	1933	185	254			2669	\N	t	t		0	\N	2016-11-30 16:17:42.031	2016-11-30 16:17:42.031
2671	\N	\N	1934	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.05	2016-11-30 16:17:42.05
2672	\N	\N	1935	185	254			2671	\N	t	t		0	\N	2016-11-30 16:17:42.073	2016-11-30 16:17:42.073
2673	\N	\N	1936	185	254			2671	\N	t	t		0	\N	2016-11-30 16:17:42.096	2016-11-30 16:17:42.096
2674	\N	\N	1937	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.119	2016-11-30 16:17:42.119
2675	\N	\N	1938	185	254			2674	\N	t	t		0	\N	2016-11-30 16:17:42.148	2016-11-30 16:17:42.148
2676	\N	\N	1939	185	254			2674	\N	t	t		0	\N	2016-11-30 16:17:42.174	2016-11-30 16:17:42.174
2677	\N	\N	1940	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.198	2016-11-30 16:17:42.198
2678	\N	\N	1941	185	254			2677	\N	t	t		0	\N	2016-11-30 16:17:42.221	2016-11-30 16:17:42.221
2679	\N	\N	1942	185	254			2677	\N	t	t		0	\N	2016-11-30 16:17:42.242	2016-11-30 16:17:42.242
2680	\N	\N	1943	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.259	2016-11-30 16:17:42.259
2681	\N	\N	1944	185	254			2680	\N	t	t		0	\N	2016-11-30 16:17:42.284	2016-11-30 16:17:42.284
2682	\N	\N	1945	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.306	2016-11-30 16:17:42.306
2683	\N	\N	1946	185	254			2682	\N	t	t		0	\N	2016-11-30 16:17:42.335	2016-11-30 16:17:42.335
2684	\N	\N	1947	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:42.358	2016-11-30 16:17:42.358
2685	\N	\N	1948	186	255			\N	\N	t	t		0	\N	2016-11-30 16:18:12.53	2016-11-30 16:18:12.53
2686	\N	\N	1949	186	255			2685	\N	t	t		0	\N	2016-11-30 16:18:12.55	2016-11-30 16:18:12.55
2687	\N	\N	1950	186	255			2685	\N	t	t		0	\N	2016-11-30 16:18:12.568	2016-11-30 16:18:12.568
2688	\N	\N	1951	186	255			2685	\N	t	t		0	\N	2016-11-30 16:18:12.587	2016-11-30 16:18:12.587
2741	\N	\N	2004	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.618	2016-12-03 21:59:50.618
2314	\N	\N	\N	164	232			\N	\N	t	t		0	66	2016-11-30 16:05:52.735	2016-11-30 16:05:52.735
2315	\N	\N	1572	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:50.801	2016-11-30 16:06:50.801
2316	\N	\N	1573	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:50.892	2016-11-30 16:06:50.892
2317	\N	\N	1574	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:50.942	2016-11-30 16:06:50.942
2318	\N	\N	1575	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:50.973	2016-11-30 16:06:50.973
2319	\N	\N	1576	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.002	2016-11-30 16:06:51.002
2320	\N	\N	1577	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.037	2016-11-30 16:06:51.037
2321	\N	\N	1578	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.086	2016-11-30 16:06:51.086
2322	\N	\N	1579	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.13	2016-11-30 16:06:51.13
2323	\N	\N	1580	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.157	2016-11-30 16:06:51.157
2324	\N	\N	1581	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.183	2016-11-30 16:06:51.183
2325	\N	\N	1582	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.212	2016-11-30 16:06:51.212
2326	\N	\N	1583	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.27	2016-11-30 16:06:51.27
2327	\N	\N	1584	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.319	2016-11-30 16:06:51.319
2328	\N	\N	1585	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.343	2016-11-30 16:06:51.343
2329	\N	\N	1586	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.367	2016-11-30 16:06:51.367
2330	\N	\N	1587	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.392	2016-11-30 16:06:51.392
2331	\N	\N	1588	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.42	2016-11-30 16:06:51.42
2332	\N	\N	1589	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.447	2016-11-30 16:06:51.447
2333	\N	\N	1590	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.477	2016-11-30 16:06:51.477
2334	\N	\N	1591	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.504	2016-11-30 16:06:51.504
2335	\N	\N	1592	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.531	2016-11-30 16:06:51.531
2336	\N	\N	1593	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.6	2016-11-30 16:06:51.6
2337	\N	\N	1594	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.625	2016-11-30 16:06:51.625
2338	\N	\N	1595	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.652	2016-11-30 16:06:51.652
2339	\N	\N	1596	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.686	2016-11-30 16:06:51.686
2340	\N	\N	1597	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.714	2016-11-30 16:06:51.714
2341	\N	\N	1598	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.75	2016-11-30 16:06:51.75
2342	\N	\N	1599	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.781	2016-11-30 16:06:51.781
2343	\N	\N	1600	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.804	2016-11-30 16:06:51.804
2344	\N	\N	1601	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.832	2016-11-30 16:06:51.832
2345	\N	\N	1602	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.856	2016-11-30 16:06:51.856
2346	\N	\N	1603	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.883	2016-11-30 16:06:51.883
2347	\N	\N	1604	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.913	2016-11-30 16:06:51.913
2348	\N	\N	1605	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.936	2016-11-30 16:06:51.936
2349	\N	\N	1606	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.964	2016-11-30 16:06:51.964
2350	\N	\N	1607	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:51.993	2016-11-30 16:06:51.993
2351	\N	\N	1608	165	233			\N	\N	t	t		0	\N	2016-11-30 16:06:52.021	2016-11-30 16:06:52.021
2352	\N	\N	\N	165	233			\N	\N	t	t		0	67	2016-11-30 16:06:52.056	2016-11-30 16:06:52.056
2689	\N	\N	1952	187	256			\N	\N	t	t		0	\N	2016-12-03 21:59:48.51	2016-12-03 21:59:48.51
2690	\N	\N	1953	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.586	2016-12-03 21:59:48.586
2691	\N	\N	1954	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.627	2016-12-03 21:59:48.627
2692	\N	\N	1955	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.663	2016-12-03 21:59:48.663
2693	\N	\N	1956	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.694	2016-12-03 21:59:48.694
2694	\N	\N	1957	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.732	2016-12-03 21:59:48.732
2695	\N	\N	1958	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.765	2016-12-03 21:59:48.765
2696	\N	\N	1959	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.804	2016-12-03 21:59:48.804
2697	\N	\N	1960	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.849	2016-12-03 21:59:48.849
2698	\N	\N	1961	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.878	2016-12-03 21:59:48.878
2699	\N	\N	1962	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.934	2016-12-03 21:59:48.934
2700	\N	\N	1963	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:48.972	2016-12-03 21:59:48.972
2701	\N	\N	1964	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:49.019	2016-12-03 21:59:49.019
2702	\N	\N	1965	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:49.061	2016-12-03 21:59:49.061
2703	\N	\N	1966	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:49.128	2016-12-03 21:59:49.128
2704	\N	\N	1967	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:49.161	2016-12-03 21:59:49.161
2705	\N	\N	1968	187	257			\N	\N	t	t		0	\N	2016-12-03 21:59:49.248	2016-12-03 21:59:49.248
2706	\N	\N	1969	187	258			\N	\N	t	t		0	\N	2016-12-03 21:59:49.277	2016-12-03 21:59:49.277
2707	\N	\N	1970	187	258			2706	\N	t	t		0	\N	2016-12-03 21:59:49.312	2016-12-03 21:59:49.312
2708	\N	\N	1971	187	258			2706	\N	t	t		0	\N	2016-12-03 21:59:49.36	2016-12-03 21:59:49.36
2709	\N	\N	1972	187	258			2706	\N	t	t		1	\N	2016-12-03 21:59:49.396	2016-12-03 21:59:49.396
2710	\N	\N	1973	187	258			2706	\N	t	t		1	\N	2016-12-03 21:59:49.438	2016-12-03 21:59:49.438
2711	\N	\N	1974	187	258			2706	\N	t	t		1	\N	2016-12-03 21:59:49.501	2016-12-03 21:59:49.501
2712	\N	\N	1975	187	258			\N	\N	t	t		0	\N	2016-12-03 21:59:49.62	2016-12-03 21:59:49.62
2713	\N	\N	1976	187	258			2712	\N	t	t		0	\N	2016-12-03 21:59:49.653	2016-12-03 21:59:49.653
2714	\N	\N	1977	187	258			2712	\N	t	t		0	\N	2016-12-03 21:59:49.69	2016-12-03 21:59:49.69
2715	\N	\N	1978	187	258			2712	\N	t	t		0	\N	2016-12-03 21:59:49.723	2016-12-03 21:59:49.723
2716	\N	\N	1979	187	258			2712	\N	t	t		0	\N	2016-12-03 21:59:49.76	2016-12-03 21:59:49.76
2717	\N	\N	1980	187	259			\N	\N	t	t		0	\N	2016-12-03 21:59:49.788	2016-12-03 21:59:49.788
2718	\N	\N	1981	187	259			2717	\N	t	t		23	\N	2016-12-03 21:59:49.821	2016-12-03 21:59:49.821
2719	\N	\N	1982	187	259			\N	\N	t	t		0	\N	2016-12-03 21:59:49.851	2016-12-03 21:59:49.851
2720	\N	\N	1983	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:49.877	2016-12-03 21:59:49.877
2721	\N	\N	1984	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:49.9	2016-12-03 21:59:49.9
2722	\N	\N	1985	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:49.928	2016-12-03 21:59:49.928
2723	\N	\N	1986	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:49.962	2016-12-03 21:59:49.962
2724	\N	\N	1987	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:49.994	2016-12-03 21:59:49.994
2725	\N	\N	1988	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.026	2016-12-03 21:59:50.026
2726	\N	\N	1989	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.058	2016-12-03 21:59:50.058
2727	\N	\N	1990	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.087	2016-12-03 21:59:50.087
2728	\N	\N	1991	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.111	2016-12-03 21:59:50.111
2729	\N	\N	1992	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.136	2016-12-03 21:59:50.136
2730	\N	\N	1993	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.169	2016-12-03 21:59:50.169
2731	\N	\N	1994	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.212	2016-12-03 21:59:50.212
2732	\N	\N	1995	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.246	2016-12-03 21:59:50.246
2733	\N	\N	1996	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.279	2016-12-03 21:59:50.279
2734	\N	\N	1997	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.308	2016-12-03 21:59:50.308
2735	\N	\N	1998	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.339	2016-12-03 21:59:50.339
2736	\N	\N	1999	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.372	2016-12-03 21:59:50.372
2737	\N	\N	2000	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.402	2016-12-03 21:59:50.402
2738	\N	\N	2001	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.437	2016-12-03 21:59:50.437
2739	\N	\N	2002	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.494	2016-12-03 21:59:50.494
2740	\N	\N	2003	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.578	2016-12-03 21:59:50.578
2742	\N	\N	2005	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.643	2016-12-03 21:59:50.643
2743	\N	\N	2006	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.667	2016-12-03 21:59:50.667
2744	\N	\N	2007	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.693	2016-12-03 21:59:50.693
2745	\N	\N	2008	187	260			\N	\N	t	t		0	\N	2016-12-03 21:59:50.715	2016-12-03 21:59:50.715
2353	\N	\N	1611	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.398	2016-11-30 16:07:50.398
2354	\N	\N	1612	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.424	2016-11-30 16:07:50.424
2355	\N	\N	1613	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.448	2016-11-30 16:07:50.448
2356	\N	\N	1614	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.472	2016-11-30 16:07:50.472
2357	\N	\N	1615	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.502	2016-11-30 16:07:50.502
2358	\N	\N	1616	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.524	2016-11-30 16:07:50.524
2359	\N	\N	1617	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.546	2016-11-30 16:07:50.546
2360	\N	\N	1618	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.567	2016-11-30 16:07:50.567
2361	\N	\N	1619	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.59	2016-11-30 16:07:50.59
2362	\N	\N	1620	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.618	2016-11-30 16:07:50.618
2363	\N	\N	1621	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.646	2016-11-30 16:07:50.646
2364	\N	\N	1622	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.69	2016-11-30 16:07:50.69
2365	\N	\N	1623	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.726	2016-11-30 16:07:50.726
2366	\N	\N	1624	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.748	2016-11-30 16:07:50.748
2367	\N	\N	1625	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.773	2016-11-30 16:07:50.773
2368	\N	\N	1626	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.798	2016-11-30 16:07:50.798
2369	\N	\N	1627	166	234			\N	\N	t	t		0	\N	2016-11-30 16:07:50.821	2016-11-30 16:07:50.821
2370	\N	\N	1628	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:43.523	2016-11-30 16:08:43.523
2371	\N	\N	1629	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.563	2016-11-30 16:08:43.563
2372	\N	\N	1630	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.589	2016-11-30 16:08:43.589
2373	\N	\N	1631	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.617	2016-11-30 16:08:43.617
2374	\N	\N	1632	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.647	2016-11-30 16:08:43.647
2375	\N	\N	1633	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.677	2016-11-30 16:08:43.677
2376	\N	\N	1634	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.722	2016-11-30 16:08:43.722
2377	\N	\N	1635	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.755	2016-11-30 16:08:43.755
2378	\N	\N	1636	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.793	2016-11-30 16:08:43.793
2379	\N	\N	1637	167	235			2370	\N	t	t		0	\N	2016-11-30 16:08:43.838	2016-11-30 16:08:43.838
2380	\N	\N	1638	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:43.861	2016-11-30 16:08:43.861
2381	\N	\N	1639	167	235			2380	\N	t	t		0	\N	2016-11-30 16:08:43.889	2016-11-30 16:08:43.889
2382	\N	\N	1640	167	235			2380	\N	t	t		0	\N	2016-11-30 16:08:43.925	2016-11-30 16:08:43.925
2383	\N	\N	1641	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:43.967	2016-11-30 16:08:43.967
2384	\N	\N	1642	167	235			2383	\N	t	t		0	\N	2016-11-30 16:08:43.995	2016-11-30 16:08:43.995
2385	\N	\N	1643	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.019	2016-11-30 16:08:44.019
2386	\N	\N	1644	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.046	2016-11-30 16:08:44.046
2387	\N	\N	1645	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.071	2016-11-30 16:08:44.071
2388	\N	\N	1646	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.096	2016-11-30 16:08:44.096
2389	\N	\N	1647	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.125	2016-11-30 16:08:44.125
2390	\N	\N	1648	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.15	2016-11-30 16:08:44.15
2391	\N	\N	1649	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.177	2016-11-30 16:08:44.177
2392	\N	\N	1650	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.205	2016-11-30 16:08:44.205
2393	\N	\N	1651	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.236	2016-11-30 16:08:44.236
2394	\N	\N	1652	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.267	2016-11-30 16:08:44.267
2395	\N	\N	1653	167	235			2385	\N	t	t		0	\N	2016-11-30 16:08:44.303	2016-11-30 16:08:44.303
2396	\N	\N	1654	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.385	2016-11-30 16:08:44.385
2397	\N	\N	1655	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.409	2016-11-30 16:08:44.409
2398	\N	\N	1656	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.431	2016-11-30 16:08:44.431
2399	\N	\N	1657	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.458	2016-11-30 16:08:44.458
2400	\N	\N	1658	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.491	2016-11-30 16:08:44.491
2401	\N	\N	1659	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.521	2016-11-30 16:08:44.521
2402	\N	\N	1660	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.544	2016-11-30 16:08:44.544
2403	\N	\N	1661	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.568	2016-11-30 16:08:44.568
2404	\N	\N	1662	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.592	2016-11-30 16:08:44.592
2405	\N	\N	1663	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.62	2016-11-30 16:08:44.62
2406	\N	\N	1664	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.642	2016-11-30 16:08:44.642
2407	\N	\N	1665	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.666	2016-11-30 16:08:44.666
2408	\N	\N	1666	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.692	2016-11-30 16:08:44.692
2409	\N	\N	1667	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.725	2016-11-30 16:08:44.725
2410	\N	\N	1668	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.761	2016-11-30 16:08:44.761
2411	\N	\N	1669	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.799	2016-11-30 16:08:44.799
2412	\N	\N	1670	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.824	2016-11-30 16:08:44.824
2413	\N	\N	1671	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.851	2016-11-30 16:08:44.851
2414	\N	\N	1672	167	235			2396	\N	t	t		0	\N	2016-11-30 16:08:44.882	2016-11-30 16:08:44.882
2415	\N	\N	1673	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.905	2016-11-30 16:08:44.905
2416	\N	\N	1674	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.934	2016-11-30 16:08:44.934
2417	\N	\N	1675	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.956	2016-11-30 16:08:44.956
2418	\N	\N	1676	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:44.976	2016-11-30 16:08:44.976
2419	\N	\N	1677	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.002	2016-11-30 16:08:45.002
2420	\N	\N	1678	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.039	2016-11-30 16:08:45.039
2421	\N	\N	1679	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.072	2016-11-30 16:08:45.072
2422	\N	\N	1680	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.111	2016-11-30 16:08:45.111
2423	\N	\N	1681	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.149	2016-11-30 16:08:45.149
2424	\N	\N	1682	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.182	2016-11-30 16:08:45.182
2425	\N	\N	1683	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.205	2016-11-30 16:08:45.205
2426	\N	\N	1684	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.23	2016-11-30 16:08:45.23
2427	\N	\N	1685	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.255	2016-11-30 16:08:45.255
2428	\N	\N	1686	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.278	2016-11-30 16:08:45.278
2429	\N	\N	1687	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.302	2016-11-30 16:08:45.302
2430	\N	\N	1688	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.326	2016-11-30 16:08:45.326
2431	\N	\N	1689	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.357	2016-11-30 16:08:45.357
2432	\N	\N	1690	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.392	2016-11-30 16:08:45.392
2433	\N	\N	1691	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.417	2016-11-30 16:08:45.417
2434	\N	\N	1692	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.446	2016-11-30 16:08:45.446
2435	\N	\N	1693	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.476	2016-11-30 16:08:45.476
2436	\N	\N	1694	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.505	2016-11-30 16:08:45.505
2437	\N	\N	1695	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.537	2016-11-30 16:08:45.537
2438	\N	\N	1696	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.565	2016-11-30 16:08:45.565
2439	\N	\N	1697	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.6	2016-11-30 16:08:45.6
2440	\N	\N	1698	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.629	2016-11-30 16:08:45.629
2441	\N	\N	1699	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.655	2016-11-30 16:08:45.655
2442	\N	\N	1700	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.681	2016-11-30 16:08:45.681
2443	\N	\N	1701	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.706	2016-11-30 16:08:45.706
2444	\N	\N	1702	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.737	2016-11-30 16:08:45.737
2445	\N	\N	1703	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.768	2016-11-30 16:08:45.768
2446	\N	\N	1704	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:45.792	2016-11-30 16:08:45.792
2447	\N	\N	1705	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.827	2016-11-30 16:08:45.827
2448	\N	\N	1706	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.86	2016-11-30 16:08:45.86
2449	\N	\N	1707	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.891	2016-11-30 16:08:45.891
2450	\N	\N	1708	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.923	2016-11-30 16:08:45.923
2451	\N	\N	1709	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.958	2016-11-30 16:08:45.958
2452	\N	\N	1710	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:45.991	2016-11-30 16:08:45.991
2453	\N	\N	1711	167	235			2446	\N	t	t		0	\N	2016-11-30 16:08:46.068	2016-11-30 16:08:46.068
2454	\N	\N	1712	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.096	2016-11-30 16:08:46.096
2455	\N	\N	1713	167	235			2454	\N	t	t		0	\N	2016-11-30 16:08:46.126	2016-11-30 16:08:46.126
2456	\N	\N	1714	167	235			2454	\N	t	t		0	\N	2016-11-30 16:08:46.156	2016-11-30 16:08:46.156
2457	\N	\N	1715	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.182	2016-11-30 16:08:46.182
2458	\N	\N	1716	167	235			2457	\N	t	t		0	\N	2016-11-30 16:08:46.216	2016-11-30 16:08:46.216
2459	\N	\N	1717	167	235			2457	\N	t	t		0	\N	2016-11-30 16:08:46.245	2016-11-30 16:08:46.245
2460	\N	\N	1718	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.275	2016-11-30 16:08:46.275
2461	\N	\N	1719	167	235			2460	\N	t	t		0	\N	2016-11-30 16:08:46.313	2016-11-30 16:08:46.313
2462	\N	\N	1720	167	235			2460	\N	t	t		0	\N	2016-11-30 16:08:46.368	2016-11-30 16:08:46.368
2463	\N	\N	1721	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.414	2016-11-30 16:08:46.414
2464	\N	\N	1722	167	235			2463	\N	t	t		0	\N	2016-11-30 16:08:46.455	2016-11-30 16:08:46.455
2465	\N	\N	1723	167	235			2463	\N	t	t		0	\N	2016-11-30 16:08:46.512	2016-11-30 16:08:46.512
2466	\N	\N	1724	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.534	2016-11-30 16:08:46.534
2467	\N	\N	1725	167	235			2466	\N	t	t		0	\N	2016-11-30 16:08:46.559	2016-11-30 16:08:46.559
2468	\N	\N	1726	167	235			2466	\N	t	t		0	\N	2016-11-30 16:08:46.582	2016-11-30 16:08:46.582
2469	\N	\N	1727	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.61	2016-11-30 16:08:46.61
2470	\N	\N	1728	167	235			2469	\N	t	t		0	\N	2016-11-30 16:08:46.634	2016-11-30 16:08:46.634
2471	\N	\N	1729	167	235			2469	\N	t	t		0	\N	2016-11-30 16:08:46.66	2016-11-30 16:08:46.66
2472	\N	\N	1730	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.687	2016-11-30 16:08:46.687
2473	\N	\N	1731	167	235			2472	\N	t	t		0	\N	2016-11-30 16:08:46.768	2016-11-30 16:08:46.768
2474	\N	\N	1732	167	235			2472	\N	t	t		0	\N	2016-11-30 16:08:46.797	2016-11-30 16:08:46.797
2475	\N	\N	1733	167	235			\N	\N	t	t		0	\N	2016-11-30 16:08:46.817	2016-11-30 16:08:46.817
2476	\N	\N	1734	167	235			2475	\N	t	t		0	\N	2016-11-30 16:08:46.845	2016-11-30 16:08:46.845
2477	\N	\N	1735	167	235			2475	\N	t	t		0	\N	2016-11-30 16:08:46.876	2016-11-30 16:08:46.876
2478	\N	\N	\N	167	235			\N	\N	t	t		0	68	2016-11-30 16:08:46.905	2016-11-30 16:08:46.905
2479	\N	\N	1739	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.652	2016-11-30 16:10:35.652
2480	\N	\N	1740	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.672	2016-11-30 16:10:35.672
2481	\N	\N	1741	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.696	2016-11-30 16:10:35.696
2482	\N	\N	1742	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.721	2016-11-30 16:10:35.721
2483	\N	\N	1743	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.749	2016-11-30 16:10:35.749
2484	\N	\N	1744	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.77	2016-11-30 16:10:35.77
2485	\N	\N	1745	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.791	2016-11-30 16:10:35.791
2486	\N	\N	1746	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.814	2016-11-30 16:10:35.814
2487	\N	\N	1747	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.837	2016-11-30 16:10:35.837
2488	\N	\N	1748	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.864	2016-11-30 16:10:35.864
2489	\N	\N	1749	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.891	2016-11-30 16:10:35.891
2490	\N	\N	1750	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.913	2016-11-30 16:10:35.913
2491	\N	\N	1751	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.935	2016-11-30 16:10:35.935
2492	\N	\N	1752	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.954	2016-11-30 16:10:35.954
2493	\N	\N	1753	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.971	2016-11-30 16:10:35.971
2494	\N	\N	1754	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:35.99	2016-11-30 16:10:35.99
2495	\N	\N	1755	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:36.02	2016-11-30 16:10:36.02
2496	\N	\N	1756	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:36.041	2016-11-30 16:10:36.041
2497	\N	\N	1757	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:36.064	2016-11-30 16:10:36.064
2498	\N	\N	1758	168	236			\N	\N	t	t		0	\N	2016-11-30 16:10:36.084	2016-11-30 16:10:36.084
2499	\N	\N	\N	168	236			\N	\N	t	t		0	69	2016-11-30 16:10:36.107	2016-11-30 16:10:36.107
2500	\N	\N	1762	169	237			\N	\N	t	t		0	\N	2016-11-30 16:11:16.335	2016-11-30 16:11:16.335
2501	\N	\N	1763	169	237			\N	\N	t	t		0	\N	2016-11-30 16:11:16.355	2016-11-30 16:11:16.355
2502	\N	\N	1764	169	237			\N	\N	t	t		0	\N	2016-11-30 16:11:16.373	2016-11-30 16:11:16.373
2503	\N	\N	1765	169	237			\N	\N	t	t		0	\N	2016-11-30 16:11:16.393	2016-11-30 16:11:16.393
2504	\N	\N	1766	169	237			\N	\N	t	t		0	\N	2016-11-30 16:11:16.417	2016-11-30 16:11:16.417
2505	\N	\N	1767	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.715	2016-11-30 16:11:38.715
2506	\N	\N	1768	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.757	2016-11-30 16:11:38.757
2507	\N	\N	1769	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.792	2016-11-30 16:11:38.792
2508	\N	\N	1770	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.818	2016-11-30 16:11:38.818
2509	\N	\N	1771	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.849	2016-11-30 16:11:38.849
2510	\N	\N	1772	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.869	2016-11-30 16:11:38.869
2511	\N	\N	1773	170	238			\N	\N	t	t		0	\N	2016-11-30 16:11:38.89	2016-11-30 16:11:38.89
2512	\N	\N	1774	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.582	2016-11-30 16:11:59.582
2513	\N	\N	1775	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.608	2016-11-30 16:11:59.608
2514	\N	\N	1776	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.634	2016-11-30 16:11:59.634
2515	\N	\N	1777	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.663	2016-11-30 16:11:59.663
2516	\N	\N	1778	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.682	2016-11-30 16:11:59.682
2517	\N	\N	1779	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.705	2016-11-30 16:11:59.705
2518	\N	\N	1780	171	239			\N	\N	t	t		0	\N	2016-11-30 16:11:59.73	2016-11-30 16:11:59.73
2519	\N	\N	1781	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.777	2016-11-30 16:12:24.777
2520	\N	\N	1782	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.801	2016-11-30 16:12:24.801
2521	\N	\N	1783	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.822	2016-11-30 16:12:24.822
2522	\N	\N	1784	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.845	2016-11-30 16:12:24.845
2523	\N	\N	1785	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.872	2016-11-30 16:12:24.872
2524	\N	\N	1786	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.904	2016-11-30 16:12:24.904
2525	\N	\N	1787	172	240			\N	\N	t	t		0	\N	2016-11-30 16:12:24.926	2016-11-30 16:12:24.926
2526	\N	\N	1788	173	241			\N	\N	t	t		0	\N	2016-11-30 16:12:34.457	2016-11-30 16:12:34.457
2527	\N	\N	1789	173	241			\N	\N	t	t		0	\N	2016-11-30 16:12:34.485	2016-11-30 16:12:34.485
2528	\N	\N	1790	173	241			\N	\N	t	t		0	\N	2016-11-30 16:12:34.509	2016-11-30 16:12:34.509
2529	\N	\N	1791	173	241			\N	\N	t	t		0	\N	2016-11-30 16:12:34.528	2016-11-30 16:12:34.528
2530	\N	\N	1792	173	241			\N	\N	t	t		0	\N	2016-11-30 16:12:34.547	2016-11-30 16:12:34.547
2531	\N	\N	1793	174	242			\N	\N	t	t		0	\N	2016-11-30 16:12:53.085	2016-11-30 16:12:53.085
2532	\N	\N	1794	174	242			\N	\N	t	t		0	\N	2016-11-30 16:12:53.106	2016-11-30 16:12:53.106
2533	\N	\N	1795	174	242			\N	\N	t	t		0	\N	2016-11-30 16:12:53.126	2016-11-30 16:12:53.126
2534	\N	\N	1796	174	242			\N	\N	t	t		0	\N	2016-11-30 16:12:53.148	2016-11-30 16:12:53.148
2535	\N	\N	1797	174	242			\N	\N	t	t		0	\N	2016-11-30 16:12:53.17	2016-11-30 16:12:53.17
2536	\N	\N	1798	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:16.978	2016-11-30 16:13:16.978
2537	\N	\N	1799	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:16.998	2016-11-30 16:13:16.998
2538	\N	\N	1800	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:17.018	2016-11-30 16:13:17.018
2539	\N	\N	1801	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:17.036	2016-11-30 16:13:17.036
2540	\N	\N	1802	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:17.054	2016-11-30 16:13:17.054
2541	\N	\N	1803	175	243			\N	\N	t	t		0	\N	2016-11-30 16:13:17.073	2016-11-30 16:13:17.073
2542	\N	\N	1804	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.435	2016-11-30 16:13:49.435
2543	\N	\N	1805	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.458	2016-11-30 16:13:49.458
2544	\N	\N	1806	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.477	2016-11-30 16:13:49.477
2545	\N	\N	1807	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.496	2016-11-30 16:13:49.496
2546	\N	\N	1808	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.512	2016-11-30 16:13:49.512
2547	\N	\N	1809	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.529	2016-11-30 16:13:49.529
2548	\N	\N	1810	176	244			\N	\N	t	t		0	\N	2016-11-30 16:13:49.547	2016-11-30 16:13:49.547
2549	\N	\N	1811	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.598	2016-11-30 16:14:17.598
2550	\N	\N	1812	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.681	2016-11-30 16:14:17.681
2551	\N	\N	1813	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.711	2016-11-30 16:14:17.711
2552	\N	\N	1814	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.736	2016-11-30 16:14:17.736
2553	\N	\N	1815	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.767	2016-11-30 16:14:17.767
2554	\N	\N	1816	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.798	2016-11-30 16:14:17.798
2555	\N	\N	1817	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.838	2016-11-30 16:14:17.838
2556	\N	\N	1818	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.861	2016-11-30 16:14:17.861
2557	\N	\N	1819	177	245			\N	\N	t	t		0	\N	2016-11-30 16:14:17.883	2016-11-30 16:14:17.883
2558	\N	\N	1820	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.01	2016-11-30 16:14:34.01
2559	\N	\N	1821	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.036	2016-11-30 16:14:34.036
2560	\N	\N	1822	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.062	2016-11-30 16:14:34.062
2561	\N	\N	1823	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.096	2016-11-30 16:14:34.096
2562	\N	\N	1824	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.121	2016-11-30 16:14:34.121
2563	\N	\N	1825	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.143	2016-11-30 16:14:34.143
2564	\N	\N	1826	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.167	2016-11-30 16:14:34.167
2565	\N	\N	1827	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.19	2016-11-30 16:14:34.19
2566	\N	\N	1828	178	246			\N	\N	t	t		0	\N	2016-11-30 16:14:34.216	2016-11-30 16:14:34.216
2567	\N	\N	1829	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.387	2016-11-30 16:14:56.387
2568	\N	\N	1830	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.412	2016-11-30 16:14:56.412
2155	\N	\N	1434	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.382	2016-11-30 10:57:45.382
2156	\N	\N	1435	148	209			2155	\N	t	t		0	\N	2016-11-30 10:57:45.4	2016-11-30 10:57:45.4
2157	\N	\N	1436	148	209			2155	\N	t	t		0	\N	2016-11-30 10:57:45.416	2016-11-30 10:57:45.416
2158	\N	\N	1437	148	209			2157	\N	t	t		0	\N	2016-11-30 10:57:45.43	2016-11-30 10:57:45.43
2159	\N	\N	1438	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.443	2016-11-30 10:57:45.443
2160	\N	\N	1439	148	209			2159	\N	t	t		0	\N	2016-11-30 10:57:45.458	2016-11-30 10:57:45.458
2161	\N	\N	1440	148	209			2159	\N	t	t		0	\N	2016-11-30 10:57:45.472	2016-11-30 10:57:45.472
2162	\N	\N	1441	148	209			2159	\N	t	t		0	\N	2016-11-30 10:57:45.487	2016-11-30 10:57:45.487
2163	\N	\N	1442	148	209			2159	\N	t	t		0	\N	2016-11-30 10:57:45.503	2016-11-30 10:57:45.503
2164	\N	\N	1443	148	209			2163	\N	t	t		0	\N	2016-11-30 10:57:45.518	2016-11-30 10:57:45.518
2165	\N	\N	1444	148	209			2159	\N	t	t		0	\N	2016-11-30 10:57:45.533	2016-11-30 10:57:45.533
2166	\N	\N	1445	148	209			2165	\N	t	t		0	\N	2016-11-30 10:57:45.548	2016-11-30 10:57:45.548
2167	\N	\N	1446	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.559	2016-11-30 10:57:45.559
2168	\N	\N	1447	148	209			2167	\N	t	t		0	\N	2016-11-30 10:57:45.574	2016-11-30 10:57:45.574
2169	\N	\N	1448	148	209			2167	\N	t	t		0	\N	2016-11-30 10:57:45.591	2016-11-30 10:57:45.591
2170	\N	\N	1449	148	209			2167	\N	t	t		0	\N	2016-11-30 10:57:45.609	2016-11-30 10:57:45.609
2171	\N	\N	1450	148	209			2167	\N	t	t		0	\N	2016-11-30 10:57:45.626	2016-11-30 10:57:45.626
2172	\N	\N	1451	148	209			2171	\N	t	t		0	\N	2016-11-30 10:57:45.642	2016-11-30 10:57:45.642
2173	\N	\N	1452	148	209			2167	\N	t	t		0	\N	2016-11-30 10:57:45.657	2016-11-30 10:57:45.657
2174	\N	\N	1453	148	209			2173	\N	t	t		0	\N	2016-11-30 10:57:45.674	2016-11-30 10:57:45.674
2175	\N	\N	1454	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.687	2016-11-30 10:57:45.687
2176	\N	\N	1455	148	209			2175	\N	t	t		0	\N	2016-11-30 10:57:45.702	2016-11-30 10:57:45.702
2177	\N	\N	1456	148	209			2175	\N	t	t		0	\N	2016-11-30 10:57:45.716	2016-11-30 10:57:45.716
2178	\N	\N	1457	148	209			2177	\N	t	t		0	\N	2016-11-30 10:57:45.731	2016-11-30 10:57:45.731
2179	\N	\N	1458	148	209			2175	\N	t	t		0	\N	2016-11-30 10:57:45.745	2016-11-30 10:57:45.745
2180	\N	\N	1459	148	209			2179	\N	t	t		0	\N	2016-11-30 10:57:45.763	2016-11-30 10:57:45.763
2181	\N	\N	1460	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.783	2016-11-30 10:57:45.783
2182	\N	\N	1461	148	209			2181	\N	t	t		0	\N	2016-11-30 10:57:45.808	2016-11-30 10:57:45.808
2183	\N	\N	1462	148	209			2181	\N	t	t		0	\N	2016-11-30 10:57:45.827	2016-11-30 10:57:45.827
2184	\N	\N	1463	148	209			2183	\N	t	t		0	\N	2016-11-30 10:57:45.846	2016-11-30 10:57:45.846
2185	\N	\N	1464	148	209			2181	\N	t	t		0	\N	2016-11-30 10:57:45.866	2016-11-30 10:57:45.866
2186	\N	\N	1465	148	209			2185	\N	t	t		0	\N	2016-11-30 10:57:45.887	2016-11-30 10:57:45.887
2187	\N	\N	1466	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.903	2016-11-30 10:57:45.903
2188	\N	\N	1467	148	209			2187	\N	t	t		0	\N	2016-11-30 10:57:45.921	2016-11-30 10:57:45.921
2189	\N	\N	1468	148	209			2187	\N	t	t		0	\N	2016-11-30 10:57:45.938	2016-11-30 10:57:45.938
2190	\N	\N	1469	148	209			2189	\N	t	t		0	\N	2016-11-30 10:57:45.956	2016-11-30 10:57:45.956
2191	\N	\N	1470	148	209			2187	\N	t	t		0	\N	2016-11-30 10:57:45.97	2016-11-30 10:57:45.97
2192	\N	\N	1471	148	209			2191	\N	t	t		0	\N	2016-11-30 10:57:45.985	2016-11-30 10:57:45.985
2193	\N	\N	1472	148	209			\N	\N	t	t		0	\N	2016-11-30 10:57:45.998	2016-11-30 10:57:45.998
2194	\N	\N	1473	148	209			2193	\N	t	t		0	\N	2016-11-30 10:57:46.015	2016-11-30 10:57:46.015
2195	\N	\N	1474	148	209			2193	\N	t	t		0	\N	2016-11-30 10:57:46.031	2016-11-30 10:57:46.031
2196	\N	\N	1475	148	209			2195	\N	t	t		0	\N	2016-11-30 10:57:46.047	2016-11-30 10:57:46.047
2197	\N	\N	1476	148	209			2193	\N	t	t		0	\N	2016-11-30 10:57:46.063	2016-11-30 10:57:46.063
2198	\N	\N	1477	148	209			2197	\N	t	t		0	\N	2016-11-30 10:57:46.078	2016-11-30 10:57:46.078
2199	\N	\N	1478	148	210			\N	\N	t	t		0	\N	2016-11-30 10:57:46.093	2016-11-30 10:57:46.093
2200	\N	\N	1479	148	210			2199	\N	t	t		0	\N	2016-11-30 10:57:46.111	2016-11-30 10:57:46.111
2201	\N	\N	1480	148	210			2199	\N	t	t		0	\N	2016-11-30 10:57:46.127	2016-11-30 10:57:46.127
2202	\N	\N	1481	148	210			2199	\N	t	t		0	\N	2016-11-30 10:57:46.142	2016-11-30 10:57:46.142
2203	\N	\N	1482	148	210			2199	\N	t	t		0	\N	2016-11-30 10:57:46.158	2016-11-30 10:57:46.158
2204	\N	\N	1483	148	210			2199	\N	t	t		0	\N	2016-11-30 10:57:46.175	2016-11-30 10:57:46.175
2205	\N	\N	1484	148	210			2204	\N	t	t		0	\N	2016-11-30 10:57:46.189	2016-11-30 10:57:46.189
2206	\N	\N	1485	148	210			\N	\N	t	t		0	\N	2016-11-30 10:57:46.209	2016-11-30 10:57:46.209
2207	\N	\N	1486	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.23	2016-11-30 10:57:46.23
2208	\N	\N	1487	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.248	2016-11-30 10:57:46.248
2209	\N	\N	1488	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.266	2016-11-30 10:57:46.266
2210	\N	\N	1489	148	210			2209	\N	t	t		0	\N	2016-11-30 10:57:46.284	2016-11-30 10:57:46.284
2211	\N	\N	1490	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.301	2016-11-30 10:57:46.301
2212	\N	\N	1491	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.318	2016-11-30 10:57:46.318
2213	\N	\N	1492	148	210			2212	\N	t	t		0	\N	2016-11-30 10:57:46.334	2016-11-30 10:57:46.334
2214	\N	\N	1493	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.352	2016-11-30 10:57:46.352
2215	\N	\N	1494	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.369	2016-11-30 10:57:46.369
2216	\N	\N	1495	148	210			2206	\N	t	t		0	\N	2016-11-30 10:57:46.386	2016-11-30 10:57:46.386
2217	\N	\N	1496	148	210			2216	\N	t	t		0	\N	2016-11-30 10:57:46.401	2016-11-30 10:57:46.401
2218	\N	\N	1497	148	210			\N	\N	t	t		0	\N	2016-11-30 10:57:46.42	2016-11-30 10:57:46.42
2219	\N	\N	1498	148	210			2218	\N	t	t		0	\N	2016-11-30 10:57:46.437	2016-11-30 10:57:46.437
2220	\N	\N	1499	148	210			\N	\N	t	t		0	\N	2016-11-30 10:57:46.45	2016-11-30 10:57:46.45
2221	\N	\N	1500	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.465	2016-11-30 10:57:46.465
2222	\N	\N	1501	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.482	2016-11-30 10:57:46.482
2223	\N	\N	1502	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.497	2016-11-30 10:57:46.497
2224	\N	\N	1503	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.515	2016-11-30 10:57:46.515
2225	\N	\N	1504	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.532	2016-11-30 10:57:46.532
2226	\N	\N	1505	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.548	2016-11-30 10:57:46.548
2227	\N	\N	1506	148	210			2220	\N	t	t		0	\N	2016-11-30 10:57:46.563	2016-11-30 10:57:46.563
2228	\N	\N	1507	148	210			2227	\N	t	t		0	\N	2016-11-30 10:57:46.584	2016-11-30 10:57:46.584
2229	\N	\N	1508	148	210			2227	\N	t	t		0	\N	2016-11-30 10:57:46.609	2016-11-30 10:57:46.609
2230	\N	\N	1509	148	211			\N	\N	t	t		0	\N	2016-11-30 10:57:46.639	2016-11-30 10:57:46.639
2231	\N	\N	1510	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.658	2016-11-30 10:57:46.658
2232	\N	\N	1511	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.675	2016-11-30 10:57:46.675
2233	\N	\N	1512	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.694	2016-11-30 10:57:46.694
2234	\N	\N	1513	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.712	2016-11-30 10:57:46.712
2235	\N	\N	1514	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.73	2016-11-30 10:57:46.73
2236	\N	\N	1515	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.744	2016-11-30 10:57:46.744
2237	\N	\N	1516	148	211			2230	\N	t	t		0	\N	2016-11-30 10:57:46.758	2016-11-30 10:57:46.758
2238	\N	\N	1517	148	211			2237	\N	t	t		0	\N	2016-11-30 10:57:46.773	2016-11-30 10:57:46.773
2239	\N	\N	1518	148	211			\N	\N	t	t		0	\N	2016-11-30 10:57:46.786	2016-11-30 10:57:46.786
2240	\N	\N	1519	148	211			2239	\N	t	t		0	\N	2016-11-30 10:57:46.803	2016-11-30 10:57:46.803
2241	\N	\N	1520	148	211			2239	\N	t	t		0	\N	2016-11-30 10:57:46.818	2016-11-30 10:57:46.818
2242	\N	\N	1521	148	211			2239	\N	t	t		0	\N	2016-11-30 10:57:46.84	2016-11-30 10:57:46.84
2243	\N	\N	1522	148	211			2239	\N	t	t		0	\N	2016-11-30 10:57:46.855	2016-11-30 10:57:46.855
2244	\N	\N	1523	148	211			2239	\N	t	t		0	\N	2016-11-30 10:57:46.871	2016-11-30 10:57:46.871
2245	\N	\N	1524	148	211			2244	\N	t	t		0	\N	2016-11-30 10:57:46.889	2016-11-30 10:57:46.889
2246	\N	\N	1525	148	211			\N	\N	t	t		0	\N	2016-11-30 10:57:46.905	2016-11-30 10:57:46.905
2247	\N	\N	1526	148	211			2246	\N	t	t		0	\N	2016-11-30 10:57:46.924	2016-11-30 10:57:46.924
2248	\N	\N	1527	148	211			2246	\N	t	t		0	\N	2016-11-30 10:57:46.94	2016-11-30 10:57:46.94
2249	\N	\N	1528	148	211			2248	\N	t	t		0	\N	2016-11-30 10:57:46.956	2016-11-30 10:57:46.956
2250	\N	\N	1529	148	212			\N	\N	t	t		0	\N	2016-11-30 10:57:47.008	2016-11-30 10:57:47.008
2251	\N	\N	1530	148	212			2250	\N	t	t		0	\N	2016-11-30 10:57:47.028	2016-11-30 10:57:47.028
2252	\N	\N	1531	148	212			2250	\N	t	t		0	\N	2016-11-30 10:57:47.048	2016-11-30 10:57:47.048
2253	\N	\N	1532	148	212			2250	\N	t	t		0	\N	2016-11-30 10:57:47.065	2016-11-30 10:57:47.065
2254	\N	\N	1533	148	212			2253	\N	t	t		2	\N	2016-11-30 10:57:47.085	2016-11-30 10:57:47.085
2255	\N	\N	1534	148	212			2250	\N	t	t		0	\N	2016-11-30 10:57:47.107	2016-11-30 10:57:47.107
2256	\N	\N	1535	148	212			2250	\N	t	t		0	\N	2016-11-30 10:57:47.127	2016-11-30 10:57:47.127
2257	\N	\N	1536	148	212			\N	\N	t	t		0	\N	2016-11-30 10:57:47.143	2016-11-30 10:57:47.143
2258	\N	\N	1537	148	212			2257	\N	t	t		0	\N	2016-11-30 10:57:47.16	2016-11-30 10:57:47.16
2259	\N	\N	1538	148	212			2257	\N	t	t		0	\N	2016-11-30 10:57:47.175	2016-11-30 10:57:47.175
2260	\N	\N	1539	148	212			\N	\N	t	t		0	\N	2016-11-30 10:57:47.187	2016-11-30 10:57:47.187
2261	\N	\N	1540	148	212			2260	\N	t	t		0	\N	2016-11-30 10:57:47.202	2016-11-30 10:57:47.202
2262	\N	\N	1541	148	212			\N	\N	t	t		0	\N	2016-11-30 10:57:47.213	2016-11-30 10:57:47.213
2263	\N	\N	1542	148	212			2262	\N	t	t		0	\N	2016-11-30 10:57:47.228	2016-11-30 10:57:47.228
2264	\N	\N	1543	148	212			\N	\N	t	t		0	\N	2016-11-30 10:57:47.247	2016-11-30 10:57:47.247
2265	\N	\N	1544	148	212			2264	\N	t	t		0	\N	2016-11-30 10:57:47.263	2016-11-30 10:57:47.263
2266	\N	\N	1545	148	213			\N	\N	t	t		0	\N	2016-11-30 10:57:47.277	2016-11-30 10:57:47.277
2267	\N	\N	1546	148	213			2266	\N	t	t		0	\N	2016-11-30 10:57:47.295	2016-11-30 10:57:47.295
2268	\N	\N	1547	148	214			\N	\N	t	t		0	\N	2016-11-30 10:57:47.31	2016-11-30 10:57:47.31
2269	\N	\N	1548	148	214			2268	\N	t	t		0	\N	2016-11-30 10:57:47.327	2016-11-30 10:57:47.327
2270	\N	\N	1549	148	215			\N	\N	t	t		0	\N	2016-11-30 10:57:47.343	2016-11-30 10:57:47.343
2271	\N	\N	1550	148	215			2270	\N	t	t		0	\N	2016-11-30 10:57:47.359	2016-11-30 10:57:47.359
2272	\N	\N	1551	148	215			2270	\N	t	t		0	\N	2016-11-30 10:57:47.377	2016-11-30 10:57:47.377
2273	\N	\N	1552	148	216			\N	\N	t	t		0	\N	2016-11-30 10:57:47.391	2016-11-30 10:57:47.391
2274	\N	\N	1553	148	216			2273	\N	t	t		0	\N	2016-11-30 10:57:47.411	2016-11-30 10:57:47.411
2275	\N	\N	1554	148	216			2273	\N	t	t		0	\N	2016-11-30 10:57:47.428	2016-11-30 10:57:47.428
2569	\N	\N	1831	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.429	2016-11-30 16:14:56.429
2570	\N	\N	1832	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.447	2016-11-30 16:14:56.447
2571	\N	\N	1833	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.468	2016-11-30 16:14:56.468
2572	\N	\N	1834	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.487	2016-11-30 16:14:56.487
2573	\N	\N	1835	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.505	2016-11-30 16:14:56.505
2574	\N	\N	1836	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.525	2016-11-30 16:14:56.525
2575	\N	\N	1837	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.543	2016-11-30 16:14:56.543
2576	\N	\N	1838	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.561	2016-11-30 16:14:56.561
2577	\N	\N	1839	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.581	2016-11-30 16:14:56.581
2578	\N	\N	1840	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.599	2016-11-30 16:14:56.599
2579	\N	\N	1841	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.627	2016-11-30 16:14:56.627
2580	\N	\N	1842	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.645	2016-11-30 16:14:56.645
2581	\N	\N	1843	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.663	2016-11-30 16:14:56.663
2582	\N	\N	1844	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.68	2016-11-30 16:14:56.68
2583	\N	\N	1845	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.7	2016-11-30 16:14:56.7
2584	\N	\N	1846	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.72	2016-11-30 16:14:56.72
2585	\N	\N	1847	179	247			\N	\N	t	t		0	\N	2016-11-30 16:14:56.736	2016-11-30 16:14:56.736
2586	\N	\N	1848	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.029	2016-11-30 16:15:16.029
2587	\N	\N	1849	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.051	2016-11-30 16:15:16.051
2588	\N	\N	1850	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.069	2016-11-30 16:15:16.069
2589	\N	\N	1851	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.086	2016-11-30 16:15:16.086
2590	\N	\N	1852	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.104	2016-11-30 16:15:16.104
2591	\N	\N	1853	180	248			\N	\N	t	t		0	\N	2016-11-30 16:15:16.122	2016-11-30 16:15:16.122
2592	\N	\N	1854	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.592	2016-11-30 16:15:33.592
2593	\N	\N	1855	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.616	2016-11-30 16:15:33.616
2594	\N	\N	1856	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.639	2016-11-30 16:15:33.639
2595	\N	\N	1857	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.671	2016-11-30 16:15:33.671
2596	\N	\N	1858	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.694	2016-11-30 16:15:33.694
2597	\N	\N	1859	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.713	2016-11-30 16:15:33.713
2598	\N	\N	1860	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.731	2016-11-30 16:15:33.731
2599	\N	\N	1861	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.75	2016-11-30 16:15:33.75
2600	\N	\N	1862	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.77	2016-11-30 16:15:33.77
2601	\N	\N	1863	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.792	2016-11-30 16:15:33.792
2602	\N	\N	1864	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.839	2016-11-30 16:15:33.839
2603	\N	\N	1865	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.874	2016-11-30 16:15:33.874
2604	\N	\N	1866	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.908	2016-11-30 16:15:33.908
2605	\N	\N	1867	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.929	2016-11-30 16:15:33.929
2606	\N	\N	1868	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.946	2016-11-30 16:15:33.946
2607	\N	\N	1869	181	249			\N	\N	t	t		0	\N	2016-11-30 16:15:33.967	2016-11-30 16:15:33.967
2608	\N	\N	1870	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:33.984	2016-11-30 16:15:33.984
2609	\N	\N	1871	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:34.002	2016-11-30 16:15:34.002
2610	\N	\N	1872	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:34.034	2016-11-30 16:15:34.034
2611	\N	\N	1873	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:34.056	2016-11-30 16:15:34.056
2612	\N	\N	1874	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:34.075	2016-11-30 16:15:34.075
2613	\N	\N	1875	181	250			\N	\N	t	t		0	\N	2016-11-30 16:15:34.094	2016-11-30 16:15:34.094
2614	\N	\N	1876	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.257	2016-11-30 16:15:54.257
2615	\N	\N	1877	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.279	2016-11-30 16:15:54.279
2616	\N	\N	1878	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.3	2016-11-30 16:15:54.3
2617	\N	\N	1879	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.323	2016-11-30 16:15:54.323
2618	\N	\N	1880	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.343	2016-11-30 16:15:54.343
2619	\N	\N	1881	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:54.365	2016-11-30 16:15:54.365
2620	\N	\N	1882	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:55.205	2016-11-30 16:15:55.205
2621	\N	\N	1883	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:55.224	2016-11-30 16:15:55.224
2622	\N	\N	1884	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:55.243	2016-11-30 16:15:55.243
2623	\N	\N	1885	182	251			\N	\N	t	t		0	\N	2016-11-30 16:15:55.261	2016-11-30 16:15:55.261
2624	\N	\N	1886	183	252			\N	\N	t	t		0	\N	2016-11-30 16:16:15.172	2016-11-30 16:16:15.172
2643	\N	\N	1906	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.612	2016-11-30 16:17:40.612
2644	\N	\N	1907	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.636	2016-11-30 16:17:40.636
2645	\N	\N	1908	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.658	2016-11-30 16:17:40.658
2646	\N	\N	1909	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.675	2016-11-30 16:17:40.675
2647	\N	\N	1910	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.692	2016-11-30 16:17:40.692
2648	\N	\N	1911	185	254			\N	\N	t	t		0	\N	2016-11-30 16:17:40.707	2016-11-30 16:17:40.707
\.


--
-- Name: item_form_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_form_metaelements_id_seq', 2745, true);


--
-- Data for Name: item_group_metaelements; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_group_metaelements (id, no, parentno, item_group_id, crf_info_id, header, subheader, repeat_number, repeat_max, item_id, seq, show_group, repeating_group, options_index, created_at, updated_at) FROM stdin;
48	\N	\N	66	164			\N	\N	1569	\N	\N	\N	\N	2016-11-30 16:05:52.832	2016-11-30 16:05:52.832
49	\N	\N	66	164			\N	\N	1570	\N	\N	\N	\N	2016-11-30 16:05:52.902	2016-11-30 16:05:52.902
50	\N	\N	66	164			\N	\N	1571	\N	\N	\N	\N	2016-11-30 16:05:52.995	2016-11-30 16:05:52.995
51	\N	\N	67	165			\N	\N	1609	\N	\N	\N	\N	2016-11-30 16:06:52.098	2016-11-30 16:06:52.098
52	\N	\N	67	165			\N	\N	1610	\N	\N	\N	\N	2016-11-30 16:06:52.151	2016-11-30 16:06:52.151
53	\N	\N	68	167			\N	\N	1736	\N	\N	\N	\N	2016-11-30 16:08:46.937	2016-11-30 16:08:46.937
54	\N	\N	68	167			\N	\N	1737	\N	\N	\N	\N	2016-11-30 16:08:46.963	2016-11-30 16:08:46.963
55	\N	\N	68	167			\N	\N	1738	\N	\N	\N	\N	2016-11-30 16:08:46.993	2016-11-30 16:08:46.993
56	\N	\N	69	168			\N	\N	1759	\N	\N	\N	\N	2016-11-30 16:10:36.136	2016-11-30 16:10:36.136
57	\N	\N	69	168			\N	\N	1760	\N	\N	\N	\N	2016-11-30 16:10:36.164	2016-11-30 16:10:36.164
58	\N	\N	69	168			\N	\N	1761	\N	\N	\N	\N	2016-11-30 16:10:36.187	2016-11-30 16:10:36.187
\.


--
-- Name: item_group_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_group_metaelements_id_seq', 58, true);


--
-- Data for Name: item_groups; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_groups (id, name, description, created_at, updated_at) FROM stdin;
66	家族史	家族史	2016-11-30 13:17:23.602	2016-11-30 13:17:23.602
67	其他检查项目	其他检查项目	2016-11-30 16:06:50.675	2016-11-30 16:06:50.675
68	影像其他检查	影像其他检查	2016-11-30 16:08:43.434	2016-11-30 16:08:43.434
69	生化其他项目	生化其他项目	2016-11-30 16:10:35.578	2016-11-30 16:10:35.578
\.


--
-- Name: item_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_groups_id_seq', 69, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY items (id, name, description, units, header, left_item_text, right_item_text, phi_status, item_data_type, response_type, options_text, options_value, default_value, regexp, regexp_error_msg, created_at, updated_at) FROM stdin;
1421	zs_zz	症状			症状		\N	ST	multi-select	打鼾,憋醒,嗜睡,发热,咳嗽,咳痰,咯血,气促,呼吸困难,头痛,头晕,乏力,胸闷,胸痛,心悸,恶心,呕吐,腹胀,腹痛,腹泻,黑便,尿频,尿急,尿痛,双下肢水肿,其他	打鼾,憋醒,嗜睡,发热,咳嗽,咳痰,咯血,气促,呼吸困难,头痛,头晕,乏力,胸闷,胸痛,心悸,恶心,呕吐,腹胀,腹痛,腹泻,黑便,尿频,尿急,尿痛,双下肢水肿,其他				2016-11-30 10:45:41.769	2016-11-30 10:45:41.769
1422	zs_bc	病程			病程		\N	INT	text						2016-11-30 10:45:41.832	2016-11-30 10:45:41.832
1423	zs_bcdw	病程单位			病程单位		\N	ST	single-select	年,月,天	年,月,天				2016-11-30 10:45:41.865	2016-11-30 10:45:41.865
1424	xbs_dh	打鼾			打鼾		\N	ST	radio	是,否	是,否				2016-11-30 10:45:41.895	2016-11-30 10:45:41.895
1425	xbs_hxzt	呼吸暂停			呼吸暂停		\N	ST	radio	是,否	是,否				2016-11-30 10:45:41.931	2016-11-30 10:45:41.931
1426	xbs_yjbx	夜间憋醒			夜间憋醒		\N	ST	radio	是,否	是,否				2016-11-30 10:45:41.959	2016-11-30 10:45:41.959
1427	xbs_yqpj	晨起疲倦			晨起疲倦		\N	ST	radio	是,否	是,否				2016-11-30 10:45:41.987	2016-11-30 10:45:41.987
1428	xbs_btss	白天嗜睡			白天嗜睡		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.026	2016-11-30 10:45:42.026
1429	xbs_ynzd	夜尿增多			夜尿增多		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.057	2016-11-30 10:45:42.057
1430	xbs_jylxj	记忆力下降			记忆力下降		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.093	2016-11-30 10:45:42.093
1431	xbs_xggb	性格改变			性格改变		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.116	2016-11-30 10:45:42.116
1432	xbs_xlzl	心理智力行为异常			心理智力行为异常		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.149	2016-11-30 10:45:42.149
1433	xbs_xgnza	性功能障碍			性功能障碍		\N	ST	radio	是,否	是,否				2016-11-30 10:45:42.208	2016-11-30 10:45:42.208
1434	hxxg1001	鼻炎			鼻炎		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:50.258	2016-11-30 10:46:50.258
1435	hxxg1002	鼻炎病程	年		病程		\N	INT	text						2016-11-30 10:46:50.314	2016-11-30 10:46:50.314
1436	hxxg1003	是否服用鼻炎药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.344	2016-11-30 10:46:50.344
1437	hxxg1004	鼻炎药物名称			药物名称		\N	ST	text						2016-11-30 10:46:50.365	2016-11-30 10:46:50.365
1438	hxxg1005	COPD			COPD		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:50.386	2016-11-30 10:46:50.386
1439	hxxg1006	COPD病程	年		病程		\N	ST	text						2016-11-30 10:46:50.415	2016-11-30 10:46:50.415
1440	hxxg1007	COPD每年发作次数	次		每年发作次数		\N	ST	text						2016-11-30 10:46:50.444	2016-11-30 10:46:50.444
1441	hxxg1008	COPD每年住院次数	次		每年住院次数		\N	ST	text						2016-11-30 10:46:50.488	2016-11-30 10:46:50.488
1442	hxxg1009	COPD是否有肺功能资料			是否有肺功能资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.521	2016-11-30 10:46:50.521
1443	hxxg1010	COPD程度			程度		\N	ST	text						2016-11-30 10:46:50.548	2016-11-30 10:46:50.548
1444	hxxg1011	是否服用COPD药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.579	2016-11-30 10:46:50.579
1445	hxxg1012	COPD药物名称			药物名称		\N	ST	text						2016-11-30 10:46:50.607	2016-11-30 10:46:50.607
1446	hxxg1013	Asthma			Asthma		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:50.648	2016-11-30 10:46:50.648
1447	hxxg1014	Asthma病程	年		病程		\N	ST	text						2016-11-30 10:46:50.683	2016-11-30 10:46:50.683
1448	hxxg1015	Asthma每年发作次数	次		每年发作次数		\N	ST	text						2016-11-30 10:46:50.716	2016-11-30 10:46:50.716
1449	hxxg1016	Asthma每年住院次数	次		每年住院次数		\N	ST	text						2016-11-30 10:46:50.742	2016-11-30 10:46:50.742
1450	hxxg1017	Asthma是否有肺功能资料			是否有肺功能资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.776	2016-11-30 10:46:50.776
1451	hxxg1018	Asthma程度			程度		\N	ST	text						2016-11-30 10:46:50.797	2016-11-30 10:46:50.797
1452	hxxg1019	是否服用Asthma药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.818	2016-11-30 10:46:50.818
1453	hxxg1020	Asthma药物名称			Asthma药物名称		\N	ST	text						2016-11-30 10:46:50.848	2016-11-30 10:46:50.848
1454	hxxg1021	反流性咳嗽			反流性咳嗽		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:50.875	2016-11-30 10:46:50.875
1455	hxxg1022	反流性咳嗽病程	年		病程		\N	ST	text						2016-11-30 10:46:50.9	2016-11-30 10:46:50.9
1456	hxxg1023	反流性咳嗽是否有24小时PH监测资料			是否有24小时PH监测资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.93	2016-11-30 10:46:50.93
1457	hxxg1024	反流性咳嗽程度			程度		\N	ST	text						2016-11-30 10:46:50.956	2016-11-30 10:46:50.956
1458	hxxg1025	是否服用反流性咳嗽药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:50.977	2016-11-30 10:46:50.977
1459	hxxg1026	反流性咳嗽药物名称			药物名称		\N	ST	text						2016-11-30 10:46:50.999	2016-11-30 10:46:50.999
1460	hxxg1027	间质性肺炎间质性肺炎			间质性肺炎		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:51.025	2016-11-30 10:46:51.025
1461	hxxg1028	间质性肺炎病程	年		病程		\N	ST	text						2016-11-30 10:46:51.056	2016-11-30 10:46:51.056
1462	hxxg1029	间质性肺炎是否有肺功能资料			是否有肺功能资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.08	2016-11-30 10:46:51.08
1463	hxxg1030	间质性肺炎程度			程度		\N	ST	text						2016-11-30 10:46:51.103	2016-11-30 10:46:51.103
1464	hxxg1031	是否服用间质性肺炎药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.129	2016-11-30 10:46:51.129
1465	hxxg1032	间质性肺炎药物名称			药物名称		\N	ST	text						2016-11-30 10:46:51.158	2016-11-30 10:46:51.158
1466	hxxg1033	肺动脉高压			肺动脉高压		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:51.181	2016-11-30 10:46:51.181
1467	hxxg1034	肺动脉高压病程	年		病程		\N	ST	text						2016-11-30 10:46:51.204	2016-11-30 10:46:51.204
1468	hxxg1035	肺动脉高压是否有心脏超生、CT或OCT资料			是否有心脏超声、CT或OCT资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.224	2016-11-30 10:46:51.224
1469	hxxg1036	肺动脉高压程度			程度		\N	ST	text						2016-11-30 10:46:51.248	2016-11-30 10:46:51.248
1470	hxxg1037	是否服用肺动脉高压药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.271	2016-11-30 10:46:51.271
1471	hxxg1038	肺动脉高压药物名称			药物名称		\N	ST	text						2016-11-30 10:46:51.294	2016-11-30 10:46:51.294
1472	hxxg1039	肺栓塞			肺栓塞		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:51.32	2016-11-30 10:46:51.32
1473	hxxg1040	肺栓塞病程	年		病程		\N	ST	text						2016-11-30 10:46:51.374	2016-11-30 10:46:51.374
1474	hxxg1041	肺栓塞－是否有肺通气灌注或CTPA资料			是否有肺通气灌注或CTPA资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.395	2016-11-30 10:46:51.395
1475	hxxg1042	肺栓塞程度			程度		\N	ST	text						2016-11-30 10:46:51.419	2016-11-30 10:46:51.419
1476	hxxg1043	是否服用肺栓塞药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.458	2016-11-30 10:46:51.458
1477	hxxg1044	肺栓塞药物名称			药物名称		\N	ST	text						2016-11-30 10:46:51.482	2016-11-30 10:46:51.482
1478	xxg0100	（1）高血压			（1）高血压		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:51.511	2016-11-30 10:46:51.511
1479	xxg0101	高血压病程			病程		\N	ST	text						2016-11-30 10:46:51.533	2016-11-30 10:46:51.533
1480	xxg0102	高血压分级			分级		\N	ST	radio	1级,2级,3级	1级,2级,3级				2016-11-30 10:46:51.557	2016-11-30 10:46:51.557
1481	xxg0103	高血压分组			分组		\N	ST	radio	低危,中危,高危,很高危	低危,中危,高危,很高危				2016-11-30 10:46:51.578	2016-11-30 10:46:51.578
1482	xxg0104	最高血压	mmHg    		最高血压		\N	ST	text						2016-11-30 10:46:51.605	2016-11-30 10:46:51.605
1483	xxg0105	高血压是否服用药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.627	2016-11-30 10:46:51.627
1484	xxg0106	服药后平均血压	mmHg    		服药后平均血压		\N	ST	text						2016-11-30 10:46:51.657	2016-11-30 10:46:51.657
1485	xxg0107	（2）冠心病			（2）冠心病		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:51.689	2016-11-30 10:46:51.689
1486	xxg0108	冠心病病程			病程		\N	ST	text						2016-11-30 10:46:51.741	2016-11-30 10:46:51.741
1487	xxg0109	冠心病类型			类型		\N	ST	radio	稳定型心绞痛,不稳定型心绞痛,NSTEMI,STEMI	稳定型心绞痛,不稳定型心绞痛,NSTEMI,STEMI				2016-11-30 10:46:51.775	2016-11-30 10:46:51.775
1488	xxg0110	冠脉造影结果异常			冠脉造影结果异常		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.865	2016-11-30 10:46:51.865
1489	xxg0111	冠心病时间			时间		\N	ST	text						2016-11-30 10:46:51.896	2016-11-30 10:46:51.896
1490	xxg0112	冠心病病变部位			病变部位		\N	ST	single-select	左主干,右冠,左前降支,回旋支,其它	左主干,右冠,左前降支,回旋支,其它				2016-11-30 10:46:51.927	2016-11-30 10:46:51.927
1491	xxg0113	冠脉支架植入术			冠脉支架植入术		\N	ST	radio	是,否	是,否				2016-11-30 10:46:51.958	2016-11-30 10:46:51.958
1492	xxg0114	冠脉支架植入术时间			时间		\N	ST	text						2016-11-30 10:46:51.983	2016-11-30 10:46:51.983
1493	xxg0115	冠心病支架部位			支架部位		\N	ST	radio	左主干,右冠,左前降支,回旋支,其它	左主干,右冠,左前降支,回旋支,其它				2016-11-30 10:46:52.005	2016-11-30 10:46:52.005
1494	xxg0116	冠心病支架数			支架数		\N	ST	text						2016-11-30 10:46:52.026	2016-11-30 10:46:52.026
1495	xxg0117	冠心病冠脉旁路移植术			冠心病冠脉旁路移植术		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.046	2016-11-30 10:46:52.046
1496	xxg0118	冠脉旁路移植术时间			冠脉旁路移植术时间		\N	ST	text						2016-11-30 10:46:52.068	2016-11-30 10:46:52.068
1497	xxg0119	（3）心力衰竭史			（3）心力衰竭史		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.095	2016-11-30 10:46:52.095
1498	xxg0120	病程	年		病程		\N	ST	text						2016-11-30 10:46:52.124	2016-11-30 10:46:52.124
1499	xxg0121	（4）心律失常病史			（4）心律失常病史		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.149	2016-11-30 10:46:52.149
1500	xxg0122	病程	年		病程		\N	ST	text						2016-11-30 10:46:52.171	2016-11-30 10:46:52.171
1501	xxg0123	窦性			窦性		\N	ST	radio	心动过速,心动过缓,病态窦房结综合征	心动过速,心动过缓,病态窦房结综合征				2016-11-30 10:46:52.19	2016-11-30 10:46:52.19
1502	xxg0124	早搏			早搏		\N	ST	radio	房性,房室交界性,室性,不详	房性,房室交界性,室性,不详				2016-11-30 10:46:52.208	2016-11-30 10:46:52.208
1503	xxg0125	心动过速			心动过速		\N	ST	radio	阵发性室上性心动过速,室性心动过速,心房扑动,心房颤动,心室扑动,心室颤动,不详\n	阵发性室上性心动过速,室性心动过速,心房扑动,心房颤动,心室扑动,心室颤动,不详\n				2016-11-30 10:46:52.227	2016-11-30 10:46:52.227
1504	xxg0126	房室传导阻滞类型 			房室传导阻滞类型 		\N	ST	radio	I度,II度I型,II度II型,III度,不详	I度,II度I型,II度II型,III度,不详				2016-11-30 10:46:52.247	2016-11-30 10:46:52.247
1505	xxg0127	束支阻滞			束支阻滞		\N	ST	radio	左束支,右束支,左前分支,左后分支,三分支,不详	左束支,右束支,左前分支,左后分支,三分支,不详				2016-11-30 10:46:52.266	2016-11-30 10:46:52.266
1506	xxg0128	其他心血管疾病史			其他心血管疾病史		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.292	2016-11-30 10:46:52.292
1507	xxg0129	心血管疾病史病程			心血管疾病史病程		\N	ST	text						2016-11-30 10:46:52.312	2016-11-30 10:46:52.312
1508	xxg0130	心血管疾病分类			心血管疾病分类		\N	ST	radio	心肌炎,心肌病,瓣膜病,先心病 ,多发性大动脉炎,血管迷走性晕厥,肺动脉栓塞,继发性高血压,心血管神经症,其他	心肌炎,心肌病,瓣膜病,先心病 ,多发性大动脉炎,血管迷走性晕厥,肺动脉栓塞,继发性高血压,心血管神经症,其他				2016-11-30 10:46:52.332	2016-11-30 10:46:52.332
1509	nxgxg1001	（1）脑梗塞、脑出血、短暂性脑缺血发作			（1）脑梗塞、脑出血、短暂性脑缺血发作		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.355	2016-11-30 10:46:52.355
1510	nxgxg1002	病程	年		病程		\N	ST	text						2016-11-30 10:46:52.376	2016-11-30 10:46:52.376
1511	nxgxg1003	发作次数	次		发作次数		\N	ST	text						2016-11-30 10:46:52.399	2016-11-30 10:46:52.399
1512	nxgxg1004	最近一次发作时间			最近一次发作时间		\N	DATE	text						2016-11-30 10:46:52.418	2016-11-30 10:46:52.418
1513	nxgxg1005	是否有具体CT或MRI资料			是否有具体CT或MRI资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.439	2016-11-30 10:46:52.439
1514	nxgxg1006	受试者感觉症状已经恢复			受试者感觉症状已经恢复		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.469	2016-11-30 10:46:52.469
1515	nxgxg1007	发作类型			发作类型		\N	ST	radio	短暂性脑缺血发作,脑梗死□脑出血,蛛网膜下腔出血,颅内静脉血栓形成	短暂性脑缺血发作,脑梗死□脑出血,蛛网膜下腔出血,颅内静脉血栓形成				2016-11-30 10:46:52.5	2016-11-30 10:46:52.5
1516	nxgxg1008	是否服用药物			是否服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.523	2016-11-30 10:46:52.523
1517	nxgxg1009	短暂性脑缺血发作药物			药物		\N	ST	text						2016-11-30 10:46:52.552	2016-11-30 10:46:52.552
1518	nxgxg1010	（2）癫痫			（2）癫痫		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.577	2016-11-30 10:46:52.577
1519	nxgxg1011	癫痫病程	年		病程		\N	ST	text						2016-11-30 10:46:52.6	2016-11-30 10:46:52.6
1520	nxgxg1012	癫痫发作次数	次		发作次数		\N	ST	text						2016-11-30 10:46:52.619	2016-11-30 10:46:52.619
1521	nxgxg1013	癫痫最近一次发作时间			最近一次发作时间		\N	ST	text						2016-11-30 10:46:52.639	2016-11-30 10:46:52.639
1522	nxgxg1014	癫痫是否有具体脑电图资料			是否有具体脑电图资料		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.66	2016-11-30 10:46:52.66
1523	nxgxg1015	癫痫是服用药物			是服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.681	2016-11-30 10:46:52.681
1524	nxgxg1016	癫痫药物			药物		\N	ST	text						2016-11-30 10:46:52.712	2016-11-30 10:46:52.712
1525	nxgxg1017	（3）精神异常			（3）精神异常		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.737	2016-11-30 10:46:52.737
1526	nxgxg1018	精神异常病程	年		病程		\N	ST	text						2016-11-30 10:46:52.759	2016-11-30 10:46:52.759
1527	nxgxg1019	精神异常是服用药物			是服用药物		\N	ST	radio	是,否	是,否				2016-11-30 10:46:52.789	2016-11-30 10:46:52.789
1528	nxgxg1020	精神异常药物			药物		\N	ST	text						2016-11-30 10:46:52.808	2016-11-30 10:46:52.808
1529	dxxxg1001	（1）糖尿病			（1）糖尿病		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:52.833	2016-11-30 10:46:52.833
1530	dxxxg1002	糖尿病病程	年		病程		\N	ST	text						2016-11-30 10:46:52.859	2016-11-30 10:46:52.859
1531	dxxxg1003	糖尿病类型			类型		\N	ST	radio	1型,2型	1型,2型				2016-11-30 10:46:52.884	2016-11-30 10:46:52.884
1532	dxxxg1004	糖尿病其他治疗			其他治疗		\N	ST	radio	无,胰岛素,降糖药	无,胰岛素,降糖药				2016-11-30 10:46:52.914	2016-11-30 10:46:52.914
1533	dxxxg1005	降糖药			降糖药		\N	ST	text						2016-11-30 10:46:52.942	2016-11-30 10:46:52.942
1534	dxxxg1006	平日空腹血糖水平	mmol/L		平日空腹血糖水平		\N	ST	text						2016-11-30 10:46:52.972	2016-11-30 10:46:52.972
1535	dxxxg1007	平日餐后2小时血糖水平	mmol/L		平日餐后2小时血糖水平		\N	ST	text						2016-11-30 10:46:52.999	2016-11-30 10:46:52.999
1536	dxxxg1008	（2）血脂异常			（2）血脂异常		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.026	2016-11-30 10:46:53.026
1537	dxxxg1009	血脂异常病程	年		病程		\N	ST	text						2016-11-30 10:46:53.055	2016-11-30 10:46:53.055
1538	dxxxg1010	血脂异常			血脂异常		\N	ST	radio	高总胆固醇（TC),高低密度脂蛋白胆固醇（LDL—C）,高甘油三酯（TG,低高密度脂蛋白胆固醇（HDL—C）\n	高总胆固醇（TC),高低密度脂蛋白胆固醇（LDL—C）,高甘油三酯（TG,低高密度脂蛋白胆固醇（HDL—C）\n				2016-11-30 10:46:53.078	2016-11-30 10:46:53.078
1539	dxxxg1011	（3）甲状腺减低			（3）甲状腺减低		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.111	2016-11-30 10:46:53.111
1540	dxxxg1012	甲状腺减低病程			病程		\N	ST	text						2016-11-30 10:46:53.141	2016-11-30 10:46:53.141
1541	dxxxg1013	（4）多囊卵巢综合症			（4）多囊卵巢综合症		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.176	2016-11-30 10:46:53.176
1542	dxxxg1014	多囊卵巢综合症病程			病程		\N	ST	text						2016-11-30 10:46:53.219	2016-11-30 10:46:53.219
1543	dxxxg1015	（5）退肢端肥大症			（5）退肢端肥大症		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.246	2016-11-30 10:46:53.246
1544	dxxxg1016	退肢端肥大症病程			病程		\N	ST	text						2016-11-30 10:46:53.272	2016-11-30 10:46:53.272
1545	qtjbm101	性功能障碍			性功能障碍		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.299	2016-11-30 10:46:53.299
1546	qtjbm102	性功能障碍病程			病程		\N	ST	text						2016-11-30 10:46:53.324	2016-11-30 10:46:53.324
1547	qtjbm103	交通事故原因是疲倦或嗜睡吗？			交通事故原因是疲倦或嗜睡吗？		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.348	2016-11-30 10:46:53.348
1548	qtjbm104	意外次数			意外次数		\N	ST	radio	0=无,1=1-2次,2=3-4次,3=5次以上	0=无,1=1-2次,2=3-4次,3=5次以上				2016-11-30 10:46:53.372	2016-11-30 10:46:53.372
1549	qtjbm105	手术史			手术史		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.395	2016-11-30 10:46:53.395
1550	qtjbm106	手术史病程			病程		\N	ST	text						2016-11-30 10:46:53.417	2016-11-30 10:46:53.417
1551	qtjbm107	手术名称			手术名称		\N	ST	text						2016-11-30 10:46:53.437	2016-11-30 10:46:53.437
1552	qtjbm108	其它病史			其它病史		\N	ST	radio	是,否,不详	是,否,不详				2016-11-30 10:46:53.46	2016-11-30 10:46:53.46
1553	qtjbm109	其它病史病程			病程		\N	ST	text						2016-11-30 10:46:53.487	2016-11-30 10:46:53.487
1554	qtjbm110	疾病名称			疾病名称		\N	ST	text						2016-11-30 10:46:53.516	2016-11-30 10:46:53.516
1555	grs_xys10	吸烟史			吸烟史		\N	ST	radio	一直吸烟未戒烟,从前吸烟,从不吸烟	一直吸烟未戒烟,从前吸烟,从不吸烟				2016-11-30 11:38:19.618	2016-11-30 11:38:19.618
1556	grs_xys11	吸烟年限	年		吸烟年限		\N	ST	text						2016-11-30 11:38:19.662	2016-11-30 11:38:19.662
1557	grs_xys12	平均每日吸烟	支		平均每日吸烟		\N	ST	text						2016-11-30 11:38:19.679	2016-11-30 11:38:19.679
1558	grs_xys13	已戒烟	年		已戒烟		\N	ST	text						2016-11-30 11:38:19.697	2016-11-30 11:38:19.697
1559	grs_xys14	吸烟年限	年		吸烟年限		\N	ST	text						2016-11-30 11:38:19.712	2016-11-30 11:38:19.712
1560	grs_xys15	每日吸烟	支		每日吸烟		\N	ST	text						2016-11-30 11:38:19.729	2016-11-30 11:38:19.729
1561	grs_xys16	饮酒史			饮酒史		\N	ST	radio	经常饮酒,偶尔少量饮酒,从前饮酒已戒酒,从不饮酒	经常饮酒,偶尔少量饮酒,从前饮酒已戒酒,从不饮酒				2016-11-30 11:38:19.745	2016-11-30 11:38:19.745
1562	grs_xys17	喝酒年限			喝酒年限		\N	ST	text						2016-11-30 11:38:19.76	2016-11-30 11:38:19.76
1563	grs_xys18	种类			种类		\N	ST	text						2016-11-30 11:38:19.774	2016-11-30 11:38:19.774
1564	grs_xys19	平均每周	次		平均每周		\N	ST	text						2016-11-30 11:38:19.789	2016-11-30 11:38:19.789
1565	grs_xys20	每次	ml		每次		\N	ST	text						2016-11-30 11:38:19.805	2016-11-30 11:38:19.805
1566	grs_xys21	目前是否进行体育活动			目前是否进行体育活动		\N	ST	radio	是,否	是,否				2016-11-30 11:38:19.823	2016-11-30 11:38:19.823
1567	grs_xys22	进行何种体育活动			进行何种体育活动		\N	ST	text						2016-11-30 11:38:19.837	2016-11-30 11:38:19.837
1568	grs_xys23	平均每周活动	小时		平均每周活动		\N	ST	text						2016-11-30 11:38:19.852	2016-11-30 11:38:19.852
1571	jzs_zdmc12	患病年龄	岁		患病年龄		\N	ST	text						2016-11-30 11:45:28.258	2016-11-30 11:45:28.258
1569	jzs_zdmc10	诊断名称			诊断名称		\N	ST	single-select	OSAHS,高血压,冠心病,糖尿病	OSAHS,高血压,冠心病,糖尿病				2016-11-30 11:45:28.157	2016-11-30 11:52:37.767
1570	jzs_zdmc11	患病家属			患病家属		\N	ST	single-select	父亲,母亲,姐妹,兄弟,子女	父亲,母亲,姐妹,兄弟,子女				2016-11-30 11:45:28.217	2016-11-30 11:52:37.839
1572	tgjc_sg101	身高	cm 		身高		\N	ST	text						2016-11-30 16:06:50.733	2016-11-30 16:06:50.733
1573	tgjc_sg102	体重	kg		体重		\N	ST	text						2016-11-30 16:06:50.83	2016-11-30 16:06:50.83
1574	tgjc_sg103	BMI	kg/m2		BMI		\N	ST	text						2016-11-30 16:06:50.921	2016-11-30 16:06:50.921
1575	tgjc_sg104	颈围	cm 		颈围		\N	ST	text						2016-11-30 16:06:50.953	2016-11-30 16:06:50.953
1576	tgjc_sg105	腰围	cm 		腰围		\N	ST	text						2016-11-30 16:06:50.983	2016-11-30 16:06:50.983
1577	tgjc_sg106	臀围	cm 		臀围		\N	ST	text						2016-11-30 16:06:51.015	2016-11-30 16:06:51.015
1578	tgjc_sg107	脉率	次/分		脉率		\N	ST	text						2016-11-30 16:06:51.055	2016-11-30 16:06:51.055
1579	tgjc_sg108	心率	次/分		心率		\N	ST	text						2016-11-30 16:06:51.108	2016-11-30 16:06:51.108
1580	tgjc_sg109	呼吸	次/分		呼吸		\N	ST	text						2016-11-30 16:06:51.141	2016-11-30 16:06:51.141
1581	tgjc_sg110	睡前血压(收缩压)	mmHg		睡前血压(收缩压)		\N	ST	text						2016-11-30 16:06:51.167	2016-11-30 16:06:51.167
1582	tgjc_sg111	睡前血压(舒张压)	mmHg		睡前血压(舒张压)		\N	ST	text						2016-11-30 16:06:51.193	2016-11-30 16:06:51.193
1583	tgjc_sg112	早晨血压(收缩压)	mmHg		早晨血压(收缩压)		\N	ST	text						2016-11-30 16:06:51.233	2016-11-30 16:06:51.233
1584	tgjc_sg113	早晨血压(舒张压)	mmHg		早晨血压(舒张压)		\N	ST	text						2016-11-30 16:06:51.301	2016-11-30 16:06:51.301
1585	tgjc_sg114	紫绀			紫绀		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.328	2016-11-30 16:06:51.328
1586	tgjc_sg115	苍白			苍白		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.353	2016-11-30 16:06:51.353
1587	tgjc_sg116	小颌			小颌		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.376	2016-11-30 16:06:51.376
1588	tgjc_sg117	下颌后缩			下颌后缩		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.402	2016-11-30 16:06:51.402
1589	tgjc_sg118	鼻中隔偏曲			鼻中隔偏曲		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.431	2016-11-30 16:06:51.431
1590	tgjc_sg119	鼻甲肥大			鼻甲肥大		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.457	2016-11-30 16:06:51.457
1591	tgjc_sg120	鼻息肉			鼻息肉		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.489	2016-11-30 16:06:51.489
1592	tgjc_sg121	悬雍垂过长			悬雍垂过长		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.515	2016-11-30 16:06:51.515
1593	tgjc_sg122	软腭松弛			软腭松弛		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.586	2016-11-30 16:06:51.586
1594	tgjc_sg123	咽腔狭窄			咽腔狭窄		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.612	2016-11-30 16:06:51.612
1595	tgjc_sg124	舌体肥大			舌体肥大		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.634	2016-11-30 16:06:51.634
1596	tgjc_sg125	舌根后坠			舌根后坠		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.664	2016-11-30 16:06:51.664
1597	tgjc_sg126	II度以上扁桃体肥大			II度以上扁桃体肥大		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.7	2016-11-30 16:06:51.7
1598	tgjc_sg127	甲状腺肿大			甲状腺肿大		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.727	2016-11-30 16:06:51.727
1599	tgjc_sg128	颈静脉情况			颈静脉情况		\N	ST	radio	否,充盈,怒张,搏动	否,充盈,怒张,搏动				2016-11-30 16:06:51.763	2016-11-30 16:06:51.763
1600	tgjc_sg129	肺部啰音：湿啰音			肺部啰音：湿啰音		\N	ST	radio	否 ,仅基底部 ,下2/3肺部 ,全肺部	否 ,仅基底部 ,下2/3肺部 ,全肺部				2016-11-30 16:06:51.791	2016-11-30 16:06:51.791
1601	tgjc_sg130	肺部啰音：干啰音			肺部啰音：干啰音		\N	ST	radio	否 ,仅基底部 ,下2/3肺部 ,全肺部	否 ,仅基底部 ,下2/3肺部 ,全肺部				2016-11-30 16:06:51.814	2016-11-30 16:06:51.814
1602	tgjc_sg131	胸腔积液			胸腔积液		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.843	2016-11-30 16:06:51.843
1603	tgjc_sg132	心脏增大			心脏增大		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.866	2016-11-30 16:06:51.866
1604	tgjc_sg133	心脏杂音			心脏杂音		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.894	2016-11-30 16:06:51.894
1605	tgjc_sg134	肝脏			肝脏		\N	ST	radio	否 ,肝肿大/淤血 ,腹水	否 ,肝肿大/淤血 ,腹水				2016-11-30 16:06:51.923	2016-11-30 16:06:51.923
1606	tgjc_sg135	肝颈静脉反流征			肝颈静脉反流征		\N	ST	radio	否,是	否,是				2016-11-30 16:06:51.948	2016-11-30 16:06:51.948
1607	tgjc_sg136	肢端凹陷性水肿			肢端凹陷性水肿		\N	ST	radio	否 ,轻度 ,仅足、踝部 ,双下肢 ,全身	否 ,轻度 ,仅足、踝部 ,双下肢 ,全身				2016-11-30 16:06:51.977	2016-11-30 16:06:51.977
1608	tgjc_sg137	神经病理反射			神经病理反射		\N	ST	radio	否,是	否,是				2016-11-30 16:06:52.003	2016-11-30 16:06:52.003
1609	tgjc_sg138	其他检查项目			其他检查项目		\N	ST	text						2016-11-30 16:06:52.033	2016-11-30 16:06:52.033
1610	tgjc_sg139	检查结果			检查结果		\N	ST	radio	否,是	否,是				2016-11-30 16:06:52.117	2016-11-30 16:06:52.117
1611	fzjc_sm101	检查项目			检查项目		\N	ST	checkbox	PM,PSG,SMSMSM	PM,PSG,SMSMSM				2016-11-30 16:07:50.357	2016-11-30 16:07:50.357
1612	fzjc_sm102	检查日期			检查日期		\N	DATE	text						2016-11-30 16:07:50.407	2016-11-30 16:07:50.407
1613	fzjc_sm103	总睡眠时间	min		总睡眠时间		\N	ST	text						2016-11-30 16:07:50.433	2016-11-30 16:07:50.433
1614	fzjc_sm104	睡眠潜伏期	min		睡眠潜伏期		\N	ST	text						2016-11-30 16:07:50.458	2016-11-30 16:07:50.458
1615	fzjc_sm105	睡眠效率	%		睡眠效率		\N	ST	text						2016-11-30 16:07:50.484	2016-11-30 16:07:50.484
1616	fzjc_sm106	觉醒总次数	次		觉醒总次数		\N	ST	text						2016-11-30 16:07:50.512	2016-11-30 16:07:50.512
1617	fzjc_sm107	微觉醒指数	次/h		微觉醒指数		\N	ST	text						2016-11-30 16:07:50.533	2016-11-30 16:07:50.533
1618	fzjc_sm108	AHI	次/h		AHI		\N	ST	text						2016-11-30 16:07:50.554	2016-11-30 16:07:50.554
1619	fzjc_sm109	ODI	次/h		ODI		\N	ST	text						2016-11-30 16:07:50.576	2016-11-30 16:07:50.576
1620	fzjc_sm110	LSaO2	%		LSaO2		\N	ST	text						2016-11-30 16:07:50.604	2016-11-30 16:07:50.604
1621	fzjc_sm111	MSaO2	%		MSaO2		\N	ST	text						2016-11-30 16:07:50.631	2016-11-30 16:07:50.631
1622	fzjc_sm112	T90%SaO2	%		T90%SaO2		\N	ST	text						2016-11-30 16:07:50.659	2016-11-30 16:07:50.659
1623	fzjc_sm113	值班医生			值班医生		\N	ST	text						2016-11-30 16:07:50.704	2016-11-30 16:07:50.704
1624	fzjc_sm114	报告医生			报告医生		\N	ST	text						2016-11-30 16:07:50.735	2016-11-30 16:07:50.735
1625	fzjc_sm115	多次睡眠潜伏期试验			多次睡眠潜伏期试验		\N	ST	radio	否,是	否,是				2016-11-30 16:07:50.757	2016-11-30 16:07:50.757
1626	fzjc_sm116	入睡的平均潜伏时间			入睡的平均潜伏时间		\N	ST	text						2016-11-30 16:07:50.784	2016-11-30 16:07:50.784
1627	fzjc_sm117	异常REM睡眠出现的次数			异常REM睡眠出现的次数		\N	ST	text						2016-11-30 16:07:50.807	2016-11-30 16:07:50.807
1628	yxxjc_190	1.胸部X光片			1.胸部X光片		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:43.471	2016-11-30 16:08:43.471
1629	yxxjc_191	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:43.535	2016-11-30 16:08:43.535
1630	yxxjc_192	肺淤血			肺淤血		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.572	2016-11-30 16:08:43.572
1631	yxxjc_193	肺间质水肿			肺间质水肿		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.599	2016-11-30 16:08:43.599
1632	yxxjc_194	胸腔积液			胸腔积液		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.629	2016-11-30 16:08:43.629
1633	yxxjc_195	肺炎			肺炎		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.658	2016-11-30 16:08:43.658
1634	yxxjc_196	肺动脉高压征			肺动脉高压征		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.688	2016-11-30 16:08:43.688
1635	yxxjc_197	心影增大			心影增大		\N	ST	radio	是,否	是,否				2016-11-30 16:08:43.735	2016-11-30 16:08:43.735
1636	yxxjc_198	心胸比			心胸比		\N	ST	text						2016-11-30 16:08:43.765	2016-11-30 16:08:43.765
1637	yxxjc_199	诊断			诊断		\N	ST	text						2016-11-30 16:08:43.817	2016-11-30 16:08:43.817
1638	yxxjc_200	胸部CT			胸部CT		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:43.847	2016-11-30 16:08:43.847
1639	yxxjc_201	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:43.871	2016-11-30 16:08:43.871
1640	yxxjc_202	诊断			诊断		\N	ST	text						2016-11-30 16:08:43.903	2016-11-30 16:08:43.903
1641	yxxjc_203	2.常规12导联心电图			2.常规12导联心电图		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:43.941	2016-11-30 16:08:43.941
1642	yxxjc_204	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:43.976	2016-11-30 16:08:43.976
1643	yxxjc_205	24小时动态心电图			24小时动态心电图		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:44.005	2016-11-30 16:08:44.005
1644	yxxjc_206	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:44.027	2016-11-30 16:08:44.027
1645	yxxjc_207	心率	次/分		心率		\N	ST	text						2016-11-30 16:08:44.055	2016-11-30 16:08:44.055
1646	yxxjc_208	PR间期	ms		PR间期		\N	ST	text						2016-11-30 16:08:44.079	2016-11-30 16:08:44.079
1647	yxxjc_209	QRS波宽度	ms		QRS波宽度		\N	ST	text						2016-11-30 16:08:44.108	2016-11-30 16:08:44.108
1648	yxxjc_210	QTc	ms		QTc		\N	ST	text						2016-11-30 16:08:44.135	2016-11-30 16:08:44.135
1649	yxxjc_211	心肌梗死			心肌梗死		\N	ST	radio	急性,陈旧性,否	急性,陈旧性,否				2016-11-30 16:08:44.159	2016-11-30 16:08:44.159
1650	yxxjc_212	左室高电压			左室高电压		\N	ST	radio	是,否	是,否				2016-11-30 16:08:44.189	2016-11-30 16:08:44.189
1711	yxxjc_273	夜间平均血压(舒张压)	mmHg		夜间平均血压(舒张压)		\N	ST	text						2016-11-30 16:08:46.004	2016-11-30 16:08:46.004
1651	yxxjc_213	心律失常			心律失常		\N	ST	radio	窦性心律,房扑/房颤,起搏器心律,逸搏房性,逸搏室性,逸搏交界性	窦性心律,房扑/房颤,起搏器心律,逸搏房性,逸搏室性,逸搏交界性				2016-11-30 16:08:44.214	2016-11-30 16:08:44.214
1652	yxxjc_214	室内传导阻滞			室内传导阻滞		\N	ST	radio	完左,不完左,完右,不完右,双束支,左前,左后,三分支	完左,不完左,完右,不完右,双束支,左前,左后,三分支				2016-11-30 16:08:44.247	2016-11-30 16:08:44.247
1653	yxxjc_215	诊断			诊断		\N	ST	text						2016-11-30 16:08:44.28	2016-11-30 16:08:44.28
1654	yxxjc_216	3.超声心动图			3.超声心动图		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:44.371	2016-11-30 16:08:44.371
1655	yxxjc_217	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:44.393	2016-11-30 16:08:44.393
1656	yxxjc_218	主动脉窦部	mm		主动脉窦部		\N	ST	text						2016-11-30 16:08:44.417	2016-11-30 16:08:44.417
1657	yxxjc_219	升主动脉	mm		升主动脉		\N	ST	text						2016-11-30 16:08:44.44	2016-11-30 16:08:44.44
1658	yxxjc_220	左心房	mm		左心房		\N	ST	text						2016-11-30 16:08:44.469	2016-11-30 16:08:44.469
1659	yxxjc_221	右心室	mm		右心室		\N	ST	text						2016-11-30 16:08:44.502	2016-11-30 16:08:44.502
1660	yxxjc_222	室间隔	mm		室间隔		\N	ST	text						2016-11-30 16:08:44.529	2016-11-30 16:08:44.529
1661	yxxjc_223	升主动脉	mm		升主动脉		\N	ST	text						2016-11-30 16:08:44.553	2016-11-30 16:08:44.553
1662	yxxjc_224	左心房	mm		左心房		\N	ST	text						2016-11-30 16:08:44.576	2016-11-30 16:08:44.576
1663	yxxjc_225	右心室	mm		右心室		\N	ST	text						2016-11-30 16:08:44.603	2016-11-30 16:08:44.603
1664	yxxjc_226	室间隔	mm		室间隔		\N	ST	text						2016-11-30 16:08:44.628	2016-11-30 16:08:44.628
1665	yxxjc_227	左心室（舒张末）	mm		左心室（舒张末）		\N	ST	text						2016-11-30 16:08:44.651	2016-11-30 16:08:44.651
1666	yxxjc_228	左心室（收缩末）	mm		左心室（收缩末）		\N	ST	text						2016-11-30 16:08:44.675	2016-11-30 16:08:44.675
1667	yxxjc_229	左心室后壁	mm		左心室后壁		\N	ST	text						2016-11-30 16:08:44.702	2016-11-30 16:08:44.702
1668	yxxjc_230	右心房(长)	mm		右心房(长)		\N	ST	text						2016-11-30 16:08:44.737	2016-11-30 16:08:44.737
1669	yxxjc_231	右心房(宽)	mm		右心房(宽)		\N	ST	text						2016-11-30 16:08:44.777	2016-11-30 16:08:44.777
1670	yxxjc_232	肺动脉	mm		肺动脉		\N	ST	text						2016-11-30 16:08:44.808	2016-11-30 16:08:44.808
1671	yxxjc_233	左室收缩功能（EF）	%		左室收缩功能（EF）		\N	ST	text						2016-11-30 16:08:44.834	2016-11-30 16:08:44.834
1672	yxxjc_234	PASP=	mmHg		PASP=		\N	ST	text						2016-11-30 16:08:44.861	2016-11-30 16:08:44.861
1673	yxxjc_235	室壁瘤			室壁瘤		\N	ST	radio	是,否	是,否				2016-11-30 16:08:44.891	2016-11-30 16:08:44.891
1674	yxxjc_236	二尖瓣			二尖瓣		\N	ST	radio	狭窄,关闭不全	狭窄,关闭不全				2016-11-30 16:08:44.918	2016-11-30 16:08:44.918
1675	yxxjc_237	程度			程度		\N	ST	radio	轻微,轻,轻中,中,中重,重	轻微,轻,轻中,中,中重,重				2016-11-30 16:08:44.943	2016-11-30 16:08:44.943
1676	yxxjc_238	主动脉瓣			主动脉瓣		\N	ST	radio	狭窄,关闭不全	狭窄,关闭不全				2016-11-30 16:08:44.965	2016-11-30 16:08:44.965
1677	yxxjc_239	程度			程度		\N	ST	radio	轻微,轻,轻中,中,中重,重	轻微,轻,轻中,中,中重,重				2016-11-30 16:08:44.985	2016-11-30 16:08:44.985
1678	yxxjc_240	三尖瓣			三尖瓣		\N	ST	radio	狭窄,关闭不全	狭窄,关闭不全				2016-11-30 16:08:45.017	2016-11-30 16:08:45.017
1679	yxxjc_241	程度			程度		\N	ST	radio	轻微,轻,轻中,中,中重,重	轻微,轻,轻中,中,中重,重				2016-11-30 16:08:45.051	2016-11-30 16:08:45.051
1680	yxxjc_242	肺动脉瓣			肺动脉瓣		\N	ST	radio	狭窄,关闭不全	狭窄,关闭不全				2016-11-30 16:08:45.084	2016-11-30 16:08:45.084
1681	yxxjc_243	程度			程度		\N	ST	radio	轻微,轻,轻中,中,中重,重	轻微,轻,轻中,中,中重,重				2016-11-30 16:08:45.129	2016-11-30 16:08:45.129
1682	yxxjc_244	舒张功能减低	级		舒张功能减低		\N	ST	text						2016-11-30 16:08:45.167	2016-11-30 16:08:45.167
1683	yxxjc_245	诊断			诊断		\N	ST	text						2016-11-30 16:08:45.192	2016-11-30 16:08:45.192
1684	yxxjc_246	4.呼出气一氧化氮测定（FeNO）	ppb 		4.呼出气一氧化氮测定（FeNO）		\N	ST	text						2016-11-30 16:08:45.215	2016-11-30 16:08:45.215
1685	yxxjc_247	一氧化氮测定:检查日期			一氧化氮测定:检查日期		\N	DATE	text						2016-11-30 16:08:45.239	2016-11-30 16:08:45.239
1686	yxxjc_248	诱导痰试验：检查日期			诱导痰试验：检查日期		\N	DATE	text						2016-11-30 16:08:45.264	2016-11-30 16:08:45.264
1687	yxxjc_249	上皮细胞	%		上皮细胞		\N	ST	text						2016-11-30 16:08:45.288	2016-11-30 16:08:45.288
1688	yxxjc_250	中性粒细胞	%		中性粒细胞		\N	ST	text						2016-11-30 16:08:45.312	2016-11-30 16:08:45.312
1689	yxxjc_251	嗜酸粒细胞	%		嗜酸粒细胞		\N	ST	text						2016-11-30 16:08:45.34	2016-11-30 16:08:45.34
1690	yxxjc_252	单核细胞	%		单核细胞		\N	ST	text						2016-11-30 16:08:45.375	2016-11-30 16:08:45.375
1691	yxxjc_253	肺通气功能、激发试验、舒张试验：检查日期			肺通气功能、激发试验、舒张试验：检查日期		\N	DATE	text						2016-11-30 16:08:45.402	2016-11-30 16:08:45.402
1692	yxxjc_254	诊断			诊断		\N	ST	radio	正常,大致正常,阻塞,限制,混合	正常,大致正常,阻塞,限制,混合				2016-11-30 16:08:45.427	2016-11-30 16:08:45.427
1693	yxxjc_255	程度			程度		\N	ST	radio	轻度,中,中重度,重,极重	轻度,中,中重度,重,极重				2016-11-30 16:08:45.458	2016-11-30 16:08:45.458
1694	yxxjc_256	激发			激发		\N	ST	radio	阳,阴	阳,阴				2016-11-30 16:08:45.489	2016-11-30 16:08:45.489
1695	yxxjc_257	舒张			舒张		\N	ST	radio	阳,阴	阳,阴				2016-11-30 16:08:45.519	2016-11-30 16:08:45.519
1696	yxxjc_258	FEV1	L		FEV1		\N	ST	text						2016-11-30 16:08:45.55	2016-11-30 16:08:45.55
1697	yxxjc_259	FVC	L		FVC		\N	ST	text						2016-11-30 16:08:45.575	2016-11-30 16:08:45.575
1698	yxxjc_260	FEV1/ FVC	%		FEV1/ FVC		\N	ST	text						2016-11-30 16:08:45.608	2016-11-30 16:08:45.608
1699	yxxjc_261	MVV	L/min		MVV		\N	ST	text						2016-11-30 16:08:45.64	2016-11-30 16:08:45.64
1700	yxxjc_262	MMEF	L		MMEF		\N	ST	text						2016-11-30 16:08:45.666	2016-11-30 16:08:45.666
1701	yxxjc_263	FEF50%	L		FEF50%		\N	ST	text						2016-11-30 16:08:45.691	2016-11-30 16:08:45.691
1702	yxxjc_264	FEF75%	L		FEF75%		\N	ST	text						2016-11-30 16:08:45.72	2016-11-30 16:08:45.72
1703	yxxjc_265	PEF	L/min		PEF		\N	ST	text						2016-11-30 16:08:45.753	2016-11-30 16:08:45.753
1704	yxxjc_266	5.动态血压			5.动态血压		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:45.777	2016-11-30 16:08:45.777
1705	yxxjc_267	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:45.806	2016-11-30 16:08:45.806
1706	yxxjc_268	24小时动态平均血压(收缩压)	mmHg		24小时动态平均血压(收缩压)		\N	ST	text						2016-11-30 16:08:45.84	2016-11-30 16:08:45.84
1707	yxxjc_269	24小时动态平均血压(舒张压)	mmHg		24小时动态平均血压(舒张压)		\N	ST	text						2016-11-30 16:08:45.871	2016-11-30 16:08:45.871
1708	yxxjc_270	白天平均血压(收缩压)	mmHg		白天平均血压(收缩压)		\N	ST	text						2016-11-30 16:08:45.903	2016-11-30 16:08:45.903
1709	yxxjc_271	白天平均血压(收舒张压)	mmHg		白天平均血压(收舒张压)		\N	ST	text						2016-11-30 16:08:45.935	2016-11-30 16:08:45.935
1710	yxxjc_272	夜间平均血压(收缩压)	mmHg		夜间平均血压(收缩压)		\N	ST	text						2016-11-30 16:08:45.969	2016-11-30 16:08:45.969
1788	xcg_107	检查时间			检查时间		\N	DATE	text						2016-11-30 16:12:34.368	2016-11-30 16:12:34.368
1712	yxxjc_274	6、泌尿系超声			6、泌尿系超声		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.08	2016-11-30 16:08:46.08
1713	yxxjc_275	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.105	2016-11-30 16:08:46.105
1714	yxxjc_276	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.137	2016-11-30 16:08:46.137
1715	yxxjc_277	7、肝胆脾胰超声			7、肝胆脾胰超声		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.167	2016-11-30 16:08:46.167
1716	yxxjc_278	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.195	2016-11-30 16:08:46.195
1717	yxxjc_279	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.227	2016-11-30 16:08:46.227
1718	yxxjc_280	8、甲状腺超声			8、甲状腺超声		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.258	2016-11-30 16:08:46.258
1719	yxxjc_281	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.285	2016-11-30 16:08:46.285
1720	yxxjc_282	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.337	2016-11-30 16:08:46.337
1721	yxxjc_283	9、红外热成像			9、红外热成像		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.384	2016-11-30 16:08:46.384
1722	yxxjc_284	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.427	2016-11-30 16:08:46.427
1723	yxxjc_285	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.47	2016-11-30 16:08:46.47
1724	yxxjc_286	10、OCT/右心导管			10、OCT/右心导管		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.522	2016-11-30 16:08:46.522
1725	yxxjc_287	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.543	2016-11-30 16:08:46.543
1726	yxxjc_288	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.567	2016-11-30 16:08:46.567
1727	yxxjc_289	11、冠脉造影/CT			11、冠脉造影/CT		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.592	2016-11-30 16:08:46.592
1728	yxxjc_290	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.618	2016-11-30 16:08:46.618
1729	yxxjc_291	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.643	2016-11-30 16:08:46.643
1730	yxxjc_292	12、脑电图			12、脑电图		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.67	2016-11-30 16:08:46.67
1731	yxxjc_293	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.697	2016-11-30 16:08:46.697
1732	yxxjc_294	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.78	2016-11-30 16:08:46.78
1733	yxxjc_295	13、头颅MRI			13、头颅MRI		\N	ST	radio	做,未做	做,未做				2016-11-30 16:08:46.805	2016-11-30 16:08:46.805
1734	yxxjc_296	检查日期			检查日期		\N	DATE	text						2016-11-30 16:08:46.828	2016-11-30 16:08:46.828
1735	yxxjc_297	诊断			诊断		\N	ST	text						2016-11-30 16:08:46.856	2016-11-30 16:08:46.856
1736	yxxjc_298	14、其它项目名称			14、其它项目名称		\N	ST	text						2016-11-30 16:08:46.885	2016-11-30 16:08:46.885
1737	yxxjc_299	其他检查时间			其他检查时间		\N	DATE	text						2016-11-30 16:08:46.946	2016-11-30 16:08:46.946
1738	yxxjc_300	其他诊断			其他诊断		\N	ST	text						2016-11-30 16:08:46.973	2016-11-30 16:08:46.973
1739	xcg_112	检查时间			检查时间		\N	ST	text						2016-11-30 16:10:35.611	2016-11-30 16:10:35.611
1740	xcg_113	ALT	U/L		ALT		\N	ST	text						2016-11-30 16:10:35.66	2016-11-30 16:10:35.66
1741	xcg_114	AST	U/L		AST		\N	ST	text						2016-11-30 16:10:35.681	2016-11-30 16:10:35.681
1742	xcg_115	ALB			ALB		\N	ST	text						2016-11-30 16:10:35.705	2016-11-30 16:10:35.705
1743	xcg_116	TBIL	umol/L		TBIL		\N	ST	text						2016-11-30 16:10:35.736	2016-11-30 16:10:35.736
1744	xcg_117	CREA	umol/L		CREA		\N	ST	text						2016-11-30 16:10:35.757	2016-11-30 16:10:35.757
1745	xcg_118	UA	umol/L		UA		\N	ST	text						2016-11-30 16:10:35.778	2016-11-30 16:10:35.778
1746	xcg_119	2h-GLU	umol/L		2h-GLU		\N	ST	text						2016-11-30 16:10:35.801	2016-11-30 16:10:35.801
1747	xcg_120	PCT	ng/ml		PCT		\N	ST	text						2016-11-30 16:10:35.823	2016-11-30 16:10:35.823
1748	xcg_121	ESR	mm/h		ESR		\N	ST	text						2016-11-30 16:10:35.848	2016-11-30 16:10:35.848
1749	xcg_122	TlgE	KU/U		TlgE		\N	ST	text						2016-11-30 16:10:35.876	2016-11-30 16:10:35.876
1750	xcg_123	K	mmol/L		K		\N	ST	text						2016-11-30 16:10:35.899	2016-11-30 16:10:35.899
1751	xcg_124	Na	mmol/L		Na		\N	ST	text						2016-11-30 16:10:35.922	2016-11-30 16:10:35.922
1752	xcg_125	F-GLU	mmol/L		F-GLU		\N	ST	text						2016-11-30 16:10:35.943	2016-11-30 16:10:35.943
1753	xcg_126	CL	mmol/L		CL		\N	ST	text						2016-11-30 16:10:35.961	2016-11-30 16:10:35.961
1754	xcg_127	BUN	mmol/L		BUN		\N	ST	text						2016-11-30 16:10:35.979	2016-11-30 16:10:35.979
1755	xcg_128	Ca	mmol/L		Ca		\N	ST	text						2016-11-30 16:10:36.001	2016-11-30 16:10:36.001
1756	xcg_129	HBA1c	%		HBA1c		\N	ST	text						2016-11-30 16:10:36.028	2016-11-30 16:10:36.028
1757	xcg_130	CRP	mg/dl		CRP		\N	ST	text						2016-11-30 16:10:36.05	2016-11-30 16:10:36.05
1758	xcg_131	血乳酸	mmol/L		血乳酸		\N	ST	text						2016-11-30 16:10:36.073	2016-11-30 16:10:36.073
1759	xcg_132	生化其他检查项目			生化其他检查项目		\N	ST	text						2016-11-30 16:10:36.09	2016-11-30 16:10:36.09
1760	xcg_133	检查单位			检查单位		\N	ST	text						2016-11-30 16:10:36.147	2016-11-30 16:10:36.147
1761	xcg_134	检查结果			检查结果		\N	ST	text						2016-11-30 16:10:36.171	2016-11-30 16:10:36.171
1762	xcg_140	检查时间			检查时间		\N	DATE	text						2016-11-30 16:11:16.271	2016-11-30 16:11:16.271
1763	xcg_141	CK-MB	U/L		CK-MB		\N	ST	text						2016-11-30 16:11:16.343	2016-11-30 16:11:16.343
1764	xcg_142	LDH	U/L		LDH		\N	ST	text						2016-11-30 16:11:16.362	2016-11-30 16:11:16.362
1765	xcg_143	cTnI	pg/mL		cTnI		\N	ST	text						2016-11-30 16:11:16.381	2016-11-30 16:11:16.381
1766	xcg_144	ProBNP	pg/mL		ProBNP		\N	ST	text						2016-11-30 16:11:16.404	2016-11-30 16:11:16.404
1767	xcg_150	检查时间			检查时间		\N	DATE	text						2016-11-30 16:11:38.613	2016-11-30 16:11:38.613
1768	xcg_151	PT	s		PT		\N	ST	text						2016-11-30 16:11:38.737	2016-11-30 16:11:38.737
1769	xcg_152	INR			INR		\N	ST	text						2016-11-30 16:11:38.772	2016-11-30 16:11:38.772
1770	xcg_153	APTT	s		APTT		\N	ST	text						2016-11-30 16:11:38.802	2016-11-30 16:11:38.802
1771	xcg_154	TT	s		TT		\N	ST	text						2016-11-30 16:11:38.83	2016-11-30 16:11:38.83
1772	xcg_155	Fbg	g/L		Fbg		\N	ST	text						2016-11-30 16:11:38.857	2016-11-30 16:11:38.857
1773	xcg_156	D-二聚体	ng/mL		D-二聚体		\N	ST	text						2016-11-30 16:11:38.878	2016-11-30 16:11:38.878
1774	xcg_163	检查时间			检查时间		\N	DATE	text						2016-11-30 16:11:59.538	2016-11-30 16:11:59.538
1775	xcg_164	PRL	ug/L		PRL		\N	ST	text						2016-11-30 16:11:59.593	2016-11-30 16:11:59.593
1776	xcg_165	FSH	IU/L		FSH		\N	ST	text						2016-11-30 16:11:59.618	2016-11-30 16:11:59.618
1777	xcg_166	T	ug/L		T		\N	ST	text						2016-11-30 16:11:59.645	2016-11-30 16:11:59.645
1778	xcg_167	E2	ng/L		E2		\N	ST	text						2016-11-30 16:11:59.67	2016-11-30 16:11:59.67
1779	xcg_168	LH	IU/L		LH		\N	ST	text						2016-11-30 16:11:59.69	2016-11-30 16:11:59.69
1780	xcg_169	P	ug/L		P		\N	ST	text						2016-11-30 16:11:59.714	2016-11-30 16:11:59.714
1781	xcg_100	检查时间			检查时间		\N	DATE	text						2016-11-30 16:12:24.721	2016-11-30 16:12:24.721
1782	xcg_101	WBC	109/L		WBC		\N	ST	text						2016-11-30 16:12:24.787	2016-11-30 16:12:24.787
1783	xcg_102	RBC	109/L		RBC		\N	ST	text						2016-11-30 16:12:24.809	2016-11-30 16:12:24.809
1784	xcg_103	Hb	g/L		Hb		\N	ST	text						2016-11-30 16:12:24.831	2016-11-30 16:12:24.831
1785	xcg_104	N%	%		N%		\N	ST	text						2016-11-30 16:12:24.856	2016-11-30 16:12:24.856
1786	xcg_105	E%	%		E%		\N	ST	text						2016-11-30 16:12:24.888	2016-11-30 16:12:24.888
1787	xcg_106	PLT	109/L		PLT		\N	ST	text						2016-11-30 16:12:24.913	2016-11-30 16:12:24.913
1789	xcg_108	PH			PH		\N	ST	text						2016-11-30 16:12:34.466	2016-11-30 16:12:34.466
1790	xcg_109	PaO2	mmHg		PaO2		\N	ST	text						2016-11-30 16:12:34.495	2016-11-30 16:12:34.495
1791	xcg_110	PaCO2	mmHg		PaCO2		\N	ST	text						2016-11-30 16:12:34.517	2016-11-30 16:12:34.517
1792	xcg_111	HCO3-	mmol/L		HCO3-		\N	ST	text						2016-11-30 16:12:34.535	2016-11-30 16:12:34.535
1793	xcg_145	检查时间			检查时间		\N	DATE	text						2016-11-30 16:12:53.036	2016-11-30 16:12:53.036
1794	xcg_146	CHOL	mmol/L		CHOL		\N	ST	text						2016-11-30 16:12:53.093	2016-11-30 16:12:53.093
1795	xcg_147	TG	mmol/L		TG		\N	ST	text						2016-11-30 16:12:53.113	2016-11-30 16:12:53.113
1796	xcg_148	HDL-c	mmol/L		HDL-c		\N	ST	text						2016-11-30 16:12:53.135	2016-11-30 16:12:53.135
1797	xcg_149	LDL-c	mmol/L		LDL-c		\N	ST	text						2016-11-30 16:12:53.157	2016-11-30 16:12:53.157
1798	xcg_157	检查时间			检查时间		\N	DATE	text						2016-11-30 16:13:16.934	2016-11-30 16:13:16.934
1799	xcg_158	TSH	uIU/mL		TSH		\N	ST	text						2016-11-30 16:13:16.986	2016-11-30 16:13:16.986
1800	xcg_159	FT3	pmol/L		FT3		\N	ST	text						2016-11-30 16:13:17.006	2016-11-30 16:13:17.006
1801	xcg_160	FT4	pmol/L		FT4		\N	ST	text						2016-11-30 16:13:17.025	2016-11-30 16:13:17.025
1802	xcg_161	T3	nmol/L		T3		\N	ST	text						2016-11-30 16:13:17.042	2016-11-30 16:13:17.042
1803	xcg_162	T4	nmol/L		T4		\N	ST	text						2016-11-30 16:13:17.062	2016-11-30 16:13:17.062
1804	dhpg_101	你有打鼾吗			你有打鼾吗		\N	ST	radio	有,无	有,无				2016-11-30 16:13:49.395	2016-11-30 16:13:49.395
1805	dhpg_102	打    鼾			打    鼾		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-11-30 16:13:49.443	2016-11-30 16:13:49.443
1806	dhpg_103	时间			时间		\N	ST	radio	1= 小于5年,2= 5~10年,3=大于10年	1,2,3				2016-11-30 16:13:49.466	2016-11-30 16:13:49.466
1807	dhpg_104	程度			程度		\N	ST	radio	1= 同呼吸声,2=同说话声,3=大于说话声,4=隔壁可听见	1,2,3,4				2016-11-30 16:13:49.485	2016-11-30 16:13:49.485
1808	dhpg_105	呼吸暂停			呼吸暂停		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-11-30 16:13:49.502	2016-11-30 16:13:49.502
1809	dhpg_106	夜间憋醒			夜间憋醒		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-11-30 16:13:49.519	2016-11-30 16:13:49.519
1810	dhpg_107	总分			总分		\N	ST	text						2016-11-30 16:13:49.536	2016-11-30 16:13:49.536
1811	dhpg_108	坐着阅读时			坐着阅读时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.538	2016-11-30 16:14:17.538
1812	dhpg_109	看电视时			看电视时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.608	2016-11-30 16:14:17.608
1813	dhpg_110	在公共场所坐着不动时（剧场或开会）			在公共场所坐着不动时（剧场或开会）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.697	2016-11-30 16:14:17.697
1814	dhpg_111	坐着与人谈话时			坐着与人谈话时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.721	2016-11-30 16:14:17.721
1815	dhpg_112	饭后休息时（未饮酒）			饭后休息时（未饮酒）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.75	2016-11-30 16:14:17.75
1816	dhpg_113	下午静卧休息时			下午静卧休息时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.783	2016-11-30 16:14:17.783
1817	dhpg_114	长时间驾车或坐车（>1小时）			长时间驾车或坐车（>1小时）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.821	2016-11-30 16:14:17.821
1818	dhpg_115	开车等红绿灯时			开车等红绿灯时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-11-30 16:14:17.848	2016-11-30 16:14:17.848
1819	dhpg_116	总分			总分		\N	ST	text						2016-11-30 16:14:17.87	2016-11-30 16:14:17.87
1820	stop_101	1.打鼾(S):您的鼾声大吗（高于谈话声或隔着房间门就       \n能听到）\n			1.打鼾(S):您的鼾声大吗（高于谈话声或隔着房间门就       \n能听到）\n		\N	ST	radio	否,是	0,1				2016-11-30 16:14:33.964	2016-11-30 16:14:33.964
1821	stop_102	2.疲劳(T):您经常在白天感觉疲劳、乏力或困倦吗？			2.疲劳(T):您经常在白天感觉疲劳、乏力或困倦吗？		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.018	2016-11-30 16:14:34.018
1822	stop_103	3.观察（O）:曾经有旁人观察到您在睡眠中有呼吸停止的\n情况吗？\n			3.观察（O）:曾经有旁人观察到您在睡眠中有呼吸停止的\n情况吗？\n		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.046	2016-11-30 16:14:34.046
1823	stop_104	4.血压(P):您患有高血压或目前正在进行高血压治疗吗?			4.血压(P):您患有高血压或目前正在进行高血压治疗吗?		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.078	2016-11-30 16:14:34.078
1824	stop_105	5、BMI(B):BMI＞35kg/m2 ？			5、BMI(B):BMI＞35kg/m2 ？		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.109	2016-11-30 16:14:34.109
1825	stop_106	6、年龄(A):＞50岁?			6、年龄(A):＞50岁?		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.129	2016-11-30 16:14:34.129
1826	stop_107	7、颈围(N):＞40cm? 			7、颈围(N):＞40cm? 		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.154	2016-11-30 16:14:34.154
1827	stop_108	8、性别(G):男性?			8、性别(G):男性?		\N	ST	radio	否,是	0,1				2016-11-30 16:14:34.177	2016-11-30 16:14:34.177
1828	stop_109	总分			总分		\N	ST	text						2016-11-30 16:14:34.198	2016-11-30 16:14:34.198
1829	berlin_101	1、您打鼾吗?			1、您打鼾吗?		\N	ST	radio	是的(1),不是(0),不知道/拒绝同答(0)	1,0,0.0				2016-11-30 16:14:56.344	2016-11-30 16:14:56.344
1830	berlin_102	2、如果打鼾-您的鼾声			2、如果打鼾-您的鼾声		\N	ST	radio	比正常呼吸时较响(0),同说话时声响(0),比说话声响(0),非常响，相邻房间都能听到(1),不知道/拒绝回答(0)\n	0,0,0,1,0				2016-11-30 16:14:56.394	2016-11-30 16:14:56.394
1831	berlin_103	3、您经常打鼾吗?			3、您经常打鼾吗?		\N	ST	radio	几乎每天(1), 一周3-4次(1),一周1-2次(0),一个月1-2次(0),很少，几乎没有或不知道(0)\n	1,1,0,0,0				2016-11-30 16:14:56.419	2016-11-30 16:14:56.419
1832	berlin_104	4、您的鼾声影响其他人了吗?			4、您的鼾声影响其他人了吗?		\N	ST	radio	是的(1), 没有/不知道/拒绝回答(0)	1,0				2016-11-30 16:14:56.437	2016-11-30 16:14:56.437
1833	berlin_105	5、在您睡觉时，有人注意到您睡眠中有停止呼吸的现象吗?			5、在您睡觉时，有人注意到您睡眠中有停止呼吸的现象吗?		\N	ST	radio	几乎每天都有(2),一周3-4次(2),一周1-2次(0),一个月1-2次(0),几乎没有/不知道，拒绝回答(0)	2,2,0,0,0				2016-11-30 16:14:56.457	2016-11-30 16:14:56.457
1834	berlin_106	1-5得分			1-5得分		\N	ST	text						2016-11-30 16:14:56.475	2016-11-30 16:14:56.475
1835	berlin_107	6、您通常醒来后会常感觉疲乏吗?			6、您通常醒来后会常感觉疲乏吗?		\N	ST	radio	几乎每天都有(1),一周3-4次(1),一周1-2次(0),一个月1-2次(0),几乎没有/不知道，拒绝回答(0)	1,1,0,0,0				2016-11-30 16:14:56.494	2016-11-30 16:14:56.494
1918	zl_1013	使用总天数	天		使用总天数		\N	ST	text						2016-11-30 16:17:40.837	2016-11-30 16:17:40.837
1919	zl_1014	使用天数百分比	%		使用天数百分比		\N	ST	text						2016-11-30 16:17:40.858	2016-11-30 16:17:40.858
1836	berlin_108	7、白天清醒状态下，您还会有疲劳、乏力等现象吗?			7、白天清醒状态下，您还会有疲劳、乏力等现象吗?		\N	ST	radio	几乎每天都有(1),一周3-4次(1),一周1-2次(0),一个月1-2次(0),几乎没有/不知道，拒绝回答(0)	1,1,0,0,0				2016-11-30 16:14:56.515	2016-11-30 16:14:56.515
1837	berlin_109	8、开车时会有打盹或睡着的现象吗?			8、开车时会有打盹或睡着的现象吗?		\N	ST	radio	有(1),没有/不知道/拒绝回答(0)	1,0				2016-11-30 16:14:56.532	2016-11-30 16:14:56.532
1838	berlin_110	9、如果有，发生的次数是多少?			9、如果有，发生的次数是多少?		\N	ST	radio	几乎每天都有(1),一周3-4次(1),一周1-2次(0),一个月1-2次(0),几乎没有/不知道，拒绝回答(0)	1,1,0,0,0				2016-11-30 16:14:56.55	2016-11-30 16:14:56.55
1839	berlin_111	6-9得分			6-9得分		\N	ST	text						2016-11-30 16:14:56.569	2016-11-30 16:14:56.569
1840	berlin_112	10、您有高血压吗？			10、您有高血压吗？		\N	ST	radio	有(1),没有/不知道/拒绝回答(0)	1,0				2016-11-30 16:14:56.589	2016-11-30 16:14:56.589
1841	berlin_113	11、您的身高？	cm		11、您的身高？		\N	ST	text						2016-11-30 16:14:56.609	2016-11-30 16:14:56.609
1842	berlin_114	12、你的体重？	kg		12、你的体重？		\N	ST	text						2016-11-30 16:14:56.633	2016-11-30 16:14:56.633
1843	berlin_115	13、你的年龄？	岁		13、你的年龄？		\N	ST	text						2016-11-30 16:14:56.652	2016-11-30 16:14:56.652
1844	berlin_116	14、你的性别？			14、你的性别？		\N	ST	radio	男,女	男,女				2016-11-30 16:14:56.67	2016-11-30 16:14:56.67
1845	berlin_117	15、使用以下公式计算身体指数			15、使用以下公式计算身体指数		\N	ST	radio						2016-11-30 16:14:56.688	2016-11-30 16:14:56.688
1846	berlin_118	您的BMI大于30kg/m2吗？			您的BMI大于30kg/m2吗？		\N	ST	radio						2016-11-30 16:14:56.708	2016-11-30 16:14:56.708
1847	berlin_119	10-15得分			10-15得分		\N	ST	text						2016-11-30 16:14:56.727	2016-11-30 16:14:56.727
1848	bypg_101	流鼻涕			流鼻涕		\N	ST	radio	0=无或者没有增加,1=出现或比原来增加	0,1				2016-11-30 16:15:15.986	2016-11-30 16:15:15.986
1849	bypg_102	鼻后滴流			鼻后滴流		\N	ST	radio	0=无或者没有增加,1=出现或比原来增加	0,1				2016-11-30 16:15:16.04	2016-11-30 16:15:16.04
1850	bypg_103	打喷嚏			打喷嚏		\N	ST	radio	0=无或者没有增加,1=出现或比原来增加	0,1				2016-11-30 16:15:16.058	2016-11-30 16:15:16.058
1851	bypg_104	嗅觉受损			嗅觉受损		\N	ST	radio	0=无或者没有增加,1=出现或比原来增加	0,1				2016-11-30 16:15:16.076	2016-11-30 16:15:16.076
1852	bypg_105	鼻塞			鼻塞		\N	ST	radio	0=无或者没有增加,1=出现或比原来增加	0,1				2016-11-30 16:15:16.093	2016-11-30 16:15:16.093
1853	bypg_106	总分			总分		\N	ST	text						2016-11-30 16:15:16.11	2016-11-30 16:15:16.11
1854	xcsm_101	1. 由于你的哮喘而觉得呼吸急促？			1. 由于你的哮喘而觉得呼吸急促？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.546	2016-11-30 16:15:33.546
1855	xcsm_102	2. 因为灰尘而感到烦恼或不得不避开这种环境？			2. 因为灰尘而感到烦恼或不得不避开这种环境？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.602	2016-11-30 16:15:33.602
1856	xcsm_103	3. 因为哮喘而觉得烦恼?			3. 因为哮喘而觉得烦恼?		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.625	2016-11-30 16:15:33.625
1857	xcsm_104	4,因为咳嗽而感到烦恼？			4,因为咳嗽而感到烦恼？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.655	2016-11-30 16:15:33.655
1858	xcsm_105	5. 因身边没有哮喘药物可用而感到害怕？			5. 因身边没有哮喘药物可用而感到害怕？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.681	2016-11-30 16:15:33.681
1859	xcsm_106	6. 出现胸部紧缩感或胸部沉闷感			6. 出现胸部紧缩感或胸部沉闷感		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.702	2016-11-30 16:15:33.702
1860	xcsm_107	7. 因为香烟雾而感到烦恼或不得不避开这种环境？			7. 因为香烟雾而感到烦恼或不得不避开这种环境？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.72	2016-11-30 16:15:33.72
1861	xcsm_108	8. 因为你的哮喘而晚上无法睡好觉？			8. 因为你的哮喘而晚上无法睡好觉？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.738	2016-11-30 16:15:33.738
1862	xcsm_109	9. 因为患哮喘而感到担忧？			9. 因为患哮喘而感到担忧？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.757	2016-11-30 16:15:33.757
1863	xcsm_110	10. 胸部出现喘鸣音？			10. 胸部出现喘鸣音？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.778	2016-11-30 16:15:33.778
1864	xcsm_111	11. 因为天气或空气污染而感到烦恼或不得不避免外出？			11. 因为天气或空气污染而感到烦恼或不得不避免外出？		\N	ST	radio	所有时间 ,绝大部分时间 ,经常 ,有些时候,很少时间,几乎没有,没有	1,2,3,4,5,6,7				2016-11-30 16:15:33.802	2016-11-30 16:15:33.802
1865	xcsm_112	12. 强体力活动（如仓促之时、锻练、跑步上楼梯、体育运动）			12. 强体力活动（如仓促之时、锻练、跑步上楼梯、体育运动）		\N	ST	radio	完全受限制,严重受限制,很受限制,中等受限制,有些受限制,很少受限制,完全不受限制	1,2,3,4,5,6,7				2016-11-30 16:15:33.852	2016-11-30 16:15:33.852
1866	xcsm_113	13. 中等体力活动（如走路、干家务、做园艺活、购物、爬楼梯）			13. 中等体力活动（如走路、干家务、做园艺活、购物、爬楼梯）		\N	ST	radio	完全受限制,严重受限制,很受限制,中等受限制,有些受限制,很少受限制,完全不受限制	1,2,3,4,5,6,7				2016-11-30 16:15:33.89	2016-11-30 16:15:33.89
1867	xcsm_114	14. 社交活动（如谈话、与宠物或孩子玩耍、拜访朋友或亲戚）			14. 社交活动（如谈话、与宠物或孩子玩耍、拜访朋友或亲戚）		\N	ST	radio	完全受限制,严重受限制,很受限制,中等受限制,有些受限制,很少受限制,完全不受限制	1,2,3,4,5,6,7				2016-11-30 16:15:33.917	2016-11-30 16:15:33.917
1868	xcsm_115	15. 与工作有关的事务（在工作中你必须做的任务* ）			15. 与工作有关的事务（在工作中你必须做的任务* ）		\N	ST	radio	完全受限制,严重受限制,很受限制,中等受限制,有些受限制,很少受限制,完全不受限制	1,2,3,4,5,6,7				2016-11-30 16:15:33.936	2016-11-30 16:15:33.936
1869	xcsm_116	总分			总分		\N	ST	text						2016-11-30 16:15:33.953	2016-11-30 16:15:33.953
1870	xcsm_117	1. 在过去的4周内，在工作中、学习或家中，有多少时间哮喘妨碍您进行日常活动？			1. 在过去的4周内，在工作中、学习或家中，有多少时间哮喘妨碍您进行日常活动？		\N	ST	radio	1.所有时间,2.绝大部分时间,3.有些时候,.很少时候,5.没有	1,2,3,4,5				2016-11-30 16:15:33.973	2016-11-30 16:15:33.973
1871	xcsm_118	2. 在过去四周内，您有多少次呼吸困难？			2. 在过去四周内，您有多少次呼吸困难？		\N	ST	radio	1.每天不止一次,2.一天一次,3.每周三到六次,4.每周一至两次,5.完全没有	1,2,3,4,5				2016-11-30 16:15:33.99	2016-11-30 16:15:33.99
1872	xcsm_119	3. 总在过去的4周内，因为哮喘症状（喘息、咳嗽、呼吸困难、胸闷或疼痛），您有多少次在夜间醒来或早上比平时早醒？			3. 总在过去的4周内，因为哮喘症状（喘息、咳嗽、呼吸困难、胸闷或疼痛），您有多少次在夜间醒来或早上比平时早醒？		\N	ST	radio	1.每周4晚或更多,2.每周两至三晚,3.每周一至两次,4.每周一次,5. 没有	1,2,3,4,5				2016-11-30 16:15:34.014	2016-11-30 16:15:34.014
1873	xcsm_120	4. 在过去的4周内，您有多少次使用急救药物治疗（如沙丁胺醇）？			4. 在过去的4周内，您有多少次使用急救药物治疗（如沙丁胺醇）？		\N	ST	radio	1.每天3次以上,2.每天一至两次,.每周两至三次,4.每周一次或以下,5.没有	1,2,3,4,5				2016-11-30 16:15:34.041	2016-11-30 16:15:34.041
1874	xcsm_121	5. 您如何评估过去4周内您的哮喘控制情况？			5. 您如何评估过去4周内您的哮喘控制情况？		\N	ST	radio	1.没有控制,2.控制很差,3.有所控制,4.受控良好,5完全控制	1,2,3,4,5				2016-11-30 16:15:34.064	2016-11-30 16:15:34.064
1875	xcsm_122	总分			总分		\N	ST	text						2016-11-30 16:15:34.082	2016-11-30 16:15:34.082
1876	xcsm_123	（1）改良版英国医学研究委员会呼吸问卷（mMRC）			（1）改良版英国医学研究委员会呼吸问卷（mMRC）		\N	ST	radio	只有在剧烈活动时感到呼吸困难,在平地快步行走或步行爬小坡时出现气短,由于气短，平地行走时比同龄人慢或者需要停下来休息,在平地行走100米或数分钟后需停下来喘气,因为严重呼吸困难而不能离开家，或者在穿脱衣服时呼吸困难	0,1,2,3,4				2016-11-30 16:15:54.217	2016-11-30 16:15:54.217
1877	xcsm_124	咳嗽			咳嗽		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.268	2016-11-30 16:15:54.268
1878	xcsm_125	痰			痰		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.285	2016-11-30 16:15:54.285
1879	xcsm_126	胸闷			胸闷		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.31	2016-11-30 16:15:54.31
1880	xcsm_127	爬坡或上一层楼梯			爬坡或上一层楼梯		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.332	2016-11-30 16:15:54.332
1881	xcsm_128	家里能够做任何事			家里能够做任何事		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.351	2016-11-30 16:15:54.351
1882	xcsm_129	肺部疾病			肺部疾病		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:54.374	2016-11-30 16:15:54.374
1883	xcsm_130	睡眠非常好			睡眠非常好		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:55.212	2016-11-30 16:15:55.212
1884	xcsm_131	我精力旺盛			我精力旺盛		\N	ST	radio	0,1,2,3,4,5	0,1,2,3,4,5				2016-11-30 16:15:55.231	2016-11-30 16:15:55.231
1885	xcsm_132	慢阻肺自我评估测试（CAT）总分			慢阻肺自我评估测试（CAT）总分		\N	ST	text						2016-11-30 16:15:55.25	2016-11-30 16:15:55.25
1886	xcsm_133	美国麻醉医师问卷（ASA checklist）分级			美国麻醉医师问卷（ASA checklist）分级		\N	ST	radio	1体格健康，发育营养良好，各器官功能正常。,2、除外科疾病外，有轻度并存病，功能代偿健全。,3、并存病情严重，体力活动受限，但尚能应付日常活动。,4、并存病严重，丧失日常活动能力，经常面临生命威胁。,5、无论手术与否，生命难以维持24小时的濒死病人。,6、确认为脑死亡，其器官拟用于器官移植手术	1,2,3,4,5,6				2016-11-30 16:16:13.843	2016-11-30 16:16:13.843
1906	zl_1001	（1）病因治疗			（1）病因治疗		\N	ST	text						2016-11-30 16:17:40.568	2016-11-30 16:17:40.568
1907	zl_1002	（2）一般性治疗：疗程			（2）一般性治疗：疗程		\N	ST	text						2016-11-30 16:17:40.622	2016-11-30 16:17:40.622
1908	zl_1003	控制饮食和体重			控制饮食和体重		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.644	2016-11-30 16:17:40.644
1909	zl_1004	禁烟酒和避免镇静催眠药			禁烟酒和避免镇静催眠药		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.665	2016-11-30 16:17:40.665
1910	zl_1005	采取侧卧位睡眠			采取侧卧位睡眠		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.681	2016-11-30 16:17:40.681
1911	zl_1006	适当抬高床头			适当抬高床头		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.698	2016-11-30 16:17:40.698
1912	zl_1007	白天避免过度劳累			白天避免过度劳累		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.714	2016-11-30 16:17:40.714
1913	zl_1008	（3）口腔矫正器治疗			（3）口腔矫正器治疗		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.731	2016-11-30 16:17:40.731
1914	zl_1009	疗程			疗程		\N	ST	text						2016-11-30 16:17:40.756	2016-11-30 16:17:40.756
1915	zl_1010	（4）无创正压通气治疗			（4）无创正压通气治疗		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.775	2016-11-30 16:17:40.775
1916	zl_1011	疗程			疗程		\N	ST	text						2016-11-30 16:17:40.796	2016-11-30 16:17:40.796
1917	zl_1012	 使用机型			 使用机型		\N	ST	text						2016-11-30 16:17:40.816	2016-11-30 16:17:40.816
1920	zl_1015	≥4H天数百分比	%		≥4H天数百分比		\N	ST	text						2016-11-30 16:17:40.876	2016-11-30 16:17:40.876
1921	zl_1016	平均使用时间	h/天		平均使用时间		\N	ST	text						2016-11-30 16:17:40.893	2016-11-30 16:17:40.893
1922	zl_1017	90%时间平均设备压力	cmH2O		90%时间平均设备压力		\N	ST	text						2016-11-30 16:17:40.911	2016-11-30 16:17:40.911
1923	zl_1018	使用时AHI	次/h		使用时AHI		\N	ST	text						2016-11-30 16:17:40.929	2016-11-30 16:17:40.929
1924	zl_1019	（5）五官科手术治疗			（5）五官科手术治疗		\N	ST	radio	是,否	是,否				2016-11-30 16:17:40.955	2016-11-30 16:17:40.955
1925	zl_1020	手术日期			手术日期		\N	DATE	text						2016-11-30 16:17:40.975	2016-11-30 16:17:40.975
1926	zl_1021	鼻腔的解剖结构异常干预手术			鼻腔的解剖结构异常干预手术		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.001	2016-11-30 16:17:41.001
1927	zl_1022	扁桃体切除术			扁桃体切除术		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.029	2016-11-30 16:17:41.029
1928	zl_1023	正颌手术			正颌手术		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.905	2016-11-30 16:17:41.905
1929	zl_1024	悬雍垂腭咽成形术（UPPP）			悬雍垂腭咽成形术（UPPP）		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.924	2016-11-30 16:17:41.924
1930	zl_1025	射频消融术			射频消融术		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.942	2016-11-30 16:17:41.942
1931	zl_1026	其它手术			其它手术		\N	ST	text						2016-11-30 16:17:41.967	2016-11-30 16:17:41.967
1932	zl_1027	（6）减重手术			（6）减重手术		\N	ST	radio	是,否	是,否				2016-11-30 16:17:41.99	2016-11-30 16:17:41.99
1933	zl_1028	手术日期			手术日期		\N	ST	text						2016-11-30 16:17:42.013	2016-11-30 16:17:42.013
1934	zl_1029	（7）抗氧化治疗			（7）抗氧化治疗		\N	ST	radio	是,否	是,否				2016-11-30 16:17:42.04	2016-11-30 16:17:42.04
1935	zl_1030	药物			药物		\N	ST	text						2016-11-30 16:17:42.058	2016-11-30 16:17:42.058
1936	zl_1031	疗程			疗程		\N	ST	text						2016-11-30 16:17:42.081	2016-11-30 16:17:42.081
1937	zl_1032	（8）上气道肌肉锻炼			（8）上气道肌肉锻炼		\N	ST	radio	是,否	是,否				2016-11-30 16:17:42.105	2016-11-30 16:17:42.105
1938	zl_1033	具体措施			具体措施		\N	ST	text						2016-11-30 16:17:42.131	2016-11-30 16:17:42.131
1939	zl_1034	疗程			疗程		\N	ST	text						2016-11-30 16:17:42.157	2016-11-30 16:17:42.157
1940	zl_1035	（9）上气道神经刺激			（9）上气道神经刺激		\N	ST	radio	是,否	是,否				2016-11-30 16:17:42.185	2016-11-30 16:17:42.185
1941	zl_1036	具体措施			具体措施		\N	ST	text						2016-11-30 16:17:42.206	2016-11-30 16:17:42.206
1942	zl_1037	疗程			疗程		\N	ST	text						2016-11-30 16:17:42.228	2016-11-30 16:17:42.228
1943	zl_1038	（10）鼻呼气末正压装置			（10）鼻呼气末正压装置		\N	ST	radio	是,否	是,否				2016-11-30 16:17:42.249	2016-11-30 16:17:42.249
1944	zl_1039	疗程			疗程		\N	ST	text						2016-11-30 16:17:42.267	2016-11-30 16:17:42.267
1945	zl_1040	（11）口负压装置			（11）口负压装置		\N	ST	radio	是,否	是,否				2016-11-30 16:17:42.293	2016-11-30 16:17:42.293
1946	zl_1041	疗程			疗程		\N	ST	text						2016-11-30 16:17:42.314	2016-11-30 16:17:42.314
1947	zl_1042	其他治疗			其他治疗		\N	ST	text						2016-11-30 16:17:42.344	2016-11-30 16:17:42.344
1948	bbjl101	是否完成标本采集			是否完成标本采集		\N	ST	radio	是,否	是,否				2016-11-30 16:18:12.495	2016-11-30 16:18:12.495
1949	bbjl102	完成日期			完成日期		\N	DATE	text						2016-11-30 16:18:12.537	2016-11-30 16:18:12.537
1950	bbjl103	标本编号			标本编号		\N	ST	text						2016-11-30 16:18:12.556	2016-11-30 16:18:12.556
1951	bbjl104	本次血清标本总数	管		本次血清标本总数		\N	ST	text						2016-11-30 16:18:12.575	2016-11-30 16:18:12.575
1952	dcsjs_101	填表时间			填表时间		\N	DATE	text						2016-12-03 21:59:48.441	2016-12-03 21:59:48.441
1953	yjsmqk_101	你有打鼾吗			你有打鼾吗		\N	ST	radio	有,无	有,无				2016-12-03 21:59:48.568	2016-12-03 21:59:48.568
1954	yjsmqk_102	打    鼾			打    鼾		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-12-03 21:59:48.603	2016-12-03 21:59:48.603
1955	yjsmqk_103	时间			时间		\N	ST	radio	1= 小于5年,2= 5~10年,3=大于10年	1,2,3				2016-12-03 21:59:48.639	2016-12-03 21:59:48.639
1956	yjsmqk_104	程度			程度		\N	ST	radio	1= 同呼吸声,2=同说话声,3=大于说话声,4=隔壁可听见	1,2,3,4				2016-12-03 21:59:48.678	2016-12-03 21:59:48.678
1957	yjsmqk_105	呼吸暂停			呼吸暂停		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-12-03 21:59:48.705	2016-12-03 21:59:48.705
1958	yjsmqk_106	夜间憋醒			夜间憋醒		\N	ST	radio	0=无,1=1~2次/月,2=1~2次/周,3=3~4次/周,4=几乎每天	0,1,2,3,4				2016-12-03 21:59:48.745	2016-12-03 21:59:48.745
1959	yjsmqk_107	你在下列情况会打瞌睡吗？(ESS评分表)					\N	ST							2016-12-03 21:59:48.78	2016-12-03 21:59:48.78
1960	yjsmqk_108	坐着阅读时			坐着阅读时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:48.83	2016-12-03 21:59:48.83
1961	yjsmqk_109	看电视时			看电视时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:48.861	2016-12-03 21:59:48.861
1962	yjsmqk_110	在公共场所坐着不动时（剧场或开会）			在公共场所坐着不动时（剧场或开会）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:48.894	2016-12-03 21:59:48.894
1963	yjsmqk_111	坐着与人谈话时			坐着与人谈话时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:48.953	2016-12-03 21:59:48.953
1964	yjsmqk_112	饭后休息时（未饮酒）			饭后休息时（未饮酒）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:48.995	2016-12-03 21:59:48.995
1965	yjsmqk_113	下午静卧休息时			下午静卧休息时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:49.035	2016-12-03 21:59:49.035
1966	yjsmqk_114	长时间驾车或坐车（>1小时）			长时间驾车或坐车（>1小时）		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:49.097	2016-12-03 21:59:49.097
1967	yjsmqk_115	开车等红绿灯时			开车等红绿灯时		\N	ST	radio	0=无,1=很少（1-2次/周）,2=有时（3-4次/周）,3=经常（＞5次/周）	0,1,2,3				2016-12-03 21:59:49.144	2016-12-03 21:59:49.144
1968	yjsmqk_116	ESS总分			ESS总分		\N	ST	text						2016-12-03 21:59:49.201	2016-12-03 21:59:49.201
1969	shxg_101	吸烟史			吸烟史		\N	ST	radio	一直吸烟，未戒烟,从前吸烟,从不吸烟	一直吸烟，未戒烟,从前吸烟,从不吸烟				2016-12-03 21:59:49.262	2016-12-03 21:59:49.262
1970	shxg_102	吸烟年限	年		吸烟年限		\N	ST	text						2016-12-03 21:59:49.288	2016-12-03 21:59:49.288
1971	shxg_103	平均每日吸烟	支		平均每日吸烟		\N	ST	text						2016-12-03 21:59:49.328	2016-12-03 21:59:49.328
1972	shxg_104	已戒烟	年		已戒烟		\N	ST	text						2016-12-03 21:59:49.374	2016-12-03 21:59:49.374
1973	shxg_105	吸烟年限	年		吸烟年限		\N	ST	text						2016-12-03 21:59:49.413	2016-12-03 21:59:49.413
1974	shxg_106	每日吸烟	支		每日吸烟		\N	ST	text						2016-12-03 21:59:49.45	2016-12-03 21:59:49.45
1975	shxg_107	饮酒史			饮酒史		\N	ST	radio	经常饮酒,偶尔少量饮酒,从前饮酒已戒酒,从不饮酒	经常饮酒,偶尔少量饮酒,从前饮酒已戒酒,从不饮酒				2016-12-03 21:59:49.544	2016-12-03 21:59:49.544
1976	shxg_108	喝酒年限	年		喝酒年限		\N	ST	text						2016-12-03 21:59:49.633	2016-12-03 21:59:49.633
1977	shxg_109	种类	酒		种类		\N	ST	text						2016-12-03 21:59:49.664	2016-12-03 21:59:49.664
1978	shxg_110	平均每周	次		平均每周		\N	ST	text						2016-12-03 21:59:49.705	2016-12-03 21:59:49.705
1979	shxg_111	每次	ml		每次		\N	ST	text						2016-12-03 21:59:49.734	2016-12-03 21:59:49.734
1980	jbs_1010	疾病名称			疾病名称		\N	ST	checkbox	鼻炎,COPD,Asthma,反流性咳嗽,间质性肺炎,肺动脉高压,肺栓塞,高血压,冠心病,心力衰竭,心律失常,脑梗塞,脑出血,癫痫,精神异常,肥胖,血脂,2型糖尿病,甲减,多囊卵巢综合症,肢端肥大症,鼻咽喉疾病,其他	鼻炎,COPD,Asthma,反流性咳嗽,间质性肺炎,肺动脉高压,肺栓塞,高血压,冠心病,心力衰竭,心律失常,脑梗塞,脑出血,癫痫,精神异常,肥胖,血脂,2型糖尿病,甲减,多囊卵巢综合症,肢端肥大症,鼻咽喉疾病,其他				2016-12-03 21:59:49.772	2016-12-03 21:59:49.772
1981	jbs_1011	其它疾病名称			其它疾病名称		\N	ST	text						2016-12-03 21:59:49.801	2016-12-03 21:59:49.801
1982	jbs_1012	近1个月用药史			近1个月用药史		\N	ST	text						2016-12-03 21:59:49.835	2016-12-03 21:59:49.835
1983	tgjc_1210	身高	cm		身高		\N	ST	text						2016-12-03 21:59:49.862	2016-12-03 21:59:49.862
1984	tgjc_1211	体重	kg		体重		\N	ST	text						2016-12-03 21:59:49.886	2016-12-03 21:59:49.886
1985	tgjc_1212	BMI	kg/m2		BMI		\N	ST	text						2016-12-03 21:59:49.912	2016-12-03 21:59:49.912
1986	tgjc_1213	颈围	cm		颈围		\N	ST	text						2016-12-03 21:59:49.94	2016-12-03 21:59:49.94
1987	tgjc_1214	腰围	cm		腰围		\N	ST	text						2016-12-03 21:59:49.974	2016-12-03 21:59:49.974
1988	tgjc_1215	脉率	次/分		脉率		\N	ST	text						2016-12-03 21:59:50.01	2016-12-03 21:59:50.01
1989	tgjc_1216	心率	次/分		心率		\N	ST	text						2016-12-03 21:59:50.038	2016-12-03 21:59:50.038
1990	tgjc_1217	呼吸	次/分		呼吸		\N	ST	text						2016-12-03 21:59:50.072	2016-12-03 21:59:50.072
1991	tgjc_1218	睡前血压(高)	mmHg		睡前血压(高)		\N	ST	text						2016-12-03 21:59:50.095	2016-12-03 21:59:50.095
1992	tgjc_1219	睡前血压(低)	mmHg		睡前血压(低)		\N	ST	text						2016-12-03 21:59:50.123	2016-12-03 21:59:50.123
1993	tgjc_1220	早晨血压(高)	mmHg		早晨血压(高)		\N	ST	text						2016-12-03 21:59:50.151	2016-12-03 21:59:50.151
1994	tgjc_1221	早晨血压(低)	mmHg		早晨血压(低)		\N	ST	text						2016-12-03 21:59:50.181	2016-12-03 21:59:50.181
1995	tgjc_1222	紫绀			紫绀		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.228	2016-12-03 21:59:50.228
1996	tgjc_1223	苍白			苍白		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.264	2016-12-03 21:59:50.264
1997	tgjc_1224	小颌			小颌		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.291	2016-12-03 21:59:50.291
1998	tgjc_1225	下颌后缩			下颌后缩		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.32	2016-12-03 21:59:50.32
1999	tgjc_1226	鼻中隔偏曲			鼻中隔偏曲		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.352	2016-12-03 21:59:50.352
2000	tgjc_1227	鼻甲肥大			鼻甲肥大		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.383	2016-12-03 21:59:50.383
2001	tgjc_1228	鼻息肉			鼻息肉		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.421	2016-12-03 21:59:50.421
2002	tgjc_1229	悬雍垂过长			悬雍垂过长		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.462	2016-12-03 21:59:50.462
2003	tgjc_1230	软腭松弛			软腭松弛		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.534	2016-12-03 21:59:50.534
2004	tgjc_1231	咽腔狭窄			咽腔狭窄		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.597	2016-12-03 21:59:50.597
2005	tgjc_1232	舌体肥大			舌体肥大		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.629	2016-12-03 21:59:50.629
2006	tgjc_1233	舌根后坠			舌根后坠		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.651	2016-12-03 21:59:50.651
2007	tgjc_1234	II度以上扁桃体肥大			II度以上扁桃体肥大		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.681	2016-12-03 21:59:50.681
2008	tgjc_1235	甲状腺肿大			甲状腺肿大		\N	ST	radio	是,否	是,否				2016-12-03 21:59:50.703	2016-12-03 21:59:50.703
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('items_id_seq', 2008, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY menus (id, name_cn, name_en, menu_id, link, seq, icon_class, belong_to, created_at, updated_at, menu_type, hidden) FROM stdin;
1	控制台		0	/home/index	1	icon-dashboard	\N	2016-11-03 14:45:36.949	2016-11-03 14:45:36.949	1	\N
2	患者信息		0	#	2	icon-list	\N	2016-11-03 14:45:37.033	2016-11-03 14:45:37.033	1	\N
3	患者信息		2	/patients	1	\N	\N	2016-11-03 14:45:37.063	2016-11-03 14:45:37.063	1	\N
4	就诊信息		0	#	3	icon-edit	\N	2016-11-03 14:45:37.089	2016-11-03 14:45:37.089	1	\N
5	随访信息		0	#	4	icon-calendar	\N	2016-11-03 14:45:37.122	2016-11-03 14:45:37.122	1	\N
6	系统管理		0	#	5	icon-tag	\N	2016-11-03 14:45:37.152	2016-11-03 14:45:37.152	1	\N
7	今日录入就诊		4	/patient_visits/today_visits	1	\N	\N	2016-11-22 01:51:46.789	2016-11-22 01:51:46.789	1	\N
8	就诊列表		4	/patient_visits	2	\N	\N	2016-11-22 01:51:46.885	2016-11-22 01:51:46.885	1	\N
9	用户管理		6	#	2	\N	\N	2016-11-27 20:15:23.391	2016-11-27 20:15:23.391	1	\N
10	角色管理		9	#	1	\N	\N	2016-11-27 20:15:23.561	2016-11-27 20:15:23.561	1	\N
11	用户列表		9	#	2	\N	\N	2016-11-27 20:15:23.596	2016-11-27 20:15:23.596	1	\N
12	表单管理		6	/crf_infos	3	\N	\N	2016-11-27 20:15:23.617	2016-11-27 20:15:23.617	1	\N
13	字典库管理		6	#	4	\N	\N	2016-11-27 20:15:23.645	2016-11-27 20:15:23.645	1	\N
31	菜单管理		6	#	9	\N	\N	2016-11-27 23:43:05.818	2016-11-27 23:43:05.818	1	0
32	随访方案		5	/follow_programs	2	\N	\N	2016-12-01 20:02:01.433	2016-12-01 20:02:01.433	1	0
33	待随访列表		5	/follow_ups	1	\N	\N	2016-12-01 20:02:01.543	2016-12-01 20:02:01.543	1	0
18	辅助检查		0	#	5	icon-list	\N	2016-11-27 22:44:33.142	2016-11-27 22:44:33.142	2	0
19	病情评估		0	#	6	icon-list	\N	2016-11-27 22:44:33.176	2016-11-27 22:44:33.176	2	0
20	治疗		0	#	7	icon-list	\N	2016-11-27 22:44:33.211	2016-11-27 22:44:33.211	2	0
21	标本记录		0	#	8	icon-list	\N	2016-11-27 22:44:33.242	2016-11-27 22:44:33.242	2	0
22	基本情况		0	#	1	icon-list	\N	2016-11-27 22:44:33.301	2016-11-27 22:44:33.301	3	0
23	预后		0	#	2	icon-list	\N	2016-11-27 22:44:33.332	2016-11-27 22:44:33.332	3	0
24	合并症情况		0	#	3	icon-list	\N	2016-11-27 22:44:33.374	2016-11-27 22:44:33.374	3	0
25	诊断		0	#	4	icon-list	\N	2016-11-27 22:44:33.411	2016-11-27 22:44:33.411	3	0
26	体格检查		0	#	5	icon-list	\N	2016-11-27 22:44:33.432	2016-11-27 22:44:33.432	3	0
27	实验室及辅助检查		0	#	6	icon-list	\N	2016-11-27 22:44:33.456	2016-11-27 22:44:33.456	3	0
28	病情问卷评估		0	#	7	icon-list	\N	2016-11-27 22:44:33.482	2016-11-27 22:44:33.482	3	0
29	治疗情况		0	#	8	icon-list	\N	2016-11-27 22:44:33.502	2016-11-27 22:44:33.502	3	0
30	标本记录		0	#	9	icon-list	\N	2016-11-27 22:44:33.522	2016-11-27 22:44:33.522	3	0
14	主诉及现病史		0	#	1	icon-list	\N	2016-11-27 22:44:32.939	2016-11-27 22:44:32.939	2	0
15	并发症病史和其他病史及相关治疗		0	#	2	icon-list	\N	2016-11-27 22:44:33.025	2016-11-27 22:44:33.025	2	0
16	个人史		0	#	3	icon-list	\N	2016-11-27 22:44:33.057	2016-11-27 22:44:33.057	2	0
17	体格检查		0	#	4	icon-list	\N	2016-11-27 22:44:33.091	2016-11-27 22:44:33.091	2	0
\.


--
-- Data for Name: menus_crf_infos; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY menus_crf_infos (id, menu_id, crf_info_id, created_at, updated_at) FROM stdin;
27	14	142	2016-11-30 16:55:20.396	2016-11-30 16:55:20.396
28	15	148	2016-11-30 16:55:20.446	2016-11-30 16:55:20.446
29	16	150	2016-11-30 16:55:20.451	2016-11-30 16:55:20.451
30	17	165	2016-11-30 16:55:20.456	2016-11-30 16:55:20.456
31	18	166	2016-11-30 16:55:20.461	2016-11-30 16:55:20.461
32	18	167	2016-11-30 16:55:20.465	2016-11-30 16:55:20.465
33	18	168	2016-11-30 16:55:20.469	2016-11-30 16:55:20.469
34	18	169	2016-11-30 16:55:20.473	2016-11-30 16:55:20.473
35	18	170	2016-11-30 16:55:20.478	2016-11-30 16:55:20.478
36	18	171	2016-11-30 16:55:20.482	2016-11-30 16:55:20.482
37	18	172	2016-11-30 16:55:20.487	2016-11-30 16:55:20.487
38	18	173	2016-11-30 16:55:20.491	2016-11-30 16:55:20.491
39	18	174	2016-11-30 16:55:20.497	2016-11-30 16:55:20.497
40	18	175	2016-11-30 16:55:20.503	2016-11-30 16:55:20.503
41	19	176	2016-11-30 16:55:20.507	2016-11-30 16:55:20.507
42	19	177	2016-11-30 16:55:20.511	2016-11-30 16:55:20.511
43	19	178	2016-11-30 16:55:20.516	2016-11-30 16:55:20.516
44	19	179	2016-11-30 16:55:20.52	2016-11-30 16:55:20.52
45	19	180	2016-11-30 16:55:20.524	2016-11-30 16:55:20.524
46	19	181	2016-11-30 16:55:20.529	2016-11-30 16:55:20.529
47	19	182	2016-11-30 16:55:20.533	2016-11-30 16:55:20.533
48	19	183	2016-11-30 16:55:20.539	2016-11-30 16:55:20.539
49	20	185	2016-11-30 16:55:20.546	2016-11-30 16:55:20.546
50	21	186	2016-11-30 16:55:20.553	2016-11-30 16:55:20.553
\.


--
-- Name: menus_crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_crf_infos_id_seq', 50, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_id_seq', 33, true);


--
-- Data for Name: patient_visits; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patient_visits (id, patient_id, visiting_time, telephone, home_address, degree_of_education, occupation, responsible_doctor, person_filing, created_date, created_unit, marital_status, contact_name, contact_relationship, contact_address, contact_phone, visit_type, patient_source, admission_number, admission_date, discharge_date, outpatient_number, diagnostic_types, diagnostic_degree, diagnostic_anoxia, other_diseases, created_at, updated_at) FROM stdin;
4	18	\N	18101302123	北京丰台			\N	\N	\N							\N	病房	10000	\N	\N		鼾症	中度	轻度		2016-12-03 23:14:51.428	2016-12-03 23:56:52.95
5	19	\N	13101302123	北京昌平			\N	\N	2016-12-01	A单位	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-12-03 23:30:18.869	2016-12-04 00:02:41.03
\.


--
-- Name: patient_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patient_visits_id_seq', 5, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patients (id, file_number, id_number, name, gender, birthday, nation, native_place, created_at, updated_at, file_type) FROM stdin;
18	1000	130682198907211212	王磊	男	1989-01-31	1		2016-12-03 23:14:51.418	2016-12-03 23:28:05.478	2
19	1001	130682198907211211	王丽丽	女	1989-01-31	\N	\N	2016-12-03 23:30:18.861	2016-12-04 00:01:13.843	1
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patients_id_seq', 19, true);


--
-- Data for Name: public_libs; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY public_libs (id, table_name, item_name, item_text, item_value, pinyin, created_at, updated_at) FROM stdin;
1	patient_visits	degree_of_education	学龄前	学龄前	\N	2016-11-22 00:40:21.793	2016-11-22 00:40:21.793
2	patient_visits	degree_of_education	小学	小学	\N	2016-11-22 00:40:21.903	2016-11-22 00:40:21.903
3	patient_visits	degree_of_education	初中	初中	\N	2016-11-22 00:40:21.927	2016-11-22 00:40:21.927
4	patient_visits	degree_of_education	高中	高中	\N	2016-11-22 00:40:21.949	2016-11-22 00:40:21.949
5	patient_visits	degree_of_education	中技	中技	\N	2016-11-22 00:40:21.976	2016-11-22 00:40:21.976
6	patient_visits	degree_of_education	中专	中专	\N	2016-11-22 00:40:21.994	2016-11-22 00:40:21.994
7	patient_visits	degree_of_education	大专	大专	\N	2016-11-22 00:40:22.033	2016-11-22 00:40:22.033
8	patient_visits	degree_of_education	本科	本科	\N	2016-11-22 00:40:22.059	2016-11-22 00:40:22.059
9	patient_visits	degree_of_education	博士	博士	\N	2016-11-22 00:40:22.126	2016-11-22 00:40:22.126
10	patient_visits	degree_of_education	博士后	博士后	\N	2016-11-22 00:40:22.144	2016-11-22 00:40:22.144
11	patient_visits	degree_of_education	硕士	硕士	\N	2016-11-22 00:40:22.173	2016-11-22 00:40:22.173
12	patient_visits	degree_of_education	文盲	文盲	\N	2016-11-22 00:40:22.19	2016-11-22 00:40:22.19
13	patient_visits	degree_of_education	其他	其他	\N	2016-11-22 00:40:22.277	2016-11-22 00:40:22.277
14	patient_visits	occupation	国家公务员	国家公务员	\N	2016-11-22 00:40:22.327	2016-11-22 00:40:22.327
15	patient_visits	occupation	专业技术人员	专业技术人员	\N	2016-11-22 00:40:22.359	2016-11-22 00:40:22.359
16	patient_visits	occupation	职员	职员	\N	2016-11-22 00:40:22.373	2016-11-22 00:40:22.373
17	patient_visits	occupation	企业管理人员	企业管理人员	\N	2016-11-22 00:40:22.388	2016-11-22 00:40:22.388
18	patient_visits	occupation	工人	工人	\N	2016-11-22 00:40:22.414	2016-11-22 00:40:22.414
19	patient_visits	occupation	农民	农民	\N	2016-11-22 00:40:22.435	2016-11-22 00:40:22.435
20	patient_visits	occupation	学生	学生	\N	2016-11-22 00:40:22.464	2016-11-22 00:40:22.464
21	patient_visits	occupation	现役军人	现役军人	\N	2016-11-22 00:40:22.479	2016-11-22 00:40:22.479
22	patient_visits	occupation	自由职业者	自由职业者	\N	2016-11-22 00:40:22.51	2016-11-22 00:40:22.51
23	patient_visits	occupation	个体经营者	个体经营者	\N	2016-11-22 00:40:22.529	2016-11-22 00:40:22.529
24	patient_visits	occupation	无业人员	无业人员	\N	2016-11-22 00:40:22.545	2016-11-22 00:40:22.545
25	patient_visits	occupation	退（离）休人员	退（离）休人员	\N	2016-11-22 00:40:22.564	2016-11-22 00:40:22.564
26	patient_visits	occupation	其他	其他	\N	2016-11-22 00:40:22.585	2016-11-22 00:40:22.585
27	patient_visits	marital_status	未婚	未婚	\N	2016-11-22 00:40:22.609	2016-11-22 00:40:22.609
28	patient_visits	marital_status	已婚	已婚	\N	2016-11-22 00:40:22.636	2016-11-22 00:40:22.636
29	patient_visits	marital_status	丧偶	丧偶	\N	2016-11-22 00:40:22.668	2016-11-22 00:40:22.668
30	patient_visits	marital_status	离婚	离婚	\N	2016-11-22 00:40:22.684	2016-11-22 00:40:22.684
31	patient_visits	marital_status	其他	其他	\N	2016-11-22 00:40:22.706	2016-11-22 00:40:22.706
32	patient_visits	patient_source	急诊	急诊	\N	2016-11-22 01:14:32.902	2016-11-22 01:14:32.902
33	patient_visits	patient_source	门诊	门诊	\N	2016-11-22 01:14:32.983	2016-11-22 01:14:32.983
34	patient_visits	patient_source	病房	病房	\N	2016-11-22 01:14:33.012	2016-11-22 01:14:33.012
35	patient_visits	patient_source	其他医疗机构转入	其他医疗机构转入	\N	2016-11-22 01:14:33.036	2016-11-22 01:14:33.036
36	patient_visits	patient_source	其他	其他	\N	2016-11-22 01:14:33.058	2016-11-22 01:14:33.058
37	patient_visits	diagnosetic_types	正常	正常	\N	2016-11-22 01:14:33.079	2016-11-22 01:14:33.079
38	patient_visits	diagnosetic_types	鼾症	鼾症	\N	2016-11-22 01:14:33.106	2016-11-22 01:14:33.106
39	patient_visits	diagnosetic_types	阻塞	阻塞	\N	2016-11-22 01:14:33.128	2016-11-22 01:14:33.128
40	patient_visits	diagnosetic_types	中枢	中枢	\N	2016-11-22 01:14:33.159	2016-11-22 01:14:33.159
41	patient_visits	diagnosetic_types	混合	混合	\N	2016-11-22 01:14:33.178	2016-11-22 01:14:33.178
42	patient_visits	diagnosetic_degree	轻度	轻度	\N	2016-11-22 01:14:33.209	2016-11-22 01:14:33.209
43	patient_visits	diagnosetic_degree	中度	中度	\N	2016-11-22 01:14:33.242	2016-11-22 01:14:33.242
44	patient_visits	diagnosetic_degree	重度	重度	\N	2016-11-22 01:14:33.265	2016-11-22 01:14:33.265
45	patient_visits	diagnosetic_anoxia	正常	正常	\N	2016-11-22 01:14:33.284	2016-11-22 01:14:33.284
46	patient_visits	diagnosetic_anoxia	轻度	轻度	\N	2016-11-22 01:14:33.356	2016-11-22 01:14:33.356
47	patient_visits	diagnosetic_anoxia	中度	中度	\N	2016-11-22 01:14:33.381	2016-11-22 01:14:33.381
48	patient_visits	diagnosetic_anoxia	重度	重度	\N	2016-11-22 01:14:33.393	2016-11-22 01:14:33.393
\.


--
-- Name: public_libs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('public_libs_id_seq', 48, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY schema_migrations (version) FROM stdin;
20161013112926
20161030063455
20161030064152
20161030064755
20161031142214
20161031142753
20161101013534
20161101144857
20161103023102
20161113051542
20161117064434
20161121161642
20161127134636
20161127152910
20161203085051
20161203141313
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY sections (id, name, title, subtitle, seq, parent_id, crf_info_id, created_at, updated_at) FROM stdin;
209	1、呼吸相关	1、呼吸相关		\N	\N	148	2016-11-30 10:57:45.249	2016-11-30 10:57:45.249
210	2、心血管相关	2、心血管相关		\N	\N	148	2016-11-30 10:57:45.254	2016-11-30 10:57:45.254
211	3、脑血管相关	3、脑血管相关		\N	\N	148	2016-11-30 10:57:45.259	2016-11-30 10:57:45.259
212	4、代谢疾病相关	4、代谢疾病相关		\N	\N	148	2016-11-30 10:57:45.266	2016-11-30 10:57:45.266
213	5、性功能障碍	5、性功能障碍		\N	\N	148	2016-11-30 10:57:45.272	2016-11-30 10:57:45.272
214	6、交通事故原因是疲倦或嗜睡吗？	6、交通事故原因是疲倦或嗜睡吗？		\N	\N	148	2016-11-30 10:57:45.276	2016-11-30 10:57:45.276
215	7、手术史	7、手术史		\N	\N	148	2016-11-30 10:57:45.281	2016-11-30 10:57:45.281
216	8、其它病史	8、其它病史		\N	\N	148	2016-11-30 10:57:45.285	2016-11-30 10:57:45.285
218	个人史	个人史		\N	\N	150	2016-11-30 11:44:22.443	2016-11-30 11:44:22.443
232	家族史	家族史		\N	\N	164	2016-11-30 16:05:52.57	2016-11-30 16:05:52.57
233	体格检查	体格检查		\N	\N	165	2016-11-30 16:06:50.639	2016-11-30 16:06:50.639
234	辅助检查	辅助检查		\N	\N	166	2016-11-30 16:07:50.309	2016-11-30 16:07:50.309
167	主诉	主诉		\N	\N	142	2016-11-30 10:45:41.586	2016-11-30 10:45:41.586
168	现病史	现病史		\N	\N	142	2016-11-30 10:45:41.592	2016-11-30 10:45:41.592
235	影像学检查	影像学检查		\N	\N	167	2016-11-30 16:08:43.408	2016-11-30 16:08:43.408
236	生化组合	生化组合		\N	\N	168	2016-11-30 16:10:35.555	2016-11-30 16:10:35.555
237	心梗六项、BNP	心梗六项、BNP		\N	\N	169	2016-11-30 16:11:16.226	2016-11-30 16:11:16.226
238	凝血四项、D二聚体	凝血四项、D二聚体		\N	\N	170	2016-11-30 16:11:38.579	2016-11-30 16:11:38.579
239	性激素六项	性激素六项		\N	\N	171	2016-11-30 16:11:59.501	2016-11-30 16:11:59.501
240	血常规	血常规		\N	\N	172	2016-11-30 16:12:24.673	2016-11-30 16:12:24.673
241	血气分析	血气分析		\N	\N	173	2016-11-30 16:12:34.331	2016-11-30 16:12:34.331
242	血脂四项	血脂四项		\N	\N	174	2016-11-30 16:12:52.991	2016-11-30 16:12:52.991
243	游离甲功	游离甲功		\N	\N	175	2016-11-30 16:13:16.893	2016-11-30 16:13:16.893
244	打鼾评估	打鼾评估		\N	\N	176	2016-11-30 16:13:49.362	2016-11-30 16:13:49.362
245	Epworth嗜睡量表（ESS评分）	Epworth嗜睡量表（ESS评分）		\N	\N	177	2016-11-30 16:14:17.491	2016-11-30 16:14:17.491
246	STOP‐Bang问卷	STOP‐Bang问卷		\N	\N	178	2016-11-30 16:14:33.93	2016-11-30 16:14:33.93
247	Berlin睡眠质量评估问卷	Berlin睡眠质量评估问卷		\N	\N	179	2016-11-30 16:14:56.308	2016-11-30 16:14:56.308
248	鼻炎评估	鼻炎评估		\N	\N	180	2016-11-30 16:15:15.948	2016-11-30 16:15:15.948
249	哮喘生命质量调查问卷(MiniAQLQ)	哮喘生命质量调查问卷(MiniAQLQ)		\N	\N	181	2016-11-30 16:15:33.47	2016-11-30 16:15:33.47
250	哮喘控制测试（ACT）	哮喘控制测试（ACT）		\N	\N	181	2016-11-30 16:15:33.475	2016-11-30 16:15:33.475
251	COPD评分表	COPD评分表		\N	\N	182	2016-11-30 16:15:54.18	2016-11-30 16:15:54.18
252	美国麻醉医师问卷（ASA checklist）	美国麻醉医师问卷（ASA checklist）		\N	\N	183	2016-11-30 16:16:13.793	2016-11-30 16:16:13.793
254	治疗	治疗		\N	\N	185	2016-11-30 16:17:40.536	2016-11-30 16:17:40.536
255	标本记录	标本记录		\N	\N	186	2016-11-30 16:18:12.429	2016-11-30 16:18:12.429
256	调查时间	调查时间		\N	\N	187	2016-12-03 21:59:48.351	2016-12-03 21:59:48.351
257	夜间睡眠状况	夜间睡眠状况		\N	\N	187	2016-12-03 21:59:48.361	2016-12-03 21:59:48.361
258	生活习惯	生活习惯		\N	\N	187	2016-12-03 21:59:48.369	2016-12-03 21:59:48.369
259	疾病史	疾病史		\N	\N	187	2016-12-03 21:59:48.381	2016-12-03 21:59:48.381
260	体格检查	体格检查		\N	\N	187	2016-12-03 21:59:48.391	2016-12-03 21:59:48.391
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('sections_id_seq', 260, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY users (id, email, encrypted_password, username, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
2	972567915@qq.com	$2a$11$LbF2263U5itJhTbt3SDj2Ofo4nxN0u79mc2v9H21pRjeQRP1v9vUq	admin2	\N	\N	\N	2	2016-10-16 15:15:11.584	2016-10-16 14:59:58.768	::1	::1	2016-10-16 14:59:58.752	2016-10-16 15:15:11.628
3	976315586@qq.com	$2a$11$S6xbv8ujD6sEuLym2VMbLefCm3Ewp6A2Hfi/8zDfdasn4tfhqvYvG	admin3	\N	\N	\N	2	2016-10-16 22:38:50.16	2016-10-16 22:24:17.505	::1	::1	2016-10-16 22:24:17.444	2016-10-16 22:39:59.943
1	wylszz@sina.cn	$2a$11$B.CX1qPIHc/2ZKjcseNrl.ak6yAVK2GfCNlXmG/OmudhaXzFGMOqy	admin	\N	\N	\N	57	2016-12-03 16:27:55.826	2016-12-03 16:20:33.952	::1	::1	2016-10-14 08:58:27.544	2016-12-03 16:27:55.83
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: crf_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY crf_infos
    ADD CONSTRAINT crf_infos_pkey PRIMARY KEY (id);


--
-- Name: item_form_metaelements_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY item_form_metaelements
    ADD CONSTRAINT item_form_metaelements_pkey PRIMARY KEY (id);


--
-- Name: item_group_metaelements_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY item_group_metaelements
    ADD CONSTRAINT item_group_metaelements_pkey PRIMARY KEY (id);


--
-- Name: item_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY item_groups
    ADD CONSTRAINT item_groups_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: menus_crf_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY menus_crf_infos
    ADD CONSTRAINT menus_crf_infos_pkey PRIMARY KEY (id);


--
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: patient_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY patient_visits
    ADD CONSTRAINT patient_visits_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: public_libs_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY public_libs
    ADD CONSTRAINT public_libs_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: wangyunlei
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM wangyunlei;
GRANT ALL ON SCHEMA public TO wangyunlei;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

