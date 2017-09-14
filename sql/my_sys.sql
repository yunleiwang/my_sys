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
-- Name: item_value_orders; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE item_value_orders (
    id integer NOT NULL,
    patient_id integer,
    patient_visit_id integer,
    complete double precision,
    ordinal integer,
    user_id integer,
    history integer,
    status integer,
    crf_info_id integer,
    menus_crf_info_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE item_value_orders OWNER TO wangyunlei;

--
-- Name: item_value_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE item_value_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_value_orders_id_seq OWNER TO wangyunlei;

--
-- Name: item_value_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE item_value_orders_id_seq OWNED BY item_value_orders.id;


--
-- Name: item_values; Type: TABLE; Schema: public; Owner: wangyunlei; Tablespace: 
--

CREATE TABLE item_values (
    id integer NOT NULL,
    item_id integer,
    value text,
    patient_id integer,
    menus_crf_info_id integer,
    patient_visit_id integer,
    item_value_order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    item_group_id integer,
    item_group_ordinal integer
);


ALTER TABLE item_values OWNER TO wangyunlei;

--
-- Name: item_values_id_seq; Type: SEQUENCE; Schema: public; Owner: wangyunlei
--

CREATE SEQUENCE item_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_values_id_seq OWNER TO wangyunlei;

--
-- Name: item_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wangyunlei
--

ALTER SEQUENCE item_values_id_seq OWNED BY item_values.id;


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
    updated_at timestamp without time zone NOT NULL,
    seq integer
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
    file_type integer,
    birth_place character varying,
    first_admission_date date,
    family_name character varying,
    contact_phone character varying
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
-- Name: search_libs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE search_libs (
    id integer NOT NULL,
    field_name character varying(255),
    host_table character varying(255),
    correspond_field character varying(255),
    correspond_field_value character varying(255),
    note character varying(255),
    patient_info_name character varying(255),
    attached_field character varying(255),
    attached_value character varying(255),
    ha character varying(255),
    ha_value character varying(255),
    parent_table character varying(255),
    parent_field character varying(255),
    parent_release character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_lib_public boolean
);


ALTER TABLE search_libs OWNER TO postgres;

--
-- Name: search_libs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE search_libs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE search_libs_id_seq OWNER TO postgres;

--
-- Name: search_libs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE search_libs_id_seq OWNED BY search_libs.id;


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
-- Name: sys_exports; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sys_exports (
    id integer NOT NULL,
    field_zh_name character varying(255),
    field_en_name character varying(255),
    table_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    crf_table_id integer,
    item_id integer
);


ALTER TABLE sys_exports OWNER TO postgres;

--
-- Name: sys_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sys_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sys_exports_id_seq OWNER TO postgres;

--
-- Name: sys_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sys_exports_id_seq OWNED BY sys_exports.id;


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

ALTER TABLE ONLY item_value_orders ALTER COLUMN id SET DEFAULT nextval('item_value_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY item_values ALTER COLUMN id SET DEFAULT nextval('item_values_id_seq'::regclass);


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY search_libs ALTER COLUMN id SET DEFAULT nextval('search_libs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY sections ALTER COLUMN id SET DEFAULT nextval('sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sys_exports ALTER COLUMN id SET DEFAULT nextval('sys_exports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wangyunlei
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: crf_infos; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY crf_infos (id, name, description, seq, crf_type, follow, created_at, updated_at) FROM stdin;
11	病历	病历	\N	\N	\N	2017-01-15 16:28:27.96	2017-01-15 16:28:27.96
14	发育评估	发育评估	\N	\N	\N	2017-01-15 16:31:39.312	2017-01-15 16:31:39.312
20	脑电图检查	脑电图检查	\N	\N	\N	2017-01-15 16:43:12.633	2017-01-15 16:43:12.633
22	既往史	既往史	\N	\N	\N	2017-01-15 16:45:04.756	2017-01-15 16:45:04.756
23	入组筛选表	入组筛选表	\N	\N	\N	2017-01-15 16:45:29.95	2017-01-15 16:45:29.95
24	头颅MRI检查	头颅MRI检查	\N	\N	\N	2017-01-15 16:45:46.207	2017-01-15 16:45:46.207
25	遗传代谢病及基因检查	遗传代谢病及基因检查	\N	\N	\N	2017-01-15 16:46:27.902	2017-01-15 16:46:27.902
32	癫痫发作及诊治	癫痫发作及诊治	\N	\N	\N	2017-01-15 18:09:00.002	2017-01-15 18:09:00.002
\.


--
-- Name: crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('crf_infos_id_seq', 32, true);


--
-- Data for Name: item_form_metaelements; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_form_metaelements (id, no, parentno, item_id, crf_info_id, section_id, header, subheader, parent_id, ordinal, required, show_item, trigger, options_index, item_group_id, created_at, updated_at) FROM stdin;
293	\N	\N	184	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.076	2017-01-15 16:28:28.076
294	\N	\N	185	11	56			293	\N	t	t		2	\N	2017-01-15 16:28:28.101	2017-01-15 16:28:28.101
295	\N	\N	186	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.13	2017-01-15 16:28:28.13
296	\N	\N	187	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.187	2017-01-15 16:28:28.187
297	\N	\N	188	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.223	2017-01-15 16:28:28.223
298	\N	\N	189	11	56			297	\N	t	t		0	\N	2017-01-15 16:28:28.25	2017-01-15 16:28:28.25
299	\N	\N	190	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.269	2017-01-15 16:28:28.269
300	\N	\N	191	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.287	2017-01-15 16:28:28.287
301	\N	\N	192	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.307	2017-01-15 16:28:28.307
302	\N	\N	193	11	56			301	\N	t	t		1	\N	2017-01-15 16:28:28.331	2017-01-15 16:28:28.331
303	\N	\N	194	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.36	2017-01-15 16:28:28.36
304	\N	\N	195	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.384	2017-01-15 16:28:28.384
397	\N	\N	290	14	76			\N	\N	t	t		0	\N	2017-01-15 16:31:39.422	2017-01-15 16:31:39.422
398	\N	\N	291	14	76			\N	\N	t	t		0	\N	2017-01-15 16:31:39.442	2017-01-15 16:31:39.442
399	\N	\N	292	14	76			398	\N	t	t		7	\N	2017-01-15 16:31:39.477	2017-01-15 16:31:39.477
400	\N	\N	293	14	76			\N	\N	t	t		0	\N	2017-01-15 16:31:39.498	2017-01-15 16:31:39.498
401	\N	\N	294	14	76			400	\N	t	t		1	\N	2017-01-15 16:31:39.517	2017-01-15 16:31:39.517
402	\N	\N	295	14	76			400	\N	t	t		1	\N	2017-01-15 16:31:39.537	2017-01-15 16:31:39.537
876	\N	\N	489	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.072	2017-01-15 18:09:00.072
877	\N	\N	490	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.089	2017-01-15 18:09:00.089
878	\N	\N	491	32	184			877	\N	t	t		10	\N	2017-01-15 18:09:00.106	2017-01-15 18:09:00.106
879	\N	\N	492	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.118	2017-01-15 18:09:00.118
880	\N	\N	493	32	184			879	\N	t	t		13	\N	2017-01-15 18:09:00.132	2017-01-15 18:09:00.132
881	\N	\N	494	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.144	2017-01-15 18:09:00.144
882	\N	\N	495	32	184			881	\N	t	t		0	\N	2017-01-15 18:09:00.158	2017-01-15 18:09:00.158
883	\N	\N	496	32	184			881	\N	t	t		1	\N	2017-01-15 18:09:00.172	2017-01-15 18:09:00.172
884	\N	\N	497	32	184			883	\N	t	t		0	\N	2017-01-15 18:09:00.185	2017-01-15 18:09:00.185
885	\N	\N	498	32	184			883	\N	t	t		1	\N	2017-01-15 18:09:00.199	2017-01-15 18:09:00.199
575	\N	\N	485	20	114			\N	\N	t	t		0	\N	2017-01-15 16:43:12.796	2017-01-15 16:43:12.796
576	\N	\N	486	20	114			\N	\N	t	t		0	\N	2017-01-15 16:43:12.825	2017-01-15 16:43:12.825
577	\N	\N	487	20	114			576	\N	t	t		1	\N	2017-01-15 16:43:12.85	2017-01-15 16:43:12.85
578	\N	\N	488	20	114			576	\N	t	t		1	\N	2017-01-15 16:43:12.872	2017-01-15 16:43:12.872
886	\N	\N	499	32	184			883	\N	t	t		2	\N	2017-01-15 18:09:00.216	2017-01-15 18:09:00.216
887	\N	\N	500	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.229	2017-01-15 18:09:00.229
888	\N	\N	501	32	184			887	\N	t	t		9	\N	2017-01-15 18:09:00.245	2017-01-15 18:09:00.245
889	\N	\N	502	32	184			\N	\N	t	t		0	\N	2017-01-15 18:09:00.258	2017-01-15 18:09:00.258
890	\N	\N	503	32	185			\N	\N	t	t		0	\N	2017-01-15 18:09:00.271	2017-01-15 18:09:00.271
891	\N	\N	504	32	185			890	\N	t	t		0	\N	2017-01-15 18:09:00.285	2017-01-15 18:09:00.285
305	\N	\N	196	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.411	2017-01-15 16:28:28.411
306	\N	\N	197	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.434	2017-01-15 16:28:28.434
307	\N	\N	198	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.455	2017-01-15 16:28:28.455
308	\N	\N	199	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.474	2017-01-15 16:28:28.474
309	\N	\N	200	11	56			308	\N	t	t		3	\N	2017-01-15 16:28:28.493	2017-01-15 16:28:28.493
310	\N	\N	201	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.511	2017-01-15 16:28:28.511
311	\N	\N	202	11	56			310	\N	t	t		1	\N	2017-01-15 16:28:28.533	2017-01-15 16:28:28.533
312	\N	\N	203	11	56			\N	\N	t	t		0	\N	2017-01-15 16:28:28.556	2017-01-15 16:28:28.556
313	\N	\N	204	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:28.581	2017-01-15 16:28:28.581
314	\N	\N	205	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:28.619	2017-01-15 16:28:28.619
315	\N	\N	206	11	57			314	\N	t	t		0	\N	2017-01-15 16:28:28.655	2017-01-15 16:28:28.655
316	\N	\N	207	11	57			314	\N	t	t		1	\N	2017-01-15 16:28:28.685	2017-01-15 16:28:28.685
317	\N	\N	208	11	57			314	\N	t	t		2	\N	2017-01-15 16:28:28.712	2017-01-15 16:28:28.712
318	\N	\N	209	11	57			314	\N	t	t		3	\N	2017-01-15 16:28:28.739	2017-01-15 16:28:28.739
319	\N	\N	210	11	57			314	\N	t	t		4	\N	2017-01-15 16:28:28.819	2017-01-15 16:28:28.819
320	\N	\N	211	11	57			314	\N	t	t		5	\N	2017-01-15 16:28:28.849	2017-01-15 16:28:28.849
321	\N	\N	212	11	57			314	\N	t	t		6	\N	2017-01-15 16:28:28.878	2017-01-15 16:28:28.878
322	\N	\N	213	11	57			314	\N	t	t		7	\N	2017-01-15 16:28:28.901	2017-01-15 16:28:28.901
323	\N	\N	214	11	57			314	\N	t	t		8	\N	2017-01-15 16:28:28.924	2017-01-15 16:28:28.924
324	\N	\N	215	11	57			314	\N	t	t		9	\N	2017-01-15 16:28:28.948	2017-01-15 16:28:28.948
325	\N	\N	216	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:28.977	2017-01-15 16:28:28.977
326	\N	\N	217	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:29.005	2017-01-15 16:28:29.005
327	\N	\N	218	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:29.027	2017-01-15 16:28:29.027
328	\N	\N	219	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:29.049	2017-01-15 16:28:29.049
329	\N	\N	220	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:29.069	2017-01-15 16:28:29.069
330	\N	\N	221	11	57			\N	\N	t	t		0	\N	2017-01-15 16:28:29.087	2017-01-15 16:28:29.087
892	\N	\N	505	32	185			890	\N	t	t		1	\N	2017-01-15 18:09:00.299	2017-01-15 18:09:00.299
893	\N	\N	506	32	185			890	\N	t	t		2	\N	2017-01-15 18:09:00.315	2017-01-15 18:09:00.315
894	\N	\N	507	32	185			890	\N	t	t		3	\N	2017-01-15 18:09:00.329	2017-01-15 18:09:00.329
895	\N	\N	508	32	185			\N	\N	t	t		0	\N	2017-01-15 18:09:00.34	2017-01-15 18:09:00.34
896	\N	\N	509	32	185			895	\N	t	t		13	\N	2017-01-15 18:09:00.355	2017-01-15 18:09:00.355
897	\N	\N	510	32	185			\N	\N	t	t		0	\N	2017-01-15 18:09:00.366	2017-01-15 18:09:00.366
898	\N	\N	511	32	185			897	\N	t	t		0	\N	2017-01-15 18:09:00.379	2017-01-15 18:09:00.379
899	\N	\N	512	32	185			897	\N	t	t		1	\N	2017-01-15 18:09:00.395	2017-01-15 18:09:00.395
900	\N	\N	513	32	185			899	\N	t	t		0	\N	2017-01-15 18:09:00.417	2017-01-15 18:09:00.417
901	\N	\N	514	32	185			899	\N	t	t		1	\N	2017-01-15 18:09:00.439	2017-01-15 18:09:00.439
902	\N	\N	515	32	185			899	\N	t	t		2	\N	2017-01-15 18:09:00.457	2017-01-15 18:09:00.457
903	\N	\N	516	32	186			\N	\N	t	t		0	\N	2017-01-15 18:09:00.471	2017-01-15 18:09:00.471
904	\N	\N	517	32	186			\N	\N	t	t		0	\N	2017-01-15 18:09:00.483	2017-01-15 18:09:00.483
905	\N	\N	518	32	186			904	\N	t	t		0	\N	2017-01-15 18:09:00.497	2017-01-15 18:09:00.497
906	\N	\N	519	32	186			905	\N	t	t		23	\N	2017-01-15 18:09:00.514	2017-01-15 18:09:00.514
907	\N	\N	520	32	187			\N	\N	t	t		0	\N	2017-01-15 18:09:00.527	2017-01-15 18:09:00.527
908	\N	\N	\N	32	187			\N	\N	t	t		0	56	2017-01-15 18:09:00.545	2017-01-15 18:09:00.545
909	\N	\N	\N	32	188			\N	\N	t	t		0	57	2017-01-15 18:09:00.626	2017-01-15 18:09:00.626
910	\N	\N	527	32	189			\N	\N	t	t		0	\N	2017-01-15 18:09:00.683	2017-01-15 18:09:00.683
911	\N	\N	\N	32	189			\N	\N	t	t		0	58	2017-01-15 18:09:00.703	2017-01-15 18:09:00.703
912	\N	\N	531	32	189			\N	\N	t	t		0	\N	2017-01-15 18:09:00.752	2017-01-15 18:09:00.752
913	\N	\N	532	32	189			\N	\N	t	t		0	\N	2017-01-15 18:09:00.764	2017-01-15 18:09:00.764
914	\N	\N	624	32	189			913	\N	t	t		12	\N	2017-01-15 18:09:00.779	2017-01-15 18:09:00.779
915	\N	\N	533	32	190			\N	\N	t	t		0	\N	2017-01-15 18:09:00.792	2017-01-15 18:09:00.792
916	\N	\N	534	32	190			915	\N	t	t		0	\N	2017-01-15 18:09:00.806	2017-01-15 18:09:00.806
917	\N	\N	535	32	190			915	\N	t	t		1	\N	2017-01-15 18:09:00.822	2017-01-15 18:09:00.822
918	\N	\N	536	32	190			915	\N	t	t		2	\N	2017-01-15 18:09:00.837	2017-01-15 18:09:00.837
919	\N	\N	537	32	190			915	\N	t	t		3	\N	2017-01-15 18:09:00.851	2017-01-15 18:09:00.851
920	\N	\N	538	32	190			\N	\N	t	t		0	\N	2017-01-15 18:09:00.864	2017-01-15 18:09:00.864
921	\N	\N	539	32	190			920	\N	t	t		13	\N	2017-01-15 18:09:00.878	2017-01-15 18:09:00.878
922	\N	\N	540	32	190			\N	\N	t	t		0	\N	2017-01-15 18:09:00.889	2017-01-15 18:09:00.889
923	\N	\N	541	32	190			922	\N	t	t		0	\N	2017-01-15 18:09:00.906	2017-01-15 18:09:00.906
924	\N	\N	542	32	190			922	\N	t	t		1	\N	2017-01-15 18:09:00.92	2017-01-15 18:09:00.92
925	\N	\N	543	32	190			924	\N	t	t		0	\N	2017-01-15 18:09:00.935	2017-01-15 18:09:00.935
926	\N	\N	544	32	190			924	\N	t	t		1	\N	2017-01-15 18:09:00.949	2017-01-15 18:09:00.949
927	\N	\N	545	32	190			924	\N	t	t		2	\N	2017-01-15 18:09:00.962	2017-01-15 18:09:00.962
928	\N	\N	\N	32	191			\N	\N	t	t		0	59	2017-01-15 18:09:00.977	2017-01-15 18:09:00.977
929	\N	\N	\N	32	191			\N	\N	t	t		0	60	2017-01-15 18:09:01.034	2017-01-15 18:09:01.034
930	\N	\N	554	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.115	2017-01-15 18:09:01.115
931	\N	\N	555	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.127	2017-01-15 18:09:01.127
932	\N	\N	556	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.139	2017-01-15 18:09:01.139
933	\N	\N	557	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.151	2017-01-15 18:09:01.151
934	\N	\N	558	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.162	2017-01-15 18:09:01.162
935	\N	\N	559	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.175	2017-01-15 18:09:01.175
936	\N	\N	560	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.186	2017-01-15 18:09:01.186
937	\N	\N	561	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.198	2017-01-15 18:09:01.198
938	\N	\N	562	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.211	2017-01-15 18:09:01.211
939	\N	\N	563	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.227	2017-01-15 18:09:01.227
940	\N	\N	564	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.24	2017-01-15 18:09:01.24
941	\N	\N	565	32	192			940	\N	t	t		1	\N	2017-01-15 18:09:01.255	2017-01-15 18:09:01.255
942	\N	\N	566	32	192			\N	\N	t	t		0	\N	2017-01-15 18:09:01.266	2017-01-15 18:09:01.266
645	\N	\N	567	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:04.845	2017-01-15 16:45:04.845
646	\N	\N	568	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:04.862	2017-01-15 16:45:04.862
647	\N	\N	569	22	124			646	\N	t	t		1	\N	2017-01-15 16:45:04.882	2017-01-15 16:45:04.882
648	\N	\N	570	22	124			646	\N	t	t		1	\N	2017-01-15 16:45:04.9	2017-01-15 16:45:04.9
649	\N	\N	571	22	124			646	\N	t	t		1	\N	2017-01-15 16:45:04.918	2017-01-15 16:45:04.918
650	\N	\N	572	22	124			646	\N	t	t		1	\N	2017-01-15 16:45:04.943	2017-01-15 16:45:04.943
651	\N	\N	573	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:04.962	2017-01-15 16:45:04.962
652	\N	\N	574	22	124			651	\N	t	t		1	\N	2017-01-15 16:45:04.98	2017-01-15 16:45:04.98
653	\N	\N	575	22	124			651	\N	t	t		1	\N	2017-01-15 16:45:05.002	2017-01-15 16:45:05.002
654	\N	\N	576	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.021	2017-01-15 16:45:05.021
655	\N	\N	577	22	124			654	\N	t	t		1	\N	2017-01-15 16:45:05.041	2017-01-15 16:45:05.041
656	\N	\N	578	22	124			654	\N	t	t		1	\N	2017-01-15 16:45:05.059	2017-01-15 16:45:05.059
657	\N	\N	579	22	124			654	\N	t	t		1	\N	2017-01-15 16:45:05.077	2017-01-15 16:45:05.077
658	\N	\N	580	22	124			654	\N	t	t		1	\N	2017-01-15 16:45:05.094	2017-01-15 16:45:05.094
659	\N	\N	581	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.109	2017-01-15 16:45:05.109
660	\N	\N	582	22	124			659	\N	t	t		1	\N	2017-01-15 16:45:05.127	2017-01-15 16:45:05.127
661	\N	\N	583	22	124			659	\N	t	t		1	\N	2017-01-15 16:45:05.149	2017-01-15 16:45:05.149
662	\N	\N	584	22	124			659	\N	t	t		1	\N	2017-01-15 16:45:05.169	2017-01-15 16:45:05.169
663	\N	\N	585	22	124			659	\N	t	t		1	\N	2017-01-15 16:45:05.19	2017-01-15 16:45:05.19
664	\N	\N	586	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.207	2017-01-15 16:45:05.207
665	\N	\N	587	22	124			664	\N	t	t		1	\N	2017-01-15 16:45:05.227	2017-01-15 16:45:05.227
666	\N	\N	588	22	124			664	\N	t	t		1	\N	2017-01-15 16:45:05.246	2017-01-15 16:45:05.246
667	\N	\N	589	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.266	2017-01-15 16:45:05.266
668	\N	\N	590	22	124			667	\N	t	t		1	\N	2017-01-15 16:45:05.284	2017-01-15 16:45:05.284
669	\N	\N	591	22	124			667	\N	t	t		1	\N	2017-01-15 16:45:05.302	2017-01-15 16:45:05.302
670	\N	\N	592	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.319	2017-01-15 16:45:05.319
671	\N	\N	593	22	124			670	\N	t	t		1	\N	2017-01-15 16:45:05.336	2017-01-15 16:45:05.336
672	\N	\N	594	22	124			670	\N	t	t		1	\N	2017-01-15 16:45:05.359	2017-01-15 16:45:05.359
673	\N	\N	595	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.376	2017-01-15 16:45:05.376
674	\N	\N	596	22	124			673	\N	t	t		1	\N	2017-01-15 16:45:05.397	2017-01-15 16:45:05.397
675	\N	\N	597	22	124			673	\N	t	t		1	\N	2017-01-15 16:45:05.418	2017-01-15 16:45:05.418
676	\N	\N	598	22	124			\N	\N	t	t		0	\N	2017-01-15 16:45:05.437	2017-01-15 16:45:05.437
677	\N	\N	599	23	125			\N	\N	t	t		0	\N	2017-01-15 16:45:30.06	2017-01-15 16:45:30.06
678	\N	\N	600	23	125			\N	\N	t	t		0	\N	2017-01-15 16:45:30.078	2017-01-15 16:45:30.078
679	\N	\N	601	23	125			\N	\N	t	t		0	\N	2017-01-15 16:45:30.095	2017-01-15 16:45:30.095
680	\N	\N	602	23	125			\N	\N	t	t		0	\N	2017-01-15 16:45:30.112	2017-01-15 16:45:30.112
681	\N	\N	603	23	126			\N	\N	t	t		0	\N	2017-01-15 16:45:30.142	2017-01-15 16:45:30.142
682	\N	\N	604	23	126			\N	\N	t	t		0	\N	2017-01-15 16:45:30.163	2017-01-15 16:45:30.163
683	\N	\N	605	23	126			\N	\N	t	t		0	\N	2017-01-15 16:45:30.186	2017-01-15 16:45:30.186
684	\N	\N	606	23	126			\N	\N	t	t		0	\N	2017-01-15 16:45:30.206	2017-01-15 16:45:30.206
685	\N	\N	607	23	127			\N	\N	t	t		0	\N	2017-01-15 16:45:30.226	2017-01-15 16:45:30.226
686	\N	\N	608	24	128			\N	\N	t	t		0	\N	2017-01-15 16:45:46.304	2017-01-15 16:45:46.304
687	\N	\N	609	24	128			\N	\N	t	t		0	\N	2017-01-15 16:45:46.32	2017-01-15 16:45:46.32
688	\N	\N	610	24	128			687	\N	t	t		1	\N	2017-01-15 16:45:46.338	2017-01-15 16:45:46.338
689	\N	\N	611	24	128			687	\N	t	t		1	\N	2017-01-15 16:45:46.359	2017-01-15 16:45:46.359
690	\N	\N	612	25	129			\N	\N	t	t		0	\N	2017-01-15 16:46:27.997	2017-01-15 16:46:27.997
691	\N	\N	613	25	129			\N	\N	t	t		0	\N	2017-01-15 16:46:28.012	2017-01-15 16:46:28.012
692	\N	\N	614	25	129			\N	\N	t	t		0	\N	2017-01-15 16:46:28.028	2017-01-15 16:46:28.028
693	\N	\N	615	25	129			\N	\N	t	t		0	\N	2017-01-15 16:46:28.046	2017-01-15 16:46:28.046
694	\N	\N	616	25	129			693	\N	t	t		1	\N	2017-01-15 16:46:28.068	2017-01-15 16:46:28.068
695	\N	\N	617	25	129			693	\N	t	t		1	\N	2017-01-15 16:46:28.114	2017-01-15 16:46:28.114
\.


--
-- Name: item_form_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_form_metaelements_id_seq', 942, true);


--
-- Data for Name: item_group_metaelements; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_group_metaelements (id, no, parentno, item_group_id, crf_info_id, header, subheader, repeat_number, repeat_max, item_id, seq, show_group, repeating_group, options_index, created_at, updated_at) FROM stdin;
42	\N	\N	56	32			\N	\N	521	\N	\N	\N	\N	2017-01-15 18:09:00.575	2017-01-15 18:09:00.575
43	\N	\N	56	32			\N	\N	522	\N	\N	\N	\N	2017-01-15 18:09:00.591	2017-01-15 18:09:00.591
44	\N	\N	56	32			\N	\N	523	\N	\N	\N	\N	2017-01-15 18:09:00.611	2017-01-15 18:09:00.611
45	\N	\N	57	32			\N	\N	524	\N	\N	\N	\N	2017-01-15 18:09:00.633	2017-01-15 18:09:00.633
46	\N	\N	57	32			\N	\N	525	\N	\N	\N	\N	2017-01-15 18:09:00.654	2017-01-15 18:09:00.654
47	\N	\N	57	32			\N	\N	526	\N	\N	\N	\N	2017-01-15 18:09:00.671	2017-01-15 18:09:00.671
48	\N	\N	58	32			\N	\N	528	\N	\N	\N	\N	2017-01-15 18:09:00.708	2017-01-15 18:09:00.708
49	\N	\N	58	32			\N	\N	529	\N	\N	\N	\N	2017-01-15 18:09:00.724	2017-01-15 18:09:00.724
50	\N	\N	58	32			\N	\N	530	\N	\N	\N	\N	2017-01-15 18:09:00.739	2017-01-15 18:09:00.739
51	\N	\N	59	32			\N	\N	546	\N	\N	\N	\N	2017-01-15 18:09:00.983	2017-01-15 18:09:00.983
52	\N	\N	59	32			\N	\N	547	\N	\N	\N	\N	2017-01-15 18:09:01	2017-01-15 18:09:01
53	\N	\N	59	32			\N	\N	548	\N	\N	\N	\N	2017-01-15 18:09:01.018	2017-01-15 18:09:01.018
54	\N	\N	60	32			\N	\N	549	\N	\N	\N	\N	2017-01-15 18:09:01.039	2017-01-15 18:09:01.039
55	\N	\N	60	32			\N	\N	550	\N	\N	\N	\N	2017-01-15 18:09:01.056	2017-01-15 18:09:01.056
56	\N	\N	60	32			\N	\N	551	\N	\N	\N	\N	2017-01-15 18:09:01.071	2017-01-15 18:09:01.071
57	\N	\N	60	32			\N	\N	552	\N	\N	\N	\N	2017-01-15 18:09:01.087	2017-01-15 18:09:01.087
58	\N	\N	60	32			\N	\N	553	\N	\N	\N	\N	2017-01-15 18:09:01.104	2017-01-15 18:09:01.104
\.


--
-- Name: item_group_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_group_metaelements_id_seq', 58, true);


--
-- Data for Name: item_groups; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_groups (id, name, description, created_at, updated_at) FROM stdin;
56	首次抗癫痫药物治疗	首次抗癫痫药物治疗	2017-01-15 16:44:48.645	2017-01-15 16:44:48.645
57	调整用药	调整用药	2017-01-15 16:44:48.65	2017-01-15 16:44:48.65
58	新增药物	新增药物	2017-01-15 16:44:48.655	2017-01-15 16:44:48.655
59	目前用药情况	目前用药情况	2017-01-15 16:44:48.66	2017-01-15 16:44:48.66
60	癫痫观察表	癫痫观察表	2017-01-15 16:44:48.666	2017-01-15 16:44:48.666
\.


--
-- Name: item_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_groups_id_seq', 60, true);


--
-- Data for Name: item_value_orders; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_value_orders (id, patient_id, patient_visit_id, complete, ordinal, user_id, history, status, crf_info_id, menus_crf_info_id, created_at, updated_at) FROM stdin;
4	1	1	\N	1	\N	\N	\N	22	5	2017-02-14 01:02:54.105	2017-02-14 01:02:54.105
6	1	1	\N	1	\N	\N	\N	23	6	2017-02-14 09:51:42.43	2017-02-14 09:51:42.43
7	1	1	\N	1	\N	\N	\N	11	1	2017-02-14 09:53:27.713	2017-02-14 09:53:27.713
8	1	1	\N	2	\N	\N	\N	22	5	2017-02-14 09:54:14.217	2017-02-14 09:54:14.217
9	1	1	\N	1	\N	\N	\N	20	3	2017-02-14 09:54:43.673	2017-02-14 09:54:43.673
10	1	1	\N	1	\N	\N	\N	24	7	2017-02-14 09:55:34.727	2017-02-14 09:55:34.727
11	1	1	\N	1	\N	\N	\N	14	2	2017-02-14 09:55:49.01	2017-02-14 09:55:49.01
12	1	1	\N	1	\N	\N	\N	25	8	2017-02-14 09:56:08.016	2017-02-14 09:56:08.016
13	1	1	\N	2	\N	\N	\N	32	9	2017-02-14 10:23:14.734	2017-02-14 10:23:14.734
\.


--
-- Name: item_value_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_value_orders_id_seq', 13, true);


--
-- Data for Name: item_values; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_values (id, item_id, value, patient_id, menus_crf_info_id, patient_visit_id, item_value_order_id, created_at, updated_at, item_group_id, item_group_ordinal) FROM stdin;
81	567	1.无	1	5	1	4	2017-02-14 01:02:54.116	2017-02-14 01:02:54.116	\N	\N
83	569	2	1	5	1	4	2017-02-14 01:02:54.133	2017-02-14 01:02:54.133	\N	\N
84	570	12	1	5	1	4	2017-02-14 01:02:54.14	2017-02-14 01:02:54.14	\N	\N
85	574		1	5	1	4	2017-02-14 01:02:54.15	2017-02-14 01:02:54.15	\N	\N
86	575		1	5	1	4	2017-02-14 01:02:54.156	2017-02-14 01:02:54.156	\N	\N
87	577		1	5	1	4	2017-02-14 01:02:54.164	2017-02-14 01:02:54.164	\N	\N
88	580		1	5	1	4	2017-02-14 01:02:54.171	2017-02-14 01:02:54.171	\N	\N
89	582		1	5	1	4	2017-02-14 01:02:54.181	2017-02-14 01:02:54.181	\N	\N
90	585		1	5	1	4	2017-02-14 01:02:54.188	2017-02-14 01:02:54.188	\N	\N
91	587		1	5	1	4	2017-02-14 01:02:54.197	2017-02-14 01:02:54.197	\N	\N
92	588		1	5	1	4	2017-02-14 01:02:54.203	2017-02-14 01:02:54.203	\N	\N
93	590		1	5	1	4	2017-02-14 01:02:54.212	2017-02-14 01:02:54.212	\N	\N
94	591		1	5	1	4	2017-02-14 01:02:54.218	2017-02-14 01:02:54.218	\N	\N
95	593		1	5	1	4	2017-02-14 01:02:54.226	2017-02-14 01:02:54.226	\N	\N
96	594		1	5	1	4	2017-02-14 01:02:54.234	2017-02-14 01:02:54.234	\N	\N
97	596		1	5	1	4	2017-02-14 01:02:54.242	2017-02-14 01:02:54.242	\N	\N
98	597		1	5	1	4	2017-02-14 01:02:54.252	2017-02-14 01:02:54.252	\N	\N
99	598		1	5	1	4	2017-02-14 01:02:54.26	2017-02-14 01:02:54.26	\N	\N
82	568	1.无	1	5	1	4	2017-02-14 01:02:54.123	2017-02-14 01:09:31.446	\N	\N
157	599	是	1	6	1	6	2017-02-14 09:51:42.44	2017-02-14 09:51:42.44	\N	\N
158	600	是	1	6	1	6	2017-02-14 09:51:42.448	2017-02-14 09:51:42.448	\N	\N
159	601	是	1	6	1	6	2017-02-14 09:51:42.453	2017-02-14 09:51:42.453	\N	\N
160	602	是	1	6	1	6	2017-02-14 09:51:42.46	2017-02-14 09:51:42.46	\N	\N
161	603	是	1	6	1	6	2017-02-14 09:51:42.464	2017-02-14 09:51:42.464	\N	\N
162	604	是	1	6	1	6	2017-02-14 09:51:42.47	2017-02-14 09:51:42.47	\N	\N
163	605	是	1	6	1	6	2017-02-14 09:51:42.477	2017-02-14 09:51:42.477	\N	\N
164	606	是	1	6	1	6	2017-02-14 09:51:42.482	2017-02-14 09:51:42.482	\N	\N
165	607	是	1	6	1	6	2017-02-14 09:51:42.487	2017-02-14 09:51:42.487	\N	\N
166	184	1.自然受孕	1	1	1	7	2017-02-14 09:53:27.723	2017-02-14 09:53:27.723	\N	\N
167	185		1	1	1	7	2017-02-14 09:53:27.731	2017-02-14 09:53:27.731	\N	\N
168	186	1	1	1	1	7	2017-02-14 09:53:27.74	2017-02-14 09:53:27.74	\N	\N
169	187	1	1	1	1	7	2017-02-14 09:53:27.748	2017-02-14 09:53:27.748	\N	\N
170	188	2.无	1	1	1	7	2017-02-14 09:53:27.755	2017-02-14 09:53:27.755	\N	\N
171	189		1	1	1	7	2017-02-14 09:53:27.764	2017-02-14 09:53:27.764	\N	\N
172	190	37	1	1	1	7	2017-02-14 09:53:27.772	2017-02-14 09:53:27.772	\N	\N
173	191		1	1	1	7	2017-02-14 09:53:27.808	2017-02-14 09:53:27.808	\N	\N
174	192	1.顺产	1	1	1	7	2017-02-14 09:53:27.825	2017-02-14 09:53:27.825	\N	\N
175	193		1	1	1	7	2017-02-14 09:53:27.833	2017-02-14 09:53:27.833	\N	\N
176	194	1.有	1	1	1	7	2017-02-14 09:53:27.845	2017-02-14 09:53:27.845	\N	\N
177	195	2	1	1	1	7	2017-02-14 09:53:27.858	2017-02-14 09:53:27.858	\N	\N
178	196	3	1	1	1	7	2017-02-14 09:53:27.865	2017-02-14 09:53:27.865	\N	\N
179	197	4	1	1	1	7	2017-02-14 09:53:27.874	2017-02-14 09:53:27.874	\N	\N
180	198	2.羊水多	1	1	1	7	2017-02-14 09:53:27.88	2017-02-14 09:53:27.88	\N	\N
181	199	2.过长	1	1	1	7	2017-02-14 09:53:27.889	2017-02-14 09:53:27.889	\N	\N
182	200		1	1	1	7	2017-02-14 09:53:27.896	2017-02-14 09:53:27.896	\N	\N
183	201	1.正常	1	1	1	7	2017-02-14 09:53:27.901	2017-02-14 09:53:27.901	\N	\N
184	202		1	1	1	7	2017-02-14 09:53:27.909	2017-02-14 09:53:27.909	\N	\N
185	203		1	1	1	7	2017-02-14 09:53:27.926	2017-02-14 09:53:27.926	\N	\N
186	204	1.正常	1	1	1	7	2017-02-14 09:53:27.947	2017-02-14 09:53:27.947	\N	\N
187	205	["1.抬头"]	1	1	1	7	2017-02-14 09:53:27.963	2017-02-14 09:53:27.963	\N	\N
188	206	3	1	1	1	7	2017-02-14 09:53:27.973	2017-02-14 09:53:27.973	\N	\N
189	207		1	1	1	7	2017-02-14 09:53:27.982	2017-02-14 09:53:27.982	\N	\N
190	208		1	1	1	7	2017-02-14 09:53:27.99	2017-02-14 09:53:27.99	\N	\N
191	209		1	1	1	7	2017-02-14 09:53:27.997	2017-02-14 09:53:27.997	\N	\N
192	210		1	1	1	7	2017-02-14 09:53:28.009	2017-02-14 09:53:28.009	\N	\N
193	211		1	1	1	7	2017-02-14 09:53:28.018	2017-02-14 09:53:28.018	\N	\N
194	212		1	1	1	7	2017-02-14 09:53:28.029	2017-02-14 09:53:28.029	\N	\N
195	213		1	1	1	7	2017-02-14 09:53:28.05	2017-02-14 09:53:28.05	\N	\N
196	214		1	1	1	7	2017-02-14 09:53:28.06	2017-02-14 09:53:28.06	\N	\N
197	215		1	1	1	7	2017-02-14 09:53:28.077	2017-02-14 09:53:28.077	\N	\N
198	216	1.母乳	1	1	1	7	2017-02-14 09:53:28.095	2017-02-14 09:53:28.095	\N	\N
199	217	良好	1	1	1	7	2017-02-14 09:53:28.105	2017-02-14 09:53:28.105	\N	\N
200	218	良好	1	1	1	7	2017-02-14 09:53:28.11	2017-02-14 09:53:28.11	\N	\N
201	219	良好	1	1	1	7	2017-02-14 09:53:28.116	2017-02-14 09:53:28.116	\N	\N
202	220	好	1	1	1	7	2017-02-14 09:53:28.131	2017-02-14 09:53:28.131	\N	\N
203	221	好	1	1	1	7	2017-02-14 09:53:28.141	2017-02-14 09:53:28.141	\N	\N
204	567	1.无	1	5	1	8	2017-02-14 09:54:14.226	2017-02-14 09:54:14.226	\N	\N
205	568	2.有	1	5	1	8	2017-02-14 09:54:14.236	2017-02-14 09:54:14.236	\N	\N
206	569		1	5	1	8	2017-02-14 09:54:14.243	2017-02-14 09:54:14.243	\N	\N
207	570	高	1	5	1	8	2017-02-14 09:54:14.252	2017-02-14 09:54:14.252	\N	\N
208	571	1.无	1	5	1	8	2017-02-14 09:54:14.258	2017-02-14 09:54:14.258	\N	\N
209	572	1.无	1	5	1	8	2017-02-14 09:54:14.267	2017-02-14 09:54:14.267	\N	\N
210	573	2.有	1	5	1	8	2017-02-14 09:54:14.276	2017-02-14 09:54:14.276	\N	\N
211	574		1	5	1	8	2017-02-14 09:54:14.284	2017-02-14 09:54:14.284	\N	\N
212	575		1	5	1	8	2017-02-14 09:54:14.291	2017-02-14 09:54:14.291	\N	\N
213	576	2.有	1	5	1	8	2017-02-14 09:54:14.299	2017-02-14 09:54:14.299	\N	\N
214	577		1	5	1	8	2017-02-14 09:54:14.306	2017-02-14 09:54:14.306	\N	\N
215	578	1.左侧	1	5	1	8	2017-02-14 09:54:14.314	2017-02-14 09:54:14.314	\N	\N
216	579	1.额部	1	5	1	8	2017-02-14 09:54:14.321	2017-02-14 09:54:14.321	\N	\N
217	580		1	5	1	8	2017-02-14 09:54:14.33	2017-02-14 09:54:14.33	\N	\N
218	581	2.有	1	5	1	8	2017-02-14 09:54:14.338	2017-02-14 09:54:14.338	\N	\N
219	582		1	5	1	8	2017-02-14 09:54:14.345	2017-02-14 09:54:14.345	\N	\N
220	585		1	5	1	8	2017-02-14 09:54:14.353	2017-02-14 09:54:14.353	\N	\N
221	587		1	5	1	8	2017-02-14 09:54:14.359	2017-02-14 09:54:14.359	\N	\N
222	588		1	5	1	8	2017-02-14 09:54:14.365	2017-02-14 09:54:14.365	\N	\N
223	590		1	5	1	8	2017-02-14 09:54:14.371	2017-02-14 09:54:14.371	\N	\N
224	591		1	5	1	8	2017-02-14 09:54:14.378	2017-02-14 09:54:14.378	\N	\N
225	593		1	5	1	8	2017-02-14 09:54:14.384	2017-02-14 09:54:14.384	\N	\N
226	594		1	5	1	8	2017-02-14 09:54:14.39	2017-02-14 09:54:14.39	\N	\N
227	596		1	5	1	8	2017-02-14 09:54:14.396	2017-02-14 09:54:14.396	\N	\N
228	597		1	5	1	8	2017-02-14 09:54:14.403	2017-02-14 09:54:14.403	\N	\N
229	598		1	5	1	8	2017-02-14 09:54:14.409	2017-02-14 09:54:14.409	\N	\N
230	485	2017-01-12	1	3	1	9	2017-02-14 09:54:43.68	2017-02-14 09:54:43.68	\N	\N
231	486	是	1	3	1	9	2017-02-14 09:54:43.685	2017-02-14 09:54:43.685	\N	\N
232	488		1	3	1	9	2017-02-14 09:54:43.691	2017-02-14 09:54:43.691	\N	\N
233	487	是	1	3	1	9	2017-02-14 09:55:06.163	2017-02-14 09:55:06.163	\N	\N
234	608	2017-01-22	1	7	1	10	2017-02-14 09:55:34.733	2017-02-14 09:55:34.733	\N	\N
235	609	否	1	7	1	10	2017-02-14 09:55:34.742	2017-02-14 09:55:34.742	\N	\N
236	610	否	1	7	1	10	2017-02-14 09:55:34.747	2017-02-14 09:55:34.747	\N	\N
237	611		1	7	1	10	2017-02-14 09:55:34.755	2017-02-14 09:55:34.755	\N	\N
238	290	2017-02-12	1	2	1	11	2017-02-14 09:55:49.015	2017-02-14 09:55:49.015	\N	\N
239	291	["52项神经运动检查"]	1	2	1	11	2017-02-14 09:55:49.023	2017-02-14 09:55:49.023	\N	\N
240	292		1	2	1	11	2017-02-14 09:55:49.028	2017-02-14 09:55:49.028	\N	\N
241	293	是	1	2	1	11	2017-02-14 09:55:49.036	2017-02-14 09:55:49.036	\N	\N
242	295		1	2	1	11	2017-02-14 09:55:49.043	2017-02-14 09:55:49.043	\N	\N
243	612	2017-02-12	1	8	1	12	2017-02-14 09:56:08.023	2017-02-14 09:56:08.023	\N	\N
244	613	血串联质谱检测	1	8	1	12	2017-02-14 09:56:08.031	2017-02-14 09:56:08.031	\N	\N
245	614	一代测序（Sanger测序）	1	8	1	12	2017-02-14 09:56:08.036	2017-02-14 09:56:08.036	\N	\N
246	615	否	1	8	1	12	2017-02-14 09:56:08.045	2017-02-14 09:56:08.045	\N	\N
247	616	否	1	8	1	12	2017-02-14 09:56:08.051	2017-02-14 09:56:08.051	\N	\N
248	617		1	8	1	12	2017-02-14 09:56:08.061	2017-02-14 09:56:08.061	\N	\N
269	490	["2.清醒", "8.发热"]	1	9	1	13	2017-02-14 10:23:14.742	2017-02-14 10:23:14.742	\N	\N
270	491		1	9	1	13	2017-02-14 10:23:14.749	2017-02-14 10:23:14.749	\N	\N
271	492	["2.呼之不应", "8.双眼紧闭"]	1	9	1	13	2017-02-14 10:23:14.759	2017-02-14 10:23:14.759	\N	\N
272	493		1	9	1	13	2017-02-14 10:23:14.766	2017-02-14 10:23:14.766	\N	\N
273	494	["2.部分性发作"]	1	9	1	13	2017-02-14 10:23:14.773	2017-02-14 10:23:14.773	\N	\N
274	496	["3.继发全面性发作"]	1	9	1	13	2017-02-14 10:23:14.781	2017-02-14 10:23:14.781	\N	\N
275	499	["1.全面性强直阵挛发作"]	1	9	1	13	2017-02-14 10:23:14.788	2017-02-14 10:23:14.788	\N	\N
276	500	["1.清醒"]	1	9	1	13	2017-02-14 10:23:14.796	2017-02-14 10:23:14.796	\N	\N
277	501		1	9	1	13	2017-02-14 10:23:14.804	2017-02-14 10:23:14.804	\N	\N
278	502	1.无 	1	9	1	13	2017-02-14 10:23:14.819	2017-02-14 10:23:14.819	\N	\N
279	504		1	9	1	13	2017-02-14 10:23:14.828	2017-02-14 10:23:14.828	\N	\N
280	505		1	9	1	13	2017-02-14 10:23:14.835	2017-02-14 10:23:14.835	\N	\N
281	506		1	9	1	13	2017-02-14 10:23:14.844	2017-02-14 10:23:14.844	\N	\N
282	507		1	9	1	13	2017-02-14 10:23:14.852	2017-02-14 10:23:14.852	\N	\N
283	509		1	9	1	13	2017-02-14 10:23:14.864	2017-02-14 10:23:14.864	\N	\N
284	516		1	9	1	13	2017-02-14 10:23:14.872	2017-02-14 10:23:14.872	\N	\N
285	519		1	9	1	13	2017-02-14 10:23:14.88	2017-02-14 10:23:14.88	\N	\N
286	520		1	9	1	13	2017-02-14 10:23:14.885	2017-02-14 10:23:14.885	\N	\N
287	521	1.丙戊酸钠	1	9	1	13	2017-02-14 10:23:14.891	2017-02-14 10:23:14.891	56	0
288	522	1	1	9	1	13	2017-02-14 10:23:14.895	2017-02-14 10:23:14.895	56	0
289	523	1	1	9	1	13	2017-02-14 10:23:14.9	2017-02-14 10:23:14.9	56	0
290	521	2.左乙拉西坦	1	9	1	13	2017-02-14 10:23:14.905	2017-02-14 10:23:14.905	56	1
291	522	2	1	9	1	13	2017-02-14 10:23:14.91	2017-02-14 10:23:14.91	56	1
292	523	2	1	9	1	13	2017-02-14 10:23:14.916	2017-02-14 10:23:14.916	56	1
293	524	3.拉莫三嗪	1	9	1	13	2017-02-14 10:23:14.921	2017-02-14 10:23:14.921	57	0
294	525	3	1	9	1	13	2017-02-14 10:23:14.927	2017-02-14 10:23:14.927	57	0
295	526	3	1	9	1	13	2017-02-14 10:23:14.931	2017-02-14 10:23:14.931	57	0
296	524	4.奥卡西平	1	9	1	13	2017-02-14 10:23:14.936	2017-02-14 10:23:14.936	57	1
297	525	4	1	9	1	13	2017-02-14 10:23:14.941	2017-02-14 10:23:14.941	57	1
298	526	4	1	9	1	13	2017-02-14 10:23:14.946	2017-02-14 10:23:14.946	57	1
299	527		1	9	1	13	2017-02-14 10:23:14.951	2017-02-14 10:23:14.951	\N	\N
300	528		1	9	1	13	2017-02-14 10:23:14.959	2017-02-14 10:23:14.959	58	0
301	529		1	9	1	13	2017-02-14 10:23:14.964	2017-02-14 10:23:14.964	58	0
302	530		1	9	1	13	2017-02-14 10:23:14.972	2017-02-14 10:23:14.972	58	0
303	531		1	9	1	13	2017-02-14 10:23:14.978	2017-02-14 10:23:14.978	\N	\N
304	624		1	9	1	13	2017-02-14 10:23:14.984	2017-02-14 10:23:14.984	\N	\N
305	534		1	9	1	13	2017-02-14 10:23:14.989	2017-02-14 10:23:14.989	\N	\N
306	535		1	9	1	13	2017-02-14 10:23:14.994	2017-02-14 10:23:14.994	\N	\N
307	536		1	9	1	13	2017-02-14 10:23:14.999	2017-02-14 10:23:14.999	\N	\N
308	537		1	9	1	13	2017-02-14 10:23:15.004	2017-02-14 10:23:15.004	\N	\N
309	539		1	9	1	13	2017-02-14 10:23:15.01	2017-02-14 10:23:15.01	\N	\N
310	546		1	9	1	13	2017-02-14 10:23:15.015	2017-02-14 10:23:15.015	59	0
311	547		1	9	1	13	2017-02-14 10:23:15.021	2017-02-14 10:23:15.021	59	0
312	548		1	9	1	13	2017-02-14 10:23:15.026	2017-02-14 10:23:15.026	59	0
313	546		1	9	1	13	2017-02-14 10:23:15.031	2017-02-14 10:23:15.031	59	1
314	547		1	9	1	13	2017-02-14 10:23:15.037	2017-02-14 10:23:15.037	59	1
315	548		1	9	1	13	2017-02-14 10:23:15.045	2017-02-14 10:23:15.045	59	1
316	549		1	9	1	13	2017-02-14 10:23:15.052	2017-02-14 10:23:15.052	60	0
317	550		1	9	1	13	2017-02-14 10:23:15.06	2017-02-14 10:23:15.06	60	0
318	551		1	9	1	13	2017-02-14 10:23:15.068	2017-02-14 10:23:15.068	60	0
319	552		1	9	1	13	2017-02-14 10:23:15.076	2017-02-14 10:23:15.076	60	0
320	553		1	9	1	13	2017-02-14 10:23:15.083	2017-02-14 10:23:15.083	60	0
321	555		1	9	1	13	2017-02-14 10:23:15.09	2017-02-14 10:23:15.09	\N	\N
322	556		1	9	1	13	2017-02-14 10:23:15.095	2017-02-14 10:23:15.095	\N	\N
323	558		1	9	1	13	2017-02-14 10:23:15.101	2017-02-14 10:23:15.101	\N	\N
324	559		1	9	1	13	2017-02-14 10:23:15.108	2017-02-14 10:23:15.108	\N	\N
325	561		1	9	1	13	2017-02-14 10:23:15.113	2017-02-14 10:23:15.113	\N	\N
326	562		1	9	1	13	2017-02-14 10:23:15.119	2017-02-14 10:23:15.119	\N	\N
327	563		1	9	1	13	2017-02-14 10:23:15.126	2017-02-14 10:23:15.126	\N	\N
328	565		1	9	1	13	2017-02-14 10:23:15.132	2017-02-14 10:23:15.132	\N	\N
329	566		1	9	1	13	2017-02-14 10:23:15.139	2017-02-14 10:23:15.139	\N	\N
\.


--
-- Name: item_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_values_id_seq', 329, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY items (id, name, description, units, header, left_item_text, right_item_text, phi_status, item_data_type, response_type, options_text, options_value, default_value, regexp, regexp_error_msg, created_at, updated_at) FROM stdin;
184	bba9	孕母受孕方式			孕母受孕方式		\N	ST	radio	1.自然受孕,2.人工授精,3.其他	1.自然受孕,2.人工授精,3.其他				2017-01-15 16:28:28.026	2017-01-15 16:28:28.026
185	bba10	孕母受孕方式其他			孕母受孕方式其他		\N	ST	text						2017-01-15 16:28:28.086	2017-01-15 16:28:28.086
186	bba11	孕次：第（胎）	胎		孕次：第（胎）		\N	ST	text						2017-01-15 16:28:28.111	2017-01-15 16:28:28.111
187	bba12	孕次：第（产）	产		孕次：第（产）		\N	ST	text						2017-01-15 16:28:28.157	2017-01-15 16:28:28.157
188	bba13	产检有无异常			产检有无异常		\N	ST	radio	1.有,2.无	1.有,2.无				2017-01-15 16:28:28.203	2017-01-15 16:28:28.203
189	bba14	异常情况			异常情况		\N	ST	text						2017-01-15 16:28:28.233	2017-01-15 16:28:28.233
190	bba15	出生时胎龄(周)	周		出生时胎龄(周)		\N	ST	text						2017-01-15 16:28:28.258	2017-01-15 16:28:28.258
191	bba16	出生时胎龄(天)	天		出生时胎龄(天)		\N	ST	text						2017-01-15 16:28:28.276	2017-01-15 16:28:28.276
193	bba18	原因			原因		\N	ST	text						2017-01-15 16:28:28.315	2017-01-15 16:28:28.315
194	bba19	窒息抢救史			窒息抢救史		\N	ST	radio	1.有,2.无	1.有,2.无				2017-01-15 16:28:28.34	2017-01-15 16:28:28.34
195	bba20	Apgar评分：1分钟			Apgar评分：1分钟		\N	ST	text						2017-01-15 16:28:28.37	2017-01-15 16:28:28.37
196	bba21	Apgar评分：5分钟			Apgar评分：5分钟		\N	ST	text						2017-01-15 16:28:28.392	2017-01-15 16:28:28.392
197	bba22	Apgar评分：10分钟			Apgar评分：10分钟		\N	ST	text						2017-01-15 16:28:28.421	2017-01-15 16:28:28.421
198	bba23	羊水			羊水		\N	ST	radio	1.正常,2.羊水多,3.羊水少,4.Ⅰ°浑浊,5.Ⅱ°浑浊 ,6.Ⅲ°浑浊	1.正常,2.羊水多,3.羊水少,4.Ⅰ°浑浊,5.Ⅱ°浑浊 ,6.Ⅲ°浑浊				2017-01-15 16:28:28.442	2017-01-15 16:28:28.442
199	bba24	脐带			脐带		\N	ST	radio	1.正常,2.过长,过短,脐带绕颈	1.正常,2.过长,过短,脐带绕颈				2017-01-15 16:28:28.462	2017-01-15 16:28:28.462
200	bba25	脐带绕颈	周		脐带绕颈		\N	ST	text						2017-01-15 16:28:28.481	2017-01-15 16:28:28.481
201	bba26	胎盘			胎盘		\N	ST	radio	1.正常,2.异常	1.正常,2.异常				2017-01-15 16:28:28.5	2017-01-15 16:28:28.5
202	bba27	胎盘：异常			胎盘：异常		\N	ST	text						2017-01-15 16:28:28.519	2017-01-15 16:28:28.519
203	bba28	其他情况			其他情况		\N	ST	text						2017-01-15 16:28:28.54	2017-01-15 16:28:28.54
204	bba29	整体发育			整体发育		\N	ST	radio	1.正常,2.落后	1.正常,2.落后				2017-01-15 16:28:28.567	2017-01-15 16:28:28.567
205	bba30	里程碑			里程碑		\N	ST	checkbox	1.抬头,2.翻身,3.独坐,4.爬行,5.独站,6.独走,7.发音,8.认人,9.说话,其他	1.抬头,2.翻身,3.独坐,4.爬行,5.独站,6.独走,7.发音,8.认人,9.说话,其他				2017-01-15 16:28:28.598	2017-01-15 16:28:28.598
206	bba301	1.抬头	月		1.抬头		\N	ST	text						2017-01-15 16:28:28.636	2017-01-15 16:28:28.636
207	bba302	2.翻身	月		2.翻身		\N	ST	text						2017-01-15 16:28:28.666	2017-01-15 16:28:28.666
208	bba303	3.独坐	月		3.独坐		\N	ST	text						2017-01-15 16:28:28.695	2017-01-15 16:28:28.695
209	bba304	4.爬行	月		4.爬行		\N	ST	text						2017-01-15 16:28:28.721	2017-01-15 16:28:28.721
210	bba305	5.独站	月		5.独站		\N	ST	text						2017-01-15 16:28:28.749	2017-01-15 16:28:28.749
211	bba306	6.独走	月		6.独走		\N	ST	text						2017-01-15 16:28:28.83	2017-01-15 16:28:28.83
212	bba307	7.发音	月		7.发音		\N	ST	text						2017-01-15 16:28:28.859	2017-01-15 16:28:28.859
213	bba308	8.认人	月		8.认人		\N	ST	text						2017-01-15 16:28:28.887	2017-01-15 16:28:28.887
214	bba309	9.说话	月		9.说话		\N	ST	text						2017-01-15 16:28:28.908	2017-01-15 16:28:28.908
215	bba310	其他			其他		\N	ST	text						2017-01-15 16:28:28.934	2017-01-15 16:28:28.934
216	bba31	喂养			喂养		\N	ST	radio	1.母乳,2.配方奶,3.混合喂养	1.母乳,2.配方奶,3.混合喂养				2017-01-15 16:28:28.962	2017-01-15 16:28:28.962
217	bba32	饮食情况：			饮食情况：		\N	ST	text						2017-01-15 16:28:28.989	2017-01-15 16:28:28.989
218	bba33	睡眠情况：			睡眠情况：		\N	ST	text						2017-01-15 16:28:29.014	2017-01-15 16:28:29.014
219	bba34	脾气、性格：			脾气、性格：		\N	ST	text						2017-01-15 16:28:29.036	2017-01-15 16:28:29.036
220	bba35	学习成绩：			学习成绩：		\N	ST	text						2017-01-15 16:28:29.058	2017-01-15 16:28:29.058
221	bba36	生活环境			生活环境		\N	ST	text						2017-01-15 16:28:29.077	2017-01-15 16:28:29.077
290	fypg1	检查日期                             			检查日期                             		\N	DATE	text						2017-01-15 16:31:39.381	2017-01-15 16:31:39.381
291	fypg2	评估方式			评估方式		\N	ST	checkbox	52项神经运动检查,婴幼儿智能发育检查（CDCC）,儿童心理测试,比奈智力测试（10岁以下）,比奈智力测试（10岁以上）,康奈氏（Conner）儿童行为量表,日常生活能力评定量表,其他	52项神经运动检查,婴幼儿智能发育检查（CDCC）,儿童心理测试,比奈智力测试（10岁以下）,比奈智力测试（10岁以上）,康奈氏（Conner）儿童行为量表,日常生活能力评定量表,其他				2017-01-15 16:31:39.429	2017-01-15 16:31:39.429
292	fypg21	其他			其他		\N	ST	text						2017-01-15 16:31:39.459	2017-01-15 16:31:39.459
293	fypg3	是否正常			是否正常		\N	ST	radio	是,否	是,否				2017-01-15 16:31:39.487	2017-01-15 16:31:39.487
294	fypg4	如异常有无临床意义			如异常有无临床意义		\N	ST	radio	是,否	是,否				2017-01-15 16:31:39.505	2017-01-15 16:31:39.505
295	fypg5	发育评估具体描述			发育评估具体描述		\N	ST	text						2017-01-15 16:31:39.524	2017-01-15 16:31:39.524
485	ndtjc1	检查日期                             			检查日期                             		\N	DATE	text						2017-01-15 16:43:12.739	2017-01-15 16:43:12.739
486	ndtjc2	是否正常			是否正常		\N	ST	radio	是,否	是,否				2017-01-15 16:43:12.806	2017-01-15 16:43:12.806
487	ndtjc3	如异常有无临床意义			如异常有无临床意义		\N	ST	radio	是,否	是,否				2017-01-15 16:43:12.833	2017-01-15 16:43:12.833
488	ndtjc4	异常脑电图具体描述			异常脑电图具体描述		\N	ST	text						2017-01-15 16:43:12.859	2017-01-15 16:43:12.859
489	fzjzl1	首次发作时间                                         			首次发作时间                                         		\N	DATE	ST						2017-01-15 16:44:48.702	2017-01-15 16:44:48.702
490	fzjzl2	发作前状态或诱因			发作前状态或诱因		\N	ST	checkbox	1.觉醒,2.清醒,3.睡眠,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他	1.觉醒,2.清醒,3.睡眠,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他				2017-01-15 16:44:48.772	2017-01-15 16:44:48.772
491	fzjzl3	发作前状态或诱因其他			其他		\N	ST	text		0.0				2017-01-15 16:44:48.792	2017-01-15 16:44:48.792
492	fzjzl4	发作时表现			发作时表现		\N	ST	checkbox	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他				2017-01-15 16:44:48.813	2017-01-15 16:44:48.813
493	fzjzl5	发作时表现:其他			其他		\N	ST	text		0.0				2017-01-15 16:44:48.83	2017-01-15 16:44:48.83
494	fzjzl6	发作类型			发作类型		\N	ST	checkbox	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作				2017-01-15 16:44:48.851	2017-01-15 16:44:48.851
495	fzjzl7	1.全面性发作			1.全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作				2017-01-15 16:44:48.866	2017-01-15 16:44:48.866
496	fzjzl8	2.部分性发作			2.部分性发作		\N	ST	checkbox	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作				2017-01-15 16:44:48.886	2017-01-15 16:44:48.886
497	fzjzl9	1.简单部分性发作			1.简单部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:48.907	2017-01-15 16:44:48.907
498	fzjzl10	2.复杂部分性发作			2.复杂部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:48.932	2017-01-15 16:44:48.932
499	fzjzl11	3.继发全面性发作			3.继发全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作				2017-01-15 16:44:48.953	2017-01-15 16:44:48.953
500	fzjzl12	发作后表现			发作后表现		\N	ST	checkbox	1.清醒,2.烦躁,3.嗜睡 ,4.朦胧状态,5.Todd氏麻痹,6.失语,7.遗忘,8.头痛,9.肌肉酸痛,10.其他	1.清醒,2.烦躁,3.嗜睡 ,4.朦胧状态,5.Todd氏麻痹,6.失语,7.遗忘,8.头痛,9.肌肉酸痛,10.其他				2017-01-15 16:44:48.974	2017-01-15 16:44:48.974
501	fzjzl13	发作后表现:其他			其他		\N	ST	text		0.0				2017-01-15 16:44:48.992	2017-01-15 16:44:48.992
502	fzjzl14	发作后有无精神运动障碍或认知倒退			发作后有无精神运动障碍或认知倒退		\N	ST	radio	1.无 ,2.有	1.无 ,2.有				2017-01-15 16:44:49.014	2017-01-15 16:44:49.014
503	fzjzl15	发作频率			发作频率		\N	ST	radio	次/天,次/周,次/月,次/年	次/天,次/周,次/月,次/年				2017-01-15 16:44:49.033	2017-01-15 16:44:49.033
504	fzjzl16	发作频率：1	次/天		1.0		\N	ST	text		0.0				2017-01-15 16:44:49.05	2017-01-15 16:44:49.05
505	fzjzl17	发作频率：2	次/周		2.0		\N	ST	text		0.0				2017-01-15 16:44:49.068	2017-01-15 16:44:49.068
506	fzjzl18	发作频率：3	次/月		3.0		\N	ST	text		0.0				2017-01-15 16:44:49.087	2017-01-15 16:44:49.087
507	fzjzl19	发作频率：4	次/年		4.0		\N	ST	text		0.0				2017-01-15 16:44:49.107	2017-01-15 16:44:49.107
508	fzjzl20	治疗前发作时表现			发作时表现		\N	ST	checkbox	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他				2017-01-15 16:44:49.132	2017-01-15 16:44:49.132
509	fzjzl21	治疗前发作时表现:其他			其他		\N	ST	text		0.0				2017-01-15 16:44:49.154	2017-01-15 16:44:49.154
510	fzjzl22	治疗前发作类型			发作类型		\N	ST	checkbox	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作				2017-01-15 16:44:49.176	2017-01-15 16:44:49.176
511	fzjzl23	治疗前1.全面性发作			1.全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作				2017-01-15 16:44:49.194	2017-01-15 16:44:49.194
512	fzjzl24	治疗前2.部分性发作			2.部分性发作		\N	ST	checkbox	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作				2017-01-15 16:44:49.215	2017-01-15 16:44:49.215
513	fzjzl25	治疗前1.简单部分性发作			1.简单部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:49.236	2017-01-15 16:44:49.236
514	fzjzl26	治疗前2.复杂部分性发作			2.复杂部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:49.256	2017-01-15 16:44:49.256
515	fzjzl27	治疗前3.继发全面性发作			3.继发全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作				2017-01-15 16:44:49.273	2017-01-15 16:44:49.273
516	fzjzl28	临床诊断			临床诊断		\N	ST	text		0.0				2017-01-15 16:44:49.293	2017-01-15 16:44:49.293
517	fzjzl29	是否癫痫综合征			是否癫痫综合征		\N	ST	radio	1.是,2.否	1.是,2.否				2017-01-15 16:44:49.311	2017-01-15 16:44:49.311
546	fzjzl56	目前用药:用药名称			用药名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他				2017-01-15 16:44:50.034	2017-01-15 16:44:50.034
547	fzjzl57	目前用药:用药名称其他			其他		\N	ST	text		0.0				2017-01-15 16:44:50.059	2017-01-15 16:44:50.059
548	fzjzl58	目前用药:用量用法			目前用药:用量用法		\N	ST	text		0.0				2017-01-15 16:44:50.08	2017-01-15 16:44:50.08
519	fzjzl31	其他			其他		\N	ST	text		0.0				2017-01-15 16:44:49.36	2017-01-15 16:44:49.36
520	fzjzl32	首次用药日期			首次用药日期		\N	DATE	text		0.0				2017-01-15 16:44:49.386	2017-01-15 16:44:49.386
521	fzjzl33	首次抗癫痫药物治疗：药物名称			药物名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他				2017-01-15 16:44:49.407	2017-01-15 16:44:49.407
522	fzjzl331	首次抗癫痫药物治疗：药物名称其他			其他		\N	ST	text		0.0				2017-01-15 16:44:49.47	2017-01-15 16:44:49.47
523	fzjzl34	首次抗癫痫药物治疗：用量用法			用量用法		\N	ST	text		0.0				2017-01-15 16:44:49.492	2017-01-15 16:44:49.492
524	fzjzl35	调整用药:药物名称			药物名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺				2017-01-15 16:44:49.515	2017-01-15 16:44:49.515
525	fzjzl36	调整时间			调整时间		\N	DATE	text		0.0				2017-01-15 16:44:49.551	2017-01-15 16:44:49.551
526	fzjzl37	调整后用量用法			调整后用量用法		\N	ST	text		0.0				2017-01-15 16:44:49.591	2017-01-15 16:44:49.591
527	fzjzl38	增加药物日期			增加药物日期		\N	DATE	text		0.0				2017-01-15 16:44:49.628	2017-01-15 16:44:49.628
529	fzjzl391	新增药物：其他			其他		\N	ST	text						2017-01-15 16:44:49.676	2017-01-15 16:44:49.676
530	fzjzl40	新增药物:用量用法			用量用法		\N	ST	text		0.0				2017-01-15 16:44:49.696	2017-01-15 16:44:49.696
531	fzjzl41	停用药物日期			停用药物日期		\N	DATE	text		0.0				2017-01-15 16:44:49.72	2017-01-15 16:44:49.72
532	fzjzl42	停用药物			停用药物		\N	ST	checkbox	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他				2017-01-15 16:44:49.742	2017-01-15 16:44:49.742
533	fzjzl43	治疗后:发作频率			发作频率		\N	ST	radio	次/天,次/周,次/月,次/年	次/天,次/周,次/月,次/年				2017-01-15 16:44:49.766	2017-01-15 16:44:49.766
534	fzjzl44	治疗后:发作频率：1	次/天		1.0		\N	ST	text		0.0				2017-01-15 16:44:49.782	2017-01-15 16:44:49.782
535	fzjzl45	治疗后:发作频率：2	次/周		2.0		\N	ST	text		0.0				2017-01-15 16:44:49.803	2017-01-15 16:44:49.803
536	fzjzl46	治疗后:发作频率：3	次/月		3.0		\N	ST	text		0.0				2017-01-15 16:44:49.824	2017-01-15 16:44:49.824
537	fzjzl47	治疗后:发作频率：4	次/年		4.0		\N	ST	text		0.0				2017-01-15 16:44:49.847	2017-01-15 16:44:49.847
538	fzjzl48	治疗后:发作时表现			发作时表现		\N	ST	checkbox	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他	1.先兆,2.呼之不应,3.肢体强直,4.肢体阵挛,5.口角阵挛,6.眼角阵挛,7.双眼凝视,8.双眼紧闭,9.牙关紧闭,10.眼偏转,11.头偏转,12.发绀,13.大小便失禁,14.其他				2017-01-15 16:44:49.865	2017-01-15 16:44:49.865
539	fzjzl49	治疗后:发作时表现:其他			其他		\N	ST	text		0.0				2017-01-15 16:44:49.883	2017-01-15 16:44:49.883
540	fzjzl50	治疗后:发作类型			发作类型		\N	ST	checkbox	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作				2017-01-15 16:44:49.901	2017-01-15 16:44:49.901
541	fzjzl51	治疗后:1.全面性发作			1.全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作				2017-01-15 16:44:49.92	2017-01-15 16:44:49.92
542	fzjzl52	治疗后:2.部分性发作			2.部分性发作		\N	ST	checkbox	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作				2017-01-15 16:44:49.943	2017-01-15 16:44:49.943
543	fzjzl53	治疗后:1.简单部分性发作			1.简单部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:49.971	2017-01-15 16:44:49.971
544	fzjzl54	治疗后:2.复杂部分性发作			2.复杂部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-01-15 16:44:49.993	2017-01-15 16:44:49.993
545	fzjzl55	治疗后:3.继发全面性发作			3.继发全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作				2017-01-15 16:44:50.012	2017-01-15 16:44:50.012
549	fzjzl59	服药			服药		\N	ST	text		0.0				2017-01-15 16:44:50.104	2017-01-15 16:44:50.104
550	fzjzl60	时间			时间		\N	DATE	text		0.0				2017-01-15 16:44:50.131	2017-01-15 16:44:50.131
528	fzjzl39	新增药物			新增药物		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他				2017-01-15 16:44:49.645	2017-01-15 18:09:00.69
551	fzjzl61	发作			发作		\N	ST	text		0.0				2017-01-15 16:44:50.156	2017-01-15 16:44:50.156
552	fzjzl62	诱因			诱因		\N	ST	text		0.0				2017-01-15 16:44:50.184	2017-01-15 16:44:50.184
553	fzjzl63	睡眠			睡眠		\N	ST	text		0.0				2017-01-15 16:44:50.208	2017-01-15 16:44:50.208
554	fzjzl64	手术情况			手术情况		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:44:50.279	2017-01-15 16:44:50.279
555	fzjzl65	术前评估			术前评估		\N	ST	text		0.0				2017-01-15 16:44:50.295	2017-01-15 16:44:50.295
556	fzjzl66	脑电图检查日期			脑电图检查日期		\N	DATE	text		0.0				2017-01-15 16:44:50.311	2017-01-15 16:44:50.311
557	fzjzl67	脑电图检查结果			结果		\N	ST	radio	1.正常,2.异常	1.正常,2.异常				2017-01-15 16:44:50.327	2017-01-15 16:44:50.327
558	fzjzl68	脑电图检查具体结果			具体结果		\N	ST	text		0.0				2017-01-15 16:44:50.346	2017-01-15 16:44:50.346
559	fzjzl69	头颅MRI检查日期			头颅MRI检查日期		\N	DATE	text		0.0				2017-01-15 16:44:50.37	2017-01-15 16:44:50.37
560	fzjzl70	头颅MRI结果			结果		\N	ST	radio	1.正常,2.异常	1.正常,2.异常				2017-01-15 16:44:50.388	2017-01-15 16:44:50.388
561	fzjzl71	头颅MR具体结果			具体结果		\N	ST	text		0.0				2017-01-15 16:44:50.409	2017-01-15 16:44:50.409
562	fzjzl72	手术日期			手术日期		\N	DATE	text						2017-01-15 16:44:50.427	2017-01-15 16:44:50.427
563	fzjzl73	手术方式			手术方式		\N	ST	text		0.0				2017-01-15 16:44:50.445	2017-01-15 16:44:50.445
564	fzjzl74	并发症			并发症		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:44:50.465	2017-01-15 16:44:50.465
565	fzjzl75	并发症:具体			具体		\N	ST	text		0.0				2017-01-15 16:44:50.484	2017-01-15 16:44:50.484
566	fzjzl76	术后病理结果			术后病理结果		\N	ST	text		0.0				2017-01-15 16:44:50.505	2017-01-15 16:44:50.505
567	jws1	1产伤                                      			1产伤                                      		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.81	2017-01-15 16:45:04.81
568	jws2	2黄疸			2黄疸		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.851	2017-01-15 16:45:04.851
569	jws3	出现黄疸时间			出现黄疸时间		\N	DATE	text						2017-01-15 16:45:04.869	2017-01-15 16:45:04.869
570	jws4	最高总胆红素			最高总胆红素		\N	ST	text		0.0				2017-01-15 16:45:04.888	2017-01-15 16:45:04.888
571	jws5	光疗			光疗		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.906	2017-01-15 16:45:04.906
572	jws6	换血			换血		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.924	2017-01-15 16:45:04.924
573	jws7	3热性惊厥			3热性惊厥		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.951	2017-01-15 16:45:04.951
574	jws8	发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:04.968	2017-01-15 16:45:04.968
575	jws9	治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:04.988	2017-01-15 16:45:04.988
576	jws10	4颅脑外伤			4颅脑外伤		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.009	2017-01-15 16:45:05.009
577	jws11	4颅脑外伤:发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.028	2017-01-15 16:45:05.028
578	jws12	损伤部位			损伤部位		\N	ST	radio	1.左侧,2.右侧,3.双侧	1.左侧,2.右侧,3.双侧				2017-01-15 16:45:05.047	2017-01-15 16:45:05.047
579	jws121	损伤部位1			损伤部位		\N	ST	radio	1.额部,2.颞部,3.顶部,4.枕部	1.额部,2.颞部,3.顶部,4.枕部				2017-01-15 16:45:05.065	2017-01-15 16:45:05.065
580	jws13	治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:05.083	2017-01-15 16:45:05.083
581	jws14	5颅内出血			5颅内出血		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.1	2017-01-15 16:45:05.1
582	jws15	5颅内出血：发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.116	2017-01-15 16:45:05.116
583	jws16	出血部位			出血部位		\N	ST	radio	1.左侧,2.右侧,3.双侧	1.左侧,2.右侧,3.双侧				2017-01-15 16:45:05.133	2017-01-15 16:45:05.133
584	jws161	出血部位1			出血部位		\N	ST	radio	1.额部,2.颞部,3.顶部,4.枕部	1.额部,2.颞部,3.顶部,4.枕部				2017-01-15 16:45:05.156	2017-01-15 16:45:05.156
585	jws17	5颅内出血：治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:05.176	2017-01-15 16:45:05.176
586	jws18	6神经系统感染			6神经系统感染		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.197	2017-01-15 16:45:05.197
587	jws19	6神经系统感染:发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.214	2017-01-15 16:45:05.214
588	jws20	6神经系统感染:治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:05.234	2017-01-15 16:45:05.234
589	jws21	7缺氧缺血性脑病			7缺氧缺血性脑病		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.253	2017-01-15 16:45:05.253
590	jws22	7缺氧缺血性脑病:发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.272	2017-01-15 16:45:05.272
591	jws23	7缺氧缺血性脑病:治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:05.289	2017-01-15 16:45:05.289
592	jws24	8遗传代谢病			8遗传代谢病		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.309	2017-01-15 16:45:05.309
593	jws25	8遗传代谢病:发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.325	2017-01-15 16:45:05.325
594	jws26	8遗传代谢病:治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:05.342	2017-01-15 16:45:05.342
595	jws27	9手术史			9手术史		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.365	2017-01-15 16:45:05.365
596	jws28	9手术史:手术名称			手术名称		\N	ST	text		0.0				2017-01-15 16:45:05.383	2017-01-15 16:45:05.383
597	jws29	9手术史:手术时间			手术时间		\N	DATE	text		0.0				2017-01-15 16:45:05.405	2017-01-15 16:45:05.405
598	jws30	10其他			10其他		\N	ST	text		0.0				2017-01-15 16:45:05.426	2017-01-15 16:45:05.426
599	rzsxb1	年龄：14岁及以下                                           			年龄：14岁及以下                                           		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.018	2017-01-15 16:45:30.018
600	rzsxb2	性别不限  			性别不限  		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.066	2017-01-15 16:45:30.066
601	rzsxb3	符合癫痫的定义、诊断标准者                                                       			符合癫痫的定义、诊断标准者                                                       		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.085	2017-01-15 16:45:30.085
602	rzsxb4	临床资料完善者   			临床资料完善者   		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.101	2017-01-15 16:45:30.101
603	rzsxb5	年龄大于14岁			年龄大于14岁		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.121	2017-01-15 16:45:30.121
604	rzsxb6	癫痫已完全控制，无需复诊者			癫痫已完全控制，无需复诊者		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.151	2017-01-15 16:45:30.151
605	rzsxb7	患儿或家属不配合治疗者			患儿或家属不配合治疗者		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.171	2017-01-15 16:45:30.171
606	rzsxb8	临床资料不完善者			临床资料不完善者		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.194	2017-01-15 16:45:30.194
607	rzsxb9	结论：该患者是否符合上述要求，同意入组			结论：该患者是否符合上述要求，同意入组		\N	ST	radio	是,否	是,否				2017-01-15 16:45:30.215	2017-01-15 16:45:30.215
608	tlmrijc1	检查日期                             			检查日期                             		\N	DATE	text						2017-01-15 16:45:46.268	2017-01-15 16:45:46.268
609	tlmrijc2	是否正常			是否正常		\N	ST	radio	是,否	是,否				2017-01-15 16:45:46.31	2017-01-15 16:45:46.31
610	tlmrijc3	如异常有无临床意义			如异常有无临床意义		\N	ST	radio	是,否	是,否				2017-01-15 16:45:46.327	2017-01-15 16:45:46.327
611	tlmrijc4	异常头颅MRI具体描述			异常头颅MRI具体描述		\N	ST	text						2017-01-15 16:45:46.344	2017-01-15 16:45:46.344
612	ycdxjjyjc1	检查日期                             			检查日期                             		\N	DATE	text						2017-01-15 16:46:27.957	2017-01-15 16:46:27.957
613	ycdxjjyjc2	遗传代谢病检查方式			遗传代谢病检查方式		\N	ST	radio	血串联质谱检测,尿气相质谱检测	血串联质谱检测,尿气相质谱检测				2017-01-15 16:46:28.002	2017-01-15 16:46:28.002
614	ycdxjjyjc21	基因检测方式			基因检测方式		\N	ST	radio	一代测序（Sanger测序）,二代测序（高通量测序）,三代测序	一代测序（Sanger测序）,二代测序（高通量测序）,三代测序				2017-01-15 16:46:28.018	2017-01-15 16:46:28.018
615	ycdxjjyjc3	是否正常			是否正常		\N	ST	radio	是,否	是,否				2017-01-15 16:46:28.035	2017-01-15 16:46:28.035
616	ycdxjjyjc4	如异常有无临床意义			如异常有无临床意义		\N	ST	radio	是,否	是,否				2017-01-15 16:46:28.053	2017-01-15 16:46:28.053
617	ycdxjjyjc5	异常结果具体描述			异常结果具体描述		\N	ST	text						2017-01-15 16:46:28.079	2017-01-15 16:46:28.079
624	fzjzl421	停用药物:其他			其他		\N	ST	text						2017-01-15 18:09:00.769	2017-01-15 18:09:00.769
518	fzjzl30	综合征种类			综合征种类		\N	ST	checkbox	1.良性家族性新生儿癫痫,2.良性婴儿癫痫,3.早期肌阵挛脑病,4.大田原综合征,5.良性婴儿肌阵挛性癫痫,6.Dravet综合征,7.婴儿痉挛症,8.Lennox-Gastaut征,9.Doose综合征,10.儿童良性癫痫伴中央颞区棘波,11.儿童失神癫痫,12.早发性儿童良性枕叶癫痫,13.晚发性儿童枕叶癫痫,14.Landau-Kleffner综合征,15.癫痫性脑病伴慢波睡眠期持续棘慢波,16.青少年失神癫痫,17.青少年肌阵挛癫痫,18.仅有全面强直-阵挛发作性癫痫,19.遗传性癫痫伴热性惊厥附加症,20.肌阵挛失神癫痫,22.颞叶癫痫,23.额叶癫痫,24.进行性肌阵挛癫痫,其他	1.良性家族性新生儿癫痫,2.良性婴儿癫痫,3.早期肌阵挛脑病,4.大田原综合征,5.良性婴儿肌阵挛性癫痫,6.Dravet综合征,7.婴儿痉挛症,8.Lennox-Gastaut征,9.Doose综合征,10.儿童良性癫痫伴中央颞区棘波,11.儿童失神癫痫,12.早发性儿童良性枕叶癫痫,13.晚发性儿童枕叶癫痫,14.Landau-Kleffner综合征,15.癫痫性脑病伴慢波睡眠期持续棘慢波,16.青少年失神癫痫,17.青少年肌阵挛癫痫,18.仅有全面强直-阵挛发作性癫痫,19.遗传性癫痫伴热性惊厥附加症,20.肌阵挛失神癫痫,22.颞叶癫痫,23.额叶癫痫,24.进行性肌阵挛癫痫,其他				2017-01-15 16:44:49.328	2017-01-15 16:44:49.328
192	bba17	分娩方式			分娩方式		\N	ST	radio	1.顺产,2.剖宫产	1.顺产,2.剖宫产				2017-01-15 16:28:28.294	2017-01-15 16:28:28.294
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('items_id_seq', 624, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY menus (id, name_cn, name_en, menu_id, link, seq, icon_class, belong_to, created_at, updated_at, menu_type, hidden) FROM stdin;
3	患者信息		2	/patients	1	\N	\N	2017-01-15 13:48:35.514	2017-01-15 13:48:35.514	1	0
7	今日就诊		4	/patient_visits/today_visits	1	\N	\N	2017-01-15 13:48:35.681	2017-01-15 13:48:35.681	1	0
8	就诊列表		4	/patient_visits	2	\N	\N	2017-01-15 13:48:35.739	2017-01-15 13:48:35.739	1	0
1	控制台		0	/home/index	1	icon-dashboard	\N	2017-01-15 13:48:35.406	2017-01-15 13:48:35.406	1	0
2	患者信息		0	#	2	icon-list	\N	2017-01-15 13:48:35.483	2017-01-15 13:48:35.483	1	0
6	系统管理		0	#	5	icon-tag	\N	2017-01-15 13:48:35.636	2017-01-15 13:48:35.636	1	0
5	随访信息		11	#	4	icon-calendar	\N	2017-01-15 13:48:35.596	2017-01-15 13:48:35.596	1	0
4	就诊信息		222	#	3	icon-edit	\N	2017-01-15 13:48:35.553	2017-01-15 13:48:35.553	1	0
15	病历信息		0	#	2	icon-edit		2017-01-15 16:48:00.922	2017-01-15 16:48:00.922	2	\N
13	表单管理		6000	/crf_infos	3	\N	\N	2017-01-15 13:48:35.85	2017-01-15 13:48:35.85	1	0
12	用户列表		11000	#	2	\N	\N	2017-01-15 13:48:35.833	2017-01-15 13:48:35.833	1	0
11	角色管理		11000	#	1	\N	\N	2017-01-15 13:48:35.806	2017-01-15 13:48:35.806	1	0
9	菜单管理		6000	/menus	1	\N	\N	2017-01-15 13:48:35.764	2017-01-15 13:48:35.764	1	0
10	导出管理		6	/sys_exports	2	\N	\N	2017-01-15 13:48:35.783	2017-01-15 13:48:35.783	1	0
14	精确检索		6	/search_condition?reset=1	4	\N	\N	2017-01-15 13:48:35.877	2017-01-15 13:48:35.877	1	0
\.


--
-- Data for Name: menus_crf_infos; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY menus_crf_infos (id, menu_id, crf_info_id, created_at, updated_at, seq) FROM stdin;
6	15	23	2017-01-15 17:00:55.566	2017-01-15 17:00:55.566	1
1	15	11	2017-01-15 17:00:55.54	2017-01-15 17:00:55.54	2
5	15	22	2017-01-15 17:00:55.559	2017-01-15 17:00:55.559	3
3	15	20	2017-01-15 17:00:55.549	2017-01-15 17:00:55.549	5
2	15	14	2017-01-15 17:00:55.545	2017-01-15 17:00:55.545	7
7	15	24	2017-01-15 17:00:55.576	2017-01-15 17:00:55.576	6
8	15	25	2017-01-15 17:00:55.581	2017-01-15 17:00:55.581	8
9	15	32	2017-01-15 18:10:24.034	2017-01-15 18:10:24.034	9
\.


--
-- Name: menus_crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_crf_infos_id_seq', 9, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_id_seq', 15, true);


--
-- Data for Name: patient_visits; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patient_visits (id, patient_id, visiting_time, telephone, home_address, degree_of_education, occupation, responsible_doctor, person_filing, created_date, created_unit, marital_status, contact_name, contact_relationship, contact_address, contact_phone, visit_type, patient_source, admission_number, admission_date, discharge_date, outpatient_number, diagnostic_types, diagnostic_degree, diagnostic_anoxia, other_diseases, created_at, updated_at) FROM stdin;
1	1	2017-01-14	\N	\N	\N	\N	张三	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-01-15 15:28:23.483	2017-01-15 15:30:21.15
\.


--
-- Name: patient_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patient_visits_id_seq', 1, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patients (id, file_number, id_number, name, gender, birthday, nation, native_place, created_at, updated_at, file_type, birth_place, first_admission_date, family_name, contact_phone) FROM stdin;
1	10000	\N	王龙龙	男	2013-12-29	\N	\N	2017-01-15 15:28:23.432	2017-01-15 16:51:15.678	2	北京海淀	2017-01-01	王刚	13390123432
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patients_id_seq', 1, true);


--
-- Data for Name: public_libs; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY public_libs (id, table_name, item_name, item_text, item_value, pinyin, created_at, updated_at) FROM stdin;
\.


--
-- Name: public_libs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('public_libs_id_seq', 1, false);


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
20170115063436
20170115071532
20170115090508
20170212074002
20170212074332
20170212114410
\.


--
-- Data for Name: search_libs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY search_libs (id, field_name, host_table, correspond_field, correspond_field_value, note, patient_info_name, attached_field, attached_value, ha, ha_value, parent_table, parent_field, parent_release, created_at, updated_at, is_lib_public) FROM stdin;
1	姓名	patients	name	\N	string	\N	\N	\N	\N	\N	\N	\N	\N	2014-01-22 00:00:00	2014-01-22 00:00:00	f
3	出生日期	patients	birthday	\N	date	\N	\N	\N	\N	\N	\N	\N	\N	2014-01-22 00:00:00	2014-01-22 00:00:00	f
2	性别	patients	gender	\N	string	\N	\N	\N	\N	\N	\N	\N	\N	2014-01-22 00:00:00	2014-01-22 00:00:00	f
69	ID号	patients	file_number	\N	string	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-11 00:00:00	2014-03-11 00:00:00	f
\.


--
-- Name: search_libs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('search_libs_id_seq', 1, true);


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY sections (id, name, title, subtitle, seq, parent_id, crf_info_id, created_at, updated_at) FROM stdin;
56	孕母情况	孕母情况		\N	\N	11	2017-01-15 16:28:27.982	2017-01-15 16:28:27.982
57	生长发育	生长发育		\N	\N	11	2017-01-15 16:28:27.986	2017-01-15 16:28:27.986
184	首次发作	首次发作		\N	\N	32	2017-01-15 18:09:00.009	2017-01-15 18:09:00.009
114	脑电图检查	脑电图检查		\N	\N	20	2017-01-15 16:43:12.657	2017-01-15 16:43:12.657
185	后期发作情况（治疗前）	后期发作情况（治疗前）		\N	\N	32	2017-01-15 18:09:00.013	2017-01-15 18:09:00.013
186	临床诊断	临床诊断		\N	\N	32	2017-01-15 18:09:00.018	2017-01-15 18:09:00.018
187	首次抗癫痫药物治疗	首次抗癫痫药物治疗		\N	\N	32	2017-01-15 18:09:00.022	2017-01-15 18:09:00.022
188	调整用药	调整用药		\N	\N	32	2017-01-15 18:09:00.026	2017-01-15 18:09:00.026
189	增加药物/停用药物	增加药物/停用药物		\N	\N	32	2017-01-15 18:09:00.03	2017-01-15 18:09:00.03
190	后期发作情况（治疗后）	后期发作情况（治疗后）		\N	\N	32	2017-01-15 18:09:00.034	2017-01-15 18:09:00.034
191	目前用药情况	目前用药情况		\N	\N	32	2017-01-15 18:09:00.038	2017-01-15 18:09:00.038
192	手术情况	手术情况		\N	\N	32	2017-01-15 18:09:00.042	2017-01-15 18:09:00.042
124	既往史	既往史		\N	\N	22	2017-01-15 16:45:04.779	2017-01-15 16:45:04.779
125	1．纳入标准	1．纳入标准		\N	\N	23	2017-01-15 16:45:29.978	2017-01-15 16:45:29.978
126	2．排除标准	2．排除标准		\N	\N	23	2017-01-15 16:45:29.983	2017-01-15 16:45:29.983
127	结论	结论		\N	\N	23	2017-01-15 16:45:29.986	2017-01-15 16:45:29.986
128	头颅MRI检查	头颅MRI检查		\N	\N	24	2017-01-15 16:45:46.236	2017-01-15 16:45:46.236
129	遗传代谢病及基因检查	遗传代谢病及基因检查		\N	\N	25	2017-01-15 16:46:27.924	2017-01-15 16:46:27.924
76	发育评估	发育评估		\N	\N	14	2017-01-15 16:31:39.338	2017-01-15 16:31:39.338
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('sections_id_seq', 192, true);


--
-- Data for Name: sys_exports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sys_exports (id, field_zh_name, field_en_name, table_name, created_at, updated_at, crf_table_id, item_id) FROM stdin;
554	姓名	name	patient_infos	2017-02-14 13:40:14.602	2017-02-14 13:40:14.602	\N	\N
555	性别	gender	patient_infos	2017-02-14 13:40:14.61	2017-02-14 13:40:14.61	\N	\N
556	出生日期	birthday	patient_infos	2017-02-14 13:40:14.618	2017-02-14 13:40:14.618	\N	\N
557	ID号	file_number	patient_infos	2017-02-14 13:40:14.631	2017-02-14 13:40:14.631	\N	\N
558	首次发作时间                                         	fzjzl1	items	2017-02-14 13:40:14.642	2017-02-14 13:40:14.642	32	489
559	发作前状态或诱因	fzjzl2	items	2017-02-14 13:40:14.658	2017-02-14 13:40:14.658	32	490
560	其他	fzjzl3	items	2017-02-14 13:40:14.68	2017-02-14 13:40:14.68	32	491
561	发作时表现	fzjzl4	items	2017-02-14 13:40:14.699	2017-02-14 13:40:14.699	32	492
562	其他	fzjzl5	items	2017-02-14 13:40:14.717	2017-02-14 13:40:14.717	32	493
563	发作类型	fzjzl6	items	2017-02-14 13:40:14.742	2017-02-14 13:40:14.742	32	494
564	1.全面性发作	fzjzl7	items	2017-02-14 13:40:14.758	2017-02-14 13:40:14.758	32	495
565	2.部分性发作	fzjzl8	items	2017-02-14 13:40:14.777	2017-02-14 13:40:14.777	32	496
566	1.简单部分性发作	fzjzl9	items	2017-02-14 13:40:14.79	2017-02-14 13:40:14.79	32	497
567	2.复杂部分性发作	fzjzl10	items	2017-02-14 13:40:14.803	2017-02-14 13:40:14.803	32	498
568	3.继发全面性发作	fzjzl11	items	2017-02-14 13:40:14.818	2017-02-14 13:40:14.818	32	499
569	发作后表现	fzjzl12	items	2017-02-14 13:40:14.827	2017-02-14 13:40:14.827	32	500
570	其他	fzjzl13	items	2017-02-14 13:40:14.839	2017-02-14 13:40:14.839	32	501
571	发作后有无精神运动障碍或认知倒退	fzjzl14	items	2017-02-14 13:40:14.847	2017-02-14 13:40:14.847	32	502
572	发作频率	fzjzl15	items	2017-02-14 13:40:14.856	2017-02-14 13:40:14.856	32	503
573	1.0	fzjzl16	items	2017-02-14 13:40:14.868	2017-02-14 13:40:14.868	32	504
574	2.0	fzjzl17	items	2017-02-14 13:40:14.879	2017-02-14 13:40:14.879	32	505
575	3.0	fzjzl18	items	2017-02-14 13:40:14.891	2017-02-14 13:40:14.891	32	506
576	4.0	fzjzl19	items	2017-02-14 13:40:14.901	2017-02-14 13:40:14.901	32	507
577	发作时表现	fzjzl20	items	2017-02-14 13:40:14.91	2017-02-14 13:40:14.91	32	508
578	其他	fzjzl21	items	2017-02-14 13:40:14.921	2017-02-14 13:40:14.921	32	509
579	发作类型	fzjzl22	items	2017-02-14 13:40:14.936	2017-02-14 13:40:14.936	32	510
580	1.全面性发作	fzjzl23	items	2017-02-14 13:40:14.951	2017-02-14 13:40:14.951	32	511
581	2.部分性发作	fzjzl24	items	2017-02-14 13:40:14.961	2017-02-14 13:40:14.961	32	512
582	1.简单部分性发作	fzjzl25	items	2017-02-14 13:40:14.97	2017-02-14 13:40:14.97	32	513
583	2.复杂部分性发作	fzjzl26	items	2017-02-14 13:40:14.98	2017-02-14 13:40:14.98	32	514
584	3.继发全面性发作	fzjzl27	items	2017-02-14 13:40:15	2017-02-14 13:40:15	32	515
585	临床诊断	fzjzl28	items	2017-02-14 13:40:15.028	2017-02-14 13:40:15.028	32	516
586	是否癫痫综合征	fzjzl29	items	2017-02-14 13:40:15.062	2017-02-14 13:40:15.062	32	517
587	综合征种类	fzjzl30	items	2017-02-14 13:40:15.079	2017-02-14 13:40:15.079	32	518
588	其他	fzjzl31	items	2017-02-14 13:40:15.117	2017-02-14 13:40:15.117	32	519
589	首次用药日期	fzjzl32	items	2017-02-14 13:40:15.139	2017-02-14 13:40:15.139	32	520
590	增加药物日期	fzjzl38	items	2017-02-14 13:40:15.157	2017-02-14 13:40:15.157	32	527
591	停用药物日期	fzjzl41	items	2017-02-14 13:40:15.185	2017-02-14 13:40:15.185	32	531
592	停用药物	fzjzl42	items	2017-02-14 13:40:15.289	2017-02-14 13:40:15.289	32	532
593	发作频率	fzjzl43	items	2017-02-14 13:40:15.322	2017-02-14 13:40:15.322	32	533
594	1.0	fzjzl44	items	2017-02-14 13:40:15.341	2017-02-14 13:40:15.341	32	534
595	2.0	fzjzl45	items	2017-02-14 13:40:15.352	2017-02-14 13:40:15.352	32	535
596	3.0	fzjzl46	items	2017-02-14 13:40:15.362	2017-02-14 13:40:15.362	32	536
597	4.0	fzjzl47	items	2017-02-14 13:40:15.37	2017-02-14 13:40:15.37	32	537
598	发作时表现	fzjzl48	items	2017-02-14 13:40:15.378	2017-02-14 13:40:15.378	32	538
599	其他	fzjzl49	items	2017-02-14 13:40:15.386	2017-02-14 13:40:15.386	32	539
600	发作类型	fzjzl50	items	2017-02-14 13:40:15.398	2017-02-14 13:40:15.398	32	540
601	1.全面性发作	fzjzl51	items	2017-02-14 13:40:15.416	2017-02-14 13:40:15.416	32	541
602	2.部分性发作	fzjzl52	items	2017-02-14 13:40:15.429	2017-02-14 13:40:15.429	32	542
603	1.简单部分性发作	fzjzl53	items	2017-02-14 13:40:15.437	2017-02-14 13:40:15.437	32	543
604	2.复杂部分性发作	fzjzl54	items	2017-02-14 13:40:15.446	2017-02-14 13:40:15.446	32	544
605	3.继发全面性发作	fzjzl55	items	2017-02-14 13:40:15.454	2017-02-14 13:40:15.454	32	545
606	手术情况	fzjzl64	items	2017-02-14 13:40:15.464	2017-02-14 13:40:15.464	32	554
607	术前评估	fzjzl65	items	2017-02-14 13:40:15.474	2017-02-14 13:40:15.474	32	555
608	脑电图检查日期	fzjzl66	items	2017-02-14 13:40:15.484	2017-02-14 13:40:15.484	32	556
609	结果	fzjzl67	items	2017-02-14 13:40:15.497	2017-02-14 13:40:15.497	32	557
610	具体结果	fzjzl68	items	2017-02-14 13:40:15.509	2017-02-14 13:40:15.509	32	558
611	头颅MRI检查日期	fzjzl69	items	2017-02-14 13:40:15.517	2017-02-14 13:40:15.517	32	559
612	结果	fzjzl70	items	2017-02-14 13:40:15.525	2017-02-14 13:40:15.525	32	560
613	具体结果	fzjzl71	items	2017-02-14 13:40:15.533	2017-02-14 13:40:15.533	32	561
614	手术日期	fzjzl72	items	2017-02-14 13:40:15.542	2017-02-14 13:40:15.542	32	562
615	手术方式	fzjzl73	items	2017-02-14 13:40:15.548	2017-02-14 13:40:15.548	32	563
616	并发症	fzjzl74	items	2017-02-14 13:40:15.556	2017-02-14 13:40:15.556	32	564
617	具体	fzjzl75	items	2017-02-14 13:40:15.566	2017-02-14 13:40:15.566	32	565
618	术后病理结果	fzjzl76	items	2017-02-14 13:40:15.573	2017-02-14 13:40:15.573	32	566
619	其他	fzjzl421	items	2017-02-14 13:40:15.58	2017-02-14 13:40:15.58	32	624
\.


--
-- Name: sys_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sys_exports_id_seq', 619, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY users (id, email, encrypted_password, username, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
2	972567915@qq.com	$2a$11$LbF2263U5itJhTbt3SDj2Ofo4nxN0u79mc2v9H21pRjeQRP1v9vUq	admin2	\N	\N	\N	2	2016-10-16 15:15:11.584	2016-10-16 14:59:58.768	::1	::1	2016-10-16 14:59:58.752	2016-10-16 15:15:11.628
3	976315586@qq.com	$2a$11$S6xbv8ujD6sEuLym2VMbLefCm3Ewp6A2Hfi/8zDfdasn4tfhqvYvG	admin3	\N	\N	\N	2	2016-10-16 22:38:50.16	2016-10-16 22:24:17.505	::1	::1	2016-10-16 22:24:17.444	2016-10-16 22:39:59.943
1	wylszz@sina.cn	$2a$11$B.CX1qPIHc/2ZKjcseNrl.ak6yAVK2GfCNlXmG/OmudhaXzFGMOqy	admin	\N	\N	\N	92	2017-02-14 11:13:18.924	2017-02-12 13:13:34.18	::1	::1	2016-10-14 08:58:27.544	2017-02-14 11:13:18.958
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
-- Name: item_value_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY item_value_orders
    ADD CONSTRAINT item_value_orders_pkey PRIMARY KEY (id);


--
-- Name: item_values_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY item_values
    ADD CONSTRAINT item_values_pkey PRIMARY KEY (id);


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
-- Name: search_libs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY search_libs
    ADD CONSTRAINT search_libs_pkey PRIMARY KEY (id);


--
-- Name: sections_pkey; Type: CONSTRAINT; Schema: public; Owner: wangyunlei; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: sys_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sys_exports
    ADD CONSTRAINT sys_exports_pkey PRIMARY KEY (id);


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

