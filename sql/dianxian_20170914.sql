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
    updated_at timestamp without time zone NOT NULL,
    parent_id integer
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
-- Name: observes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE observes (
    id integer NOT NULL,
    observe_date date,
    patient_id integer,
    patient_visit_id integer,
    observe_hour integer,
    drug character varying,
    attack integer,
    cause character varying,
    sleep_info character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    observe_minute integer,
    other_drug character varying,
    has_before_cause integer,
    attack_show character varying,
    duration character varying,
    duration_time integer,
    environment_change character varying
);


ALTER TABLE observes OWNER TO postgres;

--
-- Name: observes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE observes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE observes_id_seq OWNER TO postgres;

--
-- Name: observes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE observes_id_seq OWNED BY observes.id;


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observes ALTER COLUMN id SET DEFAULT nextval('observes_id_seq'::regclass);


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
22	既往史	既往史	\N	\N	\N	2017-01-15 16:45:04.756	2017-01-15 16:45:04.756
23	入组筛选表	入组筛选表	\N	\N	\N	2017-01-15 16:45:29.95	2017-01-15 16:45:29.95
24	头颅MRI检查	头颅MRI检查	\N	\N	\N	2017-01-15 16:45:46.207	2017-01-15 16:45:46.207
25	遗传代谢病及基因检查	遗传代谢病及基因检查	\N	\N	\N	2017-01-15 16:46:27.902	2017-01-15 16:46:27.902
54	癫痫发作及诊治	癫痫发作及诊治	\N	\N	\N	2017-03-27 17:24:47.324	2017-03-27 17:24:47.324
55	脑电图检查	脑电图检查	\N	\N	\N	2017-03-28 05:25:56.439	2017-03-28 05:25:56.439
\.


--
-- Name: crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('crf_infos_id_seq', 55, true);


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
2650	\N	\N	2315	54	341			2641	\N	t	t		8	\N	2017-03-27 17:24:48.933	2017-03-27 17:24:48.933
2651	\N	\N	2316	54	341			2641	\N	t	t		9	\N	2017-03-27 17:24:48.968	2017-03-27 17:24:48.968
2652	\N	\N	2317	54	341			2641	\N	t	t		14	\N	2017-03-27 17:24:48.996	2017-03-27 17:24:48.996
2653	\N	\N	2318	54	341			2641	\N	t	t		15	\N	2017-03-27 17:24:49.024	2017-03-27 17:24:49.024
2654	\N	\N	2319	54	341			2641	\N	t	t		18	\N	2017-03-27 17:24:49.048	2017-03-27 17:24:49.048
2655	\N	\N	2320	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:49.065	2017-03-27 17:24:49.065
2656	\N	\N	2321	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:49.087	2017-03-27 17:24:49.087
2657	\N	\N	2322	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:49.13	2017-03-27 17:24:49.13
2658	\N	\N	2323	54	341			2657	\N	t	t		0	\N	2017-03-27 17:24:49.152	2017-03-27 17:24:49.152
2659	\N	\N	2324	54	341			2657	\N	t	t		1	\N	2017-03-27 17:24:49.175	2017-03-27 17:24:49.175
2660	\N	\N	2325	54	341			2659	\N	t	t		0	\N	2017-03-27 17:24:49.196	2017-03-27 17:24:49.196
2661	\N	\N	2326	54	341			2659	\N	t	t		1	\N	2017-03-27 17:24:49.214	2017-03-27 17:24:49.214
2662	\N	\N	2327	54	341			2659	\N	t	t		2	\N	2017-03-27 17:24:49.239	2017-03-27 17:24:49.239
2663	\N	\N	2328	54	342			\N	\N	t	t		0	\N	2017-03-27 17:24:49.254	2017-03-27 17:24:49.254
2664	\N	\N	2329	54	342			\N	\N	t	t		0	\N	2017-03-27 17:24:49.278	2017-03-27 17:24:49.278
2665	\N	\N	2330	54	342			2664	\N	t	t		0	\N	2017-03-27 17:24:49.313	2017-03-27 17:24:49.313
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
2666	\N	\N	2331	54	342			2665	\N	t	t		23	\N	2017-03-27 17:24:49.335	2017-03-27 17:24:49.335
2667	\N	\N	2332	54	343			\N	\N	t	t		0	\N	2017-03-27 17:24:49.352	2017-03-27 17:24:49.352
2668	\N	\N	\N	54	343			\N	\N	t	t		0	97	2017-03-27 17:24:49.376	2017-03-27 17:24:49.376
2669	\N	\N	\N	54	343			\N	\N	t	t		0	57	2017-03-27 17:24:49.576	2017-03-27 17:24:49.576
2670	\N	\N	\N	54	343			\N	\N	t	t		0	58	2017-03-27 17:24:49.753	2017-03-27 17:24:49.753
2671	\N	\N	\N	54	343			\N	\N	t	t		0	98	2017-03-27 17:24:49.938	2017-03-27 17:24:49.938
2672	\N	\N	\N	54	343			\N	\N	t	t		0	59	2017-03-27 17:24:50.009	2017-03-27 17:24:50.009
2673	\N	\N	2366	54	344			\N	\N	t	t		0	\N	2017-03-27 17:24:50.16	2017-03-27 17:24:50.16
2674	\N	\N	2367	54	344			2673	\N	t	t		1	\N	2017-03-27 17:24:50.185	2017-03-27 17:24:50.185
2675	\N	\N	2368	54	344			2673	\N	t	t		1	\N	2017-03-27 17:24:50.219	2017-03-27 17:24:50.219
2676	\N	\N	2369	54	344			2673	\N	t	t		1	\N	2017-03-27 17:24:50.242	2017-03-27 17:24:50.242
2677	\N	\N	2370	54	344			2676	\N	t	t		1	\N	2017-03-27 17:24:50.265	2017-03-27 17:24:50.265
2678	\N	\N	2371	54	344			2673	\N	t	t		1	\N	2017-03-27 17:24:50.288	2017-03-27 17:24:50.288
2679	\N	\N	2372	54	344			\N	\N	t	t		0	\N	2017-03-27 17:24:50.305	2017-03-27 17:24:50.305
2680	\N	\N	2373	54	344			2679	\N	t	t		1	\N	2017-03-27 17:24:50.336	2017-03-27 17:24:50.336
2681	\N	\N	2374	54	344			2679	\N	t	t		1	\N	2017-03-27 17:24:50.359	2017-03-27 17:24:50.359
2682	\N	\N	2375	54	344			2679	\N	t	t		1	\N	2017-03-27 17:24:50.381	2017-03-27 17:24:50.381
2683	\N	\N	2376	54	344			\N	\N	t	t		0	\N	2017-03-27 17:24:50.399	2017-03-27 17:24:50.399
2684	\N	\N	2377	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.421	2017-03-27 17:24:50.421
2685	\N	\N	2378	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.44	2017-03-27 17:24:50.44
2686	\N	\N	2379	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.46	2017-03-27 17:24:50.46
2687	\N	\N	2380	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.477	2017-03-27 17:24:50.477
2688	\N	\N	2381	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.494	2017-03-27 17:24:50.494
2689	\N	\N	2382	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.51	2017-03-27 17:24:50.51
2690	\N	\N	2383	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.532	2017-03-27 17:24:50.532
2691	\N	\N	2384	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.552	2017-03-27 17:24:50.552
2692	\N	\N	2385	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.572	2017-03-27 17:24:50.572
2693	\N	\N	2386	54	344			2683	\N	t	t		1	\N	2017-03-27 17:24:50.59	2017-03-27 17:24:50.59
2694	\N	\N	2387	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.61	2017-03-27 17:24:50.61
2695	\N	\N	2388	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.628	2017-03-27 17:24:50.628
2696	\N	\N	2389	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.645	2017-03-27 17:24:50.645
2697	\N	\N	2390	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.661	2017-03-27 17:24:50.661
2698	\N	\N	2391	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.679	2017-03-27 17:24:50.679
2699	\N	\N	2392	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.695	2017-03-27 17:24:50.695
2700	\N	\N	2393	54	344			2693	\N	t	t		0	\N	2017-03-27 17:24:50.711	2017-03-27 17:24:50.711
2701	\N	\N	2394	54	344			\N	\N	t	t		0	\N	2017-03-27 17:24:50.725	2017-03-27 17:24:50.725
2702	\N	\N	2395	54	344			2701	\N	t	t		0	\N	2017-03-27 17:24:50.745	2017-03-27 17:24:50.745
2601	\N	\N	2266	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:47.54	2017-03-27 17:24:47.54
2602	\N	\N	2267	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:47.562	2017-03-27 17:24:47.562
2603	\N	\N	2268	54	340			2602	\N	t	t		0	\N	2017-03-27 17:24:47.584	2017-03-27 17:24:47.584
2604	\N	\N	2269	54	340			2603	\N	t	t		12	\N	2017-03-27 17:24:47.606	2017-03-27 17:24:47.606
2605	\N	\N	2270	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:47.624	2017-03-27 17:24:47.624
2606	\N	\N	2271	54	340			2605	\N	t	t		4	\N	2017-03-27 17:24:47.657	2017-03-27 17:24:47.657
2607	\N	\N	2272	54	340			2605	\N	t	t		4	\N	2017-03-27 17:24:47.685	2017-03-27 17:24:47.685
2608	\N	\N	2273	54	340			2605	\N	t	t		4	\N	2017-03-27 17:24:47.759	2017-03-27 17:24:47.759
2609	\N	\N	2274	54	340			2605	\N	t	t		5	\N	2017-03-27 17:24:47.781	2017-03-27 17:24:47.781
2610	\N	\N	2275	54	340			2605	\N	t	t		5	\N	2017-03-27 17:24:47.802	2017-03-27 17:24:47.802
2611	\N	\N	2276	54	340			2605	\N	t	t		6	\N	2017-03-27 17:24:47.822	2017-03-27 17:24:47.822
2612	\N	\N	2277	54	340			2605	\N	t	t		6	\N	2017-03-27 17:24:47.854	2017-03-27 17:24:47.854
2613	\N	\N	2278	54	340			2605	\N	t	t		7	\N	2017-03-27 17:24:47.88	2017-03-27 17:24:47.88
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
2614	\N	\N	2279	54	340			2605	\N	t	t		8	\N	2017-03-27 17:24:47.914	2017-03-27 17:24:47.914
2615	\N	\N	2280	54	340			2605	\N	t	t		9	\N	2017-03-27 17:24:47.947	2017-03-27 17:24:47.947
2616	\N	\N	2281	54	340			2605	\N	t	t		14	\N	2017-03-27 17:24:47.978	2017-03-27 17:24:47.978
2617	\N	\N	2282	54	340			2605	\N	t	t		15	\N	2017-03-27 17:24:48.001	2017-03-27 17:24:48.001
2618	\N	\N	2283	54	340			2605	\N	t	t		18	\N	2017-03-27 17:24:48.021	2017-03-27 17:24:48.021
2619	\N	\N	2284	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.04	2017-03-27 17:24:48.04
2620	\N	\N	2285	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.065	2017-03-27 17:24:48.065
2621	\N	\N	2286	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.083	2017-03-27 17:24:48.083
2622	\N	\N	2287	54	340			2621	\N	t	t		0	\N	2017-03-27 17:24:48.115	2017-03-27 17:24:48.115
2623	\N	\N	2288	54	340			2621	\N	t	t		1	\N	2017-03-27 17:24:48.14	2017-03-27 17:24:48.14
2624	\N	\N	2289	54	340			2623	\N	t	t		0	\N	2017-03-27 17:24:48.166	2017-03-27 17:24:48.166
2625	\N	\N	2290	54	340			2623	\N	t	t		1	\N	2017-03-27 17:24:48.186	2017-03-27 17:24:48.186
2626	\N	\N	2291	54	340			2623	\N	t	t		2	\N	2017-03-27 17:24:48.208	2017-03-27 17:24:48.208
2627	\N	\N	2292	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.235	2017-03-27 17:24:48.235
2628	\N	\N	2293	54	340			2627	\N	t	t		9	\N	2017-03-27 17:24:48.305	2017-03-27 17:24:48.305
2629	\N	\N	2294	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.333	2017-03-27 17:24:48.333
2630	\N	\N	2295	54	340			\N	\N	t	t		0	\N	2017-03-27 17:24:48.358	2017-03-27 17:24:48.358
2632	\N	\N	2297	54	340			2631	\N	t	t		10	\N	2017-03-27 17:24:48.414	2017-03-27 17:24:48.414
2633	\N	\N	2298	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:48.437	2017-03-27 17:24:48.437
2634	\N	\N	2299	54	341			2633	\N	t	t		0	\N	2017-03-27 17:24:48.463	2017-03-27 17:24:48.463
2635	\N	\N	2300	54	341			2633	\N	t	t		1	\N	2017-03-27 17:24:48.49	2017-03-27 17:24:48.49
2636	\N	\N	2301	54	341			2633	\N	t	t		2	\N	2017-03-27 17:24:48.513	2017-03-27 17:24:48.513
2637	\N	\N	2302	54	341			2633	\N	t	t		3	\N	2017-03-27 17:24:48.543	2017-03-27 17:24:48.543
2638	\N	\N	2303	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:48.559	2017-03-27 17:24:48.559
2639	\N	\N	2304	54	341			2638	\N	t	t		0	\N	2017-03-27 17:24:48.581	2017-03-27 17:24:48.581
2640	\N	\N	2305	54	341			2639	\N	t	t		12	\N	2017-03-27 17:24:48.607	2017-03-27 17:24:48.607
2641	\N	\N	2306	54	341			\N	\N	t	t		0	\N	2017-03-27 17:24:48.627	2017-03-27 17:24:48.627
2642	\N	\N	2307	54	341			2641	\N	t	t		4	\N	2017-03-27 17:24:48.651	2017-03-27 17:24:48.651
2643	\N	\N	2308	54	341			2641	\N	t	t		4	\N	2017-03-27 17:24:48.694	2017-03-27 17:24:48.694
2644	\N	\N	2309	54	341			2641	\N	t	t		4	\N	2017-03-27 17:24:48.72	2017-03-27 17:24:48.72
2645	\N	\N	2310	54	341			2641	\N	t	t		5	\N	2017-03-27 17:24:48.749	2017-03-27 17:24:48.749
2646	\N	\N	2311	54	341			2641	\N	t	t		5	\N	2017-03-27 17:24:48.777	2017-03-27 17:24:48.777
2647	\N	\N	2312	54	341			2641	\N	t	t		6	\N	2017-03-27 17:24:48.803	2017-03-27 17:24:48.803
2648	\N	\N	2313	54	341			2641	\N	t	t		6	\N	2017-03-27 17:24:48.849	2017-03-27 17:24:48.849
2649	\N	\N	2314	54	341			2641	\N	t	t		7	\N	2017-03-27 17:24:48.903	2017-03-27 17:24:48.903
2703	\N	\N	2396	54	344			2701	\N	t	t		0	\N	2017-03-27 17:24:50.763	2017-03-27 17:24:50.763
2704	\N	\N	2397	54	344			2701	\N	t	t		0	\N	2017-03-27 17:24:50.782	2017-03-27 17:24:50.782
2705	\N	\N	2398	54	345			\N	\N	t	t		0	\N	2017-03-27 17:24:50.797	2017-03-27 17:24:50.797
2706	\N	\N	2399	54	345			\N	\N	t	t		0	\N	2017-03-27 17:24:50.811	2017-03-27 17:24:50.811
2707	\N	\N	2400	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.825	2017-03-27 17:24:50.825
2708	\N	\N	2401	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.84	2017-03-27 17:24:50.84
2709	\N	\N	2402	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.853	2017-03-27 17:24:50.853
2710	\N	\N	2403	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.866	2017-03-27 17:24:50.866
2711	\N	\N	2404	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.88	2017-03-27 17:24:50.88
2712	\N	\N	2405	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.894	2017-03-27 17:24:50.894
2713	\N	\N	2406	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.909	2017-03-27 17:24:50.909
2714	\N	\N	2407	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.921	2017-03-27 17:24:50.921
2715	\N	\N	2408	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.934	2017-03-27 17:24:50.934
2716	\N	\N	2409	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.953	2017-03-27 17:24:50.953
2717	\N	\N	2410	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:50.967	2017-03-27 17:24:50.967
2718	\N	\N	2411	54	346			2717	\N	t	t		1	\N	2017-03-27 17:24:50.985	2017-03-27 17:24:50.985
2719	\N	\N	2412	54	346			\N	\N	t	t		0	\N	2017-03-27 17:24:51	2017-03-27 17:24:51
2720	\N	\N	2413	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.659	2017-03-28 05:25:56.659
2721	\N	\N	2414	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.704	2017-03-28 05:25:56.704
2722	\N	\N	2415	55	347			\N	\N	t	t		1	\N	2017-03-28 05:25:56.757	2017-03-28 05:25:56.757
2723	\N	\N	2416	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.807	2017-03-28 05:25:56.807
2724	\N	\N	2417	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.843	2017-03-28 05:25:56.843
2725	\N	\N	2418	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.875	2017-03-28 05:25:56.875
2726	\N	\N	2419	55	347			\N	\N	t	t		0	\N	2017-03-28 05:25:56.904	2017-03-28 05:25:56.904
2727	\N	\N	2420	24	128			\N	\N	t	t		0	\N	2017-01-15 16:45:46.359	2017-01-15 16:45:46.359
2631	\N	\N	2296	54	340			2630	\N	t	t		0	\N	2017-03-27 17:24:48.385	2017-03-27 17:24:48.385
\.


--
-- Name: item_form_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_form_metaelements_id_seq', 2726, true);


--
-- Data for Name: item_group_metaelements; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_group_metaelements (id, no, parentno, item_group_id, crf_info_id, header, subheader, repeat_number, repeat_max, item_id, seq, show_group, repeating_group, options_index, created_at, updated_at, parent_id) FROM stdin;
646	\N	\N	97	54			\N	\N	2333	\N	\N	\N	\N	2017-03-27 17:24:49.414	2017-03-27 17:24:49.414	\N
647	\N	\N	97	54			\N	\N	2334	\N	\N	\N	\N	2017-03-27 17:24:49.434	2017-03-27 17:24:49.434	\N
648	\N	\N	97	54			\N	\N	2335	\N	\N	\N	\N	2017-03-27 17:24:49.454	2017-03-27 17:24:49.454	\N
649	\N	\N	97	54			\N	\N	2336	\N	\N	\N	\N	2017-03-27 17:24:49.473	2017-03-27 17:24:49.473	\N
650	\N	\N	97	54			\N	\N	2337	\N	\N	\N	\N	2017-03-27 17:24:49.495	2017-03-27 17:24:49.495	\N
651	\N	\N	97	54			\N	\N	2338	\N	\N	\N	\N	2017-03-27 17:24:49.531	2017-03-27 17:24:49.531	\N
652	\N	\N	97	54			\N	\N	2339	\N	\N	\N	\N	2017-03-27 17:24:49.556	2017-03-27 17:24:49.556	\N
653	\N	\N	57	54			\N	\N	2340	\N	\N	\N	\N	2017-03-27 17:24:49.582	2017-03-27 17:24:49.582	\N
654	\N	\N	57	54			\N	\N	2341	\N	\N	\N	\N	2017-03-27 17:24:49.607	2017-03-27 17:24:49.607	\N
655	\N	\N	57	54			\N	\N	2342	\N	\N	\N	\N	2017-03-27 17:24:49.629	2017-03-27 17:24:49.629	\N
656	\N	\N	57	54			\N	\N	2343	\N	\N	\N	\N	2017-03-27 17:24:49.649	2017-03-27 17:24:49.649	\N
657	\N	\N	57	54			\N	\N	2344	\N	\N	\N	\N	2017-03-27 17:24:49.668	2017-03-27 17:24:49.668	\N
658	\N	\N	57	54			\N	\N	2345	\N	\N	\N	\N	2017-03-27 17:24:49.689	2017-03-27 17:24:49.689	\N
659	\N	\N	57	54			\N	\N	2346	\N	\N	\N	\N	2017-03-27 17:24:49.714	2017-03-27 17:24:49.714	\N
660	\N	\N	57	54			\N	\N	2347	\N	\N	\N	\N	2017-03-27 17:24:49.734	2017-03-27 17:24:49.734	\N
661	\N	\N	58	54			\N	\N	2348	\N	\N	\N	\N	2017-03-27 17:24:49.76	2017-03-27 17:24:49.76	\N
662	\N	\N	58	54			\N	\N	2349	\N	\N	\N	\N	2017-03-27 17:24:49.782	2017-03-27 17:24:49.782	\N
663	\N	\N	58	54			\N	\N	2350	\N	\N	\N	\N	2017-03-27 17:24:49.803	2017-03-27 17:24:49.803	\N
664	\N	\N	58	54			\N	\N	2351	\N	\N	\N	\N	2017-03-27 17:24:49.821	2017-03-27 17:24:49.821	\N
665	\N	\N	58	54			\N	\N	2352	\N	\N	\N	\N	2017-03-27 17:24:49.838	2017-03-27 17:24:49.838	\N
666	\N	\N	58	54			\N	\N	2353	\N	\N	\N	\N	2017-03-27 17:24:49.857	2017-03-27 17:24:49.857	\N
667	\N	\N	58	54			\N	\N	2354	\N	\N	\N	\N	2017-03-27 17:24:49.874	2017-03-27 17:24:49.874	\N
668	\N	\N	58	54			\N	\N	2355	\N	\N	\N	\N	2017-03-27 17:24:49.893	2017-03-27 17:24:49.893	\N
669	\N	\N	98	54			\N	\N	2356	\N	\N	\N	\N	2017-03-27 17:24:49.945	2017-03-27 17:24:49.945	\N
670	\N	\N	98	54			\N	\N	2357	\N	\N	\N	\N	2017-03-27 17:24:49.966	2017-03-27 17:24:49.966	\N
671	\N	\N	98	54			\N	\N	2358	\N	\N	\N	\N	2017-03-27 17:24:49.991	2017-03-27 17:24:49.991	670
672	\N	\N	59	54			\N	\N	2359	\N	\N	\N	\N	2017-03-27 17:24:50.02	2017-03-27 17:24:50.02	\N
673	\N	\N	59	54			\N	\N	2360	\N	\N	\N	\N	2017-03-27 17:24:50.038	2017-03-27 17:24:50.038	\N
674	\N	\N	59	54			\N	\N	2361	\N	\N	\N	\N	2017-03-27 17:24:50.057	2017-03-27 17:24:50.057	\N
675	\N	\N	59	54			\N	\N	2362	\N	\N	\N	\N	2017-03-27 17:24:50.074	2017-03-27 17:24:50.074	\N
676	\N	\N	59	54			\N	\N	2363	\N	\N	\N	\N	2017-03-27 17:24:50.091	2017-03-27 17:24:50.091	\N
677	\N	\N	59	54			\N	\N	2364	\N	\N	\N	\N	2017-03-27 17:24:50.109	2017-03-27 17:24:50.109	\N
678	\N	\N	59	54			\N	\N	2365	\N	\N	\N	\N	2017-03-27 17:24:50.136	2017-03-27 17:24:50.136	\N
\.


--
-- Name: item_group_metaelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_group_metaelements_id_seq', 678, true);


--
-- Data for Name: item_groups; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_groups (id, name, description, created_at, updated_at) FROM stdin;
56	首次抗癫痫药物治疗	首次抗癫痫药物治疗	2017-01-15 16:44:48.645	2017-01-15 16:44:48.645
57	调整用药	调整用药	2017-01-15 16:44:48.65	2017-01-15 16:44:48.65
58	新增药物	新增药物	2017-01-15 16:44:48.655	2017-01-15 16:44:48.655
59	目前用药情况	目前用药情况	2017-01-15 16:44:48.66	2017-01-15 16:44:48.66
60	癫痫观察表	癫痫观察表	2017-01-15 16:44:48.666	2017-01-15 16:44:48.666
97	首次药物治疗	首次药物治疗	2017-03-27 16:14:56.788	2017-03-27 16:14:56.788
98	停用药物	停用药物	2017-03-27 16:14:56.801	2017-03-27 16:14:56.801
\.


--
-- Name: item_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_groups_id_seq', 98, true);


--
-- Data for Name: item_value_orders; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY item_value_orders (id, patient_id, patient_visit_id, complete, ordinal, user_id, history, status, crf_info_id, menus_crf_info_id, created_at, updated_at) FROM stdin;
4	1	1	\N	1	\N	\N	\N	22	5	2017-02-14 01:02:54.105	2017-02-14 01:02:54.105
6	1	1	\N	1	\N	\N	\N	23	6	2017-02-14 09:51:42.43	2017-02-14 09:51:42.43
7	1	1	\N	1	\N	\N	\N	11	1	2017-02-14 09:53:27.713	2017-02-14 09:53:27.713
8	1	1	\N	2	\N	\N	\N	22	5	2017-02-14 09:54:14.217	2017-02-14 09:54:14.217
10	1	1	\N	1	\N	\N	\N	24	7	2017-02-14 09:55:34.727	2017-02-14 09:55:34.727
11	1	1	\N	1	\N	\N	\N	14	2	2017-02-14 09:55:49.01	2017-02-14 09:55:49.01
12	1	1	\N	1	\N	\N	\N	25	8	2017-02-14 09:56:08.016	2017-02-14 09:56:08.016
13	1	1	\N	2	\N	\N	\N	32	9	2017-02-14 10:23:14.734	2017-02-14 10:23:14.734
15	1	1	\N	2	\N	\N	\N	23	6	2017-03-28 22:24:43.508	2017-03-28 22:24:43.508
17	2	2	\N	1	\N	\N	\N	11	1	2017-05-05 13:09:28.791	2017-05-05 13:09:28.791
18	2	2	\N	1	\N	\N	\N	24	7	2017-09-15 02:00:31.712	2017-09-15 02:00:31.712
\.


--
-- Name: item_value_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_value_orders_id_seq', 19, true);


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
359	599	否	1	6	1	15	2017-03-28 22:24:43.553	2017-03-28 22:24:43.553	\N	\N
360	600	否	1	6	1	15	2017-03-28 22:24:43.56	2017-03-28 22:24:43.56	\N	\N
361	601	否	1	6	1	15	2017-03-28 22:24:43.566	2017-03-28 22:24:43.566	\N	\N
362	602	否	1	6	1	15	2017-03-28 22:24:43.575	2017-03-28 22:24:43.575	\N	\N
363	603	否	1	6	1	15	2017-03-28 22:24:43.586	2017-03-28 22:24:43.586	\N	\N
364	604	否	1	6	1	15	2017-03-28 22:24:43.595	2017-03-28 22:24:43.595	\N	\N
365	605	否	1	6	1	15	2017-03-28 22:24:43.607	2017-03-28 22:24:43.607	\N	\N
366	606	否	1	6	1	15	2017-03-28 22:24:43.615	2017-03-28 22:24:43.615	\N	\N
453	184	1.自然受孕	2	1	2	17	2017-05-05 13:09:28.917	2017-05-05 13:09:28.917	\N	\N
454	185		2	1	2	17	2017-05-05 13:09:28.929	2017-05-05 13:09:28.929	\N	\N
455	186		2	1	2	17	2017-05-05 13:09:28.947	2017-05-05 13:09:28.947	\N	\N
456	187		2	1	2	17	2017-05-05 13:09:28.968	2017-05-05 13:09:28.968	\N	\N
457	188	1.有	2	1	2	17	2017-05-05 13:09:28.977	2017-05-05 13:09:28.977	\N	\N
458	189		2	1	2	17	2017-05-05 13:09:28.993	2017-05-05 13:09:28.993	\N	\N
459	190		2	1	2	17	2017-05-05 13:09:29.007	2017-05-05 13:09:29.007	\N	\N
460	191		2	1	2	17	2017-05-05 13:09:29.019	2017-05-05 13:09:29.019	\N	\N
461	193		2	1	2	17	2017-05-05 13:09:29.03	2017-05-05 13:09:29.03	\N	\N
462	195		2	1	2	17	2017-05-05 13:09:29.047	2017-05-05 13:09:29.047	\N	\N
463	196		2	1	2	17	2017-05-05 13:09:29.064	2017-05-05 13:09:29.064	\N	\N
464	197		2	1	2	17	2017-05-05 13:09:29.072	2017-05-05 13:09:29.072	\N	\N
465	200		2	1	2	17	2017-05-05 13:09:29.084	2017-05-05 13:09:29.084	\N	\N
466	202		2	1	2	17	2017-05-05 13:09:29.093	2017-05-05 13:09:29.093	\N	\N
467	203		2	1	2	17	2017-05-05 13:09:29.104	2017-05-05 13:09:29.104	\N	\N
468	206		2	1	2	17	2017-05-05 13:09:29.119	2017-05-05 13:09:29.119	\N	\N
469	207		2	1	2	17	2017-05-05 13:09:29.136	2017-05-05 13:09:29.136	\N	\N
470	208		2	1	2	17	2017-05-05 13:09:29.156	2017-05-05 13:09:29.156	\N	\N
471	209		2	1	2	17	2017-05-05 13:09:29.183	2017-05-05 13:09:29.183	\N	\N
472	210		2	1	2	17	2017-05-05 13:09:29.194	2017-05-05 13:09:29.194	\N	\N
473	211		2	1	2	17	2017-05-05 13:09:29.21	2017-05-05 13:09:29.21	\N	\N
474	212		2	1	2	17	2017-05-05 13:09:29.219	2017-05-05 13:09:29.219	\N	\N
475	213		2	1	2	17	2017-05-05 13:09:29.227	2017-05-05 13:09:29.227	\N	\N
476	214		2	1	2	17	2017-05-05 13:09:29.239	2017-05-05 13:09:29.239	\N	\N
477	215		2	1	2	17	2017-05-05 13:09:29.251	2017-05-05 13:09:29.251	\N	\N
478	217		2	1	2	17	2017-05-05 13:09:29.261	2017-05-05 13:09:29.261	\N	\N
479	218		2	1	2	17	2017-05-05 13:09:29.27	2017-05-05 13:09:29.27	\N	\N
480	219		2	1	2	17	2017-05-05 13:09:29.277	2017-05-05 13:09:29.277	\N	\N
481	220		2	1	2	17	2017-05-05 13:09:29.29	2017-05-05 13:09:29.29	\N	\N
482	221		2	1	2	17	2017-05-05 13:09:29.3	2017-05-05 13:09:29.3	\N	\N
517	608	09/05/2017	2	7	2	18	2017-09-15 02:00:31.797	2017-09-15 02:00:31.797	\N	\N
518	609	是	2	7	2	18	2017-09-15 02:00:31.805	2017-09-15 02:00:31.805	\N	\N
519	611		2	7	2	18	2017-09-15 02:00:31.814	2017-09-15 02:00:31.814	\N	\N
\.


--
-- Name: item_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('item_values_id_seq', 522, true);


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
2266	fzjzl1	首次发作时间                                         			首次发作时间                                         		\N	DATETIME	text						2017-03-27 17:24:47.492	2017-03-27 17:24:47.492
2267	fzjzla1	有无发作前状态或诱因			有无发作前状态或诱因		\N	ST	radio	1.有,2.无	1.有,2.无				2017-03-27 17:24:47.553	2017-03-27 17:24:47.553
2268	fzjzl2	发作前状态或诱因			发作前状态或诱因		\N	ST	checkbox	1.清醒,2.觉醒,3.觉醒-睡眠转换,3.睡眠,3.睡眠-觉醒转换,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他	1.清醒,2.觉醒,3.觉醒-睡眠转换,3.睡眠,3.睡眠-觉醒转换,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他				2017-03-27 17:24:47.568	2017-03-27 17:24:47.568
2269	fzjzl3	发作前状态或诱因其他			其他		\N	ST	text						2017-03-27 17:24:47.593	2017-03-27 17:24:47.593
2339	fzjzl343	首次抗癫痫药物治疗：用药时间点3			用药时间点3		\N	TIME	text						2017-03-27 17:24:49.54	2017-03-27 17:24:49.54
2391	fzjzl6611	调整方案后天／疗程			天／疗程		\N	INT	text						2017-03-27 17:24:50.667	2017-03-27 17:24:50.667
2392	fzjzl6612	调整方案后疗程／月			疗程／月		\N	INT	text						2017-03-27 17:24:50.684	2017-03-27 17:24:50.684
2393	fzjzl6613	调整方案后终止日期			终止日期		\N	DATE	text						2017-03-27 17:24:50.701	2017-03-27 17:24:50.701
576	jws10	4颅脑外伤			4颅脑外伤		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:05.009	2017-01-15 16:45:05.009
577	jws11	4颅脑外伤:发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:05.028	2017-01-15 16:45:05.028
578	jws12	损伤部位			损伤部位		\N	ST	radio	1.左侧,2.右侧,3.双侧	1.左侧,2.右侧,3.双侧				2017-01-15 16:45:05.047	2017-01-15 16:45:05.047
579	jws121	损伤部位1			损伤部位		\N	ST	radio	1.额部,2.颞部,3.顶部,4.枕部	1.额部,2.颞部,3.顶部,4.枕部				2017-01-15 16:45:05.065	2017-01-15 16:45:05.065
2270	fzjzl4	发作时表现			发作时表现		\N	ST	checkbox	1.先兆,2.意识清楚,3.意识模糊,4.意识丧失,5.肢体强直,6.肢体阵挛,7.肢体肌阵挛,8.躯干和肢体痉挛,9.口角阵挛,10.眼角阵挛,11.双眼凝视,12.双眼紧闭,13.牙关紧闭,14.流涎/吐沫,15.眼偏转,16.头偏转,17.发绀,18.大小便失禁,19.其他	1.先兆,2.意识清楚,3.意识模糊,4.意识丧失,5.肢体强直,6.肢体阵挛,7.肢体肌阵挛,8.躯干和肢体痉挛,9.口角阵挛,10.眼角阵挛,11.双眼凝视,12.双眼紧闭,13.牙关紧闭,14.流涎/吐沫,15.眼偏转,16.头偏转,17.发绀,18.大小便失禁,19.其他				2017-03-27 17:24:47.614	2017-03-27 17:24:47.614
2271	fzjzl4a4	1.肢体强直体侧			1.肢体强直体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:47.639	2017-03-27 17:24:47.639
2272	fzjzl4b4	2.肢体强直部位			2.肢体强直部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:47.667	2017-03-27 17:24:47.667
2273	fzjzl4c4	2.1肢体强直类型			2.1肢体强直类型		\N	ST	radio	伸直,屈曲	伸直,屈曲				2017-03-27 17:24:47.701	2017-03-27 17:24:47.701
2274	fzjzl4a5	1.肢体强直体侧			1.肢体阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:47.767	2017-03-27 17:24:47.767
2275	fzjzl4b5	2.肢体强直部位			2.肢体阵挛部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:47.789	2017-03-27 17:24:47.789
2276	fzjzl4a6	1.肢体肌阵挛体侧			1.肢体肌阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:47.809	2017-03-27 17:24:47.809
2277	fzjzl4b6	2.肢体肌阵挛部位			2.肢体肌阵挛部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:47.83	2017-03-27 17:24:47.83
2278	fzjzl4a7	躯干和肢体痉挛类型			躯干和肢体痉挛类型		\N	ST	radio	伸直,屈曲,伸直-屈曲	伸直,屈曲,伸直-屈曲				2017-03-27 17:24:47.865	2017-03-27 17:24:47.865
2279	fzjzl4a8	口角阵挛体侧			口角阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:47.888	2017-03-27 17:24:47.888
2280	fzjzl4a9	眼角阵挛体侧			眼角阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:47.923	2017-03-27 17:24:47.923
2281	fzjzl4a14	眼偏转方向			眼偏转方向		\N	ST	radio	左侧,右侧	左侧,右侧				2017-03-27 17:24:47.961	2017-03-27 17:24:47.961
2282	fzjzl4a15	头偏转方向			头偏转方向		\N	ST	radio	左侧,右侧	左侧,右侧				2017-03-27 17:24:47.985	2017-03-27 17:24:47.985
2283	fzjzl5	发作时表现:其他			其他		\N	ST	text						2017-03-27 17:24:48.009	2017-03-27 17:24:48.009
2284	fzjzl6a	持续时间			持续时间		\N	ST	radio	1.小于1分钟,2.1-5分钟,3.5-10分钟,4.10-20分钟,5.20-30分钟,6.大于30分钟	1.小于1分钟,2.1-5分钟,3.5-10分钟,4.10-20分钟,5.20-30分钟,6.大于30分钟				2017-03-27 17:24:48.031	2017-03-27 17:24:48.031
2285	fzjzl6b	具体持续时间			具体持续时间		\N	ST	text						2017-03-27 17:24:48.048	2017-03-27 17:24:48.048
2286	fzjzl6	发作类型			发作类型		\N	ST	checkbox	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作				2017-03-27 17:24:48.072	2017-03-27 17:24:48.072
2287	fzjzl7	1.全面性发作			1.全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作				2017-03-27 17:24:48.099	2017-03-27 17:24:48.099
2288	fzjzl8	2.部分性发作			2.部分性发作		\N	ST	checkbox	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作				2017-03-27 17:24:48.123	2017-03-27 17:24:48.123
2289	fzjzl9	1.简单部分性发作			1.简单部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-03-27 17:24:48.149	2017-03-27 17:24:48.149
2290	fzjzl10	2.复杂部分性发作			2.复杂部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-03-27 17:24:48.172	2017-03-27 17:24:48.172
2291	fzjzl11	3.继发全面性发作			3.继发全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作				2017-03-27 17:24:48.193	2017-03-27 17:24:48.193
2292	fzjzl12	发作后表现			发作后表现		\N	ST	checkbox	1.清醒,2.烦躁,3.嗜睡 ,4.朦胧状态,5.Todd氏麻痹,6.失语,7.遗忘,8.头痛,9.肌肉酸痛,10.其他	1.清醒,2.烦躁,3.嗜睡 ,4.朦胧状态,5.Todd氏麻痹,6.失语,7.遗忘,8.头痛,9.肌肉酸痛,10.其他				2017-03-27 17:24:48.225	2017-03-27 17:24:48.225
2293	fzjzl13	发作后表现:其他			其他		\N	ST	text		0.0				2017-03-27 17:24:48.244	2017-03-27 17:24:48.244
2294	fzjzl14	发作后有无精神运动障碍或认知倒退			发作后有无精神运动障碍或认知倒退		\N	ST	radio	1.无 ,2.有	1.无 ,2.有				2017-03-27 17:24:48.317	2017-03-27 17:24:48.317
2295	fzjzl14a	是否存在癫痫合并症			是否存在癫痫合并症		\N	ST	radio	1.是,2.否	1.是,2.否				2017-03-27 17:24:48.344	2017-03-27 17:24:48.344
2296	fzjzl14b	癫痫合并症			癫痫合并症		\N	ST	checkbox	1.脑性瘫痪,2.脑发育不良,3.脑炎,4.自闭症,5.多动症,6.偏头痛,7.抑郁障碍,8.焦虑障碍,9.双相情感障碍,10.精神病性障碍,11.其他	1.脑性瘫痪,2.脑发育不良,3.脑炎,4.自闭症,5.多动症,6.偏头痛,7.抑郁障碍,8.焦虑障碍,9.双相情感障碍,10.精神病性障碍,11.其他				2017-03-27 17:24:48.367	2017-03-27 17:24:48.367
2297	fzjzl14c	其他癫痫合并症			其他癫痫合并症		\N	ST	text						2017-03-27 17:24:48.396	2017-03-27 17:24:48.396
2298	fzjzl15	发作频率			发作频率		\N	ST	radio	次/天,次/周,次/月,次/年	次/天,次/周,次/月,次/年				2017-03-27 17:24:48.426	2017-03-27 17:24:48.426
2303	fzjzlha1	有无发作前状态或诱因			有无发作前状态或诱因		\N	ST	radio	1.有,2.无	1.有,2.无				2017-03-27 17:24:48.549	2017-03-27 17:24:48.549
2304	fzjzlh2	发作前状态或诱因			发作前状态或诱因		\N	ST	checkbox	1.清醒,2.觉醒,3.觉醒-睡眠转换,3.睡眠,3.睡眠-觉醒转换,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他	1.清醒,2.觉醒,3.觉醒-睡眠转换,3.睡眠,3.睡眠-觉醒转换,4.少眠,5.过度疲劳,6.心理压力,7.精神刺激,8.发热,9.运动,10.进食,11.其他				2017-03-27 17:24:48.568	2017-03-27 17:24:48.568
2305	fzjzlh3	发作前状态或诱因其他			其他		\N	ST	text						2017-03-27 17:24:48.589	2017-03-27 17:24:48.589
2388	fzjzl6608	调整方案后刺激量	MT		刺激量		\N	INT	text						2017-03-27 17:24:50.616	2017-03-27 17:24:50.616
2389	fzjzl6609	调整方案后刺激频率	Hz		刺激频率		\N	INT	text						2017-03-27 17:24:50.633	2017-03-27 17:24:50.633
2300	fzjzl17	发作频率：2	次/周		2.0		\N	ST	text		\N				2017-03-27 17:24:48.474	2017-03-27 17:24:48.474
2301	fzjzl18	发作频率：3	次/月		3.0		\N	ST	text		\N				2017-03-27 17:24:48.499	2017-03-27 17:24:48.499
2302	fzjzl19	发作频率：4	次/年		4.0		\N	ST	text		\N				2017-03-27 17:24:48.521	2017-03-27 17:24:48.521
2306	fzjzlh4	发作时表现			发作时表现		\N	ST	checkbox	1.先兆,2.意识清楚,3.意识模糊,4.意识丧失,5.肢体强直,6.肢体阵挛,7.肢体肌阵挛,8.躯干和肢体痉挛,9.口角阵挛,10.眼角阵挛,11.双眼凝视,12.双眼紧闭,13.牙关紧闭,14.流涎/吐沫,15.眼偏转,16.头偏转,17.发绀,18.大小便失禁,19.其他	1.先兆,2.意识清楚,3.意识模糊,4.意识丧失,5.肢体强直,6.肢体阵挛,7.肢体肌阵挛,8.躯干和肢体痉挛,9.口角阵挛,10.眼角阵挛,11.双眼凝视,12.双眼紧闭,13.牙关紧闭,14.流涎/吐沫,15.眼偏转,16.头偏转,17.发绀,18.大小便失禁,19.其他				2017-03-27 17:24:48.616	2017-03-27 17:24:48.616
2307	fzjzlh4a4	1.肢体强直体侧			1.肢体强直体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:48.636	2017-03-27 17:24:48.636
2308	fzjzlh4b4	2.肢体强直部位			2.肢体强直部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:48.674	2017-03-27 17:24:48.674
2309	fzjzlh4c4	2.1肢体强直类型			2.1肢体强直类型		\N	ST	radio	伸直,屈曲	伸直,屈曲				2017-03-27 17:24:48.701	2017-03-27 17:24:48.701
2310	fzjzlh4a5	1.肢体强直体侧			1.肢体阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:48.73	2017-03-27 17:24:48.73
2311	fzjzlh4b5	2.肢体强直部位			2.肢体阵挛部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:48.759	2017-03-27 17:24:48.759
2312	fzjzlh4a6	1.肢体肌阵挛体侧			1.肢体肌阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:48.787	2017-03-27 17:24:48.787
2313	fzjzlh4b6	2.肢体肌阵挛部位			2.肢体肌阵挛部位		\N	ST	radio	上肢,下肢,上下肢	上肢,下肢,上下肢				2017-03-27 17:24:48.816	2017-03-27 17:24:48.816
2314	fzjzlh4a7	躯干和肢体痉挛类型			躯干和肢体痉挛类型		\N	ST	radio	伸直,屈曲,伸直-屈曲	伸直,屈曲,伸直-屈曲				2017-03-27 17:24:48.858	2017-03-27 17:24:48.858
2315	fzjzlh4a8	口角阵挛体侧			口角阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:48.912	2017-03-27 17:24:48.912
2316	fzjzlh4a9	眼角阵挛体侧			眼角阵挛体侧		\N	ST	radio	左侧,右侧,双侧	左侧,右侧,双侧				2017-03-27 17:24:48.946	2017-03-27 17:24:48.946
2317	fzjzlh4a14	眼偏转方向			眼偏转方向		\N	ST	radio	左侧,右侧	左侧,右侧				2017-03-27 17:24:48.976	2017-03-27 17:24:48.976
2318	fzjzlh4a15	头偏转方向			头偏转方向		\N	ST	radio	左侧,右侧	左侧,右侧				2017-03-27 17:24:49.005	2017-03-27 17:24:49.005
2319	fzjzlh5	发作时表现:其他			其他		\N	ST	text						2017-03-27 17:24:49.033	2017-03-27 17:24:49.033
2320	fzjzlh6a	持续时间			持续时间		\N	ST	radio	1.小于1分钟,2.1-5分钟,3.5-10分钟,4.10-20分钟,5.20-30分钟,6.大于30分钟	1.小于1分钟,2.1-5分钟,3.5-10分钟,4.10-20分钟,5.20-30分钟,6.大于30分钟				2017-03-27 17:24:49.056	2017-03-27 17:24:49.056
2321	fzjzlh6b	具体持续时间			具体持续时间		\N	ST	text						2017-03-27 17:24:49.072	2017-03-27 17:24:49.072
2322	fzjzl22	发作类型			发作类型		\N	ST	checkbox	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作	1.全面性发作,2.部分性发作,3.癫痫性痉挛,4.反射性发作				2017-03-27 17:24:49.118	2017-03-27 17:24:49.118
2323	fzjzl23	治疗前1.全面性发作			1.全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作	1.全面性强直阵挛发作,2.典型失神发作,3.不典型失神发作,4.肌阵挛失神,5.失神伴眼睑肌阵挛,6.强直发作,7.阵挛发作,8.肌阵挛发作,9.失张力发作				2017-03-27 17:24:49.136	2017-03-27 17:24:49.136
2324	fzjzl24	治疗前2.部分性发作			2.部分性发作		\N	ST	checkbox	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作	1.简单部分性发作,2.复杂部分性发作,3.继发全面性发作				2017-03-27 17:24:49.161	2017-03-27 17:24:49.161
2325	fzjzl25	治疗前1.简单部分性发作			1.简单部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-03-27 17:24:49.182	2017-03-27 17:24:49.182
2326	fzjzl26	治疗前2.复杂部分性发作			2.复杂部分性发作		\N	ST	checkbox	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作	1.运动性发作,2.感觉性发作,3.自主神经性发作,4.精神性发作				2017-03-27 17:24:49.202	2017-03-27 17:24:49.202
2327	fzjzl27	治疗前3.继发全面性发作			3.继发全面性发作		\N	ST	checkbox	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作	1.全面性强直阵挛发作,2.强直发作,2.阵挛发作				2017-03-27 17:24:49.22	2017-03-27 17:24:49.22
2328	fzjzl28	临床诊断			临床诊断		\N	ST	text		0.0				2017-03-27 17:24:49.245	2017-03-27 17:24:49.245
2329	fzjzl29	是否癫痫综合征			是否癫痫综合征		\N	ST	radio	1.是,2.否	1.是,2.否				2017-03-27 17:24:49.265	2017-03-27 17:24:49.265
2330	fzjzl30	综合征种类			综合征种类		\N	ST	checkbox	1.良性家族性新生儿癫痫,2.良性婴儿癫痫,3.早期肌阵挛脑病,4.大田原综合征,5.良性婴儿肌阵挛性癫痫,6.Dravet综合征,7.婴儿痉挛症,8.Lennox-Gastaut征,9.Doose综合征,10.儿童良性癫痫伴中央颞区棘波,11.儿童失神癫痫,12.早发性儿童良性枕叶癫痫,13.晚发性儿童枕叶癫痫,14.Landau-Kleffner综合征,15.癫痫性脑病伴慢波睡眠期持续棘慢波,16.青少年失神癫痫,17.青少年肌阵挛癫痫,18.仅有全面强直-阵挛发作性癫痫,19.遗传性癫痫伴热性惊厥附加症,20.肌阵挛失神癫痫,22.颞叶癫痫,23.额叶癫痫,24.进行性肌阵挛癫痫,其他	1.良性家族性新生儿癫痫,2.良性婴儿癫痫,3.早期肌阵挛脑病,4.大田原综合征,5.良性婴儿肌阵挛性癫痫,6.Dravet综合征,7.婴儿痉挛症,8.Lennox-Gastaut征,9.Doose综合征,10.儿童良性癫痫伴中央颞区棘波,11.儿童失神癫痫,12.早发性儿童良性枕叶癫痫,13.晚发性儿童枕叶癫痫,14.Landau-Kleffner综合征,15.癫痫性脑病伴慢波睡眠期持续棘慢波,16.青少年失神癫痫,17.青少年肌阵挛癫痫,18.仅有全面强直-阵挛发作性癫痫,19.遗传性癫痫伴热性惊厥附加症,20.肌阵挛失神癫痫,22.颞叶癫痫,23.额叶癫痫,24.进行性肌阵挛癫痫,其他				2017-03-27 17:24:49.294	2017-03-27 17:24:49.294
2331	fzjzl31	其他			其他		\N	ST	text		0.0				2017-03-27 17:24:49.32	2017-03-27 17:24:49.32
567	jws1	1产伤                                      			1产伤                                      		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.81	2017-01-15 16:45:04.81
568	jws2	2黄疸			2黄疸		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.851	2017-01-15 16:45:04.851
569	jws3	出现黄疸时间			出现黄疸时间		\N	DATE	text						2017-01-15 16:45:04.869	2017-01-15 16:45:04.869
570	jws4	最高总胆红素			最高总胆红素		\N	ST	text		0.0				2017-01-15 16:45:04.888	2017-01-15 16:45:04.888
571	jws5	光疗			光疗		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.906	2017-01-15 16:45:04.906
572	jws6	换血			换血		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.924	2017-01-15 16:45:04.924
573	jws7	3热性惊厥			3热性惊厥		\N	ST	radio	1.无,2.有	1.无,2.有				2017-01-15 16:45:04.951	2017-01-15 16:45:04.951
574	jws8	发病时间			发病时间		\N	DATE	text		0.0				2017-01-15 16:45:04.968	2017-01-15 16:45:04.968
575	jws9	治疗情况			治疗情况		\N	ST	text		0.0				2017-01-15 16:45:04.988	2017-01-15 16:45:04.988
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
2332	fzjzl32	首次用药日期			首次用药日期		\N	DATE	text		0.0				2017-03-27 17:24:49.342	2017-03-27 17:24:49.342
2333	fzjzl33	首次抗癫痫药物治疗：药物名称			药物名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他				2017-03-27 17:24:49.361	2017-03-27 17:24:49.361
192	bba17	分娩方式			分娩方式		\N	ST	radio	1.顺产,2.剖宫产	1.顺产,2.剖宫产				2017-01-15 16:28:28.294	2017-01-15 16:28:28.294
2334	fzjzl331	首次抗癫痫药物治疗：用量			用量		\N	ST	text		0.0				2017-03-27 17:24:49.42	2017-03-27 17:24:49.42
2335	fzjzl332	首次抗癫痫药物治疗：用量单位			用量单位		\N	ST	single-select	mg,ml,g	mg,ml,g				2017-03-27 17:24:49.441	2017-03-27 17:24:49.441
2336	fzjzl34	首次抗癫痫药物治疗：频次			频次		\N	ST	single-select	1次/天,2次/天,3次/天	1次/天,2次/天,3次/天				2017-03-27 17:24:49.462	2017-03-27 17:24:49.462
2337	fzjzl341	首次抗癫痫药物治疗：用药时间点1			用药时间点1		\N	TIME	text						2017-03-27 17:24:49.48	2017-03-27 17:24:49.48
2338	fzjzl342	首次抗癫痫药物治疗：用药时间点2			用药时间点2		\N	TIME	text						2017-03-27 17:24:49.511	2017-03-27 17:24:49.511
2390	fzjzl6610	调整方案后次/天			次/天		\N	INT	text						2017-03-27 17:24:50.65	2017-03-27 17:24:50.65
2340	fzjzl35	调整用药:药物名称			药物名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他				2017-03-27 17:24:49.564	2017-03-27 17:24:49.564
2341	fzjzl36	调整时间			调整时间		\N	DATE	text		0.0				2017-03-27 17:24:49.59	2017-03-27 17:24:49.59
2342	fzjzl37	调整后用量			用量		\N	ST	text		0.0				2017-03-27 17:24:49.614	2017-03-27 17:24:49.614
2343	fzjzl371	调整后用量单位			用量单位		\N	ST	single-select	mg,ml,g	mg,ml,g				2017-03-27 17:24:49.635	2017-03-27 17:24:49.635
2344	fzjzl372	调整后用药频次			用药频次		\N	ST	single-select	1次/天,2次/天,3次/天	1次/天,2次/天,3次/天				2017-03-27 17:24:49.655	2017-03-27 17:24:49.655
2345	fzjzl373	调整后用药时间点1			用药时间点1		\N	TIME	text						2017-03-27 17:24:49.675	2017-03-27 17:24:49.675
2346	fzjzl374	调整后用药时间点2			用药时间点2		\N	TIME	text						2017-03-27 17:24:49.695	2017-03-27 17:24:49.695
2347	fzjzl375	调整后用药时间点3			用药时间点3		\N	TIME	text						2017-03-27 17:24:49.721	2017-03-27 17:24:49.721
2348	fzjzl38	新增药物名称			新增药物名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他				2017-03-27 17:24:49.741	2017-03-27 17:24:49.741
2349	fzjzl39	新增药物时间			新增药物时间		\N	DATE	text						2017-03-27 17:24:49.767	2017-03-27 17:24:49.767
2350	fzjzl391	新增药物用量			用量		\N	ST	text						2017-03-27 17:24:49.789	2017-03-27 17:24:49.789
2351	fzjzl392	新增药物用量单位			用量单位		\N	ST	single-select	mg,ml,g	mg,ml,g				2017-03-27 17:24:49.809	2017-03-27 17:24:49.809
2352	fzjzl393	新增药物用药频次			用药频次		\N	ST	single-select	1次/天,2次/天,3次/天	1次/天,2次/天,3次/天				2017-03-27 17:24:49.826	2017-03-27 17:24:49.826
2353	fzjzl401	新增药物:用药时间点1			用药时间点1		\N	TIME	text		0.0				2017-03-27 17:24:49.844	2017-03-27 17:24:49.844
2354	fzjzl402	新增药物:用药时间点2			用药时间点2		\N	TIME	text						2017-03-27 17:24:49.863	2017-03-27 17:24:49.863
2355	fzjzl403	新增药物:用药时间点3			用药时间点3		\N	TIME	text						2017-03-27 17:24:49.88	2017-03-27 17:24:49.88
2356	fzjzl41	停用药物日期			停用药物日期		\N	DATE	text		0.0				2017-03-27 17:24:49.899	2017-03-27 17:24:49.899
2357	fzjzl42	停用药物			停用药物		\N	ST	checkbox	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,13其他				2017-03-27 17:24:49.953	2017-03-27 17:24:49.953
2358	fzjzl421	停用药物:其他			其他		\N	ST	text						2017-03-27 17:24:49.973	2017-03-27 17:24:49.973
2359	fzjzl56	目前用药:用药名称			用药名称		\N	ST	single-select	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他	1.丙戊酸钠,2.左乙拉西坦,3.拉莫三嗪,4.奥卡西平,5.卡马西平,6.托吡酯,7.氯硝西泮,8.苯巴比妥,9.苯妥英钠,10.加巴喷丁,11.扑痫酮,12.唑尼沙胺,其他				2017-03-27 17:24:49.997	2017-03-27 17:24:49.997
2360	fzjzl57	目前用药:用量			用量		\N	ST	text		0.0				2017-03-27 17:24:50.026	2017-03-27 17:24:50.026
2361	fzjzl58	目前用药:用量单位			用量单位		\N	ST	single-select	mg,ml,g	mg,ml,g				2017-03-27 17:24:50.045	2017-03-27 17:24:50.045
2362	fzjzl581	目前用药:用药频次			用药频次		\N	ST	single-select	1次/天,2次/天,3次/天	1次/天,2次/天,3次/天				2017-03-27 17:24:50.062	2017-03-27 17:24:50.062
2363	fzjzl582	目前用药:用药时间点1			用药时间点1		\N	TIME	text						2017-03-27 17:24:50.079	2017-03-27 17:24:50.079
2364	fzjzl583	目前用药:用药时间点2			用药时间点2		\N	TIME	text						2017-03-27 17:24:50.097	2017-03-27 17:24:50.097
2365	fzjzl584	目前用药:用药时间点3			用药时间点3		\N	TIME	text						2017-03-27 17:24:50.117	2017-03-27 17:24:50.117
2366	fzjzl59	5.1．外科（手术）			5.1．外科（手术）		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.146	2017-03-27 17:24:50.146
2367	fzjzl60	手术日期			手术日期		\N	DATE	text						2017-03-27 17:24:50.169	2017-03-27 17:24:50.169
2368	fzjzl61	手术方式			手术方式		\N	ST	text						2017-03-27 17:24:50.198	2017-03-27 17:24:50.198
2369	fzjzl62	并发症			并发症		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.228	2017-03-27 17:24:50.228
2370	fzjzl63	具体并发症			具体并发症		\N	ST	text						2017-03-27 17:24:50.25	2017-03-27 17:24:50.25
2371	fzjzl6591	术后病理结果			术后病理结果		\N	ST	text						2017-03-27 17:24:50.275	2017-03-27 17:24:50.275
2373	fzjzl6593	手术日期			手术日期		\N	ST	text						2017-03-27 17:24:50.313	2017-03-27 17:24:50.313
2374	fzjzl6594	是否仍在进行			是否仍在进行		\N	ST	radio	1.是,2.否	1.是,2.否				2017-03-27 17:24:50.345	2017-03-27 17:24:50.345
2375	fzjzl6595	终止日期			终止日期		\N	ST	text						2017-03-27 17:24:50.366	2017-03-27 17:24:50.366
2377	fzjzl6597	开始日期			开始日期		\N	DATE	text						2017-03-27 17:24:50.406	2017-03-27 17:24:50.406
2378	fzjzl6598	首次方案			方案		\N	ST	text						2017-03-27 17:24:50.428	2017-03-27 17:24:50.428
2379	fzjzl6599	首次刺激部位			刺激部位		\N	ST	checkbox	左侧,右侧,双侧,额部,前颞部,中颞部,后颞部,顶部,枕部\n	左侧,右侧,双侧,额部,前颞部,中颞部,后颞部,顶部,枕部\n				2017-03-27 17:24:50.446	2017-03-27 17:24:50.446
2380	fzjzl6600	首次刺激量	MT		刺激量		\N	INT	text						2017-03-27 17:24:50.465	2017-03-27 17:24:50.465
2381	fzjzl6601	首次刺激频率	Hz		刺激频率		\N	INT	text						2017-03-27 17:24:50.482	2017-03-27 17:24:50.482
2382	fzjzl6602	首次次/天			次/天		\N	INT	text						2017-03-27 17:24:50.499	2017-03-27 17:24:50.499
2383	fzjzl6603	首次天／疗程			天／疗程		\N	INT	text						2017-03-27 17:24:50.516	2017-03-27 17:24:50.516
2384	fzjzl6604	首次疗程／月			疗程／月		\N	INT	text						2017-03-27 17:24:50.539	2017-03-27 17:24:50.539
2385	fzjzl6605	是否仍在进行			是否仍在进行		\N	ST	radio	1.是,2.否	1.是,2.否				2017-03-27 17:24:50.559	2017-03-27 17:24:50.559
2386	fzjzl6606	调整方案			调整方案		\N	ST	radio	1.有,2.无	1.有,2.无				2017-03-27 17:24:50.578	2017-03-27 17:24:50.578
2387	fzjzl6607	调整方案后刺激部位			刺激部位		\N	ST	checkbox	左侧,右侧,双侧,额部,前颞部,中颞部,后颞部,顶部,枕部\n	左侧,右侧,双侧,额部,前颞部,中颞部,后颞部,顶部,枕部\n				2017-03-27 17:24:50.597	2017-03-27 17:24:50.597
2394	fzjzl6614	5.4生酮饮食			5.4生酮饮食		\N	ST	radio	有,无	有,无				2017-03-27 17:24:50.717	2017-03-27 17:24:50.717
2395	fzjzl6615	生酮饮食开始日期			开始日期		\N	DATE	text						2017-03-27 17:24:50.732	2017-03-27 17:24:50.732
2396	fzjzl6616	生酮饮食是否仍在进行			是否仍在进行		\N	ST	radio	1.是,2.否					2017-03-27 17:24:50.751	2017-03-27 17:24:50.751
2397	fzjzl6617	生酮饮食终止日期			终止日期		\N	DATE	text						2017-03-27 17:24:50.77	2017-03-27 17:24:50.77
2376	fzjzl6596	5.3经颅磁刺激技术			5.3经颅磁刺激技术		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.39	2017-03-27 17:24:50.39
2398	fzjzl6618	6.1就诊医嘱			6.1就诊医嘱		\N	ST	radio	1.随诊,2.终止治疗	1.随诊,2.终止治疗				2017-03-27 17:24:50.789	2017-03-27 17:24:50.789
2399	fzjzl6619	6.2转归			6.2转归		\N	ST	radio	1.治愈,2.好转,3.无变化,4.加重	1.治愈,2.好转,3.无变化,4.加重				2017-03-27 17:24:50.803	2017-03-27 17:24:50.803
2400	fzjzl64	手术情况			手术情况		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.816	2017-03-27 17:24:50.816
2401	fzjzl65	术前评估			术前评估		\N	ST	text		0.0				2017-03-27 17:24:50.832	2017-03-27 17:24:50.832
2402	fzjzl66	脑电图检查日期			脑电图检查日期		\N	DATE	text		0.0				2017-03-27 17:24:50.846	2017-03-27 17:24:50.846
2403	fzjzl67	脑电图检查结果			结果		\N	ST	radio	1.正常,2.异常	1.正常,2.异常				2017-03-27 17:24:50.859	2017-03-27 17:24:50.859
2404	fzjzl68	脑电图检查具体结果			具体结果		\N	ST	text		0.0				2017-03-27 17:24:50.873	2017-03-27 17:24:50.873
2405	fzjzl69	头颅MRI检查日期			头颅MRI检查日期		\N	DATE	text		0.0				2017-03-27 17:24:50.887	2017-03-27 17:24:50.887
2406	fzjzl70	头颅MRI结果			结果		\N	ST	radio	1.正常,2.异常	1.正常,2.异常				2017-03-27 17:24:50.9	2017-03-27 17:24:50.9
2407	fzjzl71	头颅MR具体结果			具体结果		\N	ST	text		0.0				2017-03-27 17:24:50.914	2017-03-27 17:24:50.914
2408	fzjzl72	手术日期			手术日期		\N	DATE	text						2017-03-27 17:24:50.927	2017-03-27 17:24:50.927
2409	fzjzl73	手术方式			手术方式		\N	ST	text		0.0				2017-03-27 17:24:50.945	2017-03-27 17:24:50.945
2410	fzjzl74	并发症			并发症		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.959	2017-03-27 17:24:50.959
2411	fzjzl75	并发症:具体			具体		\N	ST	text		0.0				2017-03-27 17:24:50.973	2017-03-27 17:24:50.973
2412	fzjzl76	术后病理结果			术后病理结果		\N	ST	text		0.0				2017-03-27 17:24:50.992	2017-03-27 17:24:50.992
2413	ndtjc1	检查日期                             			检查日期                             		\N	DATE	text						2017-03-28 05:25:56.587	2017-03-28 05:25:56.587
2414	ndtjc2	上传图片			上传图片		\N	ST	img						2017-03-28 05:25:56.684	2017-03-28 05:25:56.684
2415	ndtjc3	结果			结果		\N	ST	checkbox	正常脑电图,正常范围脑电图,界限性脑电图,异常脑电图,背景活动异常,背景活动慢化,广泛性慢波活动 ,弥漫性δ活动,慢波活动阵发,脑波发育延迟,痫样放电,高度失律,暴发-抑制,低电压或电静息,电发放\n	正常脑电图,正常范围脑电图,界限性脑电图,异常脑电图,背景活动异常,背景活动慢化,广泛性慢波活动 ,弥漫性δ活动,慢波活动阵发,脑波发育延迟,痫样放电,高度失律,暴发-抑制,低电压或电静息,电发放				2017-03-28 05:25:56.735	2017-03-28 05:25:56.735
2416	ndtjc5	痫样放电			痫样放电		\N	ST	radio	有,无	有,无				2017-03-28 05:25:56.789	2017-03-28 05:25:56.789
2417	ndtjc6	放电部位			放电部位		\N	ST	checkbox	FP1,FP2,F3,F4,F7,F8,C3,C4,T3,T4,T5,T6,P3,P4,O1,O2\n	FP1,FP2,F3,F4,F7,F8,C3,C4,T3,T4,T5,T6,P3,P4,O1,O2				2017-03-28 05:25:56.825	2017-03-28 05:25:56.825
2418	ndtjc7	特殊波形			特殊波形		\N	ST	text						2017-03-28 05:25:56.855	2017-03-28 05:25:56.855
2419	ndtjc8	其他描述			其他描述		\N	ST	text						2017-03-28 05:25:56.89	2017-03-28 05:25:56.89
2420	fzjzl699	上传图片			上传图片		\N	ST	img						2017-03-28 05:25:56.684	2017-03-28 05:25:56.684
2299	fzjzl16	发作频率：1	次/天		1.0		\N	ST	text		\N				2017-03-27 17:24:48.445	2017-03-27 17:24:48.445
2372	fzjzl6592	5.2.迷走神经刺激术			5.2.迷走神经刺激术		\N	ST	radio	1.无,2.有	1.无,2.有				2017-03-27 17:24:50.294	2017-03-27 17:24:50.294
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('items_id_seq', 2419, true);


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
2	15	14	2017-01-15 17:00:55.545	2017-01-15 17:00:55.545	7
7	15	24	2017-01-15 17:00:55.576	2017-01-15 17:00:55.576	6
8	15	25	2017-01-15 17:00:55.581	2017-01-15 17:00:55.581	8
10	15	54	2017-03-27 16:31:55.275	2017-03-27 16:31:55.275	9
3	15	55	2017-01-15 17:00:55.549	2017-01-15 17:00:55.549	5
\.


--
-- Name: menus_crf_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_crf_infos_id_seq', 10, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('menus_id_seq', 15, true);


--
-- Data for Name: observes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY observes (id, observe_date, patient_id, patient_visit_id, observe_hour, drug, attack, cause, sleep_info, created_at, updated_at, observe_minute, other_drug, has_before_cause, attack_show, duration, duration_time, environment_change) FROM stdin;
7	2017-03-28	1	1	12	1.丙戊酸钠	0			2017-03-28 22:25:07.382	2017-03-28 22:25:07.382	\N	\N	\N	\N	\N	\N	\N
12	2017-05-05	2	2	2	1.丙戊酸钠	1			2017-05-05 12:06:49.985	2017-05-05 12:06:49.985	\N	\N	\N	\N	\N	\N	\N
13	2017-05-05	2	2	8	1.丙戊酸钠	1			2017-05-05 12:07:01.86	2017-05-05 12:07:01.86	\N	\N	\N	\N	\N	\N	\N
4	2017-03-25	2	2	5	2.左乙拉西坦	1			2017-03-28 01:42:20.312	2017-05-05 12:08:24.595	\N	\N	\N	\N	\N	\N	\N
10	2017-05-05	2	2	15	1.丙戊酸钠	1			2017-05-05 02:15:06.021	2017-05-05 12:09:02.943	\N	\N	\N	\N	\N	\N	\N
14	2017-05-05	2	2	10	1.丙戊酸钠	1			2017-05-05 12:56:22.142	2017-05-05 12:56:22.142	\N	\N	\N	\N	\N	\N	\N
15	2017-05-05	2	2	19	1.丙戊酸钠	1			2017-05-05 12:56:54.322	2017-05-05 12:56:54.322	\N	\N	\N	\N	\N	\N	\N
3	2017-03-26	2	2	7	1.丙戊酸钠	1			2017-03-28 01:42:03.508	2017-05-05 13:00:23.653	\N	\N	\N	\N	\N	\N	\N
6	2017-03-28	1	1	10	1.丙戊酸钠	1			2017-03-28 22:23:04.998	2017-05-05 13:01:03.312	\N	\N	\N	\N	\N	\N	\N
17	2017-05-02	2	2	1	1.丙戊酸钠	1			2017-05-05 13:06:22.054	2017-05-05 13:06:22.054	\N	\N	\N	\N	\N	\N	\N
18	2017-05-02	2	2	6	1.丙戊酸钠	1			2017-05-05 13:06:32.55	2017-05-05 13:06:32.55	\N	\N	\N	\N	\N	\N	\N
20	2017-09-15	2	2	1	13.其他	1	0	是	2017-09-15 01:08:43.444	2017-09-15 01:08:43.444	0	A药	1	0	\N	\N	\N
11	2017-05-05	2	2	1	1.丙戊酸钠	1	1、疲劳,8、环境改变	是	2017-05-05 12:06:39.304	2017-09-15 01:28:29.549	0		1	1.先兆,2.意识清楚	\N	\N	1、寒冷,2、暑热
19	2017-05-05	2	\N	1	1.丙戊酸钠	1	7、外伤	是	2017-05-05 13:56:55.368	2017-09-15 03:36:38.279	0		\N	1.先兆	\N	\N	1、寒冷
21	2017-09-15	2	\N	5	0.无	1	3、惊吓	是	2017-09-15 04:36:50.913	2017-09-15 04:36:50.913	0		1	1.先兆	\N	\N	1、寒冷
\.


--
-- Name: observes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('observes_id_seq', 21, true);


--
-- Data for Name: patient_visits; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patient_visits (id, patient_id, visiting_time, telephone, home_address, degree_of_education, occupation, responsible_doctor, person_filing, created_date, created_unit, marital_status, contact_name, contact_relationship, contact_address, contact_phone, visit_type, patient_source, admission_number, admission_date, discharge_date, outpatient_number, diagnostic_types, diagnostic_degree, diagnostic_anoxia, other_diseases, created_at, updated_at) FROM stdin;
1	1	2017-01-14	\N	\N	\N	\N	张三	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-01-15 15:28:23.483	2017-01-15 15:30:21.15
2	2	2017-03-30	\N	\N	\N	\N	张立	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-04-13 00:51:06.221	2017-04-13 00:51:06.221
6	6	2017-09-15	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-15 03:30:47.466	2017-09-15 03:30:47.466
\.


--
-- Name: patient_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patient_visits_id_seq', 6, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: wangyunlei
--

COPY patients (id, file_number, id_number, name, gender, birthday, nation, native_place, created_at, updated_at, file_type, birth_place, first_admission_date, family_name, contact_phone) FROM stdin;
1	10000	\N	王龙龙	男	2013-12-29	\N	\N	2017-01-15 15:28:23.432	2017-01-15 16:51:15.678	2	北京海淀	2017-01-01	王刚	13390123432
2	10002	\N	张利	女	\N	\N	\N	2017-04-13 00:51:06.135	2017-04-13 00:51:06.135	1		2017-04-12	张龙	
6	阿32	\N	问问	男	\N	\N	\N	2017-09-15 03:30:47.438	2017-09-15 03:30:47.438	1		2017-08-30		
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('patients_id_seq', 6, true);


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
20170327072203
20170327161749
20170327172904
20170914155928
20170914162534
20170914165620
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
124	既往史	既往史		\N	\N	22	2017-01-15 16:45:04.779	2017-01-15 16:45:04.779
125	1．纳入标准	1．纳入标准		\N	\N	23	2017-01-15 16:45:29.978	2017-01-15 16:45:29.978
126	2．排除标准	2．排除标准		\N	\N	23	2017-01-15 16:45:29.983	2017-01-15 16:45:29.983
127	结论	结论		\N	\N	23	2017-01-15 16:45:29.986	2017-01-15 16:45:29.986
128	头颅MRI检查	头颅MRI检查		\N	\N	24	2017-01-15 16:45:46.236	2017-01-15 16:45:46.236
129	遗传代谢病及基因检查	遗传代谢病及基因检查		\N	\N	25	2017-01-15 16:46:27.924	2017-01-15 16:46:27.924
76	发育评估	发育评估		\N	\N	14	2017-01-15 16:31:39.338	2017-01-15 16:31:39.338
340	1.首次发作	1.首次发作		\N	\N	54	2017-03-27 17:24:47.356	2017-03-27 17:24:47.356
341	2.后期发作情况	2.后期发作情况		\N	\N	54	2017-03-27 17:24:47.364	2017-03-27 17:24:47.364
342	3.临床诊断	3.临床诊断		\N	\N	54	2017-03-27 17:24:47.369	2017-03-27 17:24:47.369
343	4.药物治疗	4.药物治疗		\N	\N	54	2017-03-27 17:24:47.378	2017-03-27 17:24:47.378
344	5.非药物治疗	5.非药物治疗		\N	\N	54	2017-03-27 17:24:47.383	2017-03-27 17:24:47.383
345	6.疾病转归	6.疾病转归		\N	\N	54	2017-03-27 17:24:47.388	2017-03-27 17:24:47.388
346	7.手术情况	7.手术情况		\N	\N	54	2017-03-27 17:24:47.392	2017-03-27 17:24:47.392
347	脑电图检查	脑电图检查		\N	\N	55	2017-03-28 05:25:56.506	2017-03-28 05:25:56.506
\.


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wangyunlei
--

SELECT pg_catalog.setval('sections_id_seq', 347, true);


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
1	wylszz@sina.cn	$2a$11$B.CX1qPIHc/2ZKjcseNrl.ak6yAVK2GfCNlXmG/OmudhaXzFGMOqy	admin	\N	\N	\N	106	2017-09-14 22:01:27.202	2017-09-14 21:52:37.47	::1	::1	2016-10-14 08:58:27.544	2017-09-14 22:01:27.207
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
-- Name: observes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY observes
    ADD CONSTRAINT observes_pkey PRIMARY KEY (id);


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

