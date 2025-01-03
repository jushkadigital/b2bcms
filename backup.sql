--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
-- Dumped by pg_dump version 16.6 (Debian 16.6-1.pgdg120+1)

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
-- Name: admin; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA admin;


ALTER SCHEMA admin OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE admin.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_group_id_seq OWNED BY admin.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE admin.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_group_permissions_id_seq OWNED BY admin.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE admin.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_permission_id_seq OWNED BY admin.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE admin.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE admin.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_user_groups_id_seq OWNED BY admin.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_user_id_seq OWNED BY admin.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE admin.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.auth_user_user_permissions_id_seq OWNED BY admin.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag integer NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL
);


ALTER TABLE admin.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.django_admin_log_id_seq OWNED BY admin.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE admin.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.django_content_type_id_seq OWNED BY admin.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE admin.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.django_migrations_id_seq OWNED BY admin.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE admin.django_session OWNER TO admin;

--
-- Name: home_certificados; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_certificados (
    id bigint NOT NULL,
    sort_order integer,
    image_id bigint NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.home_certificados OWNER TO admin;

--
-- Name: home_certificados_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_certificados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_certificados_id_seq OWNER TO admin;

--
-- Name: home_certificados_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_certificados_id_seq OWNED BY admin.home_certificados.id;


--
-- Name: home_cloudinaryimage; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_cloudinaryimage (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x bigint,
    focal_point_y bigint,
    focal_point_width bigint,
    focal_point_height bigint,
    file_size bigint,
    file_hash character varying(40) NOT NULL,
    file character varying(100) NOT NULL,
    collection_id integer NOT NULL,
    uploaded_by_user_id integer
);


ALTER TABLE admin.home_cloudinaryimage OWNER TO admin;

--
-- Name: home_cloudinaryimage_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_cloudinaryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_cloudinaryimage_id_seq OWNER TO admin;

--
-- Name: home_cloudinaryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_cloudinaryimage_id_seq OWNED BY admin.home_cloudinaryimage.id;


--
-- Name: home_cloudinaryrendition; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_cloudinaryrendition (
    id bigint NOT NULL,
    filter_spec character varying(255) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE admin.home_cloudinaryrendition OWNER TO admin;

--
-- Name: home_cloudinaryrendition_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_cloudinaryrendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_cloudinaryrendition_id_seq OWNER TO admin;

--
-- Name: home_cloudinaryrendition_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_cloudinaryrendition_id_seq OWNED BY admin.home_cloudinaryrendition.id;


--
-- Name: home_contacto; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_contacto (
    page_ptr_id integer NOT NULL,
    titulo character varying(100) NOT NULL,
    formtitle character varying(100) NOT NULL,
    ubicacion character varying(100) NOT NULL,
    background_id bigint NOT NULL
);


ALTER TABLE admin.home_contacto OWNER TO admin;

--
-- Name: home_destino; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_destino (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    background_id bigint,
    backgroundmobile_id bigint
);


ALTER TABLE admin.home_destino OWNER TO admin;

--
-- Name: home_destino_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_destino_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_destino_id_seq OWNER TO admin;

--
-- Name: home_destino_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_destino_id_seq OWNED BY admin.home_destino.id;


--
-- Name: home_estadisticas; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_estadisticas (
    id bigint NOT NULL,
    sort_order integer,
    redlet character varying(50) NOT NULL,
    graylet character varying(50) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.home_estadisticas OWNER TO admin;

--
-- Name: home_estadisticas_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_estadisticas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_estadisticas_id_seq OWNER TO admin;

--
-- Name: home_estadisticas_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_estadisticas_id_seq OWNED BY admin.home_estadisticas.id;


--
-- Name: home_faq; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_faq (
    id bigint NOT NULL,
    sort_order integer,
    question character varying(250) NOT NULL,
    answer text NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.home_faq OWNER TO admin;

--
-- Name: home_faq_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_faq_id_seq OWNER TO admin;

--
-- Name: home_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_faq_id_seq OWNED BY admin.home_faq.id;


--
-- Name: home_global; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_global (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE admin.home_global OWNER TO admin;

--
-- Name: home_home; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_home (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE admin.home_home OWNER TO admin;

--
-- Name: home_informacion; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_informacion (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    numero character varying(255) NOT NULL,
    "desc" character varying(255),
    link character varying(300) NOT NULL
);


ALTER TABLE admin.home_informacion OWNER TO admin;

--
-- Name: home_informacion_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_informacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_informacion_id_seq OWNER TO admin;

--
-- Name: home_informacion_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_informacion_id_seq OWNED BY admin.home_informacion.id;


--
-- Name: home_inicio; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_inicio (
    page_ptr_id integer NOT NULL,
    paquetetitulo character varying(30) NOT NULL,
    destinotitulo character varying(30) NOT NULL,
    formulariotitulo character varying(75) NOT NULL,
    formulariosubtitulo character varying(200) NOT NULL,
    galleryini text NOT NULL
);


ALTER TABLE admin.home_inicio OWNER TO admin;

--
-- Name: home_nosotros; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_nosotros (
    page_ptr_id integer NOT NULL,
    titulo character varying(100) NOT NULL,
    subtitulo character varying(100) NOT NULL,
    parrafo text NOT NULL,
    razonsocial character varying(100) NOT NULL,
    numeroruc character varying(100) NOT NULL,
    nombrecomercial character varying(100) NOT NULL,
    certificadoautorizacion character varying(100) NOT NULL,
    background_id bigint NOT NULL,
    imageparrafo_id bigint NOT NULL,
    certificadossubtitle character varying(100) NOT NULL,
    partnerssubtitle character varying(100) NOT NULL,
    valoressubtitle character varying(100) NOT NULL
);


ALTER TABLE admin.home_nosotros OWNER TO admin;

--
-- Name: home_partners; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_partners (
    id bigint NOT NULL,
    sort_order integer,
    image_id bigint NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.home_partners OWNER TO admin;

--
-- Name: home_partners_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_partners_id_seq OWNER TO admin;

--
-- Name: home_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_partners_id_seq OWNED BY admin.home_partners.id;


--
-- Name: home_tourcategory; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_tourcategory (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE admin.home_tourcategory OWNER TO admin;

--
-- Name: home_tourcategory_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_tourcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_tourcategory_id_seq OWNER TO admin;

--
-- Name: home_tourcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_tourcategory_id_seq OWNED BY admin.home_tourcategory.id;


--
-- Name: home_valores; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.home_valores (
    id bigint NOT NULL,
    sort_order integer,
    label character varying(50) NOT NULL,
    img_id bigint NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.home_valores OWNER TO admin;

--
-- Name: home_valores_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.home_valores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.home_valores_id_seq OWNER TO admin;

--
-- Name: home_valores_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.home_valores_id_seq OWNED BY admin.home_valores.id;


--
-- Name: paquete_dias; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.paquete_dias (
    id bigint NOT NULL,
    sort_order integer,
    item text,
    page_id integer NOT NULL,
    titulo character varying(100)
);


ALTER TABLE admin.paquete_dias OWNER TO admin;

--
-- Name: paquete_dias_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.paquete_dias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.paquete_dias_id_seq OWNER TO admin;

--
-- Name: paquete_dias_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.paquete_dias_id_seq OWNED BY admin.paquete_dias.id;


--
-- Name: paquete_excluidoitempaquete; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.paquete_excluidoitempaquete (
    id bigint NOT NULL,
    sort_order integer,
    item character varying(80),
    page_id integer NOT NULL
);


ALTER TABLE admin.paquete_excluidoitempaquete OWNER TO admin;

--
-- Name: paquete_excluidoitempaquete_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.paquete_excluidoitempaquete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.paquete_excluidoitempaquete_id_seq OWNER TO admin;

--
-- Name: paquete_excluidoitempaquete_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.paquete_excluidoitempaquete_id_seq OWNED BY admin.paquete_excluidoitempaquete.id;


--
-- Name: paquete_gallerycarousel; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.paquete_gallerycarousel (
    id bigint NOT NULL,
    sort_order integer,
    caption character varying(250),
    image_id bigint,
    page_id integer NOT NULL
);


ALTER TABLE admin.paquete_gallerycarousel OWNER TO admin;

--
-- Name: paquete_gallerycarousel_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.paquete_gallerycarousel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.paquete_gallerycarousel_id_seq OWNER TO admin;

--
-- Name: paquete_gallerycarousel_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.paquete_gallerycarousel_id_seq OWNED BY admin.paquete_gallerycarousel.id;


--
-- Name: paquete_incluidoitempaquete; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.paquete_incluidoitempaquete (
    id bigint NOT NULL,
    sort_order integer,
    item character varying(80),
    page_id integer NOT NULL
);


ALTER TABLE admin.paquete_incluidoitempaquete OWNER TO admin;

--
-- Name: paquete_incluidoitempaquete_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.paquete_incluidoitempaquete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.paquete_incluidoitempaquete_id_seq OWNER TO admin;

--
-- Name: paquete_incluidoitempaquete_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.paquete_incluidoitempaquete_id_seq OWNED BY admin.paquete_incluidoitempaquete.id;


--
-- Name: paquete_paquete; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.paquete_paquete (
    page_ptr_id integer NOT NULL,
    precio numeric(6,2),
    duracion character varying(12),
    linkword character varying(100),
    linkpdf character varying(100),
    linkflyer character varying(100),
    background_id bigint,
    featuredimage_id bigint
);


ALTER TABLE admin.paquete_paquete OWNER TO admin;

--
-- Name: simple_translation_simpletranslation; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.simple_translation_simpletranslation (
    id integer NOT NULL
);


ALTER TABLE admin.simple_translation_simpletranslation OWNER TO admin;

--
-- Name: simple_translation_simpletranslation_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.simple_translation_simpletranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.simple_translation_simpletranslation_id_seq OWNER TO admin;

--
-- Name: simple_translation_simpletranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.simple_translation_simpletranslation_id_seq OWNED BY admin.simple_translation_simpletranslation.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE admin.taggit_tag OWNER TO admin;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.taggit_tag_id_seq OWNER TO admin;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.taggit_tag_id_seq OWNED BY admin.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE admin.taggit_taggeditem OWNER TO admin;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.taggit_taggeditem_id_seq OWNER TO admin;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.taggit_taggeditem_id_seq OWNED BY admin.taggit_taggeditem.id;


--
-- Name: tour_excluidoitempaquete; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.tour_excluidoitempaquete (
    id bigint NOT NULL,
    sort_order integer,
    item character varying(80) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.tour_excluidoitempaquete OWNER TO admin;

--
-- Name: tour_excluidoitempaquete_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.tour_excluidoitempaquete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.tour_excluidoitempaquete_id_seq OWNER TO admin;

--
-- Name: tour_excluidoitempaquete_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.tour_excluidoitempaquete_id_seq OWNED BY admin.tour_excluidoitempaquete.id;


--
-- Name: tour_gallerycarousel; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.tour_gallerycarousel (
    id bigint NOT NULL,
    sort_order integer,
    caption character varying(250) NOT NULL,
    image_id bigint NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.tour_gallerycarousel OWNER TO admin;

--
-- Name: tour_gallerycarousel_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.tour_gallerycarousel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.tour_gallerycarousel_id_seq OWNER TO admin;

--
-- Name: tour_gallerycarousel_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.tour_gallerycarousel_id_seq OWNED BY admin.tour_gallerycarousel.id;


--
-- Name: tour_incluidoitempaquete; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.tour_incluidoitempaquete (
    id bigint NOT NULL,
    sort_order integer,
    item character varying(80) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.tour_incluidoitempaquete OWNER TO admin;

--
-- Name: tour_incluidoitempaquete_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.tour_incluidoitempaquete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.tour_incluidoitempaquete_id_seq OWNER TO admin;

--
-- Name: tour_incluidoitempaquete_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.tour_incluidoitempaquete_id_seq OWNED BY admin.tour_incluidoitempaquete.id;


--
-- Name: tour_tour; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.tour_tour (
    page_ptr_id integer NOT NULL,
    precio numeric(6,2),
    linkword character varying(100),
    linkpdf character varying(100),
    linkflyer character varying(100),
    itinerario text,
    background_id bigint,
    featuredimage_id bigint,
    tourdestino_id bigint
);


ALTER TABLE admin.tour_tour OWNER TO admin;

--
-- Name: tour_tour_categories; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.tour_tour_categories (
    id bigint NOT NULL,
    tour_id integer NOT NULL,
    tourcategory_id bigint NOT NULL
);


ALTER TABLE admin.tour_tour_categories OWNER TO admin;

--
-- Name: tour_tour_categories_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.tour_tour_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.tour_tour_categories_id_seq OWNER TO admin;

--
-- Name: tour_tour_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.tour_tour_categories_id_seq OWNED BY admin.tour_tour_categories.id;


--
-- Name: wagtailadmin_admin; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailadmin_admin (
    id integer NOT NULL
);


ALTER TABLE admin.wagtailadmin_admin OWNER TO admin;

--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailadmin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailadmin_admin_id_seq OWNER TO admin;

--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailadmin_admin_id_seq OWNED BY admin.wagtailadmin_admin.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth bigint NOT NULL,
    numchild bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE admin.wagtailcore_collection OWNER TO admin;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_collection_id_seq OWNER TO admin;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_collection_id_seq OWNED BY admin.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_collectionviewrestriction OWNER TO admin;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_collectionviewrestriction_groups (
    id bigint NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_collectionviewrestriction_groups OWNER TO admin;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO admin;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY admin.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_collectionviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_collectionviewrestriction_id_seq OWNER TO admin;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_collectionviewrestriction_id_seq OWNED BY admin.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_comment; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_comment (
    id integer NOT NULL,
    text text NOT NULL,
    contentpath text NOT NULL,
    "position" text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    resolved_at timestamp with time zone,
    page_id integer NOT NULL,
    resolved_by_id integer,
    revision_created_id integer,
    user_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_comment OWNER TO admin;

--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_comment_id_seq OWNER TO admin;

--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_comment_id_seq OWNED BY admin.wagtailcore_comment.id;


--
-- Name: wagtailcore_commentreply; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_commentreply (
    id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_commentreply OWNER TO admin;

--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_commentreply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_commentreply_id_seq OWNER TO admin;

--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_commentreply_id_seq OWNED BY admin.wagtailcore_commentreply.id;


--
-- Name: wagtailcore_groupapprovaltask; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_groupapprovaltask (
    task_ptr_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_groupapprovaltask OWNER TO admin;

--
-- Name: wagtailcore_groupapprovaltask_groups; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_groupapprovaltask_groups (
    id bigint NOT NULL,
    groupapprovaltask_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_groupapprovaltask_groups OWNER TO admin;

--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_groupapprovaltask_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_groupapprovaltask_groups_id_seq OWNER TO admin;

--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_groupapprovaltask_groups_id_seq OWNED BY admin.wagtailcore_groupapprovaltask_groups.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_groupcollectionpermission OWNER TO admin;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_groupcollectionpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_groupcollectionpermission_id_seq OWNER TO admin;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_groupcollectionpermission_id_seq OWNED BY admin.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_grouppagepermission OWNER TO admin;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_grouppagepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_grouppagepermission_id_seq OWNER TO admin;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_grouppagepermission_id_seq OWNED BY admin.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_locale; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_locale (
    id integer NOT NULL,
    language_code character varying(100) NOT NULL
);


ALTER TABLE admin.wagtailcore_locale OWNER TO admin;

--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_locale_id_seq OWNER TO admin;

--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_locale_id_seq OWNED BY admin.wagtailcore_locale.id;


--
-- Name: wagtailcore_modellogentry; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_modellogentry (
    id integer NOT NULL,
    label text NOT NULL,
    action character varying(255) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    content_changed boolean NOT NULL,
    deleted boolean NOT NULL,
    object_id character varying(255) NOT NULL,
    content_type_id integer,
    user_id integer,
    uuid character(32),
    revision_id integer
);


ALTER TABLE admin.wagtailcore_modellogentry OWNER TO admin;

--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_modellogentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_modellogentry_id_seq OWNER TO admin;

--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_modellogentry_id_seq OWNED BY admin.wagtailcore_modellogentry.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth bigint NOT NULL,
    numchild bigint NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    locked_at timestamp with time zone,
    locked_by_id integer,
    translation_key character(32) NOT NULL,
    locale_id integer NOT NULL,
    alias_of_id integer,
    latest_revision_id integer
);


ALTER TABLE admin.wagtailcore_page OWNER TO admin;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_page_id_seq OWNER TO admin;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_page_id_seq OWNED BY admin.wagtailcore_page.id;


--
-- Name: wagtailcore_pagelogentry; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_pagelogentry (
    id integer NOT NULL,
    label text NOT NULL,
    action character varying(255) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    content_changed boolean NOT NULL,
    deleted boolean NOT NULL,
    content_type_id integer,
    page_id integer NOT NULL,
    revision_id integer,
    user_id integer,
    uuid character(32)
);


ALTER TABLE admin.wagtailcore_pagelogentry OWNER TO admin;

--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_pagelogentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_pagelogentry_id_seq OWNER TO admin;

--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_pagelogentry_id_seq OWNED BY admin.wagtailcore_pagelogentry.id;


--
-- Name: wagtailcore_pagesubscription; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_pagesubscription (
    id integer NOT NULL,
    comment_notifications boolean NOT NULL,
    page_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_pagesubscription OWNER TO admin;

--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_pagesubscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_pagesubscription_id_seq OWNER TO admin;

--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_pagesubscription_id_seq OWNED BY admin.wagtailcore_pagesubscription.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE admin.wagtailcore_pageviewrestriction OWNER TO admin;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_pageviewrestriction_groups (
    id bigint NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_pageviewrestriction_groups OWNER TO admin;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO admin;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY admin.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_pageviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_pageviewrestriction_id_seq OWNER TO admin;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_pageviewrestriction_id_seq OWNED BY admin.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_referenceindex; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_referenceindex (
    id integer NOT NULL,
    object_id character varying(255) NOT NULL,
    to_object_id character varying(255) NOT NULL,
    model_path text NOT NULL,
    content_path text NOT NULL,
    content_path_hash character(32) NOT NULL,
    base_content_type_id integer NOT NULL,
    content_type_id integer NOT NULL,
    to_content_type_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_referenceindex OWNER TO admin;

--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_referenceindex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_referenceindex_id_seq OWNER TO admin;

--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_referenceindex_id_seq OWNED BY admin.wagtailcore_referenceindex.id;


--
-- Name: wagtailcore_revision; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_revision (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content text NOT NULL,
    approved_go_live_at timestamp with time zone,
    object_id character varying(255) NOT NULL,
    user_id integer,
    content_type_id integer NOT NULL,
    base_content_type_id integer NOT NULL,
    object_str text NOT NULL
);


ALTER TABLE admin.wagtailcore_revision OWNER TO admin;

--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_revision_id_seq OWNER TO admin;

--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_revision_id_seq OWNED BY admin.wagtailcore_revision.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255) NOT NULL
);


ALTER TABLE admin.wagtailcore_site OWNER TO admin;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_site_id_seq OWNER TO admin;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_site_id_seq OWNED BY admin.wagtailcore_site.id;


--
-- Name: wagtailcore_task; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_task (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    active boolean NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_task OWNER TO admin;

--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_task_id_seq OWNER TO admin;

--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_task_id_seq OWNED BY admin.wagtailcore_task.id;


--
-- Name: wagtailcore_taskstate; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_taskstate (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    started_at timestamp with time zone NOT NULL,
    finished_at timestamp with time zone,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL,
    task_id integer NOT NULL,
    workflow_state_id integer NOT NULL,
    finished_by_id integer,
    comment text NOT NULL
);


ALTER TABLE admin.wagtailcore_taskstate OWNER TO admin;

--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_taskstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_taskstate_id_seq OWNER TO admin;

--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_taskstate_id_seq OWNED BY admin.wagtailcore_taskstate.id;


--
-- Name: wagtailcore_uploadedfile; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_uploadedfile (
    id integer NOT NULL,
    file character varying(200) NOT NULL,
    for_content_type_id integer,
    uploaded_by_user_id integer
);


ALTER TABLE admin.wagtailcore_uploadedfile OWNER TO admin;

--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_uploadedfile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_uploadedfile_id_seq OWNER TO admin;

--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_uploadedfile_id_seq OWNED BY admin.wagtailcore_uploadedfile.id;


--
-- Name: wagtailcore_workflow; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_workflow (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE admin.wagtailcore_workflow OWNER TO admin;

--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_workflow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_workflow_id_seq OWNER TO admin;

--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_workflow_id_seq OWNED BY admin.wagtailcore_workflow.id;


--
-- Name: wagtailcore_workflowcontenttype; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_workflowcontenttype (
    content_type_id integer NOT NULL,
    workflow_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_workflowcontenttype OWNER TO admin;

--
-- Name: wagtailcore_workflowpage; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_workflowpage (
    page_id integer NOT NULL,
    workflow_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_workflowpage OWNER TO admin;

--
-- Name: wagtailcore_workflowstate; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_workflowstate (
    id integer NOT NULL,
    status character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    current_task_state_id integer,
    object_id character varying(255) NOT NULL,
    requested_by_id integer,
    workflow_id integer NOT NULL,
    content_type_id integer NOT NULL,
    base_content_type_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_workflowstate OWNER TO admin;

--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_workflowstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_workflowstate_id_seq OWNER TO admin;

--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_workflowstate_id_seq OWNED BY admin.wagtailcore_workflowstate.id;


--
-- Name: wagtailcore_workflowtask; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailcore_workflowtask (
    id integer NOT NULL,
    sort_order integer,
    task_id integer NOT NULL,
    workflow_id integer NOT NULL
);


ALTER TABLE admin.wagtailcore_workflowtask OWNER TO admin;

--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailcore_workflowtask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailcore_workflowtask_id_seq OWNER TO admin;

--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailcore_workflowtask_id_seq OWNED BY admin.wagtailcore_workflowtask.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size bigint,
    file_hash character varying(40) NOT NULL
);


ALTER TABLE admin.wagtaildocs_document OWNER TO admin;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtaildocs_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtaildocs_document_id_seq OWNER TO admin;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtaildocs_document_id_seq OWNED BY admin.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailembeds_embed (
    id integer NOT NULL,
    url text NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url text NOT NULL,
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL,
    hash character varying(32) NOT NULL,
    cache_until timestamp with time zone
);


ALTER TABLE admin.wagtailembeds_embed OWNER TO admin;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailembeds_embed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailembeds_embed_id_seq OWNER TO admin;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailembeds_embed_id_seq OWNED BY admin.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE admin.wagtailforms_formsubmission OWNER TO admin;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailforms_formsubmission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailforms_formsubmission_id_seq OWNER TO admin;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailforms_formsubmission_id_seq OWNED BY admin.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x bigint,
    focal_point_y bigint,
    focal_point_width bigint,
    focal_point_height bigint,
    uploaded_by_user_id integer,
    file_size bigint,
    collection_id integer NOT NULL,
    file_hash character varying(40) NOT NULL
);


ALTER TABLE admin.wagtailimages_image OWNER TO admin;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailimages_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailimages_image_id_seq OWNER TO admin;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailimages_image_id_seq OWNED BY admin.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    filter_spec character varying(255) NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE admin.wagtailimages_rendition OWNER TO admin;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailimages_rendition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailimages_rendition_id_seq OWNER TO admin;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailimages_rendition_id_seq OWNED BY admin.wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer,
    automatically_created boolean NOT NULL,
    created_at timestamp with time zone,
    redirect_page_route_path character varying(255) NOT NULL
);


ALTER TABLE admin.wagtailredirects_redirect OWNER TO admin;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailredirects_redirect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailredirects_redirect_id_seq OWNER TO admin;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailredirects_redirect_id_seq OWNED BY admin.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_indexentry; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailsearch_indexentry (
    id integer NOT NULL,
    object_id character varying(50) NOT NULL,
    title_norm double precision NOT NULL,
    content_type_id integer NOT NULL,
    autocomplete text,
    body text,
    title text NOT NULL
);


ALTER TABLE admin.wagtailsearch_indexentry OWNER TO admin;

--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailsearch_indexentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailsearch_indexentry_id_seq OWNER TO admin;

--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailsearch_indexentry_id_seq OWNED BY admin.wagtailsearch_indexentry.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL,
    updated_comments_notifications boolean NOT NULL,
    dismissibles text NOT NULL,
    theme character varying(40) NOT NULL,
    density character varying(40) NOT NULL
);


ALTER TABLE admin.wagtailusers_userprofile OWNER TO admin;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.wagtailusers_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE admin.wagtailusers_userprofile_id_seq OWNER TO admin;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: admin; Owner: admin
--

ALTER SEQUENCE admin.wagtailusers_userprofile_id_seq OWNED BY admin.wagtailusers_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group ALTER COLUMN id SET DEFAULT nextval('admin.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('admin.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_permission ALTER COLUMN id SET DEFAULT nextval('admin.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user ALTER COLUMN id SET DEFAULT nextval('admin.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('admin.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('admin.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_admin_log ALTER COLUMN id SET DEFAULT nextval('admin.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_content_type ALTER COLUMN id SET DEFAULT nextval('admin.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_migrations ALTER COLUMN id SET DEFAULT nextval('admin.django_migrations_id_seq'::regclass);


--
-- Name: home_certificados id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_certificados ALTER COLUMN id SET DEFAULT nextval('admin.home_certificados_id_seq'::regclass);


--
-- Name: home_cloudinaryimage id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryimage ALTER COLUMN id SET DEFAULT nextval('admin.home_cloudinaryimage_id_seq'::regclass);


--
-- Name: home_cloudinaryrendition id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryrendition ALTER COLUMN id SET DEFAULT nextval('admin.home_cloudinaryrendition_id_seq'::regclass);


--
-- Name: home_destino id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_destino ALTER COLUMN id SET DEFAULT nextval('admin.home_destino_id_seq'::regclass);


--
-- Name: home_estadisticas id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_estadisticas ALTER COLUMN id SET DEFAULT nextval('admin.home_estadisticas_id_seq'::regclass);


--
-- Name: home_faq id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_faq ALTER COLUMN id SET DEFAULT nextval('admin.home_faq_id_seq'::regclass);


--
-- Name: home_informacion id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_informacion ALTER COLUMN id SET DEFAULT nextval('admin.home_informacion_id_seq'::regclass);


--
-- Name: home_partners id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_partners ALTER COLUMN id SET DEFAULT nextval('admin.home_partners_id_seq'::regclass);


--
-- Name: home_tourcategory id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_tourcategory ALTER COLUMN id SET DEFAULT nextval('admin.home_tourcategory_id_seq'::regclass);


--
-- Name: home_valores id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_valores ALTER COLUMN id SET DEFAULT nextval('admin.home_valores_id_seq'::regclass);


--
-- Name: paquete_dias id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_dias ALTER COLUMN id SET DEFAULT nextval('admin.paquete_dias_id_seq'::regclass);


--
-- Name: paquete_excluidoitempaquete id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_excluidoitempaquete ALTER COLUMN id SET DEFAULT nextval('admin.paquete_excluidoitempaquete_id_seq'::regclass);


--
-- Name: paquete_gallerycarousel id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_gallerycarousel ALTER COLUMN id SET DEFAULT nextval('admin.paquete_gallerycarousel_id_seq'::regclass);


--
-- Name: paquete_incluidoitempaquete id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_incluidoitempaquete ALTER COLUMN id SET DEFAULT nextval('admin.paquete_incluidoitempaquete_id_seq'::regclass);


--
-- Name: simple_translation_simpletranslation id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.simple_translation_simpletranslation ALTER COLUMN id SET DEFAULT nextval('admin.simple_translation_simpletranslation_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_tag ALTER COLUMN id SET DEFAULT nextval('admin.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('admin.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tour_excluidoitempaquete id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_excluidoitempaquete ALTER COLUMN id SET DEFAULT nextval('admin.tour_excluidoitempaquete_id_seq'::regclass);


--
-- Name: tour_gallerycarousel id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_gallerycarousel ALTER COLUMN id SET DEFAULT nextval('admin.tour_gallerycarousel_id_seq'::regclass);


--
-- Name: tour_incluidoitempaquete id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_incluidoitempaquete ALTER COLUMN id SET DEFAULT nextval('admin.tour_incluidoitempaquete_id_seq'::regclass);


--
-- Name: tour_tour_categories id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour_categories ALTER COLUMN id SET DEFAULT nextval('admin.tour_tour_categories_id_seq'::regclass);


--
-- Name: wagtailadmin_admin id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailadmin_admin ALTER COLUMN id SET DEFAULT nextval('admin.wagtailadmin_admin_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_comment id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_comment_id_seq'::regclass);


--
-- Name: wagtailcore_commentreply id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_commentreply ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_commentreply_id_seq'::regclass);


--
-- Name: wagtailcore_groupapprovaltask_groups id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask_groups ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_groupapprovaltask_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_locale id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_locale ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_locale_id_seq'::regclass);


--
-- Name: wagtailcore_modellogentry id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_modellogentry ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_modellogentry_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagelogentry id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagelogentry ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_pagelogentry_id_seq'::regclass);


--
-- Name: wagtailcore_pagesubscription id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagesubscription ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_pagesubscription_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_referenceindex id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_referenceindex ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_referenceindex_id_seq'::regclass);


--
-- Name: wagtailcore_revision id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_revision ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_revision_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtailcore_task id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_task ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_task_id_seq'::regclass);


--
-- Name: wagtailcore_taskstate id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_taskstate_id_seq'::regclass);


--
-- Name: wagtailcore_uploadedfile id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_uploadedfile ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_uploadedfile_id_seq'::regclass);


--
-- Name: wagtailcore_workflow id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflow ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_workflow_id_seq'::regclass);


--
-- Name: wagtailcore_workflowstate id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_workflowstate_id_seq'::regclass);


--
-- Name: wagtailcore_workflowtask id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowtask ALTER COLUMN id SET DEFAULT nextval('admin.wagtailcore_workflowtask_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('admin.wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('admin.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('admin.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('admin.wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('admin.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('admin.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_indexentry id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailsearch_indexentry ALTER COLUMN id SET DEFAULT nextval('admin.wagtailsearch_indexentry_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('admin.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_group (id, name) FROM stdin;
2	Editors
1	Moderators
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_group_permissions (id, group_id, permission_id) FROM stdin;
2	1	101
7	1	102
8	1	103
6	1	104
10	1	105
14	1	106
15	1	107
16	1	108
18	1	109
1	2	101
4	2	102
5	2	103
3	2	104
9	2	105
11	2	106
12	2	107
13	2	108
17	2	109
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add locale	3	add_locale
2	Can change locale	3	change_locale
3	Can delete locale	3	delete_locale
4	Can view locale	3	view_locale
5	Can add site	4	add_site
6	Can change site	4	change_site
7	Can delete site	4	delete_site
8	Can view site	4	view_site
9	Can add model log entry	5	add_modellogentry
10	Can change model log entry	5	change_modellogentry
11	Can delete model log entry	5	delete_modellogentry
12	Can view model log entry	5	view_modellogentry
13	Can add collection view restriction	6	add_collectionviewrestriction
14	Can change collection view restriction	6	change_collectionviewrestriction
15	Can delete collection view restriction	6	delete_collectionviewrestriction
16	Can view collection view restriction	6	view_collectionviewrestriction
17	Can add collection	7	add_collection
18	Can change collection	7	change_collection
19	Can delete collection	7	delete_collection
20	Can view collection	7	view_collection
21	Can add group collection permission	8	add_groupcollectionpermission
22	Can change group collection permission	8	change_groupcollectionpermission
23	Can delete group collection permission	8	delete_groupcollectionpermission
24	Can view group collection permission	8	view_groupcollectionpermission
25	Can add uploaded file	9	add_uploadedfile
26	Can change uploaded file	9	change_uploadedfile
27	Can delete uploaded file	9	delete_uploadedfile
28	Can view uploaded file	9	view_uploadedfile
29	Can add reference index	10	add_referenceindex
30	Can change reference index	10	change_referenceindex
31	Can delete reference index	10	delete_referenceindex
32	Can view reference index	10	view_referenceindex
33	Can add page	1	add_page
34	Can change page	1	change_page
35	Can delete page	1	delete_page
36	Can view page	1	view_page
37	Delete pages with children	1	bulk_delete_page
38	Lock/unlock pages you've locked	1	lock_page
39	Publish any page	1	publish_page
40	Unlock any page	1	unlock_page
41	Can add revision	11	add_revision
42	Can change revision	11	change_revision
43	Can delete revision	11	delete_revision
44	Can view revision	11	view_revision
45	Can add group page permission	12	add_grouppagepermission
46	Can change group page permission	12	change_grouppagepermission
47	Can delete group page permission	12	delete_grouppagepermission
48	Can view group page permission	12	view_grouppagepermission
49	Can add page view restriction	13	add_pageviewrestriction
50	Can change page view restriction	13	change_pageviewrestriction
51	Can delete page view restriction	13	delete_pageviewrestriction
52	Can view page view restriction	13	view_pageviewrestriction
53	Can add workflow page	14	add_workflowpage
54	Can change workflow page	14	change_workflowpage
55	Can delete workflow page	14	delete_workflowpage
56	Can view workflow page	14	view_workflowpage
57	Can add workflow content type	15	add_workflowcontenttype
58	Can change workflow content type	15	change_workflowcontenttype
59	Can delete workflow content type	15	delete_workflowcontenttype
60	Can view workflow content type	15	view_workflowcontenttype
61	Can add workflow task order	16	add_workflowtask
62	Can change workflow task order	16	change_workflowtask
63	Can delete workflow task order	16	delete_workflowtask
64	Can view workflow task order	16	view_workflowtask
65	Can add task	17	add_task
66	Can change task	17	change_task
67	Can delete task	17	delete_task
68	Can view task	17	view_task
69	Can add workflow	18	add_workflow
70	Can change workflow	18	change_workflow
71	Can delete workflow	18	delete_workflow
72	Can view workflow	18	view_workflow
73	Can add Group approval task	2	add_groupapprovaltask
74	Can change Group approval task	2	change_groupapprovaltask
75	Can delete Group approval task	2	delete_groupapprovaltask
76	Can view Group approval task	2	view_groupapprovaltask
77	Can add Workflow state	19	add_workflowstate
78	Can change Workflow state	19	change_workflowstate
79	Can delete Workflow state	19	delete_workflowstate
80	Can view Workflow state	19	view_workflowstate
81	Can add Task state	20	add_taskstate
82	Can change Task state	20	change_taskstate
83	Can delete Task state	20	delete_taskstate
84	Can view Task state	20	view_taskstate
85	Can add page log entry	21	add_pagelogentry
86	Can change page log entry	21	change_pagelogentry
87	Can delete page log entry	21	delete_pagelogentry
88	Can view page log entry	21	view_pagelogentry
89	Can add comment	22	add_comment
90	Can change comment	22	change_comment
91	Can delete comment	22	delete_comment
92	Can view comment	22	view_comment
93	Can add comment reply	23	add_commentreply
94	Can change comment reply	23	change_commentreply
95	Can delete comment reply	23	delete_commentreply
96	Can view comment reply	23	view_commentreply
97	Can add page subscription	24	add_pagesubscription
98	Can change page subscription	24	change_pagesubscription
99	Can delete page subscription	24	delete_pagesubscription
100	Can view page subscription	24	view_pagesubscription
101	Can access Wagtail admin	25	access_admin
102	Can add document	26	add_document
103	Can change document	26	change_document
104	Can delete document	26	delete_document
105	Can choose document	26	choose_document
106	Can add image	27	add_image
107	Can change image	27	change_image
108	Can delete image	27	delete_image
109	Can choose image	27	choose_image
110	Can add home	28	add_home
111	Can change home	28	change_home
112	Can delete home	28	delete_home
113	Can view home	28	view_home
114	Can add informacion	29	add_informacion
115	Can change informacion	29	change_informacion
116	Can delete informacion	29	delete_informacion
117	Can view informacion	29	view_informacion
118	Can add inicio	30	add_inicio
119	Can change inicio	30	change_inicio
120	Can delete inicio	30	delete_inicio
121	Can view inicio	30	view_inicio
122	Can add Tour Category	31	add_tourcategory
123	Can change Tour Category	31	change_tourcategory
124	Can delete Tour Category	31	delete_tourcategory
125	Can view Tour Category	31	view_tourcategory
126	Can add cloudinary image	32	add_cloudinaryimage
127	Can change cloudinary image	32	change_cloudinaryimage
128	Can delete cloudinary image	32	delete_cloudinaryimage
129	Can view cloudinary image	32	view_cloudinaryimage
130	Can add destino	33	add_destino
131	Can change destino	33	change_destino
132	Can delete destino	33	delete_destino
133	Can view destino	33	view_destino
134	Can add gallery carousel	34	add_gallerycarousel
135	Can change gallery carousel	34	change_gallerycarousel
136	Can delete gallery carousel	34	delete_gallerycarousel
137	Can view gallery carousel	34	view_gallerycarousel
138	Can add faq	35	add_faq
139	Can change faq	35	change_faq
140	Can delete faq	35	delete_faq
141	Can view faq	35	view_faq
142	Can add nosotros	36	add_nosotros
143	Can change nosotros	36	change_nosotros
144	Can delete nosotros	36	delete_nosotros
145	Can view nosotros	36	view_nosotros
146	Can add estadisticas	37	add_estadisticas
147	Can change estadisticas	37	change_estadisticas
148	Can delete estadisticas	37	delete_estadisticas
149	Can view estadisticas	37	view_estadisticas
150	Can add certificados	38	add_certificados
151	Can change certificados	38	change_certificados
152	Can delete certificados	38	delete_certificados
153	Can view certificados	38	view_certificados
154	Can add partners	39	add_partners
155	Can change partners	39	change_partners
156	Can delete partners	39	delete_partners
157	Can view partners	39	view_partners
158	Can add valores	40	add_valores
159	Can change valores	40	change_valores
160	Can delete valores	40	delete_valores
161	Can view valores	40	view_valores
162	Can add cloudinary rendition	41	add_cloudinaryrendition
163	Can change cloudinary rendition	41	change_cloudinaryrendition
164	Can delete cloudinary rendition	41	delete_cloudinaryrendition
165	Can view cloudinary rendition	41	view_cloudinaryrendition
166	Can add paquete	42	add_paquete
167	Can change paquete	42	change_paquete
168	Can delete paquete	42	delete_paquete
169	Can view paquete	42	view_paquete
170	Can add incluido item paquete	43	add_incluidoitempaquete
171	Can change incluido item paquete	43	change_incluidoitempaquete
172	Can delete incluido item paquete	43	delete_incluidoitempaquete
173	Can view incluido item paquete	43	view_incluidoitempaquete
174	Can add gallery carousel	44	add_gallerycarousel
175	Can change gallery carousel	44	change_gallerycarousel
176	Can delete gallery carousel	44	delete_gallerycarousel
177	Can view gallery carousel	44	view_gallerycarousel
178	Can add excluido item paquete	45	add_excluidoitempaquete
179	Can change excluido item paquete	45	change_excluidoitempaquete
180	Can delete excluido item paquete	45	delete_excluidoitempaquete
181	Can view excluido item paquete	45	view_excluidoitempaquete
182	Can add dias	46	add_dias
183	Can change dias	46	change_dias
184	Can delete dias	46	delete_dias
185	Can view dias	46	view_dias
186	Can add tour	47	add_tour
187	Can change tour	47	change_tour
188	Can delete tour	47	delete_tour
189	Can view tour	47	view_tour
190	Can add incluido item paquete	48	add_incluidoitempaquete
191	Can change incluido item paquete	48	change_incluidoitempaquete
192	Can delete incluido item paquete	48	delete_incluidoitempaquete
193	Can view incluido item paquete	48	view_incluidoitempaquete
194	Can add gallery carousel	49	add_gallerycarousel
195	Can change gallery carousel	49	change_gallerycarousel
196	Can delete gallery carousel	49	delete_gallerycarousel
197	Can view gallery carousel	49	view_gallerycarousel
198	Can add excluido item paquete	50	add_excluidoitempaquete
199	Can change excluido item paquete	50	change_excluidoitempaquete
200	Can delete excluido item paquete	50	delete_excluidoitempaquete
201	Can view excluido item paquete	50	view_excluidoitempaquete
202	Can add log entry	51	add_logentry
203	Can change log entry	51	change_logentry
204	Can delete log entry	51	delete_logentry
205	Can view log entry	51	view_logentry
206	Can add permission	52	add_permission
207	Can change permission	52	change_permission
208	Can delete permission	52	delete_permission
209	Can view permission	52	view_permission
210	Can add group	53	add_group
211	Can change group	53	change_group
212	Can delete group	53	delete_group
213	Can view group	53	view_group
214	Can add user	54	add_user
215	Can change user	54	change_user
216	Can delete user	54	delete_user
217	Can view user	54	view_user
218	Can add content type	55	add_contenttype
219	Can change content type	55	change_contenttype
220	Can delete content type	55	delete_contenttype
221	Can view content type	55	view_contenttype
222	Can add session	56	add_session
223	Can change session	56	change_session
224	Can delete session	56	delete_session
225	Can view session	56	view_session
226	Can add form submission	57	add_formsubmission
227	Can change form submission	57	change_formsubmission
228	Can delete form submission	57	delete_formsubmission
229	Can view form submission	57	view_formsubmission
230	Can add redirect	58	add_redirect
231	Can change redirect	58	change_redirect
232	Can delete redirect	58	delete_redirect
233	Can view redirect	58	view_redirect
234	Can submit translations	59	submit_translation
235	Can add embed	60	add_embed
236	Can change embed	60	change_embed
237	Can delete embed	60	delete_embed
238	Can view embed	60	view_embed
239	Can add user profile	61	add_userprofile
240	Can change user profile	61	change_userprofile
241	Can delete user profile	61	delete_userprofile
242	Can view user profile	61	view_userprofile
243	Can view document	26	view_document
244	Can view image	27	view_image
245	Can add rendition	62	add_rendition
246	Can change rendition	62	change_rendition
247	Can delete rendition	62	delete_rendition
248	Can view rendition	62	view_rendition
249	Can add index entry	63	add_indexentry
250	Can change index entry	63	change_indexentry
251	Can delete index entry	63	delete_indexentry
252	Can view index entry	63	view_indexentry
253	Can add tag	64	add_tag
254	Can change tag	64	change_tag
255	Can delete tag	64	delete_tag
256	Can view tag	64	view_tag
257	Can add tagged item	65	add_taggeditem
258	Can change tagged item	65	change_taggeditem
259	Can delete tagged item	65	delete_taggeditem
260	Can view tagged item	65	view_taggeditem
261	Can add global	66	add_global
262	Can change global	66	change_global
263	Can delete global	66	delete_global
264	Can view global	66	view_global
265	Can add contacto	67	add_contacto
266	Can change contacto	67	change_contacto
267	Can delete contacto	67	delete_contacto
268	Can view contacto	67	view_contacto
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$720000$PyuflhSFRkh4Be63KeGbY2$/QRjpANEc8IrQpSXDILF7KMNOvI+LJ5Kwu22Za/lbA0=	2024-07-29 21:17:52.530932+00	t	admin			job@gmail.com	t	t	2024-07-04 15:31:46.490579+00
2	pbkdf2_sha256$720000$5VMCtvlfiwE3t6ZfEjcOD9$85MSp2/opLlqdkSBgzIgVWwdM6VxBCv0udTQ6nY5cAI=	2024-07-23 16:26:49.28849+00	f	David	David	Rondan	job@gmail.com	f	t	2024-07-10 23:44:08.940235+00
3	pbkdf2_sha256$720000$hauOzYAz5siaXUe2Z5SPKg$TVyimE3Q61ZwQjPgT+LDz0ReKRkrl9Uf+VLVz2jtATs=	2024-07-25 21:23:18.659031+00	f	Doris	Doris	Ataulluco Huaman	test@gmail.com	f	t	2024-07-23 19:43:14.627461+00
4	pbkdf2_sha256$720000$VRpbm7zJ2VKZ0YGzBx8vIo$rNvnqXo3/qcRJbbREMCpttrutOnaLwEgUavSNFuE9zk=	2024-07-23 19:48:04.356916+00	f	Israel	Israel	Rondan	test@gmail.com	f	t	2024-07-23 19:46:37.181623+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
5	3	1
2	3	2
3	4	1
4	4	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.django_content_type (id, app_label, model) FROM stdin;
51	admin	logentry
53	auth	group
52	auth	permission
54	auth	user
55	contenttypes	contenttype
38	home	certificados
32	home	cloudinaryimage
41	home	cloudinaryrendition
67	home	contacto
33	home	destino
37	home	estadisticas
35	home	faq
34	home	gallerycarousel
66	home	global
28	home	home
29	home	informacion
30	home	inicio
36	home	nosotros
39	home	partners
31	home	tourcategory
40	home	valores
46	paquete	dias
45	paquete	excluidoitempaquete
44	paquete	gallerycarousel
43	paquete	incluidoitempaquete
42	paquete	paquete
56	sessions	session
59	simple_translation	simpletranslation
64	taggit	tag
65	taggit	taggeditem
50	tour	excluidoitempaquete
49	tour	gallerycarousel
48	tour	incluidoitempaquete
47	tour	tour
25	wagtailadmin	admin
7	wagtailcore	collection
6	wagtailcore	collectionviewrestriction
22	wagtailcore	comment
23	wagtailcore	commentreply
2	wagtailcore	groupapprovaltask
8	wagtailcore	groupcollectionpermission
12	wagtailcore	grouppagepermission
3	wagtailcore	locale
5	wagtailcore	modellogentry
1	wagtailcore	page
21	wagtailcore	pagelogentry
24	wagtailcore	pagesubscription
13	wagtailcore	pageviewrestriction
10	wagtailcore	referenceindex
11	wagtailcore	revision
4	wagtailcore	site
17	wagtailcore	task
20	wagtailcore	taskstate
9	wagtailcore	uploadedfile
18	wagtailcore	workflow
15	wagtailcore	workflowcontenttype
14	wagtailcore	workflowpage
19	wagtailcore	workflowstate
16	wagtailcore	workflowtask
26	wagtaildocs	document
60	wagtailembeds	embed
57	wagtailforms	formsubmission
27	wagtailimages	image
62	wagtailimages	rendition
58	wagtailredirects	redirect
63	wagtailsearch	indexentry
61	wagtailusers	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-07-04 15:25:38.451427+00
2	auth	0001_initial	2024-07-04 15:25:44.720689+00
3	admin	0001_initial	2024-07-04 15:25:45.713739+00
4	admin	0002_logentry_remove_auto_add	2024-07-04 15:25:45.868445+00
5	admin	0003_logentry_add_action_flag_choices	2024-07-04 15:25:46.040558+00
6	contenttypes	0002_remove_content_type_name	2024-07-04 15:25:47.335634+00
7	auth	0002_alter_permission_name_max_length	2024-07-04 15:25:47.653922+00
8	auth	0003_alter_user_email_max_length	2024-07-04 15:25:47.995982+00
9	auth	0004_alter_user_username_opts	2024-07-04 15:25:48.216885+00
10	auth	0005_alter_user_last_login_null	2024-07-04 15:25:50.297765+00
11	auth	0006_require_contenttypes_0002	2024-07-04 15:25:50.440978+00
12	auth	0007_alter_validators_add_error_messages	2024-07-04 15:25:50.723778+00
13	auth	0008_alter_user_username_max_length	2024-07-04 15:25:51.060229+00
14	auth	0009_alter_user_last_name_max_length	2024-07-04 15:25:51.383361+00
15	auth	0010_alter_group_name_max_length	2024-07-04 15:25:51.741984+00
16	auth	0011_update_proxy_permissions	2024-07-04 15:25:52.508272+00
17	auth	0012_alter_user_first_name_max_length	2024-07-04 15:25:52.83445+00
18	wagtailcore	0001_initial	2024-07-04 15:26:14.958068+00
19	wagtailcore	0002_initial_data	2024-07-04 15:26:16.612514+00
20	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2024-07-04 15:26:16.781123+00
21	wagtailcore	0004_page_locked	2024-07-04 15:26:16.949584+00
22	wagtailcore	0005_add_page_lock_permission_to_moderators	2024-07-04 15:26:17.101512+00
23	wagtailcore	0006_add_lock_page_permission	2024-07-04 15:26:17.267052+00
24	wagtailcore	0007_page_latest_revision_created_at	2024-07-04 15:26:17.423342+00
25	wagtailcore	0008_populate_latest_revision_created_at	2024-07-04 15:26:19.440429+00
26	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2024-07-04 15:26:19.672373+00
27	wagtailcore	0010_change_page_owner_to_null_on_delete	2024-07-04 15:26:21.016696+00
28	wagtailcore	0011_page_first_published_at	2024-07-04 15:26:22.922243+00
29	wagtailcore	0012_extend_page_slug_field	2024-07-04 15:26:25.985255+00
30	wagtailcore	0013_update_golive_expire_help_text	2024-07-04 15:26:27.622078+00
31	wagtailcore	0014_add_verbose_name	2024-07-04 15:26:28.170588+00
32	wagtailcore	0015_add_more_verbose_names	2024-07-04 15:26:29.300466+00
33	wagtailcore	0016_change_page_url_path_to_text_field	2024-07-04 15:26:30.737549+00
34	wagtailcore	0017_change_edit_page_permission_description	2024-07-04 15:26:32.859382+00
35	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2024-07-04 15:26:35.609524+00
36	wagtailcore	0019_verbose_names_cleanup	2024-07-04 15:26:35.804913+00
37	wagtailcore	0020_add_index_on_page_first_published_at	2024-07-04 15:26:36.153112+00
38	wagtailcore	0021_capitalizeverbose	2024-07-04 15:26:36.823337+00
39	wagtailcore	0022_add_site_name	2024-07-04 15:26:41.600877+00
40	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2024-07-04 15:26:41.815211+00
41	wagtailcore	0024_collection	2024-07-04 15:26:42.121085+00
42	wagtailcore	0025_collection_initial_data	2024-07-04 15:26:42.940166+00
43	wagtailcore	0026_group_collection_permission	2024-07-04 15:26:46.914091+00
44	wagtailcore	0027_fix_collection_path_collation	2024-07-04 15:26:49.862925+00
45	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2024-07-04 15:26:52.55734+00
46	wagtailcore	0028_merge	2024-07-04 15:26:52.702669+00
47	wagtailcore	0029_unicode_slugfield_dj19	2024-07-04 15:26:52.882939+00
48	wagtailcore	0030_index_on_pagerevision_created_at	2024-07-04 15:26:53.278624+00
49	wagtailcore	0031_add_page_view_restriction_types	2024-07-04 15:26:54.815044+00
50	wagtailcore	0032_add_bulk_delete_page_permission	2024-07-04 15:26:55.011855+00
51	wagtailcore	0033_remove_golive_expiry_help_text	2024-07-04 15:26:55.210939+00
52	wagtailcore	0034_page_live_revision	2024-07-04 15:26:55.71765+00
53	wagtailcore	0035_page_last_published_at	2024-07-04 15:26:56.396992+00
54	wagtailcore	0036_populate_page_last_published_at	2024-07-04 15:26:59.508907+00
55	wagtailcore	0037_set_page_owner_editable	2024-07-04 15:26:59.732524+00
56	wagtailcore	0038_make_first_published_at_editable	2024-07-04 15:26:59.948266+00
57	wagtailcore	0039_collectionviewrestriction	2024-07-04 15:27:01.659174+00
58	wagtailcore	0040_page_draft_title	2024-07-04 15:27:02.826659+00
59	wagtailcore	0041_group_collection_permissions_verbose_name_plural	2024-07-04 15:27:03.025168+00
60	wagtailcore	0042_index_on_pagerevision_approved_go_live_at	2024-07-04 15:27:03.352746+00
61	wagtailcore	0043_lock_fields	2024-07-04 15:27:06.761241+00
62	wagtailcore	0044_add_unlock_grouppagepermission	2024-07-04 15:27:06.936023+00
63	wagtailcore	0045_assign_unlock_grouppagepermission	2024-07-04 15:27:08.152484+00
64	wagtailcore	0046_site_name_remove_null	2024-07-04 15:27:09.043609+00
65	wagtailcore	0047_add_workflow_models	2024-07-04 15:27:16.113111+00
66	wagtailcore	0048_add_default_workflows	2024-07-04 15:27:19.811572+00
67	wagtailcore	0049_taskstate_finished_by	2024-07-04 15:27:20.421868+00
68	wagtailcore	0050_workflow_rejected_to_needs_changes	2024-07-04 15:27:20.667459+00
69	wagtailcore	0051_taskstate_comment	2024-07-04 15:27:21.179942+00
70	wagtailcore	0052_pagelogentry	2024-07-04 15:27:23.429367+00
71	wagtailcore	0053_locale_model	2024-07-04 15:27:23.752078+00
72	wagtailcore	0054_initial_locale	2024-07-04 15:27:24.6806+00
73	wagtailcore	0055_page_locale_fields	2024-07-04 15:27:25.952319+00
74	wagtailcore	0056_page_locale_fields_populate	2024-07-04 15:27:27.347624+00
75	wagtailcore	0057_page_locale_fields_notnull	2024-07-04 15:27:30.236971+00
76	wagtailcore	0058_page_alias_of	2024-07-04 15:27:30.809336+00
77	wagtailcore	0059_apply_collection_ordering	2024-07-04 15:27:32.340842+00
78	wagtailcore	0060_fix_workflow_unique_constraint	2024-07-04 15:27:32.586126+00
79	wagtailcore	0061_change_promote_tab_helpt_text_and_verbose_names	2024-07-04 15:27:32.811063+00
80	wagtailcore	0062_comment_models_and_pagesubscription	2024-07-04 15:27:37.082055+00
81	wagtailcore	0063_modellogentry	2024-07-04 15:27:39.307735+00
82	wagtailcore	0064_log_timestamp_indexes	2024-07-04 15:27:39.872243+00
83	wagtailcore	0065_log_entry_uuid	2024-07-04 15:27:40.456619+00
84	wagtailcore	0066_collection_management_permissions	2024-07-04 15:27:41.665715+00
85	wagtailcore	0067_alter_pagerevision_content_json	2024-07-04 15:27:42.27292+00
86	wagtailcore	0068_log_entry_empty_object	2024-07-04 15:27:43.395998+00
87	wagtailcore	0069_log_entry_jsonfield	2024-07-04 15:27:44.415533+00
88	wagtailcore	0070_rename_pagerevision_revision	2024-07-04 15:27:52.79066+00
89	wagtailcore	0071_populate_revision_content_type	2024-07-04 15:27:53.823178+00
90	wagtailcore	0072_alter_revision_content_type_notnull	2024-07-04 15:28:00.275946+00
91	wagtailcore	0073_page_latest_revision	2024-07-04 15:28:00.849723+00
92	wagtailcore	0074_revision_object_str	2024-07-04 15:28:01.375376+00
93	wagtailcore	0075_populate_latest_revision_and_revision_object_str	2024-07-04 15:28:02.886132+00
94	wagtailcore	0076_modellogentry_revision	2024-07-04 15:28:03.58558+00
95	wagtailcore	0077_alter_revision_user	2024-07-04 15:28:03.829108+00
96	wagtailcore	0078_referenceindex	2024-07-04 15:28:05.357438+00
97	wagtailcore	0079_rename_taskstate_page_revision	2024-07-04 15:28:07.188815+00
98	wagtailcore	0080_generic_workflowstate	2024-07-04 15:28:12.151158+00
99	wagtailcore	0081_populate_workflowstate_content_type	2024-07-04 15:28:13.11605+00
100	wagtailcore	0082_alter_workflowstate_content_type_notnull	2024-07-04 15:28:18.534271+00
101	wagtailcore	0083_workflowcontenttype	2024-07-04 15:28:19.412983+00
102	wagtailcore	0084_add_default_page_permissions	2024-07-04 15:28:19.616222+00
103	wagtailcore	0085_add_grouppagepermission_permission	2024-07-04 15:28:20.383279+00
104	wagtailcore	0086_populate_grouppagepermission_permission	2024-07-04 15:28:26.536461+00
105	wagtailcore	0087_alter_grouppagepermission_unique_together_and_more	2024-07-04 15:28:30.28444+00
106	wagtailcore	0088_fix_log_entry_json_timestamps	2024-07-04 15:28:31.639201+00
107	wagtailcore	0089_log_entry_data_json_null_to_object	2024-07-04 15:28:32.787936+00
108	wagtailcore	0090_remove_grouppagepermission_permission_type	2024-07-04 15:28:36.645841+00
109	wagtailcore	0091_remove_revision_submitted_for_moderation	2024-07-04 15:28:37.114731+00
110	wagtailcore	0092_alter_collectionviewrestriction_password_and_more	2024-07-04 15:28:37.409427+00
111	wagtailcore	0093_uploadedfile	2024-07-04 15:28:38.572726+00
112	taggit	0001_initial	2024-07-04 15:28:40.398009+00
113	taggit	0002_auto_20150616_2121	2024-07-04 15:28:40.872172+00
114	taggit	0003_taggeditem_add_unique_index	2024-07-04 15:28:41.240003+00
115	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2024-07-04 15:28:41.540289+00
116	taggit	0005_auto_20220424_2025	2024-07-04 15:28:41.700997+00
117	taggit	0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx	2024-07-04 15:28:43.249346+00
118	home	0001_initial	2024-07-04 15:28:55.951753+00
119	paquete	0001_initial	2024-07-04 15:29:00.752978+00
120	sessions	0001_initial	2024-07-04 15:29:01.476061+00
121	simple_translation	0001_initial	2024-07-04 15:29:01.897067+00
122	tour	0001_initial	2024-07-04 15:29:09.285795+00
123	wagtailadmin	0001_create_admin_access_permissions	2024-07-04 15:29:11.872735+00
124	wagtailadmin	0002_admin	2024-07-04 15:29:12.019089+00
125	wagtailadmin	0003_admin_managed	2024-07-04 15:29:12.326951+00
126	wagtaildocs	0001_initial	2024-07-04 15:29:13.078802+00
127	wagtaildocs	0002_initial_data	2024-07-04 15:29:16.85639+00
128	wagtaildocs	0003_add_verbose_names	2024-07-04 15:29:17.205515+00
129	wagtaildocs	0004_capitalizeverbose	2024-07-04 15:29:17.816466+00
130	wagtaildocs	0005_document_collection	2024-07-04 15:29:19.138232+00
131	wagtaildocs	0006_copy_document_permissions_to_collections	2024-07-04 15:29:21.468791+00
132	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2024-07-04 15:29:21.754346+00
133	wagtaildocs	0007_merge	2024-07-04 15:29:21.907335+00
134	wagtaildocs	0008_document_file_size	2024-07-04 15:29:22.277879+00
135	wagtaildocs	0009_document_verbose_name_plural	2024-07-04 15:29:22.495888+00
136	wagtaildocs	0010_document_file_hash	2024-07-04 15:29:23.088821+00
137	wagtaildocs	0011_add_choose_permissions	2024-07-04 15:29:26.890078+00
138	wagtaildocs	0012_uploadeddocument	2024-07-04 15:29:27.717156+00
139	wagtaildocs	0013_delete_uploadeddocument	2024-07-04 15:29:28.16696+00
140	wagtailembeds	0001_initial	2024-07-04 15:29:28.836385+00
141	wagtailembeds	0002_add_verbose_names	2024-07-04 15:29:29.000213+00
142	wagtailembeds	0003_capitalizeverbose	2024-07-04 15:29:29.171642+00
143	wagtailembeds	0004_embed_verbose_name_plural	2024-07-04 15:29:29.35097+00
144	wagtailembeds	0005_specify_thumbnail_url_max_length	2024-07-04 15:29:29.748547+00
145	wagtailembeds	0006_add_embed_hash	2024-07-04 15:29:30.28627+00
146	wagtailembeds	0007_populate_hash	2024-07-04 15:29:31.386825+00
147	wagtailembeds	0008_allow_long_urls	2024-07-04 15:29:34.45849+00
148	wagtailembeds	0009_embed_cache_until	2024-07-04 15:29:35.125844+00
149	wagtailforms	0001_initial	2024-07-04 15:29:35.914539+00
150	wagtailforms	0002_add_verbose_names	2024-07-04 15:29:36.419469+00
151	wagtailforms	0003_capitalizeverbose	2024-07-04 15:29:36.701191+00
152	wagtailforms	0004_add_verbose_name_plural	2024-07-04 15:29:36.886851+00
153	wagtailforms	0005_alter_formsubmission_form_data	2024-07-04 15:29:37.239594+00
154	wagtailimages	0001_initial	2024-07-04 15:29:48.253307+00
155	wagtailimages	0002_initial_data	2024-07-04 15:29:48.40188+00
156	wagtailimages	0003_fix_focal_point_fields	2024-07-04 15:29:48.626937+00
157	wagtailimages	0004_make_focal_point_key_not_nullable	2024-07-04 15:29:48.778926+00
158	wagtailimages	0005_make_filter_spec_unique	2024-07-04 15:29:48.930283+00
159	wagtailimages	0006_add_verbose_names	2024-07-04 15:29:49.07396+00
160	wagtailimages	0007_image_file_size	2024-07-04 15:29:49.219765+00
161	wagtailimages	0008_image_created_at_index	2024-07-04 15:29:49.45516+00
162	wagtailimages	0009_capitalizeverbose	2024-07-04 15:29:49.60544+00
163	wagtailimages	0010_change_on_delete_behaviour	2024-07-04 15:29:49.783058+00
164	wagtailimages	0011_image_collection	2024-07-04 15:29:49.943335+00
165	wagtailimages	0012_copy_image_permissions_to_collections	2024-07-04 15:29:50.094085+00
166	wagtailimages	0013_make_rendition_upload_callable	2024-07-04 15:29:50.308991+00
167	wagtailimages	0014_add_filter_spec_field	2024-07-04 15:29:50.472833+00
168	wagtailimages	0015_fill_filter_spec_field	2024-07-04 15:29:50.641979+00
169	wagtailimages	0016_deprecate_rendition_filter_relation	2024-07-04 15:29:50.795+00
170	wagtailimages	0017_reduce_focal_point_key_max_length	2024-07-04 15:29:50.948672+00
171	wagtailimages	0018_remove_rendition_filter	2024-07-04 15:29:51.106532+00
172	wagtailimages	0019_delete_filter	2024-07-04 15:29:51.30446+00
173	wagtailimages	0020_add-verbose-name	2024-07-04 15:29:51.478175+00
174	wagtailimages	0021_image_file_hash	2024-07-04 15:29:51.629838+00
175	wagtailimages	0022_uploadedimage	2024-07-04 15:29:52.370151+00
176	wagtailimages	0023_add_choose_permissions	2024-07-04 15:29:56.171231+00
177	wagtailimages	0024_index_image_file_hash	2024-07-04 15:29:56.515303+00
178	wagtailimages	0025_alter_image_file_alter_rendition_file	2024-07-04 15:29:56.888038+00
179	wagtailimages	0026_delete_uploadedimage	2024-07-04 15:29:57.179812+00
180	wagtailredirects	0001_initial	2024-07-04 15:29:58.313119+00
181	wagtailredirects	0002_add_verbose_names	2024-07-04 15:29:58.619642+00
182	wagtailredirects	0003_make_site_field_editable	2024-07-04 15:29:58.980905+00
183	wagtailredirects	0004_set_unique_on_path_and_site	2024-07-04 15:30:00.90338+00
184	wagtailredirects	0005_capitalizeverbose	2024-07-04 15:30:01.315049+00
185	wagtailredirects	0006_redirect_increase_max_length	2024-07-04 15:30:01.698081+00
186	wagtailredirects	0007_add_autocreate_fields	2024-07-04 15:30:03.038171+00
187	wagtailredirects	0008_add_verbose_name_plural	2024-07-04 15:30:03.235325+00
188	wagtailsearch	0001_initial	2024-07-04 15:30:05.654652+00
189	wagtailsearch	0002_add_verbose_names	2024-07-04 15:30:05.978619+00
190	wagtailsearch	0003_remove_editors_pick	2024-07-04 15:30:06.142286+00
191	wagtailsearch	0004_querydailyhits_verbose_name_plural	2024-07-04 15:30:06.318559+00
192	wagtailsearch	0005_create_indexentry	2024-07-04 15:30:07.296018+00
193	wagtailsearch	0006_customise_indexentry	2024-07-04 15:30:09.289418+00
194	wagtailsearch	0007_delete_editorspick	2024-07-04 15:30:10.010146+00
195	wagtailsearch	0008_remove_query_and_querydailyhits_models	2024-07-04 15:30:15.032476+00
196	wagtailusers	0001_initial	2024-07-04 15:30:15.668409+00
197	wagtailusers	0002_add_verbose_name_on_userprofile	2024-07-04 15:30:15.981741+00
198	wagtailusers	0003_add_verbose_names	2024-07-04 15:30:16.175821+00
199	wagtailusers	0004_capitalizeverbose	2024-07-04 15:30:16.671101+00
200	wagtailusers	0005_make_related_name_wagtail_specific	2024-07-04 15:30:17.000177+00
201	wagtailusers	0006_userprofile_prefered_language	2024-07-04 15:30:17.737297+00
202	wagtailusers	0007_userprofile_current_time_zone	2024-07-04 15:30:18.322795+00
203	wagtailusers	0008_userprofile_avatar	2024-07-04 15:30:18.924855+00
204	wagtailusers	0009_userprofile_verbose_name_plural	2024-07-04 15:30:19.138151+00
205	wagtailusers	0010_userprofile_updated_comments_notifications	2024-07-04 15:30:19.741836+00
206	wagtailusers	0011_userprofile_dismissibles	2024-07-04 15:30:20.361219+00
207	wagtailusers	0012_userprofile_theme	2024-07-04 15:30:20.986567+00
208	wagtailusers	0013_userprofile_density	2024-07-04 15:30:21.599547+00
209	wagtailimages	0001_squashed_0021	2024-07-04 15:30:22.151047+00
210	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2024-07-04 15:30:22.355827+00
211	home	0002_global	2024-07-04 15:46:36.877001+00
212	home	0003_alter_global_body	2024-07-04 15:57:32.043312+00
213	paquete	0002_alter_dias_item_alter_excluidoitempaquete_item_and_more	2024-07-04 18:02:31.209745+00
214	tour	0002_alter_tour_categories_alter_tour_itinerario_and_more	2024-07-05 15:23:58.762253+00
215	home	0004_gallerycarousel_carouselbuttonname_and_more	2024-07-05 16:54:15.679368+00
216	home	0005_inicio_galleryini_alter_inicio_formulariosubtitulo_and_more	2024-07-11 21:35:52.199525+00
217	home	0006_alter_inicio_galleryini	2024-07-13 22:41:55.011168+00
218	home	0006_nosotros_certificadossubtitle_and_more	2024-07-20 20:57:01.635449+00
219	paquete	0003_dias_titulo	2024-07-25 21:05:06.577368+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.django_session (session_key, session_data, expire_date) FROM stdin;
0gq0fr6wo8fno9qoc277zr4wrlbqlyag	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sU5dC:w5EYlTHBHHxe_j8Xs6-6ImT7PI3g-tO61dEFnPOqGUo	2024-07-31 14:27:46.363102+00
12dxslkm3nr32jbmj64bdotl9cytt5c1	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sPpoh:v0OlhLBxo-pvt4-FQHnFHgV6V8YU-zM4p9CU57ofA44	2024-07-19 20:46:03.504493+00
4llvvdonbh3ozxk48teme9eavw4g8ay1	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRxgg:7PBYC8y1zhTGBssbbF5lJaoJsinjLpZgZUWZHxX2HZc	2024-07-25 17:34:34.337036+00
5k9do6pt2pcodfunj79cpw6abugls18t	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sS1WJ:nAb2wtq7sP3SWdxfQlGyMIQwolIUvEGuoSnpl2JyRmk	2024-07-25 21:40:07.938935+00
7p83vz8xqpfborfcixjfoowbfwp3unss	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSkiT:OKc9inqQbYN_5FcAPdPfPRs6Yifs_JyE1XuT2V4H7us	2024-07-27 21:55:41.193331+00
8lf2e2gjof1x36vzxs4m1ctp84ytslaf	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sVzt7:FjxUsfIoq8ZziK1cwP9USBHXiGR6l3pabVcKnJbgnIA	2024-08-05 20:44:05.038395+00
9sl2kzd8d5fu8puzv4x4mfos2zedktu0	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSOod:sYmNqblFOi4zN5kZeZPoy8C7CDN0TUmP5G_csjwsM64	2024-07-26 22:32:35.143482+00
bx3ly27lt3bzz5hqbo0wmppvunpfe2e6	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sYXke:zBzmocRl2663vImNmaPbIF1P6wayIEKrCVBS4K7Jw7U	2024-08-12 21:17:52.671445+00
c4e7ejtz4m4yl0sn2izpz6i28cqar3ry	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSmLl:nBsVpzedWh7KmjOnrLv_uwJBXRigWvv8neBRK_V01dg	2024-07-27 23:40:21.565867+00
da9iyvsa45ezq1j5465ikwj9oucfsym1	.eJxVjMEOwiAQBf-FsyEUlkJ79O43EFi2FjVgoE00xn_XJj3o9c28eTHn12V2a6PqUmQjk-zwuwWPV8obiBefz4VjyUtNgW8K32njpxLpdtzdv8Ds2_x94wBGByPBdsJYq6y2wmjl-x5AEw4awUaCECbVSVQqaqukV9ibSSAgbdFGraWSHT3uqT7ZKN4fPf4-MQ:1sRgzO:ZA0P8ltQd8vVaLtYiq0O1kSYtKwu5BJ8LZw1G8Ulnsk	2024-07-24 23:44:46.452407+00
dlatzy1ic498uwxx96k033h9atufnfkn	.eJxVjMsOwiAQRf-FtSEUhke7dO83EBimFjVgSptojP-uTbrQ7T3nnhfzYV0mvzaafU5sYJIdfrcY8EplA-kSyrlyrGWZc-Sbwnfa-Kkmuh139y8whTZ939iD1dFKcJ2wzimnnbBaBWMANGGvEVwiiHFUnUSlknZKBoXGjgIBaYs2ai3X4ulxz_OTDZ0UvRHi_QG1sD9j:1sWILh:SOJlZYTmLhFd57YRlN2tqVi5f31ZFg8cJ9BNoERb_8o	2024-08-06 16:26:49.382933+00
dnuhrl7irkb7tlla5vf9oxami6tyrzrr	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRYVx:JdU9v_8Jfraa2fqoT7ToHCIn9u8htfECyDCYPEcHeI4	2024-07-24 14:41:49.767327+00
en559iznf1b4xc6ptnsulsh4iak4pjf8	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sVHJA:MOKDsSXZoyb5E2Se8bcilJXzWZ2veB3DCta7gVi4Qag	2024-08-03 21:08:00.166571+00
ew2zm69512s806cmo71wei27o1meejre	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sPs4B:Mz9eVguGckIvBTqR0xw8LHJeWgwBJZGEXR27B6nFfVg	2024-07-19 23:10:11.328506+00
fzqdei4ponhgduc3650fez76evivx9fk	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sUCRv:Njz9BWhE6A53LL9eZ3C6yNVauzf2ykX7eUEhlSTC7cI	2024-07-31 21:44:35.345938+00
gj06gtwafkywlhg9u7nepxy0pqht4bm4	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSQ9y:MMq0XJ9ql9aogNhgvSPEP9TvjZXRLb6iLg1N5Wpynjk	2024-07-26 23:58:42.342973+00
jlgnywofst6ov63tdac908nduugf062z	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sUw9Y:8fUEzVDYGNO-Ngheex1Wxod7kNKYvGtS6elCjbBGmjI	2024-08-02 22:32:40.942276+00
js24veykja3oy4ioco80lfzdppblr7p4	.eJxVjMsOgjAQRf-la9OM9AUs3fsNTYeZStW0hkKiMf67kLDQ7Tnn3rfwYZlHv1SefCLRCyUOvwzDcOO8CbqGfClyKHmeEsotkbut8lyI76e9_TsYQx3XNXQYaGhZd0obts6RdjGCaY6q0cYZQmVb0NZqhJVjJGgsUBssxC4Y3E4r15pK9vx8pOklevh8AXDbPrI:1sX5vi:4gxT0M7Mzbqrc5ASW6jFMirPqGklwfQWVPAnTivNddk	2024-08-08 21:23:18.745184+00
kds3k6uslo3z8zxhq4r2xo3ei5u6jka6	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRMcJ:GhjZ8laXN9noVR0hTag_tZKIdI-9xjAQ_NRiqmhz-LE	2024-07-24 01:59:35.436777+00
nnk5xct2mirmtgd8ua89wepsbjnww6ki	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sXNvH:J4yeXBxKRhzk2TB8rCH4hNZ04FOZ7pbZFAcZVbx4uBM	2024-08-09 16:36:03.683207+00
pdzxmj3f0qbp9c346bwilke1yoc0mrda	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sX6FA:fMv1XnGaz9mrhaw3EVxZssA1qn6qApCPNQofxWYIK-Y	2024-08-08 21:43:24.225252+00
qtxs7enhjc68abk3uhqj9ehyadkgc6yr	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sWik0:OyF9DvZJTE6qfJDA53dAexdgQCCZp3H9v8RD94yNKjE	2024-08-07 20:37:40.24002+00
qvfbz0h06l95ttsbbyfxx3rgdtqfcs3v	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sWelO:bJyFfA75WIgNzYFsmI1xPewy_-q6Pqwjf6jbO2yKvHQ	2024-08-07 16:22:50.270343+00
rlmoes6b7tjb0cdwlg05zx4pijctxebe	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSiV9:J_E0baDngnTKEfrEpsWuEPTAJgmGGVzrgY0_3-n1lEc	2024-07-27 19:33:47.274979+00
ssz1bdjwq69ioae2dqcza5k90d5pones	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSlHF:lyWsAh6Bgp4c30s6jfAU6g_vr_MsxLHAGFWfC6axjNY	2024-07-27 22:31:37.117629+00
tcisrrd99j0dqmayh6att7rw4adjyun0	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sX0qI:5PHZS_naF7GQIjjFdt2Tc2hBZLhxHLWH2EEjMRsjxtI	2024-08-08 15:57:22.825007+00
tldwsvwkksker278r0l715mxleo75rt4	.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sPOUZ:BHrgvLHJyZ-oNAOYBfAnJ9fHVFx4de1pOggkBtF9jo8	2024-07-18 15:35:27.659613+00
tlpj33kiq8k4omgzi22nb80sko0tmxbi	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sX5nq:-UzkhxzYUxCKhtjnv0kCo1QCeioiYrMMN4lN6fuUT7g	2024-08-08 21:15:10.664402+00
tmeqchlk7c8iak8zs5ugcz0cz958xoxc	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sUZ3t:DksJh7SrbpqrLu5BLX3Xl5WWUZeEemD0vdikiOW6CAY	2024-08-01 21:53:17.463574+00
ypl6fp5lhori573xi7safc6aa5ik7c39	.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sTMlK:SsImW9zm8yZuN9ntuw7dJifsjrZNXRa-1swYMmd68sk	2024-07-29 14:33:10.162804+00
\.


--
-- Data for Name: home_certificados; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_certificados (id, sort_order, image_id, page_id) FROM stdin;
\.


--
-- Data for Name: home_cloudinaryimage; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_cloudinaryimage (id, title, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, file_size, file_hash, file, collection_id, uploaded_by_user_id) FROM stdin;
1	Screenshot from 2024-05-24 14-58-35-1	1920	1080	2024-07-04 16:25:29.162876+00	\N	\N	\N	\N	255344	2d310be9f7363cbabea60e4109888d35a35994fe	media/original_images/Screenshot_from_2024-05-24_14-58-35-1_qidbjw	1	1
2	Screenshot from 2024-02-20 05-52-15	1920	1080	2024-07-04 16:26:23.88367+00	\N	\N	\N	\N	430354	cc3ab2471b484542ce935d580abe786553762e3e	media/original_images/Screenshot_from_2024-02-20_05-52-15_lx2m45	1	1
3	graduacion	1500	1001	2024-07-10 02:01:16.719846+00	\N	\N	\N	\N	207281	155230042b2326b0a83d46109c66c85256ef419f	media/original_images/graduacion_kvcogq	1	1
4	machuDestino	434	707	2024-07-13 23:50:33.228489+00	\N	\N	\N	\N	575608	56ccf6dbf229474698c80b39f90a6e77989d3732	media/original_images/machuDestino_juxoyv	1	1
5	limaArequipa	434	345	2024-07-13 23:53:02.12487+00	\N	\N	\N	\N	265256	bc1508cd58a451b2824770e2d2e66575873e7af4	media/original_images/limaArequipa_i08qd0	1	1
6	arequipaDestino	435	345	2024-07-13 23:58:12.505491+00	\N	\N	\N	\N	256715	9ac9e2d132719c52be773d45213489104dd3aa0b	media/original_images/arequipaDestino_ni8jb9	1	1
7	punoDestino	435	345	2024-07-14 00:10:44.134909+00	\N	\N	\N	\N	280497	9010993542e3c30c8dab7753705c40dc86630475	media/original_images/punoDestino_x5mtvj	1	1
8	icaDestino	434	345	2024-07-14 00:11:56.675451+00	\N	\N	\N	\N	321697	d86b4008646a0f2ca9d9df82be7b850b244b6d3b	media/original_images/icaDestino_bmyihr	1	1
9	paq1	425	586	2024-07-14 00:19:14.131895+00	\N	\N	\N	\N	377773	f8dae5966f46ba8caef7608a92c708688ad2aa0d	media/original_images/paq1Featured_krcrvn	1	1
10	paq1	595	249	2024-07-14 00:23:17.90704+00	\N	\N	\N	\N	256421	f2b110e83f3a692bd228db20b5e9589ba92da832	media/original_images/paq1_stmpxd	1	1
11	backgroundNosotros	1442	348	2024-07-17 18:01:56.177399+00	\N	\N	\N	\N	1039304	0a89e709faababd3c2168be9174473781d724d4e	media/original_images/backgroundNosotros_hcdmd7	1	1
12	imagenFundadores	630	442	2024-07-17 18:03:19.080567+00	\N	\N	\N	\N	544430	38542d98234422667b8bff6a2c4345bd385b55ab	media/original_images/imagenFundadores_ef2qai	1	1
13	limaDestinoMob	350	655	2024-07-17 22:13:34.863977+00	\N	\N	\N	\N	303609	f20abe7679ac928a83337d4bc9a0da5cddedb931	media/original_images/limaDestinoMob_zs6bkn	1	1
14	arequipaDestinoMob	350	655	2024-07-17 22:14:00.648346+00	\N	\N	\N	\N	345856	8c4ea22d4898bf7b1acd443376db6d9a47eba40c	media/original_images/arequipaDestinoMob_ptog3q	1	1
15	punoDestinoMob	350	655	2024-07-17 22:14:54.657277+00	\N	\N	\N	\N	391417	aed26e6dcbbb4b87de3f19eb3867fc43383e5cf0	media/original_images/punoDestinoMob_fdo0cs	1	1
16	contactarBack	1442	347	2024-07-20 23:38:00.507078+00	\N	\N	\N	\N	847612	967b7581aa286f09d627ff4687346bc4f2e85a51	media/original_images/contactarBack_dx9qko	1	1
17	Group 1573	206	96	2024-07-22 20:48:27.044773+00	\N	\N	\N	\N	4431	a0ef2ac50b3d389de141361b31ab9370e2d7f37d	media/original_images/Group_1573_odq8rs	1	1
18	protegemeIcon	261	99	2024-07-22 20:48:58.874506+00	\N	\N	\N	\N	21406	f82614a7af1a9e6db643d9486e82bf6742273cc3	media/original_images/protegemeIcon_jivsh0	1	1
19	image 647	233	95	2024-07-22 20:49:42.912398+00	\N	\N	\N	\N	14240	7250fe169303229221f35b713613d0cbf48415e2	media/original_images/image_647_qfoyhv	1	1
20	image 646	114	104	2024-07-22 20:50:13.723099+00	\N	\N	\N	\N	13120	71982a45f0080e7a671deae47c194aa1b06be91b	media/original_images/image_646_dtv512	1	1
21	unnamed 1	104	102	2024-07-22 20:50:57.424742+00	\N	\N	\N	\N	9986	e4a251b340d1f7336666d3b0e79fb1eff27825c4	media/original_images/unnamed_1_zts58w	1	1
22	Group (5)	82	81	2024-07-22 22:23:57.539296+00	\N	\N	\N	\N	3053	36fd62fdfd8c75ba63a91a90f4d493d65e990adf	media/original_images/Group_5_hwi9bp	1	1
23	Group (6)	80	83	2024-07-22 22:24:36.658184+00	\N	\N	\N	\N	2593	0d86a7dc18dc75691238e8dfb78fead657f38090	media/original_images/Group_6_ax3h9b	1	1
24	Group (7)	88	80	2024-07-22 22:25:23.601527+00	\N	\N	\N	\N	2985	b488b6fc6a42c0df7aae2157de4cb3e5c3d93819	media/original_images/Group_7_tujnro	1	1
25	Group (8)	91	80	2024-07-22 22:29:30.536308+00	\N	\N	\N	\N	2709	800f4ce9ed8403ed70aaf4f103bafa770978fcc6	media/original_images/Group_8_b7yyog	1	1
26	Vector	87	85	2024-07-22 22:30:00.923105+00	\N	\N	\N	\N	3235	0a8667806e95f1812dd845bc5858391f8ae49a1a	media/original_images/Vector_vhzcne	1	1
27	Group (9)	74	88	2024-07-22 22:30:39.277359+00	\N	\N	\N	\N	2229	51accf84aa6d60823ac0dc7d39289ca829d2b494	media/original_images/Group_9_axrenh	1	1
29	Mapi Full day	1080	1080	2024-07-23 16:32:07.835162+00	\N	\N	\N	\N	2254507	93163cce6d3feefd971f2901bdc2eca9b044455f	media/original_images/Mapi_Full_day_jn5lgp	1	2
30	Inlcusiones Mapi	1080	1080	2024-07-23 16:32:35.338741+00	\N	\N	\N	\N	2282093	d15f07eadb81d5c29dfa7f1ce205e3b3b6f146f1	media/original_images/Inlcusiones_Mapi_fd9vbj	1	2
31	338a6885465c49ecb03dbcb61783698b	3840	2160	2024-07-23 16:35:50.135159+00	\N	\N	\N	\N	1618780	077427f3f043ab5fd45374e30548dd54d8e4914f	media/original_images/338a6885465c49ecb03dbcb61783698b_idluna	1	2
32	PROGRAMA 10D9N	1080	1080	2024-07-24 21:59:05.771932+00	\N	\N	\N	\N	1911438	a27665dee06edc660325561d4c1c17e2b7b20c19	media/original_images/PROGRAMA_10D9N_6_qlmm31	1	3
33	Machupicchu	960	1280	2024-07-24 22:49:48.768346+00	\N	\N	\N	\N	415021	403e7af7342795e2f93e72bb19a1b7154ac24b0b	media/original_images/photo_4974404446641564972_y_rvqb3j	1	3
34	Ica	1280	855	2024-07-24 22:50:34.25882+00	\N	\N	\N	\N	193311	3d2f0c95387794503cf164c098d33706685d2db0	media/original_images/photo_4963367750785412826_y_xr78xy	1	3
35	TRC	1280	960	2024-07-24 22:51:16.355793+00	\N	\N	\N	\N	315178	dd609e02aab1e091fcebe6b8a57a6df546db1f02	media/original_images/photo_4974404446641564987_y_e91dwo	1	3
36	PROGRAMA 10D9N	1080	1080	2024-07-24 23:13:57.358248+00	\N	\N	\N	\N	2079468	f7bbd581a4c9da8ce0f39518d35d2a5a77f4370a	media/original_images/PROGRAMA_8D7N_oskiq9	1	3
37	Maachupicchu	720	1280	2024-07-24 23:18:02.764819+00	\N	\N	\N	\N	301990	ac749ac7abfb4dc1f0005d5069d88fd5c4e68fce	media/original_images/photo_4965745552054660226_y_qwjzxv	1	3
38	Oasis	855	1280	2024-07-24 23:21:20.655102+00	\N	\N	\N	\N	145775	61f9d380beb2631379747dbabce748f47b06f460	media/original_images/photo_4963367750785412823_y_kton2o	1	3
39	machuIni	1443	641	2024-07-29 21:25:30.99279+00	\N	\N	\N	\N	1355858	df4bd9b03e74dca90171dcb2d61f4e85b4cc91a7	media/original_images/machuIni_rqgydm	1	1
\.


--
-- Data for Name: home_cloudinaryrendition; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_cloudinaryrendition (id, filter_spec, width, height, focal_point_key, image_id) FROM stdin;
1	max-165x165	165	92		1
2	max-165x165	165	92		2
3	max-165x165	165	110		3
4	width-1000	1920	1080		2
5	width-1000	1920	1080		1
6	original	1920	1080		1
7	max-800x600	800	450		1
8	max-165x165	101	165		4
9	max-165x165	165	131		5
10	max-165x165	165	130		6
11	max-165x165	165	130		7
12	max-165x165	165	131		8
13	max-165x165	119	165		9
14	max-165x165	165	69		10
15	width-1000	595	249		10
16	max-165x165	165	39		11
17	max-165x165	165	115		12
18	max-165x165	88	165		13
19	max-165x165	88	165		14
20	max-165x165	88	165		15
21	width-1000	350	655		13
22	width-1000	350	655		14
23	width-1000	350	655		15
24	max-165x165	165	39		16
25	max-165x165	165	76		17
26	max-165x165	165	62		18
27	max-165x165	165	67		19
28	max-165x165	114	104		20
29	max-165x165	104	102		21
30	max-165x165	82	81		22
31	max-165x165	80	83		23
32	max-165x165	88	80		24
33	max-165x165	91	80		25
34	max-165x165	87	85		26
35	max-165x165	74	88		27
37	max-165x165	165	165		29
38	max-165x165	165	165		30
39	max-165x165	165	92		31
42	max-165x165	165	165		32
43	max-165x165	123	165		33
44	max-165x165	165	110		34
45	max-165x165	165	123		35
46	max-165x165	165	165		36
47	max-165x165	92	165		37
48	max-165x165	110	165		38
49	max-165x165	165	73		39
50	width-1000	1443	641		39
\.


--
-- Data for Name: home_contacto; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_contacto (page_ptr_id, titulo, formtitle, ubicacion, background_id) FROM stdin;
16	Contáctanos	Contacto	Tacna 168, Cusco 08002	16
17	Contact Us	Contact	Tacna 168, Cusco 08002	16
\.


--
-- Data for Name: home_destino; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_destino (id, name, background_id, backgroundmobile_id) FROM stdin;
1	Cusco	4	2
2	Lima	5	2
3	Arequipa	6	2
4	Puno	7	2
5	Ica	8	2
\.


--
-- Data for Name: home_estadisticas; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_estadisticas (id, sort_order, redlet, graylet, page_id) FROM stdin;
1	0	+5K	AGENCIAS DE VIAJES ATENDIDAS	11
2	0	+5K	TRAVEL AGENCIES SERVED	12
3	1	+30	DESTINOS	11
4	2	+15	15 AÑOS DE EXPERIENCIA	11
5	1	+30	DESTINIES	12
6	2	+15	15 YEARS OF EXPERIENCE	12
\.


--
-- Data for Name: home_faq; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_faq (id, sort_order, question, answer, page_id) FROM stdin;
1	0	Cuando debo viajar a Peru?	<p data-block-key="v3p0b">thicgidcg</p>	13
2	0	Cuando debo viajar a Peru?	<p data-block-key="v3p0b">thicgidcg</p>	15
\.


--
-- Data for Name: home_global; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_global (page_ptr_id, body) FROM stdin;
4	<p data-block-key="8c3rz">uuu</p>
8	<p data-block-key="8c3rz">uuu</p>
\.


--
-- Data for Name: home_home; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_home (page_ptr_id, body) FROM stdin;
3	
7	
\.


--
-- Data for Name: home_informacion; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_informacion (id, name, numero, "desc", link) FROM stdin;
1	Jushka	+51 956 231 682	Realiza tus consultas ¡Escríbenos!	asdasdasd
\.


--
-- Data for Name: home_inicio; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_inicio (page_ptr_id, paquetetitulo, destinotitulo, formulariotitulo, formulariosubtitulo, galleryini) FROM stdin;
13	Nuestros Paquetes	Destinos	¿Tiene alguna pregunta especifica?	Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum	[{"type": "Tipo1", "value": {"photo": 39, "carouselTitulo": "EL CAMINO DE LOS TIEMPOS", "carouselDuracion": "8-7", "carouselLink": "aoeuaoeuaoue", "carouselButtonName": "Ver", "miniPhotos": [{"type": "item", "value": 13, "id": "d0907c6b-a729-4408-bbc2-397646c664a1"}, {"type": "item", "value": 14, "id": "ac653cb6-8ebc-4d38-957b-e30c194b726c"}, {"type": "item", "value": 15, "id": "7d6839e5-b13f-4db8-8aea-9957c3cf88e5"}]}, "id": "94ad5633-9fba-49dc-a3f7-695771818dbc"}, {"type": "Tipo2", "value": {"photo": 1, "carouselTitulo": "aoeuoaeu", "carouselButtonName": "aoeuaoeu"}, "id": "c4f7ff8e-c065-41da-852b-4f0246055475"}]
15	Nuestros Paquetes	Destinos	¿Tiene alguna pregunta especifica?	i dont remenber what text is written here	[{"type": "Tipo1", "value": {"photo": 10, "carouselTitulo": "THE TIMES ROADS", "carouselDuracion": "8-7", "carouselLink": "aoeuaoeuaoue", "carouselButtonName": "Ver", "miniPhotos": [{"type": "item", "value": 13, "id": "d0907c6b-a729-4408-bbc2-397646c664a1"}, {"type": "item", "value": 14, "id": "ac653cb6-8ebc-4d38-957b-e30c194b726c"}, {"type": "item", "value": 15, "id": "7d6839e5-b13f-4db8-8aea-9957c3cf88e5"}]}, "id": "94ad5633-9fba-49dc-a3f7-695771818dbc"}, {"type": "Tipo2", "value": {"photo": 1, "carouselTitulo": "aoeuoaeu", "carouselButtonName": "aoeuaoeu"}, "id": "c4f7ff8e-c065-41da-852b-4f0246055475"}]
\.


--
-- Data for Name: home_nosotros; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_nosotros (page_ptr_id, titulo, subtitulo, parrafo, razonsocial, numeroruc, nombrecomercial, certificadoautorizacion, background_id, imageparrafo_id, certificadossubtitle, partnerssubtitle, valoressubtitle) FROM stdin;
11	Sobre Nosotros	Sobre Nosotros	<p data-block-key="8akow">Españollll</p>	Perú Destino Seguro E.I.R.L.	20601468582	PDS VIAJES	Perú Destino Seguro E.I.R.L.	11	12	Certificaciones	Nuestros Partners	Valores
12	About Us	About Us	<p data-block-key="8akow">ENglish</p>	Perú Destino Seguro E.I.R.L.	20601468582	PDS VIAJES	Perú Destino Seguro E.I.R.L.	11	12	TEST	TEST	TEST
\.


--
-- Data for Name: home_partners; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_partners (id, sort_order, image_id, page_id) FROM stdin;
1	0	17	11
2	1	18	11
3	2	19	11
4	3	20	11
5	4	21	11
\.


--
-- Data for Name: home_tourcategory; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_tourcategory (id, name) FROM stdin;
\.


--
-- Data for Name: home_valores; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.home_valores (id, sort_order, label, img_id, page_id) FROM stdin;
1	0	Responsabilidad	22	11
2	1	Lealtad	23	11
3	2	Honestidad	24	11
4	3	Puntualidad	25	11
5	4	Disciplina	26	11
6	5	Confidencialidad	27	11
\.


--
-- Data for Name: paquete_dias; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.paquete_dias (id, sort_order, item, page_id, titulo) FROM stdin;
2	0	<p data-block-key="5w3gq">edwbredfbfr</p>	9	\N
3	0	<h2 data-block-key="17ptc">Dia 1: Llegada a Lima</h2><p data-block-key="dqhi7">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estará esperando por ti. El número de puerta por donde tienes que salir es el N°3 o N°4, podrás identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de tu viaje</p><p data-block-key="cdujj">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitación con una tarifa adicional o puedes dejar maletas en recepción y salir a conocer la ciudad o esperar en el Lobby.</p>	5	\N
4	0	<h2 data-block-key="s2as0">Dia 1: Llegada a Lima</h2><p data-block-key="c21p7">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estará esperando por ti.</p><p data-block-key="bhr0u">El número de puerta por donde tienes que salir es el N°3 o N°4, podrás identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de tu viaje.</p><p data-block-key="bmnkj">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitación con una tarifa adicional o puedes dejar maletas en recepción y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key="45puv"></p>	18	LLegada a Lima
5	1	<h2 data-block-key="s2as0">Dia 2: City tour Lima</h2><p data-block-key="807gt">Nuestro tour presenta Lima en sus tres períodos históricos: prehispánico, colonial y moderno. Primero disfrutaremos de una hermosa vista panorámica por Lima Ancestral, Huaca Pucllana, es un sitio arqueológico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key="affod">Posteriormente conocemos Lima colonial en su centro histórico se encuentra la arquitectura urbana en este período, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key="dh2p5">En el centro histórico apreciamos: El Palacio de Justicia, Plaza San Martín, Plaza Mayor, con vistas panorámicas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresarán al</p><p data-block-key="8o40k">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estará acompañado por un guía que estará siempre respondiendo sus preguntas.</p><p data-block-key="p2qc">Lima Contemporánea: Vamos a ver las zonas más tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key="9l0j8">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>	18	\N
6	0	<p data-block-key="s2as0">Llegada a Cusco</p>	19	LLegada a Cusco
7	1	<h2 data-block-key="s2as0">Dia2 Valle Sgarado Conexion</h2><p data-block-key="807gt">Viaje al valle Sagrado</p>	19	aoeaoe
8	2	<h2 data-block-key="tv6z1">Dia 3: Ica paracas Full Day</h2><p data-block-key="b0u50">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bahía de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt también apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key="fn59g">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key="1a2v0">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key="4aumk">Salida con destino a Lima.</p>	18	\N
9	3	<h2 data-block-key="tv6z1">Dia 4: Vuelo a Cusco</h2><p data-block-key="q5p5">Nos dirigiremos hacía el aeropuerto Jorge Chávez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key="7fs20">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key="lpsi">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key="c45ie"></p>	18	\N
10	4	<h2 data-block-key="tv6z1">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key="c3dqa">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una práctica de 15 minutos el pasajero nos da el OK si no tiene ningún problema con la cuatrimoto para empezar el tour.</p><p data-block-key="cbjae">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key="aa564">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Verónica y el nevado de Chicón acompañados de un mágico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key="9ovv0">Nuestro tour finaliza en la Plaza San Francisco.</p>	18	\N
11	5	<h2 data-block-key="tv6z1">Dia 6: Valle sagrado Conexión</h2><p data-block-key="9vp0h">Este majestuoso tour empezará a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto será el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueológico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key="9tqc3">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes turísticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key="5bgfa">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueológico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key="a47k7">Nos dirigiremos a la estación de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>	18	\N
12	6	<h2 data-block-key="tv6z1">Dia 7 : Machupicchu</h2><p data-block-key="bp9fs">Nuestro guía le estará esperando a la hora y en el lugar de encuentro (esto será coordinado una noche antes).</p><p data-block-key="1roq3">Nos dirigiremos a la estación de buses Conssetur el cual nos transportará de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificación para poder ingresar a la Llaqta de Machupicchu, tendrá un recorrido de 2 horas a 2:30 min. como máximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotográficas.</p><p data-block-key="7eipf">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key="etnb5">Nos dirigiremos a la estación de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key="aeaf3">Nuestra movilidad estará esperándonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>	18	\N
13	7	<h2 data-block-key="tv6z1">Dia 8: Montaña de Colores</h2><p data-block-key="70i1r">Iniciaremos nuestro tour hacia la Montaña de 7 Colores - Vinicunca recogiéndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad turística dirigirnos hacia el sur del Cusco.</p><p data-block-key="mlog">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas más en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Montaña de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key="dqabv">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>	18	\N
14	8	<h2 data-block-key="tv6z1">Dia 9: TRC Ccaccaccollo</h2><p data-block-key="2q3su">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que está ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, teñido, y tejido de fibra de camélidos sudamericanos donde podrás apreciar la variedad de productos realizados a mano y un acabado único.</p><p data-block-key="3rf01">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentación de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key="6tbtl">Espera un suculento almuerzo típico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde serás participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te hará vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedirán nuestros pobladores deseándote un buen por venir.</p><p data-block-key="2o8u1">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>	18	\N
15	9	<h2 data-block-key="tv6z1">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key="9hfcv">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con dirección al aeropuerto de Lima.</p><p data-block-key="a73r9">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su País de Origen.</p><p data-block-key="aj7pg"></p>	18	\N
16	1	<h2 data-block-key="wip07">Dia 2 : Ica paracas Full Day</h2><p data-block-key="6i70p">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bahía de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt también apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key="7ot7t">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key="79tk4">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key="d1fn6">Salida con destino a Lima.</p>	5	\N
17	2	<h2 data-block-key="wip07">Dia 3: Vuelo a Cusco</h2><p data-block-key="18bam">Nos dirigiremos hacía el aeropuerto Jorge Chávez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key="37upu">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key="9cld4">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>	5	\N
18	3	<h2 data-block-key="wip07">Dia 4: Valle sagrado Conexión</h2><p data-block-key="asp0m">Este majestuoso tour empezará a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto será el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueológico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key="c2o7h">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes turísticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueológico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key="84da3">Nos dirigiremos a la estación de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>	5	\N
19	4	<h2 data-block-key="wip07">Dia 5: Machupicchu</h2><p data-block-key="9akh3"></p><p data-block-key="8hji2">Nuestro guía le estará esperando a la hora y en el lugar de encuentro (esto será coordinado una noche antes).</p><p data-block-key="33v60">Nos dirigiremos a la estación de buses Conssetur el cual nos transportará de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificación para poder ingresar a la Llaqta de Machupicchu, tendrá un recorrido de 2 horas a 2:30 min. como máximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotográficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key="7rj5">Nos dirigiremos a la estación de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key="b9l95">Nuestra movilidad estará esperándonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>	5	\N
20	5	<h2 data-block-key="wip07">Dia 6: Montaña de Colores</h2><p data-block-key="dbi3g">Iniciaremos nuestro tour hacia la Montaña de 7 Colores - Vinicunca recogiéndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad turística dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas más en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Montaña de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key="5ci7j">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>	5	\N
21	6	<h2 data-block-key="wip07">Dia 7: TRC Ccaccaccollo</h2><p data-block-key="7edm5">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que está ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, teñido, y tejido de fibra de camélidos sudamericanos donde podrás apreciar la variedad de productos realizados a mano y un acabado único.</p><p data-block-key="52sh7">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentación de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key="8d4p2">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te hará vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedirán nuestros pobladores deseándote un buen por venir.</p><p data-block-key="diobk">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>	5	\N
22	7	<h2 data-block-key="wip07">Dia 8: Retorno</h2><p data-block-key="6qg4c"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con dirección al aeropuerto de Lima.</p><p data-block-key="4uitg">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su País de Origen.</p>	5	\N
23	0	<h2 data-block-key="42wub">Dia 1: Llegada a Lima</h2><p data-block-key="bcn9k">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estará esperando por tí. El número de puerta por donde tienes que salir es el N°3 o N°4 podrás identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de su viaje.</p><p data-block-key="5bnj4">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitación con un adicional o puedes dejar maletas en la recepción y salir a conocer la ciudad o esperar en el Lobby.</p>	20	\N
24	1	<h2 data-block-key="42wub">Dia 2: City tour Lima</h2><p data-block-key="7f4si">Nuestro tour presenta Lima en sus tres períodos históricos: prehispánico, colonial y moderno.</p><p data-block-key="cr249">Primero disfrutaremos de una hermosa vista panorámica por Lima Ancestral, Huaca Pucllana, es un sitio arqueológico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro histórico se encuentra la arquitectura urbana en este período, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key="fniri">En el centro histórico apreciamos: El Palacio de Justicia, Plaza San Martín, Plaza Mayor, con vistas panorámicas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresará en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estará acompañado por un guía que estará siempre respondiendo sus preguntas.</p><p data-block-key="60sgh">Lima Contemporánea: Vamos a ver las zonas más tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>	20	\N
25	2	<h2 data-block-key="42wub">Dia 3: Ica paracas Full Day</h2><p data-block-key="1jaf8">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bahía de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt, También apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key="1hqq9">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key="7fddu">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad</p><p data-block-key="a30fa">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key="e39s5">Sandboarding. salida con destino a Lima.</p>	20	\N
26	3	<h2 data-block-key="42wub">Dia 4: Vuelo a Cusco</h2><p data-block-key="7o9qm">Nos dirigiremos hacía el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key="59jal">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key="8h68q">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>	20	\N
27	4		20	\N
\.


--
-- Data for Name: paquete_excluidoitempaquete; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.paquete_excluidoitempaquete (id, sort_order, item, page_id) FROM stdin;
2	0	yourm	9
3	0	Snack	5
4	0	Snack	18
5	1	Gastos adicionales	18
6	0	Vuelo Lima Cusco	19
7	1	Caballos	19
8	2	Equipaje de mano - Bodega	18
9	3	Servicio de caballos	18
10	4	Seguro	18
11	1	Gastos adicionales	5
12	2	Equipaje de mano - Bodega	5
13	3	Servicio de caballos	5
\.


--
-- Data for Name: paquete_gallerycarousel; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.paquete_gallerycarousel (id, sort_order, caption, image_id, page_id) FROM stdin;
2	0	wedsvegv	1	9
5	0	Caption	29	19
6	1	Caption	30	19
7	0	\N	33	18
8	1	\N	34	18
9	2	\N	35	18
10	0	\N	37	5
11	1	\N	38	5
12	0	\N	38	20
13	1	\N	37	20
14	3	\N	34	18
\.


--
-- Data for Name: paquete_incluidoitempaquete; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.paquete_incluidoitempaquete (id, sort_order, item, page_id) FROM stdin;
2	0	dfbdfbfdb	9
3	0	Desayuno	5
4	1	Almuerzos (especificados en el itinerario)	18
5	2	Alojamiento	18
6	0	Desayuno	18
7	4	Traslados	18
8	0	Almuerzo	19
9	1	Hotel	19
10	2	Guia	19
11	3	Transporte	19
12	3	Vuelo Lima -Cusco-Lima	18
13	5	Ticket de ingreso a los atractivos	18
14	6	Trenes	18
15	7	Asesoramiento constante	18
16	1	Almuerzos (especificados en el itinerario)	5
17	2	Alojamiento	5
18	3	Traslados	5
19	4	Vuelo Lima -Cusco-Lima	5
20	5	Ticket de ingreso a los atractivos	5
21	6	Trenes	5
22	7	Guía Oficial de Turismo	5
23	8	Asesoramiento constante	5
\.


--
-- Data for Name: paquete_paquete; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.paquete_paquete (page_ptr_id, precio, duracion, linkword, linkpdf, linkflyer, background_id, featuredimage_id) FROM stdin;
5	997.00	8-7	https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit	https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0	https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI	1	36
9	1200.00	10-8	aoeaoe	aoeaoe	aoeaoe	2	1
18	1145.00	10-9	https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit	https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k	https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi	31	32
19	1289.00	12-11	https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge	https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge	https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge	31	32
20	1457.00	12-11	https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit	https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs	https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1	31	\N
\.


--
-- Data for Name: simple_translation_simpletranslation; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.simple_translation_simpletranslation (id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.taggit_tag (id, name, slug) FROM stdin;
1	Machupicchu	machupicchu
2	Perú	perú
3	Ica	ica
4	TRC	trc
5	Paquetes	paquetes
6	Oasis	oasis
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
2	32	32	2
3	33	32	1
4	34	32	3
5	35	32	4
6	36	32	5
7	37	32	1
8	38	32	6
\.


--
-- Data for Name: tour_excluidoitempaquete; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.tour_excluidoitempaquete (id, sort_order, item, page_id) FROM stdin;
1	0	oaeeaoe	6
2	1	oaeaoe	6
3	0	oaeeaoe	10
4	1	oaeaoe	10
5	0	asdasd	14
\.


--
-- Data for Name: tour_gallerycarousel; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.tour_gallerycarousel (id, sort_order, caption, image_id, page_id) FROM stdin;
1	0	aoeaoe	1	6
2	0	aoeaoe	1	10
3	0	sss	2	14
\.


--
-- Data for Name: tour_incluidoitempaquete; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.tour_incluidoitempaquete (id, sort_order, item, page_id) FROM stdin;
1	0	aoeaooo	6
2	0	aoeaooo	10
3	0	dssdsd	14
\.


--
-- Data for Name: tour_tour; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.tour_tour (page_ptr_id, precio, linkword, linkpdf, linkflyer, itinerario, background_id, featuredimage_id, tourdestino_id) FROM stdin;
6	123.00	aoeaoe	aoeao	aoeaoe	<p data-block-key="5imeg">oaeaoe</p>	1	2	1
10	123.00	aoeaoe	aoeao	aoeaoe	<p data-block-key="5imeg">oaeaoe</p>	1	2	1
14	1212.00	ascdasczxc	zxczx	ASDASDASD	<p data-block-key="rlbyv">asdasdasd</p>	2	9	2
\.


--
-- Data for Name: tour_tour_categories; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.tour_tour_categories (id, tour_id, tourcategory_id) FROM stdin;
\.


--
-- Data for Name: wagtailadmin_admin; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailadmin_admin (id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_comment; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_comment (id, text, contentpath, "position", created_at, updated_at, resolved_at, page_id, resolved_by_id, revision_created_id, user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_commentreply; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_commentreply (id, text, created_at, updated_at, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupapprovaltask; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_groupapprovaltask (task_ptr_id) FROM stdin;
1
\.


--
-- Data for Name: wagtailcore_groupapprovaltask_groups; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_groupapprovaltask_groups (id, groupapprovaltask_id, group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
2	1	1	102
4	1	1	103
6	1	1	105
8	1	1	106
10	1	1	107
12	1	1	109
1	1	2	102
3	1	2	103
5	1	2	105
7	1	2	106
9	1	2	107
11	1	2	109
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_grouppagepermission (id, group_id, page_id, permission_id) FROM stdin;
1	1	1	33
2	1	1	34
6	1	1	38
3	1	1	39
7	1	1	40
4	2	1	33
5	2	1	34
\.


--
-- Data for Name: wagtailcore_locale; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_locale (id, language_code) FROM stdin;
2	en
1	es
\.


--
-- Data for Name: wagtailcore_modellogentry; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_modellogentry (id, label, action, data, "timestamp", content_changed, deleted, object_id, content_type_id, user_id, uuid, revision_id) FROM stdin;
1	Cusco	wagtail.create	{}	2024-07-05 16:06:46.579093+00	t	f	1	33	1	44321f43b79c466e89b7c3c391a8b06c	\N
2	English	wagtail.create	{}	2024-07-05 16:21:59.448564+00	t	f	2	3	1	cbc1da9aaacf4d3a978aa4b4f4464115	\N
3	localhost [predeterminado]	wagtail.edit	{}	2024-07-05 16:25:25.301854+00	t	f	1	4	1	d00818967d894343a1aef945c80e49c3	\N
4	Informacion object (1)	wagtail.create	{}	2024-07-05 21:52:49.400676+00	t	f	1	29	1	d5ab0e3a6ab84dad9748214fba3a24a4	\N
5	David	wagtail.create	{}	2024-07-10 23:44:10.985395+00	t	f	2	54	1	8e7f125f5e594d73b6a00786397f4951	\N
6	Lima	wagtail.create	{}	2024-07-12 22:36:07.178237+00	t	f	2	33	1	323651a49c214242bb01d0d2ac7b4fea	\N
7	Cusco	wagtail.edit	{}	2024-07-13 23:50:59.23646+00	t	f	1	33	1	e920459162a648d387b5b27184f06874	\N
8	Lima	wagtail.edit	{}	2024-07-13 23:54:27.386724+00	t	f	2	33	1	53c1bb505b5d422bba18e56f6444c716	\N
9	Arequipa	wagtail.create	{}	2024-07-14 00:00:21.883583+00	t	f	3	33	1	3c57af8d1082410198547d7df81bde17	\N
10	Puno	wagtail.create	{}	2024-07-14 00:11:06.067695+00	t	f	4	33	1	9efb51d8951a426ba0ad7a7b152eb18a	\N
11	Ica	wagtail.create	{}	2024-07-14 00:12:27.890637+00	t	f	5	33	1	ee94f7d0a5904e268493adaacf4c6d7c	\N
12	Doris	wagtail.create	{}	2024-07-23 19:43:16.398519+00	t	f	3	54	1	a4e9749678394abdbb87dcdd70cda749	\N
13	Israel	wagtail.create	{}	2024-07-23 19:46:39.106451+00	t	f	4	54	1	1c9c592b10984a88988b6cd5f8b35d83	\N
14	Doris	wagtail.edit	{}	2024-07-24 21:43:36.685858+00	t	f	3	54	1	f9fd5ce92eec40d78597b8724dd5200a	\N
15	PERU perfil de grupo de Whatsapp	wagtail.delete	{}	2024-07-24 21:58:27.014603+00	f	f	28	32	3	8557f49752844b749e9eb10f2889b327	\N
16	PERU perfil de grupo de Whatsapp	wagtail.delete	{}	2024-07-24 21:58:29.966011+00	f	f	28	32	3	18c25750b5e149f6a2094d28f1ae5c23	\N
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title, locked_at, locked_by_id, translation_key, locale_id, alias_of_id, latest_revision_id) FROM stdin;
1	0001	1	2	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root	\N	\N	0055b77bff564ed782006bfcc3ff5042	1	\N	\N
3	00010002	2	4	Peru Destino Seguro	peru-destino-seguro	t	f	/peru-destino-seguro/		f		\N	\N	f	28	1	f	2024-07-04 15:52:30.00076+00	2024-07-04 15:52:34.344599+00	1	2024-07-04 15:52:34.344599+00	Peru Destino Seguro	\N	\N	1cb0f6f996114fdd84e11019992be35a	1	\N	1
4	000100020001	3	5	Global	global	t	f	/peru-destino-seguro/global/		f		\N	\N	f	66	1	f	2024-07-04 16:14:43.199387+00	2024-07-04 16:14:47.334848+00	2	2024-07-04 16:14:47.334848+00	Global	\N	\N	868cfd12c7a04401962a96bf0dec4e54	1	\N	2
5	0001000200010001	4	0	PERÚ 8 DIAS 7 NOCHES	el-camino-de-los-dioses	t	f	/peru-destino-seguro/global/el-camino-de-los-dioses/		f		\N	\N	f	42	1	f	2024-07-24 23:52:59.641708+00	2024-07-04 21:10:27.232664+00	105	2024-07-24 23:53:04.737164+00	PERÚ 8 DIAS 7 NOCHES	\N	\N	f9aeab8b633a4c2c8dd66e54c0eafec8	1	\N	105
6	0001000200010002	4	0	Collpa de Guacamalleae	collpa-de-guacamallos	t	f	/peru-destino-seguro/global/collpa-de-guacamallos/		f		\N	\N	f	47	1	f	2024-07-24 21:31:15.643031+00	2024-07-05 16:09:03.315847+00	96	2024-07-24 21:31:18.998553+00	Collpa de Guacamalleae	\N	\N	7516a6a3f8cf4eafa6aa94b0a620ea1c	1	\N	96
7	00010003	2	4	Peru Safe Destiny	peru-destino-seguro-en	t	f	/peru-destino-seguro-en/		f		\N	\N	f	28	1	f	2024-07-05 21:16:32.500544+00	2024-07-05 21:16:34.941733+00	33	2024-07-05 21:16:34.941733+00	Peru Safe Destiny	\N	\N	1cb0f6f996114fdd84e11019992be35a	2	\N	33
8	000100030001	3	3	Global	global	f	t	/peru-destino-seguro-en/global/		f		\N	\N	f	66	1	f	2024-07-05 21:17:57.335695+00	\N	\N	\N	Global	\N	\N	868cfd12c7a04401962a96bf0dec4e54	2	\N	34
9	0001000300010001	4	0	The roads of gods	the-roads-of-gods	t	f	/peru-destino-seguro-en/global/the-roads-of-gods/		f		\N	\N	f	42	1	f	2024-07-05 22:29:45.191766+00	2024-07-05 22:29:48.55254+00	38	2024-07-05 22:29:48.55254+00	The roads of gods	\N	\N	f9aeab8b633a4c2c8dd66e54c0eafec8	2	\N	38
10	0001000300010002	4	0	Collpa de Guacamallos	collpa-de-guacamallos	t	f	/peru-destino-seguro-en/global/collpa-de-guacamallos/		f		\N	\N	f	47	1	f	2024-07-12 22:55:03.769212+00	2024-07-12 22:55:07.408686+00	45	2024-07-12 22:55:07.408686+00	Collpa de Guacamallos	\N	\N	7516a6a3f8cf4eafa6aa94b0a620ea1c	2	\N	45
11	000100020002	3	0	Nosotros	nosotros	t	f	/peru-destino-seguro/nosotros/		f		\N	\N	f	36	1	f	2024-07-22 22:31:27.126856+00	2024-07-10 02:04:41.698353+00	68	2024-07-22 22:31:32.260894+00	Nosotros	\N	\N	a03cc2c2e77945dcb7189ab537b64897	1	\N	68
12	000100030002	3	0	About	about	t	f	/peru-destino-seguro-en/about/		f		\N	\N	f	36	1	f	2024-07-19 22:49:24.747091+00	2024-07-10 02:29:09.405847+00	62	2024-07-19 22:49:27.811469+00	About	\N	\N	a03cc2c2e77945dcb7189ab537b64897	2	\N	62
13	000100020003	3	0	Inicio	inicios	t	f	/peru-destino-seguro/inicios/		f		\N	\N	f	30	1	f	2024-07-29 21:25:52.95066+00	2024-07-11 21:48:48.616315+00	112	2024-07-29 21:25:58.371424+00	Inicio	\N	\N	e0b70daf21af485cbeda143361b4ecb6	1	\N	112
14	0001000200010003	4	0	Collpa de Manu	collpa-de-ollaytamtanbo	t	f	/peru-destino-seguro/global/collpa-de-ollaytamtanbo/		f		\N	\N	f	47	1	f	2024-07-24 21:14:53.699477+00	2024-07-15 22:15:14.294149+00	93	2024-07-24 21:14:57.333466+00	Collpa de Manu	\N	\N	6ffd7fe60e7941c682d411ab541bbdf4	1	\N	93
15	000100030003	3	0	Home	inicios	t	f	/peru-destino-seguro-en/inicios/		f		\N	\N	f	30	1	f	2024-07-18 21:56:18.775768+00	2024-07-18 21:56:21.498931+00	59	2024-07-18 21:56:21.498931+00	Home	\N	\N	e0b70daf21af485cbeda143361b4ecb6	2	\N	59
16	000100020004	3	0	Contactar	contactar	t	f	/peru-destino-seguro/contactar/		f		\N	\N	f	67	1	f	2024-07-20 23:40:40.997743+00	2024-07-20 23:40:43.627461+00	64	2024-07-20 23:40:43.627461+00	Contactar	\N	\N	10aa4b6bc2a64b3cab084399c19bd262	1	\N	64
17	000100030004	3	0	Contact	contact	t	f	/peru-destino-seguro-en/contact/		f		\N	\N	f	67	1	f	2024-07-20 23:46:31.998431+00	2024-07-20 23:46:34.626587+00	66	2024-07-20 23:46:34.626587+00	Contact	\N	\N	10aa4b6bc2a64b3cab084399c19bd262	2	\N	66
18	0001000200010004	4	0	PERÚ 10 DIAS 9 NOCHES	peru-12días-11noches	t	f	/peru-destino-seguro/global/peru-12días-11noches/		f		\N	\N	f	42	2	f	2024-07-26 16:54:55.178281+00	2024-07-23 16:36:15.87274+00	111	2024-07-26 16:55:07.025566+00	PERÚ 10 DIAS 9 NOCHES	\N	\N	fe4b57dd7f9948febb5fdfbca89eecba	1	\N	111
19	0001000300010003	4	0	Peru 12 days 11 nights	peru-12-days-11-nights	t	f	/peru-destino-seguro-en/global/peru-12-days-11-nights/		f		\N	\N	f	42	2	f	2024-07-26 16:39:50.232677+00	2024-07-23 22:53:21.482075+00	110	2024-07-26 16:39:57.227206+00	Peru 12 days 11 nights	\N	\N	fe4b57dd7f9948febb5fdfbca89eecba	2	\N	110
20	0001000200010005	4	0	PERÚ 12 DIAS 11 NOCHES	perú-12-dias-11-noches	f	t	/peru-destino-seguro/global/perú-12-dias-11-noches/		f		\N	\N	f	42	3	f	2024-07-25 21:22:58.304554+00	\N	\N	\N	PERÚ 12 DIAS 11 NOCHES	\N	\N	65f6525138e84fdca87e2be6a096ef36	1	\N	109
\.


--
-- Data for Name: wagtailcore_pagelogentry; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_pagelogentry (id, label, action, data, "timestamp", content_changed, deleted, content_type_id, page_id, revision_id, user_id, uuid) FROM stdin;
1	Peru Destino Seguro	wagtail.create	{}	2024-07-04 15:52:27.92417+00	t	f	28	3	\N	1	dce97bfcc89344c28cdcd5a1bddf3b0e
2	Peru Destino Seguro	wagtail.edit	{}	2024-07-04 15:52:32.488857+00	t	f	28	3	1	1	dce97bfcc89344c28cdcd5a1bddf3b0e
3	Peru Destino Seguro	wagtail.publish	{}	2024-07-04 15:52:38.986907+00	t	f	28	3	1	1	dce97bfcc89344c28cdcd5a1bddf3b0e
4	Global	wagtail.create	{}	2024-07-04 16:14:41.170279+00	t	f	66	4	\N	1	74a9398db94247f4bf8b6b1fdb1506d0
5	Global	wagtail.edit	{}	2024-07-04 16:14:45.538997+00	t	f	66	4	2	1	74a9398db94247f4bf8b6b1fdb1506d0
6	Global	wagtail.publish	{}	2024-07-04 16:14:52.044011+00	t	f	66	4	2	1	74a9398db94247f4bf8b6b1fdb1506d0
7	El camino de los Dioses	wagtail.create	{}	2024-07-04 19:44:06.486454+00	t	f	42	5	\N	1	4766442144d04c25a8da029b2db99216
8	El camino de los Dioses	wagtail.edit	{}	2024-07-04 19:44:14.562482+00	t	f	42	5	3	1	4766442144d04c25a8da029b2db99216
9	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:10:24.35754+00	t	f	42	5	4	1	1eb995b1930d4529913879348fc25333
10	El camino de los Dioses	wagtail.publish	{}	2024-07-04 21:10:35.605228+00	f	f	42	5	4	1	1eb995b1930d4529913879348fc25333
11	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:13:37.478565+00	t	f	42	5	5	1	691bc6cd058749eb8cd6bdef47fb081f
12	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:15:25.261273+00	t	f	42	5	6	1	515156f3eba54bc786aaf55d31c7b335
13	El camino de los Dioses	wagtail.publish	{}	2024-07-04 21:15:38.266079+00	f	f	42	5	6	1	515156f3eba54bc786aaf55d31c7b335
14	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:19:26.670531+00	t	f	42	5	7	1	ab5a1dc32b3c4300b9ccd98bd14a986d
15	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:20:03.853796+00	t	f	42	5	8	1	a81a630189a44e97984361f92e2da852
16	El camino de los Dioses	wagtail.publish	{}	2024-07-04 21:20:15.116402+00	f	f	42	5	8	1	a81a630189a44e97984361f92e2da852
17	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:27:11.832671+00	t	f	42	5	9	1	53d2e27151f041298c5107de30e23033
18	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:27:48.774577+00	t	f	42	5	10	1	7cdedf8a93ec44299778ce21e34ab8f1
19	El camino de los Dioses	wagtail.publish	{}	2024-07-04 21:28:00.568534+00	f	f	42	5	10	1	7cdedf8a93ec44299778ce21e34ab8f1
20	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:47:17.646621+00	t	f	42	5	11	1	027eedcf32e648469fb5fe4044ca9c8f
21	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:47:49.882242+00	t	f	42	5	12	1	cd9cf8b999d74d56be8aa670b78ae76a
22	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:53:40.107054+00	t	f	42	5	13	1	8543bcc13b81445da05ce787d8f12121
23	El camino de los Dioses	wagtail.edit	{}	2024-07-04 21:54:17.648487+00	t	f	42	5	14	1	2d34ebf2f8884f67b727324f9de3e62e
24	El camino de los Dioses	wagtail.edit	{}	2024-07-04 22:11:51.174672+00	t	f	42	5	15	1	74b28f6f3cbc49709ecd4929a368d032
25	El camino de los Dioses	wagtail.edit	{}	2024-07-04 22:15:08.93476+00	t	f	42	5	16	1	ea17bc0e10074fc0b29f8b13650784d3
26	El camino de los Dioses	wagtail.publish	{}	2024-07-04 22:15:20.362651+00	t	f	42	5	16	1	ea17bc0e10074fc0b29f8b13650784d3
27	El camino de los Dioses	wagtail.edit	{}	2024-07-04 22:24:56.623243+00	t	f	42	5	17	1	5ef96adf6a30495dacf992854f9824ca
28	El camino de los Dioses	wagtail.edit	{}	2024-07-04 22:27:21.037985+00	t	f	42	5	18	1	f281893c068f460b9a0d611994bbd4d3
29	El camino de los Dioses	wagtail.publish	{}	2024-07-04 22:27:36.595479+00	t	f	42	5	18	1	f281893c068f460b9a0d611994bbd4d3
30	El camino de los Dioses	wagtail.edit	{}	2024-07-04 22:31:22.11514+00	t	f	42	5	19	1	b0e0eff1fae04f05bfee1a979bb022e6
31	El camino de los Dioses	wagtail.edit	{}	2024-07-04 23:00:34.502215+00	t	f	42	5	20	1	9b6e94ee84604262b00887d6e6b33e28
32	El camino de los Dioses	wagtail.edit	{}	2024-07-05 14:35:14.72213+00	t	f	42	5	21	1	aa4debad16614af1974744a10dab430f
33	El camino de los Dioses	wagtail.edit	{}	2024-07-05 14:38:43.435955+00	t	f	42	5	22	1	ae5a8a2642ea486685789fc99c38b054
34	El camino de los Dioses	wagtail.edit	{}	2024-07-05 14:43:50.466455+00	t	f	42	5	23	1	408a86f1c60f4cd5ba33cea8e7aa2eef
35	El camino de los Dioses	wagtail.edit	{}	2024-07-05 14:44:33.573054+00	t	f	42	5	24	1	ba1a3ca7be6547609f58e15c6f22d288
36	Collpa de Guacamallos	wagtail.create	{}	2024-07-05 15:50:52.680774+00	t	f	47	6	\N	1	596852ad871f479482487bd9b68aafc0
37	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 15:51:00.954312+00	t	f	47	6	25	1	596852ad871f479482487bd9b68aafc0
38	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 16:03:43.733595+00	t	f	47	6	26	1	63a6b3ecc75042e8b4b6700437ff5aac
39	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 16:08:07.960473+00	t	f	47	6	27	1	f4022688e7954115967298e2d2833094
40	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 16:09:00.211845+00	t	f	47	6	28	1	85ca9d6ed84b4799ad13f471440f7f1f
41	Collpa de Guacamallos	wagtail.publish	{}	2024-07-05 16:09:10.498793+00	t	f	47	6	28	1	85ca9d6ed84b4799ad13f471440f7f1f
42	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 16:11:56.984497+00	t	f	47	6	29	1	0408d70cc01b40699bd12dc1f786abf7
43	Collpa de Guacamallos	wagtail.publish	{}	2024-07-05 16:12:11.432696+00	t	f	47	6	29	1	0408d70cc01b40699bd12dc1f786abf7
44	Collpa de Guacamallos	wagtail.edit	{}	2024-07-05 16:16:44.843372+00	t	f	47	6	30	1	7d490490a1274e73bf22f6d18506bc03
45	Collpa de Guacamallos	wagtail.publish	{}	2024-07-05 16:16:57.425924+00	t	f	47	6	30	1	7d490490a1274e73bf22f6d18506bc03
46	Welcome to your new Wagtail site!	wagtail.delete	{}	2024-07-05 20:47:15.190068+00	f	t	1	2	\N	1	6474211a46b64e04b5ecdb696c5627f7
47	El camino de los Dioses	wagtail.edit	{}	2024-07-05 21:11:03.334868+00	t	f	42	5	31	1	eb56e60d85df492386a69e3af0cd2f59
48	Peru Destino Seguro	wagtail.create	{}	2024-07-05 21:16:00.872814+00	t	f	28	7	\N	1	8e204fe67ddf441eac0f8e60aca7a13e
49	Peru Destino Seguro	wagtail.copy_for_translation	{"page": {"id": 7, "title": "Peru Destino Seguro", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 1, "title": "Root"}, "destination": {"id": 1, "title": "Root"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-05 21:16:02.92147+00	f	f	28	7	\N	1	8e204fe67ddf441eac0f8e60aca7a13e
50	Peru Safe Destiny	wagtail.edit	{}	2024-07-05 21:16:33.893205+00	t	f	28	7	33	1	a0809699b6d04b1cab8d892c88d934e1
51	Peru Safe Destiny	wagtail.publish	{}	2024-07-05 21:16:37.659215+00	t	f	28	7	33	1	a0809699b6d04b1cab8d892c88d934e1
52	Global	wagtail.create	{}	2024-07-05 21:17:56.709631+00	t	f	66	8	\N	1	6c1a0a0c631a477ca267247384be2e18
53	Global	wagtail.copy_for_translation	{"page": {"id": 8, "title": "Global", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 3, "title": "Peru Destino Seguro"}, "destination": {"id": 7, "title": "Peru Safe Destiny"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-05 21:17:58.765715+00	f	f	66	8	\N	1	6c1a0a0c631a477ca267247384be2e18
54	El camino de los Dioses	wagtail.create	{}	2024-07-05 21:18:05.304051+00	t	f	42	9	\N	1	6c1a0a0c631a477ca267247384be2e18
55	El camino de los Dioses	wagtail.copy_for_translation	{"page": {"id": 9, "title": "El camino de los Dioses", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 4, "title": "Global"}, "destination": {"id": 8, "title": "Global"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-05 21:18:08.076773+00	f	f	42	9	\N	1	6c1a0a0c631a477ca267247384be2e18
56	Collpa de Guacamallos	wagtail.create	{}	2024-07-05 21:18:13.98221+00	t	f	47	10	\N	1	6c1a0a0c631a477ca267247384be2e18
57	Collpa de Guacamallos	wagtail.copy_for_translation	{"page": {"id": 10, "title": "Collpa de Guacamallos", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 4, "title": "Global"}, "destination": {"id": 8, "title": "Global"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-05 21:18:16.66325+00	f	f	47	10	\N	1	6c1a0a0c631a477ca267247384be2e18
58	The roads of gods	wagtail.edit	{}	2024-07-05 21:20:41.251015+00	t	f	42	9	37	1	f4d76c1d2aa04d3b994ab7e2b05657b0
59	The roads of gods	wagtail.edit	{}	2024-07-05 22:29:46.918389+00	t	f	42	9	38	1	d2309f3e9f8d42bf8f6aea8a21a94af6
60	The roads of gods	wagtail.publish	{}	2024-07-05 22:29:53.207691+00	t	f	42	9	38	1	d2309f3e9f8d42bf8f6aea8a21a94af6
61	Nosotros	wagtail.create	{}	2024-07-10 02:02:59.273558+00	t	f	36	11	\N	1	6e92476f630346d29809814fa7ed6069
62	Nosotros	wagtail.edit	{}	2024-07-10 02:03:02.663293+00	t	f	36	11	39	1	6e92476f630346d29809814fa7ed6069
63	Nosotros	wagtail.edit	{}	2024-07-10 02:04:40.43029+00	t	f	36	11	40	1	ed139297419f459f8b3ca988eb5045d1
64	Nosotros	wagtail.publish	{}	2024-07-10 02:04:44.91394+00	f	f	36	11	40	1	ed139297419f459f8b3ca988eb5045d1
65	Nosotros	wagtail.create	{}	2024-07-10 02:06:30.459967+00	t	f	36	12	\N	1	3fa9a9e6448546daa6a57bc763740a2e
66	Nosotros	wagtail.copy_for_translation	{"page": {"id": 12, "title": "Nosotros", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 3, "title": "Peru Destino Seguro"}, "destination": {"id": 7, "title": "Peru Safe Destiny"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-10 02:06:33.279879+00	f	f	36	12	\N	1	3fa9a9e6448546daa6a57bc763740a2e
67	About Us	wagtail.edit	{}	2024-07-10 02:29:08.03617+00	t	f	36	12	42	1	402ec431f54a4a868f76b6768b9f46ad
68	About Us	wagtail.publish	{}	2024-07-10 02:29:12.900029+00	t	f	36	12	42	1	402ec431f54a4a868f76b6768b9f46ad
69	Inicios	wagtail.create	{}	2024-07-11 21:48:41.975264+00	t	f	30	13	\N	1	2e8937eb55a04e3da816de74a7e8c242
70	Inicios	wagtail.edit	{}	2024-07-11 21:48:46.783122+00	t	f	30	13	43	1	2e8937eb55a04e3da816de74a7e8c242
71	Inicios	wagtail.publish	{}	2024-07-11 21:48:54.241527+00	t	f	30	13	43	1	2e8937eb55a04e3da816de74a7e8c242
72	Collpa de Guacamallos	wagtail.edit	{}	2024-07-12 22:43:07.239728+00	t	f	47	10	44	1	7a0ad12e24af494d8b7b38a209d06f75
73	Collpa de Guacamallos	wagtail.edit	{}	2024-07-12 22:55:05.54208+00	t	f	47	10	45	1	ff5d3d02a2344d78a37a34cc60f85ecd
74	Collpa de Guacamallos	wagtail.publish	{}	2024-07-12 22:55:11.884196+00	t	f	47	10	45	1	ff5d3d02a2344d78a37a34cc60f85ecd
75	El camino de los Dioses	wagtail.edit	{}	2024-07-14 00:21:38.826802+00	t	f	42	5	46	1	eb382f9c79b641ada91320a4352c571c
76	El camino de los Dioses	wagtail.publish	{}	2024-07-14 00:21:46.298162+00	t	f	42	5	46	1	eb382f9c79b641ada91320a4352c571c
77	Inicios	wagtail.edit	{}	2024-07-14 00:23:35.723256+00	t	f	30	13	47	1	0fe5f070f81344959a250ee50a55171e
78	Inicio	wagtail.rename	{"title": {"old": "Inicios", "new": "Inicio"}}	2024-07-14 00:23:40.825457+00	f	f	30	13	47	1	0fe5f070f81344959a250ee50a55171e
79	Inicio	wagtail.publish	{"title": {"old": "Inicios", "new": "Inicio"}}	2024-07-14 00:23:41.288391+00	t	f	30	13	47	1	0fe5f070f81344959a250ee50a55171e
80	Inicio	wagtail.edit	{}	2024-07-15 14:57:30.782343+00	t	f	30	13	48	1	d40d3564ffc8401ca4691e962969df5c
81	Inicio	wagtail.publish	{}	2024-07-15 14:57:35.554537+00	t	f	30	13	48	1	d40d3564ffc8401ca4691e962969df5c
82	Collpa de Ollaytamtanbo	wagtail.create	{}	2024-07-15 22:15:09.29675+00	t	f	47	14	\N	1	0cc6fd31713b44cdb42b51e9f897262e
83	Collpa de Ollaytamtanbo	wagtail.edit	{}	2024-07-15 22:15:12.685652+00	t	f	47	14	49	1	0cc6fd31713b44cdb42b51e9f897262e
84	Collpa de Ollaytamtanbo	wagtail.publish	{}	2024-07-15 22:15:18.393768+00	t	f	47	14	49	1	0cc6fd31713b44cdb42b51e9f897262e
85	About Us	wagtail.edit	{}	2024-07-17 14:50:05.223662+00	t	f	36	12	50	1	3624f43c27d8424a9ea896dfe05926d9
86	About	wagtail.rename	{"title": {"old": "About Us", "new": "About"}}	2024-07-17 14:50:09.957338+00	f	f	36	12	50	1	3624f43c27d8424a9ea896dfe05926d9
87	About	wagtail.publish	{"title": {"old": "About Us", "new": "About"}}	2024-07-17 14:50:10.378207+00	t	f	36	12	50	1	3624f43c27d8424a9ea896dfe05926d9
88	About	wagtail.edit	{}	2024-07-17 15:22:33.571207+00	t	f	36	12	51	1	dbe141e7cb4940a89d5a9f28912120cd
89	About	wagtail.edit	{}	2024-07-17 15:23:07.665288+00	t	f	36	12	52	1	1f23ade640b84c6eb89a19afa45ebb97
90	About	wagtail.edit	{}	2024-07-17 15:23:26.54776+00	t	f	36	12	53	1	509dea012df84d8c9b436773b2484c6b
91	About	wagtail.publish	{}	2024-07-17 15:23:31.247193+00	f	f	36	12	53	1	509dea012df84d8c9b436773b2484c6b
92	Nosotros	wagtail.edit	{}	2024-07-17 18:03:38.089421+00	t	f	36	11	54	1	5f2e6272b74f4e6c8a7b0666054a6220
93	Nosotros	wagtail.publish	{}	2024-07-17 18:03:43.172508+00	t	f	36	11	54	1	5f2e6272b74f4e6c8a7b0666054a6220
94	About	wagtail.edit	{}	2024-07-17 18:07:06.653937+00	t	f	36	12	55	1	813752849d2040f5b5d536cbc2187058
95	About	wagtail.publish	{}	2024-07-17 18:07:11.89868+00	t	f	36	12	55	1	813752849d2040f5b5d536cbc2187058
96	Inicio	wagtail.edit	{}	2024-07-17 21:57:49.332013+00	t	f	30	13	56	1	6a5a4570e7294e97aaaa371de0d61daf
97	Inicio	wagtail.publish	{}	2024-07-17 21:57:57.992675+00	t	f	30	13	56	1	6a5a4570e7294e97aaaa371de0d61daf
98	Inicio	wagtail.edit	{}	2024-07-17 22:15:42.603405+00	t	f	30	13	57	1	86adadf73b894d429bac6646e3a70a9b
99	Inicio	wagtail.publish	{}	2024-07-17 22:15:47.749167+00	t	f	30	13	57	1	86adadf73b894d429bac6646e3a70a9b
100	Inicio	wagtail.create	{}	2024-07-18 21:54:19.135714+00	t	f	30	15	\N	1	1e9cf19a556b4ea59124eabd419d40e1
101	Inicio	wagtail.copy_for_translation	{"page": {"id": 15, "title": "Inicio", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 3, "title": "Peru Destino Seguro"}, "destination": {"id": 7, "title": "Peru Safe Destiny"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-18 21:54:21.408909+00	f	f	30	15	\N	1	1e9cf19a556b4ea59124eabd419d40e1
102	Home	wagtail.edit	{}	2024-07-18 21:56:20.320149+00	t	f	30	15	59	1	83d134d332424628954bfaf911b97690
103	Home	wagtail.publish	{}	2024-07-18 21:56:25.135846+00	t	f	30	15	59	1	83d134d332424628954bfaf911b97690
104	Inicio	wagtail.edit	{}	2024-07-18 21:58:02.354937+00	t	f	30	13	60	1	5b26af226d304de68607c777fb68507a
105	Inicio	wagtail.publish	{}	2024-07-18 21:58:07.111501+00	t	f	30	13	60	1	5b26af226d304de68607c777fb68507a
106	Nosotros	wagtail.edit	{}	2024-07-19 22:45:01.055961+00	t	f	36	11	61	1	0cc29c6fb20941c4adf88f23e389a850
107	Nosotros	wagtail.publish	{}	2024-07-19 22:45:06.547397+00	t	f	36	11	61	1	0cc29c6fb20941c4adf88f23e389a850
108	About	wagtail.edit	{}	2024-07-19 22:49:26.10602+00	t	f	36	12	62	1	0472350c605a48e5a421b87e4cd3da5d
109	About	wagtail.publish	{}	2024-07-19 22:49:31.214175+00	t	f	36	12	62	1	0472350c605a48e5a421b87e4cd3da5d
110	Nosotros	wagtail.edit	{}	2024-07-20 21:18:58.081616+00	t	f	36	11	63	1	729cac8b5c8a47afbfac3ae0aa21dd8c
111	Nosotros	wagtail.publish	{}	2024-07-20 21:19:03.548032+00	t	f	36	11	63	1	729cac8b5c8a47afbfac3ae0aa21dd8c
112	Contactar	wagtail.create	{}	2024-07-20 23:40:39.637944+00	t	f	67	16	\N	1	e6552739041b493e967e142942252981
113	Contactar	wagtail.edit	{}	2024-07-20 23:40:42.445887+00	t	f	67	16	64	1	e6552739041b493e967e142942252981
114	Contactar	wagtail.publish	{}	2024-07-20 23:40:46.439633+00	t	f	67	16	64	1	e6552739041b493e967e142942252981
115	Contactar	wagtail.create	{}	2024-07-20 23:44:39.580045+00	t	f	67	17	\N	1	0befa2d570084e5ba8aef622e5f38268
116	Contactar	wagtail.copy_for_translation	{"page": {"id": 17, "title": "Contactar", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 3, "title": "Peru Destino Seguro"}, "destination": {"id": 7, "title": "Peru Safe Destiny"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-20 23:44:41.521628+00	f	f	67	17	\N	1	0befa2d570084e5ba8aef622e5f38268
117	Contact	wagtail.edit	{}	2024-07-20 23:46:33.450787+00	t	f	67	17	66	1	97a96524ba384c459e333bfd522b7843
118	Contact	wagtail.publish	{}	2024-07-20 23:46:37.536346+00	t	f	67	17	66	1	97a96524ba384c459e333bfd522b7843
119	Nosotros	wagtail.edit	{}	2024-07-22 20:51:14.088035+00	t	f	36	11	67	1	77ecb0d2e23741b782b10894413ed299
120	Nosotros	wagtail.publish	{}	2024-07-22 20:51:24.439303+00	t	f	36	11	67	1	77ecb0d2e23741b782b10894413ed299
121	Nosotros	wagtail.edit	{}	2024-07-22 22:31:28.604636+00	t	f	36	11	68	1	8420730416d24b6582e74924f99259da
122	Nosotros	wagtail.publish	{}	2024-07-22 22:31:42.939844+00	t	f	36	11	68	1	8420730416d24b6582e74924f99259da
123	Peru 12Días  11Noches	wagtail.create	{}	2024-07-23 16:36:10.133159+00	t	f	42	18	\N	2	854dff0c23464d55a3f0d0c9d2928cb3
124	Peru 12Días  11Noches	wagtail.edit	{}	2024-07-23 16:36:13.609038+00	t	f	42	18	69	2	854dff0c23464d55a3f0d0c9d2928cb3
125	Peru 12Días  11Noches	wagtail.publish	{}	2024-07-23 16:36:22.128627+00	t	f	42	18	69	2	854dff0c23464d55a3f0d0c9d2928cb3
126	Peru 12Días  11Noches	wagtail.create	{}	2024-07-23 22:49:12.505057+00	t	f	42	19	\N	2	edf2ec071545440dab761dbf8bbc9a60
127	Peru 12Días  11Noches	wagtail.copy_for_translation	{"page": {"id": 19, "title": "Peru 12D\\u00edas  11Noches", "locale": {"id": 2, "language_code": "en"}}, "source": {"id": 4, "title": "Global"}, "destination": {"id": 8, "title": "Global"}, "keep_live": false, "source_locale": {"id": 1, "language_code": "es"}}	2024-07-23 22:49:17.835678+00	f	f	42	19	\N	1	edf2ec071545440dab761dbf8bbc9a60
128	Peru 12 days 11 nights	wagtail.edit	{}	2024-07-23 22:53:17.166032+00	t	f	42	19	71	1	35b9f53eb2a7470f80d75fe3f9bb190c
129	Peru 12 days 11 nights	wagtail.publish	{}	2024-07-23 22:53:33.367386+00	t	f	42	19	71	1	35b9f53eb2a7470f80d75fe3f9bb190c
130	Peru 12 days 11 nights	wagtail.edit	{}	2024-07-23 22:59:39.895279+00	t	f	42	19	72	1	a3ad9c4a1ccc4711adb1366b5caed89a
131	Peru 12 days 11 nights ga	wagtail.rename	{"title": {"old": "Peru 12 days 11 nights", "new": "Peru 12 days 11 nights ga"}}	2024-07-23 22:59:56.603277+00	f	f	42	19	72	1	a3ad9c4a1ccc4711adb1366b5caed89a
132	Peru 12 days 11 nights ga	wagtail.publish	{"title": {"old": "Peru 12 days 11 nights", "new": "Peru 12 days 11 nights ga"}}	2024-07-23 22:59:57.362475+00	t	f	42	19	72	1	a3ad9c4a1ccc4711adb1366b5caed89a
133	Peru 12Días  11Noches	wagtail.edit	{}	2024-07-24 14:23:08.942962+00	t	f	42	18	73	1	de3425a9d1534f1f84e7531b7cf7c8c8
134	Peru 12Días  11Nochesoo	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noches", "new": "Peru 12D\\u00edas  11Nochesoo"}}	2024-07-24 14:23:24.881055+00	f	f	42	18	73	1	de3425a9d1534f1f84e7531b7cf7c8c8
135	Peru 12Días  11Nochesoo	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noches", "new": "Peru 12D\\u00edas  11Nochesoo"}}	2024-07-24 14:23:25.642815+00	t	f	42	18	73	1	de3425a9d1534f1f84e7531b7cf7c8c8
136	Peru 12Días  11Nochesoo	wagtail.edit	{}	2024-07-24 14:25:56.176934+00	t	f	42	18	74	1	93629dc2de284e319a6bbd8349e5fcbc
137	Peru 12Días  11Noche	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Nochesoo", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 14:26:12.731172+00	f	f	42	18	74	1	93629dc2de284e319a6bbd8349e5fcbc
138	Peru 12Días  11Noche	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Nochesoo", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 14:26:13.578245+00	t	f	42	18	74	1	93629dc2de284e319a6bbd8349e5fcbc
139	Peru 12Días  11Noche	wagtail.edit	{}	2024-07-24 14:30:18.262802+00	t	f	42	18	75	1	0327c4212fa348b2a24937ca86b36faf
140	Peru 12Días  11Noctthe	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11Noctthe"}}	2024-07-24 14:30:34.057201+00	f	f	42	18	75	1	0327c4212fa348b2a24937ca86b36faf
141	Peru 12Días  11Noctthe	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11Noctthe"}}	2024-07-24 14:30:34.799653+00	t	f	42	18	75	1	0327c4212fa348b2a24937ca86b36faf
142	Peru 12Días  11Noctthe	wagtail.edit	{}	2024-07-24 14:35:52.54649+00	t	f	42	18	76	1	ac8eb8a945034d1b92111fc2cec63662
143	Peru 12Días  11Noche	wagtail.edit	{}	2024-07-24 14:36:36.590193+00	t	f	42	18	77	1	469fa8ef0aee4911b446d4ceeb1ad0c6
144	Peru 12Días  11Noche	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noctthe", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 14:36:52.712701+00	f	f	42	18	77	1	469fa8ef0aee4911b446d4ceeb1ad0c6
145	Peru 12Días  11Noche	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noctthe", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 14:36:53.426182+00	t	f	42	18	77	1	469fa8ef0aee4911b446d4ceeb1ad0c6
146	Peru 12Días  11Noche	wagtail.edit	{}	2024-07-24 14:39:25.051847+00	t	f	42	18	78	1	fc10394240ea409eaa0578f705c8376e
147	Peru 12Días  11Nochen	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11Nochen"}}	2024-07-24 14:39:43.887963+00	f	f	42	18	78	1	fc10394240ea409eaa0578f705c8376e
148	Peru 12Días  11Nochen	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11Nochen"}}	2024-07-24 14:39:44.704699+00	t	f	42	18	78	1	fc10394240ea409eaa0578f705c8376e
149	Peru 12 days 11 nights ga	wagtail.edit	{}	2024-07-24 16:23:54.761595+00	t	f	42	19	79	1	f8433da82b79406d858a2f5ce5f5caa7
150	Peru 12 days 11 nights	wagtail.rename	{"title": {"old": "Peru 12 days 11 nights ga", "new": "Peru 12 days 11 nights"}}	2024-07-24 16:24:11.475562+00	f	f	42	19	79	1	f8433da82b79406d858a2f5ce5f5caa7
151	Peru 12 days 11 nights	wagtail.publish	{"title": {"old": "Peru 12 days 11 nights ga", "new": "Peru 12 days 11 nights"}}	2024-07-24 16:24:12.221284+00	t	f	42	19	79	1	f8433da82b79406d858a2f5ce5f5caa7
152	Peru 12Días  11Nochen	wagtail.edit	{}	2024-07-24 19:47:25.117011+00	t	f	42	18	80	1	5cb65881ae784f5b8c94134f3d7a218b
153	Peru 12Días  11Noche	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Nochen", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 19:47:42.658831+00	f	f	42	18	80	1	5cb65881ae784f5b8c94134f3d7a218b
154	Peru 12Días  11Noche	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Nochen", "new": "Peru 12D\\u00edas  11Noche"}}	2024-07-24 19:47:43.43778+00	t	f	42	18	80	1	5cb65881ae784f5b8c94134f3d7a218b
155	Peru 12Días  11Noche	wagtail.edit	{}	2024-07-24 19:55:30.247508+00	t	f	42	18	81	1	d3c1e99eafef4f7ba64c58f0760bcca1
156	Peru 12Días  11NocheMM	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11NocheMM"}}	2024-07-24 19:55:49.311141+00	f	f	42	18	81	1	d3c1e99eafef4f7ba64c58f0760bcca1
157	Peru 12Días  11NocheMM	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noche", "new": "Peru 12D\\u00edas  11NocheMM"}}	2024-07-24 19:55:50.105691+00	t	f	42	18	81	1	d3c1e99eafef4f7ba64c58f0760bcca1
158	Peru 12Días  11NocheMM	wagtail.edit	{}	2024-07-24 20:00:12.182753+00	t	f	42	18	82	1	d1c3e1ac1227460c981b85cfddeccd7b
159	Peru 12Días  11Nochtt	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11NocheMM", "new": "Peru 12D\\u00edas  11Nochtt"}}	2024-07-24 20:00:30.484194+00	f	f	42	18	82	1	d1c3e1ac1227460c981b85cfddeccd7b
160	Peru 12Días  11Nochtt	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11NocheMM", "new": "Peru 12D\\u00edas  11Nochtt"}}	2024-07-24 20:00:31.300295+00	t	f	42	18	82	1	d1c3e1ac1227460c981b85cfddeccd7b
161	Peru 12Días  11Nochtt	wagtail.edit	{}	2024-07-24 20:15:08.100718+00	t	f	42	18	83	1	eee726ec734a4bf1a3fd607da37fbe5b
162	Peru 12Días  11Nocheee	wagtail.edit	{}	2024-07-24 20:18:43.346078+00	t	f	42	18	84	1	41fa5b9ccb4248ffbaad3365a6c00779
163	Peru 12Días  11Noch	wagtail.edit	{}	2024-07-24 20:22:13.33875+00	t	f	42	18	85	1	d0644c70fff042499fb0099d2a30b33a
164	Peru 12Días  11Nocha	wagtail.edit	{}	2024-07-24 20:25:05.679711+00	t	f	42	18	86	1	5f4292d9677d451096178144e709b5aa
165	Peru 12Días  11Nochad	wagtail.edit	{}	2024-07-24 20:27:22.289998+00	t	f	42	18	87	1	137f15a75c9c4b0f8cb016976a6c4651
166	Peru 12Días  11NochadT	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Nochad", "new": "Peru 12D\\u00edas  11NochadT"}}	2024-07-24 20:27:39.438814+00	f	f	42	18	87	1	137f15a75c9c4b0f8cb016976a6c4651
167	Peru 12Días  11NochadT	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Nochad", "new": "Peru 12D\\u00edas  11NochadT"}}	2024-07-24 20:27:40.189721+00	t	f	42	18	87	1	137f15a75c9c4b0f8cb016976a6c4651
168	Peru 12Días  11NochadT	wagtail.edit	{}	2024-07-24 20:38:18.670325+00	t	f	42	18	88	1	217410d14ec6458a89b304dda73a4c75
169	Peru 12Días  11Noc	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11NochadT", "new": "Peru 12D\\u00edas  11Noc"}}	2024-07-24 20:38:30.327985+00	f	f	42	18	88	1	217410d14ec6458a89b304dda73a4c75
170	Peru 12Días  11Noc	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11NochadT", "new": "Peru 12D\\u00edas  11Noc"}}	2024-07-24 20:38:30.760832+00	t	f	42	18	88	1	217410d14ec6458a89b304dda73a4c75
171	Collpa de Guacamallos	wagtail.edit	{}	2024-07-24 20:51:39.07678+00	t	f	47	6	89	1	3aeb63b0813b4170aec5552838787bad
172	Collpa de GuacamallosCGG	wagtail.rename	{"title": {"old": "Collpa de Guacamallos", "new": "Collpa de GuacamallosCGG"}}	2024-07-24 20:51:50.355301+00	f	f	47	6	89	1	3aeb63b0813b4170aec5552838787bad
173	Collpa de GuacamallosCGG	wagtail.publish	{"title": {"old": "Collpa de Guacamallos", "new": "Collpa de GuacamallosCGG"}}	2024-07-24 20:51:51.14547+00	t	f	47	6	89	1	3aeb63b0813b4170aec5552838787bad
174	Collpa de GuacamallosCGG	wagtail.edit	{}	2024-07-24 20:53:45.018145+00	t	f	47	6	90	1	eac60e435e7a4010ae7954c352b3ba16
175	Collpa de Guacamall	wagtail.rename	{"title": {"old": "Collpa de GuacamallosCGG", "new": "Collpa de Guacamall"}}	2024-07-24 20:53:56.032621+00	f	f	47	6	90	1	eac60e435e7a4010ae7954c352b3ba16
176	Collpa de Guacamall	wagtail.publish	{"title": {"old": "Collpa de GuacamallosCGG", "new": "Collpa de Guacamall"}}	2024-07-24 20:53:56.806582+00	t	f	47	6	90	1	eac60e435e7a4010ae7954c352b3ba16
177	Collpa de Guacamall	wagtail.edit	{}	2024-07-24 20:55:27.532654+00	t	f	47	6	91	1	c1282f11a30e4ca9806d78db5fab4fb8
178	Collpa de Guacamallaa	wagtail.rename	{"title": {"old": "Collpa de Guacamall", "new": "Collpa de Guacamallaa"}}	2024-07-24 20:55:38.850689+00	f	f	47	6	91	1	c1282f11a30e4ca9806d78db5fab4fb8
179	Collpa de Guacamallaa	wagtail.publish	{"title": {"old": "Collpa de Guacamall", "new": "Collpa de Guacamallaa"}}	2024-07-24 20:55:39.634616+00	t	f	47	6	91	1	c1282f11a30e4ca9806d78db5fab4fb8
180	Collpa de Guacamallaa	wagtail.edit	{}	2024-07-24 21:06:35.017774+00	t	f	47	6	92	1	97aeea6258a24bce8c016af39271497c
181	Collpa de Guacamall	wagtail.rename	{"title": {"old": "Collpa de Guacamallaa", "new": "Collpa de Guacamall"}}	2024-07-24 21:06:47.426257+00	f	f	47	6	92	1	97aeea6258a24bce8c016af39271497c
182	Collpa de Guacamall	wagtail.publish	{"title": {"old": "Collpa de Guacamallaa", "new": "Collpa de Guacamall"}}	2024-07-24 21:06:48.139996+00	t	f	47	6	92	1	97aeea6258a24bce8c016af39271497c
183	Collpa de Ollaytamtanbo	wagtail.edit	{}	2024-07-24 21:14:55.337467+00	t	f	47	14	93	1	2620eb23a760423d91752daec1a2e7b2
184	Collpa de Manu	wagtail.rename	{"title": {"old": "Collpa de Ollaytamtanbo", "new": "Collpa de Manu"}}	2024-07-24 21:15:03.22672+00	f	f	47	14	93	1	2620eb23a760423d91752daec1a2e7b2
185	Collpa de Manu	wagtail.publish	{"title": {"old": "Collpa de Ollaytamtanbo", "new": "Collpa de Manu"}}	2024-07-24 21:15:03.678761+00	t	f	47	14	93	1	2620eb23a760423d91752daec1a2e7b2
186	Collpa de Guacamall	wagtail.edit	{}	2024-07-24 21:16:39.470654+00	t	f	47	6	94	1	90f31b2669444e24b668d646ae5bd4cb
187	Collpa de Guacamallaa	wagtail.rename	{"title": {"old": "Collpa de Guacamall", "new": "Collpa de Guacamallaa"}}	2024-07-24 21:16:46.212194+00	f	f	47	6	94	1	90f31b2669444e24b668d646ae5bd4cb
188	Collpa de Guacamallaa	wagtail.publish	{"title": {"old": "Collpa de Guacamall", "new": "Collpa de Guacamallaa"}}	2024-07-24 21:16:46.642968+00	t	f	47	6	94	1	90f31b2669444e24b668d646ae5bd4cb
189	Collpa de Guacamallaa	wagtail.edit	{}	2024-07-24 21:26:25.963789+00	t	f	47	6	95	1	8ad18ca22f9449fe9813791a837d4ad2
190	Collpa de Guacamallee	wagtail.rename	{"title": {"old": "Collpa de Guacamallaa", "new": "Collpa de Guacamallee"}}	2024-07-24 21:26:32.91256+00	f	f	47	6	95	1	8ad18ca22f9449fe9813791a837d4ad2
191	Collpa de Guacamallee	wagtail.publish	{"title": {"old": "Collpa de Guacamallaa", "new": "Collpa de Guacamallee"}}	2024-07-24 21:26:33.333738+00	t	f	47	6	95	1	8ad18ca22f9449fe9813791a837d4ad2
192	Collpa de Guacamallee	wagtail.edit	{}	2024-07-24 21:31:17.02+00	t	f	47	6	96	1	3ed540b7e55c4c1e810cb33c03afb902
193	Collpa de Guacamalleae	wagtail.rename	{"title": {"old": "Collpa de Guacamallee", "new": "Collpa de Guacamalleae"}}	2024-07-24 21:31:24.119547+00	f	f	47	6	96	1	3ed540b7e55c4c1e810cb33c03afb902
194	Collpa de Guacamalleae	wagtail.publish	{"title": {"old": "Collpa de Guacamallee", "new": "Collpa de Guacamalleae"}}	2024-07-24 21:31:24.548287+00	t	f	47	6	96	1	3ed540b7e55c4c1e810cb33c03afb902
195	Peru 12Días  11Noc	wagtail.edit	{}	2024-07-24 21:44:31.67783+00	t	f	42	18	97	3	f147bbf3ef544ba0ba78cf858f80a982
196	Peru 12Días  doris	wagtail.edit	{}	2024-07-24 21:45:29.901342+00	t	f	42	18	98	3	892f62cb06a7466f83270b78c513f2f0
197	Peru 12Días  doris	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  11Noc", "new": "Peru 12D\\u00edas  doris"}}	2024-07-24 21:45:39.185884+00	f	f	42	18	98	3	892f62cb06a7466f83270b78c513f2f0
198	Peru 12Días  doris	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  11Noc", "new": "Peru 12D\\u00edas  doris"}}	2024-07-24 21:45:39.614772+00	t	f	42	18	98	3	892f62cb06a7466f83270b78c513f2f0
199	Peru 12Días  doris	wagtail.edit	{}	2024-07-24 22:12:09.68938+00	t	f	42	18	99	3	746381d6e7bf444d9a03cd86b7acbc5d
200	PERÚ 10 DIAS 9 NOCHES	wagtail.edit	{}	2024-07-24 23:02:22.82339+00	t	f	42	18	100	3	4e549abdf59f4ab1beda623d1e35bb08
201	PERÚ 10 DIAS 9 NOCHES	wagtail.edit	{}	2024-07-24 23:06:16.495344+00	t	f	42	18	101	3	6fe7e6c4387a4d1692143d3f43ab4f2d
202	PERÚ 10 DIAS 9 NOCHES	wagtail.rename	{"title": {"old": "Peru 12D\\u00edas  doris", "new": "PER\\u00da 10 DIAS 9 NOCHES"}}	2024-07-24 23:06:36.188807+00	f	f	42	18	101	3	6fe7e6c4387a4d1692143d3f43ab4f2d
203	PERÚ 10 DIAS 9 NOCHES	wagtail.publish	{"title": {"old": "Peru 12D\\u00edas  doris", "new": "PER\\u00da 10 DIAS 9 NOCHES"}}	2024-07-24 23:06:36.640574+00	t	f	42	18	101	3	6fe7e6c4387a4d1692143d3f43ab4f2d
204	El camino de los Dioses	wagtail.edit	{}	2024-07-24 23:45:35.286279+00	t	f	42	5	102	3	97fa2a2c4e554fa7897476017fba4d76
205	PERÚ 10 DIAS 9 NOCHES	wagtail.edit	{}	2024-07-24 23:46:58.180015+00	t	f	42	18	103	3	44752ae2f03647f4b7692654c032759f
206	PERÚ 8 DIAS 7 NOCHES	wagtail.edit	{}	2024-07-24 23:52:36.346728+00	t	f	42	5	104	3	604f9c3ea05c44c783b7a2de415cabba
207	PERÚ 8 DIAS 7 NOCHES	wagtail.edit	{}	2024-07-24 23:53:01.094462+00	t	f	42	5	105	3	120904be5a5344a197b2b8b04ec5626b
208	PERÚ 8 DIAS 7 NOCHES	wagtail.rename	{"title": {"old": "El camino de los Dioses", "new": "PER\\u00da 8 DIAS 7 NOCHES"}}	2024-07-24 23:53:17.779629+00	f	f	42	5	105	3	120904be5a5344a197b2b8b04ec5626b
209	PERÚ 8 DIAS 7 NOCHES	wagtail.publish	{"title": {"old": "El camino de los Dioses", "new": "PER\\u00da 8 DIAS 7 NOCHES"}}	2024-07-24 23:53:18.23889+00	t	f	42	5	105	3	120904be5a5344a197b2b8b04ec5626b
210	PERÚ 12 DIAS 11 NOCHES	wagtail.create	{}	2024-07-25 00:03:59.322314+00	t	f	42	20	\N	3	056e62cee2c4493aa6525520f9b7d48d
211	PERÚ 12 DIAS 11 NOCHES	wagtail.edit	{}	2024-07-25 00:04:02.785443+00	t	f	42	20	106	3	056e62cee2c4493aa6525520f9b7d48d
212	Peru 12 days 11 nights	wagtail.edit	{}	2024-07-25 15:58:21.384068+00	t	f	42	19	107	1	f15271d644fe4176bffd0b638e2592e3
213	Peru 12 days 11 nights	wagtail.publish	{}	2024-07-25 15:58:31.730448+00	t	f	42	19	107	1	f15271d644fe4176bffd0b638e2592e3
214	PERÚ 10 DIAS 9 NOCHES	wagtail.edit	{}	2024-07-25 19:25:57.359553+00	t	f	42	18	108	1	f76fbad5831541e2bf63244fa272bc4d
215	PERÚ 10 DIAS 9 NOCHES	wagtail.publish	{}	2024-07-25 19:26:17.474874+00	t	f	42	18	108	1	f76fbad5831541e2bf63244fa272bc4d
216	PERÚ 12 DIAS 11 NOCHES	wagtail.edit	{}	2024-07-25 21:23:00.07313+00	t	f	42	20	109	3	c5fe61433f5b46d1b5ad1b1a95b506ca
217	Peru 12 days 11 nights	wagtail.edit	{}	2024-07-26 16:39:52.978279+00	t	f	42	19	110	1	1a3e4fbbdef2428cbbf2c23c3266b966
218	Peru 12 days 11 nights	wagtail.publish	{}	2024-07-26 16:40:08.232504+00	t	f	42	19	110	1	1a3e4fbbdef2428cbbf2c23c3266b966
219	PERÚ 10 DIAS 9 NOCHES	wagtail.edit	{}	2024-07-26 16:54:57.727684+00	t	f	42	18	111	1	f6d1603dc1f645ecb1c2b26d021964bc
220	PERÚ 10 DIAS 9 NOCHES	wagtail.publish	{}	2024-07-26 16:55:32.053921+00	t	f	42	18	111	1	f6d1603dc1f645ecb1c2b26d021964bc
221	Inicio	wagtail.edit	{}	2024-07-29 21:25:55.931628+00	t	f	30	13	112	1	b8a7bc0b46fb4ae5b62edff9dd1d6f18
222	Inicio	wagtail.publish	{}	2024-07-29 21:26:04.466651+00	t	f	30	13	112	1	b8a7bc0b46fb4ae5b62edff9dd1d6f18
\.


--
-- Data for Name: wagtailcore_pagesubscription; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_pagesubscription (id, comment_notifications, page_id, user_id) FROM stdin;
1	t	3	1
2	t	4	1
3	t	5	1
4	t	6	1
5	f	7	1
6	f	8	1
7	f	9	1
8	t	11	1
9	f	12	1
10	t	13	1
11	f	10	1
12	t	14	1
13	f	15	1
14	t	16	1
15	f	17	1
16	t	18	2
17	f	10	2
18	f	6	2
19	f	13	2
20	f	15	2
21	f	18	4
22	f	14	4
23	f	14	3
24	f	13	3
25	f	18	1
26	f	19	1
27	f	18	3
28	f	19	3
29	f	5	3
30	t	20	3
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_referenceindex; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_referenceindex (id, object_id, to_object_id, model_path, content_path, content_path_hash, base_content_type_id, content_type_id, to_content_type_id) FROM stdin;
1	1	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
2	2	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
7	5	1	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	42	32
8	6	2	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	47	32
9	6	1	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	47	32
10	1	2	backgroundMobile	backgroundMobile	75ec0f09b4d05e0e9a17c79c26a89ed2	33	33	32
12	6	1	tourDestino	tourDestino	8ec2f6a570f75083b662748bee197af4	1	47	33
13	6	1	galleryTour.item.image	galleryTour.1.image	bcfa9319287f5b6b80ddafd5ede423fc	1	47	32
14	9	1	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	42	32
15	9	2	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	42	32
17	9	1	galleryPaquete.item.image	galleryPaquete.2.image	648ab6eebd9557818936b668433bc3a2	1	42	32
19	10	1	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	47	32
20	10	2	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	47	32
21	10	1	tourDestino	tourDestino	8ec2f6a570f75083b662748bee197af4	1	47	33
22	10	1	galleryTour.item.image	galleryTour.2.image	9fabf518f5c05f9399cdaceaaadcdee8	1	47	32
23	3	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
29	13	1	galleryIni.Tipo2.photo	galleryIni.c4f7ff8e-c065-41da-852b-4f0246055475.photo	100d59cc6f3f534786be0a46eaed045f	1	30	32
31	2	2	backgroundMobile	backgroundMobile	75ec0f09b4d05e0e9a17c79c26a89ed2	33	33	32
32	4	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
33	1	4	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	33	33	32
34	5	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
35	2	5	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	33	33	32
36	6	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
37	3	6	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	33	33	32
38	3	2	backgroundMobile	backgroundMobile	75ec0f09b4d05e0e9a17c79c26a89ed2	33	33	32
39	7	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
40	4	7	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	33	33	32
41	4	2	backgroundMobile	backgroundMobile	75ec0f09b4d05e0e9a17c79c26a89ed2	33	33	32
42	8	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
43	5	8	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	33	33	32
44	5	2	backgroundMobile	backgroundMobile	75ec0f09b4d05e0e9a17c79c26a89ed2	33	33	32
45	9	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
47	10	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
49	14	2	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	47	32
51	14	2	tourDestino	tourDestino	8ec2f6a570f75083b662748bee197af4	1	47	33
52	14	9	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	47	32
53	14	2	galleryTour.item.image	galleryTour.3.image	1fa4b8a9833b5017a87741226efbbb74	1	47	32
54	11	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
55	12	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
56	11	11	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	36	32
57	11	12	imageParrafo	imageParrafo	f8311bdfdedd56859c85364c03a5c949	1	36	32
58	12	11	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	36	32
59	12	12	imageParrafo	imageParrafo	f8311bdfdedd56859c85364c03a5c949	1	36	32
60	13	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
61	14	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
62	15	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
63	13	14	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.ac653cb6-8ebc-4d38-957b-e30c194b726c	22c5690f6c815e96b7f63edf613403d3	1	30	32
64	13	13	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.d0907c6b-a729-4408-bbc2-397646c664a1	0817555f13195c0fa10c79706d19fcea	1	30	32
65	13	15	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.7d6839e5-b13f-4db8-8aea-9957c3cf88e5	49c4b8c68ada5922af8fcd45012942db	1	30	32
66	15	1	galleryIni.Tipo2.photo	galleryIni.c4f7ff8e-c065-41da-852b-4f0246055475.photo	100d59cc6f3f534786be0a46eaed045f	1	30	32
67	15	14	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.ac653cb6-8ebc-4d38-957b-e30c194b726c	22c5690f6c815e96b7f63edf613403d3	1	30	32
68	15	15	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.7d6839e5-b13f-4db8-8aea-9957c3cf88e5	49c4b8c68ada5922af8fcd45012942db	1	30	32
69	15	10	galleryIni.Tipo1.photo	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.photo	f1751e2c85295f4ebf110bff2d2afc8c	1	30	32
70	15	13	galleryIni.Tipo1.miniPhotos.item	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.d0907c6b-a729-4408-bbc2-397646c664a1	0817555f13195c0fa10c79706d19fcea	1	30	32
71	16	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
72	16	16	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	67	32
73	17	16	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	67	32
74	17	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
75	18	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
76	19	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
77	20	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
78	21	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
84	11	17	partnersNosotros.item.image	partnersNosotros.1.image	da7c1d8b7b075cc3b758eb342efe7cae	1	36	32
85	11	18	partnersNosotros.item.image	partnersNosotros.2.image	74b01f62e50f517a88519e1e2f4b9636	1	36	32
86	11	19	partnersNosotros.item.image	partnersNosotros.3.image	34a969c3a898574caec7e6e0771978f3	1	36	32
87	11	20	partnersNosotros.item.image	partnersNosotros.4.image	c32cb89000395c53aacd394c34f6f869	1	36	32
88	11	21	partnersNosotros.item.image	partnersNosotros.5.image	9e8f82539f8e5fda951d288fd4735ec3	1	36	32
89	22	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
90	23	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
91	24	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
92	25	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
93	26	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
94	27	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
101	11	22	valoresNosotros.item.img	valoresNosotros.1.img	bd0ea6d5a938509eab69366466d54af8	1	36	32
102	11	23	valoresNosotros.item.img	valoresNosotros.2.img	673ee85f065e5b499734d3b0621fffec	1	36	32
103	11	24	valoresNosotros.item.img	valoresNosotros.3.img	42e6b49b1427527f8242b617fb2bda4a	1	36	32
104	11	25	valoresNosotros.item.img	valoresNosotros.4.img	fc1c7d0b47ef5ff6865efde72fc1fd0c	1	36	32
105	11	26	valoresNosotros.item.img	valoresNosotros.5.img	2d4d5fc880b65ded9654467112ce758a	1	36	32
106	11	27	valoresNosotros.item.img	valoresNosotros.6.img	a889e4c01b15527db9a3a790448a471a	1	36	32
108	29	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
109	30	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
110	31	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
117	19	31	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	42	32
121	19	29	galleryPaquete.item.image	galleryPaquete.5.image	d32cdc7a421a55d389a398aced025e0a	1	42	32
122	19	30	galleryPaquete.item.image	galleryPaquete.6.image	1e23caf2fb0b57d5b6e97813f54987f6	1	42	32
123	32	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
124	18	32	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	42	32
125	33	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
126	34	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
127	35	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
131	18	31	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	42	32
132	18	33	galleryPaquete.item.image	galleryPaquete.7.image	556858fd77135be690a304edbe51d28f	1	42	32
133	18	34	galleryPaquete.item.image	galleryPaquete.8.image	dc6addcbb7de53c1ba55be1bac57c3bb	1	42	32
134	18	35	galleryPaquete.item.image	galleryPaquete.9.image	8662e84e9fc35e3fae3f26960b2e205e	1	42	32
135	36	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
136	37	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
137	38	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
138	5	36	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	42	32
141	5	37	galleryPaquete.item.image	galleryPaquete.10.image	121b242227d65c9d864e32522172b1c6	1	42	32
142	5	38	galleryPaquete.item.image	galleryPaquete.11.image	68e78bc9839253b199fb61ae098cc7a5	1	42	32
143	20	31	background	background	b08f54a66b9d5174bbe47931cfa5f6bb	1	42	32
146	20	38	galleryPaquete.item.image	galleryPaquete.12.image	9e6e316f720c5552b30574db01959d53	1	42	32
147	20	37	galleryPaquete.item.image	galleryPaquete.13.image	d7c1dd3baf3e50edb7bdd4039ea6c15b	1	42	32
148	19	32	featuredImage	featuredImage	6f2682b29ad05a61bc48dc62563d522c	1	42	32
150	18	34	galleryPaquete.item.image	galleryPaquete.14.image	580f6372315a534f824543cf45b64315	1	42	32
151	39	1	collection	collection	b40b1263e92957f2a7f89dbce56b887b	32	32	7
152	13	39	galleryIni.Tipo1.photo	galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.photo	f1751e2c85295f4ebf110bff2d2afc8c	1	30	32
\.


--
-- Data for Name: wagtailcore_revision; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_revision (id, created_at, content, approved_go_live_at, object_id, user_id, content_type_id, base_content_type_id, object_str) FROM stdin;
1	2024-07-04 15:52:30.00076+00	{"pk": 3, "path": "00010002", "depth": 2, "numchild": 0, "translation_key": "1cb0f6f9-9611-4fdd-84e1-1019992be35a", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru Destino Seguro", "draft_title": "Peru Destino Seguro", "slug": "peru-destino-seguro", "content_type": 28, "url_path": "/peru-destino-seguro/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "body": "", "wagtail_admin_comments": []}	\N	3	1	28	1	Peru Destino Seguro
2	2024-07-04 16:14:43.199387+00	{"pk": 4, "path": "000100020001", "depth": 3, "numchild": 0, "translation_key": "868cfd12-c7a0-4401-962a-96bf0dec4e54", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Global", "draft_title": "Global", "slug": "global", "content_type": 66, "url_path": "/peru-destino-seguro/global/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "body": "<p data-block-key=\\"8c3rz\\">uuu</p>", "wagtail_admin_comments": []}	\N	4	1	66	1	Global
3	2024-07-04 19:44:09.405977+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": null, "live": false, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "htxdthdth"}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
4	2024-07-04 21:10:21.175252+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 3, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T19:44:09.405Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "htxdthdth"}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
5	2024-07-04 21:13:34.39897+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 4, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:10:27.232Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:10:21.175Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "htxdthdth"}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
6	2024-07-04 21:15:22.431248+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 5, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:10:27.232Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:13:34.398Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "htxdthdth"}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
7	2024-07-04 21:19:23.967533+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 6, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:15:28.611Z", "live_revision": 6, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:15:22.431Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
8	2024-07-04 21:20:01.264894+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 7, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:15:28.611Z", "live_revision": 6, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:19:23.967Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
9	2024-07-04 21:27:09.15019+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 8, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:20:06.868Z", "live_revision": 8, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:20:01.264Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
10	2024-07-04 21:27:46.079725+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 9, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:20:06.868Z", "live_revision": 8, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:27:09.150Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
11	2024-07-04 21:47:14.876227+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 10, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:27:51.814Z", "live_revision": 10, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:27:46.079Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
12	2024-07-04 21:47:47.295806+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 11, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:27:51.814Z", "live_revision": 10, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:47:14.876Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
13	2024-07-04 21:53:37.305123+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 12, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:47:52.871Z", "live_revision": 12, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:47:47.295Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
14	2024-07-04 21:54:15.092881+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 13, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:47:52.871Z", "live_revision": 12, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:53:37.305Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
15	2024-07-04 22:11:48.32333+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 14, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:54:20.655Z", "live_revision": 14, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T21:54:15.092Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
16	2024-07-04 22:15:06.406754+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 15, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T21:54:20.655Z", "live_revision": 14, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T22:11:48.323Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
17	2024-07-04 22:24:53.781663+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 16, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:15:12.027Z", "live_revision": 16, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T22:15:06.406Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
18	2024-07-04 22:27:16.740414+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 17, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:15:12.027Z", "live_revision": 16, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T22:24:53.781Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
19	2024-07-04 22:31:19.047659+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 18, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T22:27:16.740Z", "alias_of": null, "background": null, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": "yourm"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 5, "item": null}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": 1, "sort_order": 0, "page": 5, "item": ""}]}	\N	5	1	42	1	El camino de los Dioses
20	2024-07-04 23:00:31.312736+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 19, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T22:31:19.047Z", "alias_of": null, "background": null, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
21	2024-07-05 14:35:12.011013+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 20, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T23:00:31.312Z", "alias_of": null, "background": null, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
22	2024-07-05 14:38:40.651635+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 21, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T14:35:12.011Z", "alias_of": null, "background": null, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
23	2024-07-05 14:43:47.135369+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 22, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T14:38:40.651Z", "alias_of": null, "background": 1, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
24	2024-07-05 14:44:30.957915+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 23, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T14:43:47.135Z", "alias_of": null, "background": 1, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": null, "sort_order": 0, "page": 5, "item": "aoeaoe"}], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
25	2024-07-05 15:50:58.062946+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": null, "live": false, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "tourDestino": null, "background": null, "featuredImage": null, "precio": null, "linkWord": null, "linkPdf": null, "linkFlyer": null, "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryTour": [], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
26	2024-07-05 16:03:40.816254+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 25, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T15:50:58.062Z", "alias_of": null, "tourDestino": null, "background": 1, "featuredImage": 2, "precio": "123", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryTour": [], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
27	2024-07-05 16:08:04.872949+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 26, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:03:40.816Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaoe"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
28	2024-07-05 16:08:56.940819+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 27, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:08:04.872Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaoe"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
29	2024-07-05 16:11:53.964644+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 28, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-05T16:09:03.315Z", "live_revision": 28, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:08:56.940Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoea"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
30	2024-07-05 16:16:41.923123+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 29, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-05T16:12:00.486Z", "live_revision": 29, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:11:53.964Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallos
31	2024-07-05 21:11:01.847073+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 24, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T14:44:30.957Z", "alias_of": null, "background": 1, "featuredImage": 1, "precio": null, "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": []}	\N	5	1	42	1	El camino de los Dioses
32	2024-07-05 21:16:01.495825+00	{"pk": 7, "path": "00010003", "depth": 2, "numchild": 0, "translation_key": "1cb0f6f9-9611-4fdd-84e1-1019992be35a", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru Destino Seguro", "draft_title": "Peru Destino Seguro", "slug": "peru-destino-seguro-en", "content_type": 28, "url_path": "/peru-destino-seguro-en/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T15:52:30.000Z", "alias_of": null, "body": "", "wagtail_admin_comments": []}	\N	7	\N	28	1	Peru Destino Seguro
33	2024-07-05 21:16:32.500544+00	{"pk": 7, "path": "00010003", "depth": 2, "numchild": 0, "translation_key": "1cb0f6f9-9611-4fdd-84e1-1019992be35a", "locale": 2, "latest_revision": 32, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru Safe Destiny", "draft_title": "Peru Destino Seguro", "slug": "peru-destino-seguro-en", "content_type": 28, "url_path": "/peru-destino-seguro-en/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:16:01.495Z", "alias_of": null, "body": "", "wagtail_admin_comments": []}	\N	7	1	28	1	Peru Safe Destiny
34	2024-07-05 21:17:57.335695+00	{"pk": 8, "path": "000100030001", "depth": 3, "numchild": 0, "translation_key": "868cfd12-c7a0-4401-962a-96bf0dec4e54", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Global", "draft_title": "Global", "slug": "global", "content_type": 66, "url_path": "/peru-destino-seguro-en/global/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-04T16:14:43.199Z", "alias_of": null, "body": "<p data-block-key=\\"8c3rz\\">uuu</p>", "wagtail_admin_comments": []}	\N	8	\N	66	1	Global
35	2024-07-05 21:18:06.287542+00	{"pk": 9, "path": "0001000300010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:11:01.847Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": "yourm"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": null}], "galleryPaquete": [{"pk": 2, "sort_order": 0, "page": 9, "image": 1, "caption": null}], "dias": [{"pk": 2, "sort_order": 0, "page": 9, "item": ""}]}	\N	9	\N	42	1	El camino de los Dioses
36	2024-07-05 21:18:14.964739+00	{"pk": 10, "path": "0001000300010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro-en/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:16:41.923Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 10, "item": "oaeeaoe"}, {"pk": 4, "sort_order": 1, "page": 10, "item": "oaeaoe"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 10, "item": "aoeaooo"}], "galleryTour": [{"pk": 2, "sort_order": 0, "page": 10, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	10	\N	47	1	Collpa de Guacamallos
37	2024-07-05 21:20:39.341198+00	{"pk": 9, "path": "0001000300010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 2, "latest_revision": 35, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "The roads of gods", "draft_title": "El camino de los Dioses", "slug": "the-roads-of-gods", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:18:06.287Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": "yourm"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": null}], "galleryPaquete": [{"pk": 2, "sort_order": 0, "page": 9, "image": 1, "caption": null}], "dias": [{"pk": 2, "sort_order": 0, "page": 9, "item": ""}]}	\N	9	1	42	1	The roads of gods
38	2024-07-05 22:29:45.191766+00	{"pk": 9, "path": "0001000300010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 2, "latest_revision": 37, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "The roads of gods", "draft_title": "The roads of gods", "slug": "the-roads-of-gods", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/the-roads-of-gods/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:20:39.341Z", "alias_of": null, "background": 2, "featuredImage": 1, "precio": "1200.00", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": "yourm"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 9, "item": "dfbdfbfdb"}], "galleryPaquete": [{"pk": 2, "sort_order": 0, "page": 9, "image": 1, "caption": "wedsvegv"}], "dias": [{"pk": 2, "sort_order": 0, "page": 9, "item": "<p data-block-key=\\"5w3gq\\">edwbredfbfr</p>"}]}	\N	9	1	42	1	The roads of gods
39	2024-07-10 02:03:00.969061+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": null, "live": false, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "background": 3, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
40	2024-07-10 02:04:38.740505+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 39, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-10T02:03:00.969Z", "alias_of": null, "background": 3, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
41	2024-07-10 02:06:31.459499+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro-en/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-10T02:04:38.740Z", "alias_of": null, "background": 3, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	\N	36	1	Nosotros
42	2024-07-10 02:29:06.16113+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 41, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About Us", "draft_title": "Nosotros", "slug": "about-us", "content_type": 36, "url_path": "/peru-destino-seguro-en/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-10T02:06:31.459Z", "alias_of": null, "background": 3, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About Us
43	2024-07-11 21:48:44.102255+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicios", "draft_title": "Inicios", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 2, \\"carouselTitulo\\": \\"Hola\\", \\"carouselDuracion\\": \\"1212\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicios
44	2024-07-12 22:43:05.500676+00	{"pk": 10, "path": "0001000300010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 2, "latest_revision": 36, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro-en/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:18:14.964Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 10, "item": "oaeeaoe"}, {"pk": 4, "sort_order": 1, "page": 10, "item": "oaeaoe"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 10, "item": "aoeaooo"}], "galleryTour": [{"pk": 2, "sort_order": 0, "page": 10, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	10	1	47	1	Collpa de Guacamallos
45	2024-07-12 22:55:03.769212+00	{"pk": 10, "path": "0001000300010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 2, "latest_revision": 44, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallos", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro-en/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-12T22:43:05.500Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 10, "item": "oaeeaoe"}, {"pk": 4, "sort_order": 1, "page": 10, "item": "oaeaoe"}], "incluidos": [{"pk": 2, "sort_order": 0, "page": 10, "item": "aoeaooo"}], "galleryTour": [{"pk": 2, "sort_order": 0, "page": 10, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	10	1	47	1	Collpa de Guacamallos
46	2024-07-14 00:21:37.281292+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 31, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-04T22:27:25.351Z", "live_revision": 18, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "El camino de los Dioses", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T21:11:01.847Z", "alias_of": null, "background": 1, "featuredImage": 9, "precio": "1300", "duracion": "10-8", "linkWord": "aoeaoe", "linkPdf": "aoeaoe", "linkFlyer": "aoeaoe", "wagtail_admin_comments": [], "excluidos": [{"pk": null, "sort_order": 0, "page": 5, "item": "asdasd"}], "incluidos": [{"pk": null, "sort_order": 0, "page": 5, "item": "asdasd"}], "galleryPaquete": [{"pk": 1, "sort_order": 0, "page": 5, "image": 1, "caption": null}], "dias": [{"pk": null, "sort_order": 0, "page": 5, "item": "<p data-block-key=\\"17ptc\\">asdasd</p>"}]}	\N	5	1	42	1	El camino de los Dioses
47	2024-07-14 00:23:34.053787+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 43, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-11T21:48:48.616Z", "live_revision": 43, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicios", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-11T21:48:44.102Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"Hola\\", \\"carouselDuracion\\": \\"1212\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
48	2024-07-15 14:57:29.297981+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 47, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-14T00:23:37.204Z", "live_revision": 47, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-14T00:23:34.053Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"El Camino de los Tiempos\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\"}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
49	2024-07-15 22:15:11.07815+00	{"pk": 14, "path": "0001000200010003", "depth": 4, "numchild": 0, "translation_key": "6ffd7fe6-0e79-41c6-82d4-11ab541bbdf4", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Ollaytamtanbo", "draft_title": "Collpa de Ollaytamtanbo", "slug": "collpa-de-ollaytamtanbo", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-ollaytamtanbo/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "tourDestino": 2, "background": 2, "featuredImage": 9, "precio": "1212", "linkWord": "ascdasczxc", "linkPdf": "zxczx", "linkFlyer": "ASDASDASD", "itinerario": "<p data-block-key=\\"rlbyv\\">asdasdasd</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 5, "sort_order": 0, "page": 14, "item": "asdasd"}], "incluidos": [{"pk": 3, "sort_order": 0, "page": 14, "item": "dssdsd"}], "galleryTour": [{"pk": 3, "sort_order": 0, "page": 14, "image": 2, "caption": "sss"}], "categories": []}	\N	14	1	47	1	Collpa de Ollaytamtanbo
50	2024-07-17 14:50:03.778642+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 42, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-10T02:29:09.405Z", "live_revision": 42, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About Us", "slug": "about-us", "content_type": 36, "url_path": "/peru-destino-seguro-en/about-us/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-10T02:29:06.161Z", "alias_of": null, "background": 3, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
51	2024-07-17 15:22:32.189633+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 50, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-17T14:50:06.743Z", "live_revision": 50, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About", "slug": "about", "content_type": 36, "url_path": "/peru-destino-seguro-en/about-us/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T14:50:03.778Z", "alias_of": null, "background": 3, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
52	2024-07-17 15:23:06.179931+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 51, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-17T15:22:35.114Z", "live_revision": 51, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About", "slug": "about", "content_type": 36, "url_path": "/peru-destino-seguro-en/about/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T15:22:32.189Z", "alias_of": null, "background": 3, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
53	2024-07-17 15:23:25.156175+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 52, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-17T15:22:35.114Z", "live_revision": 51, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About", "slug": "about", "content_type": 36, "url_path": "/peru-destino-seguro-en/about/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T15:23:06.179Z", "alias_of": null, "background": 3, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 2, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
54	2024-07-17 18:03:36.479741+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 40, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:04:41.698Z", "last_published_at": "2024-07-10T02:04:41.698Z", "live_revision": 40, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-10T02:04:38.740Z", "alias_of": null, "background": 11, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
55	2024-07-17 18:07:04.972423+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 53, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-17T15:23:27.939Z", "live_revision": 53, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About", "slug": "about", "content_type": 36, "url_path": "/peru-destino-seguro-en/about/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T15:23:25.156Z", "alias_of": null, "background": 11, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "asdasdasd", "numeroRuc": "asdasdasd", "nombreComercial": "asdasdsa", "certificadoAutorizacion": "asdsadasd", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "asdsadasd", "grayLet": "asdasdasd"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
56	2024-07-17 21:57:46.436873+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 48, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-15T14:57:32.174Z", "live_revision": 48, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-15T14:57:29.297Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"El Camino de los Tiempos\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": null, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": null, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
57	2024-07-17 22:15:41.001386+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 56, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-17T21:57:51.806Z", "live_revision": 56, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T21:57:46.436Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"El Camino de los Tiempos\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": 13, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": 14, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}, {\\"type\\": \\"item\\", \\"value\\": 15, \\"id\\": \\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
58	2024-07-18 21:54:19.863696+00	{"pk": 15, "path": "000100030003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro-en/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T22:15:41.001Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"El Camino de los Tiempos\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": 13, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": 14, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}, {\\"type\\": \\"item\\", \\"value\\": 15, \\"id\\": \\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 2, "sort_order": 0, "page": 15, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	15	\N	30	1	Inicio
59	2024-07-18 21:56:18.775768+00	{"pk": 15, "path": "000100030003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 2, "latest_revision": 58, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Home", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro-en/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-18T21:54:19.863Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "i dont remenber what text is written here", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"THE TIMES ROADS\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": 13, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": 14, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}, {\\"type\\": \\"item\\", \\"value\\": 15, \\"id\\": \\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 2, "sort_order": 0, "page": 15, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	15	1	30	1	Home
60	2024-07-18 21:58:01.001853+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 57, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-17T22:15:44.068Z", "live_revision": 57, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T22:15:41.001Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 10, \\"carouselTitulo\\": \\"EL CAMINO DE LOS TIEMPOS\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": 13, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": 14, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}, {\\"type\\": \\"item\\", \\"value\\": 15, \\"id\\": \\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
61	2024-07-19 22:44:59.489925+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 54, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:04:41.698Z", "last_published_at": "2024-07-17T18:03:39.716Z", "live_revision": 54, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T18:03:36.479Z", "alias_of": null, "background": 11, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "Per\\u00fa Destino Seguro E.I.R.L.", "numeroRuc": "20601468582", "nombreComercial": "PDS VIAJES", "certificadoAutorizacion": "Per\\u00fa Destino Seguro E.I.R.L.", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "+5K", "grayLet": "AGENCIAS DE VIAJES ATENDIDAS"}, {"pk": null, "sort_order": 1, "page": 11, "redLet": "+30", "grayLet": "DESTINOS"}, {"pk": null, "sort_order": 2, "page": 11, "redLet": "+15", "grayLet": "15 A\\u00d1OS DE EXPERIENCIA"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
62	2024-07-19 22:49:24.747091+00	{"pk": 12, "path": "000100030002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 2, "latest_revision": 55, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:29:09.405Z", "last_published_at": "2024-07-17T18:07:08.328Z", "live_revision": 55, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "About", "draft_title": "About", "slug": "about", "content_type": 36, "url_path": "/peru-destino-seguro-en/about/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-17T18:07:04.972Z", "alias_of": null, "background": 11, "titulo": "About Us", "subTitulo": "About Us", "parrafo": "<p data-block-key=\\"8akow\\">ENglish</p>", "imageParrafo": 12, "razonSocial": "Per\\u00fa Destino Seguro E.I.R.L.", "numeroRuc": "20601468582", "nombreComercial": "PDS VIAJES", "certificadoAutorizacion": "Per\\u00fa Destino Seguro E.I.R.L.", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 2, "sort_order": 0, "page": 12, "redLet": "+5K", "grayLet": "TRAVEL AGENCIES SERVED"}, {"pk": null, "sort_order": 1, "page": 12, "redLet": "+30", "grayLet": "DESTINIES"}, {"pk": null, "sort_order": 2, "page": 12, "redLet": "+15", "grayLet": "15 YEARS OF EXPERIENCE"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	12	1	36	1	About
63	2024-07-20 21:18:56.53831+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 61, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:04:41.698Z", "last_published_at": "2024-07-19T22:45:02.888Z", "live_revision": 61, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-19T22:44:59.489Z", "alias_of": null, "background": 11, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "Per\\u00fa Destino Seguro E.I.R.L.", "numeroRuc": "20601468582", "nombreComercial": "PDS VIAJES", "certificadoAutorizacion": "Per\\u00fa Destino Seguro E.I.R.L.", "valoresSubtitle": "Valores", "partnersSubtitle": "Nuestros Partners", "certificadosSubtitle": "Certificaciones", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "+5K", "grayLet": "AGENCIAS DE VIAJES ATENDIDAS"}, {"pk": 3, "sort_order": 1, "page": 11, "redLet": "+30", "grayLet": "DESTINOS"}, {"pk": 4, "sort_order": 2, "page": 11, "redLet": "+15", "grayLet": "15 A\\u00d1OS DE EXPERIENCIA"}], "valoresNosotros": [], "partnersNosotros": [], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
64	2024-07-20 23:40:40.997743+00	{"pk": 16, "path": "000100020004", "depth": 3, "numchild": 0, "translation_key": "10aa4b6b-c2a6-4b3c-ab08-4399c19bd262", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Contactar", "draft_title": "Contactar", "slug": "contactar", "content_type": 67, "url_path": "/peru-destino-seguro/contactar/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "background": 16, "titulo": "Cont\\u00e1ctanos", "formTitle": "Contacto", "ubicacion": "Tacna 168, Cusco 08002", "wagtail_admin_comments": []}	\N	16	1	67	1	Contactar
65	2024-07-20 23:44:40.170718+00	{"pk": 17, "path": "000100030004", "depth": 3, "numchild": 0, "translation_key": "10aa4b6b-c2a6-4b3c-ab08-4399c19bd262", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Contactar", "draft_title": "Contactar", "slug": "contactar", "content_type": 67, "url_path": "/peru-destino-seguro-en/contactar/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-20T23:40:40.997Z", "alias_of": null, "background": 16, "titulo": "Cont\\u00e1ctanos", "formTitle": "Contacto", "ubicacion": "Tacna 168, Cusco 08002", "wagtail_admin_comments": []}	\N	17	\N	67	1	Contactar
66	2024-07-20 23:46:31.998431+00	{"pk": 17, "path": "000100030004", "depth": 3, "numchild": 0, "translation_key": "10aa4b6b-c2a6-4b3c-ab08-4399c19bd262", "locale": 2, "latest_revision": 65, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Contact", "draft_title": "Contactar", "slug": "contact", "content_type": 67, "url_path": "/peru-destino-seguro-en/contactar/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-20T23:44:40.170Z", "alias_of": null, "background": 16, "titulo": "Contact Us", "formTitle": "Contact", "ubicacion": "Tacna 168, Cusco 08002", "wagtail_admin_comments": []}	\N	17	1	67	1	Contact
67	2024-07-22 20:51:12.552674+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 63, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:04:41.698Z", "last_published_at": "2024-07-20T21:18:59.888Z", "live_revision": 63, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-20T21:18:56.538Z", "alias_of": null, "background": 11, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "Per\\u00fa Destino Seguro E.I.R.L.", "numeroRuc": "20601468582", "nombreComercial": "PDS VIAJES", "certificadoAutorizacion": "Per\\u00fa Destino Seguro E.I.R.L.", "valoresSubtitle": "Valores", "partnersSubtitle": "Nuestros Partners", "certificadosSubtitle": "Certificaciones", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "+5K", "grayLet": "AGENCIAS DE VIAJES ATENDIDAS"}, {"pk": 3, "sort_order": 1, "page": 11, "redLet": "+30", "grayLet": "DESTINOS"}, {"pk": 4, "sort_order": 2, "page": 11, "redLet": "+15", "grayLet": "15 A\\u00d1OS DE EXPERIENCIA"}], "valoresNosotros": [], "partnersNosotros": [{"pk": null, "sort_order": 0, "page": 11, "image": 17}, {"pk": null, "sort_order": 1, "page": 11, "image": 18}, {"pk": null, "sort_order": 2, "page": 11, "image": 19}, {"pk": null, "sort_order": 3, "page": 11, "image": 20}, {"pk": null, "sort_order": 4, "page": 11, "image": 21}], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
68	2024-07-22 22:31:27.126856+00	{"pk": 11, "path": "000100020002", "depth": 3, "numchild": 0, "translation_key": "a03cc2c2-e779-45dc-b718-9ab537b64897", "locale": 1, "latest_revision": 67, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-10T02:04:41.698Z", "last_published_at": "2024-07-22T20:51:16.791Z", "live_revision": 67, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Nosotros", "draft_title": "Nosotros", "slug": "nosotros", "content_type": 36, "url_path": "/peru-destino-seguro/nosotros/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-22T20:51:12.552Z", "alias_of": null, "background": 11, "titulo": "Sobre Nosotros", "subTitulo": "Sobre Nosotros", "parrafo": "<p data-block-key=\\"8akow\\">Espa\\u00f1ollll</p>", "imageParrafo": 12, "razonSocial": "Per\\u00fa Destino Seguro E.I.R.L.", "numeroRuc": "20601468582", "nombreComercial": "PDS VIAJES", "certificadoAutorizacion": "Per\\u00fa Destino Seguro E.I.R.L.", "valoresSubtitle": "Valores", "partnersSubtitle": "Nuestros Partners", "certificadosSubtitle": "Certificaciones", "wagtail_admin_comments": [], "estadisticasNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "redLet": "+5K", "grayLet": "AGENCIAS DE VIAJES ATENDIDAS"}, {"pk": 3, "sort_order": 1, "page": 11, "redLet": "+30", "grayLet": "DESTINOS"}, {"pk": 4, "sort_order": 2, "page": 11, "redLet": "+15", "grayLet": "15 A\\u00d1OS DE EXPERIENCIA"}], "valoresNosotros": [{"pk": null, "sort_order": 0, "page": 11, "img": 22, "label": "Responsabilidad"}, {"pk": null, "sort_order": 1, "page": 11, "img": 23, "label": "Lealtad"}, {"pk": null, "sort_order": 2, "page": 11, "img": 24, "label": "Honestidad"}, {"pk": null, "sort_order": 3, "page": 11, "img": 25, "label": "Puntualidad"}, {"pk": null, "sort_order": 4, "page": 11, "img": 26, "label": "Disciplina"}, {"pk": null, "sort_order": 5, "page": 11, "img": 27, "label": "Confidencialidad"}], "partnersNosotros": [{"pk": 1, "sort_order": 0, "page": 11, "image": 17}, {"pk": 2, "sort_order": 1, "page": 11, "image": 18}, {"pk": 3, "sort_order": 2, "page": 11, "image": 19}, {"pk": 4, "sort_order": 3, "page": 11, "image": 20}, {"pk": 5, "sort_order": 4, "page": 11, "image": 21}], "certificadosNosotros": []}	\N	11	1	36	1	Nosotros
69	2024-07-23 16:36:11.873561+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noches", "draft_title": "Peru 12D\\u00edas  11Noches", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	2	42	1	Peru 12Días  11Noches
70	2024-07-23 22:49:14.223997+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": null, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noches", "draft_title": "Peru 12D\\u00edas  11Noches", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-23T16:36:11.873Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	\N	42	1	Peru 12Días  11Noches
71	2024-07-23 22:53:13.664047+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": 70, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12 days 11 nights", "draft_title": "Peru 12D\\u00edas  11Noches", "slug": "peru-12-days-11-nights", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12-days-11-nights/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-23T22:49:14.223Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	1	42	1	Peru 12 days 11 nights
72	2024-07-23 22:59:37.097536+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": 71, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T22:53:21.482Z", "last_published_at": "2024-07-23T22:53:21.482Z", "live_revision": 71, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12 days 11 nights ga", "draft_title": "Peru 12 days 11 nights", "slug": "peru-12-days-11-nights", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12-days-11-nights/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-23T22:53:13.664Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	1	42	1	Peru 12 days 11 nights ga
73	2024-07-24 14:23:06.236519+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 69, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-23T16:36:15.872Z", "live_revision": 69, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nochesoo", "draft_title": "Peru 12D\\u00edas  11Noches", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-23T16:36:11.873Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nochesoo
74	2024-07-24 14:25:53.389873+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 73, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:23:13.448Z", "live_revision": 73, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noche", "draft_title": "Peru 12D\\u00edas  11Nochesoo", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:23:06.236Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noche
75	2024-07-24 14:30:15.370083+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 74, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:26:00.666Z", "live_revision": 74, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noctthe", "draft_title": "Peru 12D\\u00edas  11Noche", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:25:53.389Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noctthe
76	2024-07-24 14:35:49.777414+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 75, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:30:22.658Z", "live_revision": 75, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noche", "draft_title": "Peru 12D\\u00edas  11Noctthe", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:30:15.370Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noche
77	2024-07-24 14:36:34.024171+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 76, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:30:22.658Z", "live_revision": 75, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noche", "draft_title": "Peru 12D\\u00edas  11Noche", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:35:49.777Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noche
78	2024-07-24 14:39:22.075893+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 77, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:36:40.686Z", "live_revision": 77, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nochen", "draft_title": "Peru 12D\\u00edas  11Noche", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:36:34.024Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nochen
79	2024-07-24 16:23:51.965131+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": 72, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T22:53:21.482Z", "last_published_at": "2024-07-23T22:59:44.393Z", "live_revision": 72, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12 days 11 nights", "draft_title": "Peru 12 days 11 nights ga", "slug": "peru-12-days-11-nights", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12-days-11-nights/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-23T22:59:37.097Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	1	42	1	Peru 12 days 11 nights
80	2024-07-24 19:47:22.074911+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 78, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T14:39:29.650Z", "live_revision": 78, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noche", "draft_title": "Peru 12D\\u00edas  11Nochen", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T14:39:22.075Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noche
81	2024-07-24 19:55:27.226929+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 80, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T19:47:29.679Z", "live_revision": 80, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11NocheMM", "draft_title": "Peru 12D\\u00edas  11Noche", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T19:47:22.074Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11NocheMM
82	2024-07-24 20:00:09.196912+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 81, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T19:55:35.033Z", "live_revision": 81, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nochtt", "draft_title": "Peru 12D\\u00edas  11NocheMM", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T19:55:27.226Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nochtt
83	2024-07-24 20:15:05.251104+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 82, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:00:17.207Z", "live_revision": 82, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nocheee", "draft_title": "Peru 12D\\u00edas  11Nochtt", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:00:09.196Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nocheee
84	2024-07-24 20:18:40.358204+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 83, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:15:12.487Z", "live_revision": 83, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noch", "draft_title": "Peru 12D\\u00edas  11Nocheee", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:15:05.251Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noch
85	2024-07-24 20:22:10.600349+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 84, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:18:50.951Z", "live_revision": 84, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nocha", "draft_title": "Peru 12D\\u00edas  11Noch", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:18:40.358Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nocha
86	2024-07-24 20:25:02.860361+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 85, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:22:17.806Z", "live_revision": 85, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Nochad", "draft_title": "Peru 12D\\u00edas  11Nocha", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:22:10.600Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Nochad
87	2024-07-24 20:27:17.16982+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 86, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:25:10.285Z", "live_revision": 86, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11NochadT", "draft_title": "Peru 12D\\u00edas  11Nochad", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:25:02.860Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11NochadT
88	2024-07-24 20:38:17.188523+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 87, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:27:26.879Z", "live_revision": 87, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  11Noc", "draft_title": "Peru 12D\\u00edas  11NochadT", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:27:17.169Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	1	42	1	Peru 12Días  11Noc
89	2024-07-24 20:51:36.097858+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 30, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-05T16:16:48.420Z", "live_revision": 30, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de GuacamallosCGG", "draft_title": "Collpa de Guacamallos", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-05T16:16:41.923Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de GuacamallosCGG
90	2024-07-24 20:53:42.063584+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 89, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T20:51:42.608Z", "live_revision": 89, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamall", "draft_title": "Collpa de GuacamallosCGG", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:51:36.097Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamall
91	2024-07-24 20:55:24.588216+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 90, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T20:53:48.497Z", "live_revision": 90, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallaa", "draft_title": "Collpa de Guacamall", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:53:42.063Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallaa
92	2024-07-24 21:06:32.114832+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 91, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T20:55:31.181Z", "live_revision": 91, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamall", "draft_title": "Collpa de Guacamallaa", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:55:24.588Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamall
93	2024-07-24 21:14:53.699477+00	{"pk": 14, "path": "0001000200010003", "depth": 4, "numchild": 0, "translation_key": "6ffd7fe6-0e79-41c6-82d4-11ab541bbdf4", "locale": 1, "latest_revision": 49, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-15T22:15:14.294Z", "last_published_at": "2024-07-15T22:15:14.294Z", "live_revision": 49, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Manu", "draft_title": "Collpa de Ollaytamtanbo", "slug": "collpa-de-ollaytamtanbo", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-ollaytamtanbo/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-15T22:15:11.078Z", "alias_of": null, "tourDestino": 2, "background": 2, "featuredImage": 9, "precio": "1212.00", "linkWord": "ascdasczxc", "linkPdf": "zxczx", "linkFlyer": "ASDASDASD", "itinerario": "<p data-block-key=\\"rlbyv\\">asdasdasd</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 5, "sort_order": 0, "page": 14, "item": "asdasd"}], "incluidos": [{"pk": 3, "sort_order": 0, "page": 14, "item": "dssdsd"}], "galleryTour": [{"pk": 3, "sort_order": 0, "page": 14, "image": 2, "caption": "sss"}], "categories": []}	\N	14	1	47	1	Collpa de Manu
94	2024-07-24 21:16:38.088114+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 92, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T21:06:38.561Z", "live_revision": 92, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallaa", "draft_title": "Collpa de Guacamall", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T21:06:32.114Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallaa
95	2024-07-24 21:26:24.609269+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 94, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T21:16:41.458Z", "live_revision": 94, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamallee", "draft_title": "Collpa de Guacamallaa", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T21:16:38.088Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamallee
96	2024-07-24 21:31:15.643031+00	{"pk": 6, "path": "0001000200010002", "depth": 4, "numchild": 0, "translation_key": "7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c", "locale": 1, "latest_revision": 95, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-05T16:09:03.315Z", "last_published_at": "2024-07-24T21:26:27.908Z", "live_revision": 95, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Collpa de Guacamalleae", "draft_title": "Collpa de Guacamallee", "slug": "collpa-de-guacamallos", "content_type": 47, "url_path": "/peru-destino-seguro/global/collpa-de-guacamallos/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T21:26:24.609Z", "alias_of": null, "tourDestino": 1, "background": 1, "featuredImage": 2, "precio": "123.00", "linkWord": "aoeaoe", "linkPdf": "aoeao", "linkFlyer": "aoeaoe", "itinerario": "<p data-block-key=\\"5imeg\\">oaeaoe</p>", "wagtail_admin_comments": [], "excluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "oaeeaoe"}, {"pk": 2, "sort_order": 1, "page": 6, "item": "oaeaoe"}], "incluidos": [{"pk": 1, "sort_order": 0, "page": 6, "item": "aoeaooo"}], "galleryTour": [{"pk": 1, "sort_order": 0, "page": 6, "image": 1, "caption": "aoeaoe"}], "categories": []}	\N	6	1	47	1	Collpa de Guacamalleae
97	2024-07-24 21:44:30.325199+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 88, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:38:21.195Z", "live_revision": 88, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  doris", "draft_title": "Peru 12D\\u00edas  11Noc", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T20:38:17.188Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	3	42	1	Peru 12Días  doris
98	2024-07-24 21:45:28.522938+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 97, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T20:38:21.195Z", "live_revision": 88, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12D\\u00edas  doris", "draft_title": "Peru 12D\\u00edas  doris", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T21:44:30.325Z", "alias_of": null, "background": 31, "featuredImage": 28, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Vuelo Lima Cusco"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	3	42	1	Peru 12Días  doris
99	2024-07-24 22:12:07.968459+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 98, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T21:45:32.225Z", "live_revision": 98, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PERU 10 DIAS 9 NOCHES", "draft_title": "Peru 12D\\u00edas  doris", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T21:45:28.522Z", "alias_of": null, "background": null, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": null}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Caballos"}], "incluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Almuerzo"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Hotel"}, {"pk": 6, "sort_order": 2, "page": 18, "item": "Guia"}, {"pk": 7, "sort_order": 3, "page": 18, "item": "Transporte"}], "galleryPaquete": [{"pk": 3, "sort_order": 0, "page": 18, "image": 29, "caption": "Caption"}, {"pk": 4, "sort_order": 1, "page": 18, "image": 30, "caption": "Caption"}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	18	3	42	1	PERU 10 DIAS 9 NOCHES
100	2024-07-24 23:02:21.135665+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 99, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T21:45:32.225Z", "live_revision": 98, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 10 DIAS 9 NOCHES", "draft_title": "PERU 10 DIAS 9 NOCHES", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T22:12:07.968Z", "alias_of": null, "background": null, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Snack"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Gastos adicionales"}, {"pk": null, "sort_order": 2, "page": 18, "item": "Equipaje de mano - Bodega"}, {"pk": null, "sort_order": 3, "page": 18, "item": "Servicio de caballos"}, {"pk": null, "sort_order": 4, "page": 18, "item": "Seguro"}], "incluidos": [{"pk": 6, "sort_order": 0, "page": 18, "item": "Desayuno"}, {"pk": 4, "sort_order": 1, "page": 18, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": 5, "sort_order": 2, "page": 18, "item": "Alojamiento"}, {"pk": null, "sort_order": 3, "page": 18, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": 7, "sort_order": 4, "page": 18, "item": "Traslados"}, {"pk": null, "sort_order": 5, "page": 18, "item": "Ticket de ingreso a los atractivos"}, {"pk": null, "sort_order": 6, "page": 18, "item": "Trenes"}, {"pk": null, "sort_order": 7, "page": 18, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": null, "sort_order": 0, "page": 18, "image": 33, "caption": null}, {"pk": null, "sort_order": 1, "page": 18, "image": 34, "caption": null}, {"pk": null, "sort_order": 2, "page": 18, "image": 35, "caption": null}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"c21p7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\"bhr0u\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\"bmnkj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\"45puv\\"></p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 2: City tour Lima</h2><p data-block-key=\\"807gt\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\"affod\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"dh2p5\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\"8o40k\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"p2qc\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\"9l0j8\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": null, "sort_order": 2, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"b0u50\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"fn59g\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"1a2v0\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"4aumk\\">Salida con destino a Lima.</p>"}, {"pk": null, "sort_order": 3, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"q5p5\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"7fs20\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"lpsi\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\"c45ie\\"></p>"}, {"pk": null, "sort_order": 4, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\"c3dqa\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\"cbjae\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\"aa564\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\"9ovv0\\">Nuestro tour finaliza en la Plaza San Francisco.</p>"}, {"pk": null, "sort_order": 5, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"9vp0h\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"9tqc3\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\"5bgfa\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"a47k7\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": null, "sort_order": 6, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 7 : Machupicchu</h2><p data-block-key=\\"bp9fs\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"1roq3\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\"7eipf\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"etnb5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"aeaf3\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 7, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\"70i1r\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\"mlog\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"dqabv\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 8, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\"2q3su\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"3rf01\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"6tbtl\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"2o8u1\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": null, "sort_order": 9, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\"9hfcv\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"a73r9\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\"aj7pg\\"></p>"}]}	\N	18	3	42	1	PERÚ 10 DIAS 9 NOCHES
101	2024-07-24 23:06:14.859296+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 100, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T21:45:32.225Z", "live_revision": 98, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 10 DIAS 9 NOCHES", "draft_title": "PER\\u00da 10 DIAS 9 NOCHES", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T23:02:21.135Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Snack"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Gastos adicionales"}, {"pk": null, "sort_order": 2, "page": 18, "item": "Equipaje de mano - Bodega"}, {"pk": null, "sort_order": 3, "page": 18, "item": "Servicio de caballos"}, {"pk": null, "sort_order": 4, "page": 18, "item": "Seguro"}], "incluidos": [{"pk": 6, "sort_order": 0, "page": 18, "item": "Desayuno"}, {"pk": 4, "sort_order": 1, "page": 18, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": 5, "sort_order": 2, "page": 18, "item": "Alojamiento"}, {"pk": null, "sort_order": 3, "page": 18, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": 7, "sort_order": 4, "page": 18, "item": "Traslados"}, {"pk": null, "sort_order": 5, "page": 18, "item": "Ticket de ingreso a los atractivos"}, {"pk": null, "sort_order": 6, "page": 18, "item": "Trenes"}, {"pk": null, "sort_order": 7, "page": 18, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": null, "sort_order": 0, "page": 18, "image": 33, "caption": null}, {"pk": null, "sort_order": 1, "page": 18, "image": 34, "caption": null}, {"pk": null, "sort_order": 2, "page": 18, "image": 35, "caption": null}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"c21p7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\"bhr0u\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\"bmnkj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\"45puv\\"></p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 2: City tour Lima</h2><p data-block-key=\\"807gt\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\"affod\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"dh2p5\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\"8o40k\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"p2qc\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\"9l0j8\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": null, "sort_order": 2, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"b0u50\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"fn59g\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"1a2v0\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"4aumk\\">Salida con destino a Lima.</p>"}, {"pk": null, "sort_order": 3, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"q5p5\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"7fs20\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"lpsi\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\"c45ie\\"></p>"}, {"pk": null, "sort_order": 4, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\"c3dqa\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\"cbjae\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\"aa564\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\"9ovv0\\">Nuestro tour finaliza en la Plaza San Francisco.</p>"}, {"pk": null, "sort_order": 5, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"9vp0h\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"9tqc3\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\"5bgfa\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"a47k7\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": null, "sort_order": 6, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 7 : Machupicchu</h2><p data-block-key=\\"bp9fs\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"1roq3\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\"7eipf\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"etnb5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"aeaf3\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 7, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\"70i1r\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\"mlog\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"dqabv\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 8, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\"2q3su\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"3rf01\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"6tbtl\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"2o8u1\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": null, "sort_order": 9, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\"9hfcv\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"a73r9\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\"aj7pg\\"></p>"}]}	\N	18	3	42	1	PERÚ 10 DIAS 9 NOCHES
102	2024-07-24 23:45:33.763989+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 46, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-14T00:21:40.550Z", "live_revision": 46, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 8 DIAS 7 NOCHES", "draft_title": "El camino de los Dioses", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-14T00:21:37.281Z", "alias_of": null, "background": 1, "featuredImage": 36, "precio": "997.00", "duracion": "8-7", "linkWord": "https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit", "linkPdf": "https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0", "linkFlyer": "https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": null}], "incluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": "asdasd"}], "galleryPaquete": [{"pk": null, "sort_order": 0, "page": 5, "image": 37, "caption": null}, {"pk": null, "sort_order": 1, "page": 5, "image": 38, "caption": null}], "dias": [{"pk": 3, "sort_order": 0, "page": 5, "item": "<h2 data-block-key=\\"17ptc\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"dqhi7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\"cdujj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>"}, {"pk": null, "sort_order": 1, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\"6i70p\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"7ot7t\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"79tk4\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"d1fn6\\">Salida con destino a Lima.</p>"}, {"pk": null, "sort_order": 2, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\"18bam\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"37upu\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"9cld4\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>"}, {"pk": null, "sort_order": 3, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"asp0m\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"c2o7h\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"84da3\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": null, "sort_order": 4, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 5: Machupicchu</h2><p data-block-key=\\"9akh3\\"></p><p data-block-key=\\"8hji2\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"33v60\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"7rj5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"b9l95\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 5, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\"dbi3g\\"> Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel  en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"5ci7j\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 6, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 7: TRC Ccaccaccollo </h2><p data-block-key=\\"7edm5\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"52sh7\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"8d4p2\\"> Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"diobk\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": null, "sort_order": 7, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 8: Retorno</h2><p data-block-key=\\"6qg4c\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"4uitg\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>"}]}	\N	5	3	42	1	PERÚ 8 DIAS 7 NOCHES
103	2024-07-24 23:46:56.642264+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 101, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T23:06:20.488Z", "live_revision": 101, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 10 DIAS 9 NOCHES", "draft_title": "PER\\u00da 10 DIAS 9 NOCHES", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T23:06:14.859Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Snack"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Gastos adicionales"}, {"pk": 8, "sort_order": 2, "page": 18, "item": "Equipaje de mano - Bodega"}, {"pk": 9, "sort_order": 3, "page": 18, "item": "Servicio de caballos"}, {"pk": 10, "sort_order": 4, "page": 18, "item": "Seguro"}], "incluidos": [{"pk": 6, "sort_order": 0, "page": 18, "item": "Desayuno"}, {"pk": 4, "sort_order": 1, "page": 18, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": 5, "sort_order": 2, "page": 18, "item": "Alojamiento"}, {"pk": 12, "sort_order": 3, "page": 18, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": 7, "sort_order": 4, "page": 18, "item": "Traslados"}, {"pk": 13, "sort_order": 5, "page": 18, "item": "Ticket de ingreso a los atractivos"}, {"pk": 14, "sort_order": 6, "page": 18, "item": "Trenes"}, {"pk": 15, "sort_order": 7, "page": 18, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": 7, "sort_order": 0, "page": 18, "image": 33, "caption": null}, {"pk": 8, "sort_order": 1, "page": 18, "image": 34, "caption": null}, {"pk": 9, "sort_order": 2, "page": 18, "image": 35, "caption": null}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"c21p7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\"bhr0u\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\"bmnkj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\"45puv\\"></p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 2: City tour Lima</h2><p data-block-key=\\"807gt\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\"affod\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"dh2p5\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\"8o40k\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"p2qc\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\"9l0j8\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": 8, "sort_order": 2, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"b0u50\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"fn59g\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"1a2v0\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"4aumk\\">Salida con destino a Lima.</p>"}, {"pk": 9, "sort_order": 3, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"q5p5\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"7fs20\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"lpsi\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\"c45ie\\"></p>"}, {"pk": 10, "sort_order": 4, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\"c3dqa\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\"cbjae\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\"aa564\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\"9ovv0\\">Nuestro tour finaliza en la Plaza San Francisco.</p>"}, {"pk": 11, "sort_order": 5, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"9vp0h\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"9tqc3\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\"5bgfa\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"a47k7\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": 12, "sort_order": 6, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 7 : Machupicchu</h2><p data-block-key=\\"bp9fs\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"1roq3\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\"7eipf\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"etnb5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"aeaf3\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": 13, "sort_order": 7, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\"70i1r\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\"mlog\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"dqabv\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": 14, "sort_order": 8, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\"2q3su\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"3rf01\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"6tbtl\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"2o8u1\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": 15, "sort_order": 9, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\"9hfcv\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"a73r9\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\"aj7pg\\"></p>"}]}	\N	18	3	42	1	PERÚ 10 DIAS 9 NOCHES
104	2024-07-24 23:52:34.989607+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 102, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-14T00:21:40.550Z", "live_revision": 46, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 8 DIAS 7 NOCHES", "draft_title": "PER\\u00da 8 DIAS 7 NOCHES", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T23:45:33.763Z", "alias_of": null, "background": 1, "featuredImage": 36, "precio": "997.00", "duracion": "8-7", "linkWord": "https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit", "linkPdf": "https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0", "linkFlyer": "https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": "Snack"}, {"pk": null, "sort_order": 1, "page": 5, "item": "Gastos adicionales"}, {"pk": null, "sort_order": 2, "page": 5, "item": "Equipaje de mano - Bodega"}, {"pk": null, "sort_order": 3, "page": 5, "item": "Servicio de caballos"}], "incluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": "Desayuno"}, {"pk": null, "sort_order": 1, "page": 5, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": null, "sort_order": 2, "page": 5, "item": "Alojamiento"}, {"pk": null, "sort_order": 3, "page": 5, "item": "Traslados"}, {"pk": null, "sort_order": 4, "page": 5, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": null, "sort_order": 5, "page": 5, "item": "Ticket de ingreso a los atractivos"}, {"pk": null, "sort_order": 6, "page": 5, "item": "Trenes"}, {"pk": null, "sort_order": 7, "page": 5, "item": "Gu\\u00eda Oficial de Turismo"}, {"pk": null, "sort_order": 8, "page": 5, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": null, "sort_order": 0, "page": 5, "image": 37, "caption": null}, {"pk": null, "sort_order": 1, "page": 5, "image": 38, "caption": null}], "dias": [{"pk": 3, "sort_order": 0, "page": 5, "item": "<h2 data-block-key=\\"17ptc\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"dqhi7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\"cdujj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>"}, {"pk": null, "sort_order": 1, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\"6i70p\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"7ot7t\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"79tk4\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"d1fn6\\">Salida con destino a Lima.</p>"}, {"pk": null, "sort_order": 2, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\"18bam\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"37upu\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"9cld4\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>"}, {"pk": null, "sort_order": 3, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"asp0m\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"c2o7h\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"84da3\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": null, "sort_order": 4, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 5: Machupicchu</h2><p data-block-key=\\"9akh3\\"></p><p data-block-key=\\"8hji2\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"33v60\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"7rj5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"b9l95\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 5, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\"dbi3g\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"5ci7j\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 6, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 7: TRC Ccaccaccollo</h2><p data-block-key=\\"7edm5\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"52sh7\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"8d4p2\\">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"diobk\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": null, "sort_order": 7, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 8: Retorno</h2><p data-block-key=\\"6qg4c\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"4uitg\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>"}]}	\N	5	3	42	1	PERÚ 8 DIAS 7 NOCHES
105	2024-07-24 23:52:59.641708+00	{"pk": 5, "path": "0001000200010001", "depth": 4, "numchild": 0, "translation_key": "f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8", "locale": 1, "latest_revision": 104, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-04T21:10:27.232Z", "last_published_at": "2024-07-14T00:21:40.550Z", "live_revision": 46, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 8 DIAS 7 NOCHES", "draft_title": "PER\\u00da 8 DIAS 7 NOCHES", "slug": "el-camino-de-los-dioses", "content_type": 42, "url_path": "/peru-destino-seguro/global/el-camino-de-los-dioses/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T23:52:34.989Z", "alias_of": null, "background": 1, "featuredImage": 36, "precio": "997.00", "duracion": "8-7", "linkWord": "https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit", "linkPdf": "https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0", "linkFlyer": "https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI", "wagtail_admin_comments": [], "excluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": "Snack"}, {"pk": null, "sort_order": 1, "page": 5, "item": "Gastos adicionales"}, {"pk": null, "sort_order": 2, "page": 5, "item": "Equipaje de mano - Bodega"}, {"pk": null, "sort_order": 3, "page": 5, "item": "Servicio de caballos"}], "incluidos": [{"pk": 3, "sort_order": 0, "page": 5, "item": "Desayuno"}, {"pk": null, "sort_order": 1, "page": 5, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": null, "sort_order": 2, "page": 5, "item": "Alojamiento"}, {"pk": null, "sort_order": 3, "page": 5, "item": "Traslados"}, {"pk": null, "sort_order": 4, "page": 5, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": null, "sort_order": 5, "page": 5, "item": "Ticket de ingreso a los atractivos"}, {"pk": null, "sort_order": 6, "page": 5, "item": "Trenes"}, {"pk": null, "sort_order": 7, "page": 5, "item": "Gu\\u00eda Oficial de Turismo"}, {"pk": null, "sort_order": 8, "page": 5, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": null, "sort_order": 0, "page": 5, "image": 37, "caption": null}, {"pk": null, "sort_order": 1, "page": 5, "image": 38, "caption": null}], "dias": [{"pk": 3, "sort_order": 0, "page": 5, "item": "<h2 data-block-key=\\"17ptc\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"dqhi7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\"cdujj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>"}, {"pk": null, "sort_order": 1, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\"6i70p\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"7ot7t\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"79tk4\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"d1fn6\\">Salida con destino a Lima.</p>"}, {"pk": null, "sort_order": 2, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\"18bam\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"37upu\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"9cld4\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>"}, {"pk": null, "sort_order": 3, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"asp0m\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"c2o7h\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"84da3\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": null, "sort_order": 4, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 5: Machupicchu</h2><p data-block-key=\\"9akh3\\"></p><p data-block-key=\\"8hji2\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"33v60\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"7rj5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"b9l95\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 5, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\"dbi3g\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"5ci7j\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": null, "sort_order": 6, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 7: TRC Ccaccaccollo</h2><p data-block-key=\\"7edm5\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"52sh7\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"8d4p2\\">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"diobk\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": null, "sort_order": 7, "page": 5, "item": "<h2 data-block-key=\\"wip07\\">Dia 8: Retorno</h2><p data-block-key=\\"6qg4c\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"4uitg\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>"}]}	\N	5	3	42	1	PERÚ 8 DIAS 7 NOCHES
106	2024-07-25 00:04:01.00981+00	{"pk": 20, "path": "0001000200010005", "depth": 4, "numchild": 0, "translation_key": "65f65251-38e8-4fdc-a87e-2be6a096ef36", "locale": 1, "latest_revision": null, "live": false, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 12 DIAS 11 NOCHES", "draft_title": "PER\\u00da 12 DIAS 11 NOCHES", "slug": "per\\u00fa-12-dias-11-noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/per\\u00fa-12-dias-11-noches/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": null, "alias_of": null, "background": 31, "featuredImage": null, "precio": "1457.00", "duracion": "12-11", "linkWord": "https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit", "linkPdf": "https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs", "linkFlyer": "https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 12, "sort_order": 0, "page": 20, "image": 38, "caption": null}, {"pk": 13, "sort_order": 1, "page": 20, "image": 37, "caption": null}], "dias": [{"pk": 23, "sort_order": 0, "page": 20, "item": "<h2 data-block-key=\\"42wub\\">Dia 1: Llegada a Lima </h2><p data-block-key=\\"bcn9k\\">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estar\\u00e1 esperando por t\\u00ed. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04 podr\\u00e1s identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de su viaje.</p><p data-block-key=\\"5bnj4\\">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitaci\\u00f3n con un adicional o puedes dejar maletas en la recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>"}, {"pk": 24, "sort_order": 1, "page": 20, "item": "<h2 data-block-key=\\"42wub\\">Dia 2: City tour Lima</h2><p data-block-key=\\"7f4si\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno.</p><p data-block-key=\\"cr249\\">Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"fniri\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1 en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"60sgh\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": 25, "sort_order": 2, "page": 20, "item": "<h2 data-block-key=\\"42wub\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"1jaf8\\">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bah\\u00eda de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt, Tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"1hqq9\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"7fddu\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad</p><p data-block-key=\\"a30fa\\">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key=\\"e39s5\\">Sandboarding. salida con destino a Lima.</p>"}, {"pk": 26, "sort_order": 3, "page": 20, "item": "<h2 data-block-key=\\"42wub\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"7o9qm\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"59jal\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"8h68q\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>"}]}	\N	20	3	42	1	PERÚ 12 DIAS 11 NOCHES
107	2024-07-25 15:58:19.669499+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": 79, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T22:53:21.482Z", "last_published_at": "2024-07-24T16:23:59.350Z", "live_revision": 79, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12 days 11 nights", "draft_title": "Peru 12 days 11 nights", "slug": "peru-12-days-11-nights", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12-days-11-nights/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T16:23:51.965Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\"45puv\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	1	42	1	Peru 12 days 11 nights
108	2024-07-25 19:25:55.705561+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 103, "live": true, "has_unpublished_changes": true, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-24T23:06:20.488Z", "live_revision": 101, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 10 DIAS 9 NOCHES", "draft_title": "PER\\u00da 10 DIAS 9 NOCHES", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-24T23:46:56.642Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Snack"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Gastos adicionales"}, {"pk": 8, "sort_order": 2, "page": 18, "item": "Equipaje de mano - Bodega"}, {"pk": 9, "sort_order": 3, "page": 18, "item": "Servicio de caballos"}, {"pk": 10, "sort_order": 4, "page": 18, "item": "Seguro"}], "incluidos": [{"pk": 6, "sort_order": 0, "page": 18, "item": "Desayuno"}, {"pk": 4, "sort_order": 1, "page": 18, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": 5, "sort_order": 2, "page": 18, "item": "Alojamiento"}, {"pk": 12, "sort_order": 3, "page": 18, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": 7, "sort_order": 4, "page": 18, "item": "Traslados"}, {"pk": 13, "sort_order": 5, "page": 18, "item": "Ticket de ingreso a los atractivos"}, {"pk": 14, "sort_order": 6, "page": 18, "item": "Trenes"}, {"pk": 15, "sort_order": 7, "page": 18, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": 7, "sort_order": 0, "page": 18, "image": 33, "caption": null}, {"pk": 8, "sort_order": 1, "page": 18, "image": 34, "caption": null}, {"pk": 9, "sort_order": 2, "page": 18, "image": 35, "caption": null}, {"pk": null, "sort_order": 3, "page": 18, "image": 34, "caption": null}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"c21p7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\"bhr0u\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\"bmnkj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\"45puv\\"></p>"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "<h2 data-block-key=\\"s2as0\\">Dia 2: City tour Lima</h2><p data-block-key=\\"807gt\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\"affod\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"dh2p5\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\"8o40k\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"p2qc\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\"9l0j8\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": 8, "sort_order": 2, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"b0u50\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"fn59g\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"1a2v0\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"4aumk\\">Salida con destino a Lima.</p>"}, {"pk": 9, "sort_order": 3, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"q5p5\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"7fs20\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"lpsi\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\"c45ie\\"></p>"}, {"pk": 10, "sort_order": 4, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\"c3dqa\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\"cbjae\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\"aa564\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\"9ovv0\\">Nuestro tour finaliza en la Plaza San Francisco.</p>"}, {"pk": 11, "sort_order": 5, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"9vp0h\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"9tqc3\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\"5bgfa\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"a47k7\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": 12, "sort_order": 6, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 7 : Machupicchu</h2><p data-block-key=\\"bp9fs\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"1roq3\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\"7eipf\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"etnb5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"aeaf3\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": 13, "sort_order": 7, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\"70i1r\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\"mlog\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"dqabv\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": 14, "sort_order": 8, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\"2q3su\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"3rf01\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"6tbtl\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"2o8u1\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": 15, "sort_order": 9, "page": 18, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\"9hfcv\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"a73r9\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\"aj7pg\\"></p>"}]}	\N	18	1	42	1	PERÚ 10 DIAS 9 NOCHES
109	2024-07-25 21:22:58.304554+00	{"pk": 20, "path": "0001000200010005", "depth": 4, "numchild": 0, "translation_key": "65f65251-38e8-4fdc-a87e-2be6a096ef36", "locale": 1, "latest_revision": 106, "live": false, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 12 DIAS 11 NOCHES", "draft_title": "PER\\u00da 12 DIAS 11 NOCHES", "slug": "per\\u00fa-12-dias-11-noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/per\\u00fa-12-dias-11-noches/", "owner": 3, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-25T00:04:01.009Z", "alias_of": null, "background": 31, "featuredImage": null, "precio": "1457.00", "duracion": "12-11", "linkWord": "https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit", "linkPdf": "https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs", "linkFlyer": "https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1", "wagtail_admin_comments": [], "excluidos": [], "incluidos": [], "galleryPaquete": [{"pk": 12, "sort_order": 0, "page": 20, "image": 38, "caption": null}, {"pk": 13, "sort_order": 1, "page": 20, "image": 37, "caption": null}], "dias": [{"pk": 23, "sort_order": 0, "page": 20, "titulo": null, "item": "<h2 data-block-key=\\"42wub\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"bcn9k\\">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estar\\u00e1 esperando por t\\u00ed. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04 podr\\u00e1s identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de su viaje.</p><p data-block-key=\\"5bnj4\\">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitaci\\u00f3n con un adicional o puedes dejar maletas en la recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>"}, {"pk": 24, "sort_order": 1, "page": 20, "titulo": null, "item": "<h2 data-block-key=\\"42wub\\">Dia 2: City tour Lima</h2><p data-block-key=\\"7f4si\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno.</p><p data-block-key=\\"cr249\\">Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"fniri\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1 en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"60sgh\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": 25, "sort_order": 2, "page": 20, "titulo": null, "item": "<h2 data-block-key=\\"42wub\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"1jaf8\\">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bah\\u00eda de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt, Tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"1hqq9\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"7fddu\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad</p><p data-block-key=\\"a30fa\\">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key=\\"e39s5\\">Sandboarding. salida con destino a Lima.</p>"}, {"pk": 26, "sort_order": 3, "page": 20, "titulo": null, "item": "<h2 data-block-key=\\"42wub\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"7o9qm\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"59jal\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"8h68q\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>"}, {"pk": 27, "sort_order": 4, "page": 20, "titulo": null, "item": ""}]}	\N	20	3	42	1	PERÚ 12 DIAS 11 NOCHES
110	2024-07-26 16:39:50.232677+00	{"pk": 19, "path": "0001000300010003", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 2, "latest_revision": 107, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T22:53:21.482Z", "last_published_at": "2024-07-25T15:58:24.125Z", "live_revision": 107, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Peru 12 days 11 nights", "draft_title": "Peru 12 days 11 nights", "slug": "peru-12-days-11-nights", "content_type": 42, "url_path": "/peru-destino-seguro-en/global/peru-12-days-11-nights/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-25T15:58:19.669Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1289.00", "duracion": "12-11", "linkWord": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkPdf": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "linkFlyer": "https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge", "wagtail_admin_comments": [], "excluidos": [{"pk": 6, "sort_order": 0, "page": 19, "item": "Vuelo Lima Cusco"}, {"pk": 7, "sort_order": 1, "page": 19, "item": "Caballos"}], "incluidos": [{"pk": 8, "sort_order": 0, "page": 19, "item": "Almuerzo"}, {"pk": 9, "sort_order": 1, "page": 19, "item": "Hotel"}, {"pk": 10, "sort_order": 2, "page": 19, "item": "Guia"}, {"pk": 11, "sort_order": 3, "page": 19, "item": "Transporte"}], "galleryPaquete": [{"pk": 5, "sort_order": 0, "page": 19, "image": 29, "caption": "Caption"}, {"pk": 6, "sort_order": 1, "page": 19, "image": 30, "caption": "Caption"}], "dias": [{"pk": 6, "sort_order": 0, "page": 19, "titulo": "LLegada a Cusco", "item": "<p data-block-key=\\"s2as0\\">Llegada a Cusco</p>"}, {"pk": 7, "sort_order": 1, "page": 19, "titulo": "aoeaoe", "item": "<h2 data-block-key=\\"s2as0\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\"807gt\\">Viaje al valle Sagrado</p>"}]}	\N	19	1	42	1	Peru 12 days 11 nights
111	2024-07-26 16:54:55.178281+00	{"pk": 18, "path": "0001000200010004", "depth": 4, "numchild": 0, "translation_key": "fe4b57dd-7f99-48fe-bb5f-dfbca89eecba", "locale": 1, "latest_revision": 108, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-23T16:36:15.872Z", "last_published_at": "2024-07-25T19:26:01.591Z", "live_revision": 108, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "PER\\u00da 10 DIAS 9 NOCHES", "draft_title": "PER\\u00da 10 DIAS 9 NOCHES", "slug": "peru-12d\\u00edas-11noches", "content_type": 42, "url_path": "/peru-destino-seguro/global/peru-12d\\u00edas-11noches/", "owner": 2, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-25T19:25:55.705Z", "alias_of": null, "background": 31, "featuredImage": 32, "precio": "1145.00", "duracion": "10-9", "linkWord": "https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit", "linkPdf": "https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k", "linkFlyer": "https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi", "wagtail_admin_comments": [], "excluidos": [{"pk": 4, "sort_order": 0, "page": 18, "item": "Snack"}, {"pk": 5, "sort_order": 1, "page": 18, "item": "Gastos adicionales"}, {"pk": 8, "sort_order": 2, "page": 18, "item": "Equipaje de mano - Bodega"}, {"pk": 9, "sort_order": 3, "page": 18, "item": "Servicio de caballos"}, {"pk": 10, "sort_order": 4, "page": 18, "item": "Seguro"}], "incluidos": [{"pk": 6, "sort_order": 0, "page": 18, "item": "Desayuno"}, {"pk": 4, "sort_order": 1, "page": 18, "item": "Almuerzos (especificados en el itinerario)"}, {"pk": 5, "sort_order": 2, "page": 18, "item": "Alojamiento"}, {"pk": 12, "sort_order": 3, "page": 18, "item": "Vuelo Lima -Cusco-Lima"}, {"pk": 7, "sort_order": 4, "page": 18, "item": "Traslados"}, {"pk": 13, "sort_order": 5, "page": 18, "item": "Ticket de ingreso a los atractivos"}, {"pk": 14, "sort_order": 6, "page": 18, "item": "Trenes"}, {"pk": 15, "sort_order": 7, "page": 18, "item": "Asesoramiento constante"}], "galleryPaquete": [{"pk": 7, "sort_order": 0, "page": 18, "image": 33, "caption": null}, {"pk": 8, "sort_order": 1, "page": 18, "image": 34, "caption": null}, {"pk": 9, "sort_order": 2, "page": 18, "image": 35, "caption": null}, {"pk": 14, "sort_order": 3, "page": 18, "image": 34, "caption": null}], "dias": [{"pk": 4, "sort_order": 0, "page": 18, "titulo": "LLegada a Lima", "item": "<h2 data-block-key=\\"s2as0\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\"c21p7\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\"bhr0u\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\"bmnkj\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\"45puv\\"></p>"}, {"pk": 5, "sort_order": 1, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"s2as0\\">Dia 2: City tour Lima</h2><p data-block-key=\\"807gt\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\"affod\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\"dh2p5\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\"8o40k\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\"p2qc\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\"9l0j8\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>"}, {"pk": 8, "sort_order": 2, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\"b0u50\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\"fn59g\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\"1a2v0\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\"4aumk\\">Salida con destino a Lima.</p>"}, {"pk": 9, "sort_order": 3, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\"q5p5\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\"7fs20\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\"lpsi\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\"c45ie\\"></p>"}, {"pk": 10, "sort_order": 4, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\"c3dqa\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\"cbjae\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\"aa564\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\"9ovv0\\">Nuestro tour finaliza en la Plaza San Francisco.</p>"}, {"pk": 11, "sort_order": 5, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\"9vp0h\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\"9tqc3\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\"5bgfa\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\"a47k7\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>"}, {"pk": 12, "sort_order": 6, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 7 : Machupicchu</h2><p data-block-key=\\"bp9fs\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\"1roq3\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\"7eipf\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\"etnb5\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\"aeaf3\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>"}, {"pk": 13, "sort_order": 7, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\"70i1r\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\"mlog\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\"dqabv\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>"}, {"pk": 14, "sort_order": 8, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\"2q3su\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\"3rf01\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\"6tbtl\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\"2o8u1\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>"}, {"pk": 15, "sort_order": 9, "page": 18, "titulo": null, "item": "<h2 data-block-key=\\"tv6z1\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\"9hfcv\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\"a73r9\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\"aj7pg\\"></p>"}]}	\N	18	1	42	1	PERÚ 10 DIAS 9 NOCHES
112	2024-07-29 21:25:52.95066+00	{"pk": 13, "path": "000100020003", "depth": 3, "numchild": 0, "translation_key": "e0b70daf-21af-485c-beda-143361b4ecb6", "locale": 1, "latest_revision": 60, "live": true, "has_unpublished_changes": false, "first_published_at": "2024-07-11T21:48:48.616Z", "last_published_at": "2024-07-18T21:58:03.709Z", "live_revision": 60, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Inicio", "draft_title": "Inicio", "slug": "inicios", "content_type": 30, "url_path": "/peru-destino-seguro/inicios/", "owner": 1, "seo_title": "", "show_in_menus": false, "search_description": "", "latest_revision_created_at": "2024-07-18T21:58:01.001Z", "alias_of": null, "paqueteTitulo": "Nuestros Paquetes", "destinoTitulo": "Destinos", "formularioTitulo": "\\u00bfTiene alguna pregunta especifica?", "formularioSubtitulo": "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum", "galleryIni": "[{\\"type\\": \\"Tipo1\\", \\"value\\": {\\"photo\\": 39, \\"carouselTitulo\\": \\"EL CAMINO DE LOS TIEMPOS\\", \\"carouselDuracion\\": \\"8-7\\", \\"carouselLink\\": \\"aoeuaoeuaoue\\", \\"carouselButtonName\\": \\"Ver\\", \\"miniPhotos\\": [{\\"type\\": \\"item\\", \\"value\\": 13, \\"id\\": \\"d0907c6b-a729-4408-bbc2-397646c664a1\\"}, {\\"type\\": \\"item\\", \\"value\\": 14, \\"id\\": \\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\"}, {\\"type\\": \\"item\\", \\"value\\": 15, \\"id\\": \\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\"}]}, \\"id\\": \\"94ad5633-9fba-49dc-a3f7-695771818dbc\\"}, {\\"type\\": \\"Tipo2\\", \\"value\\": {\\"photo\\": 1, \\"carouselTitulo\\": \\"aoeuoaeu\\", \\"carouselButtonName\\": \\"aoeuaoeu\\"}, \\"id\\": \\"c4f7ff8e-c065-41da-852b-4f0246055475\\"}]", "wagtail_admin_comments": [], "faqInicio": [{"pk": 1, "sort_order": 0, "page": 13, "question": "Cuando debo viajar a Peru?", "answer": "<p data-block-key=\\"v3p0b\\">thicgidcg</p>"}]}	\N	13	1	30	1	Inicio
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
1	localhost	80	t	3	
\.


--
-- Data for Name: wagtailcore_task; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_task (id, name, active, content_type_id) FROM stdin;
1	Moderators approval	t	2
\.


--
-- Data for Name: wagtailcore_taskstate; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_taskstate (id, status, started_at, finished_at, content_type_id, revision_id, task_id, workflow_state_id, finished_by_id, comment) FROM stdin;
\.


--
-- Data for Name: wagtailcore_uploadedfile; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_uploadedfile (id, file, for_content_type_id, uploaded_by_user_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflow; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_workflow (id, name, active) FROM stdin;
1	Moderators approval	t
\.


--
-- Data for Name: wagtailcore_workflowcontenttype; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_workflowcontenttype (content_type_id, workflow_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflowpage; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_workflowpage (page_id, workflow_id) FROM stdin;
1	1
\.


--
-- Data for Name: wagtailcore_workflowstate; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_workflowstate (id, status, created_at, current_task_state_id, object_id, requested_by_id, workflow_id, content_type_id, base_content_type_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_workflowtask; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailcore_workflowtask (id, sort_order, task_id, workflow_id) FROM stdin;
1	0	1	1
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size, file_hash) FROM stdin;
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated, hash, cache_until) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailimages_rendition (id, file, width, height, focal_point_key, filter_spec, image_id) FROM stdin;
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id, automatically_created, created_at, redirect_page_route_path) FROM stdin;
1	/pages/global/peru-12d%C3%ADas-11noches	t		19	1	t	2024-07-23 22:52:57.611603+00	
\.


--
-- Data for Name: wagtailsearch_indexentry; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailsearch_indexentry (id, object_id, title_norm, content_type_id, autocomplete, body, title) FROM stdin;
1	3	0.6578947368421053	28	Peru Destino Seguro		Peru Destino Seguro
2	4	2.0833333333333335	66	Global		Global
3	1	0.5585594594594594	32	Screenshot from 2024-05-24 14-58-35-1		Screenshot from 2024-05-24 14-58-35-1
4	2	0.6928571428571428	32	Screenshot from 2024-02-20 05-52-15		Screenshot from 2024-02-20 05-52-15
5	5	1.0434782608695652	42	PERÚ 8 DIAS 7 NOCHES		PERÚ 8 DIAS 7 NOCHES
6	6	1.119047619047619	47	Collpa de Guacamalleae		Collpa de Guacamalleae
7	1	5.178575	1	Root		Root
8	7	1.0789473684210527	28	Peru Safe Destiny		Peru Safe Destiny
9	8	3.1111166666666663	66	Global		Global
10	9	0.8304347826086957	42	The roads of gods		The roads of gods
11	10	0.917747619047619	47	Collpa de Guacamallos		Collpa de Guacamallos
12	3	1.8	32	graduacion		graduacion
13	11	2.15385	36	Nosotros		Nosotros
14	12	2.071425	36	About		About
15	13	2.276185714285714	30	Inicio		Inicio
16	4	1.3072916666666667	32	machuDestino		machuDestino
17	5	1.2892166666666667	32	limaArequipa		limaArequipa
18	6	1.0296266666666667	32	arequipaDestino		arequipaDestino
19	7	1.3827727272727273	32	punoDestino		punoDestino
20	8	1.4949999999999999	32	icaDestino		icaDestino
21	9	3.60715	32	paq1		paq1
22	10	3.488625	32	paq1		paq1
23	14	0.6219260869565217	47	Collpa de Manu		Collpa de Manu
24	11	0.7962944444444444	32	backgroundNosotros		backgroundNosotros
25	12	0.9	32	imagenFundadores		imagenFundadores
26	13	1.0274714285714286	32	limaDestinoMob		limaDestinoMob
27	14	0.8065833333333333	32	arequipaDestinoMob		arequipaDestinoMob
28	15	1.0357142857142858	32	punoDestinoMob		punoDestinoMob
29	15	2.3678166666666667	30	Home		Home
30	16	1.0846153846153845	32	contactarBack		contactarBack
31	16	1.5483888888888888	67	Contactar		Contactar
32	17	1.5312555555555556	67	Contact		Contact
33	17	1.3606099999999999	32	Group 1573		Group 1573
34	18	1.045246153846154	32	protegemeIcon		protegemeIcon
35	19	1.4952333333333334	32	image 647		image 647
36	20	1.4814777777777777	32	image 646		image 646
37	21	1.4684666666666668	32	unnamed 1		unnamed 1
38	22	1.4561444444444445	32	Group (5)		Group (5)
39	23	1.4444444444444444	32	Group (6)		Group (6)
40	24	1.4333333333333333	32	Group (7)		Group (7)
41	25	1.4227666666666667	32	Group (8)		Group (8)
42	26	2.10715	32	Vector		Vector
43	27	1.3953444444444445	32	Group (9)		Group (9)
45	29	1.0050153846153846	32	Mapi Full day		Mapi Full day
46	30	0.816575	32	Inlcusiones Mapi		Inlcusiones Mapi
47	31	0.420878125	32	338a6885465c49ecb03dbcb61783698b		338a6885465c49ecb03dbcb61783698b
48	18	0.6488095238095238	42	PERÚ 10 DIAS 9 NOCHES		PERÚ 10 DIAS 9 NOCHES
49	19	0.6559761904761905	42	Peru 12 days 11 nights		Peru 12 days 11 nights
50	32	0.7380944444444445	32	PROGRAMA 10D9N Perú	Perú	PROGRAMA 10D9N
51	33	1.1963636363636363	32	Machupicchu Machupicchu	Machupicchu	Machupicchu
52	34	4.320266666666667	32	Ica Ica	Ica	Ica
53	35	4.2564	32	TRC TRC	TRC	TRC
54	36	0.9177928571428572	32	PROGRAMA 10D9N Paquetes	Paquetes	PROGRAMA 10D9N
55	37	1.0694416666666666	32	Maachupicchu Machupicchu	Machupicchu	Maachupicchu
56	38	2.5381799999999997	32	Oasis Oasis	Oasis	Oasis
57	20	0.5819818181818182	42	PERÚ 12 DIAS 11 NOCHES		PERÚ 12 DIAS 11 NOCHES
58	39	1.5899125	32	machuIni		machuIni
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: admin; Owner: admin
--

COPY admin.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar, updated_comments_notifications, dismissibles, theme, density) FROM stdin;
1	t	t	t	1				t	{}	system	default
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_group_permissions_id_seq', 18, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_permission_id_seq', 268, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_user_groups_id_seq', 5, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.auth_user_user_permissions_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.django_content_type_id_seq', 67, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.django_migrations_id_seq', 219, true);


--
-- Name: home_certificados_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_certificados_id_seq', 1, true);


--
-- Name: home_cloudinaryimage_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_cloudinaryimage_id_seq', 39, true);


--
-- Name: home_cloudinaryrendition_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_cloudinaryrendition_id_seq', 50, true);


--
-- Name: home_destino_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_destino_id_seq', 5, true);


--
-- Name: home_estadisticas_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_estadisticas_id_seq', 6, true);


--
-- Name: home_faq_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_faq_id_seq', 2, true);


--
-- Name: home_informacion_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_informacion_id_seq', 1, true);


--
-- Name: home_partners_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_partners_id_seq', 5, true);


--
-- Name: home_tourcategory_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_tourcategory_id_seq', 1, true);


--
-- Name: home_valores_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.home_valores_id_seq', 6, true);


--
-- Name: paquete_dias_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.paquete_dias_id_seq', 27, true);


--
-- Name: paquete_excluidoitempaquete_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.paquete_excluidoitempaquete_id_seq', 13, true);


--
-- Name: paquete_gallerycarousel_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.paquete_gallerycarousel_id_seq', 14, true);


--
-- Name: paquete_incluidoitempaquete_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.paquete_incluidoitempaquete_id_seq', 23, true);


--
-- Name: simple_translation_simpletranslation_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.simple_translation_simpletranslation_id_seq', 1, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.taggit_tag_id_seq', 6, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.taggit_taggeditem_id_seq', 8, true);


--
-- Name: tour_excluidoitempaquete_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.tour_excluidoitempaquete_id_seq', 5, true);


--
-- Name: tour_gallerycarousel_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.tour_gallerycarousel_id_seq', 3, true);


--
-- Name: tour_incluidoitempaquete_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.tour_incluidoitempaquete_id_seq', 3, true);


--
-- Name: tour_tour_categories_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.tour_tour_categories_id_seq', 1, true);


--
-- Name: wagtailadmin_admin_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailadmin_admin_id_seq', 1, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_collection_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_collectionviewrestriction_groups_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_collectionviewrestriction_id_seq', 1, true);


--
-- Name: wagtailcore_comment_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_comment_id_seq', 1, true);


--
-- Name: wagtailcore_commentreply_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_commentreply_id_seq', 1, true);


--
-- Name: wagtailcore_groupapprovaltask_groups_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_groupapprovaltask_groups_id_seq', 1, true);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_groupcollectionpermission_id_seq', 12, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_grouppagepermission_id_seq', 7, true);


--
-- Name: wagtailcore_locale_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_locale_id_seq', 2, true);


--
-- Name: wagtailcore_modellogentry_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_modellogentry_id_seq', 16, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_page_id_seq', 20, true);


--
-- Name: wagtailcore_pagelogentry_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_pagelogentry_id_seq', 222, true);


--
-- Name: wagtailcore_pagesubscription_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_pagesubscription_id_seq', 30, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_pageviewrestriction_groups_id_seq', 1, true);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_pageviewrestriction_id_seq', 1, true);


--
-- Name: wagtailcore_referenceindex_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_referenceindex_id_seq', 152, true);


--
-- Name: wagtailcore_revision_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_revision_id_seq', 112, true);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_site_id_seq', 1, true);


--
-- Name: wagtailcore_task_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_task_id_seq', 1, true);


--
-- Name: wagtailcore_taskstate_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_taskstate_id_seq', 1, true);


--
-- Name: wagtailcore_uploadedfile_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_uploadedfile_id_seq', 1, true);


--
-- Name: wagtailcore_workflow_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_workflow_id_seq', 1, true);


--
-- Name: wagtailcore_workflowstate_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_workflowstate_id_seq', 1, true);


--
-- Name: wagtailcore_workflowtask_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailcore_workflowtask_id_seq', 1, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtaildocs_document_id_seq', 1, true);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailembeds_embed_id_seq', 1, true);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailforms_formsubmission_id_seq', 1, true);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailimages_image_id_seq', 1, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailimages_rendition_id_seq', 1, true);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailredirects_redirect_id_seq', 1, true);


--
-- Name: wagtailsearch_indexentry_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailsearch_indexentry_id_seq', 58, true);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: auth_group idx_16391_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group
    ADD CONSTRAINT idx_16391_primary PRIMARY KEY (id);


--
-- Name: auth_group_permissions idx_16396_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group_permissions
    ADD CONSTRAINT idx_16396_primary PRIMARY KEY (id);


--
-- Name: auth_permission idx_16401_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_permission
    ADD CONSTRAINT idx_16401_primary PRIMARY KEY (id);


--
-- Name: auth_user idx_16406_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user
    ADD CONSTRAINT idx_16406_primary PRIMARY KEY (id);


--
-- Name: auth_user_groups idx_16413_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_groups
    ADD CONSTRAINT idx_16413_primary PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions idx_16418_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_user_permissions
    ADD CONSTRAINT idx_16418_primary PRIMARY KEY (id);


--
-- Name: django_admin_log idx_16423_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_admin_log
    ADD CONSTRAINT idx_16423_primary PRIMARY KEY (id);


--
-- Name: django_content_type idx_16430_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_content_type
    ADD CONSTRAINT idx_16430_primary PRIMARY KEY (id);


--
-- Name: django_migrations idx_16435_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_migrations
    ADD CONSTRAINT idx_16435_primary PRIMARY KEY (id);


--
-- Name: django_session idx_16441_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_session
    ADD CONSTRAINT idx_16441_primary PRIMARY KEY (session_key);


--
-- Name: home_certificados idx_16447_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_certificados
    ADD CONSTRAINT idx_16447_primary PRIMARY KEY (id);


--
-- Name: home_cloudinaryimage idx_16452_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryimage
    ADD CONSTRAINT idx_16452_primary PRIMARY KEY (id);


--
-- Name: home_cloudinaryrendition idx_16457_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryrendition
    ADD CONSTRAINT idx_16457_primary PRIMARY KEY (id);


--
-- Name: home_contacto idx_16461_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_contacto
    ADD CONSTRAINT idx_16461_primary PRIMARY KEY (page_ptr_id);


--
-- Name: home_destino idx_16465_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_destino
    ADD CONSTRAINT idx_16465_primary PRIMARY KEY (id);


--
-- Name: home_estadisticas idx_16470_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_estadisticas
    ADD CONSTRAINT idx_16470_primary PRIMARY KEY (id);


--
-- Name: home_faq idx_16475_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_faq
    ADD CONSTRAINT idx_16475_primary PRIMARY KEY (id);


--
-- Name: home_global idx_16481_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_global
    ADD CONSTRAINT idx_16481_primary PRIMARY KEY (page_ptr_id);


--
-- Name: home_home idx_16486_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_home
    ADD CONSTRAINT idx_16486_primary PRIMARY KEY (page_ptr_id);


--
-- Name: home_informacion idx_16492_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_informacion
    ADD CONSTRAINT idx_16492_primary PRIMARY KEY (id);


--
-- Name: home_inicio idx_16498_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_inicio
    ADD CONSTRAINT idx_16498_primary PRIMARY KEY (page_ptr_id);


--
-- Name: home_nosotros idx_16503_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_nosotros
    ADD CONSTRAINT idx_16503_primary PRIMARY KEY (page_ptr_id);


--
-- Name: home_partners idx_16509_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_partners
    ADD CONSTRAINT idx_16509_primary PRIMARY KEY (id);


--
-- Name: home_tourcategory idx_16514_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_tourcategory
    ADD CONSTRAINT idx_16514_primary PRIMARY KEY (id);


--
-- Name: home_valores idx_16519_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_valores
    ADD CONSTRAINT idx_16519_primary PRIMARY KEY (id);


--
-- Name: paquete_dias idx_16524_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_dias
    ADD CONSTRAINT idx_16524_primary PRIMARY KEY (id);


--
-- Name: paquete_excluidoitempaquete idx_16531_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_excluidoitempaquete
    ADD CONSTRAINT idx_16531_primary PRIMARY KEY (id);


--
-- Name: paquete_gallerycarousel idx_16536_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_gallerycarousel
    ADD CONSTRAINT idx_16536_primary PRIMARY KEY (id);


--
-- Name: paquete_incluidoitempaquete idx_16541_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_incluidoitempaquete
    ADD CONSTRAINT idx_16541_primary PRIMARY KEY (id);


--
-- Name: paquete_paquete idx_16545_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_paquete
    ADD CONSTRAINT idx_16545_primary PRIMARY KEY (page_ptr_id);


--
-- Name: simple_translation_simpletranslation idx_16549_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.simple_translation_simpletranslation
    ADD CONSTRAINT idx_16549_primary PRIMARY KEY (id);


--
-- Name: taggit_tag idx_16554_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_tag
    ADD CONSTRAINT idx_16554_primary PRIMARY KEY (id);


--
-- Name: taggit_taggeditem idx_16559_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_taggeditem
    ADD CONSTRAINT idx_16559_primary PRIMARY KEY (id);


--
-- Name: tour_excluidoitempaquete idx_16564_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_excluidoitempaquete
    ADD CONSTRAINT idx_16564_primary PRIMARY KEY (id);


--
-- Name: tour_gallerycarousel idx_16569_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_gallerycarousel
    ADD CONSTRAINT idx_16569_primary PRIMARY KEY (id);


--
-- Name: tour_incluidoitempaquete idx_16574_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_incluidoitempaquete
    ADD CONSTRAINT idx_16574_primary PRIMARY KEY (id);


--
-- Name: tour_tour idx_16578_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour
    ADD CONSTRAINT idx_16578_primary PRIMARY KEY (page_ptr_id);


--
-- Name: tour_tour_categories idx_16584_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour_categories
    ADD CONSTRAINT idx_16584_primary PRIMARY KEY (id);


--
-- Name: wagtailadmin_admin idx_16589_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailadmin_admin
    ADD CONSTRAINT idx_16589_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_collection idx_16594_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collection
    ADD CONSTRAINT idx_16594_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction idx_16601_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT idx_16601_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups idx_16606_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT idx_16606_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_comment idx_16611_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment
    ADD CONSTRAINT idx_16611_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_commentreply idx_16618_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_commentreply
    ADD CONSTRAINT idx_16618_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_groupapprovaltask idx_16624_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask
    ADD CONSTRAINT idx_16624_primary PRIMARY KEY (task_ptr_id);


--
-- Name: wagtailcore_groupapprovaltask_groups idx_16628_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT idx_16628_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission idx_16633_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT idx_16633_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission idx_16638_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_grouppagepermission
    ADD CONSTRAINT idx_16638_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_locale idx_16643_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_locale
    ADD CONSTRAINT idx_16643_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_modellogentry idx_16648_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_modellogentry
    ADD CONSTRAINT idx_16648_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_page idx_16655_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT idx_16655_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_pagelogentry idx_16662_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagelogentry
    ADD CONSTRAINT idx_16662_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_pagesubscription idx_16669_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagesubscription
    ADD CONSTRAINT idx_16669_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction idx_16674_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction
    ADD CONSTRAINT idx_16674_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups idx_16679_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT idx_16679_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_referenceindex idx_16684_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_referenceindex
    ADD CONSTRAINT idx_16684_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_revision idx_16691_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_revision
    ADD CONSTRAINT idx_16691_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_site idx_16698_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_site
    ADD CONSTRAINT idx_16698_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_task idx_16705_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_task
    ADD CONSTRAINT idx_16705_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_taskstate idx_16710_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT idx_16710_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_uploadedfile idx_16717_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_uploadedfile
    ADD CONSTRAINT idx_16717_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_workflow idx_16722_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflow
    ADD CONSTRAINT idx_16722_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_workflowcontenttype idx_16726_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowcontenttype
    ADD CONSTRAINT idx_16726_primary PRIMARY KEY (content_type_id);


--
-- Name: wagtailcore_workflowpage idx_16729_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowpage
    ADD CONSTRAINT idx_16729_primary PRIMARY KEY (page_id);


--
-- Name: wagtailcore_workflowstate idx_16733_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT idx_16733_primary PRIMARY KEY (id);


--
-- Name: wagtailcore_workflowtask idx_16738_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowtask
    ADD CONSTRAINT idx_16738_primary PRIMARY KEY (id);


--
-- Name: wagtaildocs_document idx_16743_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtaildocs_document
    ADD CONSTRAINT idx_16743_primary PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed idx_16748_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailembeds_embed
    ADD CONSTRAINT idx_16748_primary PRIMARY KEY (id);


--
-- Name: wagtailforms_formsubmission idx_16755_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailforms_formsubmission
    ADD CONSTRAINT idx_16755_primary PRIMARY KEY (id);


--
-- Name: wagtailimages_image idx_16762_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_image
    ADD CONSTRAINT idx_16762_primary PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition idx_16767_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_rendition
    ADD CONSTRAINT idx_16767_primary PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect idx_16772_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailredirects_redirect
    ADD CONSTRAINT idx_16772_primary PRIMARY KEY (id);


--
-- Name: wagtailsearch_indexentry idx_16779_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailsearch_indexentry
    ADD CONSTRAINT idx_16779_primary PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile idx_16786_primary; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailusers_userprofile
    ADD CONSTRAINT idx_16786_primary PRIMARY KEY (id);


--
-- Name: idx_16391_name; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16391_name ON admin.auth_group USING btree (name);


--
-- Name: idx_16396_auth_group_permissio_permission_id_84c5c92e_fk_auth_p; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16396_auth_group_permissio_permission_id_84c5c92e_fk_auth_p ON admin.auth_group_permissions USING btree (permission_id);


--
-- Name: idx_16396_auth_group_permissions_group_id_permission_id_0cd325b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16396_auth_group_permissions_group_id_permission_id_0cd325b ON admin.auth_group_permissions USING btree (group_id, permission_id);


--
-- Name: idx_16401_auth_permission_content_type_id_codename_01ab375a_uni; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16401_auth_permission_content_type_id_codename_01ab375a_uni ON admin.auth_permission USING btree (content_type_id, codename);


--
-- Name: idx_16406_username; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16406_username ON admin.auth_user USING btree (username);


--
-- Name: idx_16413_auth_user_groups_group_id_97559544_fk_auth_group_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16413_auth_user_groups_group_id_97559544_fk_auth_group_id ON admin.auth_user_groups USING btree (group_id);


--
-- Name: idx_16413_auth_user_groups_user_id_group_id_94350c0c_uniq; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16413_auth_user_groups_user_id_group_id_94350c0c_uniq ON admin.auth_user_groups USING btree (user_id, group_id);


--
-- Name: idx_16418_auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_p; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16418_auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_p ON admin.auth_user_user_permissions USING btree (permission_id);


--
-- Name: idx_16418_auth_user_user_permissions_user_id_permission_id_14a6; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16418_auth_user_user_permissions_user_id_permission_id_14a6 ON admin.auth_user_user_permissions USING btree (user_id, permission_id);


--
-- Name: idx_16423_django_admin_log_content_type_id_c4bce8eb_fk_django_c; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16423_django_admin_log_content_type_id_c4bce8eb_fk_django_c ON admin.django_admin_log USING btree (content_type_id);


--
-- Name: idx_16423_django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16423_django_admin_log_user_id_c564eba6_fk_auth_user_id ON admin.django_admin_log USING btree (user_id);


--
-- Name: idx_16430_django_content_type_app_label_model_76bd3d3b_uniq; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16430_django_content_type_app_label_model_76bd3d3b_uniq ON admin.django_content_type USING btree (app_label, model);


--
-- Name: idx_16441_django_session_expire_date_a5c62663; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16441_django_session_expire_date_a5c62663 ON admin.django_session USING btree (expire_date);


--
-- Name: idx_16447_home_certificados_image_id_410cc776_fk_home_cloudinar; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16447_home_certificados_image_id_410cc776_fk_home_cloudinar ON admin.home_certificados USING btree (image_id);


--
-- Name: idx_16447_home_certificados_page_id_c529d124; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16447_home_certificados_page_id_c529d124 ON admin.home_certificados USING btree (page_id);


--
-- Name: idx_16452_home_cloudinaryimage_collection_id_311638fc_fk_wagtai; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16452_home_cloudinaryimage_collection_id_311638fc_fk_wagtai ON admin.home_cloudinaryimage USING btree (collection_id);


--
-- Name: idx_16452_home_cloudinaryimage_created_at_654e00fa; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16452_home_cloudinaryimage_created_at_654e00fa ON admin.home_cloudinaryimage USING btree (created_at);


--
-- Name: idx_16452_home_cloudinaryimage_file_hash_33f6569f; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16452_home_cloudinaryimage_file_hash_33f6569f ON admin.home_cloudinaryimage USING btree (file_hash);


--
-- Name: idx_16452_home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16452_home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_ ON admin.home_cloudinaryimage USING btree (uploaded_by_user_id);


--
-- Name: idx_16457_home_cloudinaryrendition_filter_spec_21cedd8e; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16457_home_cloudinaryrendition_filter_spec_21cedd8e ON admin.home_cloudinaryrendition USING btree (filter_spec);


--
-- Name: idx_16457_home_cloudinaryrendition_image_id_filter_spec_foc_7d9; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16457_home_cloudinaryrendition_image_id_filter_spec_foc_7d9 ON admin.home_cloudinaryrendition USING btree (image_id, filter_spec, focal_point_key);


--
-- Name: idx_16461_home_contacto_background_id_812a8659_fk_home_cloudina; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16461_home_contacto_background_id_812a8659_fk_home_cloudina ON admin.home_contacto USING btree (background_id);


--
-- Name: idx_16465_home_destino_background_id_8c39578d_fk_home_cloudinar; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16465_home_destino_background_id_8c39578d_fk_home_cloudinar ON admin.home_destino USING btree (background_id);


--
-- Name: idx_16465_home_destino_backgroundmobile_id_e70cd017_fk_home_clo; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16465_home_destino_backgroundmobile_id_e70cd017_fk_home_clo ON admin.home_destino USING btree (backgroundmobile_id);


--
-- Name: idx_16470_home_estadisticas_page_id_6e7f74bd; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16470_home_estadisticas_page_id_6e7f74bd ON admin.home_estadisticas USING btree (page_id);


--
-- Name: idx_16475_home_faq_page_id_0e8eefe9; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16475_home_faq_page_id_0e8eefe9 ON admin.home_faq USING btree (page_id);


--
-- Name: idx_16503_home_nosotros_background_id_da3ca9b2_fk_home_cloudina; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16503_home_nosotros_background_id_da3ca9b2_fk_home_cloudina ON admin.home_nosotros USING btree (background_id);


--
-- Name: idx_16503_home_nosotros_imageparrafo_id_8e5db0b2_fk_home_clou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16503_home_nosotros_imageparrafo_id_8e5db0b2_fk_home_clou ON admin.home_nosotros USING btree (imageparrafo_id);


--
-- Name: idx_16509_home_partners_image_id_e0614efb_fk_home_cloudinaryima; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16509_home_partners_image_id_e0614efb_fk_home_cloudinaryima ON admin.home_partners USING btree (image_id);


--
-- Name: idx_16509_home_partners_page_id_b6820531; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16509_home_partners_page_id_b6820531 ON admin.home_partners USING btree (page_id);


--
-- Name: idx_16519_home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16519_home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_ ON admin.home_valores USING btree (img_id);


--
-- Name: idx_16519_home_valores_page_id_4754f79e; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16519_home_valores_page_id_4754f79e ON admin.home_valores USING btree (page_id);


--
-- Name: idx_16524_paquete_dias_page_id_837da2f5; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16524_paquete_dias_page_id_837da2f5 ON admin.paquete_dias USING btree (page_id);


--
-- Name: idx_16531_paquete_excluidoitempaquete_page_id_b1311125; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16531_paquete_excluidoitempaquete_page_id_b1311125 ON admin.paquete_excluidoitempaquete USING btree (page_id);


--
-- Name: idx_16536_paquete_gallerycarou_image_id_c2e364b2_fk_home_clou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16536_paquete_gallerycarou_image_id_c2e364b2_fk_home_clou ON admin.paquete_gallerycarousel USING btree (image_id);


--
-- Name: idx_16536_paquete_gallerycarousel_page_id_18f80dd1; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16536_paquete_gallerycarousel_page_id_18f80dd1 ON admin.paquete_gallerycarousel USING btree (page_id);


--
-- Name: idx_16541_paquete_incluidoitempaquete_page_id_01be5d1a; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16541_paquete_incluidoitempaquete_page_id_01be5d1a ON admin.paquete_incluidoitempaquete USING btree (page_id);


--
-- Name: idx_16545_paquete_paquete_background_id_408962cd_fk_home_clou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16545_paquete_paquete_background_id_408962cd_fk_home_clou ON admin.paquete_paquete USING btree (background_id);


--
-- Name: idx_16545_paquete_paquete_featuredimage_id_c1251166_fk_home_clo; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16545_paquete_paquete_featuredimage_id_c1251166_fk_home_clo ON admin.paquete_paquete USING btree (featuredimage_id);


--
-- Name: idx_16554_name; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16554_name ON admin.taggit_tag USING btree (name);


--
-- Name: idx_16554_slug; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16554_slug ON admin.taggit_tag USING btree (slug);


--
-- Name: idx_16559_taggit_tagg_content_8fc721_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16559_taggit_tagg_content_8fc721_idx ON admin.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: idx_16559_taggit_taggeditem_content_type_id_object_id_tag_id_4b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16559_taggit_taggeditem_content_type_id_object_id_tag_id_4b ON admin.taggit_taggeditem USING btree (content_type_id, object_id, tag_id);


--
-- Name: idx_16559_taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16559_taggit_taggeditem_object_id_e2d7d1df ON admin.taggit_taggeditem USING btree (object_id);


--
-- Name: idx_16559_taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16559_taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id ON admin.taggit_taggeditem USING btree (tag_id);


--
-- Name: idx_16564_tour_excluidoitempaquete_page_id_3176f6fd; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16564_tour_excluidoitempaquete_page_id_3176f6fd ON admin.tour_excluidoitempaquete USING btree (page_id);


--
-- Name: idx_16569_tour_gallerycarousel_image_id_b6cf3765_fk_home_clou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16569_tour_gallerycarousel_image_id_b6cf3765_fk_home_clou ON admin.tour_gallerycarousel USING btree (image_id);


--
-- Name: idx_16569_tour_gallerycarousel_page_id_e3894881; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16569_tour_gallerycarousel_page_id_e3894881 ON admin.tour_gallerycarousel USING btree (page_id);


--
-- Name: idx_16574_tour_incluidoitempaquete_page_id_e64ef6bc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16574_tour_incluidoitempaquete_page_id_e64ef6bc ON admin.tour_incluidoitempaquete USING btree (page_id);


--
-- Name: idx_16578_tour_tour_background_id_57ff5614_fk_home_cloudinaryim; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16578_tour_tour_background_id_57ff5614_fk_home_cloudinaryim ON admin.tour_tour USING btree (background_id);


--
-- Name: idx_16578_tour_tour_featuredimage_id_6cc0a601_fk_home_cloudinar; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16578_tour_tour_featuredimage_id_6cc0a601_fk_home_cloudinar ON admin.tour_tour USING btree (featuredimage_id);


--
-- Name: idx_16578_tour_tour_tourdestino_id_c3ed0f76_fk_home_destino_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16578_tour_tour_tourdestino_id_c3ed0f76_fk_home_destino_id ON admin.tour_tour USING btree (tourdestino_id);


--
-- Name: idx_16584_tour_tour_categories_tour_id_tourcategory_id_c784b55d; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16584_tour_tour_categories_tour_id_tourcategory_id_c784b55d ON admin.tour_tour_categories USING btree (tour_id, tourcategory_id);


--
-- Name: idx_16584_tour_tour_categories_tourcategory_id_5c0462c4_fk_home; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16584_tour_tour_categories_tourcategory_id_5c0462c4_fk_home ON admin.tour_tour_categories USING btree (tourcategory_id);


--
-- Name: idx_16594_path; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16594_path ON admin.wagtailcore_collection USING btree (path);


--
-- Name: idx_16601_wagtailcore_collecti_collection_id_761908ec_fk_wagtai; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16601_wagtailcore_collecti_collection_id_761908ec_fk_wagtai ON admin.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: idx_16606_wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16606_wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou ON admin.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: idx_16606_wagtailcore_collectionvi_collectionviewrestrictio_988; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16606_wagtailcore_collectionvi_collectionviewrestrictio_988 ON admin.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id, group_id);


--
-- Name: idx_16611_wagtailcore_comment_page_id_108444b5; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16611_wagtailcore_comment_page_id_108444b5 ON admin.wagtailcore_comment USING btree (page_id);


--
-- Name: idx_16611_wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_u; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16611_wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_u ON admin.wagtailcore_comment USING btree (resolved_by_id);


--
-- Name: idx_16611_wagtailcore_comment_revision_created_id_1d058279_fk_w; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16611_wagtailcore_comment_revision_created_id_1d058279_fk_w ON admin.wagtailcore_comment USING btree (revision_created_id);


--
-- Name: idx_16611_wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16611_wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id ON admin.wagtailcore_comment USING btree (user_id);


--
-- Name: idx_16618_wagtailcore_commentreply_comment_id_afc7e027; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16618_wagtailcore_commentreply_comment_id_afc7e027 ON admin.wagtailcore_commentreply USING btree (comment_id);


--
-- Name: idx_16618_wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_use; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16618_wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_use ON admin.wagtailcore_commentreply USING btree (user_id);


--
-- Name: idx_16628_wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16628_wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou ON admin.wagtailcore_groupapprovaltask_groups USING btree (group_id);


--
-- Name: idx_16628_wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16628_wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5 ON admin.wagtailcore_groupapprovaltask_groups USING btree (groupapprovaltask_id, group_id);


--
-- Name: idx_16633_wagtailcore_groupcol_collection_id_5423575a_fk_wagtai; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16633_wagtailcore_groupcol_collection_id_5423575a_fk_wagtai ON admin.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: idx_16633_wagtailcore_groupcol_permission_id_1b626275_fk_auth_p; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16633_wagtailcore_groupcol_permission_id_1b626275_fk_auth_p ON admin.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: idx_16633_wagtailcore_groupcollect_group_id_collection_id_p_a21; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16633_wagtailcore_groupcollect_group_id_collection_id_p_a21 ON admin.wagtailcore_groupcollectionpermission USING btree (group_id, collection_id, permission_id);


--
-- Name: idx_16638_unique_permission; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16638_unique_permission ON admin.wagtailcore_grouppagepermission USING btree (group_id, page_id, permission_id);


--
-- Name: idx_16638_wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16638_wagtailcore_grouppag_page_id_710b114a_fk_wagtailco ON admin.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: idx_16638_wagtailcore_grouppag_permission_id_05acb22e_fk_auth_p; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16638_wagtailcore_grouppag_permission_id_05acb22e_fk_auth_p ON admin.wagtailcore_grouppagepermission USING btree (permission_id);


--
-- Name: idx_16638_wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16638_wagtailcore_grouppagepermission_group_id_fc07e671 ON admin.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: idx_16643_language_code; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16643_language_code ON admin.wagtailcore_locale USING btree (language_code);


--
-- Name: idx_16648_wagtailcore_modellog_content_type_id_68849e77_fk_djan; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellog_content_type_id_68849e77_fk_djan ON admin.wagtailcore_modellogentry USING btree (content_type_id);


--
-- Name: idx_16648_wagtailcore_modellogentry_action_d2d856ee; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_action_d2d856ee ON admin.wagtailcore_modellogentry USING btree (action);


--
-- Name: idx_16648_wagtailcore_modellogentry_content_changed_8bc39742; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_content_changed_8bc39742 ON admin.wagtailcore_modellogentry USING btree (content_changed);


--
-- Name: idx_16648_wagtailcore_modellogentry_object_id_e0e7d4ef; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_object_id_e0e7d4ef ON admin.wagtailcore_modellogentry USING btree (object_id);


--
-- Name: idx_16648_wagtailcore_modellogentry_revision_id_df6ca33a; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_revision_id_df6ca33a ON admin.wagtailcore_modellogentry USING btree (revision_id);


--
-- Name: idx_16648_wagtailcore_modellogentry_timestamp_9694521b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_timestamp_9694521b ON admin.wagtailcore_modellogentry USING btree ("timestamp");


--
-- Name: idx_16648_wagtailcore_modellogentry_user_id_0278d1bf; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16648_wagtailcore_modellogentry_user_id_0278d1bf ON admin.wagtailcore_modellogentry USING btree (user_id);


--
-- Name: idx_16655_path; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16655_path ON admin.wagtailcore_page USING btree (path);


--
-- Name: idx_16655_wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_ ON admin.wagtailcore_page USING btree (alias_of_id);


--
-- Name: idx_16655_wagtailcore_page_content_type_id_c28424df_fk_django_c; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_content_type_id_c28424df_fk_django_c ON admin.wagtailcore_page USING btree (content_type_id);


--
-- Name: idx_16655_wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_first_published_at_2b5dd637 ON admin.wagtailcore_page USING btree (first_published_at);


--
-- Name: idx_16655_wagtailcore_page_latest_revision_id_e60fef51_fk_wagta; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_latest_revision_id_e60fef51_fk_wagta ON admin.wagtailcore_page USING btree (latest_revision_id);


--
-- Name: idx_16655_wagtailcore_page_live_revision_id_930bd822_fk_wagtail; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_live_revision_id_930bd822_fk_wagtail ON admin.wagtailcore_page USING btree (live_revision_id);


--
-- Name: idx_16655_wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_lo; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_lo ON admin.wagtailcore_page USING btree (locale_id);


--
-- Name: idx_16655_wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_i; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_i ON admin.wagtailcore_page USING btree (locked_by_id);


--
-- Name: idx_16655_wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id ON admin.wagtailcore_page USING btree (owner_id);


--
-- Name: idx_16655_wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16655_wagtailcore_page_slug_e7c11b8f ON admin.wagtailcore_page USING btree (slug);


--
-- Name: idx_16655_wagtailcore_page_translation_key_locale_id_9b041bad_u; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16655_wagtailcore_page_translation_key_locale_id_9b041bad_u ON admin.wagtailcore_page USING btree (translation_key, locale_id);


--
-- Name: idx_16662_wagtailcore_pageloge_content_type_id_74e7708a_fk_djan; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pageloge_content_type_id_74e7708a_fk_djan ON admin.wagtailcore_pagelogentry USING btree (content_type_id);


--
-- Name: idx_16662_wagtailcore_pagelogentry_action_c2408198; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_action_c2408198 ON admin.wagtailcore_pagelogentry USING btree (action);


--
-- Name: idx_16662_wagtailcore_pagelogentry_content_changed_99f27ade; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_content_changed_99f27ade ON admin.wagtailcore_pagelogentry USING btree (content_changed);


--
-- Name: idx_16662_wagtailcore_pagelogentry_page_id_8464e327; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_page_id_8464e327 ON admin.wagtailcore_pagelogentry USING btree (page_id);


--
-- Name: idx_16662_wagtailcore_pagelogentry_revision_id_8043d103; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_revision_id_8043d103 ON admin.wagtailcore_pagelogentry USING btree (revision_id);


--
-- Name: idx_16662_wagtailcore_pagelogentry_timestamp_deb774c4; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_timestamp_deb774c4 ON admin.wagtailcore_pagelogentry USING btree ("timestamp");


--
-- Name: idx_16662_wagtailcore_pagelogentry_user_id_604ccfd8; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16662_wagtailcore_pagelogentry_user_id_604ccfd8 ON admin.wagtailcore_pagelogentry USING btree (user_id);


--
-- Name: idx_16669_wagtailcore_pagesubscription_page_id_user_id_0cef73ed; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16669_wagtailcore_pagesubscription_page_id_user_id_0cef73ed ON admin.wagtailcore_pagesubscription USING btree (page_id, user_id);


--
-- Name: idx_16669_wagtailcore_pagesubscription_user_id_89d7def9_fk_auth; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16669_wagtailcore_pagesubscription_user_id_89d7def9_fk_auth ON admin.wagtailcore_pagesubscription USING btree (user_id);


--
-- Name: idx_16674_wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16674_wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco ON admin.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: idx_16679_wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16679_wagtailcore_pageview_group_id_6460f223_fk_auth_grou ON admin.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: idx_16679_wagtailcore_pageviewrest_pageviewrestriction_id_g_d23; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16679_wagtailcore_pageviewrest_pageviewrestriction_id_g_d23 ON admin.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id, group_id);


--
-- Name: idx_16684_wagtailcore_referenc_content_type_id_766e0336_fk_djan; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16684_wagtailcore_referenc_content_type_id_766e0336_fk_djan ON admin.wagtailcore_referenceindex USING btree (content_type_id);


--
-- Name: idx_16684_wagtailcore_referenc_to_content_type_id_93690bbd_fk_d; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16684_wagtailcore_referenc_to_content_type_id_93690bbd_fk_d ON admin.wagtailcore_referenceindex USING btree (to_content_type_id);


--
-- Name: idx_16684_wagtailcore_referenceind_base_content_type_id_obj_9e6; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16684_wagtailcore_referenceind_base_content_type_id_obj_9e6 ON admin.wagtailcore_referenceindex USING btree (base_content_type_id, object_id, to_content_type_id, to_object_id, content_path_hash);


--
-- Name: idx_16691_base_content_object_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16691_base_content_object_idx ON admin.wagtailcore_revision USING btree (base_content_type_id, object_id);


--
-- Name: idx_16691_content_object_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16691_content_object_idx ON admin.wagtailcore_revision USING btree (content_type_id, object_id);


--
-- Name: idx_16691_wagtailcore_pagerevision_approved_go_live_at_e56afc67; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16691_wagtailcore_pagerevision_approved_go_live_at_e56afc67 ON admin.wagtailcore_revision USING btree (approved_go_live_at);


--
-- Name: idx_16691_wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16691_wagtailcore_pagerevision_created_at_66954e3b ON admin.wagtailcore_revision USING btree (created_at);


--
-- Name: idx_16691_wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_use; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16691_wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_use ON admin.wagtailcore_revision USING btree (user_id);


--
-- Name: idx_16698_wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16698_wagtailcore_site_hostname_96b20b46 ON admin.wagtailcore_site USING btree (hostname);


--
-- Name: idx_16698_wagtailcore_site_hostname_port_2c626d70_uniq; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16698_wagtailcore_site_hostname_port_2c626d70_uniq ON admin.wagtailcore_site USING btree (hostname, port);


--
-- Name: idx_16698_wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16698_wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore ON admin.wagtailcore_site USING btree (root_page_id);


--
-- Name: idx_16705_wagtailcore_task_content_type_id_249ab8ba_fk_django_c; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16705_wagtailcore_task_content_type_id_249ab8ba_fk_django_c ON admin.wagtailcore_task USING btree (content_type_id);


--
-- Name: idx_16710_wagtailcore_taskstat_content_type_id_0a758fdc_fk_djan; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16710_wagtailcore_taskstat_content_type_id_0a758fdc_fk_djan ON admin.wagtailcore_taskstate USING btree (content_type_id);


--
-- Name: idx_16710_wagtailcore_taskstat_revision_id_df25a499_fk_wagtailc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16710_wagtailcore_taskstat_revision_id_df25a499_fk_wagtailc ON admin.wagtailcore_taskstate USING btree (revision_id);


--
-- Name: idx_16710_wagtailcore_taskstat_workflow_state_id_9239a775_fk_wa; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16710_wagtailcore_taskstat_workflow_state_id_9239a775_fk_wa ON admin.wagtailcore_taskstate USING btree (workflow_state_id);


--
-- Name: idx_16710_wagtailcore_taskstate_finished_by_id_13f98229_fk_auth; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16710_wagtailcore_taskstate_finished_by_id_13f98229_fk_auth ON admin.wagtailcore_taskstate USING btree (finished_by_id);


--
-- Name: idx_16710_wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16710_wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore ON admin.wagtailcore_taskstate USING btree (task_id);


--
-- Name: idx_16717_wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16717_wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_ ON admin.wagtailcore_uploadedfile USING btree (for_content_type_id);


--
-- Name: idx_16717_wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16717_wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_ ON admin.wagtailcore_uploadedfile USING btree (uploaded_by_user_id);


--
-- Name: idx_16726_wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16726_wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailc ON admin.wagtailcore_workflowcontenttype USING btree (workflow_id);


--
-- Name: idx_16729_wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16729_wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailc ON admin.wagtailcore_workflowpage USING btree (workflow_id);


--
-- Name: idx_16733_current_task_state_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16733_current_task_state_id ON admin.wagtailcore_workflowstate USING btree (current_task_state_id);


--
-- Name: idx_16733_wagtailcore_workflow_requested_by_id_4090bca3_fk_auth; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16733_wagtailcore_workflow_requested_by_id_4090bca3_fk_auth ON admin.wagtailcore_workflowstate USING btree (requested_by_id);


--
-- Name: idx_16733_wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16733_wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailc ON admin.wagtailcore_workflowstate USING btree (workflow_id);


--
-- Name: idx_16733_workflowstate_base_ct_id_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16733_workflowstate_base_ct_id_idx ON admin.wagtailcore_workflowstate USING btree (base_content_type_id, object_id);


--
-- Name: idx_16733_workflowstate_ct_id_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16733_workflowstate_ct_id_idx ON admin.wagtailcore_workflowstate USING btree (content_type_id, object_id);


--
-- Name: idx_16738_wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16738_wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailc ON admin.wagtailcore_workflowtask USING btree (task_id);


--
-- Name: idx_16738_wagtailcore_workflowtask_workflow_id_b9717175; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16738_wagtailcore_workflowtask_workflow_id_b9717175 ON admin.wagtailcore_workflowtask USING btree (workflow_id);


--
-- Name: idx_16738_wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16738_wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b ON admin.wagtailcore_workflowtask USING btree (workflow_id, task_id);


--
-- Name: idx_16743_wagtaildocs_document_collection_id_23881625_fk_wagtai; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16743_wagtaildocs_document_collection_id_23881625_fk_wagtai ON admin.wagtaildocs_document USING btree (collection_id);


--
-- Name: idx_16743_wagtaildocs_document_uploaded_by_user_id_17258b41_fk_; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16743_wagtaildocs_document_uploaded_by_user_id_17258b41_fk_ ON admin.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: idx_16748_wagtailembeds_embed_cache_until_26c94bb0; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16748_wagtailembeds_embed_cache_until_26c94bb0 ON admin.wagtailembeds_embed USING btree (cache_until);


--
-- Name: idx_16748_wagtailembeds_embed_hash_c9bd8c9a_uniq; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16748_wagtailembeds_embed_hash_c9bd8c9a_uniq ON admin.wagtailembeds_embed USING btree (hash);


--
-- Name: idx_16755_wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16755_wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco ON admin.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: idx_16762_wagtailimages_image_collection_id_c2f8af7e_fk_wagtail; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16762_wagtailimages_image_collection_id_c2f8af7e_fk_wagtail ON admin.wagtailimages_image USING btree (collection_id);


--
-- Name: idx_16762_wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16762_wagtailimages_image_created_at_86fa6cd4 ON admin.wagtailimages_image USING btree (created_at);


--
-- Name: idx_16762_wagtailimages_image_file_hash_fb5bbb23; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16762_wagtailimages_image_file_hash_fb5bbb23 ON admin.wagtailimages_image USING btree (file_hash);


--
-- Name: idx_16762_wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_a; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16762_wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_a ON admin.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: idx_16767_wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16767_wagtailimages_rendition_filter_spec_1cba3201 ON admin.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: idx_16767_wagtailimages_rendition_image_id_filter_spec_foc_323c; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16767_wagtailimages_rendition_image_id_filter_spec_foc_323c ON admin.wagtailimages_rendition USING btree (image_id, filter_spec, focal_point_key);


--
-- Name: idx_16772_wagtailredirects_red_redirect_page_id_b5728a8f_fk_wag; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16772_wagtailredirects_red_redirect_page_id_b5728a8f_fk_wag ON admin.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: idx_16772_wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16772_wagtailredirects_red_site_id_780a0e1e_fk_wagtailco ON admin.wagtailredirects_redirect USING btree (site_id);


--
-- Name: idx_16772_wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16772_wagtailredirects_redirect_old_path_bb35247b ON admin.wagtailredirects_redirect USING btree (old_path);


--
-- Name: idx_16772_wagtailredirects_redirect_old_path_site_id_783622d7_u; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16772_wagtailredirects_redirect_old_path_site_id_783622d7_u ON admin.wagtailredirects_redirect USING btree (old_path, site_id);


--
-- Name: idx_16779_fulltext_autocomplete; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16779_fulltext_autocomplete ON admin.wagtailsearch_indexentry USING gin (to_tsvector('simple'::regconfig, autocomplete));


--
-- Name: idx_16779_fulltext_body; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16779_fulltext_body ON admin.wagtailsearch_indexentry USING gin (to_tsvector('simple'::regconfig, body));


--
-- Name: idx_16779_fulltext_title; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16779_fulltext_title ON admin.wagtailsearch_indexentry USING gin (to_tsvector('simple'::regconfig, title));


--
-- Name: idx_16779_fulltext_title_body; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX idx_16779_fulltext_title_body ON admin.wagtailsearch_indexentry USING btree (title, body);


--
-- Name: idx_16779_wagtailsearch_indexentry_content_type_id_object_id_bc; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16779_wagtailsearch_indexentry_content_type_id_object_id_bc ON admin.wagtailsearch_indexentry USING btree (content_type_id, object_id);


--
-- Name: idx_16786_user_id; Type: INDEX; Schema: admin; Owner: admin
--

CREATE UNIQUE INDEX idx_16786_user_id ON admin.wagtailusers_userprofile USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES admin.auth_permission(id);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES admin.auth_permission(id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: home_certificados home_certificados_image_id_410cc776_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_certificados
    ADD CONSTRAINT home_certificados_image_id_410cc776_fk_home_cloudinaryimage_id FOREIGN KEY (image_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_certificados home_certificados_page_id_c529d124_fk_home_nosotros_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_certificados
    ADD CONSTRAINT home_certificados_page_id_c529d124_fk_home_nosotros_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.home_nosotros(page_ptr_id);


--
-- Name: home_cloudinaryimage home_cloudinaryimage_collection_id_311638fc_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryimage
    ADD CONSTRAINT home_cloudinaryimage_collection_id_311638fc_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES admin.wagtailcore_collection(id);


--
-- Name: home_cloudinaryimage home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_auth_user; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryimage
    ADD CONSTRAINT home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES admin.auth_user(id);


--
-- Name: home_cloudinaryrendition home_cloudinaryrendi_image_id_f21c0f3e_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_cloudinaryrendition
    ADD CONSTRAINT home_cloudinaryrendi_image_id_f21c0f3e_fk_home_clou FOREIGN KEY (image_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_contacto home_contacto_background_id_812a8659_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_contacto
    ADD CONSTRAINT home_contacto_background_id_812a8659_fk_home_cloudinaryimage_id FOREIGN KEY (background_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_contacto home_contacto_page_ptr_id_59340c12_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_contacto
    ADD CONSTRAINT home_contacto_page_ptr_id_59340c12_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: home_destino home_destino_background_id_8c39578d_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_destino
    ADD CONSTRAINT home_destino_background_id_8c39578d_fk_home_cloudinaryimage_id FOREIGN KEY (background_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_destino home_destino_backgroundmobile_id_e70cd017_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_destino
    ADD CONSTRAINT home_destino_backgroundmobile_id_e70cd017_fk_home_clou FOREIGN KEY (backgroundmobile_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_estadisticas home_estadisticas_page_id_6e7f74bd_fk_home_nosotros_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_estadisticas
    ADD CONSTRAINT home_estadisticas_page_id_6e7f74bd_fk_home_nosotros_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.home_nosotros(page_ptr_id);


--
-- Name: home_faq home_faq_page_id_0e8eefe9_fk_home_inicio_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_faq
    ADD CONSTRAINT home_faq_page_id_0e8eefe9_fk_home_inicio_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.home_inicio(page_ptr_id);


--
-- Name: home_global home_global_page_ptr_id_e7e81c96_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_global
    ADD CONSTRAINT home_global_page_ptr_id_e7e81c96_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: home_home home_home_page_ptr_id_940e97b3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_home
    ADD CONSTRAINT home_home_page_ptr_id_940e97b3_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: home_inicio home_inicio_page_ptr_id_a32ce4ac_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_inicio
    ADD CONSTRAINT home_inicio_page_ptr_id_a32ce4ac_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: home_nosotros home_nosotros_background_id_da3ca9b2_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_nosotros
    ADD CONSTRAINT home_nosotros_background_id_da3ca9b2_fk_home_cloudinaryimage_id FOREIGN KEY (background_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_nosotros home_nosotros_imageparrafo_id_8e5db0b2_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_nosotros
    ADD CONSTRAINT home_nosotros_imageparrafo_id_8e5db0b2_fk_home_clou FOREIGN KEY (imageparrafo_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_nosotros home_nosotros_page_ptr_id_9b411183_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_nosotros
    ADD CONSTRAINT home_nosotros_page_ptr_id_9b411183_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: home_partners home_partners_image_id_e0614efb_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_partners
    ADD CONSTRAINT home_partners_image_id_e0614efb_fk_home_cloudinaryimage_id FOREIGN KEY (image_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_partners home_partners_page_id_b6820531_fk_home_nosotros_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_partners
    ADD CONSTRAINT home_partners_page_id_b6820531_fk_home_nosotros_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.home_nosotros(page_ptr_id);


--
-- Name: home_valores home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_valores
    ADD CONSTRAINT home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_id FOREIGN KEY (img_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: home_valores home_valores_page_id_4754f79e_fk_home_nosotros_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.home_valores
    ADD CONSTRAINT home_valores_page_id_4754f79e_fk_home_nosotros_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.home_nosotros(page_ptr_id);


--
-- Name: paquete_dias paquete_dias_page_id_837da2f5_fk_paquete_paquete_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_dias
    ADD CONSTRAINT paquete_dias_page_id_837da2f5_fk_paquete_paquete_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.paquete_paquete(page_ptr_id);


--
-- Name: paquete_excluidoitempaquete paquete_excluidoitem_page_id_b1311125_fk_paquete_p; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_excluidoitempaquete
    ADD CONSTRAINT paquete_excluidoitem_page_id_b1311125_fk_paquete_p FOREIGN KEY (page_id) REFERENCES admin.paquete_paquete(page_ptr_id);


--
-- Name: paquete_gallerycarousel paquete_gallerycarou_image_id_c2e364b2_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_gallerycarousel
    ADD CONSTRAINT paquete_gallerycarou_image_id_c2e364b2_fk_home_clou FOREIGN KEY (image_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: paquete_gallerycarousel paquete_gallerycarou_page_id_18f80dd1_fk_paquete_p; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_gallerycarousel
    ADD CONSTRAINT paquete_gallerycarou_page_id_18f80dd1_fk_paquete_p FOREIGN KEY (page_id) REFERENCES admin.paquete_paquete(page_ptr_id);


--
-- Name: paquete_incluidoitempaquete paquete_incluidoitem_page_id_01be5d1a_fk_paquete_p; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_incluidoitempaquete
    ADD CONSTRAINT paquete_incluidoitem_page_id_01be5d1a_fk_paquete_p FOREIGN KEY (page_id) REFERENCES admin.paquete_paquete(page_ptr_id);


--
-- Name: paquete_paquete paquete_paquete_background_id_408962cd_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_paquete
    ADD CONSTRAINT paquete_paquete_background_id_408962cd_fk_home_clou FOREIGN KEY (background_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: paquete_paquete paquete_paquete_featuredimage_id_c1251166_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_paquete
    ADD CONSTRAINT paquete_paquete_featuredimage_id_c1251166_fk_home_clou FOREIGN KEY (featuredimage_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: paquete_paquete paquete_paquete_page_ptr_id_ec3e0569_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.paquete_paquete
    ADD CONSTRAINT paquete_paquete_page_ptr_id_ec3e0569_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES admin.taggit_tag(id);


--
-- Name: tour_excluidoitempaquete tour_excluidoitempaq_page_id_3176f6fd_fk_tour_tour; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_excluidoitempaquete
    ADD CONSTRAINT tour_excluidoitempaq_page_id_3176f6fd_fk_tour_tour FOREIGN KEY (page_id) REFERENCES admin.tour_tour(page_ptr_id);


--
-- Name: tour_gallerycarousel tour_gallerycarousel_image_id_b6cf3765_fk_home_clou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_gallerycarousel
    ADD CONSTRAINT tour_gallerycarousel_image_id_b6cf3765_fk_home_clou FOREIGN KEY (image_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: tour_gallerycarousel tour_gallerycarousel_page_id_e3894881_fk_tour_tour_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_gallerycarousel
    ADD CONSTRAINT tour_gallerycarousel_page_id_e3894881_fk_tour_tour_page_ptr_id FOREIGN KEY (page_id) REFERENCES admin.tour_tour(page_ptr_id);


--
-- Name: tour_incluidoitempaquete tour_incluidoitempaq_page_id_e64ef6bc_fk_tour_tour; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_incluidoitempaquete
    ADD CONSTRAINT tour_incluidoitempaq_page_id_e64ef6bc_fk_tour_tour FOREIGN KEY (page_id) REFERENCES admin.tour_tour(page_ptr_id);


--
-- Name: tour_tour tour_tour_background_id_57ff5614_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour
    ADD CONSTRAINT tour_tour_background_id_57ff5614_fk_home_cloudinaryimage_id FOREIGN KEY (background_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: tour_tour_categories tour_tour_categories_tour_id_bd4bf9c2_fk_tour_tour_page_ptr_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour_categories
    ADD CONSTRAINT tour_tour_categories_tour_id_bd4bf9c2_fk_tour_tour_page_ptr_id FOREIGN KEY (tour_id) REFERENCES admin.tour_tour(page_ptr_id);


--
-- Name: tour_tour_categories tour_tour_categories_tourcategory_id_5c0462c4_fk_home_tour; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour_categories
    ADD CONSTRAINT tour_tour_categories_tourcategory_id_5c0462c4_fk_home_tour FOREIGN KEY (tourcategory_id) REFERENCES admin.home_tourcategory(id);


--
-- Name: tour_tour tour_tour_featuredimage_id_6cc0a601_fk_home_cloudinaryimage_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour
    ADD CONSTRAINT tour_tour_featuredimage_id_6cc0a601_fk_home_cloudinaryimage_id FOREIGN KEY (featuredimage_id) REFERENCES admin.home_cloudinaryimage(id);


--
-- Name: tour_tour tour_tour_page_ptr_id_5917fdc0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour
    ADD CONSTRAINT tour_tour_page_ptr_id_5917fdc0_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: tour_tour tour_tour_tourdestino_id_c3ed0f76_fk_home_destino_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.tour_tour
    ADD CONSTRAINT tour_tour_tourdestino_id_c3ed0f76_fk_home_destino_id FOREIGN KEY (tourdestino_id) REFERENCES admin.home_destino(id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES admin.wagtailcore_collection(id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES admin.wagtailcore_collectionviewrestriction(id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id FOREIGN KEY (resolved_by_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco FOREIGN KEY (revision_created_id) REFERENCES admin.wagtailcore_revision(id);


--
-- Name: wagtailcore_comment wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_comment
    ADD CONSTRAINT wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_commentreply wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_commentreply
    ADD CONSTRAINT wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco FOREIGN KEY (comment_id) REFERENCES admin.wagtailcore_comment(id);


--
-- Name: wagtailcore_commentreply wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_commentreply
    ADD CONSTRAINT wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_groupapprovaltask_groups wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: wagtailcore_groupapprovaltask_groups wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask_groups
    ADD CONSTRAINT wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco FOREIGN KEY (groupapprovaltask_id) REFERENCES admin.wagtailcore_groupapprovaltask(task_ptr_id);


--
-- Name: wagtailcore_groupapprovaltask wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupapprovaltask
    ADD CONSTRAINT wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco FOREIGN KEY (task_ptr_id) REFERENCES admin.wagtailcore_task(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES admin.wagtailcore_collection(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES admin.auth_permission(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES admin.auth_permission(id);


--
-- Name: wagtailcore_modellogentry wagtailcore_modellog_content_type_id_68849e77_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_modellogentry
    ADD CONSTRAINT wagtailcore_modellog_content_type_id_68849e77_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_page wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id FOREIGN KEY (alias_of_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_page wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_page wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco FOREIGN KEY (latest_revision_id) REFERENCES admin.wagtailcore_revision(id);


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES admin.wagtailcore_revision(id);


--
-- Name: wagtailcore_page wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id FOREIGN KEY (locale_id) REFERENCES admin.wagtailcore_locale(id);


--
-- Name: wagtailcore_page wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id FOREIGN KEY (locked_by_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_pagelogentry wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagelogentry
    ADD CONSTRAINT wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_pagesubscription wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagesubscription
    ADD CONSTRAINT wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_pagesubscription wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pagesubscription
    ADD CONSTRAINT wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES admin.auth_group(id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES admin.wagtailcore_pageviewrestriction(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co FOREIGN KEY (base_content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenc_content_type_id_766e0336_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenc_content_type_id_766e0336_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_referenceindex wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_referenceindex
    ADD CONSTRAINT wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co FOREIGN KEY (to_content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co FOREIGN KEY (base_content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_revision wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_revision
    ADD CONSTRAINT wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_task wagtailcore_task_content_type_id_249ab8ba_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_task
    ADD CONSTRAINT wagtailcore_task_content_type_id_249ab8ba_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco FOREIGN KEY (revision_id) REFERENCES admin.wagtailcore_revision(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco FOREIGN KEY (workflow_state_id) REFERENCES admin.wagtailcore_workflowstate(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id FOREIGN KEY (finished_by_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_taskstate wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_taskstate
    ADD CONSTRAINT wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id FOREIGN KEY (task_id) REFERENCES admin.wagtailcore_task(id);


--
-- Name: wagtailcore_uploadedfile wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_uploadedfile
    ADD CONSTRAINT wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co FOREIGN KEY (for_content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_uploadedfile wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_uploadedfile
    ADD CONSTRAINT wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflow_base_content_type_id_a30dc576_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflow_base_content_type_id_a30dc576_fk_django_co FOREIGN KEY (base_content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflow_content_type_id_2bb78ce1_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflow_content_type_id_2bb78ce1_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_workflowcontenttype wagtailcore_workflow_content_type_id_b261bb37_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowcontenttype
    ADD CONSTRAINT wagtailcore_workflow_content_type_id_b261bb37_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco FOREIGN KEY (current_task_state_id) REFERENCES admin.wagtailcore_taskstate(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user FOREIGN KEY (requested_by_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailcore_workflowstate wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowstate
    ADD CONSTRAINT wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco FOREIGN KEY (workflow_id) REFERENCES admin.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowpage wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowpage
    ADD CONSTRAINT wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco FOREIGN KEY (workflow_id) REFERENCES admin.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowcontenttype wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowcontenttype
    ADD CONSTRAINT wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco FOREIGN KEY (workflow_id) REFERENCES admin.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowtask wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowtask
    ADD CONSTRAINT wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco FOREIGN KEY (workflow_id) REFERENCES admin.wagtailcore_workflow(id);


--
-- Name: wagtailcore_workflowpage wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_i; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowpage
    ADD CONSTRAINT wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_i FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailcore_workflowtask wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_i; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailcore_workflowtask
    ADD CONSTRAINT wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_i FOREIGN KEY (task_id) REFERENCES admin.wagtailcore_task(id);


--
-- Name: wagtaildocs_document wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES admin.wagtailcore_collection(id);


--
-- Name: wagtaildocs_document wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailimages_image wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES admin.wagtailcore_collection(id);


--
-- Name: wagtailimages_image wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_i; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_i FOREIGN KEY (uploaded_by_user_id) REFERENCES admin.auth_user(id);


--
-- Name: wagtailimages_rendition wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES admin.wagtailimages_image(id);


--
-- Name: wagtailredirects_redirect wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES admin.wagtailcore_page(id);


--
-- Name: wagtailredirects_redirect wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES admin.wagtailcore_site(id);


--
-- Name: wagtailsearch_indexentry wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailsearch_indexentry
    ADD CONSTRAINT wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES admin.django_content_type(id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES admin.auth_user(id);


--
-- PostgreSQL database dump complete
--

