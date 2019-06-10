--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-1.pgdg18.04+1)

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

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: FirstAid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FirstAid" (
    id bigint NOT NULL,
    geom public.geometry(MultiPoint,21781),
    name character varying(80),
    altitude integer
);


ALTER TABLE public."FirstAid" OWNER TO postgres;

--
-- Name: Lift ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lift " (
    id bigint NOT NULL,
    geom public.geometry(MultiLineString,21781),
    name character varying(80),
    length character varying(80),
    "time" character varying(80),
    type character varying(80),
    altitude integer
);


ALTER TABLE public."Lift " OWNER TO postgres;

--
-- Name: LiftEntrance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LiftEntrance" (
    id bigint NOT NULL,
    geom public.geometry(MultiPoint,21781),
    name character varying(80),
    altitude character varying(80)
);


ALTER TABLE public."LiftEntrance" OWNER TO postgres;

--
-- Name: Park; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Park" (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,21781),
    name character varying(80),
    altitude character varying(80),
    places bigint,
    "full" character varying(10)
);


ALTER TABLE public."Park" OWNER TO postgres;

--
-- Name: Restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Restaurant" (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,21781),
    name character varying(80),
    altitude character varying(80)
);


ALTER TABLE public."Restaurant" OWNER TO postgres;

--
-- Name: Restroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Restroom" (
    id bigint NOT NULL,
    geom public.geometry(MultiPoint,21781),
    name character varying(80)
);


ALTER TABLE public."Restroom" OWNER TO postgres;

--
-- Name: Slope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Slope" (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,21781),
    name character varying(80),
    altitude character varying(80),
    length bigint,
    drop bigint,
    difficulty integer
);


ALTER TABLE public."Slope" OWNER TO postgres;

--
-- Name: TicketService; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TicketService" (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,21781),
    name character varying(80),
    altitude character varying(80)
);


ALTER TABLE public."TicketService" OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cantons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cantons (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    geom public.geometry(MultiPolygon,21781)
);


ALTER TABLE public.cantons OWNER TO postgres;

--
-- Name: cantons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cantons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cantons_id_seq OWNER TO postgres;

--
-- Name: cantons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cantons_id_seq OWNED BY public.cantons.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: lift_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lift_test (
    id bigint NOT NULL,
    geom public.geometry(MultiLineString,21781),
    fid bigint,
    name character varying(80),
    length character varying(80),
    "time" character varying(80),
    type character varying(80),
    altitude integer
);


ALTER TABLE public.lift_test OWNER TO postgres;

--
-- Name: lifts_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lifts_test (
    id bigint NOT NULL,
    geom public.geometry(MultiLineString,21781),
    fid bigint,
    name character varying(80),
    length character varying(80),
    "time" character varying(80),
    type character varying(80),
    altitude integer
);


ALTER TABLE public.lifts_test OWNER TO postgres;

--
-- Name: restaurant_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_test (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,21781),
    fid bigint,
    name character varying(80),
    altitude character varying(80)
);


ALTER TABLE public.restaurant_test OWNER TO postgres;

--
-- Name: swissgeo_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.swissgeo_city (
    id integer NOT NULL,
    city_name character varying(100) NOT NULL
);


ALTER TABLE public.swissgeo_city OWNER TO postgres;

--
-- Name: swissgeo_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.swissgeo_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swissgeo_city_id_seq OWNER TO postgres;

--
-- Name: swissgeo_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.swissgeo_city_id_seq OWNED BY public.swissgeo_city.id;


--
-- Name: swissgeo_hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.swissgeo_hospital (
    id integer NOT NULL,
    hospital_name character varying(100) NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.swissgeo_hospital OWNER TO postgres;

--
-- Name: swissgeo_hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.swissgeo_hospital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swissgeo_hospital_id_seq OWNER TO postgres;

--
-- Name: swissgeo_hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.swissgeo_hospital_id_seq OWNED BY public.swissgeo_hospital.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cantons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantons ALTER COLUMN id SET DEFAULT nextval('public.cantons_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: swissgeo_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swissgeo_city ALTER COLUMN id SET DEFAULT nextval('public.swissgeo_city_id_seq'::regclass);


--
-- Name: swissgeo_hospital id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swissgeo_hospital ALTER COLUMN id SET DEFAULT nextval('public.swissgeo_hospital_id_seq'::regclass);


--
-- Data for Name: FirstAid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FirstAid" (id, geom, name, altitude) FROM stdin;
1	0104000020155500000100000001010000004DDA74A5A5F12141ED6EC6CD4669FB40	Tracouet	2200
2	0104000020155500000100000001010000004B28DED291F621415CC4005522E8FB40	Nendaz	1400
\.


--
-- Data for Name: Lift ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Lift " (id, geom, name, length, "time", type, altitude) FROM stdin;
3	01050000201555000001000000010200000002000000E01184BFE0F6214127A591FCF794FB40753B34B216F221413DBB01A01F69FB40	Téléski Alpages	950	Unavailable	Téléski	2187
1	01050000201555000001000000010200000002000000D0E77ACE97F62141A1E47099E4E7FB409D1045A8C4F1214126414C9FF569FB40	Télécabine de Tracouet	2293	8m00s	Télécabine	2200
2	01050000201555000001000000010200000002000000D08E847911EF21414BF822961C69FB40D788524876F12141A81965BC0767FB40	Téléski Jean-Pierre	321	2m00s	Téléski	2200
4	0105000020155500000100000001020000000800000014A7E7A7A8F1214171F459F73964FB407D74765F87F12141FB029D5FDF5FFB40C9815D897CF12141538980A6655EFB4075F97C021BF1214146E869AC9152FB409489DEA696F0214185058DE8FD42FB406D1528FAF7EF214121E0ABED5D30FB40CF67BD546AEF2141E0A6B0666F1FFB40CF16059EEAEE2141BE599B533210FB40	Téléski Prarion-Tracouet	1447	12m00s	Télésiège	2100
6	01050000201555000001000000010200000004000000DAA7962CC3F2214147BBC3CFAE60FB408B84094E72F42141728D17923D5BFB400819CCD7B7F42141CB3D87A3965AFB4067EC5FD217F521416395803F5F54FB40	Téléski La Dent	344	Unavailable	Téléski	2174
5	010500002015550000010000000102000000020000000483AB443DF22141133561EE6A65FB40A00FA41CB9F2214121FF23456B5FFB40	Téléski Lac	\N	Unavailable	Téléski	2186
\.


--
-- Data for Name: LiftEntrance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LiftEntrance" (id, geom, name, altitude) FROM stdin;
23	010400002015550000010000000101000000EC062BDBB8F221414B037BA7695FFB40	Téléski Lac	2186
22	010400002015550000010000000101000000CC94071EC1F221414A2EF119B460FB40	Téléski La Dent	2174
24	010400002015550000010000000101000000AFA18109EAEE214158FE035D3610FB40	Télésiège Prarion-Tracouet	1841
20	010400002015550000010000000101000000EB878D3298F62141333A0E5BE3E7FB40	Télécabine de Tracouet	1400
21	0104000020155500000100000001010000009843194711EF2141ADCF8EE81D69FB40	Téléski Jean-Pierre	2101
25	01040000201555000001000000010100000007B4021BE2F621419AEFE520F494FB40	Téléski Alpage	1895
\.


--
-- Data for Name: Park; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Park" (id, geom, name, altitude, places, "full") FROM stdin;
10	01060000201555000001000000010300000001000000060000009D9C2881F5F621416CF960C09BEBFB40F21A491711F7214102F4E2297DECFB40065E38731CF7214139DC68006FECFB40F9D719520FF72141DDC02DCDB0E9FB403CEFD389EDF6214141045DEDD8E9FB409D9C2881F5F621416CF960C09BEBFB40	Parking Télécabine	1440	26	False
21	010600002015550000010000000103000000010000000D0000007DF0D39A60F721416938CF20C7E8FB40667A718166F72141A8D8A7F6BEE9FB40CCA5A64A6DF721414B4DCBD59CEAFB40B9AD240372F72141263B90742AEBFB40754BFDB683F721415BDFA7A624ECFB405957BACB8AF72141A42E94DB53ECFB40026CF54EE3F7214116CBEA751EE9FB401ACA5D11BCF7214134039C050FE8FB40D74F3C6EACF72141EA9178FE63E8FB40077BF109A0F72141CF2E51FC28E8FB40499E28ED8EF72141BC1498E2B1E8FB405957BACB8AF72141F38D39A261E8FB407DF0D39A60F721416938CF20C7E8FB40	Parking de Prameira	1440	256	False
\.


--
-- Data for Name: Restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Restaurant" (id, geom, name, altitude) FROM stdin;
1	0106000020155500000100000001030000000100000011000000BC64D46B7DF12141CB2970489066FB401E1D11CE81F1214165FD475D1067FB40F04E61C17EF121417BD266A92267FB40CCA6320C89F12141956E4CD84268FB40FBFDFEB583F121414EA70B0B4F68FB40B4ADA14B98F12141851582175D6AFB40BDC1E968B6F121415B8FB6F3166AFB4026960314B9F12141840349DD6D6AFB40A43F3C0BCEF12141596B447F386AFB4076718CFECAF121411B229349CF69FB4098078279D1F12141BF976C6AB869FB401F68ED90CBF1214186969F1D0C69FB40D1FBB2DDE1F12141FF613BA6D068FB405E78FB3DDAF12141F876024FE467FB40D41F2552C0F121414F282911FE66FB407783C538BAF121410388E8260D66FB40BC64D46B7DF12141CB2970489066FB40	Restaurant de Tracouet	2200
2	01060000201555000001000000010300000001000000050000007658ACFF71EE21413C834E103F3CFB402D6C37A38EEE2141492AE029C33CFB40FE13D2177DEE21410F293898B23DFB404700477460EE21413B0F739F323DFB407658ACFF71EE21413C834E103F3CFB40	Cabane de Balavaux	2042
3	010600002015550000010000000103000000010000000500000058B196D290ED2141F6706AFFE010FB40E4D22BEAA5ED2141BF6245689F11FB4045B0503E8AED21415C2853026412FB40845C381675ED21413AC8911DA611FB4058B196D290ED2141F6706AFFE010FB40	Chalet des Aloes	1770
\.


--
-- Data for Name: Restroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Restroom" (id, geom, name) FROM stdin;
1	01040000201555000001000000010100000057C4E71082ED2141D9D68B2F6D12FB40	Chales des alpes
2	0104000020155500000100000001010000009649385F51EE214143CC8D71D53DFB40	Alpage
3	010400002015550000010000000101000000C048795559F12141A00B8DC75669FB40	Tracouet
5	0104000020155500000100000001010000009E6C34D3B2F62141D86E80441EE7FB40	Nendaz
\.


--
-- Data for Name: Slope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Slope" (id, geom, name, altitude, length, drop, difficulty) FROM stdin;
5	01060000201555000001000000010300000001000000230000003142F7E9B0F421412E7769068555FB408F0ECA0E2EF5214177E3D2674D55FB40B3C47E3F12F52141B23B001D0B52FB40C18F4737E6F42141F49D4B284E50FB401FE79CD1BEF421414845EC60CC4FFB40C93AEDED7DF42141164FF1AD6F4FFB405DA351D12CF42141D81DBF235D4FFB4068DE88A8E2F321414845EC60CC4FFB4076A951A0B6F32141F06C32A71D52FB409EEF97F1B8F321415A6346635C54FB4015C26AE5BFF32141BA1E2348E556FB4015C26AE5BFF321410895AAFF3258FB407319C07F98F321417EC6F592275AFB406F892E5F7AF321410A6EAFD4875BFB4068690B1E3EF32141A150A0ED9D5CFB40DCAB4CF126F321414DA9FFB41F5DFB40898F2E2E04F32141B295F51AD95DFB40E7E683C8DCF221419C1F876C6D5EFB40BC10AC56BCF22141F5D045FB705FFB4048CE6A83D3F2214197EE6DEB3C60FB40D81BBBD008F32141E564F5A28A61FB4068690B1E3EF321418178FF3CD160FB404843E80D78F3214165F87238E05FFB40644EF787C4F3214191E44F95B75EFB4006F7A1EDEBF321414DA9FFB41F5DFB4093B4601A03F421418F0B4BC0625BFB400E17C52E28F421415C3C4B38B157FB400E17C52E28F4214139B2A0DD3A55FB40D47524C533F42141F67650FDA253FB402792428856F421410CEDBEAB0E53FB40B7DF92D58BF42141918A5A97E952FB40BA6F24F6A9F42141CFBB8C21FC52FB401FE79CD1BEF42141EB3B1926ED53FB40D05A102FBAF4214177E3D2674D55FB403142F7E9B0F421412E7769068555FB40	La Dent	2258	470	80	1
1	0106000020155500000100000001030000000100000073000000619E65245AF121417D1C7C968D65FB408DBC527F2CF12141827D94AD5D63FB408DBC527F2CF12141DE6EFD84F061FB4082AA482714F1214150847A0CB460FB40304D3898ECF02141EEE11FF4D85FFB40DFEF2709C5F0214155E59223845EFB40D9E622DDB8F021419CB2E74AE65CFB40D9E622DDB8F02141CD5B28C2175BFB4015201FBCAFF02141081773916159FB4051591B9BA6F02141239C9F586257FB40929B1CA6A9F02141C1F944408756FB40050510388BF021416FCA0C979453FB40BEB909017CF021413870DADE1A53FB40A895F5504BF02141173ABCD6D152FB40B886C9CFE0EF2141F7039ECE8852FB406120B414ADEF2141F7039ECE8852FB405105A59088EF2141ECF193767052FB4030CF86883FEF2141D6CD7FC63F52FB40D96871CD0BEF2141D6CD7FC63F52FB40B83253C5C2EE2141D6CD7FC63F52FB405BC338DE82EE21417F3D2F067D51FB40469F242E52EE2141FC64B6E55850FB40358415AA2DEE2141B44788947E4DFB4077C616B530EE2141C4BAAA03674BFB403B8D1AD639EE21413C3140A2FA47FB40045D23234FEE21410A3826015145FB408CEA2A6561EE214130CF5C206A43FB40C823274458EE21416C8AA7EFB341FB403B8D1AD639EE214109E84CD7D840FB40E426051B06EE21419121DE0ECD3FFB40ACCCD2628CED2141F924513E783EFB408184AA022BED21415516BA150B3DFB40190386C3D2EC214186BFFA8C3C3BFB40B78A66B086EC2141C27A455C8639FB40E3A8530B59EC2141F22386D3B737FB40C77B3A2F1CEC2141A0F44D2AC534FB40F399278AEEEB214143B30B29BA31FB40761E2AA0F4EB21419AF382BF042EFB40500942712EEC21417E1E7DCE8B2BFB406B365B4D6BEC2141C4EBD1F5ED29FB40CDAE7A60B7EC214137014F7DB128FB40F3ED9D940CED214188E0ADFC2B27FB4097A8BEB25BED2141EFE3202CD725FB404575E928C3ED21419853D06B1425FB408CC0EF5FD2ED214156E7935B8224FB400433E81DC0ED21418790D4D2B322FB40C2F0E612BDED2141E4813DAA4621FB405B99FDD8F3ED214176CDD8395320FB40358415AA2DEE2141E9E255C1161FFB404BA8295A5EEE21412FB0AAE8781DFB409C053AE985EE21413F23CD57611BFB40DE473BF488EE21414484E56E3119FB402493412B98EE214133C1E9D5D016FB40A71744419EEE21416F7C34A51A15FB402493412B98EE2141AB377F746413FB40EE624A78ADEE2141D0CEB5937D11FB40FE7D59FCD1EE2141631A51238A10FB4050DB698BF9EE214138D228C32810FB406B08836736EF2141A5868D331C11FB402FCF86883FEF2141AB377F746413FB406B08836736EF214190B252AD6315FB40DE7176F917EF2141B69962F6F417FB40972670C208EF214186F0217FC319FB40CD566775F3EE2141A1C527703C1CFB40CD566775F3EE2141F4F45F192F1FFB40FE7D59FCD1EE214176CDD8395320FB406BDE4762A7EE2141C34B1FA2FD20FB401A8137D37FEE214130008412F121FB40C823274458EE2141BEEA068B2D23FB40147832A773EE2141771DB263CB24FB4091F32F916DEE214167AA8FF4E226FB40459F242E52EE2141B428D65C8D27FB40DE1D00EFF9ED2141411359D5C928FB40093CED49CCED2141837F95E55B29FB40B7DEDCBAA4ED214199A3A9958C29FB405B6FC2D364ED2141E521F0FD362AFB400912B2443DED21411C7C22B6B02AFB40F3ED9D940CED214168FA681E5B2BFB40DDC989E4DBEC2141426332FF412DFB4091757E81C0EC2141BA29A1C74D2EFB4009E8763FAEEC21418A8060501C30FB404521731EA5EC2141EC22BB68F730FB40FED56CE795EC2141D19D8EA1F632FB4003DF7113A2EC214174AC25CA6334FB402415901BEBEC214139F1DAFA1936FB400912B2443DED2141D2ED67CB6E37FB40F317D9999BED21418B2013A40C39FB402469062609EE21412F2FAACC793AFB40045D23234FEE214191D104E5543BFB40A71744419EEE2141D23D41F5E63BFB4004875E28DEEE21416B3ACEC53B3DFB4014A26DAC02EF21417CFDC95E9C3FFB409C2F75EE14EF214161789D979B41FB4050DB698BF9EE21415C178580CB43FB4009906354EAEE21414CA46211E345FB40C84D6249E7EE21413C3140A2FA47FB4045C95F33E1EE21416D2A5A43A44AFB404BD2645FEDEE21413D8119CC724CFB40A7417F462DEF21419F2374E44D4DFB405005A59088EF2141AA357E3C664DFB409371E1A01AF02141BF5992EC964DFB40474711438EF0214142320B0DBB4EFB40EA013261DDF0214199C25BCD7D4FFB40BFE344060BF12141894F395E9551FB40528356A035F12141BB4853FF3E54FB400B38506926F12141D61D59F0B756FB400B38506926F121413E71A549DB59FB4093C557AB38F121416558B5926C5CFB40629E65245AF1214114795613F25DFB40368078C987F12141EEE11FF4D85FFB40BF0D800B9AF1214171BA9814FD60FB4088DD8858AFF121416C5980FD2C63FB404CA48C79B8F1214104560DCE8164FB4088DD8858AFF121415CE65D8E4465FB40619E65245AF121417D1C7C968D65FB40	Prarion	2200	1860	340	2
2	010600002015550000010000000103000000010000002C000000EC96CFE324F12141A5529A9ED665FB40C60336A5B1EF2141FCE2EA5E9966FB4018E394242CEE214154733B1F5C67FB4079DD0228CBEC214195DF772FEE67FB400117945FBFEB21417FBB637FBD67FB40E6E97A8382EB2141AB038CDF1E68FB40D6CE6BFF5DEB2141440019B07369FB40CBBC61A745EB21412ACBC512EB6FFB40849B9675C5EB2141DE9C58D4B873FB40ECF27FAF8EEB2141BEB613F6E777FB4048385F913FEB2141B4F4E2C7477CFB40C5B35C7B39EB21410D25E6DBFA85FB403D7ACB4345EC2141DDCB7E8E418CFB40A01C265C20ED2141AD7217418892FB40F7AC761CE3ED214167F59B439E98FB4090A903ED37EF2141A4509966D89FFB402E5B1FDF7AEF2141A4509966D89FFB405FAC4C6BE8EF2141393CE749D5A7FB40C14EA783C3F02141408D8BDE0DB3FB406F1BD2F92AF121410A8332500CB7FB407A81525C61F22141894A6C83D8BEFB40DD23AD743CF32141F2ED910674C6FB40CC5C14FB35F42141030167C94CCDFB40CDB08A0554F52141CEF60D3B4BD1FB40EDE6A80D9DF52141CEF60D3B4BD1FB40DDCB998978F521413FBCB19896CBFB40DD77237F5AF421411D36BA66D5C6FB406ABAB9E25AF32141386B0D045EC0FB40E2D83B962AF2214105D2400FC4B4FB40FDB1DE6749F12141B703217DA1AFFB40B03398FF9EF02141E1AB968912A7FB408AF474CB49F02141470F5765CD9CFB401D40105B56EF21417D19B0F3CE98FB403E22B85881EE2141EEDE53511A93FB40AA2E30B438ED214144CFF1BDEC8AFB40E63DF18DA0EC2141B0E3A3DAEF82FB40B5ECC30133EC21417288A6B7B57BFB40539EDFF375EC21419C301CC42673FB40AADAB9A91AEC2141F8D1AB71416DFB4033BC37F64AED21411E69E2905A6BFB403E22B85881EE2141E2AD97C1106DFB405FAC4C6BE8EF21418B1D47014E6CFB406F1BD2F92AF121419B906970366AFB40EC96CFE324F12141A5529A9ED665FB40	Jean-Pierre	2200	2984	700	2
3	0106000020155500000100000001030000000100000033000000E340EDBC07F4214103BE867CD065FB40E6D07EDD25F42141BEA931C7E360FB40A58438BD99F421411151D2FF6160FB40A814CADDB7F42141F9015F7CA15DFB40D3EAA14FD8F42141685087E4BB5AFB4081CE838CB5F421419E9E9643F455FB402A97513319F52141B41405F25F55FB403F823D6C29F52141996D7DC2C357FB40CC3FFC9840F52141A150A0ED9D5CFB40D77A3370F6F4214166D1770D3563FB402EB265C992F42141236F2C02F264FB407C7F5A98CFF6214150B2793DDC6CFB40AC69F096FAF62141871D11E62871FB40E36C6D2D59F72141D9EC44EE4376FB401CAB2E9B79F62141F9969E20727CFB4022C41533ADF62141CDB7811DE582FB4060E079613FF72141B899A2907687FB40D4FF5A2630F82141A37BC303088CFB40A8F367E876F92141F54AF70B2391FB40481F3CEB20F921414F0347D04D9EFB4064BE1C22B1F82141DBE0706A65AAFB406BD703BAE4F82141C7C291DDF6AEFB401A70EAC3B7F72141949DB7070AB0FB401592470346F621417DDC7991EBB1FB40D875E3D4B3F521411992C5E511B4FB40503F5A511FF621419F2932ADC9BAFB40067AA7E803F6214164E144D0E6CBFB40C1EFE93557F6214146680306B8D4FB40CD3BE67AE3F62141097DB73F25E3FB406C67BA7D8DF621418585B4C025ECFB409F8C94537AF521417AFC2EBC5DD4FB4024FF590A6FF52141466BF8A6AFC7FB4077A1B7D75DF521418B0B53205BBFFB40EDFBDC7310F5214168BE9A047DB6FB40C42A2E0D19F5214192FA581E5AADFB40BBD6029E23F62141C17CD40A97A9FB40E36C6D2D59F72141402B25163FA8FB40CDE6738EFCF72141402B25163FA8FB40D4FF5A2630F82141359FAA707F9DFB408776E4F074F82141E02C187FB495FB405073675A16F82141910043604993FB40EA8554C58CF72141D843FCC2A48DFB4060E079613FF72141881727A4398BFB40756673009CF621416B102C5BBB87FB408BEC6C9FF8F52141B253E5BD1682FB40E5A7B1041BF621418F062DA23879FB40EBC0989C4EF6214140DA5783CD76FB401CAB2E9B79F62141D9EC44EE4376FB40621BBE3801F621413B949AB06D71FB400E79606B12F62141EB67C591026FFB40E340EDBC07F4214103BE867CD065FB40	Tracouet	2200	3160	850	2
4	010600002015550000010000000103000000010000001B0000007EB0CEAE3EF22141C713D6A75969FB402764DB29D5F2214163C921FC7F6BFB40D2ECB20029F321413ED61556FA6CFB40C72936B17AF3214137EA04F9F271FB40956AD55692F321411F29C782D473FB401E10B0BADFF3214147BF31120A75FB404537C9695CF42141A21DD560DC77FB40CFDCA3CDA9F42141C2C72E930A7EFB40969EE25F89F52141F78F6752A77FFB400E6859DCF4F52141BADB1D360383FB406F3C85D94AF62141270FEE9DEC88FB40EE1EE3EDE9F62141A8609D92448AFB4059B68B3AEEF621413FCD36731394FB4029CCF53BC3F62141B049B94E5492FB4029CCF53BC3F62141EA5AA481488CFB4011D7AABCADF621410F4EB027CE8AFB406F3C85D94AF62141F5E913C8FF89FB407AFF0129F9F521410CAB513E1E88FB4073E61A91C5F52141E27188C53884FB4036CAB66233F521411F26D2E1DC80FB40D5F58A65DDF421411F26D2E1DC80FB4086FDC24F69F421415BDA1BFE807DFB40D386398524F4214170F8FA8AEF78FB40BF3B84BD89F321410668890CB675FB4047720D411EF321411B8668992471FB40141926623AF22141E1777207286AFB407EB0CEAE3EF22141C713D6A75969FB40	Alpage	2200	977	305	1
\.


--
-- Data for Name: TicketService; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TicketService" (id, geom, name, altitude) FROM stdin;
1	010600002015550000010000000103000000010000000C00000064EC042EA2F6214154A8EFAE93E8FB40049F581EABF62141B68B713F98E8FB405C294CADB3F62141034BDF1F6CE8FB4076E46DDCB7F62141F8A337450CE8FB4035A26CD1B4F62141E27F2395DBE7FB4071DB68B0ABF62141C7520AB99EE7FB4039F2F5A6A4F62141C149058D92E7FB4009EFE1F39AF6214123C224A0DEE7FB40ECC0901998F621415F90BE011DE8FB400C62119F99F62141034BDF1F6CE8FB40511742559BF62141EDBB68F282E8FB4064EC042EA2F6214154A8EFAE93E8FB40	Nendaz 	1400
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add city	1	add_city
2	Can change city	1	change_city
3	Can delete city	1	delete_city
4	Can view city	1	view_city
5	Can add hospital	2	add_hospital
6	Can change hospital	2	change_hospital
7	Can delete hospital	2	delete_hospital
8	Can view hospital	2	view_hospital
9	Can add canton	3	add_canton
10	Can change canton	3	change_canton
11	Can delete canton	3	delete_canton
12	Can view canton	3	view_canton
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add site	10	add_site
38	Can change site	10	change_site
39	Can delete site	10	delete_site
40	Can view site	10	view_site
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$TjvAYsagXNgZ$Mjk46oH/k+90AA0lLC2vFK9jvDzJ3IDmLNfSb5MLPtk=	2019-06-07 11:13:40.788496+02	t	admin			admin@swissgeo.ch	t	t	2019-06-07 11:12:09.158313+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cantons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cantons (id, name, geom) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-06-07 11:23:02.058328+02	1	Park object (1)	1	[{"added": {}}]	11	1
2	2019-06-07 11:24:07.167573+02	1	Park object (1)	2	[]	11	1
3	2019-06-07 11:37:45.499853+02	1	Park object (1)	2	[{"changed": {"fields": ["geom", "full"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	swissgeo	city
2	swissgeo	hospital
3	swissgeo	canton
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	sites	site
11	swissgeo	park
12	swissgeo	slope
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-06-07 11:10:54.298337+02
2	auth	0001_initial	2019-06-07 11:10:54.359971+02
3	admin	0001_initial	2019-06-07 11:10:54.485417+02
4	admin	0002_logentry_remove_auto_add	2019-06-07 11:10:54.515275+02
5	admin	0003_logentry_add_action_flag_choices	2019-06-07 11:10:54.532717+02
6	contenttypes	0002_remove_content_type_name	2019-06-07 11:10:54.570511+02
7	auth	0002_alter_permission_name_max_length	2019-06-07 11:10:54.57893+02
8	auth	0003_alter_user_email_max_length	2019-06-07 11:10:54.595292+02
9	auth	0004_alter_user_username_opts	2019-06-07 11:10:54.613314+02
10	auth	0005_alter_user_last_login_null	2019-06-07 11:10:54.629611+02
11	auth	0006_require_contenttypes_0002	2019-06-07 11:10:54.63417+02
12	auth	0007_alter_validators_add_error_messages	2019-06-07 11:10:54.651974+02
13	auth	0008_alter_user_username_max_length	2019-06-07 11:10:54.672608+02
14	auth	0009_alter_user_last_name_max_length	2019-06-07 11:10:54.693851+02
15	auth	0010_alter_group_name_max_length	2019-06-07 11:10:54.713771+02
16	auth	0011_update_proxy_permissions	2019-06-07 11:10:54.733516+02
17	sessions	0001_initial	2019-06-07 11:10:54.748929+02
18	sites	0001_initial	2019-06-07 11:10:54.771923+02
19	sites	0002_alter_domain_unique	2019-06-07 11:10:54.791083+02
20	swissgeo	0001_initial	2019-06-07 11:10:54.821029+02
21	swissgeo	0002_auto_20190327_0024	2019-06-07 11:10:54.841942+02
22	swissgeo	0003_canton_geom	2019-06-07 11:10:54.867925+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
w87w3fptzjta5s49rwagz9002sy4fuhs	ZDBjNTJkNzBhMDkyZTM2OWQwZTY5ZmI4OTMzNDhlYmQzMzNhODVmODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWM4ZTE5YmExNjhhMTZiNjgwZWFlNWQ1MDM2ODE5MzAyN2NhYzg0In0=	2019-06-21 11:13:40.791379+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: lift_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lift_test (id, geom, fid, name, length, "time", type, altitude) FROM stdin;
1	01050000201555000001000000010200000002000000D0E77ACE97F62141A1E47099E4E7FB409D1045A8C4F1214126414C9FF569FB40	1	Téléski Nendaz	2293	8m00s	Cabine	2200
2	01050000201555000001000000010200000002000000D08E847911EF21414BF822961C69FB40D788524876F12141A81965BC0767FB40	2	Téléski Jean-Pierre	321	2m00s	Siège	2200
3	01050000201555000001000000010200000002000000E01184BFE0F6214127A591FCF794FB40753B34B216F221413DBB01A01F69FB40	3	Téléski Alpages	950	Unavailable	Téléski	2187
4	0105000020155500000100000001020000000800000014A7E7A7A8F1214171F459F73964FB407D74765F87F12141FB029D5FDF5FFB40C9815D897CF12141538980A6655EFB4075F97C021BF1214146E869AC9152FB409489DEA696F0214185058DE8FD42FB406D1528FAF7EF214121E0ABED5D30FB40CF67BD546AEF2141E0A6B0666F1FFB40CF16059EEAEE2141BE599B533210FB40	4	Prarion-trancout	1447	12m00s	télé	2100
6	01050000201555000001000000010200000004000000DAA7962CC3F2214147BBC3CFAE60FB408B84094E72F42141728D17923D5BFB400819CCD7B7F42141CB3D87A3965AFB4067EC5FD217F521416395803F5F54FB40	5	téléski Dent	\N	\N	\N	2174
5	010500002015550000010000000102000000020000000483AB443DF22141133561EE6A65FB40A00FA41CB9F2214121FF23456B5FFB40	6	Téléski Lac	\N	\N	\N	2186
\.


--
-- Data for Name: lifts_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lifts_test (id, geom, fid, name, length, "time", type, altitude) FROM stdin;
1	01050000201555000001000000010200000002000000D0E77ACE97F62141A1E47099E4E7FB409D1045A8C4F1214126414C9FF569FB40	1	Téléski Nendaz	2293	8m00s	Cabine	2200
2	01050000201555000001000000010200000002000000D08E847911EF21414BF822961C69FB40D788524876F12141A81965BC0767FB40	2	Téléski Jean-Pierre	321	2m00s	Siège	2200
\.


--
-- Data for Name: restaurant_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_test (id, geom, fid, name, altitude) FROM stdin;
1	0106000020155500000100000001030000000100000011000000BC64D46B7DF12141CB2970489066FB401E1D11CE81F1214165FD475D1067FB40F04E61C17EF121417BD266A92267FB40CCA6320C89F12141956E4CD84268FB40FBFDFEB583F121414EA70B0B4F68FB40B4ADA14B98F12141851582175D6AFB40BDC1E968B6F121415B8FB6F3166AFB4026960314B9F12141840349DD6D6AFB40A43F3C0BCEF12141596B447F386AFB4076718CFECAF121411B229349CF69FB4098078279D1F12141BF976C6AB869FB401F68ED90CBF1214186969F1D0C69FB40D1FBB2DDE1F12141FF613BA6D068FB405E78FB3DDAF12141F876024FE467FB40D41F2552C0F121414F282911FE66FB407783C538BAF121410388E8260D66FB40BC64D46B7DF12141CB2970489066FB40	1	Restaurant de Tracouet	2200
2	01060000201555000001000000010300000001000000050000007658ACFF71EE21413C834E103F3CFB402D6C37A38EEE2141492AE029C33CFB40FE13D2177DEE21410F293898B23DFB404700477460EE21413B0F739F323DFB407658ACFF71EE21413C834E103F3CFB40	2	Cabane de Balavaux	2042
3	010600002015550000010000000103000000010000000500000058B196D290ED2141F6706AFFE010FB40E4D22BEAA5ED2141BF6245689F11FB4045B0503E8AED21415C2853026412FB40845C381675ED21413AC8911DA611FB4058B196D290ED2141F6706AFFE010FB40	3	Chalet des Aloes	1770
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: swissgeo_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.swissgeo_city (id, city_name) FROM stdin;
\.


--
-- Data for Name: swissgeo_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.swissgeo_hospital (id, hospital_name, pub_date, city_id) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cantons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cantons_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: swissgeo_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.swissgeo_city_id_seq', 1, false);


--
-- Name: swissgeo_hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.swissgeo_hospital_id_seq', 1, false);


--
-- Name: FirstAid FirstAid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FirstAid"
    ADD CONSTRAINT "FirstAid_pkey" PRIMARY KEY (id);


--
-- Name: Lift  Lift _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lift "
    ADD CONSTRAINT "Lift _pkey" PRIMARY KEY (id);


--
-- Name: LiftEntrance LiftEntrance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LiftEntrance"
    ADD CONSTRAINT "LiftEntrance_pkey" PRIMARY KEY (id);


--
-- Name: Park Park_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Park"
    ADD CONSTRAINT "Park_pkey" PRIMARY KEY (id);


--
-- Name: Restaurant Restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaurant"
    ADD CONSTRAINT "Restaurant_pkey" PRIMARY KEY (id);


--
-- Name: Restroom Restroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restroom"
    ADD CONSTRAINT "Restroom_pkey" PRIMARY KEY (id);


--
-- Name: Slope Slope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Slope"
    ADD CONSTRAINT "Slope_pkey" PRIMARY KEY (id);


--
-- Name: TicketService TicketService_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TicketService"
    ADD CONSTRAINT "TicketService_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cantons cantons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantons
    ADD CONSTRAINT cantons_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: lift_test lift_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lift_test
    ADD CONSTRAINT lift_test_pkey PRIMARY KEY (id);


--
-- Name: lifts_test lifts_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lifts_test
    ADD CONSTRAINT lifts_test_pkey PRIMARY KEY (id);


--
-- Name: restaurant_test restaurant_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_test
    ADD CONSTRAINT restaurant_test_pkey PRIMARY KEY (id);


--
-- Name: swissgeo_city swissgeo_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swissgeo_city
    ADD CONSTRAINT swissgeo_city_pkey PRIMARY KEY (id);


--
-- Name: swissgeo_hospital swissgeo_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swissgeo_hospital
    ADD CONSTRAINT swissgeo_hospital_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cantons_geom_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cantons_geom_id ON public.cantons USING gist (geom);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: swissgeo_hospital_city_id_4924f808; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX swissgeo_hospital_city_id_4924f808 ON public.swissgeo_hospital USING btree (city_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: swissgeo_hospital swissgeo_hospital_city_id_4924f808_fk_swissgeo_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.swissgeo_hospital
    ADD CONSTRAINT swissgeo_hospital_city_id_4924f808_fk_swissgeo_city_id FOREIGN KEY (city_id) REFERENCES public.swissgeo_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

