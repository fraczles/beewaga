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
-- Name: accounts_regularuser; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_regularuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(20) NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(30),
    last_name character varying(50),
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    user_image character varying(100) NOT NULL,
    user_bio character varying(600) NOT NULL
);


ALTER TABLE public.accounts_regularuser OWNER TO afracza1;

--
-- Name: accounts_regularuser_groups; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_regularuser_groups (
    id integer NOT NULL,
    regularuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_regularuser_groups OWNER TO afracza1;

--
-- Name: accounts_regularuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE accounts_regularuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_regularuser_groups_id_seq OWNER TO afracza1;

--
-- Name: accounts_regularuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE accounts_regularuser_groups_id_seq OWNED BY accounts_regularuser_groups.id;


--
-- Name: accounts_regularuser_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE accounts_regularuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_regularuser_id_seq OWNER TO afracza1;

--
-- Name: accounts_regularuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE accounts_regularuser_id_seq OWNED BY accounts_regularuser.id;


--
-- Name: accounts_regularuser_user_permissions; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_regularuser_user_permissions (
    id integer NOT NULL,
    regularuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_regularuser_user_permissions OWNER TO afracza1;

--
-- Name: accounts_regularuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE accounts_regularuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_regularuser_user_permissions_id_seq OWNER TO afracza1;

--
-- Name: accounts_regularuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE accounts_regularuser_user_permissions_id_seq OWNED BY accounts_regularuser_user_permissions.id;


--
-- Name: accounts_tutor; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_tutor (
    regularuser_ptr_id integer NOT NULL,
    tutor_image character varying(100) NOT NULL,
    tutor_bio character varying(600) NOT NULL
);


ALTER TABLE public.accounts_tutor OWNER TO afracza1;

--
-- Name: accounts_tutorprofile; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_tutorprofile (
    id integer NOT NULL,
    supporters_id integer NOT NULL,
    tutor_id integer NOT NULL
);


ALTER TABLE public.accounts_tutorprofile OWNER TO afracza1;

--
-- Name: accounts_tutorprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE accounts_tutorprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_tutorprofile_id_seq OWNER TO afracza1;

--
-- Name: accounts_tutorprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE accounts_tutorprofile_id_seq OWNED BY accounts_tutorprofile.id;


--
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE accounts_userprofile (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO afracza1;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE accounts_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO afracza1;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE accounts_userprofile_id_seq OWNED BY accounts_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO afracza1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO afracza1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO afracza1;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO afracza1;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO afracza1;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO afracza1;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO afracza1;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO afracza1;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO afracza1;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO afracza1;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO afracza1;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: afracza1
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO afracza1;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: afracza1
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO afracza1;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser ALTER COLUMN id SET DEFAULT nextval('accounts_regularuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_groups ALTER COLUMN id SET DEFAULT nextval('accounts_regularuser_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('accounts_regularuser_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_tutorprofile ALTER COLUMN id SET DEFAULT nextval('accounts_tutorprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('accounts_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: accounts_regularuser; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_regularuser (id, password, last_login, is_superuser, username, email, first_name, last_name, date_joined, is_active, is_staff, user_image, user_bio) FROM stdin;
1	pbkdf2_sha256$15000$COqdBdBPeuh9$ZoAZs/Dq+lrrbC3E9kU/VlogAuCpcuzzyN0IsSPfPb8=	2015-02-22 12:02:13.316693-05	t	afracza1	afracza1@binghamton.edu	\N	\N	2015-02-22 12:02:13.412033-05	t	t	/static/gfx/logo.png	
\.


--
-- Data for Name: accounts_regularuser_groups; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_regularuser_groups (id, regularuser_id, group_id) FROM stdin;
\.


--
-- Name: accounts_regularuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('accounts_regularuser_groups_id_seq', 1, false);


--
-- Name: accounts_regularuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('accounts_regularuser_id_seq', 1, true);


--
-- Data for Name: accounts_regularuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_regularuser_user_permissions (id, regularuser_id, permission_id) FROM stdin;
\.


--
-- Name: accounts_regularuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('accounts_regularuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: accounts_tutor; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_tutor (regularuser_ptr_id, tutor_image, tutor_bio) FROM stdin;
\.


--
-- Data for Name: accounts_tutorprofile; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_tutorprofile (id, supporters_id, tutor_id) FROM stdin;
\.


--
-- Name: accounts_tutorprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('accounts_tutorprofile_id_seq', 1, false);


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY accounts_userprofile (id, user_id) FROM stdin;
\.


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('accounts_userprofile_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add regular user	6	add_regularuser
17	Can change regular user	6	change_regularuser
18	Can delete regular user	6	delete_regularuser
19	Can add tutor	7	add_tutor
20	Can change tutor	7	change_tutor
21	Can delete tutor	7	delete_tutor
22	Can add user profile	8	add_userprofile
23	Can change user profile	8	change_userprofile
24	Can delete user profile	8	delete_userprofile
25	Can add tutor profile	9	add_tutorprofile
26	Can change tutor profile	9	change_tutorprofile
27	Can delete tutor profile	9	delete_tutorprofile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	content type	contenttypes	contenttype
5	session	sessions	session
6	regular user	accounts	regularuser
7	tutor	accounts	tutor
8	user profile	accounts	userprofile
9	tutor profile	accounts	tutorprofile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-02-22 12:01:57.699038-05
2	auth	0001_initial	2015-02-22 12:01:57.742129-05
3	accounts	0001_initial	2015-02-22 12:01:57.945638-05
4	admin	0001_initial	2015-02-22 12:01:57.994791-05
5	sessions	0001_initial	2015-02-22 12:01:58.004966-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: afracza1
--

SELECT pg_catalog.setval('django_migrations_id_seq', 5, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: afracza1
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: accounts_regularuser_email_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser
    ADD CONSTRAINT accounts_regularuser_email_key UNIQUE (email);


--
-- Name: accounts_regularuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser_groups
    ADD CONSTRAINT accounts_regularuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_regularuser_groups_regularuser_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser_groups
    ADD CONSTRAINT accounts_regularuser_groups_regularuser_id_group_id_key UNIQUE (regularuser_id, group_id);


--
-- Name: accounts_regularuser_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser
    ADD CONSTRAINT accounts_regularuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_regularuser_user_perm_regularuser_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser_user_permissions
    ADD CONSTRAINT accounts_regularuser_user_perm_regularuser_id_permission_id_key UNIQUE (regularuser_id, permission_id);


--
-- Name: accounts_regularuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser_user_permissions
    ADD CONSTRAINT accounts_regularuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_regularuser_username_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_regularuser
    ADD CONSTRAINT accounts_regularuser_username_key UNIQUE (username);


--
-- Name: accounts_tutor_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_tutor
    ADD CONSTRAINT accounts_tutor_pkey PRIMARY KEY (regularuser_ptr_id);


--
-- Name: accounts_tutorprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_tutorprofile
    ADD CONSTRAINT accounts_tutorprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_tutorprofile_tutor_id_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_tutorprofile
    ADD CONSTRAINT accounts_tutorprofile_tutor_id_key UNIQUE (tutor_id);


--
-- Name: accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: afracza1; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: accounts_regularuser_email_5975996bdb6748f8_like; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_email_5975996bdb6748f8_like ON accounts_regularuser USING btree (email varchar_pattern_ops);


--
-- Name: accounts_regularuser_groups_0e939a4f; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_groups_0e939a4f ON accounts_regularuser_groups USING btree (group_id);


--
-- Name: accounts_regularuser_groups_6ef2bd31; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_groups_6ef2bd31 ON accounts_regularuser_groups USING btree (regularuser_id);


--
-- Name: accounts_regularuser_user_permissions_6ef2bd31; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_user_permissions_6ef2bd31 ON accounts_regularuser_user_permissions USING btree (regularuser_id);


--
-- Name: accounts_regularuser_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_user_permissions_8373b171 ON accounts_regularuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_regularuser_username_29c7c626c7adff17_like; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_regularuser_username_29c7c626c7adff17_like ON accounts_regularuser USING btree (username varchar_pattern_ops);


--
-- Name: accounts_tutorprofile_29c2d384; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX accounts_tutorprofile_29c2d384 ON accounts_tutorprofile USING btree (supporters_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: afracza1; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: acco_regularuser_id_2cab8a6a5f5b5dae_fk_accounts_regularuser_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_user_permissions
    ADD CONSTRAINT acco_regularuser_id_2cab8a6a5f5b5dae_fk_accounts_regularuser_id FOREIGN KEY (regularuser_id) REFERENCES accounts_regularuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acco_regularuser_id_2ec9798af72eccbc_fk_accounts_regularuser_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_groups
    ADD CONSTRAINT acco_regularuser_id_2ec9798af72eccbc_fk_accounts_regularuser_id FOREIGN KEY (regularuser_id) REFERENCES accounts_regularuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accoun_supporters_id_2f25f07da72b892_fk_accounts_userprofile_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_tutorprofile
    ADD CONSTRAINT accoun_supporters_id_2f25f07da72b892_fk_accounts_userprofile_id FOREIGN KEY (supporters_id) REFERENCES accounts_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_r_permission_id_451278f288487dc3_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_user_permissions
    ADD CONSTRAINT accounts_r_permission_id_451278f288487dc3_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_regularuser_group_id_15eb00ebe5261eee_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_regularuser_groups
    ADD CONSTRAINT accounts_regularuser_group_id_15eb00ebe5261eee_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_use_user_id_3c4c1a3843c1abe_fk_accounts_regularuser_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_use_user_id_3c4c1a3843c1abe_fk_accounts_regularuser_id FOREIGN KEY (user_id) REFERENCES accounts_regularuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admi_user_id_52fdd58701c5f563_fk_accounts_regularuser_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admi_user_id_52fdd58701c5f563_fk_accounts_regularuser_id FOREIGN KEY (user_id) REFERENCES accounts_regularuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: regularuser_ptr_id_12e6f9f934fe07c8_fk_accounts_regularuser_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_tutor
    ADD CONSTRAINT regularuser_ptr_id_12e6f9f934fe07c8_fk_accounts_regularuser_id FOREIGN KEY (regularuser_ptr_id) REFERENCES accounts_regularuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tutor_id_16a5084dd4b7aeea_fk_accounts_tutor_regularuser_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: afracza1
--

ALTER TABLE ONLY accounts_tutorprofile
    ADD CONSTRAINT tutor_id_16a5084dd4b7aeea_fk_accounts_tutor_regularuser_ptr_id FOREIGN KEY (tutor_id) REFERENCES accounts_tutor(regularuser_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: afracza1
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM afracza1;
GRANT ALL ON SCHEMA public TO afracza1;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

