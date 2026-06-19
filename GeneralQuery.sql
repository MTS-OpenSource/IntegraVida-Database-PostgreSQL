--
-- PostgreSQL database dump
--

\restrict LBi4peIaWxzG7LaOa8RMzVmcZtbNvMMfCk2dtgHyUh52N41kFB9RhnDz7WmNxho

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-19 15:54:56 EDT

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
-- TOC entry 225 (class 1259 OID 16529)
-- Name: adverse_effects; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.adverse_effects (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    medication_id integer NOT NULL,
    description text,
    severity character varying(20),
    reported_at character varying(30)
);


ALTER TABLE public.adverse_effects OWNER TO postgresql;

--
-- TOC entry 224 (class 1259 OID 16528)
-- Name: adverse_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.adverse_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adverse_effects_id_seq OWNER TO postgresql;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 224
-- Name: adverse_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.adverse_effects_id_seq OWNED BY public.adverse_effects.id;


--
-- TOC entry 232 (class 1259 OID 16912)
-- Name: alerts; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.alerts (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    glucose_record_id uuid NOT NULL,
    glucose_value numeric(12,2) NOT NULL,
    message character varying(1000) NOT NULL,
    patient_id uuid NOT NULL,
    read_at timestamp(6) without time zone,
    severity character varying(255) NOT NULL
);


ALTER TABLE public.alerts OWNER TO postgresql;

--
-- TOC entry 231 (class 1259 OID 16630)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    scheduled_at character varying(30),
    status character varying(255) DEFAULT 'confirmed'::character varying,
    notes text,
    cancelled_at timestamp(6) without time zone
);


ALTER TABLE public.appointments OWNER TO postgresql;

--
-- TOC entry 230 (class 1259 OID 16629)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO postgresql;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 230
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 233 (class 1259 OID 16920)
-- Name: clinical_observations; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.clinical_observations (
    id uuid NOT NULL,
    category character varying(255) NOT NULL,
    content character varying(2000) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    observed_at timestamp(6) without time zone NOT NULL,
    patient_id uuid NOT NULL,
    title character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.clinical_observations OWNER TO postgresql;

--
-- TOC entry 229 (class 1259 OID 16611)
-- Name: clinical_reports; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.clinical_reports (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    summary character varying(255),
    generated_at character varying(30),
    issued_at timestamp(6) without time zone
);


ALTER TABLE public.clinical_reports OWNER TO postgresql;

--
-- TOC entry 228 (class 1259 OID 16610)
-- Name: clinical_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.clinical_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clinical_reports_id_seq OWNER TO postgresql;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 228
-- Name: clinical_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.clinical_reports_id_seq OWNED BY public.clinical_reports.id;


--
-- TOC entry 227 (class 1259 OID 16592)
-- Name: diagnoses; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.diagnoses (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    description character varying(255),
    diagnosed_at character varying(30)
);


ALTER TABLE public.diagnoses OWNER TO postgresql;

--
-- TOC entry 226 (class 1259 OID 16591)
-- Name: diagnoses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.diagnoses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diagnoses_id_seq OWNER TO postgresql;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 226
-- Name: diagnoses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.diagnoses_id_seq OWNED BY public.diagnoses.id;


--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    user_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    specialty integer,
    license_number character varying(50)
);


ALTER TABLE public.doctors OWNER TO postgresql;

--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_id_seq OWNER TO postgresql;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 217
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- TOC entry 234 (class 1259 OID 16941)
-- Name: glucose_ranges; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.glucose_ranges (
    id uuid NOT NULL,
    active boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    maximum_value numeric(12,2) NOT NULL,
    minimum_value numeric(12,2) NOT NULL,
    patient_id uuid NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.glucose_ranges OWNER TO postgresql;

--
-- TOC entry 235 (class 1259 OID 16946)
-- Name: glucose_records; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.glucose_records (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    glucose_value numeric(12,2) NOT NULL,
    maximum_range numeric(12,2) NOT NULL,
    measured_at timestamp(6) without time zone NOT NULL,
    minimum_range numeric(12,2) NOT NULL,
    patient_id uuid NOT NULL,
    triggered_severity character varying(255),
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.glucose_records OWNER TO postgresql;

--
-- TOC entry 223 (class 1259 OID 16465)
-- Name: medical_history; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.medical_history (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    condition character varying(255),
    diagnosed_at character varying(30),
    notes text
);


ALTER TABLE public.medical_history OWNER TO postgresql;

--
-- TOC entry 222 (class 1259 OID 16464)
-- Name: medical_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.medical_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_history_id_seq OWNER TO postgresql;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 222
-- Name: medical_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.medical_history_id_seq OWNED BY public.medical_history.id;


--
-- TOC entry 237 (class 1259 OID 16994)
-- Name: medication_entity; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.medication_entity (
    id uuid NOT NULL,
    active boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    days_of_week oid NOT NULL,
    discontinued_at timestamp(6) without time zone,
    dosage character varying(255) NOT NULL,
    dose_times oid NOT NULL,
    instructions oid NOT NULL,
    name character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    treatment_id uuid NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.medication_entity OWNER TO postgresql;

--
-- TOC entry 238 (class 1259 OID 17001)
-- Name: medication_intake_entity; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.medication_intake_entity (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    medication_id uuid NOT NULL,
    notes text NOT NULL,
    patient_id uuid NOT NULL,
    taken_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.medication_intake_entity OWNER TO postgresql;

--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: patient_doctor; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.patient_doctor (
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL
);


ALTER TABLE public.patient_doctor OWNER TO postgresql;

--
-- TOC entry 239 (class 1259 OID 17008)
-- Name: patient_entity; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.patient_entity (
    id uuid NOT NULL,
    active boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    medical_record_number character varying(255) NOT NULL,
    notes text NOT NULL,
    profile_id uuid NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.patient_entity OWNER TO postgresql;

--
-- TOC entry 236 (class 1259 OID 16951)
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    date_of_birth date NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    phone_number character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.profiles OWNER TO postgresql;

--
-- TOC entry 221 (class 1259 OID 16451)
-- Name: symptoms; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.symptoms (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    description text,
    severity character varying(20),
    recorded_at character varying(30)
);


ALTER TABLE public.symptoms OWNER TO postgresql;

--
-- TOC entry 220 (class 1259 OID 16450)
-- Name: symptoms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.symptoms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.symptoms_id_seq OWNER TO postgresql;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 220
-- Name: symptoms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.symptoms_id_seq OWNED BY public.symptoms.id;


--
-- TOC entry 240 (class 1259 OID 17015)
-- Name: treatment_entity; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.treatment_entity (
    id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text NOT NULL,
    end_date date,
    name character varying(255) NOT NULL,
    patient_id uuid NOT NULL,
    start_date date NOT NULL,
    status character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.treatment_entity OWNER TO postgresql;

--
-- TOC entry 216 (class 1259 OID 16386)
-- Name: users; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY (ARRAY[('Patient'::character varying)::text, ('Doctor'::character varying)::text])))
);


ALTER TABLE public.users OWNER TO postgresql;

--
-- TOC entry 215 (class 1259 OID 16385)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresql
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgresql;

--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresql
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3346 (class 2604 OID 16532)
-- Name: adverse_effects id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.adverse_effects ALTER COLUMN id SET DEFAULT nextval('public.adverse_effects_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 16633)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 16614)
-- Name: clinical_reports id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.clinical_reports ALTER COLUMN id SET DEFAULT nextval('public.clinical_reports_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 16595)
-- Name: diagnoses id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.diagnoses ALTER COLUMN id SET DEFAULT nextval('public.diagnoses_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 16415)
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16468)
-- Name: medical_history id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.medical_history ALTER COLUMN id SET DEFAULT nextval('public.medical_history_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 16454)
-- Name: symptoms id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.symptoms ALTER COLUMN id SET DEFAULT nextval('public.symptoms_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 16958)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3367 (class 2606 OID 16536)
-- Name: adverse_effects adverse_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.adverse_effects
    ADD CONSTRAINT adverse_effects_pkey PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 16918)
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- TOC entry 3373 (class 2606 OID 16638)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 16926)
-- Name: clinical_observations clinical_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.clinical_observations
    ADD CONSTRAINT clinical_observations_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 16618)
-- Name: clinical_reports clinical_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.clinical_reports
    ADD CONSTRAINT clinical_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 16599)
-- Name: diagnoses diagnoses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.diagnoses
    ADD CONSTRAINT diagnoses_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 16417)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 16945)
-- Name: glucose_ranges glucose_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.glucose_ranges
    ADD CONSTRAINT glucose_ranges_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 16950)
-- Name: glucose_records glucose_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.glucose_records
    ADD CONSTRAINT glucose_records_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 16472)
-- Name: medical_history medical_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.medical_history
    ADD CONSTRAINT medical_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 17000)
-- Name: medication_entity medication_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.medication_entity
    ADD CONSTRAINT medication_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 17007)
-- Name: medication_intake_entity medication_intake_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.medication_intake_entity
    ADD CONSTRAINT medication_intake_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3361 (class 2606 OID 16427)
-- Name: patient_doctor patient_doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.patient_doctor
    ADD CONSTRAINT patient_doctor_pkey PRIMARY KEY (patient_id, doctor_id);


--
-- TOC entry 3391 (class 2606 OID 17014)
-- Name: patient_entity patient_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.patient_entity
    ADD CONSTRAINT patient_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 16957)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 16458)
-- Name: symptoms symptoms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.symptoms
    ADD CONSTRAINT symptoms_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 17021)
-- Name: treatment_entity treatment_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.treatment_entity
    ADD CONSTRAINT treatment_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 17025)
-- Name: patient_entity ukld1vpprjq4kmj3f0k1o8tja44; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.patient_entity
    ADD CONSTRAINT ukld1vpprjq4kmj3f0k1o8tja44 UNIQUE (profile_id);


--
-- TOC entry 3385 (class 2606 OID 16983)
-- Name: profiles uklnk8iosvsrn5614xw3lgnybgk; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT uklnk8iosvsrn5614xw3lgnybgk UNIQUE (email);


--
-- TOC entry 3395 (class 2606 OID 17023)
-- Name: patient_entity ukng2sacll2csof93w54p2ur5cs; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.patient_entity
    ADD CONSTRAINT ukng2sacll2csof93w54p2ur5cs UNIQUE (medical_record_number);


--
-- TOC entry 3353 (class 2606 OID 16396)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3355 (class 2606 OID 16960)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3357 (class 2606 OID 16981)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3402 (class 2606 OID 16644)
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 16624)
-- Name: clinical_reports clinical_reports_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.clinical_reports
    ADD CONSTRAINT clinical_reports_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;


--
-- TOC entry 3400 (class 2606 OID 16605)
-- Name: diagnoses diagnoses_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.diagnoses
    ADD CONSTRAINT diagnoses_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;


--
-- TOC entry 3398 (class 2606 OID 16966)
-- Name: doctors doctors_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3399 (class 2606 OID 16433)
-- Name: patient_doctor patient_doctor_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresql
--

ALTER TABLE ONLY public.patient_doctor
    ADD CONSTRAINT patient_doctor_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;


-- Completed on 2026-06-19 15:54:56 EDT

--
-- PostgreSQL database dump complete
--

\unrestrict LBi4peIaWxzG7LaOa8RMzVmcZtbNvMMfCk2dtgHyUh52N41kFB9RhnDz7WmNxho

