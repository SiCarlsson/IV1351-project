--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: historical_lesson_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historical_lesson_information (
    id integer NOT NULL,
    lesson_type character varying(100) NOT NULL,
    genre character varying(100),
    instrument character varying(100),
    lesson_price character varying(100) NOT NULL,
    student_name character varying(100) NOT NULL,
    student_email character varying(100)
);


ALTER TABLE public.historical_lesson_information OWNER TO postgres;

--
-- Name: historical_lesson_information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historical_lesson_information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historical_lesson_information_id_seq OWNER TO postgres;

--
-- Name: historical_lesson_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historical_lesson_information_id_seq OWNED BY public.historical_lesson_information.id;


--
-- Name: historical_lesson_information id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historical_lesson_information ALTER COLUMN id SET DEFAULT nextval('public.historical_lesson_information_id_seq'::regclass);


--
-- Name: historical_lesson_information historical_lesson_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historical_lesson_information
    ADD CONSTRAINT historical_lesson_information_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

