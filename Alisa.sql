--
-- PostgreSQL database dump
--

\restrict TMxAvehHS3R1y6dmDBEnvxhQogOFpMD69mSxOK4p6jzY1xnSbT5gjR3GssO6XUd

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-01 21:19:45

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16905)
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    collection_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16904)
-- Name: collections_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collections_collection_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 217
-- Name: collections_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_collection_id_seq OWNED BY public.collections.collection_id;


--
-- TOC entry 223 (class 1259 OID 16940)
-- Name: document_mentions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_mentions (
    document_id integer NOT NULL,
    person_id integer NOT NULL,
    mention_type character varying(50) DEFAULT 'mentioned'::character varying
);


ALTER TABLE public.document_mentions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16925)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    document_id integer NOT NULL,
    title character varying(255) NOT NULL,
    creation_date date,
    storage_path character varying(500),
    collection_id integer
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16924)
-- Name: documents_document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documents_document_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 221
-- Name: documents_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_document_id_seq OWNED BY public.documents.document_id;


--
-- TOC entry 220 (class 1259 OID 16916)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    person_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    biography text
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16915)
-- Name: persons_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_person_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: persons_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_person_id_seq OWNED BY public.persons.person_id;


--
-- TOC entry 4756 (class 2604 OID 16908)
-- Name: collections collection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN collection_id SET DEFAULT nextval('public.collections_collection_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16928)
-- Name: documents document_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN document_id SET DEFAULT nextval('public.documents_document_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 16919)
-- Name: persons person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN person_id SET DEFAULT nextval('public.persons_person_id_seq'::regclass);


--
-- TOC entry 4921 (class 0 OID 16905)
-- Dependencies: 218
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (collection_id, name, description) FROM stdin;
1	Фонд Косачів	Документи родини Косачів, м. Луцьк
2	Архіви Міської Управи	Матеріали засідань 1900-1920 рр.
\.


--
-- TOC entry 4926 (class 0 OID 16940)
-- Dependencies: 223
-- Data for Name: document_mentions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.document_mentions (document_id, person_id, mention_type) FROM stdin;
1	1	author
1	2	recipient
\.


--
-- TOC entry 4925 (class 0 OID 16925)
-- Dependencies: 222
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (document_id, title, creation_date, storage_path, collection_id) FROM stdin;
1	Лист до матері	1901-02-15	/scans/doc_001.pdf	1
2	Протокол засідання №5	1905-03-20	/scans/doc_002.jpg	2
\.


--
-- TOC entry 4923 (class 0 OID 16916)
-- Dependencies: 220
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (person_id, full_name, biography) FROM stdin;
1	Леся Українка	Лариса Петрівна Косач-Квітка. Видатна поетеса.
2	Олена Пчілка	Ольга Петрівна Драгоманова-Косач. Мати Лесі Українки.
\.


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 217
-- Name: collections_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_collection_id_seq', 2, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 221
-- Name: documents_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_document_id_seq', 2, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 219
-- Name: persons_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_person_id_seq', 2, true);


--
-- TOC entry 4761 (class 2606 OID 16914)
-- Name: collections collections_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_name_key UNIQUE (name);


--
-- TOC entry 4763 (class 2606 OID 16912)
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (collection_id);


--
-- TOC entry 4771 (class 2606 OID 16945)
-- Name: document_mentions document_mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_mentions
    ADD CONSTRAINT document_mentions_pkey PRIMARY KEY (document_id, person_id);


--
-- TOC entry 4767 (class 2606 OID 16932)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (document_id);


--
-- TOC entry 4769 (class 2606 OID 16934)
-- Name: documents documents_storage_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_storage_path_key UNIQUE (storage_path);


--
-- TOC entry 4765 (class 2606 OID 16923)
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4772 (class 2606 OID 16935)
-- Name: documents fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE SET NULL;


--
-- TOC entry 4773 (class 2606 OID 16946)
-- Name: document_mentions fk_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_mentions
    ADD CONSTRAINT fk_document FOREIGN KEY (document_id) REFERENCES public.documents(document_id) ON DELETE CASCADE;


--
-- TOC entry 4774 (class 2606 OID 16951)
-- Name: document_mentions fk_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_mentions
    ADD CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES public.persons(person_id) ON DELETE CASCADE;


-- Completed on 2025-11-01 21:19:46

--
-- PostgreSQL database dump complete
--

\unrestrict TMxAvehHS3R1y6dmDBEnvxhQogOFpMD69mSxOK4p6jzY1xnSbT5gjR3GssO6XUd

