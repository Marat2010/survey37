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
    answer text
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
    question_text text,
    type_question boolean
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
    date_end timestamp with time zone,
    description text
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
    name character varying(50) NOT NULL
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
    answer_id integer,
    question_id integer NOT NULL,
    survey_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_useranswer OWNER TO postgres;

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
1	Зима
2	Весна
3	Лето
4	Осень
5	
6	Не женат(не замужем)
7	Женат(Замужем)
8	Разведен(а)
9	Меня зовут Марат
10	47
\.


--
-- Data for Name: api_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question (id, question_text, type_question) FROM stdin;
1	Ваше Имя?	\N
2	Какое время года вам нравиться?	t
3	Сколько вам лет?	\N
4	Семейное положение?	f
5	Когда теплее всего?	f
6	Твое хобби?	\N
7	Место твоей работы?	\N
\.


--
-- Data for Name: api_question_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question_answers (id, question_id, answer_id) FROM stdin;
1	1	5
2	2	1
3	2	2
4	2	3
5	2	4
6	3	5
7	4	8
8	4	6
9	4	7
10	5	1
11	5	2
12	5	3
13	5	4
\.


--
-- Data for Name: api_survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey (id, name, date_start, date_end, description) FROM stdin;
3	О Погоде	2021-03-04 19:42:49+00	2021-03-16 19:42:52+00	мнение про погоду
4	О пользователе	2021-03-04 19:55:32+00	2021-03-24 19:55:35+00	Информация о пользователе
5	Прошедший опрос	2021-03-04 22:47:53+00	2021-03-04 22:47:55+00	Проверка на Прошедший опрос
6	Прош2	2021-03-04 23:21:40+00	2021-03-04 23:21:46+00	Прошед 2 проверка
7	прош3	2021-03-05 00:01:40+00	2021-03-05 00:01:42+00	прош3 пров
\.


--
-- Data for Name: api_survey_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey_questions (id, survey_id, question_id) FROM stdin;
1	3	1
2	3	2
3	3	5
4	4	1
5	4	3
6	4	4
7	5	1
8	5	2
9	6	2
10	6	5
11	7	2
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user (id, name) FROM stdin;
1	
2	Тимур
\.


--
-- Data for Name: api_useranswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_useranswer (id, answer_id, question_id, survey_id, user_id) FROM stdin;
1	9	1	4	1
2	10	3	4	1
3	3	5	3	2
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
25	Can add answer	7	add_answer
26	Can change answer	7	change_answer
27	Can delete answer	7	delete_answer
28	Can view answer	7	view_answer
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add survey	9	add_survey
34	Can change survey	9	change_survey
35	Can delete survey	9	delete_survey
36	Can view survey	9	view_survey
37	Can add question	10	add_question
38	Can change question	10	change_question
39	Can delete question	10	delete_question
40	Can view question	10	view_question
41	Can add user answer	11	add_useranswer
42	Can change user answer	11	change_useranswer
43	Can delete user answer	11	delete_useranswer
44	Can view user answer	11	view_useranswer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$150000$UqG0YRWBlUJf$FwkmHq5hGFJnkyv853mQBoqYGeoeFoY+5YsFV+HdSwA=	2021-03-05 21:32:04.419+00	t	marat				t	t	2021-03-03 22:03:33+00
1	pbkdf2_sha256$150000$Qv7ZT7dFEiq9$0ozSyOTDN211whz91DlT/le7rwchHNV2/i/GjZOM9ac=	2021-03-06 13:01:44.960787+00	t	admin			admin@localhost	t	t	2021-03-03 21:42:05.132+00
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
1	2021-03-03 22:03:34.161+00	2	marat	1	[{"added": {}}]	4	1
2	2021-03-03 22:04:10.802+00	2	marat	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	1
3	2021-03-04 16:22:05.677+00	1	Возможно	1	[{"added": {}}]	7	2
4	2021-03-04 16:22:14.46+00	2	Не совсем правильно	1	[{"added": {}}]	7	2
5	2021-03-04 16:22:28.076+00	3	Так не думаю	1	[{"added": {}}]	7	2
6	2021-03-04 16:22:41.215+00	4	Нейтрально	1	[{"added": {}}]	7	2
7	2021-03-04 16:24:57.845+00	1	Личные данные	1	[{"added": {}}]	9	2
8	2021-03-04 16:25:44.975+00	2	О Погоде	1	[{"added": {}}]	9	2
9	2021-03-04 16:47:26.272+00	1	Ваше имя?	1	[{"added": {}}]	10	2
10	2021-03-04 16:52:38.745+00	2	Сколько Вам лет?	1	[{"added": {}}]	10	2
11	2021-03-04 16:53:23.372+00	5	Женат, замужем	1	[{"added": {}}]	7	2
12	2021-03-04 16:53:41.954+00	6	Нет	1	[{"added": {}}]	7	2
13	2021-03-04 16:53:52.057+00	7	Да	1	[{"added": {}}]	7	2
14	2021-03-04 16:54:06.496+00	8	Разведен(а)	1	[{"added": {}}]	7	2
15	2021-03-04 16:55:10.956+00	3	Семейное положение?	1	[{"added": {}}]	10	2
16	2021-03-04 16:55:51.166+00	1	Ваше имя?	2	[{"changed": {"fields": ["answers"]}}]	10	2
17	2021-03-04 16:56:44.21+00	3	Семейное положение?	2	[{"changed": {"fields": ["answers"]}}]	10	2
18	2021-03-04 16:57:12.009+00	3	Семейное положение?	2	[{"changed": {"fields": ["type_question"]}}]	10	2
19	2021-03-04 17:02:05.959+00	9	Весна	1	[{"added": {}}]	7	2
20	2021-03-04 17:02:20.506+00	10	Зима	1	[{"added": {}}]	7	2
21	2021-03-04 17:02:28.84+00	11	Лето	1	[{"added": {}}]	7	2
22	2021-03-04 17:02:48.176+00	12	Осень	1	[{"added": {}}]	7	2
23	2021-03-04 17:02:58.891+00	4	Какое время года вам нравиться?	1	[{"added": {}}]	10	2
24	2021-03-04 17:15:27.095+00	1	Ваше имя?	3		10	2
25	2021-03-04 17:15:27.101+00	4	Какое время года вам нравиться?	3		10	2
26	2021-03-04 17:15:27.107+00	3	Семейное положение?	3		10	2
27	2021-03-04 17:15:27.113+00	2	Сколько Вам лет?	3		10	2
28	2021-03-04 17:15:39.494+00	1	Личные данные	3		9	2
29	2021-03-04 17:15:39.499+00	2	О Погоде	3		9	2
30	2021-03-04 17:15:50.436+00	9	Весна	3		7	2
31	2021-03-04 17:15:50.444+00	1	Возможно	3		7	2
32	2021-03-04 17:15:50.455+00	7	Да	3		7	2
33	2021-03-04 17:15:50.465+00	5	Женат, замужем	3		7	2
34	2021-03-04 17:15:50.473+00	10	Зима	3		7	2
35	2021-03-04 17:15:50.482+00	11	Лето	3		7	2
36	2021-03-04 17:15:50.496+00	2	Не совсем правильно	3		7	2
37	2021-03-04 17:15:50.504+00	4	Нейтрально	3		7	2
38	2021-03-04 17:15:50.517+00	6	Нет	3		7	2
39	2021-03-04 17:15:50.524+00	12	Осень	3		7	2
40	2021-03-04 17:15:50.531+00	8	Разведен(а)	3		7	2
41	2021-03-04 17:15:50.537+00	3	Так не думаю	3		7	2
42	2021-03-04 19:41:56.45+00	1	Crjkmrj ddfv tktk	1	[{"added": {}}]	10	2
43	2021-03-04 19:42:08.517+00	2	11212esdsdds	1	[{"added": {}}]	10	2
44	2021-03-04 19:42:55.199+00	3	zzzz	1	[{"added": {}}]	9	2
45	2021-03-04 19:52:43.735+00	1	Зима	1	[{"added": {}}]	7	2
46	2021-03-04 19:52:48.963+00	2	Весна	1	[{"added": {}}]	7	2
47	2021-03-04 19:52:53.509+00	3	Лето	1	[{"added": {}}]	7	2
48	2021-03-04 19:52:57.488+00	4	Осень	1	[{"added": {}}]	7	2
49	2021-03-04 19:52:59.101+00	5		1	[{"added": {}}]	7	2
50	2021-03-04 19:53:52.234+00	2	Какое время года вам нравиться?	2	[{"changed": {"fields": ["question_text", "answers"]}}]	10	2
51	2021-03-04 19:54:13.737+00	1	Ваше Имя?	2	[{"changed": {"fields": ["question_text", "answers"]}}]	10	2
52	2021-03-04 19:55:03.663+00	3	О Погоде	2	[{"changed": {"fields": ["name", "description"]}}]	9	2
53	2021-03-04 19:56:57.716+00	3	Сколько вам лет?	1	[{"added": {}}]	10	2
54	2021-03-04 19:58:47.208+00	6	Не женат(не замужем)	1	[{"added": {}}]	7	2
55	2021-03-04 19:59:13.529+00	7	Женат(Замужем)	1	[{"added": {}}]	7	2
56	2021-03-04 19:59:33.198+00	8	Разведен(а)	1	[{"added": {}}]	7	2
57	2021-03-04 19:59:49.832+00	4	Семейное положение?	1	[{"added": {}}]	10	2
58	2021-03-04 20:00:03.808+00	4	О пользователе	1	[{"added": {}}]	9	2
59	2021-03-04 20:24:50.291+00	1	as	1	[{"added": {}}]	8	2
60	2021-03-04 20:27:34.793+00	1	as	3		8	2
61	2021-03-04 20:28:16.555+00	1		1	[{"added": {}}]	8	2
62	2021-03-04 20:28:30.935+00	2	as	1	[{"added": {}}]	8	2
63	2021-03-04 20:31:01.373+00	1		3		8	2
64	2021-03-04 20:31:01.378+00	2	as	3		8	2
65	2021-03-04 20:34:30.675+00	1		1	[{"added": {}}]	8	2
66	2021-03-04 21:00:26.761+00	1	UserAnswer object (1)	1	[{"added": {}}]	11	2
67	2021-03-04 21:55:43.234+00	9	Меня зовут Марат	1	[{"added": {}}]	7	2
68	2021-03-04 21:55:47.777+00	1	UserAnswer object (1)	2	[{"changed": {"fields": ["answer"]}}]	11	2
69	2021-03-04 21:57:27.325+00	10	47	1	[{"added": {}}]	7	2
70	2021-03-04 21:57:49.24+00	2	UserAnswer object (2)	1	[{"added": {}}]	11	2
71	2021-03-04 22:02:24.825+00	2	2	1	[{"added": {}}]	8	2
72	2021-03-04 22:05:44.1+00	5	Когда теплее всего?	1	[{"added": {}}]	10	2
73	2021-03-04 22:05:58.94+00	3	О Погоде	2	[{"changed": {"fields": ["questions"]}}]	9	2
74	2021-03-04 22:07:48.166+00	3	UserAnswer object (3)	1	[{"added": {}}]	11	2
75	2021-03-04 22:48:36.984+00	5	Прошедший опрос	1	[{"added": {}}]	9	2
76	2021-03-04 23:21:59.686+00	6	Прош2	1	[{"added": {}}]	9	2
77	2021-03-05 00:01:54.468+00	7	прош3	1	[{"added": {}}]	9	2
78	2021-03-05 23:01:10.264+00	6	Твое хобби?	1	[{"added": {}}]	10	1
79	2021-03-05 23:03:15.252+00	7	Место твоей работы?	1	[{"added": {}}]	10	1
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
1	contenttypes	0001_initial	2021-03-06 12:57:27.214537+00
2	auth	0001_initial	2021-03-06 12:57:27.313906+00
3	admin	0001_initial	2021-03-06 12:57:27.454655+00
4	admin	0002_logentry_remove_auto_add	2021-03-06 12:57:27.502709+00
5	admin	0003_logentry_add_action_flag_choices	2021-03-06 12:57:27.536302+00
6	api	0001_initial	2021-03-06 12:57:27.681454+00
7	api	0002_auto_20210304_2013	2021-03-06 12:57:27.993231+00
8	api	0003_auto_20210304_2131	2021-03-06 12:57:28.083449+00
9	api	0004_auto_20210304_2159	2021-03-06 12:57:28.137324+00
10	api	0005_auto_20210304_2250	2021-03-06 12:57:28.216434+00
11	api	0006_user	2021-03-06 12:57:28.261644+00
12	api	0007_auto_20210304_2327	2021-03-06 12:57:28.279461+00
13	api	0008_auto_20210304_2331	2021-03-06 12:57:28.295705+00
14	api	0009_auto_20210304_2333	2021-03-06 12:57:28.314435+00
15	api	0010_auto_20210304_2334	2021-03-06 12:57:28.325024+00
16	api	0011_useranswer	2021-03-06 12:57:28.352589+00
17	api	0012_auto_20210305_0220	2021-03-06 12:57:28.48935+00
18	api	0013_auto_20210305_0259	2021-03-06 12:57:28.518568+00
19	api	0014_auto_20210306_0207	2021-03-06 12:57:28.567643+00
20	contenttypes	0002_remove_content_type_name	2021-03-06 12:57:28.637901+00
21	auth	0002_alter_permission_name_max_length	2021-03-06 12:57:28.653298+00
22	auth	0003_alter_user_email_max_length	2021-03-06 12:57:28.678148+00
23	auth	0004_alter_user_username_opts	2021-03-06 12:57:28.702894+00
24	auth	0005_alter_user_last_login_null	2021-03-06 12:57:28.726927+00
25	auth	0006_require_contenttypes_0002	2021-03-06 12:57:28.732794+00
26	auth	0007_alter_validators_add_error_messages	2021-03-06 12:57:28.754474+00
27	auth	0008_alter_user_username_max_length	2021-03-06 12:57:28.789039+00
28	auth	0009_alter_user_last_name_max_length	2021-03-06 12:57:28.823964+00
29	auth	0010_alter_group_name_max_length	2021-03-06 12:57:28.84825+00
30	auth	0011_update_proxy_permissions	2021-03-06 12:57:28.878594+00
31	sessions	0001_initial	2021-03-06 12:57:28.898114+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
061rtn9wy1vq5at0zs6nhs5a0hjku8z7	NWU1MTM2NTY3YTRkMjU0Mzg4YTZiYzJmZWZiZmUxOGQyMTJlMzYxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzJkMjRiOGQzZTc0ZmUwYjNiZmJhOGRlODc0MTRhOGUwOWViZTU0In0=	2021-03-20 10:27:17.522+00
1ahj8erewttc77kf1na2wv5z6sllahzn	NWU1MTM2NTY3YTRkMjU0Mzg4YTZiYzJmZWZiZmUxOGQyMTJlMzYxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzJkMjRiOGQzZTc0ZmUwYjNiZmJhOGRlODc0MTRhOGUwOWViZTU0In0=	2021-03-19 21:34:50.371+00
3kbx0w44u9dwdn9r245b5xl5pohnw6pu	NzJmNTgwMjQyMzUxYzc2ZjUxNmZkYjg3ZjU4NjE0ZmQyMjE5Y2MzZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NzYzZTIzYzZkY2UwYjRiZDE0MWQ5YjVlZDczZGQzZDRmMTFkN2NlIn0=	2021-03-18 16:00:54.267+00
bogtz14d24h626cgxlq2w2evkn4wequ7	NzJmNTgwMjQyMzUxYzc2ZjUxNmZkYjg3ZjU4NjE0ZmQyMjE5Y2MzZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NzYzZTIzYzZkY2UwYjRiZDE0MWQ5YjVlZDczZGQzZDRmMTFkN2NlIn0=	2021-03-18 12:06:11.996+00
cv5ljai9i12pxooyz6xj9gzkcw2m4o97	NWU1MTM2NTY3YTRkMjU0Mzg4YTZiYzJmZWZiZmUxOGQyMTJlMzYxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzJkMjRiOGQzZTc0ZmUwYjNiZmJhOGRlODc0MTRhOGUwOWViZTU0In0=	2021-03-20 10:47:23.428+00
rhmji8rcsjqfurkb4lgd7jkjrqbzybna	NzJmNTgwMjQyMzUxYzc2ZjUxNmZkYjg3ZjU4NjE0ZmQyMjE5Y2MzZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NzYzZTIzYzZkY2UwYjRiZDE0MWQ5YjVlZDczZGQzZDRmMTFkN2NlIn0=	2021-03-18 16:29:15.111+00
rlxkr8y4sflmb3ds9wyhpd4fny5uei2r	NWU1MTM2NTY3YTRkMjU0Mzg4YTZiYzJmZWZiZmUxOGQyMTJlMzYxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzJkMjRiOGQzZTc0ZmUwYjNiZmJhOGRlODc0MTRhOGUwOWViZTU0In0=	2021-03-20 13:01:44.966018+00
\.


--
-- Name: api_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_answer_id_seq', 10, true);


--
-- Name: api_question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_answers_id_seq', 13, true);


--
-- Name: api_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_id_seq', 7, true);


--
-- Name: api_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_id_seq', 7, true);


--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_questions_id_seq', 11, true);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_id_seq', 2, true);


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_useranswer_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 79, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


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
-- Name: api_useranswer_answer_id_3b7dd93e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_answer_id_3b7dd93e ON public.api_useranswer USING btree (answer_id);


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
-- Name: api_useranswer api_useranswer_answer_id_3b7dd93e_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_answer_id_3b7dd93e_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


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

