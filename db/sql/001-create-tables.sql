--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-09 21:07:11 JST

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
-- TOC entry 202 (class 1259 OID 16387)
-- Name: answer_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer_score (
    id integer NOT NULL,
    score integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean
);


ALTER TABLE public.answer_score OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16390)
-- Name: answer_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_score_id_seq OWNER TO postgres;

--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 203
-- Name: answer_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_score_id_seq OWNED BY public.answer_score.id;


--
-- TOC entry 204 (class 1259 OID 16392)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    question_id character varying(80) NOT NULL,
    question json NOT NULL,
    page_title json,
    visible_if character varying(80),
    reverse_score boolean,
    scoring_rule_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean,
    survey_id integer NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16398)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 205
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- TOC entry 206 (class 1259 OID 16400)
-- Name: score_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.score_type (
    id integer NOT NULL,
    score_type_id character varying(80) NOT NULL,
    title character varying(80) NOT NULL,
    items character varying[] NOT NULL,
    calculation_rule_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean,
    survey_id integer NOT NULL
);


ALTER TABLE public.score_type OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16406)
-- Name: score_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.score_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_type_id_seq OWNER TO postgres;

--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 207
-- Name: score_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.score_type_id_seq OWNED BY public.score_type.id;


--
-- TOC entry 208 (class 1259 OID 16408)
-- Name: survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey (
    id integer NOT NULL,
    survey_id character varying(80) NOT NULL,
    title json NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean
);


ALTER TABLE public.survey OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16414)
-- Name: survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_id_seq OWNER TO postgres;

--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 209
-- Name: survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_id_seq OWNED BY public.survey.id;


--
-- TOC entry 210 (class 1259 OID 16416)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    person_id character varying(80) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16419)
-- Name: user_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_answer (
    id integer NOT NULL,
    answer integer,
    text character varying(80),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean,
    user_survey_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_score_id integer NOT NULL
);


ALTER TABLE public.user_answer OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16422)
-- Name: user_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_answer_id_seq OWNER TO postgres;

--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_answer_id_seq OWNED BY public.user_answer.id;


--
-- TOC entry 213 (class 1259 OID 16424)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 213
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 214 (class 1259 OID 16426)
-- Name: user_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_score (
    id integer NOT NULL,
    name character varying(80),
    score double precision,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean,
    user_survey_id integer NOT NULL,
    score_type_id integer NOT NULL
);


ALTER TABLE public.user_score OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16429)
-- Name: user_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_score_id_seq OWNER TO postgres;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_score_id_seq OWNED BY public.user_score.id;


--
-- TOC entry 216 (class 1259 OID 16431)
-- Name: user_survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_survey (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted boolean,
    user_id integer NOT NULL,
    survey_id integer NOT NULL
);


ALTER TABLE public.user_survey OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16434)
-- Name: user_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_survey_id_seq OWNER TO postgres;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_survey_id_seq OWNED BY public.user_survey.id;


--
-- TOC entry 3102 (class 2604 OID 16436)
-- Name: answer_score id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_score ALTER COLUMN id SET DEFAULT nextval('public.answer_score_id_seq'::regclass);


--
-- TOC entry 3103 (class 2604 OID 16437)
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- TOC entry 3104 (class 2604 OID 16438)
-- Name: score_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score_type ALTER COLUMN id SET DEFAULT nextval('public.score_type_id_seq'::regclass);


--
-- TOC entry 3105 (class 2604 OID 16439)
-- Name: survey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey ALTER COLUMN id SET DEFAULT nextval('public.survey_id_seq'::regclass);


--
-- TOC entry 3106 (class 2604 OID 16440)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3107 (class 2604 OID 16441)
-- Name: user_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answer ALTER COLUMN id SET DEFAULT nextval('public.user_answer_id_seq'::regclass);


--
-- TOC entry 3108 (class 2604 OID 16442)
-- Name: user_score id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_score ALTER COLUMN id SET DEFAULT nextval('public.user_score_id_seq'::regclass);


--
-- TOC entry 3109 (class 2604 OID 16443)
-- Name: user_survey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_survey ALTER COLUMN id SET DEFAULT nextval('public.user_survey_id_seq'::regclass);


--
-- TOC entry 3267 (class 0 OID 16387)
-- Dependencies: 202
-- Data for Name: answer_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer_score (id, score, created_at, updated_at, deleted) FROM stdin;
1	4	2020-05-07 11:52:04.15236+09	\N	f
2	2	2020-05-07 11:52:04.178359+09	\N	f
3	2	2020-05-07 11:52:04.18036+09	\N	f
4	1	2020-05-07 11:52:04.181361+09	\N	f
5	2	2020-05-07 11:52:04.181361+09	\N	f
6	1	2020-05-07 11:52:04.18236+09	\N	f
7	2	2020-05-07 11:52:04.183359+09	\N	f
8	3	2020-05-07 11:52:04.183359+09	\N	f
9	3	2020-05-07 11:52:04.184357+09	\N	f
10	1	2020-05-07 11:52:04.185358+09	\N	f
11	2	2020-05-07 11:52:04.185358+09	\N	f
12	3	2020-05-07 11:52:04.186358+09	\N	f
13	1	2020-05-07 11:52:04.186358+09	\N	f
14	2	2020-05-07 11:52:04.187359+09	\N	f
15	2	2020-05-07 11:52:04.188358+09	\N	f
16	4	2020-05-07 11:52:04.188358+09	\N	f
17	1	2020-05-07 11:52:04.189357+09	\N	f
18	2	2020-05-07 11:52:04.190362+09	\N	f
19	0	2020-05-07 11:52:04.19136+09	\N	f
20	7	2020-05-07 11:52:04.192359+09	\N	f
21	1	2020-05-07 11:52:04.193359+09	\N	f
22	2	2020-05-07 11:52:04.193359+09	\N	f
23	3	2020-05-07 11:52:04.194359+09	\N	f
24	4	2020-05-07 11:52:04.194359+09	\N	f
25	2	2020-05-07 11:52:04.195358+09	\N	f
26	3	2020-05-07 11:52:04.19636+09	\N	f
27	1	2020-05-07 11:52:04.197359+09	\N	f
28	1	2020-05-07 11:52:04.197359+09	\N	f
29	3	2020-05-07 11:52:04.19836+09	\N	f
30	1	2020-05-07 11:52:04.199359+09	\N	f
31	2	2020-05-07 11:52:04.199359+09	\N	f
32	1	2020-05-07 11:52:04.200359+09	\N	f
33	4	2020-05-07 11:52:04.201358+09	\N	f
34	1	2020-05-07 11:52:04.201358+09	\N	f
35	2	2020-05-07 11:52:04.202358+09	\N	f
36	3	2020-05-07 11:52:04.202358+09	\N	f
37	1	2020-05-07 11:52:04.203358+09	\N	f
38	-1	2020-05-07 11:52:04.20436+09	\N	f
39	4	2020-05-07 12:03:32.362618+09	\N	f
40	1	2020-05-07 12:03:32.363619+09	\N	f
41	2	2020-05-07 12:03:32.364621+09	\N	f
42	3	2020-05-07 12:03:32.365623+09	\N	f
43	1	2020-05-07 12:03:32.366622+09	\N	f
44	3	2020-05-07 12:03:32.36762+09	\N	f
45	4	2020-05-07 12:03:32.36762+09	\N	f
46	2	2020-05-07 12:03:32.368619+09	\N	f
47	1	2020-05-07 12:03:32.369617+09	\N	f
48	2	2020-05-07 12:03:32.369617+09	\N	f
49	3	2020-05-07 12:03:32.37062+09	\N	f
50	2	2020-05-07 12:03:32.371622+09	\N	f
51	1	2020-05-07 12:03:32.371622+09	\N	f
52	4	2020-05-07 12:03:32.372622+09	\N	f
53	3	2020-05-07 12:03:32.373621+09	\N	f
54	1	2020-05-07 12:03:32.374621+09	\N	f
55	2	2020-05-07 12:03:32.375618+09	\N	f
56	2	2020-05-07 12:03:32.37662+09	\N	f
57	3	2020-05-07 12:03:32.377623+09	\N	f
58	4	2020-05-07 12:03:32.378622+09	\N	f
59	3	2020-05-07 12:03:32.378622+09	\N	f
60	3	2020-05-07 12:03:32.379621+09	\N	f
61	3	2020-05-07 12:03:32.380622+09	\N	f
62	3	2020-05-07 12:03:32.380622+09	\N	f
63	1	2020-05-07 12:03:32.381619+09	\N	f
64	3	2020-05-07 12:03:32.382618+09	\N	f
65	2	2020-05-07 12:03:32.383618+09	\N	f
66	1	2020-05-07 12:03:32.383618+09	\N	f
67	4	2020-05-07 12:03:32.384618+09	\N	f
68	4	2020-05-07 12:03:32.385619+09	\N	f
69	3	2020-05-07 12:03:32.385619+09	\N	f
70	3	2020-05-07 12:03:32.386619+09	\N	f
71	2	2020-05-07 12:03:32.387619+09	\N	f
72	4	2020-05-07 12:03:32.387619+09	\N	f
73	-1	2020-05-07 12:03:32.388619+09	\N	f
74	4	2020-05-07 14:04:01.925717+09	\N	f
75	2	2020-05-07 14:04:02.099718+09	\N	f
76	2	2020-05-07 14:04:02.100718+09	\N	f
77	1	2020-05-07 14:04:02.101719+09	\N	f
78	2	2020-05-07 14:04:02.101719+09	\N	f
79	1	2020-05-07 14:04:02.102719+09	\N	f
80	2	2020-05-07 14:04:02.103719+09	\N	f
81	3	2020-05-07 14:04:02.104719+09	\N	f
82	3	2020-05-07 14:04:02.104719+09	\N	f
83	1	2020-05-07 14:04:02.105719+09	\N	f
84	2	2020-05-07 14:04:02.106719+09	\N	f
85	3	2020-05-07 14:04:02.107717+09	\N	f
86	1	2020-05-07 14:04:02.107717+09	\N	f
87	2	2020-05-07 14:04:02.108716+09	\N	f
88	2	2020-05-07 14:04:02.108716+09	\N	f
89	4	2020-05-07 14:04:02.109717+09	\N	f
90	1	2020-05-07 14:04:02.109717+09	\N	f
91	2	2020-05-07 14:04:02.110717+09	\N	f
92	0	2020-05-07 14:04:02.111721+09	\N	f
93	7	2020-05-07 14:04:02.112718+09	\N	f
94	1	2020-05-07 14:04:02.112718+09	\N	f
95	2	2020-05-07 14:04:02.113716+09	\N	f
96	3	2020-05-07 14:04:02.115719+09	\N	f
97	4	2020-05-07 14:04:02.116718+09	\N	f
98	2	2020-05-07 14:04:02.116718+09	\N	f
99	3	2020-05-07 14:04:02.117719+09	\N	f
100	1	2020-05-07 14:04:02.117719+09	\N	f
101	1	2020-05-07 14:04:02.118719+09	\N	f
102	3	2020-05-07 14:04:02.119718+09	\N	f
103	1	2020-05-07 14:04:02.119718+09	\N	f
104	2	2020-05-07 14:04:02.120719+09	\N	f
105	1	2020-05-07 14:04:02.121721+09	\N	f
106	4	2020-05-07 14:04:02.121721+09	\N	f
107	1	2020-05-07 14:04:02.122718+09	\N	f
108	2	2020-05-07 14:04:02.12372+09	\N	f
109	3	2020-05-07 14:04:02.12372+09	\N	f
110	1	2020-05-07 14:04:02.12472+09	\N	f
111	-1	2020-05-07 14:04:02.125718+09	\N	f
112	1	2020-05-07 14:06:45.60523+09	\N	f
113	3	2020-05-07 14:06:45.609234+09	\N	f
114	2	2020-05-07 14:06:45.610233+09	\N	f
115	4	2020-05-07 14:06:45.610233+09	\N	f
116	2	2020-05-07 14:06:45.611231+09	\N	f
117	2	2020-05-07 14:06:45.612232+09	\N	f
118	3	2020-05-07 14:06:45.612232+09	\N	f
119	4	2020-05-07 14:06:45.613231+09	\N	f
120	3	2020-05-07 14:06:45.613231+09	\N	f
121	2	2020-05-07 14:06:45.614234+09	\N	f
122	4	2020-05-07 14:06:45.626234+09	\N	f
123	3	2020-05-07 14:06:45.626234+09	\N	f
124	4	2020-05-07 14:06:45.627232+09	\N	f
125	3	2020-05-07 14:06:45.628231+09	\N	f
126	2	2020-05-07 14:06:45.628231+09	\N	f
127	3	2020-05-07 14:06:45.629231+09	\N	f
128	1	2020-05-07 14:06:45.630232+09	\N	f
129	2	2020-05-07 14:06:45.630232+09	\N	f
130	4	2020-05-07 14:06:45.631233+09	\N	f
131	1	2020-05-07 14:06:45.632232+09	\N	f
132	3	2020-05-07 14:06:45.632232+09	\N	f
133	4	2020-05-07 14:06:45.633231+09	\N	f
134	1	2020-05-07 14:06:45.634231+09	\N	f
135	2	2020-05-07 14:06:45.634231+09	\N	f
136	2	2020-05-07 14:06:45.635232+09	\N	f
137	4	2020-05-07 14:06:45.636232+09	\N	f
138	2	2020-05-07 14:06:45.636232+09	\N	f
139	2	2020-05-07 14:06:45.637232+09	\N	f
140	3	2020-05-07 14:06:45.638233+09	\N	f
141	2	2020-05-07 14:06:45.638233+09	\N	f
142	1	2020-05-07 14:06:45.639232+09	\N	f
143	0	2020-05-07 14:06:45.642233+09	\N	f
144	3	2020-05-07 14:06:45.643234+09	\N	f
145	1	2020-05-07 14:06:45.644233+09	\N	f
146	3	2020-05-07 14:06:45.644233+09	\N	f
147	2	2020-05-07 14:06:45.645232+09	\N	f
148	4	2020-05-07 14:06:45.645232+09	\N	f
149	-1	2020-05-07 14:06:45.646232+09	\N	f
\.


--
-- TOC entry 3269 (class 0 OID 16392)
-- Dependencies: 204
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, question_id, question, page_title, visible_if, reverse_score, scoring_rule_id, created_at, updated_at, deleted, survey_id) FROM stdin;
1	1	{"type": "radiogroup", "name": "1", "title": {"default": "Performing vigorous activities, such as gardening or exercising", "ja": "\\u5ead\\u4ed5\\u4e8b\\u3084\\u904b\\u52d5\\u306a\\u3069\\u6d3b\\u767a\\u306a\\u6d3b\\u52d5"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot of difficulty", "ja": "\\u975e\\u5e38\\u306b\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "2", "text": {"default": "Moderate difficulty", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little difficulty", "ja": "\\u5c11\\u3057\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "4", "text": {"default": "No difficulty", "ja": "\\u96e3\\u3057\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "During the past week, to what extent have you had difficulty:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u4e8b\\u67c4\\u304c\\u3069\\u306e\\u304f\\u3089\\u3044\\u96e3\\u3057\\u304b\\u3063\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044"}	\N	f	1	2020-05-07 11:38:48.888479+09	\N	f	1
2	2	{"type": "radiogroup", "name": "2", "title": {"default": "Walking as fast as others (family, friends, etc.)", "ja": "\\u4ed6\\u306e\\u4eba\\uff08\\u5bb6\\u65cf\\u3001\\u53cb\\u4eba\\u306a\\u3069\\uff09\\u3068\\u540c\\u3058\\u901f\\u3055\\u3067\\u6b69\\u304f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot of difficulty", "ja": "\\u975e\\u5e38\\u306b\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "2", "text": {"default": "Moderate difficulty", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little difficulty", "ja": "\\u5c11\\u3057\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "4", "text": {"default": "No difficulty", "ja": "\\u96e3\\u3057\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "During the past week, to what extent have you had difficulty:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u4e8b\\u67c4\\u304c\\u3069\\u306e\\u304f\\u3089\\u3044\\u96e3\\u3057\\u304b\\u3063\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044"}	\N	f	1	2020-05-07 11:38:48.89248+09	\N	f	1
3	3	{"type": "radiogroup", "name": "3", "title": {"default": "Carrying heavy things, such as books, groceries, or shopping bags", "ja": "\\u672c\\u3001\\u98df\\u6599\\u54c1\\u3001\\u8cb7\\u3044\\u7269\\u3092\\u3057\\u305f\\u888b\\u306a\\u3069\\u306e\\u91cd\\u3044\\u7269\\u3092\\u904b\\u3076"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot of difficulty", "ja": "\\u975e\\u5e38\\u306b\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "2", "text": {"default": "Moderate difficulty", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little difficulty", "ja": "\\u5c11\\u3057\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "4", "text": {"default": "No difficulty", "ja": "\\u96e3\\u3057\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "During the past week, to what extent have you had difficulty:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u4e8b\\u67c4\\u304c\\u3069\\u306e\\u304f\\u3089\\u3044\\u96e3\\u3057\\u304b\\u3063\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044"}	\N	f	1	2020-05-07 11:38:48.894479+09	\N	f	1
4	4	{"type": "radiogroup", "name": "4", "title": {"default": "Climbing one flight of stairs", "ja": "\\u4e00\\u968e\\u5206\\u306e\\u968e\\u6bb5\\u3092\\u4e0a\\u308b"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot of difficulty", "ja": "\\u975e\\u5e38\\u306b\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "2", "text": {"default": "Moderate difficulty", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little difficulty", "ja": "\\u5c11\\u3057\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "4", "text": {"default": "No difficulty", "ja": "\\u96e3\\u3057\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "During the past week, to what extent have you had difficulty:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u4e8b\\u67c4\\u304c\\u3069\\u306e\\u304f\\u3089\\u3044\\u96e3\\u3057\\u304b\\u3063\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044"}	\N	f	1	2020-05-07 11:38:48.896479+09	\N	f	1
5	5	{"type": "radiogroup", "name": "5", "title": {"default": "You felt well", "ja": "\\u8abf\\u5b50\\u304c\\u826f\\u3044\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	t	1	2020-05-07 11:38:48.898481+09	\N	f	1
6	6	{"type": "radiogroup", "name": "6", "title": {"default": "You felt tired .", "ja": "\\u75b2\\u308c\\u305f\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.900481+09	\N	f	1
7	7	{"type": "radiogroup", "name": "7", "title": {"default": "You felt anxious", "ja": "\\u4e0d\\u5b89\\u3092\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.901481+09	\N	f	1
8	8	{"type": "radiogroup", "name": "8", "title": {"default": "You felt energetic", "ja": "\\u5143\\u6c17\\u3044\\u3063\\u3071\\u3044\\u3060\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	t	1	2020-05-07 11:38:48.90348+09	\N	f	1
9	9	{"type": "radiogroup", "name": "9", "title": {"default": "You felt exhausted", "ja": "\\u75b2\\u308c\\u679c\\u3066\\u305f\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.90448+09	\N	f	1
10	10	{"type": "radiogroup", "name": "10", "title": {"default": "You felt sad", "ja": "\\u60b2\\u3057\\u3044\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.93048+09	\N	f	1
11	11	{"type": "radiogroup", "name": "11", "title": {"default": "You felt depressed.", "ja": "\\u6c17\\u5206\\u304c\\u843d\\u3061\\u8fbc\\u3093\\u3067\\u3044\\u308b\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week, indicate how often:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.93148+09	\N	f	1
12	currentlyOnTreatment	{"type": "boolean", "name": "currentlyOnTreatment", "title": {"default": "Are you currently on any treatments (such as oral or inhaled medications, PEP or Flutter\\u00ae device, chest PT, or Vest) for bronchiectasis?", "ja": "\\u3042\\u306a\\u305f\\u306f\\u73fe\\u5728\\u3001\\u6c17\\u7ba1\\u652f\\u62e1\\u5f35\\u75c7\\u306e\\u6cbb\\u7642\\u3001\\u51e6\\u7f6e\\u3092\\u3055\\u308c\\u3066\\u3044\\u307e\\u3059\\u304b\\uff1f\\uff08\\u98f2\\u307f\\u85ac\\u307e\\u305f\\u306f\\u5438\\u5165\\u85ac\\u3001\\u547c\\u6c17\\u967d\\u5727\\uff3bPEP\\uff3d\\u7642\\u6cd5\\u7528\\u5668\\u5177\\u307e\\u305f\\u306f\\u30d5\\u30e9\\u30c3\\u30bf\\u30fc\\u00ae \\u3001\\u4f53\\u4f4d\\u5909\\u63db\\u307e\\u305f\\u306f\\u80f8\\u30fb\\u80cc\\u4e2d\\u3092\\u53e9\\u304f\\u306a\\u3069\\u306e\\u30c9\\u30ec\\u30ca\\u30fc\\u30b8\\uff09"}, "hideNumber": true, "isRequired": true, "labelTrue": {"default": "Yes", "ja": "\\u306f\\u3044"}, "labelFalse": {"default": "No", "ja": "\\uf0a8 \\u3044\\u3044\\u3048"}}	{"default": "", "ja": ""}	\N	f	1	2020-05-07 11:38:48.93348+09	\N	f	1
13	12	{"type": "radiogroup", "name": "12", "title": {"default": "To what extent do your treatments for bronchiectasis make your daily life more difficult?", "ja": "\\u6c17\\u7ba1\\u652f\\u62e1\\u5f35\\u75c7\\u306e\\u6cbb\\u7642\\u306b\\u3088\\u3063\\u3066\\u3001\\u3042\\u306a\\u305f\\u306e\\u65e5\\u5e38\\u751f\\u6d3b\\u306f\\u3069\\u306e\\u304f\\u3089\\u3044\\u59a8\\u3052\\u3089\\u308c\\u3066\\u3044\\u307e\\u3059\\u304b\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Not at all", "ja": "\\u5f71\\u97ff\\u306f\\u307e\\u3063\\u305f\\u304f\\u306a\\u3044"}}, {"value": "2", "text": {"default": "A little", "ja": "\\u5c11\\u3057"}}, {"value": "3", "text": {"default": "Moderately", "ja": "\\u4e2d\\u3050\\u3089\\u3044"}}, {"value": "4", "text": {"default": "A lot", "ja": "\\u975e\\u5e38\\u306b"}}]}	{"default": "", "ja": ""}	{currentlyOnTreatment} = true	t	1	2020-05-07 11:38:48.93448+09	\N	f	1
14	13	{"type": "radiogroup", "name": "13", "title": {"default": "How much time do you currently spend each day on your treatments for bronchiectasis?", "ja": "\\u3042\\u306a\\u305f\\u306f\\u73fe\\u5728\\u30011\\u65e5\\u306e\\u3046\\u3061\\u3069\\u306e\\u304f\\u3089\\u3044\\u306e\\u6642\\u9593\\u3092\\u6c17\\u7ba1\\u652f\\u62e1\\u5f35\\u75c7\\u306e\\u6cbb\\u7642\\u306b\\u8cbb\\u3084\\u3057\\u3066\\u3044\\u307e\\u3059\\u304b\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot", "ja": "\\u975e\\u5e38\\u306b\\u591a\\u304f\\u306e\\u6642\\u9593"}}, {"value": "2", "text": {"default": "A moderate amount", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u306e\\u6642\\u9593"}}, {"value": "3", "text": {"default": "A little", "ja": "\\u5c11\\u3057\\u306e\\u6642\\u9593"}}, {"value": "4", "text": {"default": "Almost none", "ja": "\\u307b\\u3068\\u3093\\u3069\\u8cbb\\u3084\\u3057\\u3066\\u3044\\u306a\\u3044"}}]}	{"default": "", "ja": ""}	{currentlyOnTreatment} = true	f	1	2020-05-07 11:38:48.935481+09	\N	f	1
15	14	{"type": "radiogroup", "name": "14", "title": {"default": "How difficult is it for you to fit in your treatments for bronchiectasis each day?", "ja": "\\u3042\\u306a\\u305f\\u306e\\u56de\\u7b54\\u306b\\u3042\\u3066\\u306f\\u307e\\u308b\\u6570\\u5b57\\u306b\\u3007\\u3092\\u3064\\u3051\\u3066\\u304f\\u3060\\u3055\\u3044\\u3002\\u5404\\u8cea\\u554f\\u306b\\u3064\\u304d\\u56de\\u7b54\\u30921\\u3064\\u3060\\u3051\\u9078\\u629e\\u3057\\u3066\\u304f\\u3060\\u3055\\u3044\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Not at all", "ja": "\\u975e\\u5e38\\u306b\\u826f\\u3044"}}, {"value": "2", "text": {"default": "A little", "ja": "\\u826f\\u3044"}}, {"value": "3", "text": {"default": "Moderately", "ja": "\\u3042\\u307e\\u308a\\u3088\\u304f\\u306a\\u3044"}}, {"value": "4", "text": {"default": "Very", "ja": "\\u60aa\\u3044"}}]}	{"default": "", "ja": ""}	{currentlyOnTreatment} = true	t	1	2020-05-07 11:38:48.937479+09	\N	f	1
16	15	{"type": "radiogroup", "name": "15", "title": {"default": "How do you think your health is now?", "ja": "\\u3042\\u306a\\u305f\\u306e\\u73fe\\u5728\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u306b\\u3064\\u3044\\u3066\\u3069\\u3046\\u601d\\u3044\\u307e\\u3059\\u304b\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Excellent", "ja": "\\u975e\\u5e38\\u306b\\u826f\\u3044"}}, {"value": "2", "text": {"default": "Good", "ja": "\\u826f\\u3044"}}, {"value": "3", "text": {"default": "Fair", "ja": "\\u3042\\u307e\\u308a\\u3088\\u304f\\u306a\\u3044"}}, {"value": "4", "text": {"default": "Poor", "ja": "\\u60aa\\u3044"}}]}	{"default": "", "ja": ""}	\N	t	1	2020-05-07 11:38:48.937479+09	\N	f	1
17	16	{"type": "radiogroup", "name": "16", "title": {"default": "I have to limit vigorous activities, such as walking or exercising", "ja": "\\u30a6\\u30a9\\u30fc\\u30ad\\u30f3\\u30b0\\u3084\\u904b\\u52d5\\u306a\\u3069\\u3001\\u6d3b\\u767a\\u306a\\u6d3b\\u52d5\\u3092\\u5236\\u9650\\u3057\\u306a\\u3051\\u308c\\u3070\\u306a\\u3089\\u306a\\u304b\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.938478+09	\N	f	1
18	17	{"type": "radiogroup", "name": "17", "title": {"default": "I have to stay at home more than I want to.", "ja": "\\u8abf\\u5b50\\u304c\\u826f\\u304f\\u306a\\u3044\\u306e\\u3067\\u3001\\u601d\\u3046\\u3088\\u3046\\u306b\\u5916\\u51fa\\u3067\\u304d\\u306a\\u304b\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.939479+09	\N	f	1
19	18	{"type": "radiogroup", "name": "18", "title": {"default": "I am worried about being exposed to others who are sick.", "ja": "\\u75c5\\u6c17\\u3092\\u3046\\u3064\\u3055\\u308c\\u308b\\u3053\\u3068\\u304c\\u5fc3\\u914d\\u3067\\u3001\\u75c5\\u6c17\\u306e\\u4eba\\u3068\\u4f1a\\u3046\\u3053\\u3068\\u304c\\u4e0d\\u5b89\\u3060\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.940478+09	\N	f	1
20	19	{"type": "radiogroup", "name": "19", "title": {"default": "It is difficult to be intimate with a partner (kissing, hugging, sexual activity)", "ja": "\\u30d1\\u30fc\\u30c8\\u30ca\\u30fc\\u3068\\u306e\\u89aa\\u5bc6\\u306a\\u30b3\\u30df\\u30e5\\u30cb\\u30b1\\u30fc\\u30b7\\u30e7\\u30f3\\uff08\\u30ad\\u30b9\\u3001\\u62b1\\u304d\\u5408\\u3046\\u3001\\u6027\\u7684\\u6d3b\\u52d5\\uff09\\u304c\\u96e3\\u3057\\u304b\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}, {"value": "6", "text": {"default": "Doesn\\u2019t apply", "ja": "\\u3042\\u3066\\u306f\\u307e\\u3089\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.941478+09	\N	f	1
21	20	{"type": "radiogroup", "name": "20", "title": {"default": "I lead a normal life", "ja": "\\u3054\\u304f\\u666e\\u901a\\u306e\\u751f\\u6d3b\\u3092\\u3057\\u3066\\u3044\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	t	1	2020-05-07 11:38:48.944484+09	\N	f	1
22	21	{"type": "radiogroup", "name": "21", "title": {"default": "I am concerned that my health will get worse", "ja": "\\u81ea\\u5206\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u304c\\u60aa\\u304f\\u306a\\u308b\\u3053\\u3068\\u304c\\u5fc3\\u914d\\u3060\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.94548+09	\N	f	1
23	22	{"type": "radiogroup", "name": "22", "title": {"default": "I think my coughing bothers others", "ja": "\\u79c1\\u306e\\u54b3\\uff08\\u305b\\u304d\\uff09\\u306f\\u4eba\\u306e\\u8ff7\\u60d1\\u306b\\u306a\\u3063\\u3066\\u3044\\u308b\\u3068\\u601d\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.946481+09	\N	f	1
24	23	{"type": "radiogroup", "name": "23", "title": {"default": "I often feel lonely", "ja": "\\u3088\\u304f\\u5bc2\\u3057\\u3044\\u3068\\u611f\\u3058\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.948479+09	\N	f	1
25	24	{"type": "radiogroup", "name": "24", "title": {"default": "I feel healthy", "ja": "\\u5065\\u5eb7\\u3060\\u3068\\u611f\\u3058\\u305f."}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	t	1	2020-05-07 11:38:48.95048+09	\N	f	1
26	25	{"type": "radiogroup", "name": "25", "title": {"default": "It is difficult to make plans for the future (vacation, attending family events, etc.)", "ja": "\\u4eca\\u5f8c\\u306e\\u8a08\\u753b\\u3092\\u7acb\\u3066\\u308b\\u3053\\u3068\\u304c\\u96e3\\u3057\\u304b\\u3063\\u305f\\uff08\\u4f11\\u6687\\u3001\\u5bb6\\u65cf\\u306e\\u884c\\u4e8b\\u3078\\u306e\\u53c2\\u52a0\\u306a\\u3069\\uff09"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.951479+09	\N	f	1
27	26	{"type": "radiogroup", "name": "26", "title": {"default": "I feel embarrassed when I am coughing", "ja": "\\u54b3\\uff08\\u305b\\u304d\\uff09\\u3092\\u3059\\u308b\\u6642\\u306b\\u6065\\u305a\\u304b\\u3057\\u3044\\u3068\\u611f\\u3058\\u305f."}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Completely true", "ja": "\\u305d\\u3046\\u601d\\u3046"}}, {"value": "2", "text": {"default": "Mostly true", "ja": "\\u307b\\u307c\\u305d\\u3046\\u601d\\u3046"}}, {"value": "3", "text": {"default": "A little true", "ja": "\\u5c11\\u3057\\u305d\\u3046\\u601d\\u3046"}}, {"value": "4", "text": {"default": "Not at all true", "ja": "\\u5168\\u7136\\u305d\\u3046\\u601d\\u308f\\u306a\\u3044"}}]}	{"default": "Thinking about your health during the past week, indicate the extent to which each sentence is true for you.", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u306e\\u5065\\u5eb7\\u72b6\\u614b\\u3092\\u601d\\u3044\\u51fa\\u3057\\u3066\\u3001\\u5404\\u6587\\u306b\\u3064\\u3044\\u3066\\u3069\\u306e\\u7a0b\\u5ea6\\u305d\\u3046\\u601d\\u3046\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.95348+09	\N	f	1
28	27	{"type": "radiogroup", "name": "27", "title": {"default": "To what extent did you have trouble keeping up with your job, housework, or other daily activities?", "ja": "\\u4ed5\\u4e8b\\u3001\\u5bb6\\u4e8b\\u3001\\u305d\\u306e\\u4ed6\\u306e\\u65e5\\u5e38\\u6d3b\\u52d5\\u306e\\u30da\\u30fc\\u30b9\\u3092\\u4fdd\\u3064\\u3053\\u3068\\u306f\\u3001\\u3069\\u306e\\u7a0b\\u5ea6\\u96e3\\u3057\\u304b\\u3063\\u305f\\u3067\\u3059\\u304b\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "You have had no trouble keeping up", "ja": "\\u96e3\\u3057\\u304f\\u306a\\u304b\\u3063\\u305f"}}, {"value": "2", "text": {"default": "You have managed to keep up but it\\u2019s been difficult", "ja": "\\u306a\\u3093\\u3068\\u304b\\u30da\\u30fc\\u30b9\\u3092\\u4fdd\\u3066\\u305f\\u304c\\u3001\\u96e3\\u3057\\u304b\\u3063\\u305f"}}, {"value": "3", "text": {"default": "You have been behind", "ja": "\\u3044\\u3064\\u3082\\u901a\\u308a\\u306b\\u3067\\u304d\\u306a\\u304b\\u3063\\u305f"}}, {"value": "4", "text": {"default": "You have not been able to do these activities at all", "ja": "\\u3053\\u308c\\u3089\\u306e\\u6d3b\\u52d5\\u306f\\u5c11\\u3057\\u3082\\u3067\\u304d\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "During the past week:", "ja": "\\u7b2c1\\u90e8 \\u751f\\u6d3b\\u306e\\u8cea"}	\N	t	1	2020-05-07 11:38:48.95348+09	\N	f	1
29	28	{"type": "radiogroup", "name": "28", "title": {"default": "How often does having bronchiectasis get in the way of meeting your work, household, family, or personal goals?", "ja": "\\u6c17\\u7ba1\\u652f\\u62e1\\u5f35\\u75c7\\u304c\\u3042\\u306a\\u305f\\u306e\\u4ed5\\u4e8b\\u3001\\u5bb6\\u4e8b\\u3001\\u5bb6\\u65cf\\u3001\\u500b\\u4eba\\u7684\\u306a\\u76ee\\u6a19\\u306e\\u969c\\u5bb3\\u306b\\u306a\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "During the past week:", "ja": "\\u7b2c1\\u90e8 \\u751f\\u6d3b\\u306e\\u8cea"}	\N	f	1	2020-05-07 11:38:48.954479+09	\N	f	1
30	29	{"type": "radiogroup", "name": "29", "title": {"default": "Have you felt congestion in your chest?", "ja": "\\u75f0\\u304c\\u3064\\u304b\\u3048\\u305f\\u611f\\u3058\\u304c\\u3057\\u305f\\u3053\\u3068\\u304c\\u3042\\u308a\\u307e\\u3057\\u305f\\u304b"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot", "ja": "\\u5927\\u5909\\u591a\\u304b\\u3063\\u305f "}}, {"value": "2", "text": {"default": "A moderate amount", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little", "ja": "\\u5c11\\u3057\\u3042\\u3063\\u305f"}}, {"value": "4", "text": {"default": "Not at all", "ja": "\\u5168\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "Indicate how you have been feeling during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u3042\\u306a\\u305f\\u304c\\u3069\\u3046\\u611f\\u3058\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.955479+09	\N	f	1
31	30	{"type": "radiogroup", "name": "30", "title": {"default": "Have you been coughing during the day? .", "ja": "\\u65e5\\u4e2d\\u306b\\u54b3\\uff08\\u305b\\u304d\\uff09\\u304c\\u3067\\u305f\\u3053\\u3068\\u304c\\u3042\\u308a\\u307e\\u3057\\u305f\\u304b"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot", "ja": "\\u5927\\u5909\\u591a\\u304b\\u3063\\u305f "}}, {"value": "2", "text": {"default": "A moderate amount", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little", "ja": "\\u5c11\\u3057\\u3042\\u3063\\u305f"}}, {"value": "4", "text": {"default": "Not at all", "ja": "\\u5168\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "Indicate how you have been feeling during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u3042\\u306a\\u305f\\u304c\\u3069\\u3046\\u611f\\u3058\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.95648+09	\N	f	1
32	31	{"type": "radiogroup", "name": "31", "title": {"default": "Have you had to cough up mucus?", "ja": "\\u54b3\\u3092\\u3057\\u3066\\u75f0\\uff08\\u305f\\u3093\\uff09\\u3092\\u51fa\\u3055\\u306a\\u3051\\u308c\\u3070\\u306a\\u3089\\u306a\\u3044\\u3053\\u3068\\u304c\\u3042\\u308a\\u307e\\u3057\\u305f\\u304b"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "A lot", "ja": "\\u5927\\u5909\\u591a\\u304b\\u3063\\u305f "}}, {"value": "2", "text": {"default": "A moderate amount", "ja": "\\u3042\\u308b\\u7a0b\\u5ea6\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "A little", "ja": "\\u5c11\\u3057\\u3042\\u3063\\u305f"}}, {"value": "4", "text": {"default": "Not at all", "ja": "\\u5168\\u304f\\u306a\\u304b\\u3063\\u305f"}}]}	{"default": "Indicate how you have been feeling during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u3042\\u306a\\u305f\\u304c\\u3069\\u3046\\u611f\\u3058\\u305f\\u304b\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.957478+09	\N	f	1
33	32	{"type": "radiogroup", "name": "32", "title": {"default": "Has your sputum been mostly:", "ja": "\\u5927\\u4f53\\u306e\\u5834\\u5408\\u3001\\u75f0\\uff08\\u305f\\u3093\\uff09\\u306e\\u72b6\\u614b\\u306f\\u3069\\u3093\\u306a\\u611f\\u3058\\u3067\\u3057\\u305f\\u304b\\uff1f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Clear", "ja": "\\u900f\\u660e"}}, {"value": "2", "text": {"default": "Clear to yellow", "ja": "\\u900f\\u660e\\uff5e\\u9ec4\\u8272 "}}, {"value": "3", "text": {"default": "Yellowish-green", "ja": "\\u9ec4\\u7dd1\\u8272"}}, {"value": "4", "text": {"default": "Brownish-dark", "ja": "\\u8336\\u8272\\uff5e\\u3053\\u3052\\u8336\\u8272 "}}, {"value": "5", "text": {"default": "Green with traces of blood", "ja": "\\u8840\\u306e\\u6df7\\u3058\\u3063\\u305f\\u7dd1\\u8272"}}, {"value": "6", "text": {"default": "Don't know", "ja": "\\u308f\\u304b\\u3089\\u306a\\u3044"}}]}	{"default": "", "ja": ""}	\N	t	1	2020-05-07 11:38:48.958479+09	\N	f	1
34	33	{"type": "radiogroup", "name": "33", "title": {"default": "Have you had shortness of breath with greater activity, such as housework or yardwork? .", "ja": "\\u5bb6\\u4e8b\\u3084\\u5ead\\u4ed5\\u4e8b\\u306a\\u3069\\u3092\\u3057\\u305f\\u6642\\u306b\\u3001\\u6642\\u9593\\u306e\\u7d4c\\u904e\\u3068\\u5171\\u306b\\u606f\\u5207\\u308c\\u3057\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "How often during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.960479+09	\N	f	1
35	34	{"type": "radiogroup", "name": "34", "title": {"default": "Have you been wheezing?", "ja": "\\u305c\\u3044\\u305c\\u3044\\u3001\\u30d2\\u30e5\\u30fc\\u30d2\\u30e5\\u30fc\\u3068\\u3044\\u3046\\u97f3\\u304c\\u3057\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "How often during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.96248+09	\N	f	1
36	35	{"type": "radiogroup", "name": "35", "title": {"default": "Have you had chest pain?", "ja": "\\u80f8\\u304c\\u75db\\u304b\\u3063\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "How often during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.963482+09	\N	f	1
37	36	{"type": "radiogroup", "name": "36", "title": {"default": "Have you had shortness of breath when talking?", "ja": "\\u8a71\\u3092\\u3059\\u308b\\u3068\\u304d\\u306b\\u606f\\u5207\\u308c\\u3057\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "How often during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.96548+09	\N	f	1
38	37	{"type": "radiogroup", "name": "37", "title": {"default": "Have you woken up during the night because you were coughing?", "ja": "\\u591c\\u306b\\u54b3\\u304c\\u51fa\\u3066\\u3001\\u76ee\\u304c\\u899a\\u3081\\u305f"}, "isRequired": true, "choices": [{"value": "1", "text": {"default": "Always", "ja": "\\u5e38\\u306b"}}, {"value": "2", "text": {"default": "Often", "ja": "\\u3088\\u304f\\u3042\\u3063\\u305f"}}, {"value": "3", "text": {"default": "Sometimes", "ja": "\\u3068\\u304d\\u3069\\u304d"}}, {"value": "4", "text": {"default": "Never", "ja": "\\u4e00\\u5ea6\\u3082\\u306a\\u3044"}}]}	{"default": "How often during the past week:", "ja": "\\u904e\\u53bb1\\u9031\\u9593\\u3067\\u3001\\u4e0b\\u8a18\\u306e\\u3088\\u3046\\u306b\\u611f\\u3058\\u305f\\u983b\\u5ea6\\u3092\\u304a\\u7b54\\u3048\\u304f\\u3060\\u3055\\u3044\\u3002"}	\N	f	1	2020-05-07 11:38:48.966481+09	\N	f	1
\.


--
-- TOC entry 3271 (class 0 OID 16400)
-- Dependencies: 206
-- Data for Name: score_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.score_type (id, score_type_id, title, items, calculation_rule_id, created_at, updated_at, deleted, survey_id) FROM stdin;
1	treatment_burden_domain	treatment_burden_domain	{12,13,14}	1	2020-05-07 11:42:08.73409+09	\N	f	1
2	physical_functioning_domain	physical_functioning_domain	{1,2,3,4,16}	1	2020-05-07 11:43:54.011225+09	\N	f	1
3	role_functioning_domain	role_functioning_domain	{17,20,25,27,28}	1	2020-05-07 11:45:58.778511+09	\N	f	1
4	vitality_domain	vitality_domain	{6,8,9}	1	2020-05-07 11:46:53.316565+09	\N	f	1
5	emotional_functioning_domain	emotional_functioning_domain	{7,10,11,23}	1	2020-05-07 11:48:19.312836+09	\N	f	1
6	social_functioning_domain	social_functioning_domain	{18,19,22,26}	1	2020-05-07 11:49:03.820359+09	\N	f	1
7	health_perceptions_domain	health_perceptions_domain	{5,15,21,24}	1	2020-05-07 11:49:50.996358+09	\N	f	1
8	respiratory_symptoms_domain	respiratory_symptoms_domain	{29,30,31,32,33,34,35,36,37}	1	2020-05-07 11:51:16.660358+09	\N	f	1
\.


--
-- TOC entry 3273 (class 0 OID 16408)
-- Dependencies: 208
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey (id, survey_id, title, created_at, updated_at, deleted) FROM stdin;
1	survey1	{"default": "QUALITY OF LIFE QUESTIONNAIRE \\u2013 BRONCHIECTASIS", "ja": "\\u751f\\u6d3b\\u306e\\u8cea\\u306b\\u95a2\\u3059\\u308b\\u8cea\\u554f\\u2013\\u6c17\\u7ba1\\u652f\\u708e"}	2020-05-07 11:38:48.86348+09	\N	f
\.


--
-- TOC entry 3275 (class 0 OID 16416)
-- Dependencies: 210
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, person_id, created_at, updated_at, deleted) FROM stdin;
1	testuser3	2020-05-07 11:51:35.176358+09	\N	f
2	user1	2020-05-07 12:03:31.718615+09	\N	f
3	testuser1	2020-05-07 14:03:59.835723+09	\N	f
4	user2	2020-05-07 14:06:43.991239+09	\N	f
\.


--
-- TOC entry 3276 (class 0 OID 16419)
-- Dependencies: 211
-- Data for Name: user_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_answer (id, answer, text, created_at, updated_at, deleted, user_survey_id, question_id, answer_score_id) FROM stdin;
1	5	\N	2020-05-07 11:52:04.210361+09	\N	f	1	1	1
2	2	\N	2020-05-07 11:52:04.236358+09	\N	f	1	2	2
3	2	\N	2020-05-07 11:52:04.23736+09	\N	f	1	3	3
4	1	\N	2020-05-07 11:52:04.238358+09	\N	f	1	4	4
5	3	\N	2020-05-07 11:52:04.241359+09	\N	f	1	5	5
6	1	\N	2020-05-07 11:52:04.24336+09	\N	f	1	6	6
7	2	\N	2020-05-07 11:52:04.24436+09	\N	f	1	7	7
8	2	\N	2020-05-07 11:52:04.245361+09	\N	f	1	8	8
9	3	\N	2020-05-07 11:52:04.26136+09	\N	f	1	9	9
10	1	\N	2020-05-07 11:52:04.262359+09	\N	f	1	10	10
11	2	\N	2020-05-07 11:52:04.26336+09	\N	f	1	11	11
12	2	\N	2020-05-07 11:52:04.264363+09	\N	f	1	13	12
13	1	\N	2020-05-07 11:52:04.266359+09	\N	f	1	14	13
14	3	\N	2020-05-07 11:52:04.267361+09	\N	f	1	15	14
15	3	\N	2020-05-07 11:52:04.267361+09	\N	f	1	16	15
16	4	\N	2020-05-07 11:52:04.268358+09	\N	f	1	17	16
17	1	\N	2020-05-07 11:52:04.269358+09	\N	f	1	18	17
18	2	\N	2020-05-07 11:52:04.270359+09	\N	f	1	19	18
19	6	\N	2020-05-07 11:52:04.270359+09	\N	f	1	20	19
20	7	\N	2020-05-07 11:52:04.271359+09	\N	f	1	21	20
21	1	\N	2020-05-07 11:52:04.272358+09	\N	f	1	22	21
22	2	\N	2020-05-07 11:52:04.273358+09	\N	f	1	23	22
23	3	\N	2020-05-07 11:52:04.275361+09	\N	f	1	24	23
24	1	\N	2020-05-07 11:52:04.276361+09	\N	f	1	25	24
25	2	\N	2020-05-07 11:52:04.27736+09	\N	f	1	26	25
26	3	\N	2020-05-07 11:52:04.27836+09	\N	f	1	27	26
27	4	\N	2020-05-07 11:52:04.279361+09	\N	f	1	28	27
28	1	\N	2020-05-07 11:52:04.280361+09	\N	f	1	29	28
29	3	\N	2020-05-07 11:52:04.282361+09	\N	f	1	30	29
30	1	\N	2020-05-07 11:52:04.28336+09	\N	f	1	31	30
31	2	\N	2020-05-07 11:52:04.28336+09	\N	f	1	32	31
32	4	\N	2020-05-07 11:52:04.284361+09	\N	f	1	33	32
33	4	\N	2020-05-07 11:52:04.285359+09	\N	f	1	34	33
34	1	\N	2020-05-07 11:52:04.286358+09	\N	f	1	35	34
35	2	\N	2020-05-07 11:52:04.287359+09	\N	f	1	36	35
36	3	\N	2020-05-07 11:52:04.287359+09	\N	f	1	37	36
37	1	\N	2020-05-07 11:52:04.288357+09	\N	f	1	38	37
38	-1	True	2020-05-07 11:52:04.289358+09	\N	f	1	12	38
39	4	\N	2020-05-07 12:03:32.399616+09	\N	f	2	1	39
40	1	\N	2020-05-07 12:03:32.401617+09	\N	f	2	2	40
41	2	\N	2020-05-07 12:03:32.402618+09	\N	f	2	3	41
42	3	\N	2020-05-07 12:03:32.403618+09	\N	f	2	4	42
43	4	\N	2020-05-07 12:03:32.404615+09	\N	f	2	5	43
44	3	\N	2020-05-07 12:03:32.405616+09	\N	f	2	6	44
45	4	\N	2020-05-07 12:03:32.406652+09	\N	f	2	7	45
46	3	\N	2020-05-07 12:03:32.407615+09	\N	f	2	8	46
47	1	\N	2020-05-07 12:03:32.408616+09	\N	f	2	9	47
48	2	\N	2020-05-07 12:03:32.410621+09	\N	f	2	10	48
49	3	\N	2020-05-07 12:03:32.411621+09	\N	f	2	11	49
50	3	\N	2020-05-07 12:03:32.412621+09	\N	f	2	16	50
51	1	\N	2020-05-07 12:03:32.413625+09	\N	f	2	17	51
52	4	\N	2020-05-07 12:03:32.414623+09	\N	f	2	18	52
53	3	\N	2020-05-07 12:03:32.415618+09	\N	f	2	19	53
54	1	\N	2020-05-07 12:03:32.41662+09	\N	f	2	20	54
55	3	\N	2020-05-07 12:03:32.417619+09	\N	f	2	21	55
56	2	\N	2020-05-07 12:03:32.418618+09	\N	f	2	22	56
57	3	\N	2020-05-07 12:03:32.419616+09	\N	f	2	23	57
58	4	\N	2020-05-07 12:03:32.420617+09	\N	f	2	24	58
59	2	\N	2020-05-07 12:03:32.421618+09	\N	f	2	25	59
60	3	\N	2020-05-07 12:03:32.422618+09	\N	f	2	26	60
61	3	\N	2020-05-07 12:03:32.423616+09	\N	f	2	27	61
62	2	\N	2020-05-07 12:03:32.423616+09	\N	f	2	28	62
63	1	\N	2020-05-07 12:03:32.425618+09	\N	f	2	29	63
64	3	\N	2020-05-07 12:03:32.426618+09	\N	f	2	30	64
65	2	\N	2020-05-07 12:03:32.427617+09	\N	f	2	31	65
66	1	\N	2020-05-07 12:03:32.428618+09	\N	f	2	32	66
67	1	\N	2020-05-07 12:03:32.429618+09	\N	f	2	33	67
68	4	\N	2020-05-07 12:03:32.430618+09	\N	f	2	34	68
69	3	\N	2020-05-07 12:03:32.431618+09	\N	f	2	35	69
70	3	\N	2020-05-07 12:03:32.432619+09	\N	f	2	36	70
71	2	\N	2020-05-07 12:03:32.43363+09	\N	f	2	37	71
72	4	\N	2020-05-07 12:03:32.434615+09	\N	f	2	38	72
73	-1	False	2020-05-07 12:03:32.435651+09	\N	f	2	12	73
74	5	\N	2020-05-07 14:04:02.639717+09	\N	f	3	1	74
75	2	\N	2020-05-07 14:04:02.69472+09	\N	f	3	2	75
76	2	\N	2020-05-07 14:04:02.696719+09	\N	f	3	3	76
77	1	\N	2020-05-07 14:04:02.699719+09	\N	f	3	4	77
78	3	\N	2020-05-07 14:04:02.701719+09	\N	f	3	5	78
79	1	\N	2020-05-07 14:04:02.70372+09	\N	f	3	6	79
80	2	\N	2020-05-07 14:04:02.704718+09	\N	f	3	7	80
81	2	\N	2020-05-07 14:04:02.705719+09	\N	f	3	8	81
82	3	\N	2020-05-07 14:04:02.706719+09	\N	f	3	9	82
83	1	\N	2020-05-07 14:04:02.707719+09	\N	f	3	10	83
84	2	\N	2020-05-07 14:04:02.708719+09	\N	f	3	11	84
85	2	\N	2020-05-07 14:04:02.709719+09	\N	f	3	13	85
86	1	\N	2020-05-07 14:04:02.710718+09	\N	f	3	14	86
87	3	\N	2020-05-07 14:04:02.711719+09	\N	f	3	15	87
88	3	\N	2020-05-07 14:04:02.712717+09	\N	f	3	16	88
89	4	\N	2020-05-07 14:04:02.71472+09	\N	f	3	17	89
90	1	\N	2020-05-07 14:04:02.715721+09	\N	f	3	18	90
91	2	\N	2020-05-07 14:04:02.716718+09	\N	f	3	19	91
92	6	\N	2020-05-07 14:04:02.71772+09	\N	f	3	20	92
93	7	\N	2020-05-07 14:04:02.71872+09	\N	f	3	21	93
94	1	\N	2020-05-07 14:04:02.719721+09	\N	f	3	22	94
95	2	\N	2020-05-07 14:04:02.720717+09	\N	f	3	23	95
96	3	\N	2020-05-07 14:04:02.721719+09	\N	f	3	24	96
97	1	\N	2020-05-07 14:04:02.722719+09	\N	f	3	25	97
98	2	\N	2020-05-07 14:04:02.756718+09	\N	f	3	26	98
99	3	\N	2020-05-07 14:04:02.757718+09	\N	f	3	27	99
100	4	\N	2020-05-07 14:04:02.758719+09	\N	f	3	28	100
101	1	\N	2020-05-07 14:04:02.804716+09	\N	f	3	29	101
102	3	\N	2020-05-07 14:04:02.805716+09	\N	f	3	30	102
103	1	\N	2020-05-07 14:04:02.806716+09	\N	f	3	31	103
104	2	\N	2020-05-07 14:04:02.807716+09	\N	f	3	32	104
105	4	\N	2020-05-07 14:04:02.808717+09	\N	f	3	33	105
106	4	\N	2020-05-07 14:04:02.808717+09	\N	f	3	34	106
107	1	\N	2020-05-07 14:04:02.809717+09	\N	f	3	35	107
108	2	\N	2020-05-07 14:04:02.90773+09	\N	f	3	36	108
109	3	\N	2020-05-07 14:04:02.909718+09	\N	f	3	37	109
110	1	\N	2020-05-07 14:04:02.909718+09	\N	f	3	38	110
111	-1	True	2020-05-07 14:04:02.910717+09	\N	f	3	12	111
112	1	\N	2020-05-07 14:06:45.651231+09	\N	f	4	1	112
113	3	\N	2020-05-07 14:06:45.652231+09	\N	f	4	2	113
114	2	\N	2020-05-07 14:06:45.653232+09	\N	f	4	3	114
115	4	\N	2020-05-07 14:06:45.653232+09	\N	f	4	4	115
116	3	\N	2020-05-07 14:06:45.654231+09	\N	f	4	5	116
117	2	\N	2020-05-07 14:06:45.655231+09	\N	f	4	6	117
118	3	\N	2020-05-07 14:06:45.656232+09	\N	f	4	7	118
119	1	\N	2020-05-07 14:06:45.659234+09	\N	f	4	8	119
120	3	\N	2020-05-07 14:06:45.660235+09	\N	f	4	9	120
121	2	\N	2020-05-07 14:06:45.694233+09	\N	f	4	10	121
122	4	\N	2020-05-07 14:06:45.695232+09	\N	f	4	11	122
123	2	\N	2020-05-07 14:06:45.696232+09	\N	f	4	13	123
124	4	\N	2020-05-07 14:06:45.696232+09	\N	f	4	14	124
125	2	\N	2020-05-07 14:06:45.69723+09	\N	f	4	15	125
126	3	\N	2020-05-07 14:06:45.698232+09	\N	f	4	16	126
127	3	\N	2020-05-07 14:06:45.699232+09	\N	f	4	17	127
128	1	\N	2020-05-07 14:06:45.699232+09	\N	f	4	18	128
129	2	\N	2020-05-07 14:06:45.700232+09	\N	f	4	19	129
130	4	\N	2020-05-07 14:06:45.701232+09	\N	f	4	20	130
131	4	\N	2020-05-07 14:06:45.701232+09	\N	f	4	21	131
132	3	\N	2020-05-07 14:06:45.702231+09	\N	f	4	22	132
133	4	\N	2020-05-07 14:06:45.703231+09	\N	f	4	23	133
134	1	\N	2020-05-07 14:06:45.704233+09	\N	f	4	24	134
135	3	\N	2020-05-07 14:06:45.704233+09	\N	f	4	25	135
136	2	\N	2020-05-07 14:06:45.70523+09	\N	f	4	26	136
137	4	\N	2020-05-07 14:06:45.706231+09	\N	f	4	27	137
138	3	\N	2020-05-07 14:06:45.708236+09	\N	f	4	28	138
139	2	\N	2020-05-07 14:06:45.710234+09	\N	f	4	29	139
140	3	\N	2020-05-07 14:06:45.711231+09	\N	f	4	30	140
141	2	\N	2020-05-07 14:06:45.712233+09	\N	f	4	31	141
142	1	\N	2020-05-07 14:06:45.712233+09	\N	f	4	32	142
143	6	\N	2020-05-07 14:06:45.713231+09	\N	f	4	33	143
144	3	\N	2020-05-07 14:06:45.71423+09	\N	f	4	34	144
145	1	\N	2020-05-07 14:06:45.71423+09	\N	f	4	35	145
146	3	\N	2020-05-07 14:06:45.715232+09	\N	f	4	36	146
147	2	\N	2020-05-07 14:06:45.716232+09	\N	f	4	37	147
148	4	\N	2020-05-07 14:06:45.717232+09	\N	f	4	38	148
149	-1	True	2020-05-07 14:06:45.717232+09	\N	f	4	12	149
\.


--
-- TOC entry 3279 (class 0 OID 16426)
-- Dependencies: 214
-- Data for Name: user_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_score (id, name, score, created_at, updated_at, deleted, user_survey_id, score_type_id) FROM stdin;
1	treatment_burden_domain	33.33333333333333	2020-05-07 11:52:04.293361+09	\N	f	1	1
2	physical_functioning_domain	53.333333333333336	2020-05-07 11:52:04.36336+09	\N	f	1	2
3	role_functioning_domain	46.666666666666664	2020-05-07 11:52:04.365361+09	\N	f	1	3
4	vitality_domain	44.44444444444445	2020-05-07 11:52:04.366361+09	\N	f	1	4
5	emotional_functioning_domain	33.33333333333333	2020-05-07 11:52:04.367361+09	\N	f	1	5
6	social_functioning_domain	25	2020-05-07 11:52:04.36936+09	\N	f	1	6
7	health_perceptions_domain	41.66666666666667	2020-05-07 11:52:04.37036+09	\N	f	1	7
8	respiratory_symptoms_domain	33.33333333333333	2020-05-07 11:52:04.37036+09	\N	f	1	8
9	treatment_burden_domain	\N	2020-05-07 12:03:32.436651+09	\N	f	2	1
10	physical_functioning_domain	40.00000000000001	2020-05-07 12:03:32.437616+09	\N	f	2	2
11	role_functioning_domain	53.333333333333336	2020-05-07 12:03:32.503651+09	\N	f	2	3
12	vitality_domain	33.33333333333333	2020-05-07 12:03:32.504615+09	\N	f	2	4
13	emotional_functioning_domain	75	2020-05-07 12:03:32.50565+09	\N	f	2	5
14	social_functioning_domain	50	2020-05-07 12:03:32.50565+09	\N	f	2	6
15	health_perceptions_domain	33.33333333333333	2020-05-07 12:03:32.506651+09	\N	f	2	7
16	respiratory_symptoms_domain	62.96296296296296	2020-05-07 12:03:32.507616+09	\N	f	2	8
17	treatment_burden_domain	33.33333333333333	2020-05-07 14:04:02.914718+09	\N	f	3	1
18	physical_functioning_domain	53.333333333333336	2020-05-07 14:04:03.012719+09	\N	f	3	2
19	role_functioning_domain	46.666666666666664	2020-05-07 14:04:03.014721+09	\N	f	3	3
20	vitality_domain	44.44444444444445	2020-05-07 14:04:03.016719+09	\N	f	3	4
21	emotional_functioning_domain	33.33333333333333	2020-05-07 14:04:03.017719+09	\N	f	3	5
22	social_functioning_domain	25	2020-05-07 14:04:03.019719+09	\N	f	3	6
23	health_perceptions_domain	41.66666666666667	2020-05-07 14:04:03.020718+09	\N	f	3	7
24	respiratory_symptoms_domain	33.33333333333333	2020-05-07 14:04:03.021719+09	\N	f	3	8
25	treatment_burden_domain	77.77777777777779	2020-05-07 14:06:45.718232+09	\N	f	4	1
26	physical_functioning_domain	53.333333333333336	2020-05-07 14:06:45.719231+09	\N	f	4	2
27	role_functioning_domain	20.000000000000004	2020-05-07 14:06:45.72023+09	\N	f	4	3
28	vitality_domain	66.66666666666666	2020-05-07 14:06:45.72023+09	\N	f	4	4
29	emotional_functioning_domain	50	2020-05-07 14:06:45.721233+09	\N	f	4	5
30	social_functioning_domain	83.33333333333334	2020-05-07 14:06:45.722231+09	\N	f	4	6
31	health_perceptions_domain	41.66666666666667	2020-05-07 14:06:45.723234+09	\N	f	4	7
32	respiratory_symptoms_domain	37.03703703703704	2020-05-07 14:06:45.726233+09	\N	f	4	8
\.


--
-- TOC entry 3281 (class 0 OID 16431)
-- Dependencies: 216
-- Data for Name: user_survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_survey (id, created_at, updated_at, deleted, user_id, survey_id) FROM stdin;
1	2020-05-07 11:52:04.136357+09	\N	f	1	1
2	2020-05-07 12:03:32.393618+09	\N	f	2	1
3	2020-05-07 14:04:02.12772+09	\N	f	3	1
4	2020-05-07 14:06:45.647232+09	\N	f	4	1
\.


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 203
-- Name: answer_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_score_id_seq', 149, true);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 205
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 38, true);


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 207
-- Name: score_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.score_type_id_seq', 8, true);


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 209
-- Name: survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_id_seq', 1, true);


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_answer_id_seq', 149, true);


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 213
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_score_id_seq', 32, true);


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_survey_id_seq', 4, true);


--
-- TOC entry 3111 (class 2606 OID 16445)
-- Name: answer_score answer_score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer_score
    ADD CONSTRAINT answer_score_pkey PRIMARY KEY (id);


--
-- TOC entry 3113 (class 2606 OID 16447)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 3115 (class 2606 OID 16449)
-- Name: score_type score_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score_type
    ADD CONSTRAINT score_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 16451)
-- Name: score_type score_type_score_type_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score_type
    ADD CONSTRAINT score_type_score_type_id_key UNIQUE (score_type_id);


--
-- TOC entry 3119 (class 2606 OID 16453)
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 16455)
-- Name: survey survey_survey_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_survey_id_key UNIQUE (survey_id);


--
-- TOC entry 3127 (class 2606 OID 16457)
-- Name: user_answer user_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answer
    ADD CONSTRAINT user_answer_pkey PRIMARY KEY (id);


--
-- TOC entry 3123 (class 2606 OID 16459)
-- Name: user user_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_person_id_key UNIQUE (person_id);


--
-- TOC entry 3125 (class 2606 OID 16461)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 16463)
-- Name: user_score user_score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_score
    ADD CONSTRAINT user_score_pkey PRIMARY KEY (id);


--
-- TOC entry 3131 (class 2606 OID 16465)
-- Name: user_survey user_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_survey
    ADD CONSTRAINT user_survey_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 16466)
-- Name: question question_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES public.survey(id);


--
-- TOC entry 3133 (class 2606 OID 16471)
-- Name: score_type score_type_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score_type
    ADD CONSTRAINT score_type_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES public.survey(id);


--
-- TOC entry 3134 (class 2606 OID 16476)
-- Name: user_answer user_answer_answer_score_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answer
    ADD CONSTRAINT user_answer_answer_score_id_fkey FOREIGN KEY (answer_score_id) REFERENCES public.answer_score(id);


--
-- TOC entry 3135 (class 2606 OID 16481)
-- Name: user_answer user_answer_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answer
    ADD CONSTRAINT user_answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 3136 (class 2606 OID 16486)
-- Name: user_answer user_answer_user_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_answer
    ADD CONSTRAINT user_answer_user_survey_id_fkey FOREIGN KEY (user_survey_id) REFERENCES public.user_survey(id);


--
-- TOC entry 3137 (class 2606 OID 16491)
-- Name: user_score user_score_score_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_score
    ADD CONSTRAINT user_score_score_type_id_fkey FOREIGN KEY (score_type_id) REFERENCES public.score_type(id);


--
-- TOC entry 3138 (class 2606 OID 16496)
-- Name: user_score user_score_user_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_score
    ADD CONSTRAINT user_score_user_survey_id_fkey FOREIGN KEY (user_survey_id) REFERENCES public.user_survey(id);


--
-- TOC entry 3139 (class 2606 OID 16501)
-- Name: user_survey user_survey_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_survey
    ADD CONSTRAINT user_survey_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES public.survey(id);


--
-- TOC entry 3140 (class 2606 OID 16506)
-- Name: user_survey user_survey_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_survey
    ADD CONSTRAINT user_survey_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2020-05-09 21:07:12 JST

--
-- PostgreSQL database dump complete
--

