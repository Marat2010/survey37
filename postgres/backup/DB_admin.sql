--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

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
-- Name: api_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_answer (
    id integer NOT NULL,
    answer text NOT NULL
);


ALTER TABLE public.api_answer OWNER TO postgres;

--
-- Name: api_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_answer_id_seq OWNER TO postgres;

--
-- Name: api_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_answer_id_seq OWNED BY public.api_answer.id;


--
-- Name: api_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_question (
    id integer NOT NULL,
    question_text text NOT NULL,
    type_answer character varying(1) NOT NULL
);


ALTER TABLE public.api_question OWNER TO postgres;

--
-- Name: api_question_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_question_answers (
    id integer NOT NULL,
    question_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_question_answers OWNER TO postgres;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_question_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_answers_id_seq OWNER TO postgres;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_question_answers_id_seq OWNED BY public.api_question_answers.id;


--
-- Name: api_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_id_seq OWNER TO postgres;

--
-- Name: api_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_question_id_seq OWNED BY public.api_question.id;


--
-- Name: api_survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_survey (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_start timestamp with time zone NOT NULL,
    date_end timestamp with time zone NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.api_survey OWNER TO postgres;

--
-- Name: api_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_id_seq OWNER TO postgres;

--
-- Name: api_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_survey_id_seq OWNED BY public.api_survey.id;


--
-- Name: api_survey_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_survey_questions (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.api_survey_questions OWNER TO postgres;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_survey_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_questions_id_seq OWNER TO postgres;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_survey_questions_id_seq OWNED BY public.api_survey_questions.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_user (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.api_user OWNER TO postgres;

--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO postgres;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_useranswer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_useranswer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    survey_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_useranswer OWNER TO postgres;

--
-- Name: api_useranswer_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_useranswer_answer (
    id integer NOT NULL,
    useranswer_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_useranswer_answer OWNER TO postgres;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_useranswer_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_answer_id_seq OWNER TO postgres;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_useranswer_answer_id_seq OWNED BY public.api_useranswer_answer.id;


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_useranswer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_id_seq OWNER TO postgres;

--
-- Name: api_useranswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_useranswer_id_seq OWNED BY public.api_useranswer.id;


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
-- Name: api_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_answer ALTER COLUMN id SET DEFAULT nextval('public.api_answer_id_seq'::regclass);


--
-- Name: api_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question ALTER COLUMN id SET DEFAULT nextval('public.api_question_id_seq'::regclass);


--
-- Name: api_question_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers ALTER COLUMN id SET DEFAULT nextval('public.api_question_answers_id_seq'::regclass);


--
-- Name: api_survey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey ALTER COLUMN id SET DEFAULT nextval('public.api_survey_id_seq'::regclass);


--
-- Name: api_survey_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.api_survey_questions_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_useranswer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_id_seq'::regclass);


--
-- Name: api_useranswer_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_answer_id_seq'::regclass);


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
-- Data for Name: api_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_answer (id, answer) FROM stdin;
\.


--
-- Data for Name: api_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question (id, question_text, type_answer) FROM stdin;
\.


--
-- Data for Name: api_question_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question_answers (id, question_id, answer_id) FROM stdin;
\.


--
-- Data for Name: api_survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey (id, name, date_start, date_end, description) FROM stdin;
\.


--
-- Data for Name: api_survey_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey_questions (id, survey_id, question_id) FROM stdin;
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user (id, name) FROM stdin;
1	AnonymousUser
2	AnonymousUser
\.


--
-- Data for Name: api_useranswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_useranswer (id, question_id, survey_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_useranswer_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_useranswer_answer (id, useranswer_id, answer_id) FROM stdin;
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
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Вопрос	7	add_question
26	Can change Вопрос	7	change_question
27	Can delete Вопрос	7	delete_question
28	Can view Вопрос	7	view_question
29	Can add Опрос	8	add_survey
30	Can change Опрос	8	change_survey
31	Can delete Опрос	8	delete_survey
32	Can view Опрос	8	view_survey
33	Can add Ответ	9	add_answer
34	Can change Ответ	9	change_answer
35	Can delete Ответ	9	delete_answer
36	Can view Ответ	9	view_answer
37	Can add Пользователь	10	add_user
38	Can change Пользователь	10	change_user
39	Can delete Пользователь	10	delete_user
40	Can view Пользователь	10	view_user
41	Can add Ответ Пользователя	11	add_useranswer
42	Can change Ответ Пользователя	11	change_useranswer
43	Can delete Ответ Пользователя	11	delete_useranswer
44	Can view Ответ Пользователя	11	view_useranswer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$LlyK3yHl7luS$DRbOk5ImfYu5vd+dHMT5hJdDUsTAWL7e8TsGRmfzf4A=	2021-03-20 10:51:53.360469+00	t	admin			adm@localhost	t	t	2021-03-20 10:51:42.938598+00
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
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	question
8	api	survey
9	api	answer
10	api	user
11	api	useranswer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-20 10:47:18.649547+00
2	auth	0001_initial	2021-03-20 10:47:18.754498+00
3	admin	0001_initial	2021-03-20 10:47:18.880399+00
4	admin	0002_logentry_remove_auto_add	2021-03-20 10:47:18.921241+00
5	admin	0003_logentry_add_action_flag_choices	2021-03-20 10:47:18.94495+00
6	api	0001_initial	2021-03-20 10:47:19.106633+00
7	api	0002_auto_20210304_2013	2021-03-20 10:47:19.421432+00
8	api	0003_auto_20210304_2131	2021-03-20 10:47:19.520537+00
9	api	0004_auto_20210304_2159	2021-03-20 10:47:19.578653+00
10	api	0005_auto_20210304_2250	2021-03-20 10:47:19.651171+00
11	api	0006_user	2021-03-20 10:47:19.68953+00
12	api	0007_auto_20210304_2327	2021-03-20 10:47:19.707361+00
13	api	0008_auto_20210304_2331	2021-03-20 10:47:19.726427+00
14	api	0009_auto_20210304_2333	2021-03-20 10:47:19.741239+00
15	api	0010_auto_20210304_2334	2021-03-20 10:47:19.751705+00
16	api	0011_useranswer	2021-03-20 10:47:19.786561+00
17	api	0012_auto_20210305_0220	2021-03-20 10:47:19.928318+00
18	api	0013_auto_20210305_0259	2021-03-20 10:47:19.960799+00
19	api	0014_auto_20210306_0207	2021-03-20 10:47:20.017489+00
20	api	0015_auto_20210306_2355	2021-03-20 10:47:20.044501+00
21	api	0016_auto_20210307_1859	2021-03-20 10:47:20.103654+00
22	api	0017_auto_20210307_1901	2021-03-20 10:47:20.166959+00
23	api	0018_auto_20210307_1903	2021-03-20 10:47:20.210466+00
24	api	0019_auto_20210307_1905	2021-03-20 10:47:20.259152+00
25	api	0020_auto_20210307_1906	2021-03-20 10:47:20.324455+00
26	api	0021_auto_20210307_1919	2021-03-20 10:47:20.368589+00
27	api	0022_auto_20210307_1930	2021-03-20 10:47:20.408701+00
28	api	0023_auto_20210307_1932	2021-03-20 10:47:20.48022+00
29	api	0024_auto_20210307_1948	2021-03-20 10:47:20.537858+00
30	api	0025_auto_20210307_2000	2021-03-20 10:47:20.581265+00
31	api	0026_auto_20210311_1948	2021-03-20 10:47:20.614971+00
32	api	0027_auto_20210311_2014	2021-03-20 10:47:20.895276+00
33	api	0028_auto_20210312_1228	2021-03-20 10:47:20.944163+00
34	api	0029_auto_20210312_1943	2021-03-20 10:47:21.037522+00
35	api	0030_auto_20210320_0108	2021-03-20 10:47:21.121632+00
36	contenttypes	0002_remove_content_type_name	2021-03-20 10:47:21.212129+00
37	auth	0002_alter_permission_name_max_length	2021-03-20 10:47:21.229+00
38	auth	0003_alter_user_email_max_length	2021-03-20 10:47:21.256942+00
39	auth	0004_alter_user_username_opts	2021-03-20 10:47:21.283221+00
40	auth	0005_alter_user_last_login_null	2021-03-20 10:47:21.30961+00
41	auth	0006_require_contenttypes_0002	2021-03-20 10:47:21.316218+00
42	auth	0007_alter_validators_add_error_messages	2021-03-20 10:47:21.349063+00
43	auth	0008_alter_user_username_max_length	2021-03-20 10:47:21.386693+00
44	auth	0009_alter_user_last_name_max_length	2021-03-20 10:47:21.414062+00
45	auth	0010_alter_group_name_max_length	2021-03-20 10:47:21.443363+00
46	auth	0011_update_proxy_permissions	2021-03-20 10:47:21.481736+00
47	sessions	0001_initial	2021-03-20 10:47:21.504411+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r9i467rlnimccd9hdbl3pb2lknk8p06p	MGUwNGE2NGM2OTI1ODYyMjhjNzU3NjE0NGQ0Y2RmMWVlNzkwZWVkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWY5MThlMWEwOTMxYzRlMzU0OWU3ZWYxMjhmZmI3ZWU2OGY2Y2NmIn0=	2021-04-03 10:51:53.367362+00
2y77g3n7o434nlwnhrsyzkvu3e5nk5tu	MWE4NGVhNTRhZDgzM2RjYjJkOTM0MzRkNDI0M2QyMmJkOTc5YzgzZTp7InVzZXJfc2Vzc2lvbiI6MX0=	2021-04-03 10:52:08.283627+00
dmchsdquwa65xnhe2har07yb44bj1dfu	YWUwNjc3ODE4NTE5YmI2ZjA3MjljYTUwNjU5ZDgxMmI5Y2ZiNGJhYzp7InVzZXJfc2Vzc2lvbiI6Mn0=	2021-04-03 11:11:26.633506+00
\.


--
-- Name: api_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_answer_id_seq', 1, false);


--
-- Name: api_question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_answers_id_seq', 1, false);


--
-- Name: api_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_id_seq', 1, false);


--
-- Name: api_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_id_seq', 1, false);


--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_questions_id_seq', 1, false);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_id_seq', 2, true);


--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_useranswer_answer_id_seq', 1, false);


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_useranswer_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


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
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 47, true);


--
-- Name: api_answer api_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_answer
    ADD CONSTRAINT api_answer_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_question_id_answer_id_cc7ec79d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_answer_id_cc7ec79d_uniq UNIQUE (question_id, answer_id);


--
-- Name: api_question api_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question
    ADD CONSTRAINT api_question_pkey PRIMARY KEY (id);


--
-- Name: api_survey api_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey
    ADD CONSTRAINT api_survey_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_survey_id_question_id_94640fc2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_question_id_94640fc2_uniq UNIQUE (survey_id, question_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq UNIQUE (useranswer_id, answer_id);


--
-- Name: api_useranswer api_useranswer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_pkey PRIMARY KEY (id);


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
-- Name: api_question_answers_answer_id_e042d42d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_question_answers_answer_id_e042d42d ON public.api_question_answers USING btree (answer_id);


--
-- Name: api_question_answers_question_id_c6a78bf4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_question_answers_question_id_c6a78bf4 ON public.api_question_answers USING btree (question_id);


--
-- Name: api_survey_date_end_4977d1cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_date_end_4977d1cd ON public.api_survey USING btree (date_end);


--
-- Name: api_survey_date_start_7b596edf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_date_start_7b596edf ON public.api_survey USING btree (date_start);


--
-- Name: api_survey_questions_question_id_1beb7d3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_questions_question_id_1beb7d3b ON public.api_survey_questions USING btree (question_id);


--
-- Name: api_survey_questions_survey_id_bd41f0c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_questions_survey_id_bd41f0c5 ON public.api_survey_questions USING btree (survey_id);


--
-- Name: api_useranswer_answer_answer_id_4dfdce7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_answer_answer_id_4dfdce7a ON public.api_useranswer_answer USING btree (answer_id);


--
-- Name: api_useranswer_answer_useranswer_id_217efb29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_answer_useranswer_id_217efb29 ON public.api_useranswer_answer USING btree (useranswer_id);


--
-- Name: api_useranswer_question_id_1b9aaa53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_question_id_1b9aaa53 ON public.api_useranswer USING btree (question_id);


--
-- Name: api_useranswer_survey_id_09e0aac4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_survey_id_09e0aac4 ON public.api_useranswer USING btree (survey_id);


--
-- Name: api_useranswer_user_id_a7a24a0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_user_id_a7a24a0d ON public.api_useranswer USING btree (user_id);


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
-- Name: api_question_answers api_question_answers_answer_id_e042d42d_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_answer_id_e042d42d_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_question_answers api_question_answers_question_id_c6a78bf4_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_c6a78bf4_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_question_id_1beb7d3b_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_question_id_1beb7d3b_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answe_useranswer_id_217efb29_fk_api_usera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answe_useranswer_id_217efb29_fk_api_usera FOREIGN KEY (useranswer_id) REFERENCES public.api_useranswer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_question_id_1b9aaa53_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_question_id_1b9aaa53_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_survey_id_09e0aac4_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_survey_id_09e0aac4_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_user_id_a7a24a0d_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_user_id_a7a24a0d_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- PostgreSQL database dump complete
--

