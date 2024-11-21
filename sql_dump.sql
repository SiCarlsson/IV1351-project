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
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_date timestamp without time zone NOT NULL,
    student_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_id_seq OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: booking_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_student_id_seq OWNER TO postgres;

--
-- Name: booking_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_student_id_seq OWNED BY public.booking.student_id;


--
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    id integer NOT NULL,
    relationship character varying(100),
    student_id integer NOT NULL
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- Name: contact_person_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person_email (
    contact_person_id integer NOT NULL,
    email_id integer NOT NULL
);


ALTER TABLE public.contact_person_email OWNER TO postgres;

--
-- Name: contact_person_email_contact_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_email_contact_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_email_contact_person_id_seq OWNER TO postgres;

--
-- Name: contact_person_email_contact_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_email_contact_person_id_seq OWNED BY public.contact_person_email.contact_person_id;


--
-- Name: contact_person_email_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_email_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_email_email_id_seq OWNER TO postgres;

--
-- Name: contact_person_email_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_email_email_id_seq OWNED BY public.contact_person_email.email_id;


--
-- Name: contact_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_id_seq OWNER TO postgres;

--
-- Name: contact_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_id_seq OWNED BY public.contact_person.id;


--
-- Name: contact_person_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person_phone (
    contact_person_id integer NOT NULL,
    phone_id integer NOT NULL
);


ALTER TABLE public.contact_person_phone OWNER TO postgres;

--
-- Name: contact_person_phone_contact_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_phone_contact_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_phone_contact_person_id_seq OWNER TO postgres;

--
-- Name: contact_person_phone_contact_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_phone_contact_person_id_seq OWNED BY public.contact_person_phone.contact_person_id;


--
-- Name: contact_person_phone_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_phone_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_phone_phone_id_seq OWNER TO postgres;

--
-- Name: contact_person_phone_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_phone_phone_id_seq OWNED BY public.contact_person_phone.phone_id;


--
-- Name: contact_person_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_person_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_person_student_id_seq OWNER TO postgres;

--
-- Name: contact_person_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_person_student_id_seq OWNED BY public.contact_person.student_id;


--
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email (
    id integer NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.email OWNER TO postgres;

--
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_id_seq OWNER TO postgres;

--
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_id_seq OWNED BY public.email.id;


--
-- Name: ensemble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble (
    id integer NOT NULL,
    genre character varying(100) NOT NULL,
    group_based_lesson_id integer NOT NULL
);


ALTER TABLE public.ensemble OWNER TO postgres;

--
-- Name: ensemble_group_based_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ensemble_group_based_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ensemble_group_based_lesson_id_seq OWNER TO postgres;

--
-- Name: ensemble_group_based_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ensemble_group_based_lesson_id_seq OWNED BY public.ensemble.group_based_lesson_id;


--
-- Name: ensemble_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ensemble_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ensemble_id_seq OWNER TO postgres;

--
-- Name: ensemble_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ensemble_id_seq OWNED BY public.ensemble.id;


--
-- Name: group_based_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_based_lesson (
    id integer NOT NULL,
    minimum_number_of_spots character varying(100) NOT NULL,
    maximum_number_of_spots character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.group_based_lesson OWNER TO postgres;

--
-- Name: group_based_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_based_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_based_lesson_id_seq OWNER TO postgres;

--
-- Name: group_based_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_based_lesson_id_seq OWNED BY public.group_based_lesson.id;


--
-- Name: group_based_lesson_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_based_lesson_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_based_lesson_lesson_id_seq OWNER TO postgres;

--
-- Name: group_based_lesson_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_based_lesson_lesson_id_seq OWNED BY public.group_based_lesson.lesson_id;


--
-- Name: group_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson (
    id integer NOT NULL,
    skill_level character varying(100) NOT NULL,
    specific_instrument character varying(100) NOT NULL,
    group_based_lesson_id integer NOT NULL
);


ALTER TABLE public.group_lesson OWNER TO postgres;

--
-- Name: group_lesson_group_based_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_lesson_group_based_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_lesson_group_based_lesson_id_seq OWNER TO postgres;

--
-- Name: group_lesson_group_based_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_lesson_group_based_lesson_id_seq OWNED BY public.group_lesson.group_based_lesson_id;


--
-- Name: group_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_lesson_id_seq OWNER TO postgres;

--
-- Name: group_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_lesson_id_seq OWNED BY public.group_lesson.id;


--
-- Name: individual_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_lesson (
    id integer NOT NULL,
    specific_instrument character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.individual_lesson OWNER TO postgres;

--
-- Name: individual_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individual_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.individual_lesson_id_seq OWNER TO postgres;

--
-- Name: individual_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individual_lesson_id_seq OWNED BY public.individual_lesson.id;


--
-- Name: individual_lesson_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individual_lesson_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.individual_lesson_lesson_id_seq OWNER TO postgres;

--
-- Name: individual_lesson_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individual_lesson_lesson_id_seq OWNED BY public.individual_lesson.lesson_id;


--
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    is_employed boolean NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- Name: instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_id_seq OWNER TO postgres;

--
-- Name: instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_id_seq OWNED BY public.instructor.id;


--
-- Name: instructor_known_instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_known_instruments (
    instructor_id integer NOT NULL,
    known_instruments_id integer NOT NULL
);


ALTER TABLE public.instructor_known_instruments OWNER TO postgres;

--
-- Name: instructor_known_instruments_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_known_instruments_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_known_instruments_instructor_id_seq OWNER TO postgres;

--
-- Name: instructor_known_instruments_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_known_instruments_instructor_id_seq OWNED BY public.instructor_known_instruments.instructor_id;


--
-- Name: instructor_known_instruments_known_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_known_instruments_known_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_known_instruments_known_instruments_id_seq OWNER TO postgres;

--
-- Name: instructor_known_instruments_known_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_known_instruments_known_instruments_id_seq OWNED BY public.instructor_known_instruments.known_instruments_id;


--
-- Name: instructor_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_person_id_seq OWNER TO postgres;

--
-- Name: instructor_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_person_id_seq OWNED BY public.instructor.person_id;


--
-- Name: instructor_type_of_lesson_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_type_of_lesson_availability (
    instructor_id integer NOT NULL,
    type_of_lesson_availability_id integer NOT NULL
);


ALTER TABLE public.instructor_type_of_lesson_availability OWNER TO postgres;

--
-- Name: instructor_type_of_lesson_ava_type_of_lesson_availability_i_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_type_of_lesson_ava_type_of_lesson_availability_i_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_type_of_lesson_ava_type_of_lesson_availability_i_seq OWNER TO postgres;

--
-- Name: instructor_type_of_lesson_ava_type_of_lesson_availability_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_type_of_lesson_ava_type_of_lesson_availability_i_seq OWNED BY public.instructor_type_of_lesson_availability.type_of_lesson_availability_id;


--
-- Name: instructor_type_of_lesson_availability_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_type_of_lesson_availability_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_type_of_lesson_availability_instructor_id_seq OWNER TO postgres;

--
-- Name: instructor_type_of_lesson_availability_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_type_of_lesson_availability_instructor_id_seq OWNED BY public.instructor_type_of_lesson_availability.instructor_id;


--
-- Name: instrumental_lease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrumental_lease (
    id integer NOT NULL,
    type_of_instrument character varying(100),
    start_date date,
    end_date date,
    student_id integer NOT NULL,
    instrumental_storage_id integer NOT NULL
);


ALTER TABLE public.instrumental_lease OWNER TO postgres;

--
-- Name: instrumental_lease_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrumental_lease_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrumental_lease_id_seq OWNER TO postgres;

--
-- Name: instrumental_lease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrumental_lease_id_seq OWNED BY public.instrumental_lease.id;


--
-- Name: instrumental_lease_instrumental_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrumental_lease_instrumental_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrumental_lease_instrumental_storage_id_seq OWNER TO postgres;

--
-- Name: instrumental_lease_instrumental_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrumental_lease_instrumental_storage_id_seq OWNED BY public.instrumental_lease.instrumental_storage_id;


--
-- Name: instrumental_lease_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrumental_lease_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrumental_lease_student_id_seq OWNER TO postgres;

--
-- Name: instrumental_lease_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrumental_lease_student_id_seq OWNED BY public.instrumental_lease.student_id;


--
-- Name: instrumental_price_scheme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrumental_price_scheme (
    id integer NOT NULL,
    type_of_instrument character varying(100) NOT NULL,
    fee_per_month character varying(100) NOT NULL,
    price_from_date date NOT NULL
);


ALTER TABLE public.instrumental_price_scheme OWNER TO postgres;

--
-- Name: instrumental_price_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrumental_price_scheme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrumental_price_scheme_id_seq OWNER TO postgres;

--
-- Name: instrumental_price_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrumental_price_scheme_id_seq OWNED BY public.instrumental_price_scheme.id;


--
-- Name: instrumental_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrumental_storage (
    id integer NOT NULL,
    instrument_brand character varying(100) NOT NULL,
    quantity character varying(100) NOT NULL
);


ALTER TABLE public.instrumental_storage OWNER TO postgres;

--
-- Name: instrumental_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrumental_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrumental_storage_id_seq OWNER TO postgres;

--
-- Name: instrumental_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrumental_storage_id_seq OWNED BY public.instrumental_storage.id;


--
-- Name: known_instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.known_instruments (
    id integer NOT NULL,
    instrument character varying(100) NOT NULL
);


ALTER TABLE public.known_instruments OWNER TO postgres;

--
-- Name: known_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.known_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.known_instruments_id_seq OWNER TO postgres;

--
-- Name: known_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.known_instruments_id_seq OWNED BY public.known_instruments.id;


--
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    id integer NOT NULL,
    date date NOT NULL,
    "time" time(6) without time zone NOT NULL,
    duration character varying(10) NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- Name: lesson_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_booking (
    lesson_id integer NOT NULL,
    booking_id integer NOT NULL
);


ALTER TABLE public.lesson_booking OWNER TO postgres;

--
-- Name: lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_id_seq OWNER TO postgres;

--
-- Name: lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.id;


--
-- Name: lesson_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_instructor_id_seq OWNER TO postgres;

--
-- Name: lesson_instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_instructor_id_seq OWNED BY public.lesson.instructor_id;


--
-- Name: lesson_price_scheme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_price_scheme (
    id integer NOT NULL,
    lesson_type character varying(100) NOT NULL,
    skill_level character varying(100) NOT NULL,
    price_per_lesson character varying(100) NOT NULL,
    price_from_date date NOT NULL
);


ALTER TABLE public.lesson_price_scheme OWNER TO postgres;

--
-- Name: lesson_price_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_price_scheme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_price_scheme_id_seq OWNER TO postgres;

--
-- Name: lesson_price_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_price_scheme_id_seq OWNED BY public.lesson_price_scheme.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    social_security_number character varying(12) NOT NULL,
    street_name character varying(100) NOT NULL,
    zip_code character varying(5) NOT NULL,
    city character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_email (
    person_id integer NOT NULL,
    email_id integer NOT NULL
);


ALTER TABLE public.person_email OWNER TO postgres;

--
-- Name: person_email_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_email_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_email_email_id_seq OWNER TO postgres;

--
-- Name: person_email_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_email_email_id_seq OWNED BY public.person_email.email_id;


--
-- Name: person_email_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_email_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_email_person_id_seq OWNER TO postgres;

--
-- Name: person_email_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_email_person_id_seq OWNED BY public.person_email.person_id;


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_phone (
    person_id integer NOT NULL,
    phone_id integer NOT NULL
);


ALTER TABLE public.person_phone OWNER TO postgres;

--
-- Name: person_phone_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_phone_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_phone_person_id_seq OWNER TO postgres;

--
-- Name: person_phone_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_phone_person_id_seq OWNED BY public.person_phone.person_id;


--
-- Name: person_phone_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_phone_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_phone_phone_id_seq OWNER TO postgres;

--
-- Name: person_phone_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_phone_phone_id_seq OWNED BY public.person_phone.phone_id;


--
-- Name: phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone (
    id integer NOT NULL,
    phone_nr character varying(100) NOT NULL
);


ALTER TABLE public.phone OWNER TO postgres;

--
-- Name: phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phone_id_seq OWNER TO postgres;

--
-- Name: phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_id_seq OWNED BY public.phone.id;


--
-- Name: sibling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling (
    id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.sibling OWNER TO postgres;

--
-- Name: sibling_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sibling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sibling_id_seq OWNER TO postgres;

--
-- Name: sibling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sibling_id_seq OWNED BY public.sibling.id;


--
-- Name: skill_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill_level (
    id integer NOT NULL,
    skill_level character varying(100) NOT NULL,
    instrument character varying(100) NOT NULL
);


ALTER TABLE public.skill_level OWNER TO postgres;

--
-- Name: skill_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skill_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skill_level_id_seq OWNER TO postgres;

--
-- Name: skill_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skill_level_id_seq OWNED BY public.skill_level.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    age character varying(3) NOT NULL,
    has_sibling boolean NOT NULL,
    active_leases character varying(1) NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: student_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_person_id_seq OWNER TO postgres;

--
-- Name: student_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_person_id_seq OWNED BY public.student.person_id;


--
-- Name: student_sibling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_sibling (
    student_id integer NOT NULL,
    sibling_id integer NOT NULL
);


ALTER TABLE public.student_sibling OWNER TO postgres;

--
-- Name: student_sibling_sibling_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_sibling_sibling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_sibling_sibling_id_seq OWNER TO postgres;

--
-- Name: student_sibling_sibling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_sibling_sibling_id_seq OWNED BY public.student_sibling.sibling_id;


--
-- Name: student_sibling_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_sibling_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_sibling_student_id_seq OWNER TO postgres;

--
-- Name: student_sibling_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_sibling_student_id_seq OWNED BY public.student_sibling.student_id;


--
-- Name: student_skill_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_skill_level (
    student_id integer NOT NULL,
    skill_level_id integer NOT NULL
);


ALTER TABLE public.student_skill_level OWNER TO postgres;

--
-- Name: student_skill_level_skill_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_skill_level_skill_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_skill_level_skill_level_id_seq OWNER TO postgres;

--
-- Name: student_skill_level_skill_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_skill_level_skill_level_id_seq OWNED BY public.student_skill_level.skill_level_id;


--
-- Name: student_skill_level_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_skill_level_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_skill_level_student_id_seq OWNER TO postgres;

--
-- Name: student_skill_level_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_skill_level_student_id_seq OWNED BY public.student_skill_level.student_id;


--
-- Name: type_of_lesson_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_lesson_availability (
    id integer NOT NULL,
    type_of_lesson character varying(100) NOT NULL
);


ALTER TABLE public.type_of_lesson_availability OWNER TO postgres;

--
-- Name: type_of_lesson_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_of_lesson_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_of_lesson_availability_id_seq OWNER TO postgres;

--
-- Name: type_of_lesson_availability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_of_lesson_availability_id_seq OWNED BY public.type_of_lesson_availability.id;


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: contact_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person ALTER COLUMN id SET DEFAULT nextval('public.contact_person_id_seq'::regclass);


--
-- Name: email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email ALTER COLUMN id SET DEFAULT nextval('public.email_id_seq'::regclass);


--
-- Name: ensemble id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble ALTER COLUMN id SET DEFAULT nextval('public.ensemble_id_seq'::regclass);


--
-- Name: group_based_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_based_lesson ALTER COLUMN id SET DEFAULT nextval('public.group_based_lesson_id_seq'::regclass);


--
-- Name: group_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson ALTER COLUMN id SET DEFAULT nextval('public.group_lesson_id_seq'::regclass);


--
-- Name: individual_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson ALTER COLUMN id SET DEFAULT nextval('public.individual_lesson_id_seq'::regclass);


--
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public.instructor_id_seq'::regclass);


--
-- Name: instrumental_lease id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_lease ALTER COLUMN id SET DEFAULT nextval('public.instrumental_lease_id_seq'::regclass);


--
-- Name: instrumental_price_scheme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_price_scheme ALTER COLUMN id SET DEFAULT nextval('public.instrumental_price_scheme_id_seq'::regclass);


--
-- Name: instrumental_storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_storage ALTER COLUMN id SET DEFAULT nextval('public.instrumental_storage_id_seq'::regclass);


--
-- Name: known_instruments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.known_instruments ALTER COLUMN id SET DEFAULT nextval('public.known_instruments_id_seq'::regclass);


--
-- Name: lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson ALTER COLUMN id SET DEFAULT nextval('public.lesson_id_seq'::regclass);


--
-- Name: lesson_price_scheme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price_scheme ALTER COLUMN id SET DEFAULT nextval('public.lesson_price_scheme_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone ALTER COLUMN id SET DEFAULT nextval('public.phone_id_seq'::regclass);


--
-- Name: sibling id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling ALTER COLUMN id SET DEFAULT nextval('public.sibling_id_seq'::regclass);


--
-- Name: skill_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level ALTER COLUMN id SET DEFAULT nextval('public.skill_level_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: type_of_lesson_availability id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_lesson_availability ALTER COLUMN id SET DEFAULT nextval('public.type_of_lesson_availability_id_seq'::regclass);


--
-- Name: instructor UNIQUE instructor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT "UNIQUE instructor" PRIMARY KEY (id);


--
-- Name: person Unique id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "Unique id" UNIQUE (id);


--
-- Name: person Unique person; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT "Unique person" UNIQUE (social_security_number);


--
-- Name: booking booking_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_id_key UNIQUE (id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: contact_person_email contact_person_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_email
    ADD CONSTRAINT contact_person_email_pkey PRIMARY KEY (contact_person_id, email_id);


--
-- Name: contact_person contact_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_id_key UNIQUE (id);


--
-- Name: contact_person_phone contact_person_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_phone
    ADD CONSTRAINT contact_person_phone_pkey PRIMARY KEY (contact_person_id, phone_id);


--
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (id);


--
-- Name: email email_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_email_key UNIQUE (email);


--
-- Name: email email_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_id_key UNIQUE (id);


--
-- Name: email email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- Name: ensemble ensemble_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_id_key UNIQUE (id);


--
-- Name: ensemble ensemble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT ensemble_pkey PRIMARY KEY (id);


--
-- Name: group_based_lesson group_based_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_based_lesson
    ADD CONSTRAINT group_based_lesson_id_key UNIQUE (id);


--
-- Name: group_based_lesson group_based_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_based_lesson
    ADD CONSTRAINT group_based_lesson_pkey PRIMARY KEY (id);


--
-- Name: group_lesson group_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_id_key UNIQUE (id);


--
-- Name: group_lesson group_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_pkey PRIMARY KEY (id);


--
-- Name: student id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT id UNIQUE (id);


--
-- Name: individual_lesson individual_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_id_key UNIQUE (id);


--
-- Name: individual_lesson individual_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_pkey PRIMARY KEY (id);


--
-- Name: instructor instructor_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_id_key UNIQUE (id);


--
-- Name: instructor_known_instruments instructor_known_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_known_instruments
    ADD CONSTRAINT instructor_known_instruments_pkey PRIMARY KEY (instructor_id, known_instruments_id);


--
-- Name: instructor_type_of_lesson_availability instructor_type_of_lesson_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_type_of_lesson_availability
    ADD CONSTRAINT instructor_type_of_lesson_availability_pkey PRIMARY KEY (instructor_id, type_of_lesson_availability_id);


--
-- Name: instrumental_lease instrumental_lease_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_lease
    ADD CONSTRAINT instrumental_lease_id_key UNIQUE (id);


--
-- Name: instrumental_lease instrumental_lease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_lease
    ADD CONSTRAINT instrumental_lease_pkey PRIMARY KEY (id);


--
-- Name: instrumental_price_scheme instrumental_price_scheme_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_price_scheme
    ADD CONSTRAINT instrumental_price_scheme_id_key UNIQUE (id);


--
-- Name: instrumental_price_scheme instrumental_price_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_price_scheme
    ADD CONSTRAINT instrumental_price_scheme_pkey PRIMARY KEY (id);


--
-- Name: instrumental_storage instrumental_storage_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_storage
    ADD CONSTRAINT instrumental_storage_id_key UNIQUE (id);


--
-- Name: instrumental_storage instrumental_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_storage
    ADD CONSTRAINT instrumental_storage_pkey PRIMARY KEY (id);


--
-- Name: known_instruments known_instruments_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.known_instruments
    ADD CONSTRAINT known_instruments_id_key UNIQUE (id);


--
-- Name: known_instruments known_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.known_instruments
    ADD CONSTRAINT known_instruments_pkey PRIMARY KEY (id);


--
-- Name: lesson_booking lesson_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_booking
    ADD CONSTRAINT lesson_booking_pkey PRIMARY KEY (lesson_id, booking_id);


--
-- Name: lesson lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_id_key UNIQUE (id);


--
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (id);


--
-- Name: lesson_price_scheme lesson_price_scheme_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price_scheme
    ADD CONSTRAINT lesson_price_scheme_id_key UNIQUE (id);


--
-- Name: lesson_price_scheme lesson_price_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_price_scheme
    ADD CONSTRAINT lesson_price_scheme_pkey PRIMARY KEY (id);


--
-- Name: person_email person_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_email
    ADD CONSTRAINT person_email_pkey PRIMARY KEY (person_id, email_id);


--
-- Name: student person_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT person_id UNIQUE (person_id);


--
-- Name: person_phone person_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_phone
    ADD CONSTRAINT person_phone_pkey PRIMARY KEY (person_id, phone_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: phone phone_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_id_key UNIQUE (id);


--
-- Name: phone phone_phone_nr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_phone_nr_key UNIQUE (phone_nr);


--
-- Name: phone phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: sibling sibling_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling
    ADD CONSTRAINT sibling_id_key UNIQUE (id);


--
-- Name: sibling sibling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling
    ADD CONSTRAINT sibling_pkey PRIMARY KEY (id);


--
-- Name: skill_level skill_level_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT skill_level_id_key UNIQUE (id);


--
-- Name: skill_level skill_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill_level
    ADD CONSTRAINT skill_level_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student_sibling student_sibling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT student_sibling_pkey PRIMARY KEY (student_id, sibling_id);


--
-- Name: student_skill_level student_skill_level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_skill_level
    ADD CONSTRAINT student_skill_level_pkey PRIMARY KEY (student_id, skill_level_id);


--
-- Name: type_of_lesson_availability type_of_lesson_availability_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_lesson_availability
    ADD CONSTRAINT type_of_lesson_availability_id_key UNIQUE (id);


--
-- Name: type_of_lesson_availability type_of_lesson_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_lesson_availability
    ADD CONSTRAINT type_of_lesson_availability_pkey PRIMARY KEY (id);


--
-- Name: contact_person_phone contact_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_phone
    ADD CONSTRAINT contact_person_id FOREIGN KEY (contact_person_id) REFERENCES public.contact_person(id);


--
-- Name: contact_person_email contact_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_email
    ADD CONSTRAINT contact_person_id FOREIGN KEY (contact_person_id) REFERENCES public.contact_person(id);


--
-- Name: contact_person_email email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_email
    ADD CONSTRAINT email_id FOREIGN KEY (email_id) REFERENCES public.email(id);


--
-- Name: person_email email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_email
    ADD CONSTRAINT email_id FOREIGN KEY (email_id) REFERENCES public.email(id);


--
-- Name: ensemble group_based_lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble
    ADD CONSTRAINT group_based_lesson_id FOREIGN KEY (group_based_lesson_id) REFERENCES public.group_based_lesson(id);


--
-- Name: group_lesson group_based_lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_based_lesson_id FOREIGN KEY (group_based_lesson_id) REFERENCES public.group_based_lesson(id);


--
-- Name: lesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- Name: instructor_type_of_lesson_availability instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_type_of_lesson_availability
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- Name: instructor_known_instruments instructor_known_instruments_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_known_instruments
    ADD CONSTRAINT instructor_known_instruments_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- Name: instructor_known_instruments instructor_known_instruments_known_instruments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_known_instruments
    ADD CONSTRAINT instructor_known_instruments_known_instruments_id_fkey FOREIGN KEY (known_instruments_id) REFERENCES public.known_instruments(id);


--
-- Name: instructor instructor_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: instrumental_lease instrumental_storage_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_lease
    ADD CONSTRAINT instrumental_storage_id FOREIGN KEY (instrumental_storage_id) REFERENCES public.instrumental_storage(id) NOT VALID;


--
-- Name: lesson_booking lesson_booking_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_booking
    ADD CONSTRAINT lesson_booking_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: lesson_booking lesson_booking_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_booking
    ADD CONSTRAINT lesson_booking_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);


--
-- Name: individual_lesson lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT lesson_id FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);


--
-- Name: group_based_lesson lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_based_lesson
    ADD CONSTRAINT lesson_id FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);


--
-- Name: person_phone person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_phone
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: person_email person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_email
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: contact_person_phone phone_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person_phone
    ADD CONSTRAINT phone_id FOREIGN KEY (phone_id) REFERENCES public.phone(id);


--
-- Name: person_phone phone_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_phone
    ADD CONSTRAINT phone_id FOREIGN KEY (phone_id) REFERENCES public.phone(id);


--
-- Name: student_sibling sibling_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT sibling_id FOREIGN KEY (sibling_id) REFERENCES public.sibling(id);


--
-- Name: student_skill_level skill_level_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_skill_level
    ADD CONSTRAINT skill_level_id FOREIGN KEY (skill_level_id) REFERENCES public.skill_level(id);


--
-- Name: instrumental_lease student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrumental_lease
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: booking student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: contact_person student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: student_skill_level student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_skill_level
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: student_sibling student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_sibling
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: student student_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: instructor_type_of_lesson_availability type_of_lesson_availability_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_type_of_lesson_availability
    ADD CONSTRAINT type_of_lesson_availability_id FOREIGN KEY (type_of_lesson_availability_id) REFERENCES public.type_of_lesson_availability(id);


--
-- PostgreSQL database dump complete
--

