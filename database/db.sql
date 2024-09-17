--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5
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
-- Name: activity_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_log (
    id bigint NOT NULL,
    log_name character varying(255),
    description text NOT NULL,
    subject_type character varying(255),
    subject_id bigint,
    event character varying(255),
    causer_type character varying(255),
    causer_id bigint,
    properties json,
    batch_uuid uuid,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.activity_log OWNER TO postgres;

--
-- Name: activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_log_id_seq OWNER TO postgres;

--
-- Name: activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL,
    uuid uuid,
    collection_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    mime_type character varying(255),
    disk character varying(255) NOT NULL,
    conversions_disk character varying(255),
    size bigint NOT NULL,
    manipulations json NOT NULL,
    custom_properties json NOT NULL,
    generated_conversions json NOT NULL,
    responsive_images json NOT NULL,
    order_column integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: metalhub_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_addresses (
    id bigint NOT NULL,
    customer_id bigint,
    country_id bigint,
    title character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    company_name character varying(255),
    line_one character varying(255) NOT NULL,
    line_two character varying(255),
    line_three character varying(255),
    city character varying(255) NOT NULL,
    state character varying(255),
    postcode character varying(255),
    delivery_instructions character varying(255),
    contact_email character varying(255),
    contact_phone character varying(255),
    meta json,
    shipping_default boolean DEFAULT false NOT NULL,
    billing_default boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_addresses OWNER TO postgres;

--
-- Name: metalhub_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_addresses_id_seq OWNER TO postgres;

--
-- Name: metalhub_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_addresses_id_seq OWNED BY public.metalhub_addresses.id;


--
-- Name: metalhub_assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_assets (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_assets OWNER TO postgres;

--
-- Name: metalhub_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_assets_id_seq OWNER TO postgres;

--
-- Name: metalhub_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_assets_id_seq OWNED BY public.metalhub_assets.id;


--
-- Name: metalhub_attributables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_attributables (
    id bigint NOT NULL,
    attributable_type character varying(255) NOT NULL,
    attributable_id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_attributables OWNER TO postgres;

--
-- Name: metalhub_attributables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_attributables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_attributables_id_seq OWNER TO postgres;

--
-- Name: metalhub_attributables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_attributables_id_seq OWNED BY public.metalhub_attributables.id;


--
-- Name: metalhub_attribute_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_attribute_groups (
    id bigint NOT NULL,
    attributable_type character varying(255) NOT NULL,
    name json NOT NULL,
    handle character varying(255) NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_attribute_groups OWNER TO postgres;

--
-- Name: metalhub_attribute_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_attribute_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_attribute_groups_id_seq OWNER TO postgres;

--
-- Name: metalhub_attribute_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_attribute_groups_id_seq OWNED BY public.metalhub_attribute_groups.id;


--
-- Name: metalhub_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_attributes (
    id bigint NOT NULL,
    attribute_type character varying(255) NOT NULL,
    attribute_group_id bigint NOT NULL,
    "position" integer NOT NULL,
    name json NOT NULL,
    handle character varying(255) NOT NULL,
    section character varying(255),
    type character varying(255) NOT NULL,
    required boolean NOT NULL,
    default_value character varying(255),
    configuration json NOT NULL,
    system boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    searchable boolean DEFAULT true NOT NULL,
    filterable boolean DEFAULT false NOT NULL,
    validation_rules character varying(255),
    description json
);


ALTER TABLE public.metalhub_attributes OWNER TO postgres;

--
-- Name: metalhub_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_attributes_id_seq OWNER TO postgres;

--
-- Name: metalhub_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_attributes_id_seq OWNED BY public.metalhub_attributes.id;


--
-- Name: metalhub_brand_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_brand_collection (
    id bigint NOT NULL,
    brand_id bigint NOT NULL,
    collection_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_brand_collection OWNER TO postgres;

--
-- Name: metalhub_brand_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_brand_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_brand_collection_id_seq OWNER TO postgres;

--
-- Name: metalhub_brand_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_brand_collection_id_seq OWNED BY public.metalhub_brand_collection.id;


--
-- Name: metalhub_brand_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_brand_discount (
    id bigint NOT NULL,
    brand_id bigint NOT NULL,
    discount_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type character varying(20) DEFAULT 'limitation'::character varying NOT NULL
);


ALTER TABLE public.metalhub_brand_discount OWNER TO postgres;

--
-- Name: metalhub_brand_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_brand_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_brand_discount_id_seq OWNER TO postgres;

--
-- Name: metalhub_brand_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_brand_discount_id_seq OWNED BY public.metalhub_brand_discount.id;


--
-- Name: metalhub_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_brands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    attribute_data json
);


ALTER TABLE public.metalhub_brands OWNER TO postgres;

--
-- Name: metalhub_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_brands_id_seq OWNER TO postgres;

--
-- Name: metalhub_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_brands_id_seq OWNED BY public.metalhub_brands.id;


--
-- Name: metalhub_cart_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_cart_addresses (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    country_id bigint,
    title character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    company_name character varying(255),
    line_one character varying(255),
    line_two character varying(255),
    line_three character varying(255),
    city character varying(255),
    state character varying(255),
    postcode character varying(255),
    delivery_instructions character varying(255),
    contact_email character varying(255),
    contact_phone character varying(255),
    type character varying(255) DEFAULT 'shipping'::character varying NOT NULL,
    shipping_option character varying(255),
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_cart_addresses OWNER TO postgres;

--
-- Name: metalhub_cart_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_cart_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_cart_addresses_id_seq OWNER TO postgres;

--
-- Name: metalhub_cart_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_cart_addresses_id_seq OWNED BY public.metalhub_cart_addresses.id;


--
-- Name: metalhub_cart_line_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_cart_line_discount (
    id bigint NOT NULL,
    cart_line_id bigint NOT NULL,
    discount_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_cart_line_discount OWNER TO postgres;

--
-- Name: metalhub_cart_line_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_cart_line_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_cart_line_discount_id_seq OWNER TO postgres;

--
-- Name: metalhub_cart_line_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_cart_line_discount_id_seq OWNED BY public.metalhub_cart_line_discount.id;


--
-- Name: metalhub_cart_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_cart_lines (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    purchasable_type character varying(255) NOT NULL,
    purchasable_id bigint NOT NULL,
    quantity integer NOT NULL,
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_cart_lines OWNER TO postgres;

--
-- Name: metalhub_cart_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_cart_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_cart_lines_id_seq OWNER TO postgres;

--
-- Name: metalhub_cart_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_cart_lines_id_seq OWNED BY public.metalhub_cart_lines.id;


--
-- Name: metalhub_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_carts (
    id bigint NOT NULL,
    user_id bigint,
    merged_id bigint,
    currency_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    order_id bigint,
    coupon_code character varying(255),
    completed_at timestamp(0) without time zone,
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    customer_id bigint,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_carts OWNER TO postgres;

--
-- Name: metalhub_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_carts_id_seq OWNER TO postgres;

--
-- Name: metalhub_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_carts_id_seq OWNED BY public.metalhub_carts.id;


--
-- Name: metalhub_channelables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_channelables (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    channelable_type character varying(255) NOT NULL,
    channelable_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    starts_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ends_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_channelables OWNER TO postgres;

--
-- Name: metalhub_channelables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_channelables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_channelables_id_seq OWNER TO postgres;

--
-- Name: metalhub_channelables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_channelables_id_seq OWNED BY public.metalhub_channelables.id;


--
-- Name: metalhub_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_channels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    url character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_channels OWNER TO postgres;

--
-- Name: metalhub_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_channels_id_seq OWNER TO postgres;

--
-- Name: metalhub_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_channels_id_seq OWNED BY public.metalhub_channels.id;


--
-- Name: metalhub_collection_customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_collection_customer_group (
    id bigint NOT NULL,
    collection_id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    starts_at timestamp(0) without time zone,
    ends_at timestamp(0) without time zone,
    visible boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_collection_customer_group OWNER TO postgres;

--
-- Name: metalhub_collection_customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_collection_customer_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_collection_customer_group_id_seq OWNER TO postgres;

--
-- Name: metalhub_collection_customer_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_collection_customer_group_id_seq OWNED BY public.metalhub_collection_customer_group.id;


--
-- Name: metalhub_collection_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_collection_discount (
    id bigint NOT NULL,
    discount_id bigint NOT NULL,
    collection_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type character varying(20) DEFAULT 'limitation'::character varying NOT NULL
);


ALTER TABLE public.metalhub_collection_discount OWNER TO postgres;

--
-- Name: metalhub_collection_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_collection_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_collection_discount_id_seq OWNER TO postgres;

--
-- Name: metalhub_collection_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_collection_discount_id_seq OWNED BY public.metalhub_collection_discount.id;


--
-- Name: metalhub_collection_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_collection_groups (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_collection_groups OWNER TO postgres;

--
-- Name: metalhub_collection_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_collection_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_collection_groups_id_seq OWNER TO postgres;

--
-- Name: metalhub_collection_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_collection_groups_id_seq OWNED BY public.metalhub_collection_groups.id;


--
-- Name: metalhub_collection_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_collection_product (
    id bigint NOT NULL,
    collection_id bigint NOT NULL,
    product_id bigint NOT NULL,
    "position" integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_collection_product OWNER TO postgres;

--
-- Name: metalhub_collection_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_collection_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_collection_product_id_seq OWNER TO postgres;

--
-- Name: metalhub_collection_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_collection_product_id_seq OWNED BY public.metalhub_collection_product.id;


--
-- Name: metalhub_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_collections (
    id bigint NOT NULL,
    collection_group_id bigint NOT NULL,
    _lft integer DEFAULT 0 NOT NULL,
    _rgt integer DEFAULT 0 NOT NULL,
    parent_id integer,
    type character varying(255) DEFAULT 'static'::character varying NOT NULL,
    attribute_data json NOT NULL,
    sort character varying(255) DEFAULT 'custom'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_collections OWNER TO postgres;

--
-- Name: metalhub_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_collections_id_seq OWNER TO postgres;

--
-- Name: metalhub_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_collections_id_seq OWNED BY public.metalhub_collections.id;


--
-- Name: metalhub_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_countries (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    iso3 character varying(255) NOT NULL,
    iso2 character varying(255),
    phonecode character varying(255) NOT NULL,
    capital character varying(255),
    currency character varying(255) NOT NULL,
    native character varying(255),
    emoji character varying(255) NOT NULL,
    emoji_u character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_countries OWNER TO postgres;

--
-- Name: metalhub_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_countries_id_seq OWNER TO postgres;

--
-- Name: metalhub_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_countries_id_seq OWNED BY public.metalhub_countries.id;


--
-- Name: metalhub_country_shipping_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_country_shipping_zone (
    id bigint NOT NULL,
    country_id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_country_shipping_zone OWNER TO postgres;

--
-- Name: metalhub_country_shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_country_shipping_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_country_shipping_zone_id_seq OWNER TO postgres;

--
-- Name: metalhub_country_shipping_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_country_shipping_zone_id_seq OWNED BY public.metalhub_country_shipping_zone.id;


--
-- Name: metalhub_currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_currencies (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    exchange_rate numeric(10,4) NOT NULL,
    decimal_places integer DEFAULT 2 NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_currencies OWNER TO postgres;

--
-- Name: metalhub_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_currencies_id_seq OWNER TO postgres;

--
-- Name: metalhub_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_currencies_id_seq OWNED BY public.metalhub_currencies.id;


--
-- Name: metalhub_customer_customer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_customer_group (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_customer_customer_group OWNER TO postgres;

--
-- Name: metalhub_customer_customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_customer_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_customer_group_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_customer_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_customer_group_id_seq OWNED BY public.metalhub_customer_customer_group.id;


--
-- Name: metalhub_customer_group_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_group_discount (
    id bigint NOT NULL,
    discount_id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    starts_at timestamp(0) without time zone,
    ends_at timestamp(0) without time zone,
    visible boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_customer_group_discount OWNER TO postgres;

--
-- Name: metalhub_customer_group_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_group_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_group_discount_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_group_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_group_discount_id_seq OWNED BY public.metalhub_customer_group_discount.id;


--
-- Name: metalhub_customer_group_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_group_product (
    id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    product_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    starts_at timestamp(0) without time zone,
    ends_at timestamp(0) without time zone,
    visible boolean DEFAULT true NOT NULL,
    purchasable boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_customer_group_product OWNER TO postgres;

--
-- Name: metalhub_customer_group_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_group_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_group_product_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_group_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_group_product_id_seq OWNED BY public.metalhub_customer_group_product.id;


--
-- Name: metalhub_customer_group_shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_group_shipping_method (
    id bigint NOT NULL,
    customer_group_id bigint NOT NULL,
    shipping_method_id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    starts_at timestamp(0) without time zone,
    ends_at timestamp(0) without time zone,
    visible boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_customer_group_shipping_method OWNER TO postgres;

--
-- Name: metalhub_customer_group_shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_group_shipping_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_group_shipping_method_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_group_shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_group_shipping_method_id_seq OWNED BY public.metalhub_customer_group_shipping_method.id;


--
-- Name: metalhub_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_groups (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    attribute_data json
);


ALTER TABLE public.metalhub_customer_groups OWNER TO postgres;

--
-- Name: metalhub_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_groups_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_groups_id_seq OWNED BY public.metalhub_customer_groups.id;


--
-- Name: metalhub_customer_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customer_user (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_customer_user OWNER TO postgres;

--
-- Name: metalhub_customer_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customer_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customer_user_id_seq OWNER TO postgres;

--
-- Name: metalhub_customer_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customer_user_id_seq OWNED BY public.metalhub_customer_user.id;


--
-- Name: metalhub_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_customers (
    id bigint NOT NULL,
    title character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    company_name character varying(255),
    vat_no character varying(255),
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    attribute_data json,
    account_ref character varying(255)
);


ALTER TABLE public.metalhub_customers OWNER TO postgres;

--
-- Name: metalhub_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_customers_id_seq OWNER TO postgres;

--
-- Name: metalhub_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_customers_id_seq OWNED BY public.metalhub_customers.id;


--
-- Name: metalhub_discount_purchasables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_discount_purchasables (
    id bigint NOT NULL,
    discount_id bigint NOT NULL,
    purchasable_type character varying(255) NOT NULL,
    purchasable_id bigint NOT NULL,
    type character varying(255) DEFAULT 'condition'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_discount_purchasables OWNER TO postgres;

--
-- Name: metalhub_discount_purchasables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_discount_purchasables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_discount_purchasables_id_seq OWNER TO postgres;

--
-- Name: metalhub_discount_purchasables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_discount_purchasables_id_seq OWNED BY public.metalhub_discount_purchasables.id;


--
-- Name: metalhub_discount_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_discount_user (
    id bigint NOT NULL,
    discount_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_discount_user OWNER TO postgres;

--
-- Name: metalhub_discount_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_discount_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_discount_user_id_seq OWNER TO postgres;

--
-- Name: metalhub_discount_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_discount_user_id_seq OWNED BY public.metalhub_discount_user.id;


--
-- Name: metalhub_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_discounts (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    coupon character varying(255),
    type character varying(255) NOT NULL,
    starts_at timestamp(0) without time zone NOT NULL,
    ends_at timestamp(0) without time zone,
    uses integer DEFAULT 0 NOT NULL,
    max_uses integer,
    priority integer DEFAULT 1 NOT NULL,
    stop boolean DEFAULT false NOT NULL,
    restriction character varying(255),
    data json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    max_uses_per_user integer
);


ALTER TABLE public.metalhub_discounts OWNER TO postgres;

--
-- Name: metalhub_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_discounts_id_seq OWNER TO postgres;

--
-- Name: metalhub_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_discounts_id_seq OWNED BY public.metalhub_discounts.id;


--
-- Name: metalhub_exclusion_list_shipping_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_exclusion_list_shipping_zone (
    id bigint NOT NULL,
    exclusion_id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_exclusion_list_shipping_zone OWNER TO postgres;

--
-- Name: metalhub_exclusion_list_shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_exclusion_list_shipping_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_exclusion_list_shipping_zone_id_seq OWNER TO postgres;

--
-- Name: metalhub_exclusion_list_shipping_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_exclusion_list_shipping_zone_id_seq OWNED BY public.metalhub_exclusion_list_shipping_zone.id;


--
-- Name: metalhub_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_languages (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_languages OWNER TO postgres;

--
-- Name: metalhub_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_languages_id_seq OWNER TO postgres;

--
-- Name: metalhub_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_languages_id_seq OWNED BY public.metalhub_languages.id;


--
-- Name: metalhub_media_product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_media_product_variant (
    id bigint NOT NULL,
    media_id bigint NOT NULL,
    product_variant_id bigint NOT NULL,
    "primary" boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "position" smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.metalhub_media_product_variant OWNER TO postgres;

--
-- Name: metalhub_media_product_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_media_product_variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_media_product_variant_id_seq OWNER TO postgres;

--
-- Name: metalhub_media_product_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_media_product_variant_id_seq OWNED BY public.metalhub_media_product_variant.id;


--
-- Name: metalhub_order_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_order_addresses (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    country_id bigint,
    title character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    company_name character varying(255),
    line_one character varying(255),
    line_two character varying(255),
    line_three character varying(255),
    city character varying(255),
    state character varying(255),
    postcode character varying(255),
    delivery_instructions character varying(255),
    contact_email character varying(255),
    contact_phone character varying(255),
    type character varying(255) DEFAULT 'shipping'::character varying NOT NULL,
    shipping_option character varying(255),
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_order_addresses OWNER TO postgres;

--
-- Name: metalhub_order_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_order_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_order_addresses_id_seq OWNER TO postgres;

--
-- Name: metalhub_order_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_order_addresses_id_seq OWNED BY public.metalhub_order_addresses.id;


--
-- Name: metalhub_order_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_order_lines (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    purchasable_type character varying(255) NOT NULL,
    purchasable_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    option character varying(255),
    identifier character varying(255) NOT NULL,
    unit_price bigint NOT NULL,
    unit_quantity smallint DEFAULT '1'::smallint NOT NULL,
    quantity integer NOT NULL,
    sub_total bigint NOT NULL,
    discount_total bigint DEFAULT 0 NOT NULL,
    tax_breakdown json NOT NULL,
    tax_total bigint NOT NULL,
    total bigint NOT NULL,
    notes text,
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_order_lines OWNER TO postgres;

--
-- Name: metalhub_order_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_order_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_order_lines_id_seq OWNER TO postgres;

--
-- Name: metalhub_order_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_order_lines_id_seq OWNED BY public.metalhub_order_lines.id;


--
-- Name: metalhub_order_shipping_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_order_shipping_zone (
    id integer NOT NULL,
    order_id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_order_shipping_zone OWNER TO postgres;

--
-- Name: metalhub_order_shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_order_shipping_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_order_shipping_zone_id_seq OWNER TO postgres;

--
-- Name: metalhub_order_shipping_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_order_shipping_zone_id_seq OWNED BY public.metalhub_order_shipping_zone.id;


--
-- Name: metalhub_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_orders (
    id bigint NOT NULL,
    user_id bigint,
    channel_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    reference character varying(255),
    customer_reference character varying(255),
    sub_total bigint NOT NULL,
    discount_total bigint DEFAULT 0 NOT NULL,
    shipping_total bigint DEFAULT 0 NOT NULL,
    tax_breakdown json NOT NULL,
    tax_total bigint NOT NULL,
    total bigint NOT NULL,
    notes text,
    currency_code character varying(3) NOT NULL,
    compare_currency_code character varying(3),
    exchange_rate numeric(10,4) DEFAULT '1'::numeric NOT NULL,
    placed_at timestamp(0) without time zone,
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    customer_id bigint,
    new_customer boolean DEFAULT false NOT NULL,
    discount_breakdown json,
    shipping_breakdown json,
    cart_id bigint,
    fingerprint character varying(255)
);


ALTER TABLE public.metalhub_orders OWNER TO postgres;

--
-- Name: metalhub_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_orders_id_seq OWNER TO postgres;

--
-- Name: metalhub_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_orders_id_seq OWNED BY public.metalhub_orders.id;


--
-- Name: metalhub_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_prices (
    id bigint NOT NULL,
    customer_group_id bigint,
    currency_id bigint NOT NULL,
    priceable_type character varying(255) NOT NULL,
    priceable_id bigint NOT NULL,
    price bigint NOT NULL,
    compare_price bigint,
    min_quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_prices OWNER TO postgres;

--
-- Name: metalhub_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_prices_id_seq OWNER TO postgres;

--
-- Name: metalhub_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_prices_id_seq OWNED BY public.metalhub_prices.id;


--
-- Name: metalhub_product_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_associations (
    id bigint NOT NULL,
    product_parent_id bigint NOT NULL,
    product_target_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_product_associations OWNER TO postgres;

--
-- Name: metalhub_product_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_associations_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_associations_id_seq OWNED BY public.metalhub_product_associations.id;


--
-- Name: metalhub_product_option_value_product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_option_value_product_variant (
    id bigint NOT NULL,
    value_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_product_option_value_product_variant OWNER TO postgres;

--
-- Name: metalhub_product_option_value_product_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_option_value_product_variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_option_value_product_variant_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_option_value_product_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_option_value_product_variant_id_seq OWNED BY public.metalhub_product_option_value_product_variant.id;


--
-- Name: metalhub_product_option_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_option_values (
    id bigint NOT NULL,
    product_option_id bigint NOT NULL,
    name json NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.metalhub_product_option_values OWNER TO postgres;

--
-- Name: metalhub_product_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_option_values_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_option_values_id_seq OWNED BY public.metalhub_product_option_values.id;


--
-- Name: metalhub_product_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_options (
    id bigint NOT NULL,
    name json NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    handle character varying(255),
    label json,
    shared boolean DEFAULT false NOT NULL
);


ALTER TABLE public.metalhub_product_options OWNER TO postgres;

--
-- Name: metalhub_product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_options_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_options_id_seq OWNED BY public.metalhub_product_options.id;


--
-- Name: metalhub_product_product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_product_option (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    product_option_id bigint NOT NULL,
    "position" smallint NOT NULL
);


ALTER TABLE public.metalhub_product_product_option OWNER TO postgres;

--
-- Name: metalhub_product_product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_product_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_product_option_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_product_option_id_seq OWNED BY public.metalhub_product_product_option.id;


--
-- Name: metalhub_product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_product_types OWNER TO postgres;

--
-- Name: metalhub_product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_types_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_types_id_seq OWNED BY public.metalhub_product_types.id;


--
-- Name: metalhub_product_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_product_variants (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    tax_class_id bigint NOT NULL,
    tax_ref character varying(255),
    unit_quantity integer DEFAULT 1 NOT NULL,
    sku character varying(255),
    gtin character varying(255),
    mpn character varying(255),
    ean character varying(255),
    length_value numeric(10,4) DEFAULT '0'::numeric,
    length_unit character varying(255) DEFAULT 'mm'::character varying,
    width_value numeric(10,4) DEFAULT '0'::numeric,
    width_unit character varying(255) DEFAULT 'mm'::character varying,
    height_value numeric(10,4) DEFAULT '0'::numeric,
    height_unit character varying(255) DEFAULT 'mm'::character varying,
    weight_value numeric(10,4) DEFAULT '0'::numeric,
    weight_unit character varying(255) DEFAULT 'mm'::character varying,
    volume_value numeric(10,4) DEFAULT '0'::numeric,
    volume_unit character varying(255) DEFAULT 'mm'::character varying,
    shippable boolean DEFAULT true NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    backorder integer DEFAULT 0 NOT NULL,
    purchasable character varying(255) DEFAULT 'always'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    attribute_data json,
    quantity_increment integer DEFAULT 1 NOT NULL,
    min_quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.metalhub_product_variants OWNER TO postgres;

--
-- Name: metalhub_product_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_product_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_product_variants_id_seq OWNER TO postgres;

--
-- Name: metalhub_product_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_product_variants_id_seq OWNED BY public.metalhub_product_variants.id;


--
-- Name: metalhub_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_products (
    id bigint NOT NULL,
    product_type_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    attribute_data json NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    brand_id bigint
);


ALTER TABLE public.metalhub_products OWNER TO postgres;

--
-- Name: metalhub_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_products_id_seq OWNER TO postgres;

--
-- Name: metalhub_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_products_id_seq OWNED BY public.metalhub_products.id;


--
-- Name: metalhub_shipping_exclusion_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_exclusion_lists (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_exclusion_lists OWNER TO postgres;

--
-- Name: metalhub_shipping_exclusion_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_exclusion_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_exclusion_lists_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_exclusion_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_exclusion_lists_id_seq OWNED BY public.metalhub_shipping_exclusion_lists.id;


--
-- Name: metalhub_shipping_exclusions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_exclusions (
    id bigint NOT NULL,
    shipping_exclusion_list_id bigint NOT NULL,
    purchasable_type character varying(255) NOT NULL,
    purchasable_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_exclusions OWNER TO postgres;

--
-- Name: metalhub_shipping_exclusions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_exclusions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_exclusions_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_exclusions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_exclusions_id_seq OWNED BY public.metalhub_shipping_exclusions.id;


--
-- Name: metalhub_shipping_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_methods (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    code character varying(255),
    enabled boolean DEFAULT true NOT NULL,
    stock_available boolean DEFAULT false NOT NULL,
    cutoff time(0) without time zone,
    data json,
    driver character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_methods OWNER TO postgres;

--
-- Name: metalhub_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_methods_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_methods_id_seq OWNED BY public.metalhub_shipping_methods.id;


--
-- Name: metalhub_shipping_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_rates (
    id bigint NOT NULL,
    shipping_method_id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_rates OWNER TO postgres;

--
-- Name: metalhub_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_rates_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_rates_id_seq OWNED BY public.metalhub_shipping_rates.id;


--
-- Name: metalhub_shipping_zone_postcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_zone_postcodes (
    id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    postcode character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_zone_postcodes OWNER TO postgres;

--
-- Name: metalhub_shipping_zone_postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_zone_postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_zone_postcodes_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_zone_postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_zone_postcodes_id_seq OWNED BY public.metalhub_shipping_zone_postcodes.id;


--
-- Name: metalhub_shipping_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_shipping_zones (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_shipping_zones OWNER TO postgres;

--
-- Name: metalhub_shipping_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_shipping_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_shipping_zones_id_seq OWNER TO postgres;

--
-- Name: metalhub_shipping_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_shipping_zones_id_seq OWNED BY public.metalhub_shipping_zones.id;


--
-- Name: metalhub_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_staff (
    id bigint NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_staff OWNER TO postgres;

--
-- Name: metalhub_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_staff_id_seq OWNER TO postgres;

--
-- Name: metalhub_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_staff_id_seq OWNED BY public.metalhub_staff.id;


--
-- Name: metalhub_state_shipping_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_state_shipping_zone (
    id bigint NOT NULL,
    state_id bigint NOT NULL,
    shipping_zone_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_state_shipping_zone OWNER TO postgres;

--
-- Name: metalhub_state_shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_state_shipping_zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_state_shipping_zone_id_seq OWNER TO postgres;

--
-- Name: metalhub_state_shipping_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_state_shipping_zone_id_seq OWNED BY public.metalhub_state_shipping_zone.id;


--
-- Name: metalhub_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_states (
    id bigint NOT NULL,
    country_id bigint,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_states OWNER TO postgres;

--
-- Name: metalhub_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_states_id_seq OWNER TO postgres;

--
-- Name: metalhub_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_states_id_seq OWNED BY public.metalhub_states.id;


--
-- Name: metalhub_stripe_payment_intents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_stripe_payment_intents (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    order_id bigint,
    intent_id character varying(255) NOT NULL,
    status character varying(255),
    event_id character varying(255),
    processing_at timestamp(0) without time zone,
    processed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_stripe_payment_intents OWNER TO postgres;

--
-- Name: metalhub_stripe_payment_intents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_stripe_payment_intents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_stripe_payment_intents_id_seq OWNER TO postgres;

--
-- Name: metalhub_stripe_payment_intents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_stripe_payment_intents_id_seq OWNED BY public.metalhub_stripe_payment_intents.id;


--
-- Name: metalhub_taggables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_taggables (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    taggable_type character varying(255) NOT NULL,
    taggable_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_taggables OWNER TO postgres;

--
-- Name: metalhub_taggables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_taggables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_taggables_id_seq OWNER TO postgres;

--
-- Name: metalhub_taggables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_taggables_id_seq OWNED BY public.metalhub_taggables.id;


--
-- Name: metalhub_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tags (
    id bigint NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tags OWNER TO postgres;

--
-- Name: metalhub_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tags_id_seq OWNER TO postgres;

--
-- Name: metalhub_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tags_id_seq OWNED BY public.metalhub_tags.id;


--
-- Name: metalhub_tax_classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_classes (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    "default" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.metalhub_tax_classes OWNER TO postgres;

--
-- Name: metalhub_tax_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_classes_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_classes_id_seq OWNED BY public.metalhub_tax_classes.id;


--
-- Name: metalhub_tax_rate_amounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_rate_amounts (
    id bigint NOT NULL,
    tax_class_id bigint,
    tax_rate_id bigint,
    percentage numeric(7,3) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_rate_amounts OWNER TO postgres;

--
-- Name: metalhub_tax_rate_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_rate_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_rate_amounts_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_rate_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_rate_amounts_id_seq OWNED BY public.metalhub_tax_rate_amounts.id;


--
-- Name: metalhub_tax_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_rates (
    id bigint NOT NULL,
    tax_zone_id bigint,
    priority smallint DEFAULT '1'::smallint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_rates OWNER TO postgres;

--
-- Name: metalhub_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_rates_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_rates_id_seq OWNED BY public.metalhub_tax_rates.id;


--
-- Name: metalhub_tax_zone_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_zone_countries (
    id bigint NOT NULL,
    tax_zone_id bigint,
    country_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_zone_countries OWNER TO postgres;

--
-- Name: metalhub_tax_zone_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_zone_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_zone_countries_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_zone_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_zone_countries_id_seq OWNED BY public.metalhub_tax_zone_countries.id;


--
-- Name: metalhub_tax_zone_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_zone_customer_groups (
    id bigint NOT NULL,
    tax_zone_id bigint,
    customer_group_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_zone_customer_groups OWNER TO postgres;

--
-- Name: metalhub_tax_zone_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_zone_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_zone_customer_groups_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_zone_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_zone_customer_groups_id_seq OWNED BY public.metalhub_tax_zone_customer_groups.id;


--
-- Name: metalhub_tax_zone_postcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_zone_postcodes (
    id bigint NOT NULL,
    tax_zone_id bigint,
    country_id bigint,
    postcode character varying(20) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_zone_postcodes OWNER TO postgres;

--
-- Name: metalhub_tax_zone_postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_zone_postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_zone_postcodes_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_zone_postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_zone_postcodes_id_seq OWNED BY public.metalhub_tax_zone_postcodes.id;


--
-- Name: metalhub_tax_zone_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_zone_states (
    id bigint NOT NULL,
    tax_zone_id bigint,
    state_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_zone_states OWNER TO postgres;

--
-- Name: metalhub_tax_zone_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_zone_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_zone_states_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_zone_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_zone_states_id_seq OWNED BY public.metalhub_tax_zone_states.id;


--
-- Name: metalhub_tax_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_tax_zones (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    zone_type character varying(255) NOT NULL,
    price_display character varying(255) NOT NULL,
    active boolean NOT NULL,
    "default" boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_tax_zones OWNER TO postgres;

--
-- Name: metalhub_tax_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_tax_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_tax_zones_id_seq OWNER TO postgres;

--
-- Name: metalhub_tax_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_tax_zones_id_seq OWNED BY public.metalhub_tax_zones.id;


--
-- Name: metalhub_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_transactions (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    success boolean NOT NULL,
    driver character varying(255) NOT NULL,
    amount integer NOT NULL,
    reference character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    notes character varying(255),
    card_type character varying(25) NOT NULL,
    last_four character varying(255),
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    parent_transaction_id bigint,
    captured_at timestamp(0) without time zone,
    type character varying(255) DEFAULT 'capture'::character varying NOT NULL,
    CONSTRAINT metalhub_transactions_type_check CHECK (((type)::text = ANY ((ARRAY['refund'::character varying, 'intent'::character varying, 'capture'::character varying])::text[])))
);


ALTER TABLE public.metalhub_transactions OWNER TO postgres;

--
-- Name: metalhub_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_transactions_id_seq OWNER TO postgres;

--
-- Name: metalhub_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_transactions_id_seq OWNED BY public.metalhub_transactions.id;


--
-- Name: metalhub_urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metalhub_urls (
    id bigint NOT NULL,
    language_id bigint NOT NULL,
    element_type character varying(255) NOT NULL,
    element_id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.metalhub_urls OWNER TO postgres;

--
-- Name: metalhub_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metalhub_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metalhub_urls_id_seq OWNER TO postgres;

--
-- Name: metalhub_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metalhub_urls_id_seq OWNED BY public.metalhub_urls.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activity_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: metalhub_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_addresses ALTER COLUMN id SET DEFAULT nextval('public.metalhub_addresses_id_seq'::regclass);


--
-- Name: metalhub_assets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_assets ALTER COLUMN id SET DEFAULT nextval('public.metalhub_assets_id_seq'::regclass);


--
-- Name: metalhub_attributables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributables ALTER COLUMN id SET DEFAULT nextval('public.metalhub_attributables_id_seq'::regclass);


--
-- Name: metalhub_attribute_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attribute_groups ALTER COLUMN id SET DEFAULT nextval('public.metalhub_attribute_groups_id_seq'::regclass);


--
-- Name: metalhub_attributes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributes ALTER COLUMN id SET DEFAULT nextval('public.metalhub_attributes_id_seq'::regclass);


--
-- Name: metalhub_brand_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_collection ALTER COLUMN id SET DEFAULT nextval('public.metalhub_brand_collection_id_seq'::regclass);


--
-- Name: metalhub_brand_discount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_discount ALTER COLUMN id SET DEFAULT nextval('public.metalhub_brand_discount_id_seq'::regclass);


--
-- Name: metalhub_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brands ALTER COLUMN id SET DEFAULT nextval('public.metalhub_brands_id_seq'::regclass);


--
-- Name: metalhub_cart_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_addresses ALTER COLUMN id SET DEFAULT nextval('public.metalhub_cart_addresses_id_seq'::regclass);


--
-- Name: metalhub_cart_line_discount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_line_discount ALTER COLUMN id SET DEFAULT nextval('public.metalhub_cart_line_discount_id_seq'::regclass);


--
-- Name: metalhub_cart_lines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_lines ALTER COLUMN id SET DEFAULT nextval('public.metalhub_cart_lines_id_seq'::regclass);


--
-- Name: metalhub_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts ALTER COLUMN id SET DEFAULT nextval('public.metalhub_carts_id_seq'::regclass);


--
-- Name: metalhub_channelables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channelables ALTER COLUMN id SET DEFAULT nextval('public.metalhub_channelables_id_seq'::regclass);


--
-- Name: metalhub_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channels ALTER COLUMN id SET DEFAULT nextval('public.metalhub_channels_id_seq'::regclass);


--
-- Name: metalhub_collection_customer_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_customer_group ALTER COLUMN id SET DEFAULT nextval('public.metalhub_collection_customer_group_id_seq'::regclass);


--
-- Name: metalhub_collection_discount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_discount ALTER COLUMN id SET DEFAULT nextval('public.metalhub_collection_discount_id_seq'::regclass);


--
-- Name: metalhub_collection_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_groups ALTER COLUMN id SET DEFAULT nextval('public.metalhub_collection_groups_id_seq'::regclass);


--
-- Name: metalhub_collection_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_product ALTER COLUMN id SET DEFAULT nextval('public.metalhub_collection_product_id_seq'::regclass);


--
-- Name: metalhub_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collections ALTER COLUMN id SET DEFAULT nextval('public.metalhub_collections_id_seq'::regclass);


--
-- Name: metalhub_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_countries ALTER COLUMN id SET DEFAULT nextval('public.metalhub_countries_id_seq'::regclass);


--
-- Name: metalhub_country_shipping_zone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_country_shipping_zone ALTER COLUMN id SET DEFAULT nextval('public.metalhub_country_shipping_zone_id_seq'::regclass);


--
-- Name: metalhub_currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_currencies ALTER COLUMN id SET DEFAULT nextval('public.metalhub_currencies_id_seq'::regclass);


--
-- Name: metalhub_customer_customer_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_customer_group ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_customer_group_id_seq'::regclass);


--
-- Name: metalhub_customer_group_discount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_discount ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_group_discount_id_seq'::regclass);


--
-- Name: metalhub_customer_group_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_product ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_group_product_id_seq'::regclass);


--
-- Name: metalhub_customer_group_shipping_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_shipping_method ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_group_shipping_method_id_seq'::regclass);


--
-- Name: metalhub_customer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_groups_id_seq'::regclass);


--
-- Name: metalhub_customer_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_user ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customer_user_id_seq'::regclass);


--
-- Name: metalhub_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customers ALTER COLUMN id SET DEFAULT nextval('public.metalhub_customers_id_seq'::regclass);


--
-- Name: metalhub_discount_purchasables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_purchasables ALTER COLUMN id SET DEFAULT nextval('public.metalhub_discount_purchasables_id_seq'::regclass);


--
-- Name: metalhub_discount_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_user ALTER COLUMN id SET DEFAULT nextval('public.metalhub_discount_user_id_seq'::regclass);


--
-- Name: metalhub_discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discounts ALTER COLUMN id SET DEFAULT nextval('public.metalhub_discounts_id_seq'::regclass);


--
-- Name: metalhub_exclusion_list_shipping_zone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_exclusion_list_shipping_zone ALTER COLUMN id SET DEFAULT nextval('public.metalhub_exclusion_list_shipping_zone_id_seq'::regclass);


--
-- Name: metalhub_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_languages ALTER COLUMN id SET DEFAULT nextval('public.metalhub_languages_id_seq'::regclass);


--
-- Name: metalhub_media_product_variant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_media_product_variant ALTER COLUMN id SET DEFAULT nextval('public.metalhub_media_product_variant_id_seq'::regclass);


--
-- Name: metalhub_order_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_addresses ALTER COLUMN id SET DEFAULT nextval('public.metalhub_order_addresses_id_seq'::regclass);


--
-- Name: metalhub_order_lines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_lines ALTER COLUMN id SET DEFAULT nextval('public.metalhub_order_lines_id_seq'::regclass);


--
-- Name: metalhub_order_shipping_zone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_shipping_zone ALTER COLUMN id SET DEFAULT nextval('public.metalhub_order_shipping_zone_id_seq'::regclass);


--
-- Name: metalhub_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders ALTER COLUMN id SET DEFAULT nextval('public.metalhub_orders_id_seq'::regclass);


--
-- Name: metalhub_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_prices ALTER COLUMN id SET DEFAULT nextval('public.metalhub_prices_id_seq'::regclass);


--
-- Name: metalhub_product_associations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_associations ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_associations_id_seq'::regclass);


--
-- Name: metalhub_product_option_value_product_variant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_value_product_variant ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_option_value_product_variant_id_seq'::regclass);


--
-- Name: metalhub_product_option_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_values ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_option_values_id_seq'::regclass);


--
-- Name: metalhub_product_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_options ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_options_id_seq'::regclass);


--
-- Name: metalhub_product_product_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_product_option ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_product_option_id_seq'::regclass);


--
-- Name: metalhub_product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_types ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_types_id_seq'::regclass);


--
-- Name: metalhub_product_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_variants ALTER COLUMN id SET DEFAULT nextval('public.metalhub_product_variants_id_seq'::regclass);


--
-- Name: metalhub_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_products ALTER COLUMN id SET DEFAULT nextval('public.metalhub_products_id_seq'::regclass);


--
-- Name: metalhub_shipping_exclusion_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusion_lists ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_exclusion_lists_id_seq'::regclass);


--
-- Name: metalhub_shipping_exclusions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusions ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_exclusions_id_seq'::regclass);


--
-- Name: metalhub_shipping_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_methods ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_methods_id_seq'::regclass);


--
-- Name: metalhub_shipping_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_rates ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_rates_id_seq'::regclass);


--
-- Name: metalhub_shipping_zone_postcodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_zone_postcodes ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_zone_postcodes_id_seq'::regclass);


--
-- Name: metalhub_shipping_zones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_zones ALTER COLUMN id SET DEFAULT nextval('public.metalhub_shipping_zones_id_seq'::regclass);


--
-- Name: metalhub_staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_staff ALTER COLUMN id SET DEFAULT nextval('public.metalhub_staff_id_seq'::regclass);


--
-- Name: metalhub_state_shipping_zone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_state_shipping_zone ALTER COLUMN id SET DEFAULT nextval('public.metalhub_state_shipping_zone_id_seq'::regclass);


--
-- Name: metalhub_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_states ALTER COLUMN id SET DEFAULT nextval('public.metalhub_states_id_seq'::regclass);


--
-- Name: metalhub_stripe_payment_intents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_stripe_payment_intents ALTER COLUMN id SET DEFAULT nextval('public.metalhub_stripe_payment_intents_id_seq'::regclass);


--
-- Name: metalhub_taggables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_taggables ALTER COLUMN id SET DEFAULT nextval('public.metalhub_taggables_id_seq'::regclass);


--
-- Name: metalhub_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tags ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tags_id_seq'::regclass);


--
-- Name: metalhub_tax_classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_classes ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_classes_id_seq'::regclass);


--
-- Name: metalhub_tax_rate_amounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rate_amounts ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_rate_amounts_id_seq'::regclass);


--
-- Name: metalhub_tax_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rates ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_rates_id_seq'::regclass);


--
-- Name: metalhub_tax_zone_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_countries ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_zone_countries_id_seq'::regclass);


--
-- Name: metalhub_tax_zone_customer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_zone_customer_groups_id_seq'::regclass);


--
-- Name: metalhub_tax_zone_postcodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_postcodes ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_zone_postcodes_id_seq'::regclass);


--
-- Name: metalhub_tax_zone_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_states ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_zone_states_id_seq'::regclass);


--
-- Name: metalhub_tax_zones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zones ALTER COLUMN id SET DEFAULT nextval('public.metalhub_tax_zones_id_seq'::regclass);


--
-- Name: metalhub_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_transactions ALTER COLUMN id SET DEFAULT nextval('public.metalhub_transactions_id_seq'::regclass);


--
-- Name: metalhub_urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_urls ALTER COLUMN id SET DEFAULT nextval('public.metalhub_urls_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activity_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_log (id, log_name, description, subject_type, subject_id, event, causer_type, causer_id, properties, batch_uuid, created_at, updated_at) FROM stdin;
1	lunar	created	channel	1	created	\N	\N	{"attributes":{"id":1,"name":"Webstore","handle":"webstore","default":true,"url":"http:\\/\\/localhost","created_at":"2024-09-17T21:00:08.000000Z","deleted_at":null}}	\N	2024-09-17 21:00:09	2024-09-17 21:00:09
2	lunar	created	currency	1	created	\N	\N	{"attributes":{"id":1,"code":"NRS","name":"Nepali Rupees","exchange_rate":"1.0000","decimal_places":2,"enabled":true,"default":true,"created_at":"2024-09-17T21:00:09.000000Z"}}	\N	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, model_type, model_id, uuid, collection_name, name, file_name, mime_type, disk, conversions_disk, size, manipulations, custom_properties, generated_conversions, responsive_images, order_column, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_addresses (id, customer_id, country_id, title, first_name, last_name, company_name, line_one, line_two, line_three, city, state, postcode, delivery_instructions, contact_email, contact_phone, meta, shipping_default, billing_default, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_assets (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_attributables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_attributables (id, attributable_type, attributable_id, attribute_id, created_at, updated_at) FROM stdin;
1	product_type	1	1	2024-09-17 21:00:09	2024-09-17 21:00:09
2	product_type	1	3	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_attribute_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_attribute_groups (id, attributable_type, name, handle, "position", created_at, updated_at) FROM stdin;
1	product	{"en":"Details"}	details	1	2024-09-17 21:00:09	2024-09-17 21:00:09
2	collection	{"en":"Details"}	collection_details	1	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_attributes (id, attribute_type, attribute_group_id, "position", name, handle, section, type, required, default_value, configuration, system, created_at, updated_at, searchable, filterable, validation_rules, description) FROM stdin;
1	product	1	1	{"en":"Name"}	name	main	Lunar\\FieldTypes\\TranslatedText	t	\N	{"richtext":false}	t	2024-09-17 21:00:09	2024-09-17 21:00:09	t	f	\N	{"en":""}
2	collection	2	1	{"en":"Name"}	name	main	Lunar\\FieldTypes\\TranslatedText	t	\N	{"richtext":false}	t	2024-09-17 21:00:09	2024-09-17 21:00:09	t	f	\N	{"en":""}
3	product	1	2	{"en":"Description"}	description	main	Lunar\\FieldTypes\\TranslatedText	f	\N	{"richtext":true}	f	2024-09-17 21:00:09	2024-09-17 21:00:09	t	f	\N	{"en":""}
4	collection	2	2	{"en":"Description"}	description	main	Lunar\\FieldTypes\\TranslatedText	f	\N	{"richtext":true}	f	2024-09-17 21:00:09	2024-09-17 21:00:09	t	f	\N	{"en":""}
\.


--
-- Data for Name: metalhub_brand_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_brand_collection (id, brand_id, collection_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_brand_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_brand_discount (id, brand_id, discount_id, created_at, updated_at, type) FROM stdin;
\.


--
-- Data for Name: metalhub_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_brands (id, name, created_at, updated_at, attribute_data) FROM stdin;
\.


--
-- Data for Name: metalhub_cart_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_cart_addresses (id, cart_id, country_id, title, first_name, last_name, company_name, line_one, line_two, line_three, city, state, postcode, delivery_instructions, contact_email, contact_phone, type, shipping_option, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_cart_line_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_cart_line_discount (id, cart_line_id, discount_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_cart_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_cart_lines (id, cart_id, purchasable_type, purchasable_id, quantity, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_carts (id, user_id, merged_id, currency_id, channel_id, order_id, coupon_code, completed_at, meta, created_at, updated_at, customer_id, deleted_at) FROM stdin;
\.


--
-- Data for Name: metalhub_channelables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_channelables (id, channel_id, channelable_type, channelable_id, enabled, starts_at, created_at, updated_at, ends_at) FROM stdin;
\.


--
-- Data for Name: metalhub_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_channels (id, name, handle, "default", url, created_at, updated_at, deleted_at) FROM stdin;
1	Webstore	webstore	t	http://localhost	2024-09-17 21:00:08	2024-09-17 21:00:08	\N
\.


--
-- Data for Name: metalhub_collection_customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_collection_customer_group (id, collection_id, customer_group_id, enabled, starts_at, ends_at, visible, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_collection_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_collection_discount (id, discount_id, collection_id, created_at, updated_at, type) FROM stdin;
\.


--
-- Data for Name: metalhub_collection_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_collection_groups (id, name, handle, created_at, updated_at) FROM stdin;
1	Main	main	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_collection_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_collection_product (id, collection_id, product_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_collections (id, collection_group_id, _lft, _rgt, parent_id, type, attribute_data, sort, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: metalhub_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_countries (id, name, iso3, iso2, phonecode, capital, currency, native, emoji, emoji_u, created_at, updated_at) FROM stdin;
1	Afghanistan	AFG	AF	93	Kabul	AFN	افغانستان	🇦🇫	U+1F1E6 U+1F1EB	2024-09-17 20:59:58	2024-09-17 20:59:58
2	Aland Islands	ALA	AX	+358-18	Mariehamn	EUR	Åland	🇦🇽	U+1F1E6 U+1F1FD	2024-09-17 20:59:59	2024-09-17 20:59:59
3	Albania	ALB	AL	355	Tirana	ALL	Shqipëria	🇦🇱	U+1F1E6 U+1F1F1	2024-09-17 20:59:59	2024-09-17 20:59:59
4	Algeria	DZA	DZ	213	Algiers	DZD	الجزائر	🇩🇿	U+1F1E9 U+1F1FF	2024-09-17 20:59:59	2024-09-17 20:59:59
5	American Samoa	ASM	AS	+1-684	Pago Pago	USD	American Samoa	🇦🇸	U+1F1E6 U+1F1F8	2024-09-17 20:59:59	2024-09-17 20:59:59
6	Andorra	AND	AD	376	Andorra la Vella	EUR	Andorra	🇦🇩	U+1F1E6 U+1F1E9	2024-09-17 20:59:59	2024-09-17 20:59:59
7	Angola	AGO	AO	244	Luanda	AOA	Angola	🇦🇴	U+1F1E6 U+1F1F4	2024-09-17 20:59:59	2024-09-17 20:59:59
8	Anguilla	AIA	AI	+1-264	The Valley	XCD	Anguilla	🇦🇮	U+1F1E6 U+1F1EE	2024-09-17 20:59:59	2024-09-17 20:59:59
9	Antarctica	ATA	AQ	672		AAD	Antarctica	🇦🇶	U+1F1E6 U+1F1F6	2024-09-17 20:59:59	2024-09-17 20:59:59
10	Antigua And Barbuda	ATG	AG	+1-268	St. John's	XCD	Antigua and Barbuda	🇦🇬	U+1F1E6 U+1F1EC	2024-09-17 20:59:59	2024-09-17 20:59:59
11	Argentina	ARG	AR	54	Buenos Aires	ARS	Argentina	🇦🇷	U+1F1E6 U+1F1F7	2024-09-17 20:59:59	2024-09-17 20:59:59
12	Armenia	ARM	AM	374	Yerevan	AMD	Հայաստան	🇦🇲	U+1F1E6 U+1F1F2	2024-09-17 20:59:59	2024-09-17 20:59:59
13	Aruba	ABW	AW	297	Oranjestad	AWG	Aruba	🇦🇼	U+1F1E6 U+1F1FC	2024-09-17 20:59:59	2024-09-17 20:59:59
14	Australia	AUS	AU	61	Canberra	AUD	Australia	🇦🇺	U+1F1E6 U+1F1FA	2024-09-17 20:59:59	2024-09-17 20:59:59
15	Austria	AUT	AT	43	Vienna	EUR	Österreich	🇦🇹	U+1F1E6 U+1F1F9	2024-09-17 20:59:59	2024-09-17 20:59:59
16	Azerbaijan	AZE	AZ	994	Baku	AZN	Azərbaycan	🇦🇿	U+1F1E6 U+1F1FF	2024-09-17 20:59:59	2024-09-17 20:59:59
17	Bahamas The	BHS	BS	+1-242	Nassau	BSD	Bahamas	🇧🇸	U+1F1E7 U+1F1F8	2024-09-17 20:59:59	2024-09-17 20:59:59
18	Bahrain	BHR	BH	973	Manama	BHD	‏البحرين	🇧🇭	U+1F1E7 U+1F1ED	2024-09-17 20:59:59	2024-09-17 20:59:59
19	Bangladesh	BGD	BD	880	Dhaka	BDT	Bangladesh	🇧🇩	U+1F1E7 U+1F1E9	2024-09-17 20:59:59	2024-09-17 20:59:59
20	Barbados	BRB	BB	+1-246	Bridgetown	BBD	Barbados	🇧🇧	U+1F1E7 U+1F1E7	2024-09-17 21:00:00	2024-09-17 21:00:00
21	Belarus	BLR	BY	375	Minsk	BYN	Белару́сь	🇧🇾	U+1F1E7 U+1F1FE	2024-09-17 21:00:00	2024-09-17 21:00:00
22	Belgium	BEL	BE	32	Brussels	EUR	België	🇧🇪	U+1F1E7 U+1F1EA	2024-09-17 21:00:00	2024-09-17 21:00:00
23	Belize	BLZ	BZ	501	Belmopan	BZD	Belize	🇧🇿	U+1F1E7 U+1F1FF	2024-09-17 21:00:00	2024-09-17 21:00:00
24	Benin	BEN	BJ	229	Porto-Novo	XOF	Bénin	🇧🇯	U+1F1E7 U+1F1EF	2024-09-17 21:00:00	2024-09-17 21:00:00
25	Bermuda	BMU	BM	+1-441	Hamilton	BMD	Bermuda	🇧🇲	U+1F1E7 U+1F1F2	2024-09-17 21:00:00	2024-09-17 21:00:00
26	Bhutan	BTN	BT	975	Thimphu	BTN	ʼbrug-yul	🇧🇹	U+1F1E7 U+1F1F9	2024-09-17 21:00:00	2024-09-17 21:00:00
27	Bolivia	BOL	BO	591	Sucre	BOB	Bolivia	🇧🇴	U+1F1E7 U+1F1F4	2024-09-17 21:00:00	2024-09-17 21:00:00
28	Bonaire, Sint Eustatius and Saba	BES	BQ	599	Kralendijk	USD	Caribisch Nederland	🇧🇶	U+1F1E7 U+1F1F6	2024-09-17 21:00:00	2024-09-17 21:00:00
29	Bosnia and Herzegovina	BIH	BA	387	Sarajevo	BAM	Bosna i Hercegovina	🇧🇦	U+1F1E7 U+1F1E6	2024-09-17 21:00:00	2024-09-17 21:00:00
30	Botswana	BWA	BW	267	Gaborone	BWP	Botswana	🇧🇼	U+1F1E7 U+1F1FC	2024-09-17 21:00:00	2024-09-17 21:00:00
31	Bouvet Island	BVT	BV	0055		NOK	Bouvetøya	🇧🇻	U+1F1E7 U+1F1FB	2024-09-17 21:00:00	2024-09-17 21:00:00
32	Brazil	BRA	BR	55	Brasilia	BRL	Brasil	🇧🇷	U+1F1E7 U+1F1F7	2024-09-17 21:00:00	2024-09-17 21:00:00
33	British Indian Ocean Territory	IOT	IO	246	Diego Garcia	USD	British Indian Ocean Territory	🇮🇴	U+1F1EE U+1F1F4	2024-09-17 21:00:00	2024-09-17 21:00:00
34	Brunei	BRN	BN	673	Bandar Seri Begawan	BND	Negara Brunei Darussalam	🇧🇳	U+1F1E7 U+1F1F3	2024-09-17 21:00:00	2024-09-17 21:00:00
35	Bulgaria	BGR	BG	359	Sofia	BGN	България	🇧🇬	U+1F1E7 U+1F1EC	2024-09-17 21:00:00	2024-09-17 21:00:00
36	Burkina Faso	BFA	BF	226	Ouagadougou	XOF	Burkina Faso	🇧🇫	U+1F1E7 U+1F1EB	2024-09-17 21:00:00	2024-09-17 21:00:00
37	Burundi	BDI	BI	257	Bujumbura	BIF	Burundi	🇧🇮	U+1F1E7 U+1F1EE	2024-09-17 21:00:00	2024-09-17 21:00:00
38	Cambodia	KHM	KH	855	Phnom Penh	KHR	Kâmpŭchéa	🇰🇭	U+1F1F0 U+1F1ED	2024-09-17 21:00:00	2024-09-17 21:00:00
39	Cameroon	CMR	CM	237	Yaounde	XAF	Cameroon	🇨🇲	U+1F1E8 U+1F1F2	2024-09-17 21:00:00	2024-09-17 21:00:00
40	Canada	CAN	CA	1	Ottawa	CAD	Canada	🇨🇦	U+1F1E8 U+1F1E6	2024-09-17 21:00:00	2024-09-17 21:00:00
41	Cape Verde	CPV	CV	238	Praia	CVE	Cabo Verde	🇨🇻	U+1F1E8 U+1F1FB	2024-09-17 21:00:00	2024-09-17 21:00:00
42	Cayman Islands	CYM	KY	+1-345	George Town	KYD	Cayman Islands	🇰🇾	U+1F1F0 U+1F1FE	2024-09-17 21:00:01	2024-09-17 21:00:01
43	Central African Republic	CAF	CF	236	Bangui	XAF	Ködörösêse tî Bêafrîka	🇨🇫	U+1F1E8 U+1F1EB	2024-09-17 21:00:01	2024-09-17 21:00:01
44	Chad	TCD	TD	235	N'Djamena	XAF	Tchad	🇹🇩	U+1F1F9 U+1F1E9	2024-09-17 21:00:01	2024-09-17 21:00:01
45	Chile	CHL	CL	56	Santiago	CLP	Chile	🇨🇱	U+1F1E8 U+1F1F1	2024-09-17 21:00:01	2024-09-17 21:00:01
46	China	CHN	CN	86	Beijing	CNY	中国	🇨🇳	U+1F1E8 U+1F1F3	2024-09-17 21:00:01	2024-09-17 21:00:01
47	Christmas Island	CXR	CX	61	Flying Fish Cove	AUD	Christmas Island	🇨🇽	U+1F1E8 U+1F1FD	2024-09-17 21:00:01	2024-09-17 21:00:01
48	Cocos (Keeling) Islands	CCK	CC	61	West Island	AUD	Cocos (Keeling) Islands	🇨🇨	U+1F1E8 U+1F1E8	2024-09-17 21:00:01	2024-09-17 21:00:01
49	Colombia	COL	CO	57	Bogota	COP	Colombia	🇨🇴	U+1F1E8 U+1F1F4	2024-09-17 21:00:01	2024-09-17 21:00:01
50	Comoros	COM	KM	269	Moroni	KMF	Komori	🇰🇲	U+1F1F0 U+1F1F2	2024-09-17 21:00:01	2024-09-17 21:00:01
51	Congo	COG	CG	242	Brazzaville	XAF	République du Congo	🇨🇬	U+1F1E8 U+1F1EC	2024-09-17 21:00:01	2024-09-17 21:00:01
52	Cook Islands	COK	CK	682	Avarua	NZD	Cook Islands	🇨🇰	U+1F1E8 U+1F1F0	2024-09-17 21:00:01	2024-09-17 21:00:01
53	Costa Rica	CRI	CR	506	San Jose	CRC	Costa Rica	🇨🇷	U+1F1E8 U+1F1F7	2024-09-17 21:00:01	2024-09-17 21:00:01
54	Cote D'Ivoire (Ivory Coast)	CIV	CI	225	Yamoussoukro	XOF	\N	🇨🇮	U+1F1E8 U+1F1EE	2024-09-17 21:00:01	2024-09-17 21:00:01
55	Croatia	HRV	HR	385	Zagreb	HRK	Hrvatska	🇭🇷	U+1F1ED U+1F1F7	2024-09-17 21:00:01	2024-09-17 21:00:01
56	Cuba	CUB	CU	53	Havana	CUP	Cuba	🇨🇺	U+1F1E8 U+1F1FA	2024-09-17 21:00:01	2024-09-17 21:00:01
57	Curaçao	CUW	CW	599	Willemstad	ANG	Curaçao	🇨🇼	U+1F1E8 U+1F1FC	2024-09-17 21:00:01	2024-09-17 21:00:01
58	Cyprus	CYP	CY	357	Nicosia	EUR	Κύπρος	🇨🇾	U+1F1E8 U+1F1FE	2024-09-17 21:00:01	2024-09-17 21:00:01
59	Czech Republic	CZE	CZ	420	Prague	CZK	Česká republika	🇨🇿	U+1F1E8 U+1F1FF	2024-09-17 21:00:01	2024-09-17 21:00:01
60	Democratic Republic of the Congo	COD	CD	243	Kinshasa	CDF	République démocratique du Congo	🇨🇩	U+1F1E8 U+1F1E9	2024-09-17 21:00:01	2024-09-17 21:00:01
61	Denmark	DNK	DK	45	Copenhagen	DKK	Danmark	🇩🇰	U+1F1E9 U+1F1F0	2024-09-17 21:00:01	2024-09-17 21:00:01
62	Djibouti	DJI	DJ	253	Djibouti	DJF	Djibouti	🇩🇯	U+1F1E9 U+1F1EF	2024-09-17 21:00:01	2024-09-17 21:00:01
63	Dominica	DMA	DM	+1-767	Roseau	XCD	Dominica	🇩🇲	U+1F1E9 U+1F1F2	2024-09-17 21:00:01	2024-09-17 21:00:01
64	Dominican Republic	DOM	DO	+1-809 and 1-829	Santo Domingo	DOP	República Dominicana	🇩🇴	U+1F1E9 U+1F1F4	2024-09-17 21:00:02	2024-09-17 21:00:02
65	East Timor	TLS	TL	670	Dili	USD	Timor-Leste	🇹🇱	U+1F1F9 U+1F1F1	2024-09-17 21:00:02	2024-09-17 21:00:02
66	Ecuador	ECU	EC	593	Quito	USD	Ecuador	🇪🇨	U+1F1EA U+1F1E8	2024-09-17 21:00:02	2024-09-17 21:00:02
67	Egypt	EGY	EG	20	Cairo	EGP	مصر‎	🇪🇬	U+1F1EA U+1F1EC	2024-09-17 21:00:02	2024-09-17 21:00:02
68	El Salvador	SLV	SV	503	San Salvador	USD	El Salvador	🇸🇻	U+1F1F8 U+1F1FB	2024-09-17 21:00:02	2024-09-17 21:00:02
69	Equatorial Guinea	GNQ	GQ	240	Malabo	XAF	Guinea Ecuatorial	🇬🇶	U+1F1EC U+1F1F6	2024-09-17 21:00:02	2024-09-17 21:00:02
70	Eritrea	ERI	ER	291	Asmara	ERN	ኤርትራ	🇪🇷	U+1F1EA U+1F1F7	2024-09-17 21:00:02	2024-09-17 21:00:02
71	Estonia	EST	EE	372	Tallinn	EUR	Eesti	🇪🇪	U+1F1EA U+1F1EA	2024-09-17 21:00:02	2024-09-17 21:00:02
72	Ethiopia	ETH	ET	251	Addis Ababa	ETB	ኢትዮጵያ	🇪🇹	U+1F1EA U+1F1F9	2024-09-17 21:00:02	2024-09-17 21:00:02
73	Falkland Islands	FLK	FK	500	Stanley	FKP	Falkland Islands	🇫🇰	U+1F1EB U+1F1F0	2024-09-17 21:00:02	2024-09-17 21:00:02
74	Faroe Islands	FRO	FO	298	Torshavn	DKK	Føroyar	🇫🇴	U+1F1EB U+1F1F4	2024-09-17 21:00:02	2024-09-17 21:00:02
75	Fiji Islands	FJI	FJ	679	Suva	FJD	Fiji	🇫🇯	U+1F1EB U+1F1EF	2024-09-17 21:00:02	2024-09-17 21:00:02
76	Finland	FIN	FI	358	Helsinki	EUR	Suomi	🇫🇮	U+1F1EB U+1F1EE	2024-09-17 21:00:02	2024-09-17 21:00:02
77	France	FRA	FR	33	Paris	EUR	France	🇫🇷	U+1F1EB U+1F1F7	2024-09-17 21:00:02	2024-09-17 21:00:02
78	French Guiana	GUF	GF	594	Cayenne	EUR	Guyane française	🇬🇫	U+1F1EC U+1F1EB	2024-09-17 21:00:02	2024-09-17 21:00:02
79	French Polynesia	PYF	PF	689	Papeete	XPF	Polynésie française	🇵🇫	U+1F1F5 U+1F1EB	2024-09-17 21:00:02	2024-09-17 21:00:02
80	French Southern Territories	ATF	TF	262	Port-aux-Francais	EUR	Territoire des Terres australes et antarctiques fr	🇹🇫	U+1F1F9 U+1F1EB	2024-09-17 21:00:02	2024-09-17 21:00:02
81	Gabon	GAB	GA	241	Libreville	XAF	Gabon	🇬🇦	U+1F1EC U+1F1E6	2024-09-17 21:00:02	2024-09-17 21:00:02
82	Gambia The	GMB	GM	220	Banjul	GMD	Gambia	🇬🇲	U+1F1EC U+1F1F2	2024-09-17 21:00:02	2024-09-17 21:00:02
83	Georgia	GEO	GE	995	Tbilisi	GEL	საქართველო	🇬🇪	U+1F1EC U+1F1EA	2024-09-17 21:00:02	2024-09-17 21:00:02
84	Germany	DEU	DE	49	Berlin	EUR	Deutschland	🇩🇪	U+1F1E9 U+1F1EA	2024-09-17 21:00:02	2024-09-17 21:00:02
85	Ghana	GHA	GH	233	Accra	GHS	Ghana	🇬🇭	U+1F1EC U+1F1ED	2024-09-17 21:00:02	2024-09-17 21:00:02
86	Gibraltar	GIB	GI	350	Gibraltar	GIP	Gibraltar	🇬🇮	U+1F1EC U+1F1EE	2024-09-17 21:00:02	2024-09-17 21:00:02
87	Greece	GRC	GR	30	Athens	EUR	Ελλάδα	🇬🇷	U+1F1EC U+1F1F7	2024-09-17 21:00:02	2024-09-17 21:00:02
88	Greenland	GRL	GL	299	Nuuk	DKK	Kalaallit Nunaat	🇬🇱	U+1F1EC U+1F1F1	2024-09-17 21:00:03	2024-09-17 21:00:03
89	Grenada	GRD	GD	+1-473	St. George's	XCD	Grenada	🇬🇩	U+1F1EC U+1F1E9	2024-09-17 21:00:03	2024-09-17 21:00:03
90	Guadeloupe	GLP	GP	590	Basse-Terre	EUR	Guadeloupe	🇬🇵	U+1F1EC U+1F1F5	2024-09-17 21:00:03	2024-09-17 21:00:03
91	Guam	GUM	GU	+1-671	Hagatna	USD	Guam	🇬🇺	U+1F1EC U+1F1FA	2024-09-17 21:00:03	2024-09-17 21:00:03
92	Guatemala	GTM	GT	502	Guatemala City	GTQ	Guatemala	🇬🇹	U+1F1EC U+1F1F9	2024-09-17 21:00:03	2024-09-17 21:00:03
93	Guernsey and Alderney	GGY	GG	+44-1481	St Peter Port	GBP	Guernsey	🇬🇬	U+1F1EC U+1F1EC	2024-09-17 21:00:03	2024-09-17 21:00:03
94	Guinea	GIN	GN	224	Conakry	GNF	Guinée	🇬🇳	U+1F1EC U+1F1F3	2024-09-17 21:00:03	2024-09-17 21:00:03
95	Guinea-Bissau	GNB	GW	245	Bissau	XOF	Guiné-Bissau	🇬🇼	U+1F1EC U+1F1FC	2024-09-17 21:00:03	2024-09-17 21:00:03
96	Guyana	GUY	GY	592	Georgetown	GYD	Guyana	🇬🇾	U+1F1EC U+1F1FE	2024-09-17 21:00:03	2024-09-17 21:00:03
97	Haiti	HTI	HT	509	Port-au-Prince	HTG	Haïti	🇭🇹	U+1F1ED U+1F1F9	2024-09-17 21:00:03	2024-09-17 21:00:03
98	Heard Island and McDonald Islands	HMD	HM	672		AUD	Heard Island and McDonald Islands	🇭🇲	U+1F1ED U+1F1F2	2024-09-17 21:00:03	2024-09-17 21:00:03
99	Honduras	HND	HN	504	Tegucigalpa	HNL	Honduras	🇭🇳	U+1F1ED U+1F1F3	2024-09-17 21:00:03	2024-09-17 21:00:03
100	Hong Kong S.A.R.	HKG	HK	852	Hong Kong	HKD	香港	🇭🇰	U+1F1ED U+1F1F0	2024-09-17 21:00:03	2024-09-17 21:00:03
101	Hungary	HUN	HU	36	Budapest	HUF	Magyarország	🇭🇺	U+1F1ED U+1F1FA	2024-09-17 21:00:03	2024-09-17 21:00:03
102	Iceland	ISL	IS	354	Reykjavik	ISK	Ísland	🇮🇸	U+1F1EE U+1F1F8	2024-09-17 21:00:03	2024-09-17 21:00:03
103	India	IND	IN	91	New Delhi	INR	भारत	🇮🇳	U+1F1EE U+1F1F3	2024-09-17 21:00:03	2024-09-17 21:00:03
104	Indonesia	IDN	ID	62	Jakarta	IDR	Indonesia	🇮🇩	U+1F1EE U+1F1E9	2024-09-17 21:00:03	2024-09-17 21:00:03
105	Iran	IRN	IR	98	Tehran	IRR	ایران	🇮🇷	U+1F1EE U+1F1F7	2024-09-17 21:00:03	2024-09-17 21:00:03
106	Iraq	IRQ	IQ	964	Baghdad	IQD	العراق	🇮🇶	U+1F1EE U+1F1F6	2024-09-17 21:00:03	2024-09-17 21:00:03
107	Ireland	IRL	IE	353	Dublin	EUR	Éire	🇮🇪	U+1F1EE U+1F1EA	2024-09-17 21:00:03	2024-09-17 21:00:03
108	Israel	ISR	IL	972	Jerusalem	ILS	יִשְׂרָאֵל	🇮🇱	U+1F1EE U+1F1F1	2024-09-17 21:00:03	2024-09-17 21:00:03
109	Italy	ITA	IT	39	Rome	EUR	Italia	🇮🇹	U+1F1EE U+1F1F9	2024-09-17 21:00:03	2024-09-17 21:00:03
110	Jamaica	JAM	JM	+1-876	Kingston	JMD	Jamaica	🇯🇲	U+1F1EF U+1F1F2	2024-09-17 21:00:04	2024-09-17 21:00:04
111	Japan	JPN	JP	81	Tokyo	JPY	日本	🇯🇵	U+1F1EF U+1F1F5	2024-09-17 21:00:04	2024-09-17 21:00:04
112	Jersey	JEY	JE	+44-1534	Saint Helier	GBP	Jersey	🇯🇪	U+1F1EF U+1F1EA	2024-09-17 21:00:04	2024-09-17 21:00:04
113	Jordan	JOR	JO	962	Amman	JOD	الأردن	🇯🇴	U+1F1EF U+1F1F4	2024-09-17 21:00:04	2024-09-17 21:00:04
114	Kazakhstan	KAZ	KZ	7	Astana	KZT	Қазақстан	🇰🇿	U+1F1F0 U+1F1FF	2024-09-17 21:00:04	2024-09-17 21:00:04
115	Kenya	KEN	KE	254	Nairobi	KES	Kenya	🇰🇪	U+1F1F0 U+1F1EA	2024-09-17 21:00:04	2024-09-17 21:00:04
116	Kiribati	KIR	KI	686	Tarawa	AUD	Kiribati	🇰🇮	U+1F1F0 U+1F1EE	2024-09-17 21:00:04	2024-09-17 21:00:04
117	Kosovo	XKX	XK	383	Pristina	EUR	Republika e Kosovës	🇽🇰	U+1F1FD U+1F1F0	2024-09-17 21:00:04	2024-09-17 21:00:04
118	Kuwait	KWT	KW	965	Kuwait City	KWD	الكويت	🇰🇼	U+1F1F0 U+1F1FC	2024-09-17 21:00:04	2024-09-17 21:00:04
119	Kyrgyzstan	KGZ	KG	996	Bishkek	KGS	Кыргызстан	🇰🇬	U+1F1F0 U+1F1EC	2024-09-17 21:00:04	2024-09-17 21:00:04
120	Laos	LAO	LA	856	Vientiane	LAK	ສປປລາວ	🇱🇦	U+1F1F1 U+1F1E6	2024-09-17 21:00:04	2024-09-17 21:00:04
121	Latvia	LVA	LV	371	Riga	EUR	Latvija	🇱🇻	U+1F1F1 U+1F1FB	2024-09-17 21:00:04	2024-09-17 21:00:04
122	Lebanon	LBN	LB	961	Beirut	LBP	لبنان	🇱🇧	U+1F1F1 U+1F1E7	2024-09-17 21:00:04	2024-09-17 21:00:04
123	Lesotho	LSO	LS	266	Maseru	LSL	Lesotho	🇱🇸	U+1F1F1 U+1F1F8	2024-09-17 21:00:04	2024-09-17 21:00:04
124	Liberia	LBR	LR	231	Monrovia	LRD	Liberia	🇱🇷	U+1F1F1 U+1F1F7	2024-09-17 21:00:05	2024-09-17 21:00:05
125	Libya	LBY	LY	218	Tripolis	LYD	‏ليبيا	🇱🇾	U+1F1F1 U+1F1FE	2024-09-17 21:00:05	2024-09-17 21:00:05
126	Liechtenstein	LIE	LI	423	Vaduz	CHF	Liechtenstein	🇱🇮	U+1F1F1 U+1F1EE	2024-09-17 21:00:05	2024-09-17 21:00:05
127	Lithuania	LTU	LT	370	Vilnius	EUR	Lietuva	🇱🇹	U+1F1F1 U+1F1F9	2024-09-17 21:00:05	2024-09-17 21:00:05
128	Luxembourg	LUX	LU	352	Luxembourg	EUR	Luxembourg	🇱🇺	U+1F1F1 U+1F1FA	2024-09-17 21:00:05	2024-09-17 21:00:05
129	Macau S.A.R.	MAC	MO	853	Macao	MOP	澳門	🇲🇴	U+1F1F2 U+1F1F4	2024-09-17 21:00:05	2024-09-17 21:00:05
130	Macedonia	MKD	MK	389	Skopje	MKD	Северна Македонија	🇲🇰	U+1F1F2 U+1F1F0	2024-09-17 21:00:05	2024-09-17 21:00:05
131	Madagascar	MDG	MG	261	Antananarivo	MGA	Madagasikara	🇲🇬	U+1F1F2 U+1F1EC	2024-09-17 21:00:05	2024-09-17 21:00:05
132	Malawi	MWI	MW	265	Lilongwe	MWK	Malawi	🇲🇼	U+1F1F2 U+1F1FC	2024-09-17 21:00:05	2024-09-17 21:00:05
133	Malaysia	MYS	MY	60	Kuala Lumpur	MYR	Malaysia	🇲🇾	U+1F1F2 U+1F1FE	2024-09-17 21:00:05	2024-09-17 21:00:05
134	Maldives	MDV	MV	960	Male	MVR	Maldives	🇲🇻	U+1F1F2 U+1F1FB	2024-09-17 21:00:05	2024-09-17 21:00:05
135	Mali	MLI	ML	223	Bamako	XOF	Mali	🇲🇱	U+1F1F2 U+1F1F1	2024-09-17 21:00:05	2024-09-17 21:00:05
136	Malta	MLT	MT	356	Valletta	EUR	Malta	🇲🇹	U+1F1F2 U+1F1F9	2024-09-17 21:00:05	2024-09-17 21:00:05
137	Man (Isle of)	IMN	IM	+44-1624	Douglas, Isle of Man	GBP	Isle of Man	🇮🇲	U+1F1EE U+1F1F2	2024-09-17 21:00:05	2024-09-17 21:00:05
138	Marshall Islands	MHL	MH	692	Majuro	USD	M̧ajeļ	🇲🇭	U+1F1F2 U+1F1ED	2024-09-17 21:00:05	2024-09-17 21:00:05
139	Martinique	MTQ	MQ	596	Fort-de-France	EUR	Martinique	🇲🇶	U+1F1F2 U+1F1F6	2024-09-17 21:00:05	2024-09-17 21:00:05
140	Mauritania	MRT	MR	222	Nouakchott	MRO	موريتانيا	🇲🇷	U+1F1F2 U+1F1F7	2024-09-17 21:00:05	2024-09-17 21:00:05
141	Mauritius	MUS	MU	230	Port Louis	MUR	Maurice	🇲🇺	U+1F1F2 U+1F1FA	2024-09-17 21:00:05	2024-09-17 21:00:05
142	Mayotte	MYT	YT	262	Mamoudzou	EUR	Mayotte	🇾🇹	U+1F1FE U+1F1F9	2024-09-17 21:00:05	2024-09-17 21:00:05
143	Mexico	MEX	MX	52	Mexico City	MXN	México	🇲🇽	U+1F1F2 U+1F1FD	2024-09-17 21:00:05	2024-09-17 21:00:05
144	Micronesia	FSM	FM	691	Palikir	USD	Micronesia	🇫🇲	U+1F1EB U+1F1F2	2024-09-17 21:00:05	2024-09-17 21:00:05
145	Moldova	MDA	MD	373	Chisinau	MDL	Moldova	🇲🇩	U+1F1F2 U+1F1E9	2024-09-17 21:00:05	2024-09-17 21:00:05
146	Monaco	MCO	MC	377	Monaco	EUR	Monaco	🇲🇨	U+1F1F2 U+1F1E8	2024-09-17 21:00:05	2024-09-17 21:00:05
147	Mongolia	MNG	MN	976	Ulan Bator	MNT	Монгол улс	🇲🇳	U+1F1F2 U+1F1F3	2024-09-17 21:00:05	2024-09-17 21:00:05
148	Montenegro	MNE	ME	382	Podgorica	EUR	Црна Гора	🇲🇪	U+1F1F2 U+1F1EA	2024-09-17 21:00:05	2024-09-17 21:00:05
149	Montserrat	MSR	MS	+1-664	Plymouth	XCD	Montserrat	🇲🇸	U+1F1F2 U+1F1F8	2024-09-17 21:00:05	2024-09-17 21:00:05
150	Morocco	MAR	MA	212	Rabat	MAD	المغرب	🇲🇦	U+1F1F2 U+1F1E6	2024-09-17 21:00:05	2024-09-17 21:00:05
151	Mozambique	MOZ	MZ	258	Maputo	MZN	Moçambique	🇲🇿	U+1F1F2 U+1F1FF	2024-09-17 21:00:05	2024-09-17 21:00:05
152	Myanmar	MMR	MM	95	Nay Pyi Taw	MMK	မြန်မာ	🇲🇲	U+1F1F2 U+1F1F2	2024-09-17 21:00:05	2024-09-17 21:00:05
153	Namibia	NAM	NA	264	Windhoek	NAD	Namibia	🇳🇦	U+1F1F3 U+1F1E6	2024-09-17 21:00:05	2024-09-17 21:00:05
154	Nauru	NRU	NR	674	Yaren	AUD	Nauru	🇳🇷	U+1F1F3 U+1F1F7	2024-09-17 21:00:06	2024-09-17 21:00:06
155	Nepal	NPL	NP	977	Kathmandu	NPR	नपल	🇳🇵	U+1F1F3 U+1F1F5	2024-09-17 21:00:06	2024-09-17 21:00:06
156	Netherlands	NLD	NL	31	Amsterdam	EUR	Nederland	🇳🇱	U+1F1F3 U+1F1F1	2024-09-17 21:00:06	2024-09-17 21:00:06
157	New Caledonia	NCL	NC	687	Noumea	XPF	Nouvelle-Calédonie	🇳🇨	U+1F1F3 U+1F1E8	2024-09-17 21:00:06	2024-09-17 21:00:06
158	New Zealand	NZL	NZ	64	Wellington	NZD	New Zealand	🇳🇿	U+1F1F3 U+1F1FF	2024-09-17 21:00:06	2024-09-17 21:00:06
159	Nicaragua	NIC	NI	505	Managua	NIO	Nicaragua	🇳🇮	U+1F1F3 U+1F1EE	2024-09-17 21:00:06	2024-09-17 21:00:06
160	Niger	NER	NE	227	Niamey	XOF	Niger	🇳🇪	U+1F1F3 U+1F1EA	2024-09-17 21:00:06	2024-09-17 21:00:06
161	Nigeria	NGA	NG	234	Abuja	NGN	Nigeria	🇳🇬	U+1F1F3 U+1F1EC	2024-09-17 21:00:06	2024-09-17 21:00:06
162	Niue	NIU	NU	683	Alofi	NZD	Niuē	🇳🇺	U+1F1F3 U+1F1FA	2024-09-17 21:00:06	2024-09-17 21:00:06
163	Norfolk Island	NFK	NF	672	Kingston	AUD	Norfolk Island	🇳🇫	U+1F1F3 U+1F1EB	2024-09-17 21:00:06	2024-09-17 21:00:06
164	North Korea	PRK	KP	850	Pyongyang	KPW	북한	🇰🇵	U+1F1F0 U+1F1F5	2024-09-17 21:00:06	2024-09-17 21:00:06
165	Northern Mariana Islands	MNP	MP	+1-670	Saipan	USD	Northern Mariana Islands	🇲🇵	U+1F1F2 U+1F1F5	2024-09-17 21:00:06	2024-09-17 21:00:06
166	Norway	NOR	NO	47	Oslo	NOK	Norge	🇳🇴	U+1F1F3 U+1F1F4	2024-09-17 21:00:06	2024-09-17 21:00:06
167	Oman	OMN	OM	968	Muscat	OMR	عمان	🇴🇲	U+1F1F4 U+1F1F2	2024-09-17 21:00:06	2024-09-17 21:00:06
168	Pakistan	PAK	PK	92	Islamabad	PKR	Pakistan	🇵🇰	U+1F1F5 U+1F1F0	2024-09-17 21:00:06	2024-09-17 21:00:06
169	Palau	PLW	PW	680	Melekeok	USD	Palau	🇵🇼	U+1F1F5 U+1F1FC	2024-09-17 21:00:06	2024-09-17 21:00:06
170	Palestinian Territory Occupied	PSE	PS	970	East Jerusalem	ILS	فلسطين	🇵🇸	U+1F1F5 U+1F1F8	2024-09-17 21:00:06	2024-09-17 21:00:06
171	Panama	PAN	PA	507	Panama City	PAB	Panamá	🇵🇦	U+1F1F5 U+1F1E6	2024-09-17 21:00:06	2024-09-17 21:00:06
172	Papua new Guinea	PNG	PG	675	Port Moresby	PGK	Papua Niugini	🇵🇬	U+1F1F5 U+1F1EC	2024-09-17 21:00:06	2024-09-17 21:00:06
173	Paraguay	PRY	PY	595	Asuncion	PYG	Paraguay	🇵🇾	U+1F1F5 U+1F1FE	2024-09-17 21:00:06	2024-09-17 21:00:06
174	Peru	PER	PE	51	Lima	PEN	Perú	🇵🇪	U+1F1F5 U+1F1EA	2024-09-17 21:00:06	2024-09-17 21:00:06
175	Philippines	PHL	PH	63	Manila	PHP	Pilipinas	🇵🇭	U+1F1F5 U+1F1ED	2024-09-17 21:00:06	2024-09-17 21:00:06
176	Pitcairn Island	PCN	PN	870	Adamstown	NZD	Pitcairn Islands	🇵🇳	U+1F1F5 U+1F1F3	2024-09-17 21:00:06	2024-09-17 21:00:06
177	Poland	POL	PL	48	Warsaw	PLN	Polska	🇵🇱	U+1F1F5 U+1F1F1	2024-09-17 21:00:06	2024-09-17 21:00:06
178	Portugal	PRT	PT	351	Lisbon	EUR	Portugal	🇵🇹	U+1F1F5 U+1F1F9	2024-09-17 21:00:06	2024-09-17 21:00:06
179	Puerto Rico	PRI	PR	+1-787 and 1-939	San Juan	USD	Puerto Rico	🇵🇷	U+1F1F5 U+1F1F7	2024-09-17 21:00:06	2024-09-17 21:00:06
180	Qatar	QAT	QA	974	Doha	QAR	قطر	🇶🇦	U+1F1F6 U+1F1E6	2024-09-17 21:00:06	2024-09-17 21:00:06
181	Reunion	REU	RE	262	Saint-Denis	EUR	La Réunion	🇷🇪	U+1F1F7 U+1F1EA	2024-09-17 21:00:06	2024-09-17 21:00:06
182	Romania	ROU	RO	40	Bucharest	RON	România	🇷🇴	U+1F1F7 U+1F1F4	2024-09-17 21:00:06	2024-09-17 21:00:06
183	Russia	RUS	RU	7	Moscow	RUB	Россия	🇷🇺	U+1F1F7 U+1F1FA	2024-09-17 21:00:06	2024-09-17 21:00:06
184	Rwanda	RWA	RW	250	Kigali	RWF	Rwanda	🇷🇼	U+1F1F7 U+1F1FC	2024-09-17 21:00:06	2024-09-17 21:00:06
185	Saint Helena	SHN	SH	290	Jamestown	SHP	Saint Helena	🇸🇭	U+1F1F8 U+1F1ED	2024-09-17 21:00:06	2024-09-17 21:00:06
186	Saint Kitts And Nevis	KNA	KN	+1-869	Basseterre	XCD	Saint Kitts and Nevis	🇰🇳	U+1F1F0 U+1F1F3	2024-09-17 21:00:06	2024-09-17 21:00:06
187	Saint Lucia	LCA	LC	+1-758	Castries	XCD	Saint Lucia	🇱🇨	U+1F1F1 U+1F1E8	2024-09-17 21:00:06	2024-09-17 21:00:06
188	Saint Pierre and Miquelon	SPM	PM	508	Saint-Pierre	EUR	Saint-Pierre-et-Miquelon	🇵🇲	U+1F1F5 U+1F1F2	2024-09-17 21:00:06	2024-09-17 21:00:06
189	Saint Vincent And The Grenadines	VCT	VC	+1-784	Kingstown	XCD	Saint Vincent and the Grenadines	🇻🇨	U+1F1FB U+1F1E8	2024-09-17 21:00:06	2024-09-17 21:00:06
190	Saint-Barthelemy	BLM	BL	590	Gustavia	EUR	Saint-Barthélemy	🇧🇱	U+1F1E7 U+1F1F1	2024-09-17 21:00:06	2024-09-17 21:00:06
191	Saint-Martin (French part)	MAF	MF	590	Marigot	EUR	Saint-Martin	🇲🇫	U+1F1F2 U+1F1EB	2024-09-17 21:00:06	2024-09-17 21:00:06
192	Samoa	WSM	WS	685	Apia	WST	Samoa	🇼🇸	U+1F1FC U+1F1F8	2024-09-17 21:00:06	2024-09-17 21:00:06
193	San Marino	SMR	SM	378	San Marino	EUR	San Marino	🇸🇲	U+1F1F8 U+1F1F2	2024-09-17 21:00:06	2024-09-17 21:00:06
194	Sao Tome and Principe	STP	ST	239	Sao Tome	STD	São Tomé e Príncipe	🇸🇹	U+1F1F8 U+1F1F9	2024-09-17 21:00:06	2024-09-17 21:00:06
195	Saudi Arabia	SAU	SA	966	Riyadh	SAR	المملكة العربية السعودية	🇸🇦	U+1F1F8 U+1F1E6	2024-09-17 21:00:06	2024-09-17 21:00:06
196	Senegal	SEN	SN	221	Dakar	XOF	Sénégal	🇸🇳	U+1F1F8 U+1F1F3	2024-09-17 21:00:06	2024-09-17 21:00:06
197	Serbia	SRB	RS	381	Belgrade	RSD	Србија	🇷🇸	U+1F1F7 U+1F1F8	2024-09-17 21:00:06	2024-09-17 21:00:06
198	Seychelles	SYC	SC	248	Victoria	SCR	Seychelles	🇸🇨	U+1F1F8 U+1F1E8	2024-09-17 21:00:06	2024-09-17 21:00:06
199	Sierra Leone	SLE	SL	232	Freetown	SLL	Sierra Leone	🇸🇱	U+1F1F8 U+1F1F1	2024-09-17 21:00:07	2024-09-17 21:00:07
200	Singapore	SGP	SG	65	Singapur	SGD	Singapore	🇸🇬	U+1F1F8 U+1F1EC	2024-09-17 21:00:07	2024-09-17 21:00:07
201	Sint Maarten (Dutch part)	SXM	SX	1721	Philipsburg	ANG	Sint Maarten	🇸🇽	U+1F1F8 U+1F1FD	2024-09-17 21:00:07	2024-09-17 21:00:07
202	Slovakia	SVK	SK	421	Bratislava	EUR	Slovensko	🇸🇰	U+1F1F8 U+1F1F0	2024-09-17 21:00:07	2024-09-17 21:00:07
203	Slovenia	SVN	SI	386	Ljubljana	EUR	Slovenija	🇸🇮	U+1F1F8 U+1F1EE	2024-09-17 21:00:07	2024-09-17 21:00:07
204	Solomon Islands	SLB	SB	677	Honiara	SBD	Solomon Islands	🇸🇧	U+1F1F8 U+1F1E7	2024-09-17 21:00:07	2024-09-17 21:00:07
205	Somalia	SOM	SO	252	Mogadishu	SOS	Soomaaliya	🇸🇴	U+1F1F8 U+1F1F4	2024-09-17 21:00:07	2024-09-17 21:00:07
206	South Africa	ZAF	ZA	27	Pretoria	ZAR	South Africa	🇿🇦	U+1F1FF U+1F1E6	2024-09-17 21:00:07	2024-09-17 21:00:07
207	South Georgia	SGS	GS	500	Grytviken	GBP	South Georgia	🇬🇸	U+1F1EC U+1F1F8	2024-09-17 21:00:07	2024-09-17 21:00:07
208	South Korea	KOR	KR	82	Seoul	KRW	대한민국	🇰🇷	U+1F1F0 U+1F1F7	2024-09-17 21:00:07	2024-09-17 21:00:07
209	South Sudan	SSD	SS	211	Juba	SSP	South Sudan	🇸🇸	U+1F1F8 U+1F1F8	2024-09-17 21:00:07	2024-09-17 21:00:07
210	Spain	ESP	ES	34	Madrid	EUR	España	🇪🇸	U+1F1EA U+1F1F8	2024-09-17 21:00:07	2024-09-17 21:00:07
211	Sri Lanka	LKA	LK	94	Colombo	LKR	śrī laṃkāva	🇱🇰	U+1F1F1 U+1F1F0	2024-09-17 21:00:07	2024-09-17 21:00:07
212	Sudan	SDN	SD	249	Khartoum	SDG	السودان	🇸🇩	U+1F1F8 U+1F1E9	2024-09-17 21:00:07	2024-09-17 21:00:07
213	Suriname	SUR	SR	597	Paramaribo	SRD	Suriname	🇸🇷	U+1F1F8 U+1F1F7	2024-09-17 21:00:07	2024-09-17 21:00:07
214	Svalbard And Jan Mayen Islands	SJM	SJ	47	Longyearbyen	NOK	Svalbard og Jan Mayen	🇸🇯	U+1F1F8 U+1F1EF	2024-09-17 21:00:07	2024-09-17 21:00:07
215	Swaziland	SWZ	SZ	268	Mbabane	SZL	Swaziland	🇸🇿	U+1F1F8 U+1F1FF	2024-09-17 21:00:07	2024-09-17 21:00:07
216	Sweden	SWE	SE	46	Stockholm	SEK	Sverige	🇸🇪	U+1F1F8 U+1F1EA	2024-09-17 21:00:07	2024-09-17 21:00:07
217	Switzerland	CHE	CH	41	Bern	CHF	Schweiz	🇨🇭	U+1F1E8 U+1F1ED	2024-09-17 21:00:07	2024-09-17 21:00:07
218	Syria	SYR	SY	963	Damascus	SYP	سوريا	🇸🇾	U+1F1F8 U+1F1FE	2024-09-17 21:00:07	2024-09-17 21:00:07
219	Taiwan	TWN	TW	886	Taipei	TWD	臺灣	🇹🇼	U+1F1F9 U+1F1FC	2024-09-17 21:00:07	2024-09-17 21:00:07
220	Tajikistan	TJK	TJ	992	Dushanbe	TJS	Тоҷикистон	🇹🇯	U+1F1F9 U+1F1EF	2024-09-17 21:00:07	2024-09-17 21:00:07
221	Tanzania	TZA	TZ	255	Dodoma	TZS	Tanzania	🇹🇿	U+1F1F9 U+1F1FF	2024-09-17 21:00:07	2024-09-17 21:00:07
222	Thailand	THA	TH	66	Bangkok	THB	ประเทศไทย	🇹🇭	U+1F1F9 U+1F1ED	2024-09-17 21:00:07	2024-09-17 21:00:07
223	Togo	TGO	TG	228	Lome	XOF	Togo	🇹🇬	U+1F1F9 U+1F1EC	2024-09-17 21:00:07	2024-09-17 21:00:07
224	Tokelau	TKL	TK	690		NZD	Tokelau	🇹🇰	U+1F1F9 U+1F1F0	2024-09-17 21:00:07	2024-09-17 21:00:07
225	Tonga	TON	TO	676	Nuku'alofa	TOP	Tonga	🇹🇴	U+1F1F9 U+1F1F4	2024-09-17 21:00:07	2024-09-17 21:00:07
226	Trinidad And Tobago	TTO	TT	+1-868	Port of Spain	TTD	Trinidad and Tobago	🇹🇹	U+1F1F9 U+1F1F9	2024-09-17 21:00:07	2024-09-17 21:00:07
227	Tunisia	TUN	TN	216	Tunis	TND	تونس	🇹🇳	U+1F1F9 U+1F1F3	2024-09-17 21:00:07	2024-09-17 21:00:07
228	Turkey	TUR	TR	90	Ankara	TRY	Türkiye	🇹🇷	U+1F1F9 U+1F1F7	2024-09-17 21:00:07	2024-09-17 21:00:07
229	Turkmenistan	TKM	TM	993	Ashgabat	TMT	Türkmenistan	🇹🇲	U+1F1F9 U+1F1F2	2024-09-17 21:00:08	2024-09-17 21:00:08
230	Turks And Caicos Islands	TCA	TC	+1-649	Cockburn Town	USD	Turks and Caicos Islands	🇹🇨	U+1F1F9 U+1F1E8	2024-09-17 21:00:08	2024-09-17 21:00:08
231	Tuvalu	TUV	TV	688	Funafuti	AUD	Tuvalu	🇹🇻	U+1F1F9 U+1F1FB	2024-09-17 21:00:08	2024-09-17 21:00:08
232	Uganda	UGA	UG	256	Kampala	UGX	Uganda	🇺🇬	U+1F1FA U+1F1EC	2024-09-17 21:00:08	2024-09-17 21:00:08
233	Ukraine	UKR	UA	380	Kiev	UAH	Україна	🇺🇦	U+1F1FA U+1F1E6	2024-09-17 21:00:08	2024-09-17 21:00:08
234	United Arab Emirates	ARE	AE	971	Abu Dhabi	AED	دولة الإمارات العربية المتحدة	🇦🇪	U+1F1E6 U+1F1EA	2024-09-17 21:00:08	2024-09-17 21:00:08
235	United Kingdom	GBR	GB	44	London	GBP	United Kingdom	🇬🇧	U+1F1EC U+1F1E7	2024-09-17 21:00:08	2024-09-17 21:00:08
236	United States	USA	US	1	Washington	USD	United States	🇺🇸	U+1F1FA U+1F1F8	2024-09-17 21:00:08	2024-09-17 21:00:08
237	United States Minor Outlying Islands	UMI	UM	1		USD	United States Minor Outlying Islands	🇺🇲	U+1F1FA U+1F1F2	2024-09-17 21:00:08	2024-09-17 21:00:08
238	Uruguay	URY	UY	598	Montevideo	UYU	Uruguay	🇺🇾	U+1F1FA U+1F1FE	2024-09-17 21:00:08	2024-09-17 21:00:08
239	Uzbekistan	UZB	UZ	998	Tashkent	UZS	O‘zbekiston	🇺🇿	U+1F1FA U+1F1FF	2024-09-17 21:00:08	2024-09-17 21:00:08
240	Vanuatu	VUT	VU	678	Port Vila	VUV	Vanuatu	🇻🇺	U+1F1FB U+1F1FA	2024-09-17 21:00:08	2024-09-17 21:00:08
241	Vatican City State (Holy See)	VAT	VA	379	Vatican City	EUR	Vaticano	🇻🇦	U+1F1FB U+1F1E6	2024-09-17 21:00:08	2024-09-17 21:00:08
242	Venezuela	VEN	VE	58	Caracas	VEF	Venezuela	🇻🇪	U+1F1FB U+1F1EA	2024-09-17 21:00:08	2024-09-17 21:00:08
243	Vietnam	VNM	VN	84	Hanoi	VND	Việt Nam	🇻🇳	U+1F1FB U+1F1F3	2024-09-17 21:00:08	2024-09-17 21:00:08
244	Virgin Islands (British)	VGB	VG	+1-284	Road Town	USD	British Virgin Islands	🇻🇬	U+1F1FB U+1F1EC	2024-09-17 21:00:08	2024-09-17 21:00:08
245	Virgin Islands (US)	VIR	VI	+1-340	Charlotte Amalie	USD	United States Virgin Islands	🇻🇮	U+1F1FB U+1F1EE	2024-09-17 21:00:08	2024-09-17 21:00:08
246	Wallis And Futuna Islands	WLF	WF	681	Mata Utu	XPF	Wallis et Futuna	🇼🇫	U+1F1FC U+1F1EB	2024-09-17 21:00:08	2024-09-17 21:00:08
247	Western Sahara	ESH	EH	212	El-Aaiun	MAD	الصحراء الغربية	🇪🇭	U+1F1EA U+1F1ED	2024-09-17 21:00:08	2024-09-17 21:00:08
248	Yemen	YEM	YE	967	Sanaa	YER	اليَمَن	🇾🇪	U+1F1FE U+1F1EA	2024-09-17 21:00:08	2024-09-17 21:00:08
249	Zambia	ZMB	ZM	260	Lusaka	ZMW	Zambia	🇿🇲	U+1F1FF U+1F1F2	2024-09-17 21:00:08	2024-09-17 21:00:08
250	Zimbabwe	ZWE	ZW	263	Harare	ZWL	Zimbabwe	🇿🇼	U+1F1FF U+1F1FC	2024-09-17 21:00:08	2024-09-17 21:00:08
\.


--
-- Data for Name: metalhub_country_shipping_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_country_shipping_zone (id, country_id, shipping_zone_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_currencies (id, code, name, exchange_rate, decimal_places, enabled, "default", created_at, updated_at) FROM stdin;
1	NRS	Nepali Rupees	1.0000	2	t	t	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_customer_customer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_customer_group (id, customer_id, customer_group_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_customer_group_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_group_discount (id, discount_id, customer_group_id, enabled, starts_at, ends_at, visible, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_customer_group_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_group_product (id, customer_group_id, product_id, enabled, starts_at, ends_at, visible, purchasable, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_customer_group_shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_group_shipping_method (id, customer_group_id, shipping_method_id, enabled, starts_at, ends_at, visible, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_groups (id, name, handle, "default", created_at, updated_at, attribute_data) FROM stdin;
1	Retail	retail	t	2024-09-17 21:00:09	2024-09-17 21:00:09	\N
\.


--
-- Data for Name: metalhub_customer_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customer_user (id, customer_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_customers (id, title, first_name, last_name, company_name, vat_no, meta, created_at, updated_at, attribute_data, account_ref) FROM stdin;
\.


--
-- Data for Name: metalhub_discount_purchasables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_discount_purchasables (id, discount_id, purchasable_type, purchasable_id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_discount_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_discount_user (id, discount_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_discounts (id, name, handle, coupon, type, starts_at, ends_at, uses, max_uses, priority, stop, restriction, data, created_at, updated_at, max_uses_per_user) FROM stdin;
\.


--
-- Data for Name: metalhub_exclusion_list_shipping_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_exclusion_list_shipping_zone (id, exclusion_id, shipping_zone_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_languages (id, code, name, "default", created_at, updated_at) FROM stdin;
1	en	English	t	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_media_product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_media_product_variant (id, media_id, product_variant_id, "primary", created_at, updated_at, "position") FROM stdin;
\.


--
-- Data for Name: metalhub_order_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_order_addresses (id, order_id, country_id, title, first_name, last_name, company_name, line_one, line_two, line_three, city, state, postcode, delivery_instructions, contact_email, contact_phone, type, shipping_option, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_order_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_order_lines (id, order_id, purchasable_type, purchasable_id, type, description, option, identifier, unit_price, unit_quantity, quantity, sub_total, discount_total, tax_breakdown, tax_total, total, notes, meta, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_order_shipping_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_order_shipping_zone (id, order_id, shipping_zone_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_orders (id, user_id, channel_id, status, reference, customer_reference, sub_total, discount_total, shipping_total, tax_breakdown, tax_total, total, notes, currency_code, compare_currency_code, exchange_rate, placed_at, meta, created_at, updated_at, customer_id, new_customer, discount_breakdown, shipping_breakdown, cart_id, fingerprint) FROM stdin;
\.


--
-- Data for Name: metalhub_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_prices (id, customer_group_id, currency_id, priceable_type, priceable_id, price, compare_price, min_quantity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_product_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_associations (id, product_parent_id, product_target_id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_product_option_value_product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_option_value_product_variant (id, value_id, variant_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_product_option_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_option_values (id, product_option_id, name, created_at, updated_at, "position") FROM stdin;
\.


--
-- Data for Name: metalhub_product_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_options (id, name, created_at, updated_at, handle, label, shared) FROM stdin;
\.


--
-- Data for Name: metalhub_product_product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_product_option (id, product_id, product_option_id, "position") FROM stdin;
\.


--
-- Data for Name: metalhub_product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_types (id, name, created_at, updated_at) FROM stdin;
1	Stock	2024-09-17 21:00:09	2024-09-17 21:00:09
\.


--
-- Data for Name: metalhub_product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_product_variants (id, product_id, tax_class_id, tax_ref, unit_quantity, sku, gtin, mpn, ean, length_value, length_unit, width_value, width_unit, height_value, height_unit, weight_value, weight_unit, volume_value, volume_unit, shippable, stock, backorder, purchasable, created_at, updated_at, deleted_at, attribute_data, quantity_increment, min_quantity) FROM stdin;
\.


--
-- Data for Name: metalhub_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_products (id, product_type_id, status, attribute_data, created_at, updated_at, deleted_at, brand_id) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_exclusion_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_exclusion_lists (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_exclusions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_exclusions (id, shipping_exclusion_list_id, purchasable_type, purchasable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_methods (id, name, description, code, enabled, stock_available, cutoff, data, driver, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_rates (id, shipping_method_id, shipping_zone_id, enabled, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_zone_postcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_zone_postcodes (id, shipping_zone_id, postcode, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_shipping_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_shipping_zones (id, name, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_staff (id, admin, firstname, lastname, email, email_verified_at, password, remember_token, created_at, updated_at, deleted_at) FROM stdin;
1	t	Sulav	Bajracharya	metalhub@gmail.com	\N	$2y$12$HzwZCHbQHMymXIO8THu9O.RgKnuB8Ttn6aRlNFPqf2.FDnObw13qC	\N	2024-09-17 20:59:57	2024-09-17 20:59:57	\N
\.


--
-- Data for Name: metalhub_state_shipping_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_state_shipping_zone (id, state_id, shipping_zone_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_states (id, country_id, name, code, created_at, updated_at) FROM stdin;
1	1	Badakhshan	BDS	2024-09-17 20:59:58	2024-09-17 20:59:58
2	1	Badghis	BDG	2024-09-17 20:59:58	2024-09-17 20:59:58
3	1	Baghlan	BGL	2024-09-17 20:59:58	2024-09-17 20:59:58
4	1	Balkh	BAL	2024-09-17 20:59:58	2024-09-17 20:59:58
5	1	Bamyan	BAM	2024-09-17 20:59:58	2024-09-17 20:59:58
6	1	Daykundi	DAY	2024-09-17 20:59:58	2024-09-17 20:59:58
7	1	Farah	FRA	2024-09-17 20:59:59	2024-09-17 20:59:59
8	1	Faryab	FYB	2024-09-17 20:59:59	2024-09-17 20:59:59
9	1	Ghazni	GHA	2024-09-17 20:59:59	2024-09-17 20:59:59
10	1	Ghōr	GHO	2024-09-17 20:59:59	2024-09-17 20:59:59
11	1	Helmand	HEL	2024-09-17 20:59:59	2024-09-17 20:59:59
12	1	Herat	HER	2024-09-17 20:59:59	2024-09-17 20:59:59
13	1	Jowzjan	JOW	2024-09-17 20:59:59	2024-09-17 20:59:59
14	1	Kabul	KAB	2024-09-17 20:59:59	2024-09-17 20:59:59
15	1	Kandahar	KAN	2024-09-17 20:59:59	2024-09-17 20:59:59
16	1	Kapisa	KAP	2024-09-17 20:59:59	2024-09-17 20:59:59
17	1	Khost	KHO	2024-09-17 20:59:59	2024-09-17 20:59:59
18	1	Kunar	KNR	2024-09-17 20:59:59	2024-09-17 20:59:59
19	1	Kunduz Province	KDZ	2024-09-17 20:59:59	2024-09-17 20:59:59
20	1	Laghman	LAG	2024-09-17 20:59:59	2024-09-17 20:59:59
21	1	Logar	LOG	2024-09-17 20:59:59	2024-09-17 20:59:59
22	1	Nangarhar	NAN	2024-09-17 20:59:59	2024-09-17 20:59:59
23	1	Nimruz	NIM	2024-09-17 20:59:59	2024-09-17 20:59:59
24	1	Nuristan	NUR	2024-09-17 20:59:59	2024-09-17 20:59:59
25	1	Paktia	PIA	2024-09-17 20:59:59	2024-09-17 20:59:59
26	1	Paktika	PKA	2024-09-17 20:59:59	2024-09-17 20:59:59
27	1	Panjshir	PAN	2024-09-17 20:59:59	2024-09-17 20:59:59
28	1	Parwan	PAR	2024-09-17 20:59:59	2024-09-17 20:59:59
29	1	Samangan	SAM	2024-09-17 20:59:59	2024-09-17 20:59:59
30	1	Sar-e Pol	SAR	2024-09-17 20:59:59	2024-09-17 20:59:59
31	1	Takhar	TAK	2024-09-17 20:59:59	2024-09-17 20:59:59
32	1	Urozgan	URU	2024-09-17 20:59:59	2024-09-17 20:59:59
33	1	Zabul	ZAB	2024-09-17 20:59:59	2024-09-17 20:59:59
34	3	Berat County	01	2024-09-17 20:59:59	2024-09-17 20:59:59
35	3	Berat District	BR	2024-09-17 20:59:59	2024-09-17 20:59:59
36	3	Bulqizë District	BU	2024-09-17 20:59:59	2024-09-17 20:59:59
37	3	Delvinë District	DL	2024-09-17 20:59:59	2024-09-17 20:59:59
38	3	Devoll District	DV	2024-09-17 20:59:59	2024-09-17 20:59:59
39	3	Dibër County	09	2024-09-17 20:59:59	2024-09-17 20:59:59
40	3	Dibër District	DI	2024-09-17 20:59:59	2024-09-17 20:59:59
41	3	Durrës County	02	2024-09-17 20:59:59	2024-09-17 20:59:59
42	3	Durrës District	DR	2024-09-17 20:59:59	2024-09-17 20:59:59
43	3	Elbasan County	03	2024-09-17 20:59:59	2024-09-17 20:59:59
44	3	Fier County	04	2024-09-17 20:59:59	2024-09-17 20:59:59
45	3	Fier District	FR	2024-09-17 20:59:59	2024-09-17 20:59:59
46	3	Gjirokastër County	05	2024-09-17 20:59:59	2024-09-17 20:59:59
47	3	Gjirokastër District	GJ	2024-09-17 20:59:59	2024-09-17 20:59:59
48	3	Gramsh District	GR	2024-09-17 20:59:59	2024-09-17 20:59:59
49	3	Has District	HA	2024-09-17 20:59:59	2024-09-17 20:59:59
50	3	Kavajë District	KA	2024-09-17 20:59:59	2024-09-17 20:59:59
51	3	Kolonjë District	ER	2024-09-17 20:59:59	2024-09-17 20:59:59
52	3	Korçë County	06	2024-09-17 20:59:59	2024-09-17 20:59:59
53	3	Korçë District	KO	2024-09-17 20:59:59	2024-09-17 20:59:59
54	3	Krujë District	KR	2024-09-17 20:59:59	2024-09-17 20:59:59
55	3	Kuçovë District	KC	2024-09-17 20:59:59	2024-09-17 20:59:59
56	3	Kukës County	07	2024-09-17 20:59:59	2024-09-17 20:59:59
57	3	Kukës District	KU	2024-09-17 20:59:59	2024-09-17 20:59:59
58	3	Kurbin District	KB	2024-09-17 20:59:59	2024-09-17 20:59:59
59	3	Lezhë County	08	2024-09-17 20:59:59	2024-09-17 20:59:59
60	3	Lezhë District	LE	2024-09-17 20:59:59	2024-09-17 20:59:59
61	3	Librazhd District	LB	2024-09-17 20:59:59	2024-09-17 20:59:59
62	3	Lushnjë District	LU	2024-09-17 20:59:59	2024-09-17 20:59:59
63	3	Malësi e Madhe District	MM	2024-09-17 20:59:59	2024-09-17 20:59:59
64	3	Mallakastër District	MK	2024-09-17 20:59:59	2024-09-17 20:59:59
65	3	Mat District	MT	2024-09-17 20:59:59	2024-09-17 20:59:59
66	3	Mirditë District	MR	2024-09-17 20:59:59	2024-09-17 20:59:59
67	3	Peqin District	PQ	2024-09-17 20:59:59	2024-09-17 20:59:59
68	3	Përmet District	PR	2024-09-17 20:59:59	2024-09-17 20:59:59
69	3	Pogradec District	PG	2024-09-17 20:59:59	2024-09-17 20:59:59
70	3	Pukë District	PU	2024-09-17 20:59:59	2024-09-17 20:59:59
71	3	Sarandë District	SR	2024-09-17 20:59:59	2024-09-17 20:59:59
72	3	Shkodër County	10	2024-09-17 20:59:59	2024-09-17 20:59:59
73	3	Shkodër District	SH	2024-09-17 20:59:59	2024-09-17 20:59:59
74	3	Skrapar District	SK	2024-09-17 20:59:59	2024-09-17 20:59:59
75	3	Tepelenë District	TE	2024-09-17 20:59:59	2024-09-17 20:59:59
76	3	Tirana County	11	2024-09-17 20:59:59	2024-09-17 20:59:59
77	3	Tirana District	TR	2024-09-17 20:59:59	2024-09-17 20:59:59
78	3	Tropojë District	TP	2024-09-17 20:59:59	2024-09-17 20:59:59
79	3	Vlorë County	12	2024-09-17 20:59:59	2024-09-17 20:59:59
80	3	Vlorë District	VL	2024-09-17 20:59:59	2024-09-17 20:59:59
81	4	Adrar	01	2024-09-17 20:59:59	2024-09-17 20:59:59
82	4	Aïn Defla	44	2024-09-17 20:59:59	2024-09-17 20:59:59
83	4	Aïn Témouchent	46	2024-09-17 20:59:59	2024-09-17 20:59:59
84	4	Algiers	16	2024-09-17 20:59:59	2024-09-17 20:59:59
85	4	Annaba	23	2024-09-17 20:59:59	2024-09-17 20:59:59
86	4	Batna	05	2024-09-17 20:59:59	2024-09-17 20:59:59
87	4	Béchar	08	2024-09-17 20:59:59	2024-09-17 20:59:59
88	4	Béjaïa	06	2024-09-17 20:59:59	2024-09-17 20:59:59
89	4	Béni Abbès	53	2024-09-17 20:59:59	2024-09-17 20:59:59
90	4	Biskra	07	2024-09-17 20:59:59	2024-09-17 20:59:59
91	4	Blida	09	2024-09-17 20:59:59	2024-09-17 20:59:59
92	4	Bordj Baji Mokhtar	52	2024-09-17 20:59:59	2024-09-17 20:59:59
93	4	Bordj Bou Arréridj	34	2024-09-17 20:59:59	2024-09-17 20:59:59
94	4	Bouïra	10	2024-09-17 20:59:59	2024-09-17 20:59:59
95	4	Boumerdès	35	2024-09-17 20:59:59	2024-09-17 20:59:59
96	4	Chlef	02	2024-09-17 20:59:59	2024-09-17 20:59:59
97	4	Constantine	25	2024-09-17 20:59:59	2024-09-17 20:59:59
98	4	Djanet	56	2024-09-17 20:59:59	2024-09-17 20:59:59
99	4	Djelfa	17	2024-09-17 20:59:59	2024-09-17 20:59:59
100	4	El Bayadh	32	2024-09-17 20:59:59	2024-09-17 20:59:59
101	4	El M'ghair	49	2024-09-17 20:59:59	2024-09-17 20:59:59
102	4	El Menia	50	2024-09-17 20:59:59	2024-09-17 20:59:59
103	4	El Oued	39	2024-09-17 20:59:59	2024-09-17 20:59:59
104	4	El Tarf	36	2024-09-17 20:59:59	2024-09-17 20:59:59
105	4	Ghardaïa	47	2024-09-17 20:59:59	2024-09-17 20:59:59
106	4	Guelma	24	2024-09-17 20:59:59	2024-09-17 20:59:59
107	4	Illizi	33	2024-09-17 20:59:59	2024-09-17 20:59:59
108	4	In Guezzam	58	2024-09-17 20:59:59	2024-09-17 20:59:59
109	4	In Salah	57	2024-09-17 20:59:59	2024-09-17 20:59:59
110	4	Jijel	18	2024-09-17 20:59:59	2024-09-17 20:59:59
111	4	Khenchela	40	2024-09-17 20:59:59	2024-09-17 20:59:59
112	4	Laghouat	03	2024-09-17 20:59:59	2024-09-17 20:59:59
113	4	M'Sila	28	2024-09-17 20:59:59	2024-09-17 20:59:59
114	4	Mascara	29	2024-09-17 20:59:59	2024-09-17 20:59:59
115	4	Médéa	26	2024-09-17 20:59:59	2024-09-17 20:59:59
116	4	Mila	43	2024-09-17 20:59:59	2024-09-17 20:59:59
117	4	Mostaganem	27	2024-09-17 20:59:59	2024-09-17 20:59:59
118	4	Naama	45	2024-09-17 20:59:59	2024-09-17 20:59:59
119	4	Oran	31	2024-09-17 20:59:59	2024-09-17 20:59:59
120	4	Ouargla	30	2024-09-17 20:59:59	2024-09-17 20:59:59
121	4	Ouled Djellal	51	2024-09-17 20:59:59	2024-09-17 20:59:59
122	4	Oum El Bouaghi	04	2024-09-17 20:59:59	2024-09-17 20:59:59
123	4	Relizane	48	2024-09-17 20:59:59	2024-09-17 20:59:59
124	4	Saïda	20	2024-09-17 20:59:59	2024-09-17 20:59:59
125	4	Sétif	19	2024-09-17 20:59:59	2024-09-17 20:59:59
126	4	Sidi Bel Abbès	22	2024-09-17 20:59:59	2024-09-17 20:59:59
127	4	Skikda	21	2024-09-17 20:59:59	2024-09-17 20:59:59
128	4	Souk Ahras	41	2024-09-17 20:59:59	2024-09-17 20:59:59
129	4	Tamanghasset	11	2024-09-17 20:59:59	2024-09-17 20:59:59
130	4	Tébessa	12	2024-09-17 20:59:59	2024-09-17 20:59:59
131	4	Tiaret	14	2024-09-17 20:59:59	2024-09-17 20:59:59
132	4	Timimoun	54	2024-09-17 20:59:59	2024-09-17 20:59:59
133	4	Tindouf	37	2024-09-17 20:59:59	2024-09-17 20:59:59
134	4	Tipasa	42	2024-09-17 20:59:59	2024-09-17 20:59:59
135	4	Tissemsilt	38	2024-09-17 20:59:59	2024-09-17 20:59:59
136	4	Tizi Ouzou	15	2024-09-17 20:59:59	2024-09-17 20:59:59
137	4	Tlemcen	13	2024-09-17 20:59:59	2024-09-17 20:59:59
138	4	Touggourt	55	2024-09-17 20:59:59	2024-09-17 20:59:59
139	6	Andorra la Vella	07	2024-09-17 20:59:59	2024-09-17 20:59:59
140	6	Canillo	02	2024-09-17 20:59:59	2024-09-17 20:59:59
141	6	Encamp	03	2024-09-17 20:59:59	2024-09-17 20:59:59
142	6	Escaldes-Engordany	08	2024-09-17 20:59:59	2024-09-17 20:59:59
143	6	La Massana	04	2024-09-17 20:59:59	2024-09-17 20:59:59
144	6	Ordino	05	2024-09-17 20:59:59	2024-09-17 20:59:59
145	6	Sant Julià de Lòria	06	2024-09-17 20:59:59	2024-09-17 20:59:59
146	7	Bengo Province	BGO	2024-09-17 20:59:59	2024-09-17 20:59:59
147	7	Benguela Province	BGU	2024-09-17 20:59:59	2024-09-17 20:59:59
148	7	Bié Province	BIE	2024-09-17 20:59:59	2024-09-17 20:59:59
149	7	Cabinda Province	CAB	2024-09-17 20:59:59	2024-09-17 20:59:59
150	7	Cuando Cubango Province	CCU	2024-09-17 20:59:59	2024-09-17 20:59:59
151	7	Cuanza Norte Province	CNO	2024-09-17 20:59:59	2024-09-17 20:59:59
152	7	Cuanza Sul	CUS	2024-09-17 20:59:59	2024-09-17 20:59:59
153	7	Cunene Province	CNN	2024-09-17 20:59:59	2024-09-17 20:59:59
154	7	Huambo Province	HUA	2024-09-17 20:59:59	2024-09-17 20:59:59
155	7	Huíla Province	HUI	2024-09-17 20:59:59	2024-09-17 20:59:59
156	7	Luanda Province	LUA	2024-09-17 20:59:59	2024-09-17 20:59:59
157	7	Lunda Norte Province	LNO	2024-09-17 20:59:59	2024-09-17 20:59:59
158	7	Lunda Sul Province	LSU	2024-09-17 20:59:59	2024-09-17 20:59:59
159	7	Malanje Province	MAL	2024-09-17 20:59:59	2024-09-17 20:59:59
160	7	Moxico Province	MOX	2024-09-17 20:59:59	2024-09-17 20:59:59
161	7	Uíge Province	UIG	2024-09-17 20:59:59	2024-09-17 20:59:59
162	7	Zaire Province	ZAI	2024-09-17 20:59:59	2024-09-17 20:59:59
163	10	Barbuda	10	2024-09-17 20:59:59	2024-09-17 20:59:59
164	10	Redonda	11	2024-09-17 20:59:59	2024-09-17 20:59:59
165	10	Saint George Parish	03	2024-09-17 20:59:59	2024-09-17 20:59:59
166	10	Saint John Parish	04	2024-09-17 20:59:59	2024-09-17 20:59:59
167	10	Saint Mary Parish	05	2024-09-17 20:59:59	2024-09-17 20:59:59
168	10	Saint Paul Parish	06	2024-09-17 20:59:59	2024-09-17 20:59:59
169	10	Saint Peter Parish	07	2024-09-17 20:59:59	2024-09-17 20:59:59
170	10	Saint Philip Parish	08	2024-09-17 20:59:59	2024-09-17 20:59:59
171	11	Autonomous City Of Buenos Aires	C	2024-09-17 20:59:59	2024-09-17 20:59:59
172	11	Buenos Aires Province	B	2024-09-17 20:59:59	2024-09-17 20:59:59
173	11	Catamarca Province	K	2024-09-17 20:59:59	2024-09-17 20:59:59
174	11	Chaco Province	H	2024-09-17 20:59:59	2024-09-17 20:59:59
175	11	Chubut Province	U	2024-09-17 20:59:59	2024-09-17 20:59:59
176	11	Córdoba Province	X	2024-09-17 20:59:59	2024-09-17 20:59:59
177	11	Corrientes	W	2024-09-17 20:59:59	2024-09-17 20:59:59
178	11	Entre Ríos Province	E	2024-09-17 20:59:59	2024-09-17 20:59:59
179	11	Formosa Province	P	2024-09-17 20:59:59	2024-09-17 20:59:59
180	11	Jujuy Province	Y	2024-09-17 20:59:59	2024-09-17 20:59:59
181	11	La Pampa	L	2024-09-17 20:59:59	2024-09-17 20:59:59
182	11	La Rioja Province	F	2024-09-17 20:59:59	2024-09-17 20:59:59
183	11	Mendoza	M	2024-09-17 20:59:59	2024-09-17 20:59:59
184	11	Misiones Province	N	2024-09-17 20:59:59	2024-09-17 20:59:59
185	11	Neuquén Province	Q	2024-09-17 20:59:59	2024-09-17 20:59:59
186	11	Río Negro Province	R	2024-09-17 20:59:59	2024-09-17 20:59:59
187	11	Salta Province	A	2024-09-17 20:59:59	2024-09-17 20:59:59
188	11	San Juan Province	J	2024-09-17 20:59:59	2024-09-17 20:59:59
189	11	San Luis Province	D	2024-09-17 20:59:59	2024-09-17 20:59:59
190	11	Santa Cruz Province	Z	2024-09-17 20:59:59	2024-09-17 20:59:59
191	11	Santa Fe Province	S	2024-09-17 20:59:59	2024-09-17 20:59:59
192	11	Santiago del Estero Province	G	2024-09-17 20:59:59	2024-09-17 20:59:59
193	11	Tierra del Fuego Province	V	2024-09-17 20:59:59	2024-09-17 20:59:59
194	11	Tucumán Province	T	2024-09-17 20:59:59	2024-09-17 20:59:59
195	12	Aragatsotn Region	AG	2024-09-17 20:59:59	2024-09-17 20:59:59
196	12	Ararat Province	AR	2024-09-17 20:59:59	2024-09-17 20:59:59
197	12	Armavir Region	AV	2024-09-17 20:59:59	2024-09-17 20:59:59
198	12	Gegharkunik Province	GR	2024-09-17 20:59:59	2024-09-17 20:59:59
199	12	Kotayk Region	KT	2024-09-17 20:59:59	2024-09-17 20:59:59
200	12	Lori Region	LO	2024-09-17 20:59:59	2024-09-17 20:59:59
201	12	Shirak Region	SH	2024-09-17 20:59:59	2024-09-17 20:59:59
202	12	Syunik Province	SU	2024-09-17 20:59:59	2024-09-17 20:59:59
203	12	Tavush Region	TV	2024-09-17 20:59:59	2024-09-17 20:59:59
204	12	Vayots Dzor Region	VD	2024-09-17 20:59:59	2024-09-17 20:59:59
205	12	Yerevan	ER	2024-09-17 20:59:59	2024-09-17 20:59:59
206	14	Australian Capital Territory	ACT	2024-09-17 20:59:59	2024-09-17 20:59:59
207	14	New South Wales	NSW	2024-09-17 20:59:59	2024-09-17 20:59:59
208	14	Northern Territory	NT	2024-09-17 20:59:59	2024-09-17 20:59:59
209	14	Queensland	QLD	2024-09-17 20:59:59	2024-09-17 20:59:59
210	14	South Australia	SA	2024-09-17 20:59:59	2024-09-17 20:59:59
211	14	Tasmania	TAS	2024-09-17 20:59:59	2024-09-17 20:59:59
212	14	Victoria	VIC	2024-09-17 20:59:59	2024-09-17 20:59:59
213	14	Western Australia	WA	2024-09-17 20:59:59	2024-09-17 20:59:59
214	15	Burgenland	1	2024-09-17 20:59:59	2024-09-17 20:59:59
215	15	Carinthia	2	2024-09-17 20:59:59	2024-09-17 20:59:59
216	15	Lower Austria	3	2024-09-17 20:59:59	2024-09-17 20:59:59
217	15	Salzburg	5	2024-09-17 20:59:59	2024-09-17 20:59:59
218	15	Styria	6	2024-09-17 20:59:59	2024-09-17 20:59:59
219	15	Tyrol	7	2024-09-17 20:59:59	2024-09-17 20:59:59
220	15	Upper Austria	4	2024-09-17 20:59:59	2024-09-17 20:59:59
221	15	Vienna	9	2024-09-17 20:59:59	2024-09-17 20:59:59
222	15	Vorarlberg	8	2024-09-17 20:59:59	2024-09-17 20:59:59
223	16	Absheron District	ABS	2024-09-17 20:59:59	2024-09-17 20:59:59
224	16	Agdam District	AGM	2024-09-17 20:59:59	2024-09-17 20:59:59
225	16	Agdash District	AGS	2024-09-17 20:59:59	2024-09-17 20:59:59
226	16	Aghjabadi District	AGC	2024-09-17 20:59:59	2024-09-17 20:59:59
227	16	Agstafa District	AGA	2024-09-17 20:59:59	2024-09-17 20:59:59
228	16	Agsu District	AGU	2024-09-17 20:59:59	2024-09-17 20:59:59
229	16	Astara District	AST	2024-09-17 20:59:59	2024-09-17 20:59:59
230	16	Babek District	BAB	2024-09-17 20:59:59	2024-09-17 20:59:59
231	16	Baku	BA	2024-09-17 20:59:59	2024-09-17 20:59:59
232	16	Balakan District	BAL	2024-09-17 20:59:59	2024-09-17 20:59:59
233	16	Barda District	BAR	2024-09-17 20:59:59	2024-09-17 20:59:59
234	16	Beylagan District	BEY	2024-09-17 20:59:59	2024-09-17 20:59:59
235	16	Bilasuvar District	BIL	2024-09-17 20:59:59	2024-09-17 20:59:59
236	16	Dashkasan District	DAS	2024-09-17 20:59:59	2024-09-17 20:59:59
237	16	Fizuli District	FUZ	2024-09-17 20:59:59	2024-09-17 20:59:59
238	16	Ganja	GA	2024-09-17 20:59:59	2024-09-17 20:59:59
239	16	Gədəbəy	GAD	2024-09-17 20:59:59	2024-09-17 20:59:59
240	16	Gobustan District	QOB	2024-09-17 20:59:59	2024-09-17 20:59:59
241	16	Goranboy District	GOR	2024-09-17 20:59:59	2024-09-17 20:59:59
242	16	Goychay	GOY	2024-09-17 20:59:59	2024-09-17 20:59:59
243	16	Goygol District	GYG	2024-09-17 20:59:59	2024-09-17 20:59:59
244	16	Hajigabul District	HAC	2024-09-17 20:59:59	2024-09-17 20:59:59
245	16	Imishli District	IMI	2024-09-17 20:59:59	2024-09-17 20:59:59
246	16	Ismailli District	ISM	2024-09-17 20:59:59	2024-09-17 20:59:59
247	16	Jabrayil District	CAB	2024-09-17 20:59:59	2024-09-17 20:59:59
248	16	Jalilabad District	CAL	2024-09-17 20:59:59	2024-09-17 20:59:59
249	16	Julfa District	CUL	2024-09-17 20:59:59	2024-09-17 20:59:59
250	16	Kalbajar District	KAL	2024-09-17 20:59:59	2024-09-17 20:59:59
251	16	Kangarli District	KAN	2024-09-17 20:59:59	2024-09-17 20:59:59
252	16	Khachmaz District	XAC	2024-09-17 20:59:59	2024-09-17 20:59:59
253	16	Khizi District	XIZ	2024-09-17 20:59:59	2024-09-17 20:59:59
254	16	Khojali District	XCI	2024-09-17 20:59:59	2024-09-17 20:59:59
255	16	Kurdamir District	KUR	2024-09-17 20:59:59	2024-09-17 20:59:59
256	16	Lachin District	LAC	2024-09-17 20:59:59	2024-09-17 20:59:59
257	16	Lankaran	LAN	2024-09-17 20:59:59	2024-09-17 20:59:59
258	16	Lankaran District	LA	2024-09-17 20:59:59	2024-09-17 20:59:59
259	16	Lerik District	LER	2024-09-17 20:59:59	2024-09-17 20:59:59
260	16	Martuni	XVD	2024-09-17 20:59:59	2024-09-17 20:59:59
261	16	Masally District	MAS	2024-09-17 20:59:59	2024-09-17 20:59:59
262	16	Mingachevir	MI	2024-09-17 20:59:59	2024-09-17 20:59:59
263	16	Nakhchivan Autonomous Republic	NX	2024-09-17 20:59:59	2024-09-17 20:59:59
264	16	Neftchala District	NEF	2024-09-17 20:59:59	2024-09-17 20:59:59
265	16	Oghuz District	OGU	2024-09-17 20:59:59	2024-09-17 20:59:59
266	16	Ordubad District	ORD	2024-09-17 20:59:59	2024-09-17 20:59:59
267	16	Qabala District	QAB	2024-09-17 20:59:59	2024-09-17 20:59:59
268	16	Qakh District	QAX	2024-09-17 20:59:59	2024-09-17 20:59:59
269	16	Qazakh District	QAZ	2024-09-17 20:59:59	2024-09-17 20:59:59
270	16	Quba District	QBA	2024-09-17 20:59:59	2024-09-17 20:59:59
271	16	Qubadli District	QBI	2024-09-17 20:59:59	2024-09-17 20:59:59
272	16	Qusar District	QUS	2024-09-17 20:59:59	2024-09-17 20:59:59
273	16	Saatly District	SAT	2024-09-17 20:59:59	2024-09-17 20:59:59
274	16	Sabirabad District	SAB	2024-09-17 20:59:59	2024-09-17 20:59:59
275	16	Sadarak District	SAD	2024-09-17 20:59:59	2024-09-17 20:59:59
276	16	Salyan District	SAL	2024-09-17 20:59:59	2024-09-17 20:59:59
277	16	Samukh District	SMX	2024-09-17 20:59:59	2024-09-17 20:59:59
278	16	Shabran District	SBN	2024-09-17 20:59:59	2024-09-17 20:59:59
279	16	Shahbuz District	SAH	2024-09-17 20:59:59	2024-09-17 20:59:59
280	16	Shaki	SA	2024-09-17 20:59:59	2024-09-17 20:59:59
281	16	Shaki District	SAK	2024-09-17 20:59:59	2024-09-17 20:59:59
282	16	Shamakhi District	SMI	2024-09-17 20:59:59	2024-09-17 20:59:59
283	16	Shamkir District	SKR	2024-09-17 20:59:59	2024-09-17 20:59:59
284	16	Sharur District	SAR	2024-09-17 20:59:59	2024-09-17 20:59:59
285	16	Shirvan	SR	2024-09-17 20:59:59	2024-09-17 20:59:59
286	16	Shusha District	SUS	2024-09-17 20:59:59	2024-09-17 20:59:59
287	16	Siazan District	SIY	2024-09-17 20:59:59	2024-09-17 20:59:59
288	16	Sumqayit	SM	2024-09-17 20:59:59	2024-09-17 20:59:59
289	16	Tartar District	TAR	2024-09-17 20:59:59	2024-09-17 20:59:59
290	16	Tovuz District	TOV	2024-09-17 20:59:59	2024-09-17 20:59:59
291	16	Ujar District	UCA	2024-09-17 20:59:59	2024-09-17 20:59:59
292	16	Yardymli District	YAR	2024-09-17 20:59:59	2024-09-17 20:59:59
293	16	Yevlakh	YE	2024-09-17 20:59:59	2024-09-17 20:59:59
294	16	Yevlakh District	YEV	2024-09-17 20:59:59	2024-09-17 20:59:59
295	16	Zangilan District	ZAN	2024-09-17 20:59:59	2024-09-17 20:59:59
296	16	Zaqatala District	ZAQ	2024-09-17 20:59:59	2024-09-17 20:59:59
297	16	Zardab District	ZAR	2024-09-17 20:59:59	2024-09-17 20:59:59
298	17	Acklins	AK	2024-09-17 20:59:59	2024-09-17 20:59:59
299	17	Acklins and Crooked Islands	AC	2024-09-17 20:59:59	2024-09-17 20:59:59
300	17	Berry Islands	BY	2024-09-17 20:59:59	2024-09-17 20:59:59
301	17	Bimini	BI	2024-09-17 20:59:59	2024-09-17 20:59:59
302	17	Black Point	BP	2024-09-17 20:59:59	2024-09-17 20:59:59
303	17	Cat Island	CI	2024-09-17 20:59:59	2024-09-17 20:59:59
304	17	Central Abaco	CO	2024-09-17 20:59:59	2024-09-17 20:59:59
305	17	Central Andros	CS	2024-09-17 20:59:59	2024-09-17 20:59:59
306	17	Central Eleuthera	CE	2024-09-17 20:59:59	2024-09-17 20:59:59
307	17	Crooked Island	CK	2024-09-17 20:59:59	2024-09-17 20:59:59
308	17	East Grand Bahama	EG	2024-09-17 20:59:59	2024-09-17 20:59:59
309	17	Exuma	EX	2024-09-17 20:59:59	2024-09-17 20:59:59
310	17	Freeport	FP	2024-09-17 20:59:59	2024-09-17 20:59:59
311	17	Fresh Creek	FC	2024-09-17 20:59:59	2024-09-17 20:59:59
312	17	Governor's Harbour	GH	2024-09-17 20:59:59	2024-09-17 20:59:59
313	17	Grand Cay	GC	2024-09-17 20:59:59	2024-09-17 20:59:59
314	17	Green Turtle Cay	GT	2024-09-17 20:59:59	2024-09-17 20:59:59
315	17	Harbour Island	HI	2024-09-17 20:59:59	2024-09-17 20:59:59
316	17	High Rock	HR	2024-09-17 20:59:59	2024-09-17 20:59:59
317	17	Hope Town	HT	2024-09-17 20:59:59	2024-09-17 20:59:59
318	17	Inagua	IN	2024-09-17 20:59:59	2024-09-17 20:59:59
319	17	Kemps Bay	KB	2024-09-17 20:59:59	2024-09-17 20:59:59
320	17	Long Island	LI	2024-09-17 20:59:59	2024-09-17 20:59:59
321	17	Mangrove Cay	MC	2024-09-17 20:59:59	2024-09-17 20:59:59
322	17	Marsh Harbour	MH	2024-09-17 20:59:59	2024-09-17 20:59:59
323	17	Mayaguana District	MG	2024-09-17 20:59:59	2024-09-17 20:59:59
324	17	New Providence	NP	2024-09-17 20:59:59	2024-09-17 20:59:59
325	17	Nichollstown and Berry Islands	NB	2024-09-17 20:59:59	2024-09-17 20:59:59
326	17	North Abaco	NO	2024-09-17 20:59:59	2024-09-17 20:59:59
327	17	North Andros	NS	2024-09-17 20:59:59	2024-09-17 20:59:59
328	17	North Eleuthera	NE	2024-09-17 20:59:59	2024-09-17 20:59:59
329	17	Ragged Island	RI	2024-09-17 20:59:59	2024-09-17 20:59:59
330	17	Rock Sound	RS	2024-09-17 20:59:59	2024-09-17 20:59:59
331	17	Rum Cay District	RC	2024-09-17 20:59:59	2024-09-17 20:59:59
332	17	San Salvador and Rum Cay	SR	2024-09-17 20:59:59	2024-09-17 20:59:59
333	17	San Salvador Island	SS	2024-09-17 20:59:59	2024-09-17 20:59:59
334	17	Sandy Point	SP	2024-09-17 20:59:59	2024-09-17 20:59:59
335	17	South Abaco	SO	2024-09-17 20:59:59	2024-09-17 20:59:59
336	17	South Andros	SA	2024-09-17 20:59:59	2024-09-17 20:59:59
337	17	South Eleuthera	SE	2024-09-17 20:59:59	2024-09-17 20:59:59
338	17	Spanish Wells	SW	2024-09-17 20:59:59	2024-09-17 20:59:59
339	17	West Grand Bahama	WG	2024-09-17 20:59:59	2024-09-17 20:59:59
340	18	Capital Governorate	13	2024-09-17 20:59:59	2024-09-17 20:59:59
341	18	Central Governorate	16	2024-09-17 20:59:59	2024-09-17 20:59:59
342	18	Muharraq Governorate	15	2024-09-17 20:59:59	2024-09-17 20:59:59
343	18	Northern Governorate	17	2024-09-17 20:59:59	2024-09-17 20:59:59
344	18	Southern Governorate	14	2024-09-17 20:59:59	2024-09-17 20:59:59
345	19	Bagerhat District	05	2024-09-17 20:59:59	2024-09-17 20:59:59
346	19	Bahadia	33	2024-09-17 20:59:59	2024-09-17 20:59:59
347	19	Bandarban District	01	2024-09-17 20:59:59	2024-09-17 20:59:59
348	19	Barguna District	02	2024-09-17 20:59:59	2024-09-17 20:59:59
349	19	Barisal District	06	2024-09-17 20:59:59	2024-09-17 20:59:59
350	19	Barisal Division	A	2024-09-17 20:59:59	2024-09-17 20:59:59
351	19	Bhola District	07	2024-09-17 20:59:59	2024-09-17 20:59:59
352	19	Bogra District	03	2024-09-17 20:59:59	2024-09-17 20:59:59
353	19	Brahmanbaria District	04	2024-09-17 20:59:59	2024-09-17 20:59:59
354	19	Chandpur District	09	2024-09-17 20:59:59	2024-09-17 20:59:59
355	19	Chapai Nawabganj District	45	2024-09-17 20:59:59	2024-09-17 20:59:59
356	19	Chittagong District	10	2024-09-17 20:59:59	2024-09-17 20:59:59
357	19	Chittagong Division	B	2024-09-17 20:59:59	2024-09-17 20:59:59
358	19	Chuadanga District	12	2024-09-17 20:59:59	2024-09-17 20:59:59
359	19	Comilla District	08	2024-09-17 20:59:59	2024-09-17 20:59:59
360	19	Cox's Bazar District	11	2024-09-17 20:59:59	2024-09-17 20:59:59
361	19	Dhaka District	13	2024-09-17 20:59:59	2024-09-17 20:59:59
362	19	Dhaka Division	C	2024-09-17 20:59:59	2024-09-17 20:59:59
363	19	Dinajpur District	14	2024-09-17 20:59:59	2024-09-17 20:59:59
364	19	Faridpur District	15	2024-09-17 20:59:59	2024-09-17 20:59:59
365	19	Feni District	16	2024-09-17 20:59:59	2024-09-17 20:59:59
366	19	Gaibandha District	19	2024-09-17 20:59:59	2024-09-17 20:59:59
367	19	Gazipur District	18	2024-09-17 20:59:59	2024-09-17 20:59:59
368	19	Gopalganj District	17	2024-09-17 20:59:59	2024-09-17 20:59:59
369	19	Habiganj District	20	2024-09-17 20:59:59	2024-09-17 20:59:59
370	19	Jamalpur District	21	2024-09-17 20:59:59	2024-09-17 20:59:59
371	19	Jessore District	22	2024-09-17 20:59:59	2024-09-17 20:59:59
372	19	Jhalokati District	25	2024-09-17 20:59:59	2024-09-17 20:59:59
373	19	Jhenaidah District	23	2024-09-17 20:59:59	2024-09-17 20:59:59
374	19	Joypurhat District	24	2024-09-17 20:59:59	2024-09-17 20:59:59
375	19	Khagrachari District	29	2024-09-17 20:59:59	2024-09-17 20:59:59
376	19	Khulna District	27	2024-09-17 20:59:59	2024-09-17 20:59:59
377	19	Khulna Division	D	2024-09-17 20:59:59	2024-09-17 20:59:59
378	19	Kishoreganj District	26	2024-09-17 20:59:59	2024-09-17 20:59:59
379	19	Kurigram District	28	2024-09-17 20:59:59	2024-09-17 20:59:59
380	19	Kushtia District	30	2024-09-17 20:59:59	2024-09-17 20:59:59
381	19	Lakshmipur District	31	2024-09-17 20:59:59	2024-09-17 20:59:59
382	19	Lalmonirhat District	32	2024-09-17 20:59:59	2024-09-17 20:59:59
383	19	Madaripur District	36	2024-09-17 20:59:59	2024-09-17 20:59:59
384	19	Meherpur District	39	2024-09-17 20:59:59	2024-09-17 20:59:59
385	19	Moulvibazar District	38	2024-09-17 20:59:59	2024-09-17 20:59:59
386	19	Munshiganj District	35	2024-09-17 20:59:59	2024-09-17 20:59:59
387	19	Mymensingh District	34	2024-09-17 20:59:59	2024-09-17 20:59:59
388	19	Mymensingh Division	H	2024-09-17 20:59:59	2024-09-17 20:59:59
389	19	Naogaon District	48	2024-09-17 20:59:59	2024-09-17 20:59:59
390	19	Narail District	43	2024-09-17 20:59:59	2024-09-17 20:59:59
391	19	Narayanganj District	40	2024-09-17 20:59:59	2024-09-17 20:59:59
392	19	Natore District	44	2024-09-17 20:59:59	2024-09-17 20:59:59
393	19	Netrokona District	41	2024-09-17 20:59:59	2024-09-17 20:59:59
394	19	Nilphamari District	46	2024-09-17 20:59:59	2024-09-17 20:59:59
395	19	Noakhali District	47	2024-09-17 20:59:59	2024-09-17 20:59:59
396	19	Pabna District	49	2024-09-17 20:59:59	2024-09-17 20:59:59
397	19	Panchagarh District	52	2024-09-17 20:59:59	2024-09-17 20:59:59
398	19	Patuakhali District	51	2024-09-17 20:59:59	2024-09-17 20:59:59
399	19	Pirojpur District	50	2024-09-17 21:00:00	2024-09-17 21:00:00
400	19	Rajbari District	53	2024-09-17 21:00:00	2024-09-17 21:00:00
401	19	Rajshahi District	54	2024-09-17 21:00:00	2024-09-17 21:00:00
402	19	Rajshahi Division	E	2024-09-17 21:00:00	2024-09-17 21:00:00
403	19	Rangamati Hill District	56	2024-09-17 21:00:00	2024-09-17 21:00:00
404	19	Rangpur District	55	2024-09-17 21:00:00	2024-09-17 21:00:00
405	19	Rangpur Division	F	2024-09-17 21:00:00	2024-09-17 21:00:00
406	19	Satkhira District	58	2024-09-17 21:00:00	2024-09-17 21:00:00
407	19	Shariatpur District	62	2024-09-17 21:00:00	2024-09-17 21:00:00
408	19	Sherpur District	57	2024-09-17 21:00:00	2024-09-17 21:00:00
409	19	Sirajganj District	59	2024-09-17 21:00:00	2024-09-17 21:00:00
410	19	Sunamganj District	61	2024-09-17 21:00:00	2024-09-17 21:00:00
411	19	Sylhet District	60	2024-09-17 21:00:00	2024-09-17 21:00:00
412	19	Sylhet Division	G	2024-09-17 21:00:00	2024-09-17 21:00:00
413	19	Tangail District	63	2024-09-17 21:00:00	2024-09-17 21:00:00
414	19	Thakurgaon District	64	2024-09-17 21:00:00	2024-09-17 21:00:00
415	20	Christ Church	01	2024-09-17 21:00:00	2024-09-17 21:00:00
416	20	Saint Andrew	02	2024-09-17 21:00:00	2024-09-17 21:00:00
417	20	Saint George	03	2024-09-17 21:00:00	2024-09-17 21:00:00
418	20	Saint James	04	2024-09-17 21:00:00	2024-09-17 21:00:00
419	20	Saint John	05	2024-09-17 21:00:00	2024-09-17 21:00:00
420	20	Saint Joseph	06	2024-09-17 21:00:00	2024-09-17 21:00:00
421	20	Saint Lucy	07	2024-09-17 21:00:00	2024-09-17 21:00:00
422	20	Saint Michael	08	2024-09-17 21:00:00	2024-09-17 21:00:00
423	20	Saint Peter	09	2024-09-17 21:00:00	2024-09-17 21:00:00
424	20	Saint Philip	10	2024-09-17 21:00:00	2024-09-17 21:00:00
425	20	Saint Thomas	11	2024-09-17 21:00:00	2024-09-17 21:00:00
426	21	Brest Region	BR	2024-09-17 21:00:00	2024-09-17 21:00:00
427	21	Gomel Region	HO	2024-09-17 21:00:00	2024-09-17 21:00:00
428	21	Grodno Region	HR	2024-09-17 21:00:00	2024-09-17 21:00:00
429	21	Minsk	HM	2024-09-17 21:00:00	2024-09-17 21:00:00
430	21	Minsk Region	MI	2024-09-17 21:00:00	2024-09-17 21:00:00
431	21	Mogilev Region	MA	2024-09-17 21:00:00	2024-09-17 21:00:00
432	21	Vitebsk Region	VI	2024-09-17 21:00:00	2024-09-17 21:00:00
433	22	Antwerp	VAN	2024-09-17 21:00:00	2024-09-17 21:00:00
434	22	Brussels-Capital Region	BRU	2024-09-17 21:00:00	2024-09-17 21:00:00
435	22	East Flanders	VOV	2024-09-17 21:00:00	2024-09-17 21:00:00
436	22	Flanders	VLG	2024-09-17 21:00:00	2024-09-17 21:00:00
437	22	Flemish Brabant	VBR	2024-09-17 21:00:00	2024-09-17 21:00:00
438	22	Hainaut	WHT	2024-09-17 21:00:00	2024-09-17 21:00:00
439	22	Liège	WLG	2024-09-17 21:00:00	2024-09-17 21:00:00
440	22	Limburg	VLI	2024-09-17 21:00:00	2024-09-17 21:00:00
441	22	Luxembourg	WLX	2024-09-17 21:00:00	2024-09-17 21:00:00
442	22	Namur	WNA	2024-09-17 21:00:00	2024-09-17 21:00:00
443	22	Wallonia	WAL	2024-09-17 21:00:00	2024-09-17 21:00:00
444	22	Walloon Brabant	WBR	2024-09-17 21:00:00	2024-09-17 21:00:00
445	22	West Flanders	VWV	2024-09-17 21:00:00	2024-09-17 21:00:00
446	23	Belize District	BZ	2024-09-17 21:00:00	2024-09-17 21:00:00
447	23	Cayo District	CY	2024-09-17 21:00:00	2024-09-17 21:00:00
448	23	Corozal District	CZL	2024-09-17 21:00:00	2024-09-17 21:00:00
449	23	Orange Walk District	OW	2024-09-17 21:00:00	2024-09-17 21:00:00
450	23	Stann Creek District	SC	2024-09-17 21:00:00	2024-09-17 21:00:00
451	23	Toledo District	TOL	2024-09-17 21:00:00	2024-09-17 21:00:00
452	24	Alibori Department	AL	2024-09-17 21:00:00	2024-09-17 21:00:00
453	24	Atakora Department	AK	2024-09-17 21:00:00	2024-09-17 21:00:00
454	24	Atlantique Department	AQ	2024-09-17 21:00:00	2024-09-17 21:00:00
455	24	Borgou Department	BO	2024-09-17 21:00:00	2024-09-17 21:00:00
456	24	Collines Department	CO	2024-09-17 21:00:00	2024-09-17 21:00:00
457	24	Donga Department	DO	2024-09-17 21:00:00	2024-09-17 21:00:00
458	24	Kouffo Department	KO	2024-09-17 21:00:00	2024-09-17 21:00:00
459	24	Littoral Department	LI	2024-09-17 21:00:00	2024-09-17 21:00:00
460	24	Mono Department	MO	2024-09-17 21:00:00	2024-09-17 21:00:00
461	24	Ouémé Department	OU	2024-09-17 21:00:00	2024-09-17 21:00:00
462	24	Plateau Department	PL	2024-09-17 21:00:00	2024-09-17 21:00:00
463	24	Zou Department	ZO	2024-09-17 21:00:00	2024-09-17 21:00:00
464	25	Devonshire Parish	DEV	2024-09-17 21:00:00	2024-09-17 21:00:00
465	25	Hamilton Municipality	HAM	2024-09-17 21:00:00	2024-09-17 21:00:00
466	25	Hamilton Parish	HA	2024-09-17 21:00:00	2024-09-17 21:00:00
467	25	Paget Parish	PAG	2024-09-17 21:00:00	2024-09-17 21:00:00
468	25	Pembroke Parish	PEM	2024-09-17 21:00:00	2024-09-17 21:00:00
469	25	Saint George's Municipality	SG	2024-09-17 21:00:00	2024-09-17 21:00:00
470	25	Saint George's Parish	SGE	2024-09-17 21:00:00	2024-09-17 21:00:00
471	25	Sandys Parish	SAN	2024-09-17 21:00:00	2024-09-17 21:00:00
472	25	Smith's Parish,	SMI	2024-09-17 21:00:00	2024-09-17 21:00:00
473	25	Southampton Parish	SOU	2024-09-17 21:00:00	2024-09-17 21:00:00
474	25	Warwick Parish	WAR	2024-09-17 21:00:00	2024-09-17 21:00:00
475	26	Bumthang District	33	2024-09-17 21:00:00	2024-09-17 21:00:00
476	26	Chukha District	12	2024-09-17 21:00:00	2024-09-17 21:00:00
477	26	Dagana District	22	2024-09-17 21:00:00	2024-09-17 21:00:00
478	26	Gasa District	GA	2024-09-17 21:00:00	2024-09-17 21:00:00
479	26	Haa District	13	2024-09-17 21:00:00	2024-09-17 21:00:00
480	26	Lhuntse District	44	2024-09-17 21:00:00	2024-09-17 21:00:00
481	26	Mongar District	42	2024-09-17 21:00:00	2024-09-17 21:00:00
482	26	Paro District	11	2024-09-17 21:00:00	2024-09-17 21:00:00
483	26	Pemagatshel District	43	2024-09-17 21:00:00	2024-09-17 21:00:00
484	26	Punakha District	23	2024-09-17 21:00:00	2024-09-17 21:00:00
485	26	Samdrup Jongkhar District	45	2024-09-17 21:00:00	2024-09-17 21:00:00
486	26	Samtse District	14	2024-09-17 21:00:00	2024-09-17 21:00:00
487	26	Sarpang District	31	2024-09-17 21:00:00	2024-09-17 21:00:00
488	26	Thimphu District	15	2024-09-17 21:00:00	2024-09-17 21:00:00
489	26	Trashigang District	41	2024-09-17 21:00:00	2024-09-17 21:00:00
490	26	Trongsa District	32	2024-09-17 21:00:00	2024-09-17 21:00:00
491	26	Tsirang District	21	2024-09-17 21:00:00	2024-09-17 21:00:00
492	26	Wangdue Phodrang District	24	2024-09-17 21:00:00	2024-09-17 21:00:00
493	26	Zhemgang District	34	2024-09-17 21:00:00	2024-09-17 21:00:00
494	27	Beni Department	B	2024-09-17 21:00:00	2024-09-17 21:00:00
495	27	Chuquisaca Department	H	2024-09-17 21:00:00	2024-09-17 21:00:00
496	27	Cochabamba Department	C	2024-09-17 21:00:00	2024-09-17 21:00:00
497	27	La Paz Department	L	2024-09-17 21:00:00	2024-09-17 21:00:00
498	27	Oruro Department	O	2024-09-17 21:00:00	2024-09-17 21:00:00
499	27	Pando Department	N	2024-09-17 21:00:00	2024-09-17 21:00:00
500	27	Potosí Department	P	2024-09-17 21:00:00	2024-09-17 21:00:00
501	27	Santa Cruz Department	S	2024-09-17 21:00:00	2024-09-17 21:00:00
502	27	Tarija Department	T	2024-09-17 21:00:00	2024-09-17 21:00:00
503	29	Bosnian Podrinje Canton	05	2024-09-17 21:00:00	2024-09-17 21:00:00
504	29	Brčko District	BRC	2024-09-17 21:00:00	2024-09-17 21:00:00
505	29	Canton 10	10	2024-09-17 21:00:00	2024-09-17 21:00:00
506	29	Central Bosnia Canton	06	2024-09-17 21:00:00	2024-09-17 21:00:00
507	29	Federation of Bosnia and Herzegovina	BIH	2024-09-17 21:00:00	2024-09-17 21:00:00
508	29	Herzegovina-Neretva Canton	07	2024-09-17 21:00:00	2024-09-17 21:00:00
509	29	Posavina Canton	02	2024-09-17 21:00:00	2024-09-17 21:00:00
510	29	Republika Srpska	SRP	2024-09-17 21:00:00	2024-09-17 21:00:00
511	29	Sarajevo Canton	09	2024-09-17 21:00:00	2024-09-17 21:00:00
512	29	Tuzla Canton	03	2024-09-17 21:00:00	2024-09-17 21:00:00
513	29	Una-Sana Canton	01	2024-09-17 21:00:00	2024-09-17 21:00:00
514	29	West Herzegovina Canton	08	2024-09-17 21:00:00	2024-09-17 21:00:00
515	29	Zenica-Doboj Canton	04	2024-09-17 21:00:00	2024-09-17 21:00:00
516	30	Central District	CE	2024-09-17 21:00:00	2024-09-17 21:00:00
517	30	Ghanzi District	GH	2024-09-17 21:00:00	2024-09-17 21:00:00
518	30	Kgalagadi District	KG	2024-09-17 21:00:00	2024-09-17 21:00:00
519	30	Kgatleng District	KL	2024-09-17 21:00:00	2024-09-17 21:00:00
520	30	Kweneng District	KW	2024-09-17 21:00:00	2024-09-17 21:00:00
521	30	Ngamiland	NG	2024-09-17 21:00:00	2024-09-17 21:00:00
522	30	North-East District	NE	2024-09-17 21:00:00	2024-09-17 21:00:00
523	30	North-West District	NW	2024-09-17 21:00:00	2024-09-17 21:00:00
524	30	South-East District	SE	2024-09-17 21:00:00	2024-09-17 21:00:00
525	30	Southern District	SO	2024-09-17 21:00:00	2024-09-17 21:00:00
526	32	Acre	AC	2024-09-17 21:00:00	2024-09-17 21:00:00
527	32	Alagoas	AL	2024-09-17 21:00:00	2024-09-17 21:00:00
528	32	Amapá	AP	2024-09-17 21:00:00	2024-09-17 21:00:00
529	32	Amazonas	AM	2024-09-17 21:00:00	2024-09-17 21:00:00
530	32	Bahia	BA	2024-09-17 21:00:00	2024-09-17 21:00:00
531	32	Ceará	CE	2024-09-17 21:00:00	2024-09-17 21:00:00
532	32	Distrito Federal	DF	2024-09-17 21:00:00	2024-09-17 21:00:00
533	32	Espírito Santo	ES	2024-09-17 21:00:00	2024-09-17 21:00:00
534	32	Goiás	GO	2024-09-17 21:00:00	2024-09-17 21:00:00
535	32	Maranhão	MA	2024-09-17 21:00:00	2024-09-17 21:00:00
536	32	Mato Grosso	MT	2024-09-17 21:00:00	2024-09-17 21:00:00
537	32	Mato Grosso do Sul	MS	2024-09-17 21:00:00	2024-09-17 21:00:00
538	32	Minas Gerais	MG	2024-09-17 21:00:00	2024-09-17 21:00:00
539	32	Pará	PA	2024-09-17 21:00:00	2024-09-17 21:00:00
540	32	Paraíba	PB	2024-09-17 21:00:00	2024-09-17 21:00:00
541	32	Paraná	PR	2024-09-17 21:00:00	2024-09-17 21:00:00
542	32	Pernambuco	PE	2024-09-17 21:00:00	2024-09-17 21:00:00
543	32	Piauí	PI	2024-09-17 21:00:00	2024-09-17 21:00:00
544	32	Rio de Janeiro	RJ	2024-09-17 21:00:00	2024-09-17 21:00:00
545	32	Rio Grande do Norte	RN	2024-09-17 21:00:00	2024-09-17 21:00:00
546	32	Rio Grande do Sul	RS	2024-09-17 21:00:00	2024-09-17 21:00:00
547	32	Rondônia	RO	2024-09-17 21:00:00	2024-09-17 21:00:00
548	32	Roraima	RR	2024-09-17 21:00:00	2024-09-17 21:00:00
549	32	Santa Catarina	SC	2024-09-17 21:00:00	2024-09-17 21:00:00
550	32	São Paulo	SP	2024-09-17 21:00:00	2024-09-17 21:00:00
551	32	Sergipe	SE	2024-09-17 21:00:00	2024-09-17 21:00:00
552	32	Tocantins	TO	2024-09-17 21:00:00	2024-09-17 21:00:00
553	34	Belait District	BE	2024-09-17 21:00:00	2024-09-17 21:00:00
554	34	Brunei-Muara District	BM	2024-09-17 21:00:00	2024-09-17 21:00:00
555	34	Temburong District	TE	2024-09-17 21:00:00	2024-09-17 21:00:00
556	34	Tutong District	TU	2024-09-17 21:00:00	2024-09-17 21:00:00
557	35	Blagoevgrad Province	01	2024-09-17 21:00:00	2024-09-17 21:00:00
558	35	Burgas Province	02	2024-09-17 21:00:00	2024-09-17 21:00:00
559	35	Dobrich Province	08	2024-09-17 21:00:00	2024-09-17 21:00:00
560	35	Gabrovo Province	07	2024-09-17 21:00:00	2024-09-17 21:00:00
561	35	Haskovo Province	26	2024-09-17 21:00:00	2024-09-17 21:00:00
562	35	Kardzhali Province	09	2024-09-17 21:00:00	2024-09-17 21:00:00
563	35	Kyustendil Province	10	2024-09-17 21:00:00	2024-09-17 21:00:00
564	35	Lovech Province	11	2024-09-17 21:00:00	2024-09-17 21:00:00
565	35	Montana Province	12	2024-09-17 21:00:00	2024-09-17 21:00:00
566	35	Pazardzhik Province	13	2024-09-17 21:00:00	2024-09-17 21:00:00
567	35	Pernik Province	14	2024-09-17 21:00:00	2024-09-17 21:00:00
568	35	Pleven Province	15	2024-09-17 21:00:00	2024-09-17 21:00:00
569	35	Plovdiv Province	16	2024-09-17 21:00:00	2024-09-17 21:00:00
570	35	Razgrad Province	17	2024-09-17 21:00:00	2024-09-17 21:00:00
571	35	Ruse Province	18	2024-09-17 21:00:00	2024-09-17 21:00:00
572	35	Shumen	27	2024-09-17 21:00:00	2024-09-17 21:00:00
573	35	Silistra Province	19	2024-09-17 21:00:00	2024-09-17 21:00:00
574	35	Sliven Province	20	2024-09-17 21:00:00	2024-09-17 21:00:00
575	35	Smolyan Province	21	2024-09-17 21:00:00	2024-09-17 21:00:00
576	35	Sofia City Province	22	2024-09-17 21:00:00	2024-09-17 21:00:00
577	35	Sofia Province	23	2024-09-17 21:00:00	2024-09-17 21:00:00
578	35	Stara Zagora Province	24	2024-09-17 21:00:00	2024-09-17 21:00:00
579	35	Targovishte Province	25	2024-09-17 21:00:00	2024-09-17 21:00:00
580	35	Varna Province	03	2024-09-17 21:00:00	2024-09-17 21:00:00
581	35	Veliko Tarnovo Province	04	2024-09-17 21:00:00	2024-09-17 21:00:00
582	35	Vidin Province	05	2024-09-17 21:00:00	2024-09-17 21:00:00
583	35	Vratsa Province	06	2024-09-17 21:00:00	2024-09-17 21:00:00
584	35	Yambol Province	28	2024-09-17 21:00:00	2024-09-17 21:00:00
585	36	Balé Province	BAL	2024-09-17 21:00:00	2024-09-17 21:00:00
586	36	Bam Province	BAM	2024-09-17 21:00:00	2024-09-17 21:00:00
587	36	Banwa Province	BAN	2024-09-17 21:00:00	2024-09-17 21:00:00
588	36	Bazèga Province	BAZ	2024-09-17 21:00:00	2024-09-17 21:00:00
589	36	Boucle du Mouhoun Region	01	2024-09-17 21:00:00	2024-09-17 21:00:00
590	36	Bougouriba Province	BGR	2024-09-17 21:00:00	2024-09-17 21:00:00
591	36	Boulgou	BLG	2024-09-17 21:00:00	2024-09-17 21:00:00
592	36	Cascades Region	02	2024-09-17 21:00:00	2024-09-17 21:00:00
593	36	Centre	03	2024-09-17 21:00:00	2024-09-17 21:00:00
594	36	Centre-Est Region	04	2024-09-17 21:00:00	2024-09-17 21:00:00
595	36	Centre-Nord Region	05	2024-09-17 21:00:00	2024-09-17 21:00:00
596	36	Centre-Ouest Region	06	2024-09-17 21:00:00	2024-09-17 21:00:00
597	36	Centre-Sud Region	07	2024-09-17 21:00:00	2024-09-17 21:00:00
598	36	Comoé Province	COM	2024-09-17 21:00:00	2024-09-17 21:00:00
599	36	Est Region	08	2024-09-17 21:00:00	2024-09-17 21:00:00
600	36	Ganzourgou Province	GAN	2024-09-17 21:00:00	2024-09-17 21:00:00
601	36	Gnagna Province	GNA	2024-09-17 21:00:00	2024-09-17 21:00:00
602	36	Gourma Province	GOU	2024-09-17 21:00:00	2024-09-17 21:00:00
603	36	Hauts-Bassins Region	09	2024-09-17 21:00:00	2024-09-17 21:00:00
604	36	Houet Province	HOU	2024-09-17 21:00:00	2024-09-17 21:00:00
605	36	Ioba Province	IOB	2024-09-17 21:00:00	2024-09-17 21:00:00
606	36	Kadiogo Province	KAD	2024-09-17 21:00:00	2024-09-17 21:00:00
607	36	Kénédougou Province	KEN	2024-09-17 21:00:00	2024-09-17 21:00:00
608	36	Komondjari Province	KMD	2024-09-17 21:00:00	2024-09-17 21:00:00
609	36	Kompienga Province	KMP	2024-09-17 21:00:00	2024-09-17 21:00:00
610	36	Kossi Province	KOS	2024-09-17 21:00:00	2024-09-17 21:00:00
611	36	Koulpélogo Province	KOP	2024-09-17 21:00:00	2024-09-17 21:00:00
612	36	Kouritenga Province	KOT	2024-09-17 21:00:00	2024-09-17 21:00:00
613	36	Kourwéogo Province	KOW	2024-09-17 21:00:00	2024-09-17 21:00:00
614	36	Léraba Province	LER	2024-09-17 21:00:00	2024-09-17 21:00:00
615	36	Loroum Province	LOR	2024-09-17 21:00:00	2024-09-17 21:00:00
616	36	Mouhoun	MOU	2024-09-17 21:00:00	2024-09-17 21:00:00
617	36	Nahouri Province	NAO	2024-09-17 21:00:00	2024-09-17 21:00:00
618	36	Namentenga Province	NAM	2024-09-17 21:00:00	2024-09-17 21:00:00
619	36	Nayala Province	NAY	2024-09-17 21:00:00	2024-09-17 21:00:00
620	36	Nord Region, Burkina Faso	10	2024-09-17 21:00:00	2024-09-17 21:00:00
621	36	Noumbiel Province	NOU	2024-09-17 21:00:00	2024-09-17 21:00:00
622	36	Oubritenga Province	OUB	2024-09-17 21:00:00	2024-09-17 21:00:00
623	36	Oudalan Province	OUD	2024-09-17 21:00:00	2024-09-17 21:00:00
624	36	Passoré Province	PAS	2024-09-17 21:00:00	2024-09-17 21:00:00
625	36	Plateau-Central Region	11	2024-09-17 21:00:00	2024-09-17 21:00:00
626	36	Poni Province	PON	2024-09-17 21:00:00	2024-09-17 21:00:00
627	36	Sahel Region	12	2024-09-17 21:00:00	2024-09-17 21:00:00
628	36	Sanguié Province	SNG	2024-09-17 21:00:00	2024-09-17 21:00:00
629	36	Sanmatenga Province	SMT	2024-09-17 21:00:00	2024-09-17 21:00:00
630	36	Séno Province	SEN	2024-09-17 21:00:00	2024-09-17 21:00:00
631	36	Sissili Province	SIS	2024-09-17 21:00:00	2024-09-17 21:00:00
632	36	Soum Province	SOM	2024-09-17 21:00:00	2024-09-17 21:00:00
633	36	Sourou Province	SOR	2024-09-17 21:00:00	2024-09-17 21:00:00
634	36	Sud-Ouest Region	13	2024-09-17 21:00:00	2024-09-17 21:00:00
635	36	Tapoa Province	TAP	2024-09-17 21:00:00	2024-09-17 21:00:00
636	36	Tuy Province	TUI	2024-09-17 21:00:00	2024-09-17 21:00:00
637	36	Yagha Province	YAG	2024-09-17 21:00:00	2024-09-17 21:00:00
638	36	Yatenga Province	YAT	2024-09-17 21:00:00	2024-09-17 21:00:00
639	36	Ziro Province	ZIR	2024-09-17 21:00:00	2024-09-17 21:00:00
640	36	Zondoma Province	ZON	2024-09-17 21:00:00	2024-09-17 21:00:00
641	36	Zoundwéogo Province	ZOU	2024-09-17 21:00:00	2024-09-17 21:00:00
642	37	Bubanza Province	BB	2024-09-17 21:00:00	2024-09-17 21:00:00
643	37	Bujumbura Mairie Province	BM	2024-09-17 21:00:00	2024-09-17 21:00:00
644	37	Bujumbura Rural Province	BL	2024-09-17 21:00:00	2024-09-17 21:00:00
645	37	Bururi Province	BR	2024-09-17 21:00:00	2024-09-17 21:00:00
646	37	Cankuzo Province	CA	2024-09-17 21:00:00	2024-09-17 21:00:00
647	37	Cibitoke Province	CI	2024-09-17 21:00:00	2024-09-17 21:00:00
648	37	Gitega Province	GI	2024-09-17 21:00:00	2024-09-17 21:00:00
649	37	Karuzi Province	KR	2024-09-17 21:00:00	2024-09-17 21:00:00
650	37	Kayanza Province	KY	2024-09-17 21:00:00	2024-09-17 21:00:00
651	37	Kirundo Province	KI	2024-09-17 21:00:00	2024-09-17 21:00:00
652	37	Makamba Province	MA	2024-09-17 21:00:00	2024-09-17 21:00:00
653	37	Muramvya Province	MU	2024-09-17 21:00:00	2024-09-17 21:00:00
654	37	Muyinga Province	MY	2024-09-17 21:00:00	2024-09-17 21:00:00
655	37	Mwaro Province	MW	2024-09-17 21:00:00	2024-09-17 21:00:00
656	37	Ngozi Province	NG	2024-09-17 21:00:00	2024-09-17 21:00:00
657	37	Rumonge Province	RM	2024-09-17 21:00:00	2024-09-17 21:00:00
658	37	Rutana Province	RT	2024-09-17 21:00:00	2024-09-17 21:00:00
659	37	Ruyigi Province	RY	2024-09-17 21:00:00	2024-09-17 21:00:00
660	38	Banteay Meanchey Province	1	2024-09-17 21:00:00	2024-09-17 21:00:00
661	38	Battambang Province	2	2024-09-17 21:00:00	2024-09-17 21:00:00
662	38	Kampong Cham Province	3	2024-09-17 21:00:00	2024-09-17 21:00:00
663	38	Kampong Chhnang Province	4	2024-09-17 21:00:00	2024-09-17 21:00:00
664	38	Kampong Speu Province	5	2024-09-17 21:00:00	2024-09-17 21:00:00
665	38	Kampot Province	7	2024-09-17 21:00:00	2024-09-17 21:00:00
666	38	Kandal Province	8	2024-09-17 21:00:00	2024-09-17 21:00:00
667	38	Kep Province	23	2024-09-17 21:00:00	2024-09-17 21:00:00
668	38	Koh Kong Province	9	2024-09-17 21:00:00	2024-09-17 21:00:00
669	38	Kratié Province	10	2024-09-17 21:00:00	2024-09-17 21:00:00
670	38	Mondulkiri Province	11	2024-09-17 21:00:00	2024-09-17 21:00:00
671	38	Oddar Meanchey Province	22	2024-09-17 21:00:00	2024-09-17 21:00:00
672	38	Pailin Province	24	2024-09-17 21:00:00	2024-09-17 21:00:00
673	38	Phnom Penh	12	2024-09-17 21:00:00	2024-09-17 21:00:00
674	38	Preah Vihear Province	13	2024-09-17 21:00:00	2024-09-17 21:00:00
675	38	Prey Veng Province	14	2024-09-17 21:00:00	2024-09-17 21:00:00
676	38	Pursat Province	15	2024-09-17 21:00:00	2024-09-17 21:00:00
677	38	Ratanakiri Province	16	2024-09-17 21:00:00	2024-09-17 21:00:00
678	38	Siem Reap Province	17	2024-09-17 21:00:00	2024-09-17 21:00:00
679	38	Sihanoukville Province	18	2024-09-17 21:00:00	2024-09-17 21:00:00
680	38	Stung Treng Province	19	2024-09-17 21:00:00	2024-09-17 21:00:00
681	38	Svay Rieng Province	20	2024-09-17 21:00:00	2024-09-17 21:00:00
682	38	Takéo Province	21	2024-09-17 21:00:00	2024-09-17 21:00:00
683	39	Adamawa	AD	2024-09-17 21:00:00	2024-09-17 21:00:00
684	39	Centre	CE	2024-09-17 21:00:00	2024-09-17 21:00:00
685	39	East	ES	2024-09-17 21:00:00	2024-09-17 21:00:00
686	39	Far North	EN	2024-09-17 21:00:00	2024-09-17 21:00:00
687	39	Littoral	LT	2024-09-17 21:00:00	2024-09-17 21:00:00
688	39	North	NO	2024-09-17 21:00:00	2024-09-17 21:00:00
689	39	Northwest	NW	2024-09-17 21:00:00	2024-09-17 21:00:00
690	39	South	SU	2024-09-17 21:00:00	2024-09-17 21:00:00
691	39	Southwest	SW	2024-09-17 21:00:00	2024-09-17 21:00:00
692	39	West	OU	2024-09-17 21:00:00	2024-09-17 21:00:00
693	40	Alberta	AB	2024-09-17 21:00:00	2024-09-17 21:00:00
694	40	British Columbia	BC	2024-09-17 21:00:00	2024-09-17 21:00:00
695	40	Manitoba	MB	2024-09-17 21:00:00	2024-09-17 21:00:00
696	40	New Brunswick	NB	2024-09-17 21:00:00	2024-09-17 21:00:00
697	40	Newfoundland and Labrador	NL	2024-09-17 21:00:00	2024-09-17 21:00:00
698	40	Northwest Territories	NT	2024-09-17 21:00:00	2024-09-17 21:00:00
699	40	Nova Scotia	NS	2024-09-17 21:00:00	2024-09-17 21:00:00
700	40	Nunavut	NU	2024-09-17 21:00:00	2024-09-17 21:00:00
701	40	Ontario	ON	2024-09-17 21:00:00	2024-09-17 21:00:00
702	40	Prince Edward Island	PE	2024-09-17 21:00:00	2024-09-17 21:00:00
703	40	Quebec	QC	2024-09-17 21:00:00	2024-09-17 21:00:00
704	40	Saskatchewan	SK	2024-09-17 21:00:00	2024-09-17 21:00:00
705	40	Yukon	YT	2024-09-17 21:00:00	2024-09-17 21:00:00
706	41	Barlavento Islands	B	2024-09-17 21:00:00	2024-09-17 21:00:00
707	41	Boa Vista	BV	2024-09-17 21:00:00	2024-09-17 21:00:00
708	41	Brava	BR	2024-09-17 21:00:00	2024-09-17 21:00:00
709	41	Maio Municipality	MA	2024-09-17 21:00:00	2024-09-17 21:00:00
710	41	Mosteiros	MO	2024-09-17 21:00:00	2024-09-17 21:00:00
711	41	Paul	PA	2024-09-17 21:00:00	2024-09-17 21:00:00
712	41	Porto Novo	PN	2024-09-17 21:00:00	2024-09-17 21:00:00
713	41	Praia	PR	2024-09-17 21:00:00	2024-09-17 21:00:00
714	41	Ribeira Brava Municipality	RB	2024-09-17 21:00:00	2024-09-17 21:00:00
715	41	Ribeira Grande	RG	2024-09-17 21:00:00	2024-09-17 21:00:00
716	41	Ribeira Grande de Santiago	RS	2024-09-17 21:00:00	2024-09-17 21:00:00
717	41	Sal	SL	2024-09-17 21:00:00	2024-09-17 21:00:00
718	41	Santa Catarina	CA	2024-09-17 21:00:00	2024-09-17 21:00:00
719	41	Santa Catarina do Fogo	CF	2024-09-17 21:00:00	2024-09-17 21:00:00
720	41	Santa Cruz	CR	2024-09-17 21:00:00	2024-09-17 21:00:00
721	41	São Domingos	SD	2024-09-17 21:00:00	2024-09-17 21:00:00
722	41	São Filipe	SF	2024-09-17 21:00:01	2024-09-17 21:00:01
723	41	São Lourenço dos Órgãos	SO	2024-09-17 21:00:01	2024-09-17 21:00:01
724	41	São Miguel	SM	2024-09-17 21:00:01	2024-09-17 21:00:01
725	41	São Vicente	SV	2024-09-17 21:00:01	2024-09-17 21:00:01
726	41	Sotavento Islands	S	2024-09-17 21:00:01	2024-09-17 21:00:01
727	41	Tarrafal	TA	2024-09-17 21:00:01	2024-09-17 21:00:01
728	41	Tarrafal de São Nicolau	TS	2024-09-17 21:00:01	2024-09-17 21:00:01
729	43	Bamingui-Bangoran Prefecture	BB	2024-09-17 21:00:01	2024-09-17 21:00:01
730	43	Bangui	BGF	2024-09-17 21:00:01	2024-09-17 21:00:01
731	43	Basse-Kotto Prefecture	BK	2024-09-17 21:00:01	2024-09-17 21:00:01
732	43	Haut-Mbomou Prefecture	HM	2024-09-17 21:00:01	2024-09-17 21:00:01
733	43	Haute-Kotto Prefecture	HK	2024-09-17 21:00:01	2024-09-17 21:00:01
734	43	Kémo Prefecture	KG	2024-09-17 21:00:01	2024-09-17 21:00:01
735	43	Lobaye Prefecture	LB	2024-09-17 21:00:01	2024-09-17 21:00:01
736	43	Mambéré-Kadéï	HS	2024-09-17 21:00:01	2024-09-17 21:00:01
737	43	Mbomou Prefecture	MB	2024-09-17 21:00:01	2024-09-17 21:00:01
738	43	Nana-Grébizi Economic Prefecture	KB	2024-09-17 21:00:01	2024-09-17 21:00:01
739	43	Nana-Mambéré Prefecture	NM	2024-09-17 21:00:01	2024-09-17 21:00:01
740	43	Ombella-M'Poko Prefecture	MP	2024-09-17 21:00:01	2024-09-17 21:00:01
741	43	Ouaka Prefecture	UK	2024-09-17 21:00:01	2024-09-17 21:00:01
742	43	Ouham Prefecture	AC	2024-09-17 21:00:01	2024-09-17 21:00:01
743	43	Ouham-Pendé Prefecture	OP	2024-09-17 21:00:01	2024-09-17 21:00:01
744	43	Sangha-Mbaéré	SE	2024-09-17 21:00:01	2024-09-17 21:00:01
745	43	Vakaga Prefecture	VK	2024-09-17 21:00:01	2024-09-17 21:00:01
746	44	Bahr el Gazel	BG	2024-09-17 21:00:01	2024-09-17 21:00:01
747	44	Batha Region	BA	2024-09-17 21:00:01	2024-09-17 21:00:01
748	44	Borkou	BO	2024-09-17 21:00:01	2024-09-17 21:00:01
749	44	Ennedi Region	EN	2024-09-17 21:00:01	2024-09-17 21:00:01
750	44	Ennedi-Est	EE	2024-09-17 21:00:01	2024-09-17 21:00:01
751	44	Ennedi-Ouest	EO	2024-09-17 21:00:01	2024-09-17 21:00:01
752	44	Guéra Region	GR	2024-09-17 21:00:01	2024-09-17 21:00:01
753	44	Hadjer-Lamis	HL	2024-09-17 21:00:01	2024-09-17 21:00:01
754	44	Kanem Region	KA	2024-09-17 21:00:01	2024-09-17 21:00:01
755	44	Lac Region	LC	2024-09-17 21:00:01	2024-09-17 21:00:01
756	44	Logone Occidental Region	LO	2024-09-17 21:00:01	2024-09-17 21:00:01
757	44	Logone Oriental Region	LR	2024-09-17 21:00:01	2024-09-17 21:00:01
758	44	Mandoul Region	MA	2024-09-17 21:00:01	2024-09-17 21:00:01
759	44	Mayo-Kebbi Est Region	ME	2024-09-17 21:00:01	2024-09-17 21:00:01
760	44	Mayo-Kebbi Ouest Region	MO	2024-09-17 21:00:01	2024-09-17 21:00:01
761	44	Moyen-Chari Region	MC	2024-09-17 21:00:01	2024-09-17 21:00:01
762	44	N'Djamena	ND	2024-09-17 21:00:01	2024-09-17 21:00:01
763	44	Ouaddaï Region	OD	2024-09-17 21:00:01	2024-09-17 21:00:01
764	44	Salamat Region	SA	2024-09-17 21:00:01	2024-09-17 21:00:01
765	44	Sila Region	SI	2024-09-17 21:00:01	2024-09-17 21:00:01
766	44	Tandjilé Region	TA	2024-09-17 21:00:01	2024-09-17 21:00:01
767	44	Tibesti Region	TI	2024-09-17 21:00:01	2024-09-17 21:00:01
768	44	Wadi Fira Region	WF	2024-09-17 21:00:01	2024-09-17 21:00:01
769	45	Aisén del General Carlos Ibañez del Campo	AI	2024-09-17 21:00:01	2024-09-17 21:00:01
770	45	Antofagasta	AN	2024-09-17 21:00:01	2024-09-17 21:00:01
771	45	Arica y Parinacota	AP	2024-09-17 21:00:01	2024-09-17 21:00:01
772	45	Atacama	AT	2024-09-17 21:00:01	2024-09-17 21:00:01
773	45	Biobío	BI	2024-09-17 21:00:01	2024-09-17 21:00:01
774	45	Coquimbo	CO	2024-09-17 21:00:01	2024-09-17 21:00:01
775	45	La Araucanía	AR	2024-09-17 21:00:01	2024-09-17 21:00:01
776	45	Libertador General Bernardo O'Higgins	LI	2024-09-17 21:00:01	2024-09-17 21:00:01
777	45	Los Lagos	LL	2024-09-17 21:00:01	2024-09-17 21:00:01
778	45	Los Ríos	LR	2024-09-17 21:00:01	2024-09-17 21:00:01
779	45	Magallanes y de la Antártica Chilena	MA	2024-09-17 21:00:01	2024-09-17 21:00:01
780	45	Maule	ML	2024-09-17 21:00:01	2024-09-17 21:00:01
781	45	Ñuble	NB	2024-09-17 21:00:01	2024-09-17 21:00:01
782	45	Región Metropolitana de Santiago	RM	2024-09-17 21:00:01	2024-09-17 21:00:01
783	45	Tarapacá	TA	2024-09-17 21:00:01	2024-09-17 21:00:01
784	45	Valparaíso	VS	2024-09-17 21:00:01	2024-09-17 21:00:01
785	46	Anhui	AH	2024-09-17 21:00:01	2024-09-17 21:00:01
786	46	Beijing	BJ	2024-09-17 21:00:01	2024-09-17 21:00:01
787	46	Chongqing	CQ	2024-09-17 21:00:01	2024-09-17 21:00:01
788	46	Fujian	FJ	2024-09-17 21:00:01	2024-09-17 21:00:01
789	46	Gansu	GS	2024-09-17 21:00:01	2024-09-17 21:00:01
790	46	Guangdong	GD	2024-09-17 21:00:01	2024-09-17 21:00:01
791	46	Guangxi Zhuang Autonomous Region	GX	2024-09-17 21:00:01	2024-09-17 21:00:01
792	46	Guizhou	GZ	2024-09-17 21:00:01	2024-09-17 21:00:01
793	46	Hainan	HI	2024-09-17 21:00:01	2024-09-17 21:00:01
794	46	Hebei	HE	2024-09-17 21:00:01	2024-09-17 21:00:01
795	46	Heilongjiang	HL	2024-09-17 21:00:01	2024-09-17 21:00:01
796	46	Henan	HA	2024-09-17 21:00:01	2024-09-17 21:00:01
797	46	Hong Kong	HK	2024-09-17 21:00:01	2024-09-17 21:00:01
798	46	Hubei	HB	2024-09-17 21:00:01	2024-09-17 21:00:01
799	46	Hunan	HN	2024-09-17 21:00:01	2024-09-17 21:00:01
800	46	Inner Mongolia	NM	2024-09-17 21:00:01	2024-09-17 21:00:01
801	46	Jiangsu	JS	2024-09-17 21:00:01	2024-09-17 21:00:01
802	46	Jiangxi	JX	2024-09-17 21:00:01	2024-09-17 21:00:01
803	46	Jilin	JL	2024-09-17 21:00:01	2024-09-17 21:00:01
804	46	Keelung	TW-KEE	2024-09-17 21:00:01	2024-09-17 21:00:01
805	46	Liaoning	LN	2024-09-17 21:00:01	2024-09-17 21:00:01
806	46	Macau	MO	2024-09-17 21:00:01	2024-09-17 21:00:01
807	46	Ningxia Hui Autonomous Region	NX	2024-09-17 21:00:01	2024-09-17 21:00:01
808	46	Qinghai	QH	2024-09-17 21:00:01	2024-09-17 21:00:01
809	46	Shaanxi	SN	2024-09-17 21:00:01	2024-09-17 21:00:01
810	46	Shandong	SD	2024-09-17 21:00:01	2024-09-17 21:00:01
811	46	Shanghai	SH	2024-09-17 21:00:01	2024-09-17 21:00:01
812	46	Shanxi	SX	2024-09-17 21:00:01	2024-09-17 21:00:01
813	46	Sichuan	SC	2024-09-17 21:00:01	2024-09-17 21:00:01
814	46	Taiwan Province, People's Republic of China	TW	2024-09-17 21:00:01	2024-09-17 21:00:01
815	46	Tibet Autonomous Region	XZ	2024-09-17 21:00:01	2024-09-17 21:00:01
816	46	Xinjiang	XJ	2024-09-17 21:00:01	2024-09-17 21:00:01
817	46	Yunnan	YN	2024-09-17 21:00:01	2024-09-17 21:00:01
818	46	Zhejiang	ZJ	2024-09-17 21:00:01	2024-09-17 21:00:01
819	49	Amazonas	AMA	2024-09-17 21:00:01	2024-09-17 21:00:01
820	49	Antioquia	ANT	2024-09-17 21:00:01	2024-09-17 21:00:01
821	49	Arauca	ARA	2024-09-17 21:00:01	2024-09-17 21:00:01
822	49	Atlántico	ATL	2024-09-17 21:00:01	2024-09-17 21:00:01
823	49	Bogotá	DC	2024-09-17 21:00:01	2024-09-17 21:00:01
824	49	Bolívar	BOL	2024-09-17 21:00:01	2024-09-17 21:00:01
825	49	Boyacá	BOY	2024-09-17 21:00:01	2024-09-17 21:00:01
826	49	Caldas	CAL	2024-09-17 21:00:01	2024-09-17 21:00:01
827	49	Caquetá	CAQ	2024-09-17 21:00:01	2024-09-17 21:00:01
828	49	Casanare	CAS	2024-09-17 21:00:01	2024-09-17 21:00:01
829	49	Cauca	CAU	2024-09-17 21:00:01	2024-09-17 21:00:01
830	49	Cesar	CES	2024-09-17 21:00:01	2024-09-17 21:00:01
831	49	Chocó	CHO	2024-09-17 21:00:01	2024-09-17 21:00:01
832	49	Córdoba	COR	2024-09-17 21:00:01	2024-09-17 21:00:01
833	49	Cundinamarca	CUN	2024-09-17 21:00:01	2024-09-17 21:00:01
834	49	Guainía	GUA	2024-09-17 21:00:01	2024-09-17 21:00:01
835	49	Guaviare	GUV	2024-09-17 21:00:01	2024-09-17 21:00:01
836	49	Huila	HUI	2024-09-17 21:00:01	2024-09-17 21:00:01
837	49	La Guajira	LAG	2024-09-17 21:00:01	2024-09-17 21:00:01
838	49	Magdalena	MAG	2024-09-17 21:00:01	2024-09-17 21:00:01
839	49	Meta	MET	2024-09-17 21:00:01	2024-09-17 21:00:01
840	49	Nariño	NAR	2024-09-17 21:00:01	2024-09-17 21:00:01
841	49	Norte de Santander	NSA	2024-09-17 21:00:01	2024-09-17 21:00:01
842	49	Putumayo	PUT	2024-09-17 21:00:01	2024-09-17 21:00:01
843	49	Quindío	QUI	2024-09-17 21:00:01	2024-09-17 21:00:01
844	49	Risaralda	RIS	2024-09-17 21:00:01	2024-09-17 21:00:01
845	49	San Andrés, Providencia y Santa Catalina	SAP	2024-09-17 21:00:01	2024-09-17 21:00:01
846	49	Santander	SAN	2024-09-17 21:00:01	2024-09-17 21:00:01
847	49	Sucre	SUC	2024-09-17 21:00:01	2024-09-17 21:00:01
848	49	Tolima	TOL	2024-09-17 21:00:01	2024-09-17 21:00:01
849	49	Valle del Cauca	VAC	2024-09-17 21:00:01	2024-09-17 21:00:01
850	49	Vaupés	VAU	2024-09-17 21:00:01	2024-09-17 21:00:01
851	49	Vichada	VID	2024-09-17 21:00:01	2024-09-17 21:00:01
852	50	Anjouan	A	2024-09-17 21:00:01	2024-09-17 21:00:01
853	50	Grande Comore	G	2024-09-17 21:00:01	2024-09-17 21:00:01
854	50	Mohéli	M	2024-09-17 21:00:01	2024-09-17 21:00:01
855	51	Bouenza Department	11	2024-09-17 21:00:01	2024-09-17 21:00:01
856	51	Brazzaville	BZV	2024-09-17 21:00:01	2024-09-17 21:00:01
857	51	Cuvette Department	8	2024-09-17 21:00:01	2024-09-17 21:00:01
858	51	Cuvette-Ouest Department	15	2024-09-17 21:00:01	2024-09-17 21:00:01
859	51	Kouilou Department	5	2024-09-17 21:00:01	2024-09-17 21:00:01
860	51	Lékoumou Department	2	2024-09-17 21:00:01	2024-09-17 21:00:01
861	51	Likouala Department	7	2024-09-17 21:00:01	2024-09-17 21:00:01
862	51	Niari Department	9	2024-09-17 21:00:01	2024-09-17 21:00:01
863	51	Plateaux Department	14	2024-09-17 21:00:01	2024-09-17 21:00:01
864	51	Pointe-Noire	16	2024-09-17 21:00:01	2024-09-17 21:00:01
865	51	Pool Department	12	2024-09-17 21:00:01	2024-09-17 21:00:01
866	51	Sangha Department	13	2024-09-17 21:00:01	2024-09-17 21:00:01
867	53	Alajuela Province	A	2024-09-17 21:00:01	2024-09-17 21:00:01
868	53	Guanacaste Province	G	2024-09-17 21:00:01	2024-09-17 21:00:01
869	53	Heredia Province	H	2024-09-17 21:00:01	2024-09-17 21:00:01
870	53	Limón Province	L	2024-09-17 21:00:01	2024-09-17 21:00:01
871	53	Provincia de Cartago	C	2024-09-17 21:00:01	2024-09-17 21:00:01
872	53	Puntarenas Province	P	2024-09-17 21:00:01	2024-09-17 21:00:01
873	53	San José Province	SJ	2024-09-17 21:00:01	2024-09-17 21:00:01
874	54	Abidjan	AB	2024-09-17 21:00:01	2024-09-17 21:00:01
875	54	Agnéby	16	2024-09-17 21:00:01	2024-09-17 21:00:01
876	54	Bafing Region	17	2024-09-17 21:00:01	2024-09-17 21:00:01
877	54	Bas-Sassandra District	BS	2024-09-17 21:00:01	2024-09-17 21:00:01
878	54	Bas-Sassandra Region	09	2024-09-17 21:00:01	2024-09-17 21:00:01
879	54	Comoé District	CM	2024-09-17 21:00:01	2024-09-17 21:00:01
880	54	Denguélé District	DN	2024-09-17 21:00:01	2024-09-17 21:00:01
881	54	Denguélé Region	10	2024-09-17 21:00:01	2024-09-17 21:00:01
882	54	Dix-Huit Montagnes	06	2024-09-17 21:00:01	2024-09-17 21:00:01
883	54	Fromager	18	2024-09-17 21:00:01	2024-09-17 21:00:01
884	54	Gôh-Djiboua District	GD	2024-09-17 21:00:01	2024-09-17 21:00:01
885	54	Haut-Sassandra	02	2024-09-17 21:00:01	2024-09-17 21:00:01
886	54	Lacs District	LC	2024-09-17 21:00:01	2024-09-17 21:00:01
887	54	Lacs Region	07	2024-09-17 21:00:01	2024-09-17 21:00:01
888	54	Lagunes District	LG	2024-09-17 21:00:01	2024-09-17 21:00:01
889	54	Lagunes region	01	2024-09-17 21:00:01	2024-09-17 21:00:01
890	54	Marahoué Region	12	2024-09-17 21:00:01	2024-09-17 21:00:01
891	54	Montagnes District	MG	2024-09-17 21:00:01	2024-09-17 21:00:01
892	54	Moyen-Cavally	19	2024-09-17 21:00:01	2024-09-17 21:00:01
893	54	Moyen-Comoé	05	2024-09-17 21:00:01	2024-09-17 21:00:01
894	54	N'zi-Comoé	11	2024-09-17 21:00:01	2024-09-17 21:00:01
895	54	Sassandra-Marahoué District	SM	2024-09-17 21:00:01	2024-09-17 21:00:01
896	54	Savanes Region	03	2024-09-17 21:00:01	2024-09-17 21:00:01
897	54	Sud-Bandama	15	2024-09-17 21:00:01	2024-09-17 21:00:01
898	54	Sud-Comoé	13	2024-09-17 21:00:01	2024-09-17 21:00:01
899	54	Vallée du Bandama District	VB	2024-09-17 21:00:01	2024-09-17 21:00:01
900	54	Vallée du Bandama Region	04	2024-09-17 21:00:01	2024-09-17 21:00:01
901	54	Woroba District	WR	2024-09-17 21:00:01	2024-09-17 21:00:01
902	54	Worodougou	14	2024-09-17 21:00:01	2024-09-17 21:00:01
903	54	Yamoussoukro	YM	2024-09-17 21:00:01	2024-09-17 21:00:01
904	54	Zanzan Region	ZZ	2024-09-17 21:00:01	2024-09-17 21:00:01
905	55	Bjelovar-Bilogora County	07	2024-09-17 21:00:01	2024-09-17 21:00:01
906	55	Brod-Posavina County	12	2024-09-17 21:00:01	2024-09-17 21:00:01
907	55	Dubrovnik-Neretva County	19	2024-09-17 21:00:01	2024-09-17 21:00:01
908	55	Istria County	18	2024-09-17 21:00:01	2024-09-17 21:00:01
909	55	Koprivnica-Križevci County	06	2024-09-17 21:00:01	2024-09-17 21:00:01
910	55	Krapina-Zagorje County	02	2024-09-17 21:00:01	2024-09-17 21:00:01
911	55	Lika-Senj County	09	2024-09-17 21:00:01	2024-09-17 21:00:01
912	55	Međimurje County	20	2024-09-17 21:00:01	2024-09-17 21:00:01
913	55	Osijek-Baranja County	14	2024-09-17 21:00:01	2024-09-17 21:00:01
914	55	Požega-Slavonia County	11	2024-09-17 21:00:01	2024-09-17 21:00:01
915	55	Primorje-Gorski Kotar County	08	2024-09-17 21:00:01	2024-09-17 21:00:01
916	55	Šibenik-Knin County	15	2024-09-17 21:00:01	2024-09-17 21:00:01
917	55	Sisak-Moslavina County	03	2024-09-17 21:00:01	2024-09-17 21:00:01
918	55	Split-Dalmatia County	17	2024-09-17 21:00:01	2024-09-17 21:00:01
919	55	Varaždin County	05	2024-09-17 21:00:01	2024-09-17 21:00:01
920	55	Virovitica-Podravina County	10	2024-09-17 21:00:01	2024-09-17 21:00:01
921	55	Vukovar-Syrmia County	16	2024-09-17 21:00:01	2024-09-17 21:00:01
922	55	Zadar County	13	2024-09-17 21:00:01	2024-09-17 21:00:01
923	55	Zagreb	21	2024-09-17 21:00:01	2024-09-17 21:00:01
924	55	Zagreb County	01	2024-09-17 21:00:01	2024-09-17 21:00:01
925	56	Artemisa Province	15	2024-09-17 21:00:01	2024-09-17 21:00:01
926	56	Camagüey Province	09	2024-09-17 21:00:01	2024-09-17 21:00:01
927	56	Ciego de Ávila Province	08	2024-09-17 21:00:01	2024-09-17 21:00:01
928	56	Cienfuegos Province	06	2024-09-17 21:00:01	2024-09-17 21:00:01
929	56	Granma Province	12	2024-09-17 21:00:01	2024-09-17 21:00:01
930	56	Guantánamo Province	14	2024-09-17 21:00:01	2024-09-17 21:00:01
931	56	Havana Province	03	2024-09-17 21:00:01	2024-09-17 21:00:01
932	56	Holguín Province	11	2024-09-17 21:00:01	2024-09-17 21:00:01
933	56	Isla de la Juventud	99	2024-09-17 21:00:01	2024-09-17 21:00:01
934	56	Las Tunas Province	10	2024-09-17 21:00:01	2024-09-17 21:00:01
935	56	Matanzas Province	04	2024-09-17 21:00:01	2024-09-17 21:00:01
936	56	Mayabeque Province	16	2024-09-17 21:00:01	2024-09-17 21:00:01
937	56	Pinar del Río Province	01	2024-09-17 21:00:01	2024-09-17 21:00:01
938	56	Sancti Spíritus Province	07	2024-09-17 21:00:01	2024-09-17 21:00:01
939	56	Santiago de Cuba Province	13	2024-09-17 21:00:01	2024-09-17 21:00:01
940	56	Villa Clara Province	05	2024-09-17 21:00:01	2024-09-17 21:00:01
941	58	Famagusta District (Mağusa)	04	2024-09-17 21:00:01	2024-09-17 21:00:01
942	58	Kyrenia District (Keryneia)	06	2024-09-17 21:00:01	2024-09-17 21:00:01
943	58	Larnaca District (Larnaka)	03	2024-09-17 21:00:01	2024-09-17 21:00:01
944	58	Limassol District (Leymasun)	02	2024-09-17 21:00:01	2024-09-17 21:00:01
945	58	Nicosia District (Lefkoşa)	01	2024-09-17 21:00:01	2024-09-17 21:00:01
946	58	Paphos District (Pafos)	05	2024-09-17 21:00:01	2024-09-17 21:00:01
947	59	Benešov	201	2024-09-17 21:00:01	2024-09-17 21:00:01
948	59	Beroun	202	2024-09-17 21:00:01	2024-09-17 21:00:01
949	59	Blansko	641	2024-09-17 21:00:01	2024-09-17 21:00:01
950	59	Břeclav	644	2024-09-17 21:00:01	2024-09-17 21:00:01
951	59	Brno-město	642	2024-09-17 21:00:01	2024-09-17 21:00:01
952	59	Brno-venkov	643	2024-09-17 21:00:01	2024-09-17 21:00:01
953	59	Bruntál	801	2024-09-17 21:00:01	2024-09-17 21:00:01
954	59	Česká Lípa	511	2024-09-17 21:00:01	2024-09-17 21:00:01
955	59	České Budějovice	311	2024-09-17 21:00:01	2024-09-17 21:00:01
956	59	Český Krumlov	312	2024-09-17 21:00:01	2024-09-17 21:00:01
957	59	Cheb	411	2024-09-17 21:00:01	2024-09-17 21:00:01
958	59	Chomutov	422	2024-09-17 21:00:01	2024-09-17 21:00:01
959	59	Chrudim	531	2024-09-17 21:00:01	2024-09-17 21:00:01
960	59	Děčín	421	2024-09-17 21:00:01	2024-09-17 21:00:01
961	59	Domažlice	321	2024-09-17 21:00:01	2024-09-17 21:00:01
962	59	Frýdek-Místek	802	2024-09-17 21:00:01	2024-09-17 21:00:01
963	59	Havlíčkův Brod	631	2024-09-17 21:00:01	2024-09-17 21:00:01
964	59	Hodonín	645	2024-09-17 21:00:01	2024-09-17 21:00:01
965	59	Hradec Králové	521	2024-09-17 21:00:01	2024-09-17 21:00:01
966	59	Jablonec nad Nisou	512	2024-09-17 21:00:01	2024-09-17 21:00:01
967	59	Jeseník	711	2024-09-17 21:00:01	2024-09-17 21:00:01
968	59	Jičín	522	2024-09-17 21:00:01	2024-09-17 21:00:01
969	59	Jihlava	632	2024-09-17 21:00:01	2024-09-17 21:00:01
970	59	Jihočeský kraj	31	2024-09-17 21:00:01	2024-09-17 21:00:01
971	59	Jihomoravský kraj	64	2024-09-17 21:00:01	2024-09-17 21:00:01
972	59	Jindřichův Hradec	313	2024-09-17 21:00:01	2024-09-17 21:00:01
973	59	Karlovarský kraj	41	2024-09-17 21:00:01	2024-09-17 21:00:01
974	59	Karlovy Vary	412	2024-09-17 21:00:01	2024-09-17 21:00:01
975	59	Karviná	803	2024-09-17 21:00:01	2024-09-17 21:00:01
976	59	Kladno	203	2024-09-17 21:00:01	2024-09-17 21:00:01
977	59	Klatovy	322	2024-09-17 21:00:01	2024-09-17 21:00:01
978	59	Kolín	204	2024-09-17 21:00:01	2024-09-17 21:00:01
979	59	Kraj Vysočina	63	2024-09-17 21:00:01	2024-09-17 21:00:01
980	59	Královéhradecký kraj	52	2024-09-17 21:00:01	2024-09-17 21:00:01
981	59	Kroměříž	721	2024-09-17 21:00:01	2024-09-17 21:00:01
982	59	Kutná Hora	205	2024-09-17 21:00:01	2024-09-17 21:00:01
983	59	Liberec	513	2024-09-17 21:00:01	2024-09-17 21:00:01
984	59	Liberecký kraj	51	2024-09-17 21:00:01	2024-09-17 21:00:01
985	59	Litoměřice	423	2024-09-17 21:00:01	2024-09-17 21:00:01
986	59	Louny	424	2024-09-17 21:00:01	2024-09-17 21:00:01
987	59	Mělník	206	2024-09-17 21:00:01	2024-09-17 21:00:01
988	59	Mladá Boleslav	207	2024-09-17 21:00:01	2024-09-17 21:00:01
989	59	Moravskoslezský kraj	80	2024-09-17 21:00:01	2024-09-17 21:00:01
990	59	Most	425	2024-09-17 21:00:01	2024-09-17 21:00:01
991	59	Náchod	523	2024-09-17 21:00:01	2024-09-17 21:00:01
992	59	Nový Jičín	804	2024-09-17 21:00:01	2024-09-17 21:00:01
993	59	Nymburk	208	2024-09-17 21:00:01	2024-09-17 21:00:01
994	59	Olomouc	712	2024-09-17 21:00:01	2024-09-17 21:00:01
995	59	Olomoucký kraj	71	2024-09-17 21:00:01	2024-09-17 21:00:01
996	59	Opava	805	2024-09-17 21:00:01	2024-09-17 21:00:01
997	59	Ostrava-město	806	2024-09-17 21:00:01	2024-09-17 21:00:01
998	59	Pardubice	532	2024-09-17 21:00:01	2024-09-17 21:00:01
999	59	Pardubický kraj	53	2024-09-17 21:00:01	2024-09-17 21:00:01
1000	59	Pelhřimov	633	2024-09-17 21:00:01	2024-09-17 21:00:01
1001	59	Písek	314	2024-09-17 21:00:01	2024-09-17 21:00:01
1002	59	Plzeň-jih	324	2024-09-17 21:00:01	2024-09-17 21:00:01
1003	59	Plzeň-město	323	2024-09-17 21:00:01	2024-09-17 21:00:01
1004	59	Plzeň-sever	325	2024-09-17 21:00:01	2024-09-17 21:00:01
1005	59	Plzeňský kraj	32	2024-09-17 21:00:01	2024-09-17 21:00:01
1006	59	Prachatice	315	2024-09-17 21:00:01	2024-09-17 21:00:01
1007	59	Praha-východ	209	2024-09-17 21:00:01	2024-09-17 21:00:01
1008	59	Praha-západ	20A	2024-09-17 21:00:01	2024-09-17 21:00:01
1009	59	Praha, Hlavní město	10	2024-09-17 21:00:01	2024-09-17 21:00:01
1010	59	Přerov	714	2024-09-17 21:00:01	2024-09-17 21:00:01
1011	59	Příbram	20B	2024-09-17 21:00:01	2024-09-17 21:00:01
1012	59	Prostějov	713	2024-09-17 21:00:01	2024-09-17 21:00:01
1013	59	Rakovník	20C	2024-09-17 21:00:01	2024-09-17 21:00:01
1014	59	Rokycany	326	2024-09-17 21:00:01	2024-09-17 21:00:01
1015	59	Rychnov nad Kněžnou	524	2024-09-17 21:00:01	2024-09-17 21:00:01
1016	59	Semily	514	2024-09-17 21:00:01	2024-09-17 21:00:01
1017	59	Sokolov	413	2024-09-17 21:00:01	2024-09-17 21:00:01
1018	59	Strakonice	316	2024-09-17 21:00:01	2024-09-17 21:00:01
1019	59	Středočeský kraj	20	2024-09-17 21:00:01	2024-09-17 21:00:01
1020	59	Šumperk	715	2024-09-17 21:00:01	2024-09-17 21:00:01
1021	59	Svitavy	533	2024-09-17 21:00:01	2024-09-17 21:00:01
1022	59	Tábor	317	2024-09-17 21:00:01	2024-09-17 21:00:01
1023	59	Tachov	327	2024-09-17 21:00:01	2024-09-17 21:00:01
1024	59	Teplice	426	2024-09-17 21:00:01	2024-09-17 21:00:01
1025	59	Třebíč	634	2024-09-17 21:00:01	2024-09-17 21:00:01
1026	59	Trutnov	525	2024-09-17 21:00:01	2024-09-17 21:00:01
1027	59	Uherské Hradiště	722	2024-09-17 21:00:01	2024-09-17 21:00:01
1028	59	Ústecký kraj	42	2024-09-17 21:00:01	2024-09-17 21:00:01
1029	59	Ústí nad Labem	427	2024-09-17 21:00:01	2024-09-17 21:00:01
1030	59	Ústí nad Orlicí	534	2024-09-17 21:00:01	2024-09-17 21:00:01
1031	59	Vsetín	723	2024-09-17 21:00:01	2024-09-17 21:00:01
1032	59	Vyškov	646	2024-09-17 21:00:01	2024-09-17 21:00:01
1033	59	Žďár nad Sázavou	635	2024-09-17 21:00:01	2024-09-17 21:00:01
1034	59	Zlín	724	2024-09-17 21:00:01	2024-09-17 21:00:01
1035	59	Zlínský kraj	72	2024-09-17 21:00:01	2024-09-17 21:00:01
1036	59	Znojmo	647	2024-09-17 21:00:01	2024-09-17 21:00:01
1037	60	Bas-Uélé	BU	2024-09-17 21:00:01	2024-09-17 21:00:01
1038	60	Équateur	EQ	2024-09-17 21:00:01	2024-09-17 21:00:01
1039	60	Haut-Katanga	HK	2024-09-17 21:00:01	2024-09-17 21:00:01
1040	60	Haut-Lomami	HL	2024-09-17 21:00:01	2024-09-17 21:00:01
1041	60	Haut-Uélé	HU	2024-09-17 21:00:01	2024-09-17 21:00:01
1042	60	Ituri	IT	2024-09-17 21:00:01	2024-09-17 21:00:01
1043	60	Kasaï	KS	2024-09-17 21:00:01	2024-09-17 21:00:01
1044	60	Kasaï Central	KC	2024-09-17 21:00:01	2024-09-17 21:00:01
1045	60	Kasaï Oriental	KE	2024-09-17 21:00:01	2024-09-17 21:00:01
1046	60	Kinshasa	KN	2024-09-17 21:00:01	2024-09-17 21:00:01
1047	60	Kongo Central	BC	2024-09-17 21:00:01	2024-09-17 21:00:01
1048	60	Kwango	KG	2024-09-17 21:00:01	2024-09-17 21:00:01
1049	60	Kwilu	KL	2024-09-17 21:00:01	2024-09-17 21:00:01
1050	60	Lomami	LO	2024-09-17 21:00:01	2024-09-17 21:00:01
1051	60	Lualaba	LU	2024-09-17 21:00:01	2024-09-17 21:00:01
1052	60	Mai-Ndombe	MN	2024-09-17 21:00:01	2024-09-17 21:00:01
1053	60	Maniema	MA	2024-09-17 21:00:01	2024-09-17 21:00:01
1054	60	Mongala	MO	2024-09-17 21:00:01	2024-09-17 21:00:01
1055	60	Nord-Kivu	NK	2024-09-17 21:00:01	2024-09-17 21:00:01
1056	60	Nord-Ubangi	NU	2024-09-17 21:00:01	2024-09-17 21:00:01
1057	60	Sankuru	SA	2024-09-17 21:00:01	2024-09-17 21:00:01
1058	60	Sud-Kivu	SK	2024-09-17 21:00:01	2024-09-17 21:00:01
1059	60	Sud-Ubangi	SU	2024-09-17 21:00:01	2024-09-17 21:00:01
1060	60	Tanganyika	TA	2024-09-17 21:00:01	2024-09-17 21:00:01
1061	60	Tshopo	TO	2024-09-17 21:00:01	2024-09-17 21:00:01
1062	60	Tshuapa	TU	2024-09-17 21:00:01	2024-09-17 21:00:01
1063	61	Capital Region of Denmark	84	2024-09-17 21:00:01	2024-09-17 21:00:01
1064	61	Central Denmark Region	82	2024-09-17 21:00:01	2024-09-17 21:00:01
1065	61	North Denmark Region	81	2024-09-17 21:00:01	2024-09-17 21:00:01
1066	61	Region of Southern Denmark	83	2024-09-17 21:00:01	2024-09-17 21:00:01
1067	61	Region Zealand	85	2024-09-17 21:00:01	2024-09-17 21:00:01
1068	62	Ali Sabieh Region	AS	2024-09-17 21:00:01	2024-09-17 21:00:01
1069	62	Arta Region	AR	2024-09-17 21:00:01	2024-09-17 21:00:01
1070	62	Dikhil Region	DI	2024-09-17 21:00:01	2024-09-17 21:00:01
1071	62	Djibouti	DJ	2024-09-17 21:00:01	2024-09-17 21:00:01
1072	62	Obock Region	OB	2024-09-17 21:00:01	2024-09-17 21:00:01
1073	62	Tadjourah Region	TA	2024-09-17 21:00:01	2024-09-17 21:00:01
1074	63	Saint Andrew Parish	02	2024-09-17 21:00:01	2024-09-17 21:00:01
1075	63	Saint David Parish	03	2024-09-17 21:00:01	2024-09-17 21:00:01
1076	63	Saint George Parish	04	2024-09-17 21:00:01	2024-09-17 21:00:01
1077	63	Saint John Parish	05	2024-09-17 21:00:01	2024-09-17 21:00:01
1078	63	Saint Joseph Parish	06	2024-09-17 21:00:01	2024-09-17 21:00:01
1079	63	Saint Luke Parish	07	2024-09-17 21:00:01	2024-09-17 21:00:01
1080	63	Saint Mark Parish	08	2024-09-17 21:00:01	2024-09-17 21:00:01
1081	63	Saint Patrick Parish	09	2024-09-17 21:00:01	2024-09-17 21:00:01
1082	63	Saint Paul Parish	10	2024-09-17 21:00:02	2024-09-17 21:00:02
1083	63	Saint Peter Parish	11	2024-09-17 21:00:02	2024-09-17 21:00:02
1084	64	Azua Province	02	2024-09-17 21:00:02	2024-09-17 21:00:02
1085	64	Baoruco Province	03	2024-09-17 21:00:02	2024-09-17 21:00:02
1086	64	Barahona Province	04	2024-09-17 21:00:02	2024-09-17 21:00:02
1087	64	Dajabón Province	05	2024-09-17 21:00:02	2024-09-17 21:00:02
1088	64	Distrito Nacional	01	2024-09-17 21:00:02	2024-09-17 21:00:02
1089	64	Duarte Province	06	2024-09-17 21:00:02	2024-09-17 21:00:02
1090	64	El Seibo Province	08	2024-09-17 21:00:02	2024-09-17 21:00:02
1091	64	Espaillat Province	09	2024-09-17 21:00:02	2024-09-17 21:00:02
1092	64	Hato Mayor Province	30	2024-09-17 21:00:02	2024-09-17 21:00:02
1093	64	Hermanas Mirabal Province	19	2024-09-17 21:00:02	2024-09-17 21:00:02
1094	64	Independencia	10	2024-09-17 21:00:02	2024-09-17 21:00:02
1095	64	La Altagracia Province	11	2024-09-17 21:00:02	2024-09-17 21:00:02
1096	64	La Romana Province	12	2024-09-17 21:00:02	2024-09-17 21:00:02
1097	64	La Vega Province	13	2024-09-17 21:00:02	2024-09-17 21:00:02
1098	64	María Trinidad Sánchez Province	14	2024-09-17 21:00:02	2024-09-17 21:00:02
1099	64	Monseñor Nouel Province	28	2024-09-17 21:00:02	2024-09-17 21:00:02
1100	64	Monte Cristi Province	15	2024-09-17 21:00:02	2024-09-17 21:00:02
1101	64	Monte Plata Province	29	2024-09-17 21:00:02	2024-09-17 21:00:02
1102	64	Pedernales Province	16	2024-09-17 21:00:02	2024-09-17 21:00:02
1103	64	Peravia Province	17	2024-09-17 21:00:02	2024-09-17 21:00:02
1104	64	Puerto Plata Province	18	2024-09-17 21:00:02	2024-09-17 21:00:02
1105	64	Samaná Province	20	2024-09-17 21:00:02	2024-09-17 21:00:02
1106	64	San Cristóbal Province	21	2024-09-17 21:00:02	2024-09-17 21:00:02
1107	64	San José de Ocoa Province	31	2024-09-17 21:00:02	2024-09-17 21:00:02
1108	64	San Juan Province	22	2024-09-17 21:00:02	2024-09-17 21:00:02
1109	64	San Pedro de Macorís	23	2024-09-17 21:00:02	2024-09-17 21:00:02
1110	64	Sánchez Ramírez Province	24	2024-09-17 21:00:02	2024-09-17 21:00:02
1111	64	Santiago Province	25	2024-09-17 21:00:02	2024-09-17 21:00:02
1112	64	Santiago Rodríguez Province	26	2024-09-17 21:00:02	2024-09-17 21:00:02
1113	64	Santo Domingo Province	32	2024-09-17 21:00:02	2024-09-17 21:00:02
1114	64	Valverde Province	27	2024-09-17 21:00:02	2024-09-17 21:00:02
1115	65	Aileu municipality	AL	2024-09-17 21:00:02	2024-09-17 21:00:02
1116	65	Ainaro Municipality	AN	2024-09-17 21:00:02	2024-09-17 21:00:02
1117	65	Baucau Municipality	BA	2024-09-17 21:00:02	2024-09-17 21:00:02
1118	65	Bobonaro Municipality	BO	2024-09-17 21:00:02	2024-09-17 21:00:02
1119	65	Cova Lima Municipality	CO	2024-09-17 21:00:02	2024-09-17 21:00:02
1120	65	Dili municipality	DI	2024-09-17 21:00:02	2024-09-17 21:00:02
1121	65	Ermera District	ER	2024-09-17 21:00:02	2024-09-17 21:00:02
1122	65	Lautém Municipality	LA	2024-09-17 21:00:02	2024-09-17 21:00:02
1123	65	Liquiçá Municipality	LI	2024-09-17 21:00:02	2024-09-17 21:00:02
1124	65	Manatuto District	MT	2024-09-17 21:00:02	2024-09-17 21:00:02
1125	65	Manufahi Municipality	MF	2024-09-17 21:00:02	2024-09-17 21:00:02
1126	65	Viqueque Municipality	VI	2024-09-17 21:00:02	2024-09-17 21:00:02
1127	66	Azuay Province	A	2024-09-17 21:00:02	2024-09-17 21:00:02
1128	66	Bolívar Province	B	2024-09-17 21:00:02	2024-09-17 21:00:02
1129	66	Cañar Province	F	2024-09-17 21:00:02	2024-09-17 21:00:02
1130	66	Carchi Province	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1131	66	Chimborazo Province	H	2024-09-17 21:00:02	2024-09-17 21:00:02
1132	66	Cotopaxi Province	X	2024-09-17 21:00:02	2024-09-17 21:00:02
1133	66	El Oro Province	O	2024-09-17 21:00:02	2024-09-17 21:00:02
1134	66	Esmeraldas	E	2024-09-17 21:00:02	2024-09-17 21:00:02
1135	66	Galápagos Province	W	2024-09-17 21:00:02	2024-09-17 21:00:02
1136	66	Guayas Province	G	2024-09-17 21:00:02	2024-09-17 21:00:02
1137	66	Imbabura Province	I	2024-09-17 21:00:02	2024-09-17 21:00:02
1138	66	Los Ríos Province	R	2024-09-17 21:00:02	2024-09-17 21:00:02
1139	66	Manabí Province	M	2024-09-17 21:00:02	2024-09-17 21:00:02
1140	66	Morona-Santiago Province	S	2024-09-17 21:00:02	2024-09-17 21:00:02
1141	66	Napo Province	N	2024-09-17 21:00:02	2024-09-17 21:00:02
1142	66	Orellana Province	D	2024-09-17 21:00:02	2024-09-17 21:00:02
1143	66	Pastaza Province	Y	2024-09-17 21:00:02	2024-09-17 21:00:02
1144	66	Pichincha Province	P	2024-09-17 21:00:02	2024-09-17 21:00:02
1145	66	Santa Elena Province	SE	2024-09-17 21:00:02	2024-09-17 21:00:02
1146	66	Santo Domingo de los Tsáchilas Province	SD	2024-09-17 21:00:02	2024-09-17 21:00:02
1147	66	Sucumbíos Province	U	2024-09-17 21:00:02	2024-09-17 21:00:02
1148	66	Tungurahua Province	T	2024-09-17 21:00:02	2024-09-17 21:00:02
1149	66	Zamora-Chinchipe Province	Z	2024-09-17 21:00:02	2024-09-17 21:00:02
1150	67	Alexandria Governorate	ALX	2024-09-17 21:00:02	2024-09-17 21:00:02
1151	67	Aswan Governorate	ASN	2024-09-17 21:00:02	2024-09-17 21:00:02
1152	67	Asyut Governorate	AST	2024-09-17 21:00:02	2024-09-17 21:00:02
1153	67	Beheira Governorate	BH	2024-09-17 21:00:02	2024-09-17 21:00:02
1154	67	Beni Suef Governorate	BNS	2024-09-17 21:00:02	2024-09-17 21:00:02
1155	67	Cairo Governorate	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1156	67	Dakahlia Governorate	DK	2024-09-17 21:00:02	2024-09-17 21:00:02
1157	67	Damietta Governorate	DT	2024-09-17 21:00:02	2024-09-17 21:00:02
1158	67	Faiyum Governorate	FYM	2024-09-17 21:00:02	2024-09-17 21:00:02
1159	67	Gharbia Governorate	GH	2024-09-17 21:00:02	2024-09-17 21:00:02
1160	67	Giza Governorate	GZ	2024-09-17 21:00:02	2024-09-17 21:00:02
1161	67	Ismailia Governorate	IS	2024-09-17 21:00:02	2024-09-17 21:00:02
1162	67	Kafr el-Sheikh Governorate	KFS	2024-09-17 21:00:02	2024-09-17 21:00:02
1163	67	Luxor Governorate	LX	2024-09-17 21:00:02	2024-09-17 21:00:02
1164	67	Matrouh Governorate	MT	2024-09-17 21:00:02	2024-09-17 21:00:02
1165	67	Minya Governorate	MN	2024-09-17 21:00:02	2024-09-17 21:00:02
1166	67	Monufia Governorate	MNF	2024-09-17 21:00:02	2024-09-17 21:00:02
1167	67	New Valley Governorate	WAD	2024-09-17 21:00:02	2024-09-17 21:00:02
1168	67	North Sinai Governorate	SIN	2024-09-17 21:00:02	2024-09-17 21:00:02
1169	67	Port Said Governorate	PTS	2024-09-17 21:00:02	2024-09-17 21:00:02
1170	67	Qalyubia Governorate	KB	2024-09-17 21:00:02	2024-09-17 21:00:02
1171	67	Qena Governorate	KN	2024-09-17 21:00:02	2024-09-17 21:00:02
1172	67	Red Sea Governorate	BA	2024-09-17 21:00:02	2024-09-17 21:00:02
1173	67	Sohag Governorate	SHG	2024-09-17 21:00:02	2024-09-17 21:00:02
1174	67	South Sinai Governorate	JS	2024-09-17 21:00:02	2024-09-17 21:00:02
1175	67	Suez Governorate	SUZ	2024-09-17 21:00:02	2024-09-17 21:00:02
1176	68	Ahuachapán Department	AH	2024-09-17 21:00:02	2024-09-17 21:00:02
1177	68	Cabañas Department	CA	2024-09-17 21:00:02	2024-09-17 21:00:02
1178	68	Chalatenango Department	CH	2024-09-17 21:00:02	2024-09-17 21:00:02
1179	68	Cuscatlán Department	CU	2024-09-17 21:00:02	2024-09-17 21:00:02
1180	68	La Libertad Department	LI	2024-09-17 21:00:02	2024-09-17 21:00:02
1181	68	La Paz Department	PA	2024-09-17 21:00:02	2024-09-17 21:00:02
1182	68	La Unión Department	UN	2024-09-17 21:00:02	2024-09-17 21:00:02
1183	68	Morazán Department	MO	2024-09-17 21:00:02	2024-09-17 21:00:02
1184	68	San Miguel Department	SM	2024-09-17 21:00:02	2024-09-17 21:00:02
1185	68	San Salvador Department	SS	2024-09-17 21:00:02	2024-09-17 21:00:02
1186	68	San Vicente Department	SV	2024-09-17 21:00:02	2024-09-17 21:00:02
1187	68	Santa Ana Department	SA	2024-09-17 21:00:02	2024-09-17 21:00:02
1188	68	Sonsonate Department	SO	2024-09-17 21:00:02	2024-09-17 21:00:02
1189	68	Usulután Department	US	2024-09-17 21:00:02	2024-09-17 21:00:02
1190	69	Annobón Province	AN	2024-09-17 21:00:02	2024-09-17 21:00:02
1191	69	Bioko Norte Province	BN	2024-09-17 21:00:02	2024-09-17 21:00:02
1192	69	Bioko Sur Province	BS	2024-09-17 21:00:02	2024-09-17 21:00:02
1193	69	Centro Sur Province	CS	2024-09-17 21:00:02	2024-09-17 21:00:02
1194	69	Insular Region	I	2024-09-17 21:00:02	2024-09-17 21:00:02
1195	69	Kié-Ntem Province	KN	2024-09-17 21:00:02	2024-09-17 21:00:02
1196	69	Litoral Province	LI	2024-09-17 21:00:02	2024-09-17 21:00:02
1197	69	Río Muni	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1198	69	Wele-Nzas Province	WN	2024-09-17 21:00:02	2024-09-17 21:00:02
1199	70	Anseba Region	AN	2024-09-17 21:00:02	2024-09-17 21:00:02
1200	70	Debub Region	DU	2024-09-17 21:00:02	2024-09-17 21:00:02
1201	70	Gash-Barka Region	GB	2024-09-17 21:00:02	2024-09-17 21:00:02
1202	70	Maekel Region	MA	2024-09-17 21:00:02	2024-09-17 21:00:02
1203	70	Northern Red Sea Region	SK	2024-09-17 21:00:02	2024-09-17 21:00:02
1204	70	Southern Red Sea Region	DK	2024-09-17 21:00:02	2024-09-17 21:00:02
1205	71	Harju County	37	2024-09-17 21:00:02	2024-09-17 21:00:02
1206	71	Hiiu County	39	2024-09-17 21:00:02	2024-09-17 21:00:02
1207	71	Ida-Viru County	44	2024-09-17 21:00:02	2024-09-17 21:00:02
1208	71	Järva County	51	2024-09-17 21:00:02	2024-09-17 21:00:02
1209	71	Jõgeva County	49	2024-09-17 21:00:02	2024-09-17 21:00:02
1210	71	Lääne County	57	2024-09-17 21:00:02	2024-09-17 21:00:02
1211	71	Lääne-Viru County	59	2024-09-17 21:00:02	2024-09-17 21:00:02
1212	71	Pärnu County	67	2024-09-17 21:00:02	2024-09-17 21:00:02
1213	71	Põlva County	65	2024-09-17 21:00:02	2024-09-17 21:00:02
1214	71	Rapla County	70	2024-09-17 21:00:02	2024-09-17 21:00:02
1215	71	Saare County	74	2024-09-17 21:00:02	2024-09-17 21:00:02
1216	71	Tartu County	78	2024-09-17 21:00:02	2024-09-17 21:00:02
1217	71	Valga County	82	2024-09-17 21:00:02	2024-09-17 21:00:02
1218	71	Viljandi County	84	2024-09-17 21:00:02	2024-09-17 21:00:02
1219	71	Võru County	86	2024-09-17 21:00:02	2024-09-17 21:00:02
1220	72	Addis Ababa	AA	2024-09-17 21:00:02	2024-09-17 21:00:02
1221	72	Afar Region	AF	2024-09-17 21:00:02	2024-09-17 21:00:02
1222	72	Amhara Region	AM	2024-09-17 21:00:02	2024-09-17 21:00:02
1223	72	Benishangul-Gumuz Region	BE	2024-09-17 21:00:02	2024-09-17 21:00:02
1224	72	Dire Dawa	DD	2024-09-17 21:00:02	2024-09-17 21:00:02
1225	72	Gambela Region	GA	2024-09-17 21:00:02	2024-09-17 21:00:02
1226	72	Harari Region	HA	2024-09-17 21:00:02	2024-09-17 21:00:02
1227	72	Oromia Region	OR	2024-09-17 21:00:02	2024-09-17 21:00:02
1228	72	Somali Region	SO	2024-09-17 21:00:02	2024-09-17 21:00:02
1229	72	Southern Nations, Nationalities, and Peoples' Region	SN	2024-09-17 21:00:02	2024-09-17 21:00:02
1230	72	Tigray Region	TI	2024-09-17 21:00:02	2024-09-17 21:00:02
1231	75	Ba	01	2024-09-17 21:00:02	2024-09-17 21:00:02
1232	75	Bua	02	2024-09-17 21:00:02	2024-09-17 21:00:02
1233	75	Cakaudrove	03	2024-09-17 21:00:02	2024-09-17 21:00:02
1234	75	Central Division	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1235	75	Eastern Division	E	2024-09-17 21:00:02	2024-09-17 21:00:02
1236	75	Kadavu	04	2024-09-17 21:00:02	2024-09-17 21:00:02
1237	75	Lau	05	2024-09-17 21:00:02	2024-09-17 21:00:02
1238	75	Lomaiviti	06	2024-09-17 21:00:02	2024-09-17 21:00:02
1239	75	Macuata	07	2024-09-17 21:00:02	2024-09-17 21:00:02
1240	75	Nadroga-Navosa	08	2024-09-17 21:00:02	2024-09-17 21:00:02
1241	75	Naitasiri	09	2024-09-17 21:00:02	2024-09-17 21:00:02
1242	75	Namosi	10	2024-09-17 21:00:02	2024-09-17 21:00:02
1243	75	Northern Division	N	2024-09-17 21:00:02	2024-09-17 21:00:02
1244	75	Ra	11	2024-09-17 21:00:02	2024-09-17 21:00:02
1245	75	Rewa	12	2024-09-17 21:00:02	2024-09-17 21:00:02
1246	75	Rotuma	R	2024-09-17 21:00:02	2024-09-17 21:00:02
1247	75	Serua	13	2024-09-17 21:00:02	2024-09-17 21:00:02
1248	75	Tailevu	14	2024-09-17 21:00:02	2024-09-17 21:00:02
1249	75	Western Division	W	2024-09-17 21:00:02	2024-09-17 21:00:02
1250	76	Åland Islands	01	2024-09-17 21:00:02	2024-09-17 21:00:02
1251	76	Central Finland	08	2024-09-17 21:00:02	2024-09-17 21:00:02
1252	76	Central Ostrobothnia	07	2024-09-17 21:00:02	2024-09-17 21:00:02
1253	76	Eastern Finland Province	IS	2024-09-17 21:00:02	2024-09-17 21:00:02
1254	76	Finland Proper	19	2024-09-17 21:00:02	2024-09-17 21:00:02
1255	76	Kainuu	05	2024-09-17 21:00:02	2024-09-17 21:00:02
1256	76	Kymenlaakso	09	2024-09-17 21:00:02	2024-09-17 21:00:02
1257	76	Lapland	LL	2024-09-17 21:00:02	2024-09-17 21:00:02
1258	76	North Karelia	13	2024-09-17 21:00:02	2024-09-17 21:00:02
1259	76	Northern Ostrobothnia	14	2024-09-17 21:00:02	2024-09-17 21:00:02
1260	76	Northern Savonia	15	2024-09-17 21:00:02	2024-09-17 21:00:02
1261	76	Ostrobothnia	12	2024-09-17 21:00:02	2024-09-17 21:00:02
1262	76	Oulu Province	OL	2024-09-17 21:00:02	2024-09-17 21:00:02
1263	76	Päijänne Tavastia	16	2024-09-17 21:00:02	2024-09-17 21:00:02
1264	76	Pirkanmaa	11	2024-09-17 21:00:02	2024-09-17 21:00:02
1265	76	Satakunta	17	2024-09-17 21:00:02	2024-09-17 21:00:02
1266	76	South Karelia	02	2024-09-17 21:00:02	2024-09-17 21:00:02
1267	76	Southern Ostrobothnia	03	2024-09-17 21:00:02	2024-09-17 21:00:02
1268	76	Southern Savonia	04	2024-09-17 21:00:02	2024-09-17 21:00:02
1269	76	Tavastia Proper	06	2024-09-17 21:00:02	2024-09-17 21:00:02
1270	76	Uusimaa	18	2024-09-17 21:00:02	2024-09-17 21:00:02
1271	77	Alo	WF-AL	2024-09-17 21:00:02	2024-09-17 21:00:02
1272	77	Alsace	A	2024-09-17 21:00:02	2024-09-17 21:00:02
1273	77	Aquitaine	B	2024-09-17 21:00:02	2024-09-17 21:00:02
1274	77	Auvergne	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1275	77	Auvergne-Rhône-Alpes	ARA	2024-09-17 21:00:02	2024-09-17 21:00:02
1276	77	Bourgogne-Franche-Comté	BFC	2024-09-17 21:00:02	2024-09-17 21:00:02
1277	77	Brittany	BRE	2024-09-17 21:00:02	2024-09-17 21:00:02
1278	77	Burgundy	D	2024-09-17 21:00:02	2024-09-17 21:00:02
1279	77	Centre-Val de Loire	CVL	2024-09-17 21:00:02	2024-09-17 21:00:02
1280	77	Champagne-Ardenne	G	2024-09-17 21:00:02	2024-09-17 21:00:02
1281	77	Corsica	COR	2024-09-17 21:00:02	2024-09-17 21:00:02
1282	77	Franche-Comté	I	2024-09-17 21:00:02	2024-09-17 21:00:02
1283	77	French Guiana	GF	2024-09-17 21:00:02	2024-09-17 21:00:02
1284	77	French Polynesia	PF	2024-09-17 21:00:02	2024-09-17 21:00:02
1285	77	Grand Est	GES	2024-09-17 21:00:02	2024-09-17 21:00:02
1286	77	Guadeloupe	GP	2024-09-17 21:00:02	2024-09-17 21:00:02
1287	77	Hauts-de-France	HDF	2024-09-17 21:00:02	2024-09-17 21:00:02
1288	77	Île-de-France	IDF	2024-09-17 21:00:02	2024-09-17 21:00:02
1289	77	Languedoc-Roussillon	K	2024-09-17 21:00:02	2024-09-17 21:00:02
1290	77	Limousin	L	2024-09-17 21:00:02	2024-09-17 21:00:02
1291	77	Lorraine	M	2024-09-17 21:00:02	2024-09-17 21:00:02
1292	77	Lower Normandy	P	2024-09-17 21:00:02	2024-09-17 21:00:02
1293	77	Martinique	MQ	2024-09-17 21:00:02	2024-09-17 21:00:02
1294	77	Mayotte	YT	2024-09-17 21:00:02	2024-09-17 21:00:02
1295	77	Nord-Pas-de-Calais	O	2024-09-17 21:00:02	2024-09-17 21:00:02
1296	77	Normandy	NOR	2024-09-17 21:00:02	2024-09-17 21:00:02
1297	77	Nouvelle-Aquitaine	NAQ	2024-09-17 21:00:02	2024-09-17 21:00:02
1298	77	Occitania	OCC	2024-09-17 21:00:02	2024-09-17 21:00:02
1299	77	Paris	75	2024-09-17 21:00:02	2024-09-17 21:00:02
1300	77	Pays de la Loire	PDL	2024-09-17 21:00:02	2024-09-17 21:00:02
1301	77	Picardy	S	2024-09-17 21:00:02	2024-09-17 21:00:02
1302	77	Poitou-Charentes	T	2024-09-17 21:00:02	2024-09-17 21:00:02
1303	77	Provence-Alpes-Côte d'Azur	PAC	2024-09-17 21:00:02	2024-09-17 21:00:02
1304	77	Réunion	RE	2024-09-17 21:00:02	2024-09-17 21:00:02
1305	77	Rhône-Alpes	V	2024-09-17 21:00:02	2024-09-17 21:00:02
1306	77	Saint Barthélemy	BL	2024-09-17 21:00:02	2024-09-17 21:00:02
1307	77	Saint Martin	MF	2024-09-17 21:00:02	2024-09-17 21:00:02
1308	77	Saint Pierre and Miquelon	PM	2024-09-17 21:00:02	2024-09-17 21:00:02
1309	77	Sigave	WF-SG	2024-09-17 21:00:02	2024-09-17 21:00:02
1310	77	Upper Normandy	Q	2024-09-17 21:00:02	2024-09-17 21:00:02
1311	77	Uvea	WF-UV	2024-09-17 21:00:02	2024-09-17 21:00:02
1312	77	Wallis and Futuna	WF	2024-09-17 21:00:02	2024-09-17 21:00:02
1313	81	Estuaire Province	1	2024-09-17 21:00:02	2024-09-17 21:00:02
1314	81	Haut-Ogooué Province	2	2024-09-17 21:00:02	2024-09-17 21:00:02
1315	81	Moyen-Ogooué Province	3	2024-09-17 21:00:02	2024-09-17 21:00:02
1316	81	Ngounié Province	4	2024-09-17 21:00:02	2024-09-17 21:00:02
1317	81	Nyanga Province	5	2024-09-17 21:00:02	2024-09-17 21:00:02
1318	81	Ogooué-Ivindo Province	6	2024-09-17 21:00:02	2024-09-17 21:00:02
1319	81	Ogooué-Lolo Province	7	2024-09-17 21:00:02	2024-09-17 21:00:02
1320	81	Ogooué-Maritime Province	8	2024-09-17 21:00:02	2024-09-17 21:00:02
1321	81	Woleu-Ntem Province	9	2024-09-17 21:00:02	2024-09-17 21:00:02
1322	82	Banjul	B	2024-09-17 21:00:02	2024-09-17 21:00:02
1323	82	Central River Division	M	2024-09-17 21:00:02	2024-09-17 21:00:02
1324	82	Lower River Division	L	2024-09-17 21:00:02	2024-09-17 21:00:02
1325	82	North Bank Division	N	2024-09-17 21:00:02	2024-09-17 21:00:02
1326	82	Upper River Division	U	2024-09-17 21:00:02	2024-09-17 21:00:02
1327	82	West Coast Division	W	2024-09-17 21:00:02	2024-09-17 21:00:02
1328	83	Adjara	AJ	2024-09-17 21:00:02	2024-09-17 21:00:02
1329	83	Autonomous Republic of Abkhazia	AB	2024-09-17 21:00:02	2024-09-17 21:00:02
1330	83	Guria	GU	2024-09-17 21:00:02	2024-09-17 21:00:02
1331	83	Imereti	IM	2024-09-17 21:00:02	2024-09-17 21:00:02
1332	83	Kakheti	KA	2024-09-17 21:00:02	2024-09-17 21:00:02
1333	83	Khelvachauri Municipality	29	2024-09-17 21:00:02	2024-09-17 21:00:02
1334	83	Kvemo Kartli	KK	2024-09-17 21:00:02	2024-09-17 21:00:02
1335	83	Mtskheta-Mtianeti	MM	2024-09-17 21:00:02	2024-09-17 21:00:02
1336	83	Racha-Lechkhumi and Kvemo Svaneti	RL	2024-09-17 21:00:02	2024-09-17 21:00:02
1337	83	Samegrelo-Zemo Svaneti	SZ	2024-09-17 21:00:02	2024-09-17 21:00:02
1338	83	Samtskhe-Javakheti	SJ	2024-09-17 21:00:02	2024-09-17 21:00:02
1339	83	Senaki Municipality	50	2024-09-17 21:00:02	2024-09-17 21:00:02
1340	83	Shida Kartli	SK	2024-09-17 21:00:02	2024-09-17 21:00:02
1341	83	Tbilisi	TB	2024-09-17 21:00:02	2024-09-17 21:00:02
1342	84	Baden-Württemberg	BW	2024-09-17 21:00:02	2024-09-17 21:00:02
1343	84	Bavaria	BY	2024-09-17 21:00:02	2024-09-17 21:00:02
1344	84	Berlin	BE	2024-09-17 21:00:02	2024-09-17 21:00:02
1345	84	Brandenburg	BB	2024-09-17 21:00:02	2024-09-17 21:00:02
1346	84	Bremen	HB	2024-09-17 21:00:02	2024-09-17 21:00:02
1347	84	Hamburg	HH	2024-09-17 21:00:02	2024-09-17 21:00:02
1348	84	Hesse	HE	2024-09-17 21:00:02	2024-09-17 21:00:02
1349	84	Lower Saxony	NI	2024-09-17 21:00:02	2024-09-17 21:00:02
1350	84	Mecklenburg-Vorpommern	MV	2024-09-17 21:00:02	2024-09-17 21:00:02
1351	84	North Rhine-Westphalia	NW	2024-09-17 21:00:02	2024-09-17 21:00:02
1352	84	Rhineland-Palatinate	RP	2024-09-17 21:00:02	2024-09-17 21:00:02
1353	84	Saarland	SL	2024-09-17 21:00:02	2024-09-17 21:00:02
1354	84	Saxony	SN	2024-09-17 21:00:02	2024-09-17 21:00:02
1355	84	Saxony-Anhalt	ST	2024-09-17 21:00:02	2024-09-17 21:00:02
1356	84	Schleswig-Holstein	SH	2024-09-17 21:00:02	2024-09-17 21:00:02
1357	84	Thuringia	TH	2024-09-17 21:00:02	2024-09-17 21:00:02
1358	85	Ahafo	AF	2024-09-17 21:00:02	2024-09-17 21:00:02
1359	85	Ashanti	AH	2024-09-17 21:00:02	2024-09-17 21:00:02
1360	85	Bono	BO	2024-09-17 21:00:02	2024-09-17 21:00:02
1361	85	Bono East	BE	2024-09-17 21:00:02	2024-09-17 21:00:02
1362	85	Central	CP	2024-09-17 21:00:02	2024-09-17 21:00:02
1363	85	Eastern	EP	2024-09-17 21:00:02	2024-09-17 21:00:02
1364	85	Greater Accra	AA	2024-09-17 21:00:02	2024-09-17 21:00:02
1365	85	North East	NE	2024-09-17 21:00:02	2024-09-17 21:00:02
1366	85	Northern	NP	2024-09-17 21:00:02	2024-09-17 21:00:02
1367	85	Oti	OT	2024-09-17 21:00:02	2024-09-17 21:00:02
1368	85	Savannah	SV	2024-09-17 21:00:02	2024-09-17 21:00:02
1369	85	Upper East	UE	2024-09-17 21:00:02	2024-09-17 21:00:02
1370	85	Upper West	UW	2024-09-17 21:00:02	2024-09-17 21:00:02
1371	85	Volta	TV	2024-09-17 21:00:02	2024-09-17 21:00:02
1372	85	Western	WP	2024-09-17 21:00:02	2024-09-17 21:00:02
1373	85	Western North	WN	2024-09-17 21:00:02	2024-09-17 21:00:02
1374	87	Achaea Regional Unit	13	2024-09-17 21:00:02	2024-09-17 21:00:02
1375	87	Aetolia-Acarnania Regional Unit	01	2024-09-17 21:00:02	2024-09-17 21:00:02
1376	87	Arcadia Prefecture	12	2024-09-17 21:00:02	2024-09-17 21:00:02
1377	87	Argolis Regional Unit	11	2024-09-17 21:00:02	2024-09-17 21:00:02
1378	87	Attica Region	I	2024-09-17 21:00:02	2024-09-17 21:00:02
1379	87	Boeotia Regional Unit	03	2024-09-17 21:00:02	2024-09-17 21:00:02
1380	87	Central Greece Region	H	2024-09-17 21:00:02	2024-09-17 21:00:02
1381	87	Central Macedonia	B	2024-09-17 21:00:02	2024-09-17 21:00:02
1382	87	Chania Regional Unit	94	2024-09-17 21:00:02	2024-09-17 21:00:02
1383	87	Corfu Prefecture	22	2024-09-17 21:00:02	2024-09-17 21:00:02
1384	87	Corinthia Regional Unit	15	2024-09-17 21:00:02	2024-09-17 21:00:02
1385	87	Crete Region	M	2024-09-17 21:00:02	2024-09-17 21:00:02
1386	87	Drama Regional Unit	52	2024-09-17 21:00:02	2024-09-17 21:00:02
1387	87	East Attica Regional Unit	A2	2024-09-17 21:00:02	2024-09-17 21:00:02
1388	87	East Macedonia and Thrace	A	2024-09-17 21:00:02	2024-09-17 21:00:02
1389	87	Epirus Region	D	2024-09-17 21:00:02	2024-09-17 21:00:02
1390	87	Euboea	04	2024-09-17 21:00:02	2024-09-17 21:00:02
1391	87	Grevena Prefecture	51	2024-09-17 21:00:02	2024-09-17 21:00:02
1392	87	Imathia Regional Unit	53	2024-09-17 21:00:02	2024-09-17 21:00:02
1393	87	Ioannina Regional Unit	33	2024-09-17 21:00:02	2024-09-17 21:00:02
1394	87	Ionian Islands Region	F	2024-09-17 21:00:02	2024-09-17 21:00:02
1395	87	Karditsa Regional Unit	41	2024-09-17 21:00:02	2024-09-17 21:00:02
1396	87	Kastoria Regional Unit	56	2024-09-17 21:00:02	2024-09-17 21:00:02
1397	87	Kefalonia Prefecture	23	2024-09-17 21:00:02	2024-09-17 21:00:02
1398	87	Kilkis Regional Unit	57	2024-09-17 21:00:02	2024-09-17 21:00:02
1399	87	Kozani Prefecture	58	2024-09-17 21:00:02	2024-09-17 21:00:02
1400	87	Laconia	16	2024-09-17 21:00:02	2024-09-17 21:00:02
1401	87	Larissa Prefecture	42	2024-09-17 21:00:02	2024-09-17 21:00:02
1402	87	Lefkada Regional Unit	24	2024-09-17 21:00:02	2024-09-17 21:00:02
1403	87	Pella Regional Unit	59	2024-09-17 21:00:02	2024-09-17 21:00:02
1404	87	Peloponnese Region	J	2024-09-17 21:00:02	2024-09-17 21:00:02
1405	87	Phthiotis Prefecture	06	2024-09-17 21:00:02	2024-09-17 21:00:02
1406	87	Preveza Prefecture	34	2024-09-17 21:00:02	2024-09-17 21:00:02
1407	87	Serres Prefecture	62	2024-09-17 21:00:02	2024-09-17 21:00:02
1408	87	South Aegean	L	2024-09-17 21:00:02	2024-09-17 21:00:02
1409	87	Thessaloniki Regional Unit	54	2024-09-17 21:00:02	2024-09-17 21:00:02
1410	87	West Greece Region	G	2024-09-17 21:00:02	2024-09-17 21:00:02
1411	87	West Macedonia Region	C	2024-09-17 21:00:02	2024-09-17 21:00:02
1412	89	Carriacou and Petite Martinique	10	2024-09-17 21:00:03	2024-09-17 21:00:03
1413	89	Saint Andrew Parish	01	2024-09-17 21:00:03	2024-09-17 21:00:03
1414	89	Saint David Parish	02	2024-09-17 21:00:03	2024-09-17 21:00:03
1415	89	Saint George Parish	03	2024-09-17 21:00:03	2024-09-17 21:00:03
1416	89	Saint John Parish	04	2024-09-17 21:00:03	2024-09-17 21:00:03
1417	89	Saint Mark Parish	05	2024-09-17 21:00:03	2024-09-17 21:00:03
1418	89	Saint Patrick Parish	06	2024-09-17 21:00:03	2024-09-17 21:00:03
1419	92	Alta Verapaz Department	AV	2024-09-17 21:00:03	2024-09-17 21:00:03
1420	92	Baja Verapaz Department	BV	2024-09-17 21:00:03	2024-09-17 21:00:03
1421	92	Chimaltenango Department	CM	2024-09-17 21:00:03	2024-09-17 21:00:03
1422	92	Chiquimula Department	CQ	2024-09-17 21:00:03	2024-09-17 21:00:03
1423	92	El Progreso Department	PR	2024-09-17 21:00:03	2024-09-17 21:00:03
1424	92	Escuintla Department	ES	2024-09-17 21:00:03	2024-09-17 21:00:03
1425	92	Guatemala Department	GU	2024-09-17 21:00:03	2024-09-17 21:00:03
1426	92	Huehuetenango Department	HU	2024-09-17 21:00:03	2024-09-17 21:00:03
1427	92	Izabal Department	IZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1428	92	Jalapa Department	JA	2024-09-17 21:00:03	2024-09-17 21:00:03
1429	92	Jutiapa Department	JU	2024-09-17 21:00:03	2024-09-17 21:00:03
1430	92	Petén Department	PE	2024-09-17 21:00:03	2024-09-17 21:00:03
1431	92	Quetzaltenango Department	QZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1432	92	Quiché Department	QC	2024-09-17 21:00:03	2024-09-17 21:00:03
1433	92	Retalhuleu Department	RE	2024-09-17 21:00:03	2024-09-17 21:00:03
1434	92	Sacatepéquez Department	SA	2024-09-17 21:00:03	2024-09-17 21:00:03
1435	92	San Marcos Department	SM	2024-09-17 21:00:03	2024-09-17 21:00:03
1436	92	Santa Rosa Department	SR	2024-09-17 21:00:03	2024-09-17 21:00:03
1437	92	Sololá Department	SO	2024-09-17 21:00:03	2024-09-17 21:00:03
1438	92	Suchitepéquez Department	SU	2024-09-17 21:00:03	2024-09-17 21:00:03
1439	92	Totonicapán Department	TO	2024-09-17 21:00:03	2024-09-17 21:00:03
1440	94	Beyla Prefecture	BE	2024-09-17 21:00:03	2024-09-17 21:00:03
1441	94	Boffa Prefecture	BF	2024-09-17 21:00:03	2024-09-17 21:00:03
1442	94	Boké Prefecture	BK	2024-09-17 21:00:03	2024-09-17 21:00:03
1443	94	Boké Region	B	2024-09-17 21:00:03	2024-09-17 21:00:03
1444	94	Conakry	C	2024-09-17 21:00:03	2024-09-17 21:00:03
1445	94	Coyah Prefecture	CO	2024-09-17 21:00:03	2024-09-17 21:00:03
1446	94	Dabola Prefecture	DB	2024-09-17 21:00:03	2024-09-17 21:00:03
1447	94	Dalaba Prefecture	DL	2024-09-17 21:00:03	2024-09-17 21:00:03
1448	94	Dinguiraye Prefecture	DI	2024-09-17 21:00:03	2024-09-17 21:00:03
1449	94	Dubréka Prefecture	DU	2024-09-17 21:00:03	2024-09-17 21:00:03
1450	94	Faranah Prefecture	FA	2024-09-17 21:00:03	2024-09-17 21:00:03
1451	94	Forécariah Prefecture	FO	2024-09-17 21:00:03	2024-09-17 21:00:03
1452	94	Fria Prefecture	FR	2024-09-17 21:00:03	2024-09-17 21:00:03
1453	94	Gaoual Prefecture	GA	2024-09-17 21:00:03	2024-09-17 21:00:03
1454	94	Guéckédou Prefecture	GU	2024-09-17 21:00:03	2024-09-17 21:00:03
1455	94	Kankan Prefecture	KA	2024-09-17 21:00:03	2024-09-17 21:00:03
1456	94	Kankan Region	K	2024-09-17 21:00:03	2024-09-17 21:00:03
1457	94	Kérouané Prefecture	KE	2024-09-17 21:00:03	2024-09-17 21:00:03
1458	94	Kindia Prefecture	KD	2024-09-17 21:00:03	2024-09-17 21:00:03
1459	94	Kindia Region	D	2024-09-17 21:00:03	2024-09-17 21:00:03
1460	94	Kissidougou Prefecture	KS	2024-09-17 21:00:03	2024-09-17 21:00:03
1461	94	Koubia Prefecture	KB	2024-09-17 21:00:03	2024-09-17 21:00:03
1462	94	Koundara Prefecture	KN	2024-09-17 21:00:03	2024-09-17 21:00:03
1463	94	Kouroussa Prefecture	KO	2024-09-17 21:00:03	2024-09-17 21:00:03
1464	94	Labé Prefecture	LA	2024-09-17 21:00:03	2024-09-17 21:00:03
1465	94	Labé Region	L	2024-09-17 21:00:03	2024-09-17 21:00:03
1466	94	Lélouma Prefecture	LE	2024-09-17 21:00:03	2024-09-17 21:00:03
1467	94	Lola Prefecture	LO	2024-09-17 21:00:03	2024-09-17 21:00:03
1468	94	Macenta Prefecture	MC	2024-09-17 21:00:03	2024-09-17 21:00:03
1469	94	Mali Prefecture	ML	2024-09-17 21:00:03	2024-09-17 21:00:03
1470	94	Mamou Prefecture	MM	2024-09-17 21:00:03	2024-09-17 21:00:03
1471	94	Mamou Region	M	2024-09-17 21:00:03	2024-09-17 21:00:03
1472	94	Mandiana Prefecture	MD	2024-09-17 21:00:03	2024-09-17 21:00:03
1473	94	Nzérékoré Prefecture	NZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1474	94	Nzérékoré Region	N	2024-09-17 21:00:03	2024-09-17 21:00:03
1475	94	Pita Prefecture	PI	2024-09-17 21:00:03	2024-09-17 21:00:03
1476	94	Siguiri Prefecture	SI	2024-09-17 21:00:03	2024-09-17 21:00:03
1477	94	Télimélé Prefecture	TE	2024-09-17 21:00:03	2024-09-17 21:00:03
1478	94	Tougué Prefecture	TO	2024-09-17 21:00:03	2024-09-17 21:00:03
1479	94	Yomou Prefecture	YO	2024-09-17 21:00:03	2024-09-17 21:00:03
1480	95	Bafatá	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1481	95	Biombo Region	BM	2024-09-17 21:00:03	2024-09-17 21:00:03
1482	95	Bolama Region	BL	2024-09-17 21:00:03	2024-09-17 21:00:03
1483	95	Cacheu Region	CA	2024-09-17 21:00:03	2024-09-17 21:00:03
1484	95	Gabú Region	GA	2024-09-17 21:00:03	2024-09-17 21:00:03
1485	95	Leste Province	L	2024-09-17 21:00:03	2024-09-17 21:00:03
1486	95	Norte Province	N	2024-09-17 21:00:03	2024-09-17 21:00:03
1487	95	Oio Region	OI	2024-09-17 21:00:03	2024-09-17 21:00:03
1488	95	Quinara Region	QU	2024-09-17 21:00:03	2024-09-17 21:00:03
1489	95	Sul Province	S	2024-09-17 21:00:03	2024-09-17 21:00:03
1490	95	Tombali Region	TO	2024-09-17 21:00:03	2024-09-17 21:00:03
1491	96	Barima-Waini	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1492	96	Cuyuni-Mazaruni	CU	2024-09-17 21:00:03	2024-09-17 21:00:03
1493	96	Demerara-Mahaica	DE	2024-09-17 21:00:03	2024-09-17 21:00:03
1494	96	East Berbice-Corentyne	EB	2024-09-17 21:00:03	2024-09-17 21:00:03
1495	96	Essequibo Islands-West Demerara	ES	2024-09-17 21:00:03	2024-09-17 21:00:03
1496	96	Mahaica-Berbice	MA	2024-09-17 21:00:03	2024-09-17 21:00:03
1497	96	Pomeroon-Supenaam	PM	2024-09-17 21:00:03	2024-09-17 21:00:03
1498	96	Potaro-Siparuni	PT	2024-09-17 21:00:03	2024-09-17 21:00:03
1499	96	Upper Demerara-Berbice	UD	2024-09-17 21:00:03	2024-09-17 21:00:03
1500	96	Upper Takutu-Upper Essequibo	UT	2024-09-17 21:00:03	2024-09-17 21:00:03
1501	97	Artibonite	AR	2024-09-17 21:00:03	2024-09-17 21:00:03
1502	97	Centre	CE	2024-09-17 21:00:03	2024-09-17 21:00:03
1503	97	Grand'Anse	GA	2024-09-17 21:00:03	2024-09-17 21:00:03
1504	97	Nippes	NI	2024-09-17 21:00:03	2024-09-17 21:00:03
1505	97	Nord	ND	2024-09-17 21:00:03	2024-09-17 21:00:03
1506	97	Nord-Est	NE	2024-09-17 21:00:03	2024-09-17 21:00:03
1507	97	Nord-Ouest	NO	2024-09-17 21:00:03	2024-09-17 21:00:03
1508	97	Ouest	OU	2024-09-17 21:00:03	2024-09-17 21:00:03
1509	97	Sud	SD	2024-09-17 21:00:03	2024-09-17 21:00:03
1510	97	Sud-Est	SE	2024-09-17 21:00:03	2024-09-17 21:00:03
1511	99	Atlántida Department	AT	2024-09-17 21:00:03	2024-09-17 21:00:03
1512	99	Bay Islands Department	IB	2024-09-17 21:00:03	2024-09-17 21:00:03
1513	99	Choluteca Department	CH	2024-09-17 21:00:03	2024-09-17 21:00:03
1514	99	Colón Department	CL	2024-09-17 21:00:03	2024-09-17 21:00:03
1515	99	Comayagua Department	CM	2024-09-17 21:00:03	2024-09-17 21:00:03
1516	99	Copán Department	CP	2024-09-17 21:00:03	2024-09-17 21:00:03
1517	99	Cortés Department	CR	2024-09-17 21:00:03	2024-09-17 21:00:03
1518	99	El Paraíso Department	EP	2024-09-17 21:00:03	2024-09-17 21:00:03
1519	99	Francisco Morazán Department	FM	2024-09-17 21:00:03	2024-09-17 21:00:03
1520	99	Gracias a Dios Department	GD	2024-09-17 21:00:03	2024-09-17 21:00:03
1521	99	Intibucá Department	IN	2024-09-17 21:00:03	2024-09-17 21:00:03
1522	99	La Paz Department	LP	2024-09-17 21:00:03	2024-09-17 21:00:03
1523	99	Lempira Department	LE	2024-09-17 21:00:03	2024-09-17 21:00:03
1524	99	Ocotepeque Department	OC	2024-09-17 21:00:03	2024-09-17 21:00:03
1525	99	Olancho Department	OL	2024-09-17 21:00:03	2024-09-17 21:00:03
1526	99	Santa Bárbara Department	SB	2024-09-17 21:00:03	2024-09-17 21:00:03
1527	99	Valle Department	VA	2024-09-17 21:00:03	2024-09-17 21:00:03
1528	99	Yoro Department	YO	2024-09-17 21:00:03	2024-09-17 21:00:03
1529	100	Central and Western District	HCW	2024-09-17 21:00:03	2024-09-17 21:00:03
1530	100	Eastern	HEA	2024-09-17 21:00:03	2024-09-17 21:00:03
1531	100	Islands District	NIS	2024-09-17 21:00:03	2024-09-17 21:00:03
1532	100	Kowloon City	KKC	2024-09-17 21:00:03	2024-09-17 21:00:03
1533	100	Kwai Tsing	NKT	2024-09-17 21:00:03	2024-09-17 21:00:03
1534	100	Kwun Tong	KKT	2024-09-17 21:00:03	2024-09-17 21:00:03
1535	100	North	NNO	2024-09-17 21:00:03	2024-09-17 21:00:03
1536	100	Sai Kung District	NSK	2024-09-17 21:00:03	2024-09-17 21:00:03
1537	100	Sha Tin	NST	2024-09-17 21:00:03	2024-09-17 21:00:03
1538	100	Sham Shui Po	KSS	2024-09-17 21:00:03	2024-09-17 21:00:03
1539	100	Southern	HSO	2024-09-17 21:00:03	2024-09-17 21:00:03
1540	100	Tai Po District	NTP	2024-09-17 21:00:03	2024-09-17 21:00:03
1541	100	Tsuen Wan District	NTW	2024-09-17 21:00:03	2024-09-17 21:00:03
1542	100	Tuen Mun	NTM	2024-09-17 21:00:03	2024-09-17 21:00:03
1543	100	Wan Chai	HWC	2024-09-17 21:00:03	2024-09-17 21:00:03
1544	100	Wong Tai Sin	KWT	2024-09-17 21:00:03	2024-09-17 21:00:03
1545	100	Yau Tsim Mong	KYT	2024-09-17 21:00:03	2024-09-17 21:00:03
1546	100	Yuen Long District	NYL	2024-09-17 21:00:03	2024-09-17 21:00:03
1547	101	Bács-Kiskun County	BK	2024-09-17 21:00:03	2024-09-17 21:00:03
1548	101	Baranya County	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1549	101	Békés County	BE	2024-09-17 21:00:03	2024-09-17 21:00:03
1550	101	Békéscsaba	BC	2024-09-17 21:00:03	2024-09-17 21:00:03
1551	101	Borsod-Abaúj-Zemplén County	BZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1552	101	Budapest	BU	2024-09-17 21:00:03	2024-09-17 21:00:03
1553	101	Csongrád County	CS	2024-09-17 21:00:03	2024-09-17 21:00:03
1554	101	Debrecen	DE	2024-09-17 21:00:03	2024-09-17 21:00:03
1555	101	Dunaújváros	DU	2024-09-17 21:00:03	2024-09-17 21:00:03
1556	101	Eger	EG	2024-09-17 21:00:03	2024-09-17 21:00:03
1557	101	Érd	ER	2024-09-17 21:00:03	2024-09-17 21:00:03
1558	101	Fejér County	FE	2024-09-17 21:00:03	2024-09-17 21:00:03
1559	101	Győr	GY	2024-09-17 21:00:03	2024-09-17 21:00:03
1560	101	Győr-Moson-Sopron County	GS	2024-09-17 21:00:03	2024-09-17 21:00:03
1561	101	Hajdú-Bihar County	HB	2024-09-17 21:00:03	2024-09-17 21:00:03
1562	101	Heves County	HE	2024-09-17 21:00:03	2024-09-17 21:00:03
1563	101	Hódmezővásárhely	HV	2024-09-17 21:00:03	2024-09-17 21:00:03
1564	101	Jász-Nagykun-Szolnok County	JN	2024-09-17 21:00:03	2024-09-17 21:00:03
1565	101	Kaposvár	KV	2024-09-17 21:00:03	2024-09-17 21:00:03
1566	101	Kecskemét	KM	2024-09-17 21:00:03	2024-09-17 21:00:03
1567	101	Miskolc	MI	2024-09-17 21:00:03	2024-09-17 21:00:03
1568	101	Nagykanizsa	NK	2024-09-17 21:00:03	2024-09-17 21:00:03
1569	101	Nógrád County	NO	2024-09-17 21:00:03	2024-09-17 21:00:03
1570	101	Nyíregyháza	NY	2024-09-17 21:00:03	2024-09-17 21:00:03
1571	101	Pécs	PS	2024-09-17 21:00:03	2024-09-17 21:00:03
1572	101	Pest County	PE	2024-09-17 21:00:03	2024-09-17 21:00:03
1573	101	Salgótarján	ST	2024-09-17 21:00:03	2024-09-17 21:00:03
1574	101	Somogy County	SO	2024-09-17 21:00:03	2024-09-17 21:00:03
1575	101	Sopron	SN	2024-09-17 21:00:03	2024-09-17 21:00:03
1576	101	Szabolcs-Szatmár-Bereg County	SZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1577	101	Szeged	SD	2024-09-17 21:00:03	2024-09-17 21:00:03
1578	101	Székesfehérvár	SF	2024-09-17 21:00:03	2024-09-17 21:00:03
1579	101	Szekszárd	SS	2024-09-17 21:00:03	2024-09-17 21:00:03
1580	101	Szolnok	SK	2024-09-17 21:00:03	2024-09-17 21:00:03
1581	101	Szombathely	SH	2024-09-17 21:00:03	2024-09-17 21:00:03
1582	101	Tatabánya	TB	2024-09-17 21:00:03	2024-09-17 21:00:03
1583	101	Tolna County	TO	2024-09-17 21:00:03	2024-09-17 21:00:03
1584	101	Vas County	VA	2024-09-17 21:00:03	2024-09-17 21:00:03
1585	101	Veszprém	VM	2024-09-17 21:00:03	2024-09-17 21:00:03
1586	101	Veszprém County	VE	2024-09-17 21:00:03	2024-09-17 21:00:03
1587	101	Zala County	ZA	2024-09-17 21:00:03	2024-09-17 21:00:03
1588	101	Zalaegerszeg	ZE	2024-09-17 21:00:03	2024-09-17 21:00:03
1589	102	Capital Region	1	2024-09-17 21:00:03	2024-09-17 21:00:03
1590	102	Eastern Region	7	2024-09-17 21:00:03	2024-09-17 21:00:03
1591	102	Northeastern Region	6	2024-09-17 21:00:03	2024-09-17 21:00:03
1592	102	Northwestern Region	5	2024-09-17 21:00:03	2024-09-17 21:00:03
1593	102	Southern Peninsula Region	2	2024-09-17 21:00:03	2024-09-17 21:00:03
1594	102	Southern Region	8	2024-09-17 21:00:03	2024-09-17 21:00:03
1595	102	Western Region	3	2024-09-17 21:00:03	2024-09-17 21:00:03
1596	102	Westfjords	4	2024-09-17 21:00:03	2024-09-17 21:00:03
1597	103	Andaman and Nicobar Islands	AN	2024-09-17 21:00:03	2024-09-17 21:00:03
1598	103	Andhra Pradesh	AP	2024-09-17 21:00:03	2024-09-17 21:00:03
1599	103	Arunachal Pradesh	AR	2024-09-17 21:00:03	2024-09-17 21:00:03
1600	103	Assam	AS	2024-09-17 21:00:03	2024-09-17 21:00:03
1601	103	Bihar	BR	2024-09-17 21:00:03	2024-09-17 21:00:03
1602	103	Chandigarh	CH	2024-09-17 21:00:03	2024-09-17 21:00:03
1603	103	Chhattisgarh	CT	2024-09-17 21:00:03	2024-09-17 21:00:03
1604	103	Dadra and Nagar Haveli and Daman and Diu	DH	2024-09-17 21:00:03	2024-09-17 21:00:03
1605	103	Delhi	DL	2024-09-17 21:00:03	2024-09-17 21:00:03
1606	103	Goa	GA	2024-09-17 21:00:03	2024-09-17 21:00:03
1607	103	Gujarat	GJ	2024-09-17 21:00:03	2024-09-17 21:00:03
1608	103	Haryana	HR	2024-09-17 21:00:03	2024-09-17 21:00:03
1609	103	Himachal Pradesh	HP	2024-09-17 21:00:03	2024-09-17 21:00:03
1610	103	Jammu and Kashmir	JK	2024-09-17 21:00:03	2024-09-17 21:00:03
1611	103	Jharkhand	JH	2024-09-17 21:00:03	2024-09-17 21:00:03
1612	103	Karnataka	KA	2024-09-17 21:00:03	2024-09-17 21:00:03
1613	103	Kerala	KL	2024-09-17 21:00:03	2024-09-17 21:00:03
1614	103	Ladakh	LA	2024-09-17 21:00:03	2024-09-17 21:00:03
1615	103	Lakshadweep	LD	2024-09-17 21:00:03	2024-09-17 21:00:03
1616	103	Madhya Pradesh	MP	2024-09-17 21:00:03	2024-09-17 21:00:03
1617	103	Maharashtra	MH	2024-09-17 21:00:03	2024-09-17 21:00:03
1618	103	Manipur	MN	2024-09-17 21:00:03	2024-09-17 21:00:03
1619	103	Meghalaya	ML	2024-09-17 21:00:03	2024-09-17 21:00:03
1620	103	Mizoram	MZ	2024-09-17 21:00:03	2024-09-17 21:00:03
1621	103	Nagaland	NL	2024-09-17 21:00:03	2024-09-17 21:00:03
1622	103	Odisha	OR	2024-09-17 21:00:03	2024-09-17 21:00:03
1623	103	Puducherry	PY	2024-09-17 21:00:03	2024-09-17 21:00:03
1624	103	Punjab	PB	2024-09-17 21:00:03	2024-09-17 21:00:03
1625	103	Rajasthan	RJ	2024-09-17 21:00:03	2024-09-17 21:00:03
1626	103	Sikkim	SK	2024-09-17 21:00:03	2024-09-17 21:00:03
1627	103	Tamil Nadu	TN	2024-09-17 21:00:03	2024-09-17 21:00:03
1628	103	Telangana	TG	2024-09-17 21:00:03	2024-09-17 21:00:03
1629	103	Tripura	TR	2024-09-17 21:00:03	2024-09-17 21:00:03
1630	103	Uttar Pradesh	UP	2024-09-17 21:00:03	2024-09-17 21:00:03
1631	103	Uttarakhand	UT	2024-09-17 21:00:03	2024-09-17 21:00:03
1632	103	West Bengal	WB	2024-09-17 21:00:03	2024-09-17 21:00:03
1633	104	Aceh	AC	2024-09-17 21:00:03	2024-09-17 21:00:03
1634	104	Bali	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1635	104	Banten	BT	2024-09-17 21:00:03	2024-09-17 21:00:03
1636	104	Bengkulu	BE	2024-09-17 21:00:03	2024-09-17 21:00:03
1637	104	DI Yogyakarta	YO	2024-09-17 21:00:03	2024-09-17 21:00:03
1638	104	DKI Jakarta	JK	2024-09-17 21:00:03	2024-09-17 21:00:03
1639	104	Gorontalo	GO	2024-09-17 21:00:03	2024-09-17 21:00:03
1640	104	Jambi	JA	2024-09-17 21:00:03	2024-09-17 21:00:03
1641	104	Jawa Barat	JB	2024-09-17 21:00:03	2024-09-17 21:00:03
1642	104	Jawa Tengah	JT	2024-09-17 21:00:03	2024-09-17 21:00:03
1643	104	Jawa Timur	JI	2024-09-17 21:00:03	2024-09-17 21:00:03
1644	104	Kalimantan Barat	KA	2024-09-17 21:00:03	2024-09-17 21:00:03
1645	104	Kalimantan Selatan	KS	2024-09-17 21:00:03	2024-09-17 21:00:03
1646	104	Kalimantan Tengah	KT	2024-09-17 21:00:03	2024-09-17 21:00:03
1647	104	Kalimantan Timur	KI	2024-09-17 21:00:03	2024-09-17 21:00:03
1648	104	Kalimantan Utara	KU	2024-09-17 21:00:03	2024-09-17 21:00:03
1649	104	Kepulauan Bangka Belitung	BB	2024-09-17 21:00:03	2024-09-17 21:00:03
1650	104	Kepulauan Riau	KR	2024-09-17 21:00:03	2024-09-17 21:00:03
1651	104	Lampung	LA	2024-09-17 21:00:03	2024-09-17 21:00:03
1652	104	Maluku	MA	2024-09-17 21:00:03	2024-09-17 21:00:03
1653	104	Maluku Utara	MU	2024-09-17 21:00:03	2024-09-17 21:00:03
1654	104	Nusa Tenggara Barat	NB	2024-09-17 21:00:03	2024-09-17 21:00:03
1655	104	Nusa Tenggara Timur	NT	2024-09-17 21:00:03	2024-09-17 21:00:03
1656	104	Papua	PA	2024-09-17 21:00:03	2024-09-17 21:00:03
1657	104	Papua Barat	PB	2024-09-17 21:00:03	2024-09-17 21:00:03
1658	104	Riau	RI	2024-09-17 21:00:03	2024-09-17 21:00:03
1659	104	Sulawesi Barat	SR	2024-09-17 21:00:03	2024-09-17 21:00:03
1660	104	Sulawesi Selatan	SN	2024-09-17 21:00:03	2024-09-17 21:00:03
1661	104	Sulawesi Tengah	ST	2024-09-17 21:00:03	2024-09-17 21:00:03
1662	104	Sulawesi Tenggara	SG	2024-09-17 21:00:03	2024-09-17 21:00:03
1663	104	Sulawesi Utara	SA	2024-09-17 21:00:03	2024-09-17 21:00:03
1664	104	Sumatera Barat	SB	2024-09-17 21:00:03	2024-09-17 21:00:03
1665	104	Sumatera Selatan	SS	2024-09-17 21:00:03	2024-09-17 21:00:03
1666	104	Sumatera Utara	SU	2024-09-17 21:00:03	2024-09-17 21:00:03
1667	105	Alborz Province	30	2024-09-17 21:00:03	2024-09-17 21:00:03
1668	105	Ardabil Province	24	2024-09-17 21:00:03	2024-09-17 21:00:03
1669	105	Bushehr Province	18	2024-09-17 21:00:03	2024-09-17 21:00:03
1670	105	Chaharmahal and Bakhtiari Province	14	2024-09-17 21:00:03	2024-09-17 21:00:03
1671	105	East Azerbaijan Province	03	2024-09-17 21:00:03	2024-09-17 21:00:03
1672	105	Fars Province	07	2024-09-17 21:00:03	2024-09-17 21:00:03
1673	105	Gilan Province	01	2024-09-17 21:00:03	2024-09-17 21:00:03
1674	105	Golestan Province	27	2024-09-17 21:00:03	2024-09-17 21:00:03
1675	105	Hamadan Province	13	2024-09-17 21:00:03	2024-09-17 21:00:03
1676	105	Hormozgan Province	22	2024-09-17 21:00:03	2024-09-17 21:00:03
1677	105	Ilam Province	16	2024-09-17 21:00:03	2024-09-17 21:00:03
1678	105	Isfahan Province	10	2024-09-17 21:00:03	2024-09-17 21:00:03
1679	105	Kerman Province	08	2024-09-17 21:00:03	2024-09-17 21:00:03
1680	105	Kermanshah Province	05	2024-09-17 21:00:03	2024-09-17 21:00:03
1681	105	Khuzestan Province	06	2024-09-17 21:00:03	2024-09-17 21:00:03
1682	105	Kohgiluyeh and Boyer-Ahmad Province	17	2024-09-17 21:00:03	2024-09-17 21:00:03
1683	105	Kurdistan Province	12	2024-09-17 21:00:03	2024-09-17 21:00:03
1684	105	Lorestan Province	15	2024-09-17 21:00:03	2024-09-17 21:00:03
1685	105	Markazi Province	00	2024-09-17 21:00:03	2024-09-17 21:00:03
1686	105	Mazandaran Province	02	2024-09-17 21:00:03	2024-09-17 21:00:03
1687	105	North Khorasan Province	28	2024-09-17 21:00:03	2024-09-17 21:00:03
1688	105	Qazvin Province	26	2024-09-17 21:00:03	2024-09-17 21:00:03
1689	105	Qom Province	25	2024-09-17 21:00:03	2024-09-17 21:00:03
1690	105	Razavi Khorasan Province	09	2024-09-17 21:00:03	2024-09-17 21:00:03
1691	105	Semnan Province	20	2024-09-17 21:00:03	2024-09-17 21:00:03
1692	105	Sistan and Baluchestan	11	2024-09-17 21:00:03	2024-09-17 21:00:03
1693	105	South Khorasan Province	29	2024-09-17 21:00:03	2024-09-17 21:00:03
1694	105	Tehran Province	23	2024-09-17 21:00:03	2024-09-17 21:00:03
1695	105	West Azarbaijan Province	04	2024-09-17 21:00:03	2024-09-17 21:00:03
1696	105	Yazd Province	21	2024-09-17 21:00:03	2024-09-17 21:00:03
1697	105	Zanjan Province	19	2024-09-17 21:00:03	2024-09-17 21:00:03
1698	106	Al Anbar Governorate	AN	2024-09-17 21:00:03	2024-09-17 21:00:03
1699	106	Al Muthanna Governorate	MU	2024-09-17 21:00:03	2024-09-17 21:00:03
1700	106	Al-Qādisiyyah Governorate	QA	2024-09-17 21:00:03	2024-09-17 21:00:03
1701	106	Babylon Governorate	BB	2024-09-17 21:00:03	2024-09-17 21:00:03
1702	106	Baghdad Governorate	BG	2024-09-17 21:00:03	2024-09-17 21:00:03
1703	106	Basra Governorate	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1704	106	Dhi Qar Governorate	DQ	2024-09-17 21:00:03	2024-09-17 21:00:03
1705	106	Diyala Governorate	DI	2024-09-17 21:00:03	2024-09-17 21:00:03
1706	106	Dohuk Governorate	DA	2024-09-17 21:00:03	2024-09-17 21:00:03
1707	106	Erbil Governorate	AR	2024-09-17 21:00:03	2024-09-17 21:00:03
1708	106	Karbala Governorate	KA	2024-09-17 21:00:03	2024-09-17 21:00:03
1709	106	Kirkuk Governorate	KI	2024-09-17 21:00:03	2024-09-17 21:00:03
1710	106	Maysan Governorate	MA	2024-09-17 21:00:03	2024-09-17 21:00:03
1711	106	Najaf Governorate	NA	2024-09-17 21:00:03	2024-09-17 21:00:03
1712	106	Nineveh Governorate	NI	2024-09-17 21:00:03	2024-09-17 21:00:03
1713	106	Saladin Governorate	SD	2024-09-17 21:00:03	2024-09-17 21:00:03
1714	106	Sulaymaniyah Governorate	SU	2024-09-17 21:00:03	2024-09-17 21:00:03
1715	106	Wasit Governorate	WA	2024-09-17 21:00:03	2024-09-17 21:00:03
1716	107	Connacht	C	2024-09-17 21:00:03	2024-09-17 21:00:03
1717	107	County Carlow	CW	2024-09-17 21:00:03	2024-09-17 21:00:03
1718	107	County Cavan	CN	2024-09-17 21:00:03	2024-09-17 21:00:03
1719	107	County Clare	CE	2024-09-17 21:00:03	2024-09-17 21:00:03
1720	107	County Cork	CO	2024-09-17 21:00:03	2024-09-17 21:00:03
1721	107	County Donegal	DL	2024-09-17 21:00:03	2024-09-17 21:00:03
1722	107	County Dublin	D	2024-09-17 21:00:03	2024-09-17 21:00:03
1723	107	County Galway	G	2024-09-17 21:00:03	2024-09-17 21:00:03
1724	107	County Kerry	KY	2024-09-17 21:00:03	2024-09-17 21:00:03
1725	107	County Kildare	KE	2024-09-17 21:00:03	2024-09-17 21:00:03
1726	107	County Kilkenny	KK	2024-09-17 21:00:03	2024-09-17 21:00:03
1727	107	County Laois	LS	2024-09-17 21:00:03	2024-09-17 21:00:03
1728	107	County Limerick	LK	2024-09-17 21:00:03	2024-09-17 21:00:03
1729	107	County Longford	LD	2024-09-17 21:00:03	2024-09-17 21:00:03
1730	107	County Louth	LH	2024-09-17 21:00:03	2024-09-17 21:00:03
1731	107	County Mayo	MO	2024-09-17 21:00:03	2024-09-17 21:00:03
1732	107	County Meath	MH	2024-09-17 21:00:03	2024-09-17 21:00:03
1733	107	County Monaghan	MN	2024-09-17 21:00:03	2024-09-17 21:00:03
1734	107	County Offaly	OY	2024-09-17 21:00:03	2024-09-17 21:00:03
1735	107	County Roscommon	RN	2024-09-17 21:00:03	2024-09-17 21:00:03
1736	107	County Sligo	SO	2024-09-17 21:00:03	2024-09-17 21:00:03
1737	107	County Tipperary	TA	2024-09-17 21:00:03	2024-09-17 21:00:03
1738	107	County Waterford	WD	2024-09-17 21:00:03	2024-09-17 21:00:03
1739	107	County Westmeath	WH	2024-09-17 21:00:03	2024-09-17 21:00:03
1740	107	County Wexford	WX	2024-09-17 21:00:03	2024-09-17 21:00:03
1741	107	County Wicklow	WW	2024-09-17 21:00:03	2024-09-17 21:00:03
1742	107	Leinster	L	2024-09-17 21:00:03	2024-09-17 21:00:03
1743	107	Munster	M	2024-09-17 21:00:03	2024-09-17 21:00:03
1744	107	Ulster	U	2024-09-17 21:00:03	2024-09-17 21:00:03
1745	108	Central District	M	2024-09-17 21:00:03	2024-09-17 21:00:03
1746	108	Haifa District	HA	2024-09-17 21:00:03	2024-09-17 21:00:03
1747	108	Jerusalem District	JM	2024-09-17 21:00:03	2024-09-17 21:00:03
1748	108	Northern District	Z	2024-09-17 21:00:03	2024-09-17 21:00:03
1749	108	Southern District	D	2024-09-17 21:00:03	2024-09-17 21:00:03
1750	108	Tel Aviv District	TA	2024-09-17 21:00:03	2024-09-17 21:00:03
1751	109	Abruzzo	65	2024-09-17 21:00:03	2024-09-17 21:00:03
1752	109	Aosta Valley	23	2024-09-17 21:00:03	2024-09-17 21:00:03
1753	109	Apulia	75	2024-09-17 21:00:03	2024-09-17 21:00:03
1754	109	Basilicata	77	2024-09-17 21:00:03	2024-09-17 21:00:03
1755	109	Benevento Province	BN	2024-09-17 21:00:03	2024-09-17 21:00:03
1756	109	Calabria	78	2024-09-17 21:00:03	2024-09-17 21:00:03
1757	109	Campania	72	2024-09-17 21:00:03	2024-09-17 21:00:03
1758	109	Emilia-Romagna	45	2024-09-17 21:00:03	2024-09-17 21:00:03
1759	109	Friuli–Venezia Giulia	36	2024-09-17 21:00:03	2024-09-17 21:00:03
1760	109	Lazio	62	2024-09-17 21:00:03	2024-09-17 21:00:03
1761	109	Libero consorzio comunale di Agrigento	AG	2024-09-17 21:00:03	2024-09-17 21:00:03
1762	109	Libero consorzio comunale di Caltanissetta	CL	2024-09-17 21:00:03	2024-09-17 21:00:03
1763	109	Libero consorzio comunale di Enna	EN	2024-09-17 21:00:03	2024-09-17 21:00:03
1764	109	Libero consorzio comunale di Ragusa	RG	2024-09-17 21:00:03	2024-09-17 21:00:03
1765	109	Libero consorzio comunale di Siracusa	SR	2024-09-17 21:00:03	2024-09-17 21:00:03
1766	109	Libero consorzio comunale di Trapani	TP	2024-09-17 21:00:03	2024-09-17 21:00:03
1767	109	Liguria	42	2024-09-17 21:00:03	2024-09-17 21:00:03
1768	109	Lombardy	25	2024-09-17 21:00:03	2024-09-17 21:00:03
1769	109	Marche	57	2024-09-17 21:00:03	2024-09-17 21:00:03
1770	109	Metropolitan City of Bari	BA	2024-09-17 21:00:03	2024-09-17 21:00:03
1771	109	Metropolitan City of Bologna	BO	2024-09-17 21:00:03	2024-09-17 21:00:03
1772	109	Metropolitan City of Cagliari	CA	2024-09-17 21:00:03	2024-09-17 21:00:03
1773	109	Metropolitan City of Catania	CT	2024-09-17 21:00:03	2024-09-17 21:00:03
1774	109	Metropolitan City of Florence	FI	2024-09-17 21:00:03	2024-09-17 21:00:03
1775	109	Metropolitan City of Genoa	GE	2024-09-17 21:00:03	2024-09-17 21:00:03
1776	109	Metropolitan City of Messina	ME	2024-09-17 21:00:03	2024-09-17 21:00:03
1777	109	Metropolitan City of Milan	MI	2024-09-17 21:00:03	2024-09-17 21:00:03
1778	109	Metropolitan City of Naples	NA	2024-09-17 21:00:03	2024-09-17 21:00:03
1779	109	Metropolitan City of Palermo	PA	2024-09-17 21:00:03	2024-09-17 21:00:03
1780	109	Metropolitan City of Reggio Calabria	RC	2024-09-17 21:00:03	2024-09-17 21:00:03
1781	109	Metropolitan City of Rome	RM	2024-09-17 21:00:03	2024-09-17 21:00:03
1782	109	Metropolitan City of Turin	TO	2024-09-17 21:00:03	2024-09-17 21:00:03
1783	109	Metropolitan City of Venice	VE	2024-09-17 21:00:03	2024-09-17 21:00:03
1784	109	Molise	67	2024-09-17 21:00:03	2024-09-17 21:00:03
1785	109	Pesaro and Urbino Province	PU	2024-09-17 21:00:03	2024-09-17 21:00:03
1786	109	Piedmont	21	2024-09-17 21:00:03	2024-09-17 21:00:03
1787	109	Province of Alessandria	AL	2024-09-17 21:00:03	2024-09-17 21:00:03
1788	109	Province of Ancona	AN	2024-09-17 21:00:03	2024-09-17 21:00:03
1789	109	Province of Ascoli Piceno	AP	2024-09-17 21:00:03	2024-09-17 21:00:03
1790	109	Province of Asti	AT	2024-09-17 21:00:03	2024-09-17 21:00:03
1791	109	Province of Avellino	AV	2024-09-17 21:00:04	2024-09-17 21:00:04
1792	109	Province of Barletta-Andria-Trani	BT	2024-09-17 21:00:04	2024-09-17 21:00:04
1793	109	Province of Belluno	BL	2024-09-17 21:00:04	2024-09-17 21:00:04
1794	109	Province of Bergamo	BG	2024-09-17 21:00:04	2024-09-17 21:00:04
1795	109	Province of Biella	BI	2024-09-17 21:00:04	2024-09-17 21:00:04
1796	109	Province of Brescia	BS	2024-09-17 21:00:04	2024-09-17 21:00:04
1797	109	Province of Brindisi	BR	2024-09-17 21:00:04	2024-09-17 21:00:04
1798	109	Province of Campobasso	CB	2024-09-17 21:00:04	2024-09-17 21:00:04
1799	109	Province of Carbonia-Iglesias	CI	2024-09-17 21:00:04	2024-09-17 21:00:04
1800	109	Province of Caserta	CE	2024-09-17 21:00:04	2024-09-17 21:00:04
1801	109	Province of Catanzaro	CZ	2024-09-17 21:00:04	2024-09-17 21:00:04
1802	109	Province of Chieti	CH	2024-09-17 21:00:04	2024-09-17 21:00:04
1803	109	Province of Como	CO	2024-09-17 21:00:04	2024-09-17 21:00:04
1804	109	Province of Cosenza	CS	2024-09-17 21:00:04	2024-09-17 21:00:04
1805	109	Province of Cremona	CR	2024-09-17 21:00:04	2024-09-17 21:00:04
1806	109	Province of Crotone	KR	2024-09-17 21:00:04	2024-09-17 21:00:04
1807	109	Province of Cuneo	CN	2024-09-17 21:00:04	2024-09-17 21:00:04
1808	109	Province of Fermo	FM	2024-09-17 21:00:04	2024-09-17 21:00:04
1809	109	Province of Ferrara	FE	2024-09-17 21:00:04	2024-09-17 21:00:04
1810	109	Province of Foggia	FG	2024-09-17 21:00:04	2024-09-17 21:00:04
1811	109	Province of Forlì-Cesena	FC	2024-09-17 21:00:04	2024-09-17 21:00:04
1812	109	Province of Frosinone	FR	2024-09-17 21:00:04	2024-09-17 21:00:04
1813	109	Province of Gorizia	GO	2024-09-17 21:00:04	2024-09-17 21:00:04
1814	109	Province of Grosseto	GR	2024-09-17 21:00:04	2024-09-17 21:00:04
1815	109	Province of Imperia	IM	2024-09-17 21:00:04	2024-09-17 21:00:04
1816	109	Province of Isernia	IS	2024-09-17 21:00:04	2024-09-17 21:00:04
1817	109	Province of L'Aquila	AQ	2024-09-17 21:00:04	2024-09-17 21:00:04
1818	109	Province of La Spezia	SP	2024-09-17 21:00:04	2024-09-17 21:00:04
1819	109	Province of Latina	LT	2024-09-17 21:00:04	2024-09-17 21:00:04
1820	109	Province of Lecce	LE	2024-09-17 21:00:04	2024-09-17 21:00:04
1821	109	Province of Lecco	LC	2024-09-17 21:00:04	2024-09-17 21:00:04
1822	109	Province of Livorno	LI	2024-09-17 21:00:04	2024-09-17 21:00:04
1823	109	Province of Lodi	LO	2024-09-17 21:00:04	2024-09-17 21:00:04
1824	109	Province of Lucca	LU	2024-09-17 21:00:04	2024-09-17 21:00:04
1825	109	Province of Macerata	MC	2024-09-17 21:00:04	2024-09-17 21:00:04
1826	109	Province of Mantua	MN	2024-09-17 21:00:04	2024-09-17 21:00:04
1827	109	Province of Massa and Carrara	MS	2024-09-17 21:00:04	2024-09-17 21:00:04
1828	109	Province of Matera	MT	2024-09-17 21:00:04	2024-09-17 21:00:04
1829	109	Province of Medio Campidano	VS	2024-09-17 21:00:04	2024-09-17 21:00:04
1830	109	Province of Modena	MO	2024-09-17 21:00:04	2024-09-17 21:00:04
1831	109	Province of Monza and Brianza	MB	2024-09-17 21:00:04	2024-09-17 21:00:04
1832	109	Province of Novara	NO	2024-09-17 21:00:04	2024-09-17 21:00:04
1833	109	Province of Nuoro	NU	2024-09-17 21:00:04	2024-09-17 21:00:04
1834	109	Province of Ogliastra	OG	2024-09-17 21:00:04	2024-09-17 21:00:04
1835	109	Province of Olbia-Tempio	OT	2024-09-17 21:00:04	2024-09-17 21:00:04
1836	109	Province of Oristano	OR	2024-09-17 21:00:04	2024-09-17 21:00:04
1837	109	Province of Padua	PD	2024-09-17 21:00:04	2024-09-17 21:00:04
1838	109	Province of Parma	PR	2024-09-17 21:00:04	2024-09-17 21:00:04
1839	109	Province of Pavia	PV	2024-09-17 21:00:04	2024-09-17 21:00:04
1840	109	Province of Perugia	PG	2024-09-17 21:00:04	2024-09-17 21:00:04
1841	109	Province of Pescara	PE	2024-09-17 21:00:04	2024-09-17 21:00:04
1842	109	Province of Piacenza	PC	2024-09-17 21:00:04	2024-09-17 21:00:04
1843	109	Province of Pisa	PI	2024-09-17 21:00:04	2024-09-17 21:00:04
1844	109	Province of Pistoia	PT	2024-09-17 21:00:04	2024-09-17 21:00:04
1845	109	Province of Pordenone	PN	2024-09-17 21:00:04	2024-09-17 21:00:04
1846	109	Province of Potenza	PZ	2024-09-17 21:00:04	2024-09-17 21:00:04
1847	109	Province of Prato	PO	2024-09-17 21:00:04	2024-09-17 21:00:04
1848	109	Province of Ravenna	RA	2024-09-17 21:00:04	2024-09-17 21:00:04
1849	109	Province of Reggio Emilia	RE	2024-09-17 21:00:04	2024-09-17 21:00:04
1850	109	Province of Rieti	RI	2024-09-17 21:00:04	2024-09-17 21:00:04
1851	109	Province of Rimini	RN	2024-09-17 21:00:04	2024-09-17 21:00:04
1852	109	Province of Rovigo	RO	2024-09-17 21:00:04	2024-09-17 21:00:04
1853	109	Province of Salerno	SA	2024-09-17 21:00:04	2024-09-17 21:00:04
1854	109	Province of Sassari	SS	2024-09-17 21:00:04	2024-09-17 21:00:04
1855	109	Province of Savona	SV	2024-09-17 21:00:04	2024-09-17 21:00:04
1856	109	Province of Siena	SI	2024-09-17 21:00:04	2024-09-17 21:00:04
1857	109	Province of Sondrio	SO	2024-09-17 21:00:04	2024-09-17 21:00:04
1858	109	Province of Taranto	TA	2024-09-17 21:00:04	2024-09-17 21:00:04
1859	109	Province of Teramo	TE	2024-09-17 21:00:04	2024-09-17 21:00:04
1860	109	Province of Terni	TR	2024-09-17 21:00:04	2024-09-17 21:00:04
1861	109	Province of Treviso	TV	2024-09-17 21:00:04	2024-09-17 21:00:04
1862	109	Province of Trieste	TS	2024-09-17 21:00:04	2024-09-17 21:00:04
1863	109	Province of Udine	UD	2024-09-17 21:00:04	2024-09-17 21:00:04
1864	109	Province of Varese	VA	2024-09-17 21:00:04	2024-09-17 21:00:04
1865	109	Province of Verbano-Cusio-Ossola	VB	2024-09-17 21:00:04	2024-09-17 21:00:04
1866	109	Province of Vercelli	VC	2024-09-17 21:00:04	2024-09-17 21:00:04
1867	109	Province of Verona	VR	2024-09-17 21:00:04	2024-09-17 21:00:04
1868	109	Province of Vibo Valentia	VV	2024-09-17 21:00:04	2024-09-17 21:00:04
1869	109	Province of Vicenza	VI	2024-09-17 21:00:04	2024-09-17 21:00:04
1870	109	Province of Viterbo	VT	2024-09-17 21:00:04	2024-09-17 21:00:04
1871	109	Sardinia	88	2024-09-17 21:00:04	2024-09-17 21:00:04
1872	109	Sicily	82	2024-09-17 21:00:04	2024-09-17 21:00:04
1873	109	South Tyrol	BZ	2024-09-17 21:00:04	2024-09-17 21:00:04
1874	109	Trentino	TN	2024-09-17 21:00:04	2024-09-17 21:00:04
1875	109	Trentino-South Tyrol	32	2024-09-17 21:00:04	2024-09-17 21:00:04
1876	109	Tuscany	52	2024-09-17 21:00:04	2024-09-17 21:00:04
1877	109	Umbria	55	2024-09-17 21:00:04	2024-09-17 21:00:04
1878	109	Veneto	34	2024-09-17 21:00:04	2024-09-17 21:00:04
1879	110	Clarendon Parish	13	2024-09-17 21:00:04	2024-09-17 21:00:04
1880	110	Hanover Parish	09	2024-09-17 21:00:04	2024-09-17 21:00:04
1881	110	Kingston Parish	01	2024-09-17 21:00:04	2024-09-17 21:00:04
1882	110	Manchester Parish	12	2024-09-17 21:00:04	2024-09-17 21:00:04
1883	110	Portland Parish	04	2024-09-17 21:00:04	2024-09-17 21:00:04
1884	110	Saint Andrew	02	2024-09-17 21:00:04	2024-09-17 21:00:04
1885	110	Saint Ann Parish	06	2024-09-17 21:00:04	2024-09-17 21:00:04
1886	110	Saint Catherine Parish	14	2024-09-17 21:00:04	2024-09-17 21:00:04
1887	110	Saint Elizabeth Parish	11	2024-09-17 21:00:04	2024-09-17 21:00:04
1888	110	Saint James Parish	08	2024-09-17 21:00:04	2024-09-17 21:00:04
1889	110	Saint Mary Parish	05	2024-09-17 21:00:04	2024-09-17 21:00:04
1890	110	Saint Thomas Parish	03	2024-09-17 21:00:04	2024-09-17 21:00:04
1891	110	Trelawny Parish	07	2024-09-17 21:00:04	2024-09-17 21:00:04
1892	110	Westmoreland Parish	10	2024-09-17 21:00:04	2024-09-17 21:00:04
1893	111	Aichi Prefecture	23	2024-09-17 21:00:04	2024-09-17 21:00:04
1894	111	Akita Prefecture	05	2024-09-17 21:00:04	2024-09-17 21:00:04
1895	111	Aomori Prefecture	02	2024-09-17 21:00:04	2024-09-17 21:00:04
1896	111	Chiba Prefecture	12	2024-09-17 21:00:04	2024-09-17 21:00:04
1897	111	Ehime Prefecture	38	2024-09-17 21:00:04	2024-09-17 21:00:04
1898	111	Fukui Prefecture	18	2024-09-17 21:00:04	2024-09-17 21:00:04
1899	111	Fukuoka Prefecture	40	2024-09-17 21:00:04	2024-09-17 21:00:04
1900	111	Fukushima Prefecture	07	2024-09-17 21:00:04	2024-09-17 21:00:04
1901	111	Gifu Prefecture	21	2024-09-17 21:00:04	2024-09-17 21:00:04
1902	111	Gunma Prefecture	10	2024-09-17 21:00:04	2024-09-17 21:00:04
1903	111	Hiroshima Prefecture	34	2024-09-17 21:00:04	2024-09-17 21:00:04
1904	111	Hokkaidō Prefecture	01	2024-09-17 21:00:04	2024-09-17 21:00:04
1905	111	Hyōgo Prefecture	28	2024-09-17 21:00:04	2024-09-17 21:00:04
1906	111	Ibaraki Prefecture	08	2024-09-17 21:00:04	2024-09-17 21:00:04
1907	111	Ishikawa Prefecture	17	2024-09-17 21:00:04	2024-09-17 21:00:04
1908	111	Iwate Prefecture	03	2024-09-17 21:00:04	2024-09-17 21:00:04
1909	111	Kagawa Prefecture	37	2024-09-17 21:00:04	2024-09-17 21:00:04
1910	111	Kagoshima Prefecture	46	2024-09-17 21:00:04	2024-09-17 21:00:04
1911	111	Kanagawa Prefecture	14	2024-09-17 21:00:04	2024-09-17 21:00:04
1912	111	Kōchi Prefecture	39	2024-09-17 21:00:04	2024-09-17 21:00:04
1913	111	Kumamoto Prefecture	43	2024-09-17 21:00:04	2024-09-17 21:00:04
1914	111	Kyōto Prefecture	26	2024-09-17 21:00:04	2024-09-17 21:00:04
1915	111	Mie Prefecture	24	2024-09-17 21:00:04	2024-09-17 21:00:04
1916	111	Miyagi Prefecture	04	2024-09-17 21:00:04	2024-09-17 21:00:04
1917	111	Miyazaki Prefecture	45	2024-09-17 21:00:04	2024-09-17 21:00:04
1918	111	Nagano Prefecture	20	2024-09-17 21:00:04	2024-09-17 21:00:04
1919	111	Nagasaki Prefecture	42	2024-09-17 21:00:04	2024-09-17 21:00:04
1920	111	Nara Prefecture	29	2024-09-17 21:00:04	2024-09-17 21:00:04
1921	111	Niigata Prefecture	15	2024-09-17 21:00:04	2024-09-17 21:00:04
1922	111	Ōita Prefecture	44	2024-09-17 21:00:04	2024-09-17 21:00:04
1923	111	Okayama Prefecture	33	2024-09-17 21:00:04	2024-09-17 21:00:04
1924	111	Okinawa Prefecture	47	2024-09-17 21:00:04	2024-09-17 21:00:04
1925	111	Ōsaka Prefecture	27	2024-09-17 21:00:04	2024-09-17 21:00:04
1926	111	Saga Prefecture	41	2024-09-17 21:00:04	2024-09-17 21:00:04
1927	111	Saitama Prefecture	11	2024-09-17 21:00:04	2024-09-17 21:00:04
1928	111	Shiga Prefecture	25	2024-09-17 21:00:04	2024-09-17 21:00:04
1929	111	Shimane Prefecture	32	2024-09-17 21:00:04	2024-09-17 21:00:04
1930	111	Shizuoka Prefecture	22	2024-09-17 21:00:04	2024-09-17 21:00:04
1931	111	Tochigi Prefecture	09	2024-09-17 21:00:04	2024-09-17 21:00:04
1932	111	Tokushima Prefecture	36	2024-09-17 21:00:04	2024-09-17 21:00:04
1933	111	Tokyo	13	2024-09-17 21:00:04	2024-09-17 21:00:04
1934	111	Tottori Prefecture	31	2024-09-17 21:00:04	2024-09-17 21:00:04
1935	111	Toyama Prefecture	16	2024-09-17 21:00:04	2024-09-17 21:00:04
1936	111	Wakayama Prefecture	30	2024-09-17 21:00:04	2024-09-17 21:00:04
1937	111	Yamagata Prefecture	06	2024-09-17 21:00:04	2024-09-17 21:00:04
1938	111	Yamaguchi Prefecture	35	2024-09-17 21:00:04	2024-09-17 21:00:04
1939	111	Yamanashi Prefecture	19	2024-09-17 21:00:04	2024-09-17 21:00:04
1940	113	Ajloun Governorate	AJ	2024-09-17 21:00:04	2024-09-17 21:00:04
1941	113	Amman Governorate	AM	2024-09-17 21:00:04	2024-09-17 21:00:04
1942	113	Aqaba Governorate	AQ	2024-09-17 21:00:04	2024-09-17 21:00:04
1943	113	Balqa Governorate	BA	2024-09-17 21:00:04	2024-09-17 21:00:04
1944	113	Irbid Governorate	IR	2024-09-17 21:00:04	2024-09-17 21:00:04
1945	113	Jerash Governorate	JA	2024-09-17 21:00:04	2024-09-17 21:00:04
1946	113	Karak Governorate	KA	2024-09-17 21:00:04	2024-09-17 21:00:04
1947	113	Ma'an Governorate	MN	2024-09-17 21:00:04	2024-09-17 21:00:04
1948	113	Madaba Governorate	MD	2024-09-17 21:00:04	2024-09-17 21:00:04
1949	113	Mafraq Governorate	MA	2024-09-17 21:00:04	2024-09-17 21:00:04
1950	113	Tafilah Governorate	AT	2024-09-17 21:00:04	2024-09-17 21:00:04
1951	113	Zarqa Governorate	AZ	2024-09-17 21:00:04	2024-09-17 21:00:04
1952	114	Akmola Region	AKM	2024-09-17 21:00:04	2024-09-17 21:00:04
1953	114	Aktobe Region	AKT	2024-09-17 21:00:04	2024-09-17 21:00:04
1954	114	Almaty	ALA	2024-09-17 21:00:04	2024-09-17 21:00:04
1955	114	Almaty Region	ALM	2024-09-17 21:00:04	2024-09-17 21:00:04
1956	114	Atyrau Region	ATY	2024-09-17 21:00:04	2024-09-17 21:00:04
1957	114	Baikonur	BAY	2024-09-17 21:00:04	2024-09-17 21:00:04
1958	114	East Kazakhstan Region	VOS	2024-09-17 21:00:04	2024-09-17 21:00:04
1959	114	Jambyl Region	ZHA	2024-09-17 21:00:04	2024-09-17 21:00:04
1960	114	Karaganda Region	KAR	2024-09-17 21:00:04	2024-09-17 21:00:04
1961	114	Kostanay Region	KUS	2024-09-17 21:00:04	2024-09-17 21:00:04
1962	114	Kyzylorda Region	KZY	2024-09-17 21:00:04	2024-09-17 21:00:04
1963	114	Mangystau Region	MAN	2024-09-17 21:00:04	2024-09-17 21:00:04
1964	114	North Kazakhstan Region	SEV	2024-09-17 21:00:04	2024-09-17 21:00:04
1965	114	Nur-Sultan	AST	2024-09-17 21:00:04	2024-09-17 21:00:04
1966	114	Pavlodar Region	PAV	2024-09-17 21:00:04	2024-09-17 21:00:04
1967	114	Turkestan Region	YUZ	2024-09-17 21:00:04	2024-09-17 21:00:04
1968	114	West Kazakhstan Province	ZAP	2024-09-17 21:00:04	2024-09-17 21:00:04
1969	115	Baringo County	01	2024-09-17 21:00:04	2024-09-17 21:00:04
1970	115	Bomet County	02	2024-09-17 21:00:04	2024-09-17 21:00:04
1971	115	Bungoma County	03	2024-09-17 21:00:04	2024-09-17 21:00:04
1972	115	Busia County	04	2024-09-17 21:00:04	2024-09-17 21:00:04
1973	115	Central Province	200	2024-09-17 21:00:04	2024-09-17 21:00:04
1974	115	Coast Province	300	2024-09-17 21:00:04	2024-09-17 21:00:04
1975	115	Eastern Province	400	2024-09-17 21:00:04	2024-09-17 21:00:04
1976	115	Elgeyo-Marakwet County	05	2024-09-17 21:00:04	2024-09-17 21:00:04
1977	115	Embu County	06	2024-09-17 21:00:04	2024-09-17 21:00:04
1978	115	Garissa County	07	2024-09-17 21:00:04	2024-09-17 21:00:04
1979	115	Homa Bay County	08	2024-09-17 21:00:04	2024-09-17 21:00:04
1980	115	Isiolo County	09	2024-09-17 21:00:04	2024-09-17 21:00:04
1981	115	Kajiado County	10	2024-09-17 21:00:04	2024-09-17 21:00:04
1982	115	Kakamega County	11	2024-09-17 21:00:04	2024-09-17 21:00:04
1983	115	Kericho County	12	2024-09-17 21:00:04	2024-09-17 21:00:04
1984	115	Kiambu County	13	2024-09-17 21:00:04	2024-09-17 21:00:04
1985	115	Kilifi County	14	2024-09-17 21:00:04	2024-09-17 21:00:04
1986	115	Kirinyaga County	15	2024-09-17 21:00:04	2024-09-17 21:00:04
1987	115	Kisii County	16	2024-09-17 21:00:04	2024-09-17 21:00:04
1988	115	Kisumu County	17	2024-09-17 21:00:04	2024-09-17 21:00:04
1989	115	Kitui County	18	2024-09-17 21:00:04	2024-09-17 21:00:04
1990	115	Kwale County	19	2024-09-17 21:00:04	2024-09-17 21:00:04
1991	115	Laikipia County	20	2024-09-17 21:00:04	2024-09-17 21:00:04
1992	115	Lamu County	21	2024-09-17 21:00:04	2024-09-17 21:00:04
1993	115	Machakos County	22	2024-09-17 21:00:04	2024-09-17 21:00:04
1994	115	Makueni County	23	2024-09-17 21:00:04	2024-09-17 21:00:04
1995	115	Mandera County	24	2024-09-17 21:00:04	2024-09-17 21:00:04
1996	115	Marsabit County	25	2024-09-17 21:00:04	2024-09-17 21:00:04
1997	115	Meru County	26	2024-09-17 21:00:04	2024-09-17 21:00:04
1998	115	Migori County	27	2024-09-17 21:00:04	2024-09-17 21:00:04
1999	115	Mombasa County	28	2024-09-17 21:00:04	2024-09-17 21:00:04
2000	115	Muranga County	29	2024-09-17 21:00:04	2024-09-17 21:00:04
2001	115	Nairobi	110	2024-09-17 21:00:04	2024-09-17 21:00:04
2002	115	Nakuru County	31	2024-09-17 21:00:04	2024-09-17 21:00:04
2003	115	Nandi District	32	2024-09-17 21:00:04	2024-09-17 21:00:04
2004	115	Narok County	33	2024-09-17 21:00:04	2024-09-17 21:00:04
2005	115	North Eastern Province	500	2024-09-17 21:00:04	2024-09-17 21:00:04
2006	115	Nyamira County	34	2024-09-17 21:00:04	2024-09-17 21:00:04
2007	115	Nyandarua County	35	2024-09-17 21:00:04	2024-09-17 21:00:04
2008	115	Nyanza Province	600	2024-09-17 21:00:04	2024-09-17 21:00:04
2009	115	Nyeri County	36	2024-09-17 21:00:04	2024-09-17 21:00:04
2010	115	Rift Valley Province	700	2024-09-17 21:00:04	2024-09-17 21:00:04
2011	115	Samburu County	37	2024-09-17 21:00:04	2024-09-17 21:00:04
2012	115	Siaya County	38	2024-09-17 21:00:04	2024-09-17 21:00:04
2013	115	Taita–Taveta County	39	2024-09-17 21:00:04	2024-09-17 21:00:04
2014	115	Tana River County	40	2024-09-17 21:00:04	2024-09-17 21:00:04
2015	115	Tharaka Nithi County	41	2024-09-17 21:00:04	2024-09-17 21:00:04
2016	115	Trans-Nzoia District	42	2024-09-17 21:00:04	2024-09-17 21:00:04
2017	115	Turkana County	43	2024-09-17 21:00:04	2024-09-17 21:00:04
2018	115	Uasin Gishu	44	2024-09-17 21:00:04	2024-09-17 21:00:04
2019	115	Vihiga County	45	2024-09-17 21:00:04	2024-09-17 21:00:04
2020	115	Wajir County	46	2024-09-17 21:00:04	2024-09-17 21:00:04
2021	115	West Pokot County	47	2024-09-17 21:00:04	2024-09-17 21:00:04
2022	115	Western Province	800	2024-09-17 21:00:04	2024-09-17 21:00:04
2023	116	Gilbert Islands	G	2024-09-17 21:00:04	2024-09-17 21:00:04
2024	116	Line Islands	L	2024-09-17 21:00:04	2024-09-17 21:00:04
2025	116	Phoenix Islands	P	2024-09-17 21:00:04	2024-09-17 21:00:04
2026	117	Đakovica District (Gjakove)	XDG	2024-09-17 21:00:04	2024-09-17 21:00:04
2027	117	Gjilan District	XGJ	2024-09-17 21:00:04	2024-09-17 21:00:04
2028	117	Kosovska Mitrovica District	XKM	2024-09-17 21:00:04	2024-09-17 21:00:04
2029	117	Peć District	XPE	2024-09-17 21:00:04	2024-09-17 21:00:04
2030	117	Pristina (Priştine)	XPI	2024-09-17 21:00:04	2024-09-17 21:00:04
2031	117	Prizren District	XPR	2024-09-17 21:00:04	2024-09-17 21:00:04
2032	117	Uroševac District (Ferizaj)	XUF	2024-09-17 21:00:04	2024-09-17 21:00:04
2033	118	Al Ahmadi Governorate	AH	2024-09-17 21:00:04	2024-09-17 21:00:04
2034	118	Al Farwaniyah Governorate	FA	2024-09-17 21:00:04	2024-09-17 21:00:04
2035	118	Al Jahra Governorate	JA	2024-09-17 21:00:04	2024-09-17 21:00:04
2036	118	Capital Governorate	KU	2024-09-17 21:00:04	2024-09-17 21:00:04
2037	118	Hawalli Governorate	HA	2024-09-17 21:00:04	2024-09-17 21:00:04
2038	118	Mubarak Al-Kabeer Governorate	MU	2024-09-17 21:00:04	2024-09-17 21:00:04
2039	119	Batken Region	B	2024-09-17 21:00:04	2024-09-17 21:00:04
2040	119	Bishkek	GB	2024-09-17 21:00:04	2024-09-17 21:00:04
2041	119	Chuy Region	C	2024-09-17 21:00:04	2024-09-17 21:00:04
2042	119	Issyk-Kul Region	Y	2024-09-17 21:00:04	2024-09-17 21:00:04
2043	119	Jalal-Abad Region	J	2024-09-17 21:00:04	2024-09-17 21:00:04
2044	119	Naryn Region	N	2024-09-17 21:00:04	2024-09-17 21:00:04
2045	119	Osh	GO	2024-09-17 21:00:04	2024-09-17 21:00:04
2046	119	Osh Region	O	2024-09-17 21:00:04	2024-09-17 21:00:04
2047	119	Talas Region	T	2024-09-17 21:00:04	2024-09-17 21:00:04
2048	120	Attapeu Province	AT	2024-09-17 21:00:04	2024-09-17 21:00:04
2049	120	Bokeo Province	BK	2024-09-17 21:00:04	2024-09-17 21:00:04
2050	120	Bolikhamsai Province	BL	2024-09-17 21:00:04	2024-09-17 21:00:04
2051	120	Champasak Province	CH	2024-09-17 21:00:04	2024-09-17 21:00:04
2052	120	Houaphanh Province	HO	2024-09-17 21:00:04	2024-09-17 21:00:04
2053	120	Khammouane Province	KH	2024-09-17 21:00:04	2024-09-17 21:00:04
2054	120	Luang Namtha Province	LM	2024-09-17 21:00:04	2024-09-17 21:00:04
2055	120	Luang Prabang Province	LP	2024-09-17 21:00:04	2024-09-17 21:00:04
2056	120	Oudomxay Province	OU	2024-09-17 21:00:04	2024-09-17 21:00:04
2057	120	Phongsaly Province	PH	2024-09-17 21:00:04	2024-09-17 21:00:04
2058	120	Sainyabuli Province	XA	2024-09-17 21:00:04	2024-09-17 21:00:04
2059	120	Salavan Province	SL	2024-09-17 21:00:04	2024-09-17 21:00:04
2060	120	Savannakhet Province	SV	2024-09-17 21:00:04	2024-09-17 21:00:04
2061	120	Sekong Province	XE	2024-09-17 21:00:04	2024-09-17 21:00:04
2062	120	Vientiane Prefecture	VT	2024-09-17 21:00:04	2024-09-17 21:00:04
2063	120	Vientiane Province	VI	2024-09-17 21:00:04	2024-09-17 21:00:04
2064	120	Xaisomboun	XN	2024-09-17 21:00:04	2024-09-17 21:00:04
2065	120	Xaisomboun Province	XS	2024-09-17 21:00:04	2024-09-17 21:00:04
2066	120	Xiangkhouang Province	XI	2024-09-17 21:00:04	2024-09-17 21:00:04
2067	121	Aglona Municipality	001	2024-09-17 21:00:04	2024-09-17 21:00:04
2068	121	Aizkraukle Municipality	002	2024-09-17 21:00:04	2024-09-17 21:00:04
2069	121	Aizpute Municipality	003	2024-09-17 21:00:04	2024-09-17 21:00:04
2070	121	Aknīste Municipality	004	2024-09-17 21:00:04	2024-09-17 21:00:04
2071	121	Aloja Municipality	005	2024-09-17 21:00:04	2024-09-17 21:00:04
2072	121	Alsunga Municipality	006	2024-09-17 21:00:04	2024-09-17 21:00:04
2073	121	Alūksne Municipality	007	2024-09-17 21:00:04	2024-09-17 21:00:04
2074	121	Amata Municipality	008	2024-09-17 21:00:04	2024-09-17 21:00:04
2075	121	Ape Municipality	009	2024-09-17 21:00:04	2024-09-17 21:00:04
2076	121	Auce Municipality	010	2024-09-17 21:00:04	2024-09-17 21:00:04
2077	121	Babīte Municipality	012	2024-09-17 21:00:04	2024-09-17 21:00:04
2078	121	Baldone Municipality	013	2024-09-17 21:00:04	2024-09-17 21:00:04
2079	121	Baltinava Municipality	014	2024-09-17 21:00:04	2024-09-17 21:00:04
2080	121	Balvi Municipality	015	2024-09-17 21:00:04	2024-09-17 21:00:04
2081	121	Bauska Municipality	016	2024-09-17 21:00:04	2024-09-17 21:00:04
2082	121	Beverīna Municipality	017	2024-09-17 21:00:04	2024-09-17 21:00:04
2083	121	Brocēni Municipality	018	2024-09-17 21:00:04	2024-09-17 21:00:04
2084	121	Burtnieki Municipality	019	2024-09-17 21:00:04	2024-09-17 21:00:04
2085	121	Carnikava Municipality	020	2024-09-17 21:00:04	2024-09-17 21:00:04
2086	121	Cēsis Municipality	022	2024-09-17 21:00:04	2024-09-17 21:00:04
2087	121	Cesvaine Municipality	021	2024-09-17 21:00:04	2024-09-17 21:00:04
2088	121	Cibla Municipality	023	2024-09-17 21:00:04	2024-09-17 21:00:04
2089	121	Dagda Municipality	024	2024-09-17 21:00:04	2024-09-17 21:00:04
2090	121	Daugavpils	DGV	2024-09-17 21:00:04	2024-09-17 21:00:04
2091	121	Daugavpils Municipality	025	2024-09-17 21:00:04	2024-09-17 21:00:04
2092	121	Dobele Municipality	026	2024-09-17 21:00:04	2024-09-17 21:00:04
2093	121	Dundaga Municipality	027	2024-09-17 21:00:04	2024-09-17 21:00:04
2094	121	Durbe Municipality	028	2024-09-17 21:00:04	2024-09-17 21:00:04
2095	121	Engure Municipality	029	2024-09-17 21:00:04	2024-09-17 21:00:04
2096	121	Ērgļi Municipality	030	2024-09-17 21:00:04	2024-09-17 21:00:04
2097	121	Garkalne Municipality	031	2024-09-17 21:00:04	2024-09-17 21:00:04
2098	121	Grobiņa Municipality	032	2024-09-17 21:00:04	2024-09-17 21:00:04
2099	121	Gulbene Municipality	033	2024-09-17 21:00:04	2024-09-17 21:00:04
2100	121	Iecava Municipality	034	2024-09-17 21:00:04	2024-09-17 21:00:04
2101	121	Ikšķile Municipality	035	2024-09-17 21:00:04	2024-09-17 21:00:04
2102	121	Ilūkste Municipality	036	2024-09-17 21:00:04	2024-09-17 21:00:04
2103	121	Inčukalns Municipality	037	2024-09-17 21:00:04	2024-09-17 21:00:04
2104	121	Jaunjelgava Municipality	038	2024-09-17 21:00:04	2024-09-17 21:00:04
2105	121	Jaunpiebalga Municipality	039	2024-09-17 21:00:04	2024-09-17 21:00:04
2106	121	Jaunpils Municipality	040	2024-09-17 21:00:04	2024-09-17 21:00:04
2107	121	Jēkabpils	JKB	2024-09-17 21:00:04	2024-09-17 21:00:04
2108	121	Jēkabpils Municipality	042	2024-09-17 21:00:04	2024-09-17 21:00:04
2109	121	Jelgava	JEL	2024-09-17 21:00:04	2024-09-17 21:00:04
2110	121	Jelgava Municipality	041	2024-09-17 21:00:04	2024-09-17 21:00:04
2111	121	Jūrmala	JUR	2024-09-17 21:00:04	2024-09-17 21:00:04
2112	121	Kandava Municipality	043	2024-09-17 21:00:04	2024-09-17 21:00:04
2113	121	Kārsava Municipality	044	2024-09-17 21:00:04	2024-09-17 21:00:04
2114	121	Ķegums Municipality	051	2024-09-17 21:00:04	2024-09-17 21:00:04
2115	121	Ķekava Municipality	052	2024-09-17 21:00:04	2024-09-17 21:00:04
2116	121	Kocēni Municipality	045	2024-09-17 21:00:04	2024-09-17 21:00:04
2117	121	Koknese Municipality	046	2024-09-17 21:00:04	2024-09-17 21:00:04
2118	121	Krāslava Municipality	047	2024-09-17 21:00:04	2024-09-17 21:00:04
2119	121	Krimulda Municipality	048	2024-09-17 21:00:04	2024-09-17 21:00:04
2120	121	Krustpils Municipality	049	2024-09-17 21:00:04	2024-09-17 21:00:04
2121	121	Kuldīga Municipality	050	2024-09-17 21:00:04	2024-09-17 21:00:04
2122	121	Lielvārde Municipality	053	2024-09-17 21:00:04	2024-09-17 21:00:04
2123	121	Liepāja	LPX	2024-09-17 21:00:04	2024-09-17 21:00:04
2124	121	Līgatne Municipality	055	2024-09-17 21:00:04	2024-09-17 21:00:04
2125	121	Limbaži Municipality	054	2024-09-17 21:00:04	2024-09-17 21:00:04
2126	121	Līvāni Municipality	056	2024-09-17 21:00:04	2024-09-17 21:00:04
2127	121	Lubāna Municipality	057	2024-09-17 21:00:04	2024-09-17 21:00:04
2128	121	Ludza Municipality	058	2024-09-17 21:00:04	2024-09-17 21:00:04
2129	121	Madona Municipality	059	2024-09-17 21:00:04	2024-09-17 21:00:04
2130	121	Mālpils Municipality	061	2024-09-17 21:00:04	2024-09-17 21:00:04
2131	121	Mārupe Municipality	062	2024-09-17 21:00:04	2024-09-17 21:00:04
2132	121	Mazsalaca Municipality	060	2024-09-17 21:00:04	2024-09-17 21:00:04
2133	121	Mērsrags Municipality	063	2024-09-17 21:00:04	2024-09-17 21:00:04
2134	121	Naukšēni Municipality	064	2024-09-17 21:00:04	2024-09-17 21:00:04
2135	121	Nereta Municipality	065	2024-09-17 21:00:04	2024-09-17 21:00:04
2136	121	Nīca Municipality	066	2024-09-17 21:00:04	2024-09-17 21:00:04
2137	121	Ogre Municipality	067	2024-09-17 21:00:04	2024-09-17 21:00:04
2138	121	Olaine Municipality	068	2024-09-17 21:00:04	2024-09-17 21:00:04
2139	121	Ozolnieki Municipality	069	2024-09-17 21:00:04	2024-09-17 21:00:04
2140	121	Pārgauja Municipality	070	2024-09-17 21:00:04	2024-09-17 21:00:04
2141	121	Pāvilosta Municipality	071	2024-09-17 21:00:04	2024-09-17 21:00:04
2142	121	Pļaviņas Municipality	072	2024-09-17 21:00:04	2024-09-17 21:00:04
2143	121	Preiļi Municipality	073	2024-09-17 21:00:04	2024-09-17 21:00:04
2144	121	Priekule Municipality	074	2024-09-17 21:00:04	2024-09-17 21:00:04
2145	121	Priekuļi Municipality	075	2024-09-17 21:00:04	2024-09-17 21:00:04
2146	121	Rauna Municipality	076	2024-09-17 21:00:04	2024-09-17 21:00:04
2147	121	Rēzekne	REZ	2024-09-17 21:00:04	2024-09-17 21:00:04
2148	121	Rēzekne Municipality	077	2024-09-17 21:00:04	2024-09-17 21:00:04
2149	121	Riebiņi Municipality	078	2024-09-17 21:00:04	2024-09-17 21:00:04
2150	121	Riga	RIX	2024-09-17 21:00:04	2024-09-17 21:00:04
2151	121	Roja Municipality	079	2024-09-17 21:00:04	2024-09-17 21:00:04
2152	121	Ropaži Municipality	080	2024-09-17 21:00:04	2024-09-17 21:00:04
2153	121	Rucava Municipality	081	2024-09-17 21:00:04	2024-09-17 21:00:04
2154	121	Rugāji Municipality	082	2024-09-17 21:00:04	2024-09-17 21:00:04
2155	121	Rūjiena Municipality	084	2024-09-17 21:00:04	2024-09-17 21:00:04
2156	121	Rundāle Municipality	083	2024-09-17 21:00:04	2024-09-17 21:00:04
2157	121	Sala Municipality	085	2024-09-17 21:00:04	2024-09-17 21:00:04
2158	121	Salacgrīva Municipality	086	2024-09-17 21:00:04	2024-09-17 21:00:04
2159	121	Salaspils Municipality	087	2024-09-17 21:00:04	2024-09-17 21:00:04
2160	121	Saldus Municipality	088	2024-09-17 21:00:04	2024-09-17 21:00:04
2161	121	Saulkrasti Municipality	089	2024-09-17 21:00:04	2024-09-17 21:00:04
2162	121	Sēja Municipality	090	2024-09-17 21:00:04	2024-09-17 21:00:04
2163	121	Sigulda Municipality	091	2024-09-17 21:00:04	2024-09-17 21:00:04
2164	121	Skrīveri Municipality	092	2024-09-17 21:00:04	2024-09-17 21:00:04
2165	121	Skrunda Municipality	093	2024-09-17 21:00:04	2024-09-17 21:00:04
2166	121	Smiltene Municipality	094	2024-09-17 21:00:04	2024-09-17 21:00:04
2167	121	Stopiņi Municipality	095	2024-09-17 21:00:04	2024-09-17 21:00:04
2168	121	Strenči Municipality	096	2024-09-17 21:00:04	2024-09-17 21:00:04
2169	121	Talsi Municipality	097	2024-09-17 21:00:04	2024-09-17 21:00:04
2170	121	Tērvete Municipality	098	2024-09-17 21:00:04	2024-09-17 21:00:04
2171	121	Tukums Municipality	099	2024-09-17 21:00:04	2024-09-17 21:00:04
2172	121	Vaiņode Municipality	100	2024-09-17 21:00:04	2024-09-17 21:00:04
2173	121	Valka Municipality	101	2024-09-17 21:00:04	2024-09-17 21:00:04
2174	121	Valmiera	VMR	2024-09-17 21:00:04	2024-09-17 21:00:04
2175	121	Varakļāni Municipality	102	2024-09-17 21:00:04	2024-09-17 21:00:04
2176	121	Vārkava Municipality	103	2024-09-17 21:00:04	2024-09-17 21:00:04
2177	121	Vecpiebalga Municipality	104	2024-09-17 21:00:04	2024-09-17 21:00:04
2178	121	Vecumnieki Municipality	105	2024-09-17 21:00:04	2024-09-17 21:00:04
2179	121	Ventspils	VEN	2024-09-17 21:00:04	2024-09-17 21:00:04
2180	121	Ventspils Municipality	106	2024-09-17 21:00:04	2024-09-17 21:00:04
2181	121	Viesīte Municipality	107	2024-09-17 21:00:04	2024-09-17 21:00:04
2182	121	Viļaka Municipality	108	2024-09-17 21:00:04	2024-09-17 21:00:04
2183	121	Viļāni Municipality	109	2024-09-17 21:00:04	2024-09-17 21:00:04
2184	121	Zilupe Municipality	110	2024-09-17 21:00:04	2024-09-17 21:00:04
2185	122	Akkar Governorate	AK	2024-09-17 21:00:04	2024-09-17 21:00:04
2186	122	Baalbek-Hermel Governorate	BH	2024-09-17 21:00:04	2024-09-17 21:00:04
2187	122	Beirut Governorate	BA	2024-09-17 21:00:04	2024-09-17 21:00:04
2188	122	Beqaa Governorate	BI	2024-09-17 21:00:04	2024-09-17 21:00:04
2189	122	Mount Lebanon Governorate	JL	2024-09-17 21:00:04	2024-09-17 21:00:04
2190	122	Nabatieh Governorate	NA	2024-09-17 21:00:04	2024-09-17 21:00:04
2191	122	North Governorate	AS	2024-09-17 21:00:04	2024-09-17 21:00:04
2192	122	South Governorate	JA	2024-09-17 21:00:04	2024-09-17 21:00:04
2193	123	Berea District	D	2024-09-17 21:00:05	2024-09-17 21:00:05
2194	123	Butha-Buthe District	B	2024-09-17 21:00:05	2024-09-17 21:00:05
2195	123	Leribe District	C	2024-09-17 21:00:05	2024-09-17 21:00:05
2196	123	Mafeteng District	E	2024-09-17 21:00:05	2024-09-17 21:00:05
2197	123	Maseru District	A	2024-09-17 21:00:05	2024-09-17 21:00:05
2198	123	Mohale's Hoek District	F	2024-09-17 21:00:05	2024-09-17 21:00:05
2199	123	Mokhotlong District	J	2024-09-17 21:00:05	2024-09-17 21:00:05
2200	123	Qacha's Nek District	H	2024-09-17 21:00:05	2024-09-17 21:00:05
2201	123	Quthing District	G	2024-09-17 21:00:05	2024-09-17 21:00:05
2202	123	Thaba-Tseka District	K	2024-09-17 21:00:05	2024-09-17 21:00:05
2203	124	Bomi County	BM	2024-09-17 21:00:05	2024-09-17 21:00:05
2204	124	Bong County	BG	2024-09-17 21:00:05	2024-09-17 21:00:05
2205	124	Gbarpolu County	GP	2024-09-17 21:00:05	2024-09-17 21:00:05
2206	124	Grand Bassa County	GB	2024-09-17 21:00:05	2024-09-17 21:00:05
2207	124	Grand Cape Mount County	CM	2024-09-17 21:00:05	2024-09-17 21:00:05
2208	124	Grand Gedeh County	GG	2024-09-17 21:00:05	2024-09-17 21:00:05
2209	124	Grand Kru County	GK	2024-09-17 21:00:05	2024-09-17 21:00:05
2210	124	Lofa County	LO	2024-09-17 21:00:05	2024-09-17 21:00:05
2211	124	Margibi County	MG	2024-09-17 21:00:05	2024-09-17 21:00:05
2212	124	Maryland County	MY	2024-09-17 21:00:05	2024-09-17 21:00:05
2213	124	Montserrado County	MO	2024-09-17 21:00:05	2024-09-17 21:00:05
2214	124	Nimba	NI	2024-09-17 21:00:05	2024-09-17 21:00:05
2215	124	River Cess County	RI	2024-09-17 21:00:05	2024-09-17 21:00:05
2216	124	River Gee County	RG	2024-09-17 21:00:05	2024-09-17 21:00:05
2217	124	Sinoe County	SI	2024-09-17 21:00:05	2024-09-17 21:00:05
2218	125	Al Wahat District	WA	2024-09-17 21:00:05	2024-09-17 21:00:05
2219	125	Benghazi	BA	2024-09-17 21:00:05	2024-09-17 21:00:05
2220	125	Derna District	DR	2024-09-17 21:00:05	2024-09-17 21:00:05
2221	125	Ghat District	GT	2024-09-17 21:00:05	2024-09-17 21:00:05
2222	125	Jabal al Akhdar	JA	2024-09-17 21:00:05	2024-09-17 21:00:05
2223	125	Jabal al Gharbi District	JG	2024-09-17 21:00:05	2024-09-17 21:00:05
2224	125	Jafara	JI	2024-09-17 21:00:05	2024-09-17 21:00:05
2225	125	Jufra	JU	2024-09-17 21:00:05	2024-09-17 21:00:05
2226	125	Kufra District	KF	2024-09-17 21:00:05	2024-09-17 21:00:05
2227	125	Marj District	MJ	2024-09-17 21:00:05	2024-09-17 21:00:05
2228	125	Misrata District	MI	2024-09-17 21:00:05	2024-09-17 21:00:05
2229	125	Murqub	MB	2024-09-17 21:00:05	2024-09-17 21:00:05
2230	125	Murzuq District	MQ	2024-09-17 21:00:05	2024-09-17 21:00:05
2231	125	Nalut District	NL	2024-09-17 21:00:05	2024-09-17 21:00:05
2232	125	Nuqat al Khams	NQ	2024-09-17 21:00:05	2024-09-17 21:00:05
2233	125	Sabha District	SB	2024-09-17 21:00:05	2024-09-17 21:00:05
2234	125	Sirte District	SR	2024-09-17 21:00:05	2024-09-17 21:00:05
2235	125	Tripoli District	TB	2024-09-17 21:00:05	2024-09-17 21:00:05
2236	125	Wadi al Hayaa District	WD	2024-09-17 21:00:05	2024-09-17 21:00:05
2237	125	Wadi al Shatii District	WS	2024-09-17 21:00:05	2024-09-17 21:00:05
2238	125	Zawiya District	ZA	2024-09-17 21:00:05	2024-09-17 21:00:05
2239	126	Balzers	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2240	126	Eschen	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2241	126	Gamprin	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2242	126	Mauren	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2243	126	Planken	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2244	126	Ruggell	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2245	126	Schaan	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2246	126	Schellenberg	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2247	126	Triesen	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2248	126	Triesenberg	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2249	126	Vaduz	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2250	127	Akmenė District Municipality	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2251	127	Alytus City Municipality	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2252	127	Alytus County	AL	2024-09-17 21:00:05	2024-09-17 21:00:05
2253	127	Alytus District Municipality	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2254	127	Birštonas Municipality	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2255	127	Biržai District Municipality	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2256	127	Druskininkai municipality	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2257	127	Elektrėnai municipality	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2258	127	Ignalina District Municipality	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2259	127	Jonava District Municipality	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2260	127	Joniškis District Municipality	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2261	127	Jurbarkas District Municipality	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2262	127	Kaišiadorys District Municipality	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2263	127	Kalvarija municipality	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2264	127	Kaunas City Municipality	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2265	127	Kaunas County	KU	2024-09-17 21:00:05	2024-09-17 21:00:05
2266	127	Kaunas District Municipality	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2267	127	Kazlų Rūda municipality	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2268	127	Kėdainiai District Municipality	18	2024-09-17 21:00:05	2024-09-17 21:00:05
2269	127	Kelmė District Municipality	19	2024-09-17 21:00:05	2024-09-17 21:00:05
2270	127	Klaipeda City Municipality	20	2024-09-17 21:00:05	2024-09-17 21:00:05
2271	127	Klaipėda County	KL	2024-09-17 21:00:05	2024-09-17 21:00:05
2272	127	Klaipėda District Municipality	21	2024-09-17 21:00:05	2024-09-17 21:00:05
2273	127	Kretinga District Municipality	22	2024-09-17 21:00:05	2024-09-17 21:00:05
2274	127	Kupiškis District Municipality	23	2024-09-17 21:00:05	2024-09-17 21:00:05
2275	127	Lazdijai District Municipality	24	2024-09-17 21:00:05	2024-09-17 21:00:05
2276	127	Marijampolė County	MR	2024-09-17 21:00:05	2024-09-17 21:00:05
2277	127	Marijampolė Municipality	25	2024-09-17 21:00:05	2024-09-17 21:00:05
2278	127	Mažeikiai District Municipality	26	2024-09-17 21:00:05	2024-09-17 21:00:05
2279	127	Molėtai District Municipality	27	2024-09-17 21:00:05	2024-09-17 21:00:05
2280	127	Neringa Municipality	28	2024-09-17 21:00:05	2024-09-17 21:00:05
2281	127	Pagėgiai municipality	29	2024-09-17 21:00:05	2024-09-17 21:00:05
2282	127	Pakruojis District Municipality	30	2024-09-17 21:00:05	2024-09-17 21:00:05
2283	127	Palanga City Municipality	31	2024-09-17 21:00:05	2024-09-17 21:00:05
2284	127	Panevėžys City Municipality	32	2024-09-17 21:00:05	2024-09-17 21:00:05
2285	127	Panevėžys County	PN	2024-09-17 21:00:05	2024-09-17 21:00:05
2286	127	Panevėžys District Municipality	33	2024-09-17 21:00:05	2024-09-17 21:00:05
2287	127	Pasvalys District Municipality	34	2024-09-17 21:00:05	2024-09-17 21:00:05
2288	127	Plungė District Municipality	35	2024-09-17 21:00:05	2024-09-17 21:00:05
2289	127	Prienai District Municipality	36	2024-09-17 21:00:05	2024-09-17 21:00:05
2290	127	Radviliškis District Municipality	37	2024-09-17 21:00:05	2024-09-17 21:00:05
2291	127	Raseiniai District Municipality	38	2024-09-17 21:00:05	2024-09-17 21:00:05
2292	127	Rietavas municipality	39	2024-09-17 21:00:05	2024-09-17 21:00:05
2293	127	Rokiškis District Municipality	40	2024-09-17 21:00:05	2024-09-17 21:00:05
2294	127	Šakiai District Municipality	41	2024-09-17 21:00:05	2024-09-17 21:00:05
2295	127	Šalčininkai District Municipality	42	2024-09-17 21:00:05	2024-09-17 21:00:05
2296	127	Šiauliai City Municipality	43	2024-09-17 21:00:05	2024-09-17 21:00:05
2297	127	Šiauliai County	SA	2024-09-17 21:00:05	2024-09-17 21:00:05
2298	127	Šiauliai District Municipality	44	2024-09-17 21:00:05	2024-09-17 21:00:05
2299	127	Šilalė District Municipality	45	2024-09-17 21:00:05	2024-09-17 21:00:05
2300	127	Šilutė District Municipality	46	2024-09-17 21:00:05	2024-09-17 21:00:05
2301	127	Širvintos District Municipality	47	2024-09-17 21:00:05	2024-09-17 21:00:05
2302	127	Skuodas District Municipality	48	2024-09-17 21:00:05	2024-09-17 21:00:05
2303	127	Švenčionys District Municipality	49	2024-09-17 21:00:05	2024-09-17 21:00:05
2304	127	Tauragė County	TA	2024-09-17 21:00:05	2024-09-17 21:00:05
2305	127	Tauragė District Municipality	50	2024-09-17 21:00:05	2024-09-17 21:00:05
2306	127	Telšiai County	TE	2024-09-17 21:00:05	2024-09-17 21:00:05
2307	127	Telšiai District Municipality	51	2024-09-17 21:00:05	2024-09-17 21:00:05
2308	127	Trakai District Municipality	52	2024-09-17 21:00:05	2024-09-17 21:00:05
2309	127	Ukmergė District Municipality	53	2024-09-17 21:00:05	2024-09-17 21:00:05
2310	127	Utena County	UT	2024-09-17 21:00:05	2024-09-17 21:00:05
2311	127	Utena District Municipality	54	2024-09-17 21:00:05	2024-09-17 21:00:05
2312	127	Varėna District Municipality	55	2024-09-17 21:00:05	2024-09-17 21:00:05
2313	127	Vilkaviškis District Municipality	56	2024-09-17 21:00:05	2024-09-17 21:00:05
2314	127	Vilnius City Municipality	57	2024-09-17 21:00:05	2024-09-17 21:00:05
2315	127	Vilnius County	VL	2024-09-17 21:00:05	2024-09-17 21:00:05
2316	127	Vilnius District Municipality	58	2024-09-17 21:00:05	2024-09-17 21:00:05
2317	127	Visaginas Municipality	59	2024-09-17 21:00:05	2024-09-17 21:00:05
2318	127	Zarasai District Municipality	60	2024-09-17 21:00:05	2024-09-17 21:00:05
2319	128	Canton of Capellen	CA	2024-09-17 21:00:05	2024-09-17 21:00:05
2320	128	Canton of Clervaux	CL	2024-09-17 21:00:05	2024-09-17 21:00:05
2321	128	Canton of Diekirch	DI	2024-09-17 21:00:05	2024-09-17 21:00:05
2322	128	Canton of Echternach	EC	2024-09-17 21:00:05	2024-09-17 21:00:05
2323	128	Canton of Esch-sur-Alzette	ES	2024-09-17 21:00:05	2024-09-17 21:00:05
2324	128	Canton of Grevenmacher	GR	2024-09-17 21:00:05	2024-09-17 21:00:05
2325	128	Canton of Luxembourg	LU	2024-09-17 21:00:05	2024-09-17 21:00:05
2326	128	Canton of Mersch	ME	2024-09-17 21:00:05	2024-09-17 21:00:05
2327	128	Canton of Redange	RD	2024-09-17 21:00:05	2024-09-17 21:00:05
2328	128	Canton of Remich	RM	2024-09-17 21:00:05	2024-09-17 21:00:05
2329	128	Canton of Vianden	VD	2024-09-17 21:00:05	2024-09-17 21:00:05
2330	128	Canton of Wiltz	WI	2024-09-17 21:00:05	2024-09-17 21:00:05
2331	128	Diekirch District	D	2024-09-17 21:00:05	2024-09-17 21:00:05
2332	128	Grevenmacher District	G	2024-09-17 21:00:05	2024-09-17 21:00:05
2333	128	Luxembourg District	L	2024-09-17 21:00:05	2024-09-17 21:00:05
2334	130	Aerodrom Municipality	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2335	130	Aračinovo Municipality	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2336	130	Berovo Municipality	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2337	130	Bitola Municipality	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2338	130	Bogdanci Municipality	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2339	130	Bogovinje Municipality	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2340	130	Bosilovo Municipality	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2341	130	Brvenica Municipality	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2342	130	Butel Municipality	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2343	130	Čair Municipality	79	2024-09-17 21:00:05	2024-09-17 21:00:05
2344	130	Čaška Municipality	80	2024-09-17 21:00:05	2024-09-17 21:00:05
2345	130	Centar Municipality	77	2024-09-17 21:00:05	2024-09-17 21:00:05
2346	130	Centar Župa Municipality	78	2024-09-17 21:00:05	2024-09-17 21:00:05
2347	130	Češinovo-Obleševo Municipality	81	2024-09-17 21:00:05	2024-09-17 21:00:05
2348	130	Čučer-Sandevo Municipality	82	2024-09-17 21:00:05	2024-09-17 21:00:05
2349	130	Debarca Municipality	22	2024-09-17 21:00:05	2024-09-17 21:00:05
2350	130	Delčevo Municipality	23	2024-09-17 21:00:05	2024-09-17 21:00:05
2351	130	Demir Hisar Municipality	25	2024-09-17 21:00:05	2024-09-17 21:00:05
2352	130	Demir Kapija Municipality	24	2024-09-17 21:00:05	2024-09-17 21:00:05
2353	130	Dojran Municipality	26	2024-09-17 21:00:05	2024-09-17 21:00:05
2354	130	Dolneni Municipality	27	2024-09-17 21:00:05	2024-09-17 21:00:05
2355	130	Drugovo Municipality	28	2024-09-17 21:00:05	2024-09-17 21:00:05
2356	130	Gazi Baba Municipality	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2357	130	Gevgelija Municipality	18	2024-09-17 21:00:05	2024-09-17 21:00:05
2358	130	Gjorče Petrov Municipality	29	2024-09-17 21:00:05	2024-09-17 21:00:05
2359	130	Gostivar Municipality	19	2024-09-17 21:00:05	2024-09-17 21:00:05
2360	130	Gradsko Municipality	20	2024-09-17 21:00:05	2024-09-17 21:00:05
2361	130	Greater Skopje	85	2024-09-17 21:00:05	2024-09-17 21:00:05
2362	130	Ilinden Municipality	34	2024-09-17 21:00:05	2024-09-17 21:00:05
2363	130	Jegunovce Municipality	35	2024-09-17 21:00:05	2024-09-17 21:00:05
2364	130	Karbinci	37	2024-09-17 21:00:05	2024-09-17 21:00:05
2365	130	Karpoš Municipality	38	2024-09-17 21:00:05	2024-09-17 21:00:05
2366	130	Kavadarci Municipality	36	2024-09-17 21:00:05	2024-09-17 21:00:05
2367	130	Kičevo Municipality	40	2024-09-17 21:00:05	2024-09-17 21:00:05
2368	130	Kisela Voda Municipality	39	2024-09-17 21:00:05	2024-09-17 21:00:05
2369	130	Kočani Municipality	42	2024-09-17 21:00:05	2024-09-17 21:00:05
2370	130	Konče Municipality	41	2024-09-17 21:00:05	2024-09-17 21:00:05
2371	130	Kratovo Municipality	43	2024-09-17 21:00:05	2024-09-17 21:00:05
2372	130	Kriva Palanka Municipality	44	2024-09-17 21:00:05	2024-09-17 21:00:05
2373	130	Krivogaštani Municipality	45	2024-09-17 21:00:05	2024-09-17 21:00:05
2374	130	Kruševo Municipality	46	2024-09-17 21:00:05	2024-09-17 21:00:05
2375	130	Kumanovo Municipality	47	2024-09-17 21:00:05	2024-09-17 21:00:05
2376	130	Lipkovo Municipality	48	2024-09-17 21:00:05	2024-09-17 21:00:05
2377	130	Lozovo Municipality	49	2024-09-17 21:00:05	2024-09-17 21:00:05
2378	130	Makedonska Kamenica Municipality	51	2024-09-17 21:00:05	2024-09-17 21:00:05
2379	130	Makedonski Brod Municipality	52	2024-09-17 21:00:05	2024-09-17 21:00:05
2380	130	Mavrovo and Rostuša Municipality	50	2024-09-17 21:00:05	2024-09-17 21:00:05
2381	130	Mogila Municipality	53	2024-09-17 21:00:05	2024-09-17 21:00:05
2382	130	Negotino Municipality	54	2024-09-17 21:00:05	2024-09-17 21:00:05
2383	130	Novaci Municipality	55	2024-09-17 21:00:05	2024-09-17 21:00:05
2384	130	Novo Selo Municipality	56	2024-09-17 21:00:05	2024-09-17 21:00:05
2385	130	Ohrid Municipality	58	2024-09-17 21:00:05	2024-09-17 21:00:05
2386	130	Oslomej Municipality	57	2024-09-17 21:00:05	2024-09-17 21:00:05
2387	130	Pehčevo Municipality	60	2024-09-17 21:00:05	2024-09-17 21:00:05
2388	130	Petrovec Municipality	59	2024-09-17 21:00:05	2024-09-17 21:00:05
2389	130	Plasnica Municipality	61	2024-09-17 21:00:05	2024-09-17 21:00:05
2390	130	Prilep Municipality	62	2024-09-17 21:00:05	2024-09-17 21:00:05
2391	130	Probištip Municipality	63	2024-09-17 21:00:05	2024-09-17 21:00:05
2392	130	Radoviš Municipality	64	2024-09-17 21:00:05	2024-09-17 21:00:05
2393	130	Rankovce Municipality	65	2024-09-17 21:00:05	2024-09-17 21:00:05
2394	130	Resen Municipality	66	2024-09-17 21:00:05	2024-09-17 21:00:05
2395	130	Rosoman Municipality	67	2024-09-17 21:00:05	2024-09-17 21:00:05
2396	130	Saraj Municipality	68	2024-09-17 21:00:05	2024-09-17 21:00:05
2397	130	Sopište Municipality	70	2024-09-17 21:00:05	2024-09-17 21:00:05
2398	130	Staro Nagoričane Municipality	71	2024-09-17 21:00:05	2024-09-17 21:00:05
2399	130	Štip Municipality	83	2024-09-17 21:00:05	2024-09-17 21:00:05
2400	130	Struga Municipality	72	2024-09-17 21:00:05	2024-09-17 21:00:05
2401	130	Strumica Municipality	73	2024-09-17 21:00:05	2024-09-17 21:00:05
2402	130	Studeničani Municipality	74	2024-09-17 21:00:05	2024-09-17 21:00:05
2403	130	Šuto Orizari Municipality	84	2024-09-17 21:00:05	2024-09-17 21:00:05
2404	130	Sveti Nikole Municipality	69	2024-09-17 21:00:05	2024-09-17 21:00:05
2405	130	Tearce Municipality	75	2024-09-17 21:00:05	2024-09-17 21:00:05
2406	130	Tetovo Municipality	76	2024-09-17 21:00:05	2024-09-17 21:00:05
2407	130	Valandovo Municipality	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2408	130	Vasilevo Municipality	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2409	130	Veles Municipality	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2410	130	Vevčani Municipality	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2411	130	Vinica Municipality	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2412	130	Vraneštica Municipality	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2413	130	Vrapčište Municipality	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2414	130	Zajas Municipality	31	2024-09-17 21:00:05	2024-09-17 21:00:05
2415	130	Zelenikovo Municipality	32	2024-09-17 21:00:05	2024-09-17 21:00:05
2416	130	Želino Municipality	30	2024-09-17 21:00:05	2024-09-17 21:00:05
2417	130	Zrnovci Municipality	33	2024-09-17 21:00:05	2024-09-17 21:00:05
2418	131	Antananarivo Province	T	2024-09-17 21:00:05	2024-09-17 21:00:05
2419	131	Antsiranana Province	D	2024-09-17 21:00:05	2024-09-17 21:00:05
2420	131	Fianarantsoa Province	F	2024-09-17 21:00:05	2024-09-17 21:00:05
2421	131	Mahajanga Province	M	2024-09-17 21:00:05	2024-09-17 21:00:05
2422	131	Toamasina Province	A	2024-09-17 21:00:05	2024-09-17 21:00:05
2423	131	Toliara Province	U	2024-09-17 21:00:05	2024-09-17 21:00:05
2424	132	Balaka District	BA	2024-09-17 21:00:05	2024-09-17 21:00:05
2425	132	Blantyre District	BL	2024-09-17 21:00:05	2024-09-17 21:00:05
2426	132	Central Region	C	2024-09-17 21:00:05	2024-09-17 21:00:05
2427	132	Chikwawa District	CK	2024-09-17 21:00:05	2024-09-17 21:00:05
2428	132	Chiradzulu District	CR	2024-09-17 21:00:05	2024-09-17 21:00:05
2429	132	Chitipa district	CT	2024-09-17 21:00:05	2024-09-17 21:00:05
2430	132	Dedza District	DE	2024-09-17 21:00:05	2024-09-17 21:00:05
2431	132	Dowa District	DO	2024-09-17 21:00:05	2024-09-17 21:00:05
2432	132	Karonga District	KR	2024-09-17 21:00:05	2024-09-17 21:00:05
2433	132	Kasungu District	KS	2024-09-17 21:00:05	2024-09-17 21:00:05
2434	132	Likoma District	LK	2024-09-17 21:00:05	2024-09-17 21:00:05
2435	132	Lilongwe District	LI	2024-09-17 21:00:05	2024-09-17 21:00:05
2436	132	Machinga District	MH	2024-09-17 21:00:05	2024-09-17 21:00:05
2437	132	Mangochi District	MG	2024-09-17 21:00:05	2024-09-17 21:00:05
2438	132	Mchinji District	MC	2024-09-17 21:00:05	2024-09-17 21:00:05
2439	132	Mulanje District	MU	2024-09-17 21:00:05	2024-09-17 21:00:05
2440	132	Mwanza District	MW	2024-09-17 21:00:05	2024-09-17 21:00:05
2441	132	Mzimba District	MZ	2024-09-17 21:00:05	2024-09-17 21:00:05
2442	132	Nkhata Bay District	NB	2024-09-17 21:00:05	2024-09-17 21:00:05
2443	132	Nkhotakota District	NK	2024-09-17 21:00:05	2024-09-17 21:00:05
2444	132	Northern Region	N	2024-09-17 21:00:05	2024-09-17 21:00:05
2445	132	Nsanje District	NS	2024-09-17 21:00:05	2024-09-17 21:00:05
2446	132	Ntcheu District	NU	2024-09-17 21:00:05	2024-09-17 21:00:05
2447	132	Ntchisi District	NI	2024-09-17 21:00:05	2024-09-17 21:00:05
2448	132	Phalombe District	PH	2024-09-17 21:00:05	2024-09-17 21:00:05
2449	132	Rumphi District	RU	2024-09-17 21:00:05	2024-09-17 21:00:05
2450	132	Salima District	SA	2024-09-17 21:00:05	2024-09-17 21:00:05
2451	132	Southern Region	S	2024-09-17 21:00:05	2024-09-17 21:00:05
2452	132	Thyolo District	TH	2024-09-17 21:00:05	2024-09-17 21:00:05
2453	132	Zomba District	ZO	2024-09-17 21:00:05	2024-09-17 21:00:05
2454	133	Johor	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2455	133	Kedah	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2456	133	Kelantan	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2457	133	Kuala Lumpur	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2458	133	Labuan	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2459	133	Malacca	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2460	133	Negeri Sembilan	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2461	133	Pahang	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2462	133	Penang	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2463	133	Perak	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2464	133	Perlis	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2465	133	Putrajaya	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2466	133	Sabah	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2467	133	Sarawak	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2468	133	Selangor	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2469	133	Terengganu	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2470	134	Addu Atoll	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2471	134	Alif Alif Atoll	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2472	134	Alif Dhaal Atoll	00	2024-09-17 21:00:05	2024-09-17 21:00:05
2473	134	Central Province	CE	2024-09-17 21:00:05	2024-09-17 21:00:05
2474	134	Dhaalu Atoll	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2475	134	Faafu Atoll	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2476	134	Gaafu Alif Atoll	27	2024-09-17 21:00:05	2024-09-17 21:00:05
2477	134	Gaafu Dhaalu Atoll	28	2024-09-17 21:00:05	2024-09-17 21:00:05
2478	134	Gnaviyani Atoll	29	2024-09-17 21:00:05	2024-09-17 21:00:05
2479	134	Haa Alif Atoll	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2480	134	Haa Dhaalu Atoll	23	2024-09-17 21:00:05	2024-09-17 21:00:05
2481	134	Kaafu Atoll	26	2024-09-17 21:00:05	2024-09-17 21:00:05
2482	134	Laamu Atoll	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2483	134	Lhaviyani Atoll	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2484	134	Malé	MLE	2024-09-17 21:00:05	2024-09-17 21:00:05
2485	134	Meemu Atoll	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2486	134	Noonu Atoll	25	2024-09-17 21:00:05	2024-09-17 21:00:05
2487	134	North Central Province	NC	2024-09-17 21:00:05	2024-09-17 21:00:05
2488	134	North Province	NO	2024-09-17 21:00:05	2024-09-17 21:00:05
2489	134	Raa Atoll	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2490	134	Shaviyani Atoll	24	2024-09-17 21:00:05	2024-09-17 21:00:05
2491	134	South Central Province	SC	2024-09-17 21:00:05	2024-09-17 21:00:05
2492	134	South Province	SU	2024-09-17 21:00:05	2024-09-17 21:00:05
2493	134	Thaa Atoll	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2494	134	Upper South Province	US	2024-09-17 21:00:05	2024-09-17 21:00:05
2495	134	Vaavu Atoll	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2496	135	Bamako	BKO	2024-09-17 21:00:05	2024-09-17 21:00:05
2497	135	Gao Region	7	2024-09-17 21:00:05	2024-09-17 21:00:05
2498	135	Kayes Region	1	2024-09-17 21:00:05	2024-09-17 21:00:05
2499	135	Kidal Region	8	2024-09-17 21:00:05	2024-09-17 21:00:05
2500	135	Koulikoro Region	2	2024-09-17 21:00:05	2024-09-17 21:00:05
2501	135	Ménaka Region	9	2024-09-17 21:00:05	2024-09-17 21:00:05
2502	135	Mopti Region	5	2024-09-17 21:00:05	2024-09-17 21:00:05
2503	135	Ségou Region	4	2024-09-17 21:00:05	2024-09-17 21:00:05
2504	135	Sikasso Region	3	2024-09-17 21:00:05	2024-09-17 21:00:05
2505	135	Taoudénit Region	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2506	135	Tombouctou Region	6	2024-09-17 21:00:05	2024-09-17 21:00:05
2507	136	Attard	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2508	136	Balzan	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2509	136	Birgu	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2510	136	Birkirkara	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2511	136	Birżebbuġa	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2512	136	Cospicua	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2513	136	Dingli	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2514	136	Fgura	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2515	136	Floriana	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2516	136	Fontana	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2517	136	Għajnsielem	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2518	136	Għarb	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2519	136	Għargħur	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2520	136	Għasri	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2521	136	Għaxaq	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2522	136	Gudja	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2523	136	Gżira	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2524	136	Ħamrun	18	2024-09-17 21:00:05	2024-09-17 21:00:05
2525	136	Iklin	19	2024-09-17 21:00:05	2024-09-17 21:00:05
2526	136	Kalkara	21	2024-09-17 21:00:05	2024-09-17 21:00:05
2527	136	Kerċem	22	2024-09-17 21:00:05	2024-09-17 21:00:05
2528	136	Kirkop	23	2024-09-17 21:00:05	2024-09-17 21:00:05
2529	136	Lija	24	2024-09-17 21:00:05	2024-09-17 21:00:05
2530	136	Luqa	25	2024-09-17 21:00:05	2024-09-17 21:00:05
2531	136	Marsa	26	2024-09-17 21:00:05	2024-09-17 21:00:05
2532	136	Marsaskala	27	2024-09-17 21:00:05	2024-09-17 21:00:05
2533	136	Marsaxlokk	28	2024-09-17 21:00:05	2024-09-17 21:00:05
2534	136	Mdina	29	2024-09-17 21:00:05	2024-09-17 21:00:05
2535	136	Mellieħa	30	2024-09-17 21:00:05	2024-09-17 21:00:05
2536	136	Mġarr	31	2024-09-17 21:00:05	2024-09-17 21:00:05
2537	136	Mosta	32	2024-09-17 21:00:05	2024-09-17 21:00:05
2538	136	Mqabba	33	2024-09-17 21:00:05	2024-09-17 21:00:05
2539	136	Msida	34	2024-09-17 21:00:05	2024-09-17 21:00:05
2540	136	Mtarfa	35	2024-09-17 21:00:05	2024-09-17 21:00:05
2541	136	Munxar	36	2024-09-17 21:00:05	2024-09-17 21:00:05
2542	136	Nadur	37	2024-09-17 21:00:05	2024-09-17 21:00:05
2543	136	Naxxar	38	2024-09-17 21:00:05	2024-09-17 21:00:05
2544	136	Paola	39	2024-09-17 21:00:05	2024-09-17 21:00:05
2545	136	Pembroke	40	2024-09-17 21:00:05	2024-09-17 21:00:05
2546	136	Pietà	41	2024-09-17 21:00:05	2024-09-17 21:00:05
2547	136	Qala	42	2024-09-17 21:00:05	2024-09-17 21:00:05
2548	136	Qormi	43	2024-09-17 21:00:05	2024-09-17 21:00:05
2549	136	Qrendi	44	2024-09-17 21:00:05	2024-09-17 21:00:05
2550	136	Rabat	46	2024-09-17 21:00:05	2024-09-17 21:00:05
2551	136	Saint Lawrence	50	2024-09-17 21:00:05	2024-09-17 21:00:05
2552	136	San Ġwann	49	2024-09-17 21:00:05	2024-09-17 21:00:05
2553	136	Sannat	52	2024-09-17 21:00:05	2024-09-17 21:00:05
2554	136	Santa Luċija	53	2024-09-17 21:00:05	2024-09-17 21:00:05
2555	136	Santa Venera	54	2024-09-17 21:00:05	2024-09-17 21:00:05
2556	136	Senglea	20	2024-09-17 21:00:05	2024-09-17 21:00:05
2557	136	Siġġiewi	55	2024-09-17 21:00:05	2024-09-17 21:00:05
2558	136	Sliema	56	2024-09-17 21:00:05	2024-09-17 21:00:05
2559	136	St. Julian's	48	2024-09-17 21:00:05	2024-09-17 21:00:05
2560	136	St. Paul's Bay	51	2024-09-17 21:00:05	2024-09-17 21:00:05
2561	136	Swieqi	57	2024-09-17 21:00:05	2024-09-17 21:00:05
2562	136	Ta' Xbiex	58	2024-09-17 21:00:05	2024-09-17 21:00:05
2563	136	Tarxien	59	2024-09-17 21:00:05	2024-09-17 21:00:05
2564	136	Valletta	60	2024-09-17 21:00:05	2024-09-17 21:00:05
2565	136	Victoria	45	2024-09-17 21:00:05	2024-09-17 21:00:05
2566	136	Xagħra	61	2024-09-17 21:00:05	2024-09-17 21:00:05
2567	136	Xewkija	62	2024-09-17 21:00:05	2024-09-17 21:00:05
2568	136	Xgħajra	63	2024-09-17 21:00:05	2024-09-17 21:00:05
2569	136	Żabbar	64	2024-09-17 21:00:05	2024-09-17 21:00:05
2570	136	Żebbuġ Gozo	65	2024-09-17 21:00:05	2024-09-17 21:00:05
2571	136	Żebbuġ Malta	66	2024-09-17 21:00:05	2024-09-17 21:00:05
2572	136	Żejtun	67	2024-09-17 21:00:05	2024-09-17 21:00:05
2573	136	Żurrieq	68	2024-09-17 21:00:05	2024-09-17 21:00:05
2574	138	Ralik Chain	L	2024-09-17 21:00:05	2024-09-17 21:00:05
2575	138	Ratak Chain	T	2024-09-17 21:00:05	2024-09-17 21:00:05
2576	140	Adrar Region	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2577	140	Assaba Region	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2578	140	Brakna Region	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2579	140	Dakhlet Nouadhibou	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2580	140	Gorgol Region	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2581	140	Guidimaka Region	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2582	140	Hodh Ech Chargui Region	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2583	140	Hodh El Gharbi Region	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2584	140	Inchiri Region	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2585	140	Nouakchott-Nord Region	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2586	140	Nouakchott-Ouest Region	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2587	140	Nouakchott-Sud Region	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2588	140	Tagant Region	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2589	140	Tiris Zemmour Region	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2590	140	Trarza Region	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2591	141	Agaléga	AG	2024-09-17 21:00:05	2024-09-17 21:00:05
2592	141	Beau Bassin-Rose Hill	BR	2024-09-17 21:00:05	2024-09-17 21:00:05
2593	141	Cargados Carajos	CC	2024-09-17 21:00:05	2024-09-17 21:00:05
2594	141	Curepipe	CU	2024-09-17 21:00:05	2024-09-17 21:00:05
2595	141	Flacq District	FL	2024-09-17 21:00:05	2024-09-17 21:00:05
2596	141	Grand Port District	GP	2024-09-17 21:00:05	2024-09-17 21:00:05
2597	141	Moka District	MO	2024-09-17 21:00:05	2024-09-17 21:00:05
2598	141	Pamplemousses District	PA	2024-09-17 21:00:05	2024-09-17 21:00:05
2599	141	Plaines Wilhems District	PW	2024-09-17 21:00:05	2024-09-17 21:00:05
2600	141	Port Louis	PU	2024-09-17 21:00:05	2024-09-17 21:00:05
2601	141	Port Louis District	PL	2024-09-17 21:00:05	2024-09-17 21:00:05
2602	141	Quatre Bornes	QB	2024-09-17 21:00:05	2024-09-17 21:00:05
2603	141	Rivière du Rempart District	RR	2024-09-17 21:00:05	2024-09-17 21:00:05
2604	141	Rivière Noire District	BL	2024-09-17 21:00:05	2024-09-17 21:00:05
2605	141	Rodrigues	RO	2024-09-17 21:00:05	2024-09-17 21:00:05
2606	141	Savanne District	SA	2024-09-17 21:00:05	2024-09-17 21:00:05
2607	141	Vacoas-Phoenix	VP	2024-09-17 21:00:05	2024-09-17 21:00:05
2608	143	Aguascalientes	AGU	2024-09-17 21:00:05	2024-09-17 21:00:05
2609	143	Baja California	BCN	2024-09-17 21:00:05	2024-09-17 21:00:05
2610	143	Baja California Sur	BCS	2024-09-17 21:00:05	2024-09-17 21:00:05
2611	143	Campeche	CAM	2024-09-17 21:00:05	2024-09-17 21:00:05
2612	143	Chiapas	CHP	2024-09-17 21:00:05	2024-09-17 21:00:05
2613	143	Chihuahua	CHH	2024-09-17 21:00:05	2024-09-17 21:00:05
2614	143	Coahuila	COA	2024-09-17 21:00:05	2024-09-17 21:00:05
2615	143	Colima	COL	2024-09-17 21:00:05	2024-09-17 21:00:05
2616	143	Durango	DUR	2024-09-17 21:00:05	2024-09-17 21:00:05
2617	143	Guanajuato	GUA	2024-09-17 21:00:05	2024-09-17 21:00:05
2618	143	Guerrero	GRO	2024-09-17 21:00:05	2024-09-17 21:00:05
2619	143	Hidalgo	HID	2024-09-17 21:00:05	2024-09-17 21:00:05
2620	143	Jalisco	JAL	2024-09-17 21:00:05	2024-09-17 21:00:05
2621	143	México	MEX	2024-09-17 21:00:05	2024-09-17 21:00:05
2622	143	Mexico City	CMX	2024-09-17 21:00:05	2024-09-17 21:00:05
2623	143	Michoacán	MIC	2024-09-17 21:00:05	2024-09-17 21:00:05
2624	143	Morelos	MOR	2024-09-17 21:00:05	2024-09-17 21:00:05
2625	143	Nayarit	NAY	2024-09-17 21:00:05	2024-09-17 21:00:05
2626	143	Nuevo León	NLE	2024-09-17 21:00:05	2024-09-17 21:00:05
2627	143	Oaxaca	OAX	2024-09-17 21:00:05	2024-09-17 21:00:05
2628	143	Puebla	PUE	2024-09-17 21:00:05	2024-09-17 21:00:05
2629	143	Querétaro	QUE	2024-09-17 21:00:05	2024-09-17 21:00:05
2630	143	Quintana Roo	ROO	2024-09-17 21:00:05	2024-09-17 21:00:05
2631	143	San Luis Potosí	SLP	2024-09-17 21:00:05	2024-09-17 21:00:05
2632	143	Sinaloa	SIN	2024-09-17 21:00:05	2024-09-17 21:00:05
2633	143	Sonora	SON	2024-09-17 21:00:05	2024-09-17 21:00:05
2634	143	Tabasco	TAB	2024-09-17 21:00:05	2024-09-17 21:00:05
2635	143	Tamaulipas	TAM	2024-09-17 21:00:05	2024-09-17 21:00:05
2636	143	Tlaxcala	TLA	2024-09-17 21:00:05	2024-09-17 21:00:05
2637	143	Veracruz	VER	2024-09-17 21:00:05	2024-09-17 21:00:05
2638	143	Yucatán	YUC	2024-09-17 21:00:05	2024-09-17 21:00:05
2639	143	Zacatecas	ZAC	2024-09-17 21:00:05	2024-09-17 21:00:05
2640	144	Chuuk State	TRK	2024-09-17 21:00:05	2024-09-17 21:00:05
2641	144	Kosrae State	KSA	2024-09-17 21:00:05	2024-09-17 21:00:05
2642	144	Pohnpei State	PNI	2024-09-17 21:00:05	2024-09-17 21:00:05
2643	144	Yap State	YAP	2024-09-17 21:00:05	2024-09-17 21:00:05
2644	145	Anenii Noi District	AN	2024-09-17 21:00:05	2024-09-17 21:00:05
2645	145	Bălți Municipality	BA	2024-09-17 21:00:05	2024-09-17 21:00:05
2646	145	Basarabeasca District	BS	2024-09-17 21:00:05	2024-09-17 21:00:05
2647	145	Bender Municipality	BD	2024-09-17 21:00:05	2024-09-17 21:00:05
2648	145	Briceni District	BR	2024-09-17 21:00:05	2024-09-17 21:00:05
2649	145	Cahul District	CA	2024-09-17 21:00:05	2024-09-17 21:00:05
2650	145	Călărași District	CL	2024-09-17 21:00:05	2024-09-17 21:00:05
2651	145	Cantemir District	CT	2024-09-17 21:00:05	2024-09-17 21:00:05
2652	145	Căușeni District	CS	2024-09-17 21:00:05	2024-09-17 21:00:05
2653	145	Chișinău Municipality	CU	2024-09-17 21:00:05	2024-09-17 21:00:05
2654	145	Cimișlia District	CM	2024-09-17 21:00:05	2024-09-17 21:00:05
2655	145	Criuleni District	CR	2024-09-17 21:00:05	2024-09-17 21:00:05
2656	145	Dondușeni District	DO	2024-09-17 21:00:05	2024-09-17 21:00:05
2657	145	Drochia District	DR	2024-09-17 21:00:05	2024-09-17 21:00:05
2658	145	Dubăsari District	DU	2024-09-17 21:00:05	2024-09-17 21:00:05
2659	145	Edineț District	ED	2024-09-17 21:00:05	2024-09-17 21:00:05
2660	145	Fălești District	FA	2024-09-17 21:00:05	2024-09-17 21:00:05
2661	145	Florești District	FL	2024-09-17 21:00:05	2024-09-17 21:00:05
2662	145	Gagauzia	GA	2024-09-17 21:00:05	2024-09-17 21:00:05
2663	145	Glodeni District	GL	2024-09-17 21:00:05	2024-09-17 21:00:05
2664	145	Hîncești District	HI	2024-09-17 21:00:05	2024-09-17 21:00:05
2665	145	Ialoveni District	IA	2024-09-17 21:00:05	2024-09-17 21:00:05
2666	145	Nisporeni District	NI	2024-09-17 21:00:05	2024-09-17 21:00:05
2667	145	Ocnița District	OC	2024-09-17 21:00:05	2024-09-17 21:00:05
2668	145	Orhei District	OR	2024-09-17 21:00:05	2024-09-17 21:00:05
2669	145	Rezina District	RE	2024-09-17 21:00:05	2024-09-17 21:00:05
2670	145	Rîșcani District	RI	2024-09-17 21:00:05	2024-09-17 21:00:05
2671	145	Sîngerei District	SI	2024-09-17 21:00:05	2024-09-17 21:00:05
2672	145	Șoldănești District	SD	2024-09-17 21:00:05	2024-09-17 21:00:05
2673	145	Soroca District	SO	2024-09-17 21:00:05	2024-09-17 21:00:05
2674	145	Ștefan Vodă District	SV	2024-09-17 21:00:05	2024-09-17 21:00:05
2675	145	Strășeni District	ST	2024-09-17 21:00:05	2024-09-17 21:00:05
2676	145	Taraclia District	TA	2024-09-17 21:00:05	2024-09-17 21:00:05
2677	145	Telenești District	TE	2024-09-17 21:00:05	2024-09-17 21:00:05
2678	145	Transnistria autonomous territorial unit	SN	2024-09-17 21:00:05	2024-09-17 21:00:05
2679	145	Ungheni District	UN	2024-09-17 21:00:05	2024-09-17 21:00:05
2680	146	La Colle	CL	2024-09-17 21:00:05	2024-09-17 21:00:05
2681	146	La Condamine	CO	2024-09-17 21:00:05	2024-09-17 21:00:05
2682	146	Moneghetti	MG	2024-09-17 21:00:05	2024-09-17 21:00:05
2683	147	Arkhangai Province	073	2024-09-17 21:00:05	2024-09-17 21:00:05
2684	147	Bayan-Ölgii Province	071	2024-09-17 21:00:05	2024-09-17 21:00:05
2685	147	Bayankhongor Province	069	2024-09-17 21:00:05	2024-09-17 21:00:05
2686	147	Bulgan Province	067	2024-09-17 21:00:05	2024-09-17 21:00:05
2687	147	Darkhan-Uul Province	037	2024-09-17 21:00:05	2024-09-17 21:00:05
2688	147	Dornod Province	061	2024-09-17 21:00:05	2024-09-17 21:00:05
2689	147	Dornogovi Province	063	2024-09-17 21:00:05	2024-09-17 21:00:05
2690	147	Dundgovi Province	059	2024-09-17 21:00:05	2024-09-17 21:00:05
2691	147	Govi-Altai Province	065	2024-09-17 21:00:05	2024-09-17 21:00:05
2692	147	Govisümber Province	064	2024-09-17 21:00:05	2024-09-17 21:00:05
2693	147	Khentii Province	039	2024-09-17 21:00:05	2024-09-17 21:00:05
2694	147	Khovd Province	043	2024-09-17 21:00:05	2024-09-17 21:00:05
2695	147	Khövsgöl Province	041	2024-09-17 21:00:05	2024-09-17 21:00:05
2696	147	Ömnögovi Province	053	2024-09-17 21:00:05	2024-09-17 21:00:05
2697	147	Orkhon Province	035	2024-09-17 21:00:05	2024-09-17 21:00:05
2698	147	Övörkhangai Province	055	2024-09-17 21:00:05	2024-09-17 21:00:05
2699	147	Selenge Province	049	2024-09-17 21:00:05	2024-09-17 21:00:05
2700	147	Sükhbaatar Province	051	2024-09-17 21:00:05	2024-09-17 21:00:05
2701	147	Töv Province	047	2024-09-17 21:00:05	2024-09-17 21:00:05
2702	147	Uvs Province	046	2024-09-17 21:00:05	2024-09-17 21:00:05
2703	147	Zavkhan Province	057	2024-09-17 21:00:05	2024-09-17 21:00:05
2704	148	Andrijevica Municipality	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2705	148	Bar Municipality	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2706	148	Berane Municipality	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2707	148	Bijelo Polje Municipality	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2708	148	Budva Municipality	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2709	148	Danilovgrad Municipality	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2710	148	Gusinje Municipality	22	2024-09-17 21:00:05	2024-09-17 21:00:05
2711	148	Kolašin Municipality	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2712	148	Kotor Municipality	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2713	148	Mojkovac Municipality	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2714	148	Nikšić Municipality	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2715	148	Old Royal Capital Cetinje	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2716	148	Petnjica Municipality	23	2024-09-17 21:00:05	2024-09-17 21:00:05
2717	148	Plav Municipality	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2718	148	Pljevlja Municipality	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2719	148	Plužine Municipality	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2720	148	Podgorica Municipality	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2721	148	Rožaje Municipality	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2722	148	Šavnik Municipality	18	2024-09-17 21:00:05	2024-09-17 21:00:05
2723	148	Tivat Municipality	19	2024-09-17 21:00:05	2024-09-17 21:00:05
2724	148	Ulcinj Municipality	20	2024-09-17 21:00:05	2024-09-17 21:00:05
2725	148	Žabljak Municipality	21	2024-09-17 21:00:05	2024-09-17 21:00:05
2726	150	Agadir-Ida-Ou-Tanane	AGD	2024-09-17 21:00:05	2024-09-17 21:00:05
2727	150	Al Haouz	HAO	2024-09-17 21:00:05	2024-09-17 21:00:05
2728	150	Al Hoceïma	HOC	2024-09-17 21:00:05	2024-09-17 21:00:05
2729	150	Aousserd (EH)	AOU	2024-09-17 21:00:05	2024-09-17 21:00:05
2730	150	Assa-Zag (EH-partial)	ASZ	2024-09-17 21:00:05	2024-09-17 21:00:05
2731	150	Azilal	AZI	2024-09-17 21:00:05	2024-09-17 21:00:05
2732	150	Béni Mellal	BEM	2024-09-17 21:00:05	2024-09-17 21:00:05
2733	150	Béni Mellal-Khénifra	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2734	150	Benslimane	BES	2024-09-17 21:00:05	2024-09-17 21:00:05
2735	150	Berkane	BER	2024-09-17 21:00:05	2024-09-17 21:00:05
2736	150	Berrechid	BRR	2024-09-17 21:00:05	2024-09-17 21:00:05
2737	150	Boujdour (EH)	BOD	2024-09-17 21:00:05	2024-09-17 21:00:05
2738	150	Boulemane	BOM	2024-09-17 21:00:05	2024-09-17 21:00:05
2739	150	Casablanca	CAS	2024-09-17 21:00:05	2024-09-17 21:00:05
2740	150	Casablanca-Settat	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2741	150	Chefchaouen	CHE	2024-09-17 21:00:05	2024-09-17 21:00:05
2742	150	Chichaoua	CHI	2024-09-17 21:00:05	2024-09-17 21:00:05
2743	150	Chtouka-Ait Baha	CHT	2024-09-17 21:00:05	2024-09-17 21:00:05
2744	150	Dakhla-Oued Ed-Dahab (EH)	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2745	150	Drâa-Tafilalet	08	2024-09-17 21:00:05	2024-09-17 21:00:05
2746	150	Driouch	DRI	2024-09-17 21:00:05	2024-09-17 21:00:05
2747	150	El Hajeb	HAJ	2024-09-17 21:00:05	2024-09-17 21:00:05
2748	150	El Jadida	JDI	2024-09-17 21:00:05	2024-09-17 21:00:05
2749	150	El Kelâa des Sraghna	KES	2024-09-17 21:00:05	2024-09-17 21:00:05
2750	150	Errachidia	ERR	2024-09-17 21:00:05	2024-09-17 21:00:05
2751	150	Es-Semara (EH-partial)	ESM	2024-09-17 21:00:05	2024-09-17 21:00:05
2752	150	Essaouira	ESI	2024-09-17 21:00:05	2024-09-17 21:00:05
2753	150	Fahs-Anjra	FAH	2024-09-17 21:00:05	2024-09-17 21:00:05
2754	150	Fès	FES	2024-09-17 21:00:05	2024-09-17 21:00:05
2755	150	Fès-Meknès	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2756	150	Figuig	FIG	2024-09-17 21:00:05	2024-09-17 21:00:05
2757	150	Fquih Ben Salah	FQH	2024-09-17 21:00:05	2024-09-17 21:00:05
2758	150	Guelmim	GUE	2024-09-17 21:00:05	2024-09-17 21:00:05
2759	150	Guelmim-Oued Noun (EH-partial)	10	2024-09-17 21:00:05	2024-09-17 21:00:05
2760	150	Guercif	GUF	2024-09-17 21:00:05	2024-09-17 21:00:05
2761	150	Ifrane	IFR	2024-09-17 21:00:05	2024-09-17 21:00:05
2762	150	Inezgane-Ait Melloul	INE	2024-09-17 21:00:05	2024-09-17 21:00:05
2763	150	Jerada	JRA	2024-09-17 21:00:05	2024-09-17 21:00:05
2764	150	Kénitra	KEN	2024-09-17 21:00:05	2024-09-17 21:00:05
2765	150	Khémisset	KHE	2024-09-17 21:00:05	2024-09-17 21:00:05
2766	150	Khénifra	KHN	2024-09-17 21:00:05	2024-09-17 21:00:05
2767	150	Khouribga	KHO	2024-09-17 21:00:05	2024-09-17 21:00:05
2768	150	L'Oriental	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2769	150	Laâyoune (EH)	LAA	2024-09-17 21:00:05	2024-09-17 21:00:05
2770	150	Laâyoune-Sakia El Hamra (EH-partial)	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2771	150	Larache	LAR	2024-09-17 21:00:05	2024-09-17 21:00:05
2772	150	M’diq-Fnideq	MDF	2024-09-17 21:00:05	2024-09-17 21:00:05
2773	150	Marrakech	MAR	2024-09-17 21:00:05	2024-09-17 21:00:05
2774	150	Marrakesh-Safi	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2775	150	Médiouna	MED	2024-09-17 21:00:05	2024-09-17 21:00:05
2776	150	Meknès	MEK	2024-09-17 21:00:05	2024-09-17 21:00:05
2777	150	Midelt	MID	2024-09-17 21:00:05	2024-09-17 21:00:05
2778	150	Mohammadia	MOH	2024-09-17 21:00:05	2024-09-17 21:00:05
2779	150	Moulay Yacoub	MOU	2024-09-17 21:00:05	2024-09-17 21:00:05
2780	150	Nador	NAD	2024-09-17 21:00:05	2024-09-17 21:00:05
2781	150	Nouaceur	NOU	2024-09-17 21:00:05	2024-09-17 21:00:05
2782	150	Ouarzazate	OUA	2024-09-17 21:00:05	2024-09-17 21:00:05
2783	150	Oued Ed-Dahab (EH)	OUD	2024-09-17 21:00:05	2024-09-17 21:00:05
2784	150	Ouezzane	OUZ	2024-09-17 21:00:05	2024-09-17 21:00:05
2785	150	Oujda-Angad	OUJ	2024-09-17 21:00:05	2024-09-17 21:00:05
2786	150	Rabat	RAB	2024-09-17 21:00:05	2024-09-17 21:00:05
2787	150	Rabat-Salé-Kénitra	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2788	150	Rehamna	REH	2024-09-17 21:00:05	2024-09-17 21:00:05
2789	150	Safi	SAF	2024-09-17 21:00:05	2024-09-17 21:00:05
2790	150	Salé	SAL	2024-09-17 21:00:05	2024-09-17 21:00:05
2791	150	Sefrou	SEF	2024-09-17 21:00:05	2024-09-17 21:00:05
2792	150	Settat	SET	2024-09-17 21:00:05	2024-09-17 21:00:05
2793	150	Sidi Bennour	SIB	2024-09-17 21:00:05	2024-09-17 21:00:05
2794	150	Sidi Ifni	SIF	2024-09-17 21:00:05	2024-09-17 21:00:05
2795	150	Sidi Kacem	SIK	2024-09-17 21:00:05	2024-09-17 21:00:05
2796	150	Sidi Slimane	SIL	2024-09-17 21:00:05	2024-09-17 21:00:05
2797	150	Skhirate-Témara	SKH	2024-09-17 21:00:05	2024-09-17 21:00:05
2798	150	Souss-Massa	09	2024-09-17 21:00:05	2024-09-17 21:00:05
2799	150	Tan-Tan (EH-partial)	TNT	2024-09-17 21:00:05	2024-09-17 21:00:05
2800	150	Tanger-Assilah	TNG	2024-09-17 21:00:05	2024-09-17 21:00:05
2801	150	Tanger-Tétouan-Al Hoceïma	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2802	150	Taounate	TAO	2024-09-17 21:00:05	2024-09-17 21:00:05
2803	150	Taourirt	TAI	2024-09-17 21:00:05	2024-09-17 21:00:05
2804	150	Tarfaya (EH-partial)	TAF	2024-09-17 21:00:05	2024-09-17 21:00:05
2805	150	Taroudannt	TAR	2024-09-17 21:00:05	2024-09-17 21:00:05
2806	150	Tata	TAT	2024-09-17 21:00:05	2024-09-17 21:00:05
2807	150	Taza	TAZ	2024-09-17 21:00:05	2024-09-17 21:00:05
2808	150	Tétouan	TET	2024-09-17 21:00:05	2024-09-17 21:00:05
2809	150	Tinghir	TIN	2024-09-17 21:00:05	2024-09-17 21:00:05
2810	150	Tiznit	TIZ	2024-09-17 21:00:05	2024-09-17 21:00:05
2811	150	Youssoufia	YUS	2024-09-17 21:00:05	2024-09-17 21:00:05
2812	150	Zagora	ZAG	2024-09-17 21:00:05	2024-09-17 21:00:05
2813	151	Cabo Delgado Province	P	2024-09-17 21:00:05	2024-09-17 21:00:05
2814	151	Gaza Province	G	2024-09-17 21:00:05	2024-09-17 21:00:05
2815	151	Inhambane Province	I	2024-09-17 21:00:05	2024-09-17 21:00:05
2816	151	Manica Province	B	2024-09-17 21:00:05	2024-09-17 21:00:05
2817	151	Maputo	MPM	2024-09-17 21:00:05	2024-09-17 21:00:05
2818	151	Maputo Province	L	2024-09-17 21:00:05	2024-09-17 21:00:05
2819	151	Nampula Province	N	2024-09-17 21:00:05	2024-09-17 21:00:05
2820	151	Niassa Province	A	2024-09-17 21:00:05	2024-09-17 21:00:05
2821	151	Sofala Province	S	2024-09-17 21:00:05	2024-09-17 21:00:05
2822	151	Tete Province	T	2024-09-17 21:00:05	2024-09-17 21:00:05
2823	151	Zambezia Province	Q	2024-09-17 21:00:05	2024-09-17 21:00:05
2824	152	Ayeyarwady Region	07	2024-09-17 21:00:05	2024-09-17 21:00:05
2825	152	Bago	02	2024-09-17 21:00:05	2024-09-17 21:00:05
2826	152	Chin State	14	2024-09-17 21:00:05	2024-09-17 21:00:05
2827	152	Kachin State	11	2024-09-17 21:00:05	2024-09-17 21:00:05
2828	152	Kayah State	12	2024-09-17 21:00:05	2024-09-17 21:00:05
2829	152	Kayin State	13	2024-09-17 21:00:05	2024-09-17 21:00:05
2830	152	Magway Region	03	2024-09-17 21:00:05	2024-09-17 21:00:05
2831	152	Mandalay Region	04	2024-09-17 21:00:05	2024-09-17 21:00:05
2832	152	Mon State	15	2024-09-17 21:00:05	2024-09-17 21:00:05
2833	152	Naypyidaw Union Territory	18	2024-09-17 21:00:05	2024-09-17 21:00:05
2834	152	Rakhine State	16	2024-09-17 21:00:05	2024-09-17 21:00:05
2835	152	Sagaing Region	01	2024-09-17 21:00:05	2024-09-17 21:00:05
2836	152	Shan State	17	2024-09-17 21:00:05	2024-09-17 21:00:05
2837	152	Tanintharyi Region	05	2024-09-17 21:00:05	2024-09-17 21:00:05
2838	152	Yangon Region	06	2024-09-17 21:00:05	2024-09-17 21:00:05
2839	153	Erongo Region	ER	2024-09-17 21:00:05	2024-09-17 21:00:05
2840	153	Hardap Region	HA	2024-09-17 21:00:05	2024-09-17 21:00:05
2841	153	Karas Region	KA	2024-09-17 21:00:05	2024-09-17 21:00:05
2842	153	Kavango East Region	KE	2024-09-17 21:00:05	2024-09-17 21:00:05
2843	153	Kavango West Region	KW	2024-09-17 21:00:05	2024-09-17 21:00:05
2844	153	Khomas Region	KH	2024-09-17 21:00:05	2024-09-17 21:00:05
2845	153	Kunene Region	KU	2024-09-17 21:00:06	2024-09-17 21:00:06
2846	153	Ohangwena Region	OW	2024-09-17 21:00:06	2024-09-17 21:00:06
2847	153	Omaheke Region	OH	2024-09-17 21:00:06	2024-09-17 21:00:06
2848	153	Omusati Region	OS	2024-09-17 21:00:06	2024-09-17 21:00:06
2849	153	Oshana Region	ON	2024-09-17 21:00:06	2024-09-17 21:00:06
2850	153	Oshikoto Region	OT	2024-09-17 21:00:06	2024-09-17 21:00:06
2851	153	Otjozondjupa Region	OD	2024-09-17 21:00:06	2024-09-17 21:00:06
2852	153	Zambezi Region	CA	2024-09-17 21:00:06	2024-09-17 21:00:06
2853	154	Aiwo District	01	2024-09-17 21:00:06	2024-09-17 21:00:06
2854	154	Anabar District	02	2024-09-17 21:00:06	2024-09-17 21:00:06
2855	154	Anetan District	03	2024-09-17 21:00:06	2024-09-17 21:00:06
2856	154	Anibare District	04	2024-09-17 21:00:06	2024-09-17 21:00:06
2857	154	Baiti District	05	2024-09-17 21:00:06	2024-09-17 21:00:06
2858	154	Boe District	06	2024-09-17 21:00:06	2024-09-17 21:00:06
2859	154	Buada District	07	2024-09-17 21:00:06	2024-09-17 21:00:06
2860	154	Denigomodu District	08	2024-09-17 21:00:06	2024-09-17 21:00:06
2861	154	Ewa District	09	2024-09-17 21:00:06	2024-09-17 21:00:06
2862	154	Ijuw District	10	2024-09-17 21:00:06	2024-09-17 21:00:06
2863	154	Meneng District	11	2024-09-17 21:00:06	2024-09-17 21:00:06
2864	154	Nibok District	12	2024-09-17 21:00:06	2024-09-17 21:00:06
2865	154	Uaboe District	13	2024-09-17 21:00:06	2024-09-17 21:00:06
2866	154	Yaren District	14	2024-09-17 21:00:06	2024-09-17 21:00:06
2867	155	Bagmati Zone	BA	2024-09-17 21:00:06	2024-09-17 21:00:06
2868	155	Bheri Zone	BH	2024-09-17 21:00:06	2024-09-17 21:00:06
2869	155	Central Region	1	2024-09-17 21:00:06	2024-09-17 21:00:06
2870	155	Dhaulagiri Zone	DH	2024-09-17 21:00:06	2024-09-17 21:00:06
2871	155	Eastern Development Region	4	2024-09-17 21:00:06	2024-09-17 21:00:06
2872	155	Far-Western Development Region	5	2024-09-17 21:00:06	2024-09-17 21:00:06
2873	155	Gandaki Zone	GA	2024-09-17 21:00:06	2024-09-17 21:00:06
2874	155	Janakpur Zone	JA	2024-09-17 21:00:06	2024-09-17 21:00:06
2875	155	Karnali Zone	KA	2024-09-17 21:00:06	2024-09-17 21:00:06
2876	155	Kosi Zone	KO	2024-09-17 21:00:06	2024-09-17 21:00:06
2877	155	Lumbini Zone	LU	2024-09-17 21:00:06	2024-09-17 21:00:06
2878	155	Mahakali Zone	MA	2024-09-17 21:00:06	2024-09-17 21:00:06
2879	155	Mechi Zone	ME	2024-09-17 21:00:06	2024-09-17 21:00:06
2880	155	Mid-Western Region	2	2024-09-17 21:00:06	2024-09-17 21:00:06
2881	155	Narayani Zone	NA	2024-09-17 21:00:06	2024-09-17 21:00:06
2882	155	Rapti Zone	RA	2024-09-17 21:00:06	2024-09-17 21:00:06
2883	155	Sagarmatha Zone	SA	2024-09-17 21:00:06	2024-09-17 21:00:06
2884	155	Seti Zone	SE	2024-09-17 21:00:06	2024-09-17 21:00:06
2885	155	Western Region	3	2024-09-17 21:00:06	2024-09-17 21:00:06
2886	156	Bonaire	BQ1	2024-09-17 21:00:06	2024-09-17 21:00:06
2887	156	Drenthe	DR	2024-09-17 21:00:06	2024-09-17 21:00:06
2888	156	Flevoland	FL	2024-09-17 21:00:06	2024-09-17 21:00:06
2889	156	Friesland	FR	2024-09-17 21:00:06	2024-09-17 21:00:06
2890	156	Gelderland	GE	2024-09-17 21:00:06	2024-09-17 21:00:06
2891	156	Groningen	GR	2024-09-17 21:00:06	2024-09-17 21:00:06
2892	156	Limburg	LI	2024-09-17 21:00:06	2024-09-17 21:00:06
2893	156	North Brabant	NB	2024-09-17 21:00:06	2024-09-17 21:00:06
2894	156	North Holland	NH	2024-09-17 21:00:06	2024-09-17 21:00:06
2895	156	Overijssel	OV	2024-09-17 21:00:06	2024-09-17 21:00:06
2896	156	Saba	BQ2	2024-09-17 21:00:06	2024-09-17 21:00:06
2897	156	Sint Eustatius	BQ3	2024-09-17 21:00:06	2024-09-17 21:00:06
2898	156	South Holland	ZH	2024-09-17 21:00:06	2024-09-17 21:00:06
2899	156	Utrecht	UT	2024-09-17 21:00:06	2024-09-17 21:00:06
2900	156	Zeeland	ZE	2024-09-17 21:00:06	2024-09-17 21:00:06
2901	158	Auckland Region	AUK	2024-09-17 21:00:06	2024-09-17 21:00:06
2902	158	Bay of Plenty Region	BOP	2024-09-17 21:00:06	2024-09-17 21:00:06
2903	158	Canterbury Region	CAN	2024-09-17 21:00:06	2024-09-17 21:00:06
2904	158	Chatham Islands	CIT	2024-09-17 21:00:06	2024-09-17 21:00:06
2905	158	Gisborne District	GIS	2024-09-17 21:00:06	2024-09-17 21:00:06
2906	158	Hawke's Bay Region	HKB	2024-09-17 21:00:06	2024-09-17 21:00:06
2907	158	Manawatu-Wanganui Region	MWT	2024-09-17 21:00:06	2024-09-17 21:00:06
2908	158	Marlborough Region	MBH	2024-09-17 21:00:06	2024-09-17 21:00:06
2909	158	Nelson Region	NSN	2024-09-17 21:00:06	2024-09-17 21:00:06
2910	158	Northland Region	NTL	2024-09-17 21:00:06	2024-09-17 21:00:06
2911	158	Otago Region	OTA	2024-09-17 21:00:06	2024-09-17 21:00:06
2912	158	Southland Region	STL	2024-09-17 21:00:06	2024-09-17 21:00:06
2913	158	Taranaki Region	TKI	2024-09-17 21:00:06	2024-09-17 21:00:06
2914	158	Tasman District	TAS	2024-09-17 21:00:06	2024-09-17 21:00:06
2915	158	Waikato Region	WKO	2024-09-17 21:00:06	2024-09-17 21:00:06
2916	158	Wellington Region	WGN	2024-09-17 21:00:06	2024-09-17 21:00:06
2917	158	West Coast Region	WTC	2024-09-17 21:00:06	2024-09-17 21:00:06
2918	159	Boaco	BO	2024-09-17 21:00:06	2024-09-17 21:00:06
2919	159	Carazo	CA	2024-09-17 21:00:06	2024-09-17 21:00:06
2920	159	Chinandega	CI	2024-09-17 21:00:06	2024-09-17 21:00:06
2921	159	Chontales	CO	2024-09-17 21:00:06	2024-09-17 21:00:06
2922	159	Estelí	ES	2024-09-17 21:00:06	2024-09-17 21:00:06
2923	159	Granada	GR	2024-09-17 21:00:06	2024-09-17 21:00:06
2924	159	Jinotega	JI	2024-09-17 21:00:06	2024-09-17 21:00:06
2925	159	León	LE	2024-09-17 21:00:06	2024-09-17 21:00:06
2926	159	Madriz	MD	2024-09-17 21:00:06	2024-09-17 21:00:06
2927	159	Managua	MN	2024-09-17 21:00:06	2024-09-17 21:00:06
2928	159	Masaya	MS	2024-09-17 21:00:06	2024-09-17 21:00:06
2929	159	Matagalpa	MT	2024-09-17 21:00:06	2024-09-17 21:00:06
2930	159	North Caribbean Coast	AN	2024-09-17 21:00:06	2024-09-17 21:00:06
2931	159	Nueva Segovia\t	NS	2024-09-17 21:00:06	2024-09-17 21:00:06
2932	159	Río San Juan	SJ	2024-09-17 21:00:06	2024-09-17 21:00:06
2933	159	Rivas	RI	2024-09-17 21:00:06	2024-09-17 21:00:06
2934	159	South Caribbean Coast	AS	2024-09-17 21:00:06	2024-09-17 21:00:06
2935	160	Agadez Region	1	2024-09-17 21:00:06	2024-09-17 21:00:06
2936	160	Diffa Region	2	2024-09-17 21:00:06	2024-09-17 21:00:06
2937	160	Dosso Region	3	2024-09-17 21:00:06	2024-09-17 21:00:06
2938	160	Maradi Region	4	2024-09-17 21:00:06	2024-09-17 21:00:06
2939	160	Tahoua Region	5	2024-09-17 21:00:06	2024-09-17 21:00:06
2940	160	Tillabéri Region	6	2024-09-17 21:00:06	2024-09-17 21:00:06
2941	160	Zinder Region	7	2024-09-17 21:00:06	2024-09-17 21:00:06
2942	161	Abia	AB	2024-09-17 21:00:06	2024-09-17 21:00:06
2943	161	Abuja Federal Capital Territory	FC	2024-09-17 21:00:06	2024-09-17 21:00:06
2944	161	Adamawa	AD	2024-09-17 21:00:06	2024-09-17 21:00:06
2945	161	Akwa Ibom	AK	2024-09-17 21:00:06	2024-09-17 21:00:06
2946	161	Anambra	AN	2024-09-17 21:00:06	2024-09-17 21:00:06
2947	161	Bauchi	BA	2024-09-17 21:00:06	2024-09-17 21:00:06
2948	161	Bayelsa	BY	2024-09-17 21:00:06	2024-09-17 21:00:06
2949	161	Benue	BE	2024-09-17 21:00:06	2024-09-17 21:00:06
2950	161	Borno	BO	2024-09-17 21:00:06	2024-09-17 21:00:06
2951	161	Cross River	CR	2024-09-17 21:00:06	2024-09-17 21:00:06
2952	161	Delta	DE	2024-09-17 21:00:06	2024-09-17 21:00:06
2953	161	Ebonyi	EB	2024-09-17 21:00:06	2024-09-17 21:00:06
2954	161	Edo	ED	2024-09-17 21:00:06	2024-09-17 21:00:06
2955	161	Ekiti	EK	2024-09-17 21:00:06	2024-09-17 21:00:06
2956	161	Enugu	EN	2024-09-17 21:00:06	2024-09-17 21:00:06
2957	161	Gombe	GO	2024-09-17 21:00:06	2024-09-17 21:00:06
2958	161	Imo	IM	2024-09-17 21:00:06	2024-09-17 21:00:06
2959	161	Jigawa	JI	2024-09-17 21:00:06	2024-09-17 21:00:06
2960	161	Kaduna	KD	2024-09-17 21:00:06	2024-09-17 21:00:06
2961	161	Kano	KN	2024-09-17 21:00:06	2024-09-17 21:00:06
2962	161	Katsina	KT	2024-09-17 21:00:06	2024-09-17 21:00:06
2963	161	Kebbi	KE	2024-09-17 21:00:06	2024-09-17 21:00:06
2964	161	Kogi	KO	2024-09-17 21:00:06	2024-09-17 21:00:06
2965	161	Kwara	KW	2024-09-17 21:00:06	2024-09-17 21:00:06
2966	161	Lagos	LA	2024-09-17 21:00:06	2024-09-17 21:00:06
2967	161	Nasarawa	NA	2024-09-17 21:00:06	2024-09-17 21:00:06
2968	161	Niger	NI	2024-09-17 21:00:06	2024-09-17 21:00:06
2969	161	Ogun	OG	2024-09-17 21:00:06	2024-09-17 21:00:06
2970	161	Ondo	ON	2024-09-17 21:00:06	2024-09-17 21:00:06
2971	161	Osun	OS	2024-09-17 21:00:06	2024-09-17 21:00:06
2972	161	Oyo	OY	2024-09-17 21:00:06	2024-09-17 21:00:06
2973	161	Plateau	PL	2024-09-17 21:00:06	2024-09-17 21:00:06
2974	161	Rivers	RI	2024-09-17 21:00:06	2024-09-17 21:00:06
2975	161	Sokoto	SO	2024-09-17 21:00:06	2024-09-17 21:00:06
2976	161	Taraba	TA	2024-09-17 21:00:06	2024-09-17 21:00:06
2977	161	Yobe	YO	2024-09-17 21:00:06	2024-09-17 21:00:06
2978	161	Zamfara	ZA	2024-09-17 21:00:06	2024-09-17 21:00:06
2979	164	Chagang Province	04	2024-09-17 21:00:06	2024-09-17 21:00:06
2980	164	Kangwon Province	07	2024-09-17 21:00:06	2024-09-17 21:00:06
2981	164	North Hamgyong Province	09	2024-09-17 21:00:06	2024-09-17 21:00:06
2982	164	North Hwanghae Province	06	2024-09-17 21:00:06	2024-09-17 21:00:06
2983	164	North Pyongan Province	03	2024-09-17 21:00:06	2024-09-17 21:00:06
2984	164	Pyongyang	01	2024-09-17 21:00:06	2024-09-17 21:00:06
2985	164	Rason	13	2024-09-17 21:00:06	2024-09-17 21:00:06
2986	164	Ryanggang Province	10	2024-09-17 21:00:06	2024-09-17 21:00:06
2987	164	South Hamgyong Province	08	2024-09-17 21:00:06	2024-09-17 21:00:06
2988	164	South Hwanghae Province	05	2024-09-17 21:00:06	2024-09-17 21:00:06
2989	164	South Pyongan Province	02	2024-09-17 21:00:06	2024-09-17 21:00:06
2990	166	Akershus	02	2024-09-17 21:00:06	2024-09-17 21:00:06
2991	166	Buskerud	06	2024-09-17 21:00:06	2024-09-17 21:00:06
2992	166	Finnmark	20	2024-09-17 21:00:06	2024-09-17 21:00:06
2993	166	Hedmark	04	2024-09-17 21:00:06	2024-09-17 21:00:06
2994	166	Hordaland	12	2024-09-17 21:00:06	2024-09-17 21:00:06
2995	166	Jan Mayen	22	2024-09-17 21:00:06	2024-09-17 21:00:06
2996	166	Møre og Romsdal	15	2024-09-17 21:00:06	2024-09-17 21:00:06
2997	166	Nord-Trøndelag	17	2024-09-17 21:00:06	2024-09-17 21:00:06
2998	166	Nordland	18	2024-09-17 21:00:06	2024-09-17 21:00:06
2999	166	Oppland	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3000	166	Oslo	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3001	166	Østfold	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3002	166	Rogaland	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3003	166	Sogn og Fjordane	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3004	166	Sør-Trøndelag	16	2024-09-17 21:00:06	2024-09-17 21:00:06
3005	166	Svalbard	21	2024-09-17 21:00:06	2024-09-17 21:00:06
3006	166	Telemark	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3007	166	Troms	19	2024-09-17 21:00:06	2024-09-17 21:00:06
3008	166	Trøndelag	50	2024-09-17 21:00:06	2024-09-17 21:00:06
3009	166	Vest-Agder	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3010	166	Vestfold	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3011	167	Ad Dakhiliyah Governorate	DA	2024-09-17 21:00:06	2024-09-17 21:00:06
3012	167	Ad Dhahirah Governorate	ZA	2024-09-17 21:00:06	2024-09-17 21:00:06
3013	167	Al Batinah North Governorate	BS	2024-09-17 21:00:06	2024-09-17 21:00:06
3014	167	Al Batinah Region	BA	2024-09-17 21:00:06	2024-09-17 21:00:06
3015	167	Al Batinah South Governorate	BJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3016	167	Al Buraimi Governorate	BU	2024-09-17 21:00:06	2024-09-17 21:00:06
3017	167	Al Wusta Governorate	WU	2024-09-17 21:00:06	2024-09-17 21:00:06
3018	167	Ash Sharqiyah North Governorate	SS	2024-09-17 21:00:06	2024-09-17 21:00:06
3019	167	Ash Sharqiyah Region	SH	2024-09-17 21:00:06	2024-09-17 21:00:06
3020	167	Ash Sharqiyah South Governorate	SJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3021	167	Dhofar Governorate	ZU	2024-09-17 21:00:06	2024-09-17 21:00:06
3022	167	Musandam Governorate	MU	2024-09-17 21:00:06	2024-09-17 21:00:06
3023	167	Muscat Governorate	MA	2024-09-17 21:00:06	2024-09-17 21:00:06
3024	168	Azad Kashmir	JK	2024-09-17 21:00:06	2024-09-17 21:00:06
3025	168	Balochistan	BA	2024-09-17 21:00:06	2024-09-17 21:00:06
3026	168	Federally Administered Tribal Areas	TA	2024-09-17 21:00:06	2024-09-17 21:00:06
3027	168	Gilgit-Baltistan	GB	2024-09-17 21:00:06	2024-09-17 21:00:06
3028	168	Islamabad Capital Territory	IS	2024-09-17 21:00:06	2024-09-17 21:00:06
3029	168	Khyber Pakhtunkhwa	KP	2024-09-17 21:00:06	2024-09-17 21:00:06
3030	168	Punjab	PB	2024-09-17 21:00:06	2024-09-17 21:00:06
3031	168	Sindh	SD	2024-09-17 21:00:06	2024-09-17 21:00:06
3032	169	Aimeliik	002	2024-09-17 21:00:06	2024-09-17 21:00:06
3033	169	Airai	004	2024-09-17 21:00:06	2024-09-17 21:00:06
3034	169	Angaur	010	2024-09-17 21:00:06	2024-09-17 21:00:06
3035	169	Hatohobei	050	2024-09-17 21:00:06	2024-09-17 21:00:06
3036	169	Kayangel	100	2024-09-17 21:00:06	2024-09-17 21:00:06
3037	169	Koror	150	2024-09-17 21:00:06	2024-09-17 21:00:06
3038	169	Melekeok	212	2024-09-17 21:00:06	2024-09-17 21:00:06
3039	169	Ngaraard	214	2024-09-17 21:00:06	2024-09-17 21:00:06
3040	169	Ngarchelong	218	2024-09-17 21:00:06	2024-09-17 21:00:06
3041	169	Ngardmau	222	2024-09-17 21:00:06	2024-09-17 21:00:06
3042	169	Ngatpang	224	2024-09-17 21:00:06	2024-09-17 21:00:06
3043	169	Ngchesar	226	2024-09-17 21:00:06	2024-09-17 21:00:06
3044	169	Ngeremlengui	227	2024-09-17 21:00:06	2024-09-17 21:00:06
3045	169	Ngiwal	228	2024-09-17 21:00:06	2024-09-17 21:00:06
3046	169	Peleliu	350	2024-09-17 21:00:06	2024-09-17 21:00:06
3047	169	Sonsorol	370	2024-09-17 21:00:06	2024-09-17 21:00:06
3048	171	Bocas del Toro Province	1	2024-09-17 21:00:06	2024-09-17 21:00:06
3049	171	Chiriquí Province	4	2024-09-17 21:00:06	2024-09-17 21:00:06
3050	171	Coclé Province	2	2024-09-17 21:00:06	2024-09-17 21:00:06
3051	171	Colón Province	3	2024-09-17 21:00:06	2024-09-17 21:00:06
3052	171	Darién Province	5	2024-09-17 21:00:06	2024-09-17 21:00:06
3053	171	Emberá-Wounaan Comarca	EM	2024-09-17 21:00:06	2024-09-17 21:00:06
3054	171	Guna Yala	KY	2024-09-17 21:00:06	2024-09-17 21:00:06
3055	171	Herrera Province	6	2024-09-17 21:00:06	2024-09-17 21:00:06
3056	171	Los Santos Province	7	2024-09-17 21:00:06	2024-09-17 21:00:06
3057	171	Ngöbe-Buglé Comarca	NB	2024-09-17 21:00:06	2024-09-17 21:00:06
3058	171	Panamá Oeste Province	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3059	171	Panamá Province	8	2024-09-17 21:00:06	2024-09-17 21:00:06
3060	171	Veraguas Province	9	2024-09-17 21:00:06	2024-09-17 21:00:06
3061	172	Bougainville	NSB	2024-09-17 21:00:06	2024-09-17 21:00:06
3062	172	Central Province	CPM	2024-09-17 21:00:06	2024-09-17 21:00:06
3063	172	Chimbu Province	CPK	2024-09-17 21:00:06	2024-09-17 21:00:06
3064	172	East New Britain	EBR	2024-09-17 21:00:06	2024-09-17 21:00:06
3065	172	Eastern Highlands Province	EHG	2024-09-17 21:00:06	2024-09-17 21:00:06
3066	172	Enga Province	EPW	2024-09-17 21:00:06	2024-09-17 21:00:06
3067	172	Gulf	GPK	2024-09-17 21:00:06	2024-09-17 21:00:06
3068	172	Hela	HLA	2024-09-17 21:00:06	2024-09-17 21:00:06
3069	172	Jiwaka Province	JWK	2024-09-17 21:00:06	2024-09-17 21:00:06
3070	172	Madang Province	MPM	2024-09-17 21:00:06	2024-09-17 21:00:06
3071	172	Manus Province	MRL	2024-09-17 21:00:06	2024-09-17 21:00:06
3072	172	Milne Bay Province	MBA	2024-09-17 21:00:06	2024-09-17 21:00:06
3073	172	Morobe Province	MPL	2024-09-17 21:00:06	2024-09-17 21:00:06
3074	172	New Ireland Province	NIK	2024-09-17 21:00:06	2024-09-17 21:00:06
3075	172	Oro Province	NPP	2024-09-17 21:00:06	2024-09-17 21:00:06
3076	172	Port Moresby	NCD	2024-09-17 21:00:06	2024-09-17 21:00:06
3077	172	Sandaun Province	SAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3078	172	Southern Highlands Province	SHM	2024-09-17 21:00:06	2024-09-17 21:00:06
3079	172	West New Britain Province	WBK	2024-09-17 21:00:06	2024-09-17 21:00:06
3080	172	Western Highlands Province	WHM	2024-09-17 21:00:06	2024-09-17 21:00:06
3081	172	Western Province	WPD	2024-09-17 21:00:06	2024-09-17 21:00:06
3082	173	Alto Paraguay Department	16	2024-09-17 21:00:06	2024-09-17 21:00:06
3083	173	Alto Paraná Department	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3084	173	Amambay Department	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3085	173	Boquerón Department	19	2024-09-17 21:00:06	2024-09-17 21:00:06
3086	173	Caaguazú	5	2024-09-17 21:00:06	2024-09-17 21:00:06
3087	173	Caazapá	6	2024-09-17 21:00:06	2024-09-17 21:00:06
3088	173	Canindeyú	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3089	173	Central Department	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3090	173	Concepción Department	1	2024-09-17 21:00:06	2024-09-17 21:00:06
3091	173	Cordillera Department	3	2024-09-17 21:00:06	2024-09-17 21:00:06
3092	173	Guairá Department	4	2024-09-17 21:00:06	2024-09-17 21:00:06
3093	173	Itapúa	7	2024-09-17 21:00:06	2024-09-17 21:00:06
3094	173	Misiones Department	8	2024-09-17 21:00:06	2024-09-17 21:00:06
3095	173	Ñeembucú Department	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3096	173	Paraguarí Department	9	2024-09-17 21:00:06	2024-09-17 21:00:06
3097	173	Presidente Hayes Department	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3098	173	San Pedro Department	2	2024-09-17 21:00:06	2024-09-17 21:00:06
3099	174	Amazonas	AMA	2024-09-17 21:00:06	2024-09-17 21:00:06
3100	174	Áncash	ANC	2024-09-17 21:00:06	2024-09-17 21:00:06
3101	174	Apurímac	APU	2024-09-17 21:00:06	2024-09-17 21:00:06
3102	174	Arequipa	ARE	2024-09-17 21:00:06	2024-09-17 21:00:06
3103	174	Ayacucho	AYA	2024-09-17 21:00:06	2024-09-17 21:00:06
3104	174	Cajamarca	CAJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3105	174	Callao	CAL	2024-09-17 21:00:06	2024-09-17 21:00:06
3106	174	Cusco	CUS	2024-09-17 21:00:06	2024-09-17 21:00:06
3107	174	Huancavelica	HUV	2024-09-17 21:00:06	2024-09-17 21:00:06
3108	174	Huanuco	HUC	2024-09-17 21:00:06	2024-09-17 21:00:06
3109	174	Ica	ICA	2024-09-17 21:00:06	2024-09-17 21:00:06
3110	174	Junín	JUN	2024-09-17 21:00:06	2024-09-17 21:00:06
3111	174	La Libertad	LAL	2024-09-17 21:00:06	2024-09-17 21:00:06
3112	174	Lambayeque	LAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3113	174	Lima	LIM	2024-09-17 21:00:06	2024-09-17 21:00:06
3114	174	Loreto	LOR	2024-09-17 21:00:06	2024-09-17 21:00:06
3115	174	Madre de Dios	MDD	2024-09-17 21:00:06	2024-09-17 21:00:06
3116	174	Moquegua	MOQ	2024-09-17 21:00:06	2024-09-17 21:00:06
3117	174	Pasco	PAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3118	174	Piura	PIU	2024-09-17 21:00:06	2024-09-17 21:00:06
3119	174	Puno	PUN	2024-09-17 21:00:06	2024-09-17 21:00:06
3120	174	San Martín	SAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3121	174	Tacna	TAC	2024-09-17 21:00:06	2024-09-17 21:00:06
3122	174	Tumbes	TUM	2024-09-17 21:00:06	2024-09-17 21:00:06
3123	174	Ucayali	UCA	2024-09-17 21:00:06	2024-09-17 21:00:06
3124	175	Abra	ABR	2024-09-17 21:00:06	2024-09-17 21:00:06
3125	175	Agusan del Norte	AGN	2024-09-17 21:00:06	2024-09-17 21:00:06
3126	175	Agusan del Sur	AGS	2024-09-17 21:00:06	2024-09-17 21:00:06
3127	175	Aklan	AKL	2024-09-17 21:00:06	2024-09-17 21:00:06
3128	175	Albay	ALB	2024-09-17 21:00:06	2024-09-17 21:00:06
3129	175	Antique	ANT	2024-09-17 21:00:06	2024-09-17 21:00:06
3130	175	Apayao	APA	2024-09-17 21:00:06	2024-09-17 21:00:06
3131	175	Aurora	AUR	2024-09-17 21:00:06	2024-09-17 21:00:06
3132	175	Autonomous Region in Muslim Mindanao	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3133	175	Basilan	BAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3134	175	Bataan	BAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3135	175	Batanes	BTN	2024-09-17 21:00:06	2024-09-17 21:00:06
3136	175	Batangas	BTG	2024-09-17 21:00:06	2024-09-17 21:00:06
3137	175	Benguet	BEN	2024-09-17 21:00:06	2024-09-17 21:00:06
3138	175	Bicol Region	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3139	175	Biliran	BIL	2024-09-17 21:00:06	2024-09-17 21:00:06
3140	175	Bohol	BOH	2024-09-17 21:00:06	2024-09-17 21:00:06
3141	175	Bukidnon	BUK	2024-09-17 21:00:06	2024-09-17 21:00:06
3142	175	Bulacan	BUL	2024-09-17 21:00:06	2024-09-17 21:00:06
3143	175	Cagayan	CAG	2024-09-17 21:00:06	2024-09-17 21:00:06
3144	175	Cagayan Valley	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3145	175	Calabarzon	40	2024-09-17 21:00:06	2024-09-17 21:00:06
3146	175	Camarines Norte	CAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3147	175	Camarines Sur	CAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3148	175	Camiguin	CAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3149	175	Capiz	CAP	2024-09-17 21:00:06	2024-09-17 21:00:06
3150	175	Caraga	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3151	175	Catanduanes	CAT	2024-09-17 21:00:06	2024-09-17 21:00:06
3152	175	Cavite	CAV	2024-09-17 21:00:06	2024-09-17 21:00:06
3153	175	Cebu	CEB	2024-09-17 21:00:06	2024-09-17 21:00:06
3154	175	Central Luzon	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3155	175	Central Visayas	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3156	175	Compostela Valley	COM	2024-09-17 21:00:06	2024-09-17 21:00:06
3157	175	Cordillera Administrative Region	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3158	175	Cotabato	NCO	2024-09-17 21:00:06	2024-09-17 21:00:06
3159	175	Davao del Norte	DAV	2024-09-17 21:00:06	2024-09-17 21:00:06
3160	175	Davao del Sur	DAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3161	175	Davao Occidental	DVO	2024-09-17 21:00:06	2024-09-17 21:00:06
3162	175	Davao Oriental	DAO	2024-09-17 21:00:06	2024-09-17 21:00:06
3163	175	Davao Region	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3164	175	Dinagat Islands	DIN	2024-09-17 21:00:06	2024-09-17 21:00:06
3165	175	Eastern Samar	EAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3166	175	Eastern Visayas	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3167	175	Guimaras	GUI	2024-09-17 21:00:06	2024-09-17 21:00:06
3168	175	Ifugao	IFU	2024-09-17 21:00:06	2024-09-17 21:00:06
3169	175	Ilocos Norte	ILN	2024-09-17 21:00:06	2024-09-17 21:00:06
3170	175	Ilocos Region	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3171	175	Ilocos Sur	ILS	2024-09-17 21:00:06	2024-09-17 21:00:06
3172	175	Iloilo	ILI	2024-09-17 21:00:06	2024-09-17 21:00:06
3173	175	Isabela	ISA	2024-09-17 21:00:06	2024-09-17 21:00:06
3174	175	Kalinga	KAL	2024-09-17 21:00:06	2024-09-17 21:00:06
3175	175	La Union	LUN	2024-09-17 21:00:06	2024-09-17 21:00:06
3176	175	Laguna	LAG	2024-09-17 21:00:06	2024-09-17 21:00:06
3177	175	Lanao del Norte	LAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3178	175	Lanao del Sur	LAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3179	175	Leyte	LEY	2024-09-17 21:00:06	2024-09-17 21:00:06
3180	175	Maguindanao	MAG	2024-09-17 21:00:06	2024-09-17 21:00:06
3181	175	Marinduque	MAD	2024-09-17 21:00:06	2024-09-17 21:00:06
3182	175	Masbate	MAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3183	175	Metro Manila	NCR	2024-09-17 21:00:06	2024-09-17 21:00:06
3184	175	Mimaropa	41	2024-09-17 21:00:06	2024-09-17 21:00:06
3185	175	Misamis Occidental	MSC	2024-09-17 21:00:06	2024-09-17 21:00:06
3186	175	Misamis Oriental	MSR	2024-09-17 21:00:06	2024-09-17 21:00:06
3187	175	Mountain Province	MOU	2024-09-17 21:00:06	2024-09-17 21:00:06
3188	175	Negros Occidental	NEC	2024-09-17 21:00:06	2024-09-17 21:00:06
3189	175	Negros Oriental	NER	2024-09-17 21:00:06	2024-09-17 21:00:06
3190	175	Northern Mindanao	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3191	175	Northern Samar	NSA	2024-09-17 21:00:06	2024-09-17 21:00:06
3192	175	Nueva Ecija	NUE	2024-09-17 21:00:06	2024-09-17 21:00:06
3193	175	Nueva Vizcaya	NUV	2024-09-17 21:00:06	2024-09-17 21:00:06
3194	175	Occidental Mindoro	MDC	2024-09-17 21:00:06	2024-09-17 21:00:06
3195	175	Oriental Mindoro	MDR	2024-09-17 21:00:06	2024-09-17 21:00:06
3196	175	Palawan	PLW	2024-09-17 21:00:06	2024-09-17 21:00:06
3197	175	Pampanga	PAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3198	175	Pangasinan	PAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3199	175	Quezon	QUE	2024-09-17 21:00:06	2024-09-17 21:00:06
3200	175	Quirino	QUI	2024-09-17 21:00:06	2024-09-17 21:00:06
3201	175	Rizal	RIZ	2024-09-17 21:00:06	2024-09-17 21:00:06
3202	175	Romblon	ROM	2024-09-17 21:00:06	2024-09-17 21:00:06
3203	175	Sarangani	SAR	2024-09-17 21:00:06	2024-09-17 21:00:06
3204	175	Siquijor	SIG	2024-09-17 21:00:06	2024-09-17 21:00:06
3205	175	Soccsksargen	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3206	175	Sorsogon	SOR	2024-09-17 21:00:06	2024-09-17 21:00:06
3207	175	South Cotabato	SCO	2024-09-17 21:00:06	2024-09-17 21:00:06
3208	175	Southern Leyte	SLE	2024-09-17 21:00:06	2024-09-17 21:00:06
3209	175	Sultan Kudarat	SUK	2024-09-17 21:00:06	2024-09-17 21:00:06
3210	175	Sulu	SLU	2024-09-17 21:00:06	2024-09-17 21:00:06
3211	175	Surigao del Norte	SUN	2024-09-17 21:00:06	2024-09-17 21:00:06
3212	175	Surigao del Sur	SUR	2024-09-17 21:00:06	2024-09-17 21:00:06
3213	175	Tarlac	TAR	2024-09-17 21:00:06	2024-09-17 21:00:06
3214	175	Tawi-Tawi	TAW	2024-09-17 21:00:06	2024-09-17 21:00:06
3215	175	Western Visayas	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3216	175	Zambales	ZMB	2024-09-17 21:00:06	2024-09-17 21:00:06
3217	175	Zamboanga del Norte	ZAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3218	175	Zamboanga del Sur	ZAS	2024-09-17 21:00:06	2024-09-17 21:00:06
3219	175	Zamboanga Peninsula	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3220	175	Zamboanga Sibugay	ZSI	2024-09-17 21:00:06	2024-09-17 21:00:06
3221	177	Greater Poland Voivodeship	WP	2024-09-17 21:00:06	2024-09-17 21:00:06
3222	177	Kuyavian-Pomeranian Voivodeship	KP	2024-09-17 21:00:06	2024-09-17 21:00:06
3223	177	Lesser Poland Voivodeship	MA	2024-09-17 21:00:06	2024-09-17 21:00:06
3224	177	Lower Silesian Voivodeship	DS	2024-09-17 21:00:06	2024-09-17 21:00:06
3225	177	Lublin Voivodeship	LU	2024-09-17 21:00:06	2024-09-17 21:00:06
3226	177	Lubusz Voivodeship	LB	2024-09-17 21:00:06	2024-09-17 21:00:06
3227	177	Łódź Voivodeship	LD	2024-09-17 21:00:06	2024-09-17 21:00:06
3228	177	Masovian Voivodeship	MZ	2024-09-17 21:00:06	2024-09-17 21:00:06
3229	177	Opole Voivodeship	OP	2024-09-17 21:00:06	2024-09-17 21:00:06
3230	177	Podkarpackie Voivodeship	PK	2024-09-17 21:00:06	2024-09-17 21:00:06
3231	177	Podlaskie Voivodeship	PD	2024-09-17 21:00:06	2024-09-17 21:00:06
3232	177	Pomeranian Voivodeship	PM	2024-09-17 21:00:06	2024-09-17 21:00:06
3233	177	Silesian Voivodeship	SL	2024-09-17 21:00:06	2024-09-17 21:00:06
3234	177	Świętokrzyskie Voivodeship	SK	2024-09-17 21:00:06	2024-09-17 21:00:06
3235	177	Warmian-Masurian Voivodeship	WN	2024-09-17 21:00:06	2024-09-17 21:00:06
3236	177	West Pomeranian Voivodeship	ZP	2024-09-17 21:00:06	2024-09-17 21:00:06
3237	178	Açores	20	2024-09-17 21:00:06	2024-09-17 21:00:06
3238	178	Aveiro	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3239	178	Beja	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3240	178	Braga	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3241	178	Bragança	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3242	178	Castelo Branco	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3243	178	Coimbra	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3244	178	Évora	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3245	178	Faro	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3246	178	Guarda	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3247	178	Leiria	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3248	178	Lisbon	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3249	178	Madeira	30	2024-09-17 21:00:06	2024-09-17 21:00:06
3250	178	Portalegre	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3251	178	Porto	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3252	178	Santarém	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3253	178	Setúbal	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3254	178	Viana do Castelo	16	2024-09-17 21:00:06	2024-09-17 21:00:06
3255	178	Vila Real	17	2024-09-17 21:00:06	2024-09-17 21:00:06
3256	178	Viseu	18	2024-09-17 21:00:06	2024-09-17 21:00:06
3257	180	Al Daayen	ZA	2024-09-17 21:00:06	2024-09-17 21:00:06
3258	180	Al Khor	KH	2024-09-17 21:00:06	2024-09-17 21:00:06
3259	180	Al Rayyan Municipality	RA	2024-09-17 21:00:06	2024-09-17 21:00:06
3260	180	Al Wakrah	WA	2024-09-17 21:00:06	2024-09-17 21:00:06
3261	180	Al-Shahaniya	SH	2024-09-17 21:00:06	2024-09-17 21:00:06
3262	180	Doha	DA	2024-09-17 21:00:06	2024-09-17 21:00:06
3263	180	Madinat ash Shamal	MS	2024-09-17 21:00:06	2024-09-17 21:00:06
3264	180	Umm Salal Municipality	US	2024-09-17 21:00:06	2024-09-17 21:00:06
3265	182	Alba	AB	2024-09-17 21:00:06	2024-09-17 21:00:06
3266	182	Arad County	AR	2024-09-17 21:00:06	2024-09-17 21:00:06
3267	182	Arges	AG	2024-09-17 21:00:06	2024-09-17 21:00:06
3268	182	Bacău County	BC	2024-09-17 21:00:06	2024-09-17 21:00:06
3269	182	Bihor County	BH	2024-09-17 21:00:06	2024-09-17 21:00:06
3270	182	Bistrița-Năsăud County	BN	2024-09-17 21:00:06	2024-09-17 21:00:06
3271	182	Botoșani County	BT	2024-09-17 21:00:06	2024-09-17 21:00:06
3272	182	Braila	BR	2024-09-17 21:00:06	2024-09-17 21:00:06
3273	182	Brașov County	BV	2024-09-17 21:00:06	2024-09-17 21:00:06
3274	182	Bucharest	B	2024-09-17 21:00:06	2024-09-17 21:00:06
3275	182	Buzău County	BZ	2024-09-17 21:00:06	2024-09-17 21:00:06
3276	182	Călărași County	CL	2024-09-17 21:00:06	2024-09-17 21:00:06
3277	182	Caraș-Severin County	CS	2024-09-17 21:00:06	2024-09-17 21:00:06
3278	182	Cluj County	CJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3279	182	Constanța County	CT	2024-09-17 21:00:06	2024-09-17 21:00:06
3280	182	Covasna County	CV	2024-09-17 21:00:06	2024-09-17 21:00:06
3281	182	Dâmbovița County	DB	2024-09-17 21:00:06	2024-09-17 21:00:06
3282	182	Dolj County	DJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3283	182	Galați County	GL	2024-09-17 21:00:06	2024-09-17 21:00:06
3284	182	Giurgiu County	GR	2024-09-17 21:00:06	2024-09-17 21:00:06
3285	182	Gorj County	GJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3286	182	Harghita County	HR	2024-09-17 21:00:06	2024-09-17 21:00:06
3287	182	Hunedoara County	HD	2024-09-17 21:00:06	2024-09-17 21:00:06
3288	182	Ialomița County	IL	2024-09-17 21:00:06	2024-09-17 21:00:06
3289	182	Iași County	IS	2024-09-17 21:00:06	2024-09-17 21:00:06
3290	182	Ilfov County	IF	2024-09-17 21:00:06	2024-09-17 21:00:06
3291	182	Maramureș County	MM	2024-09-17 21:00:06	2024-09-17 21:00:06
3292	182	Mehedinți County	MH	2024-09-17 21:00:06	2024-09-17 21:00:06
3293	182	Mureș County	MS	2024-09-17 21:00:06	2024-09-17 21:00:06
3294	182	Neamț County	NT	2024-09-17 21:00:06	2024-09-17 21:00:06
3295	182	Olt County	OT	2024-09-17 21:00:06	2024-09-17 21:00:06
3296	182	Prahova County	PH	2024-09-17 21:00:06	2024-09-17 21:00:06
3297	182	Sălaj County	SJ	2024-09-17 21:00:06	2024-09-17 21:00:06
3298	182	Satu Mare County	SM	2024-09-17 21:00:06	2024-09-17 21:00:06
3299	182	Sibiu County	SB	2024-09-17 21:00:06	2024-09-17 21:00:06
3300	182	Suceava County	SV	2024-09-17 21:00:06	2024-09-17 21:00:06
3301	182	Teleorman County	TR	2024-09-17 21:00:06	2024-09-17 21:00:06
3302	182	Timiș County	TM	2024-09-17 21:00:06	2024-09-17 21:00:06
3303	182	Tulcea County	TL	2024-09-17 21:00:06	2024-09-17 21:00:06
3304	182	Vâlcea County	VL	2024-09-17 21:00:06	2024-09-17 21:00:06
3305	182	Vaslui County	VS	2024-09-17 21:00:06	2024-09-17 21:00:06
3306	182	Vrancea County	VN	2024-09-17 21:00:06	2024-09-17 21:00:06
3307	183	Altai Krai	ALT	2024-09-17 21:00:06	2024-09-17 21:00:06
3308	183	Altai Republic	AL	2024-09-17 21:00:06	2024-09-17 21:00:06
3309	183	Amur Oblast	AMU	2024-09-17 21:00:06	2024-09-17 21:00:06
3310	183	Arkhangelsk	ARK	2024-09-17 21:00:06	2024-09-17 21:00:06
3311	183	Astrakhan Oblast	AST	2024-09-17 21:00:06	2024-09-17 21:00:06
3312	183	Belgorod Oblast	BEL	2024-09-17 21:00:06	2024-09-17 21:00:06
3313	183	Bryansk Oblast	BRY	2024-09-17 21:00:06	2024-09-17 21:00:06
3314	183	Chechen Republic	CE	2024-09-17 21:00:06	2024-09-17 21:00:06
3315	183	Chelyabinsk Oblast	CHE	2024-09-17 21:00:06	2024-09-17 21:00:06
3316	183	Chukotka Autonomous Okrug	CHU	2024-09-17 21:00:06	2024-09-17 21:00:06
3317	183	Chuvash Republic	CU	2024-09-17 21:00:06	2024-09-17 21:00:06
3318	183	Irkutsk	IRK	2024-09-17 21:00:06	2024-09-17 21:00:06
3319	183	Ivanovo Oblast	IVA	2024-09-17 21:00:06	2024-09-17 21:00:06
3320	183	Jewish Autonomous Oblast	YEV	2024-09-17 21:00:06	2024-09-17 21:00:06
3321	183	Kabardino-Balkar Republic	KB	2024-09-17 21:00:06	2024-09-17 21:00:06
3322	183	Kaliningrad	KGD	2024-09-17 21:00:06	2024-09-17 21:00:06
3323	183	Kaluga Oblast	KLU	2024-09-17 21:00:06	2024-09-17 21:00:06
3324	183	Kamchatka Krai	KAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3325	183	Karachay-Cherkess Republic	KC	2024-09-17 21:00:06	2024-09-17 21:00:06
3326	183	Kemerovo Oblast	KEM	2024-09-17 21:00:06	2024-09-17 21:00:06
3327	183	Khabarovsk Krai	KHA	2024-09-17 21:00:06	2024-09-17 21:00:06
3328	183	Khanty-Mansi Autonomous Okrug	KHM	2024-09-17 21:00:06	2024-09-17 21:00:06
3329	183	Kirov Oblast	KIR	2024-09-17 21:00:06	2024-09-17 21:00:06
3330	183	Komi Republic	KO	2024-09-17 21:00:06	2024-09-17 21:00:06
3331	183	Kostroma Oblast	KOS	2024-09-17 21:00:06	2024-09-17 21:00:06
3332	183	Krasnodar Krai	KDA	2024-09-17 21:00:06	2024-09-17 21:00:06
3333	183	Krasnoyarsk Krai	KYA	2024-09-17 21:00:06	2024-09-17 21:00:06
3334	183	Kurgan Oblast	KGN	2024-09-17 21:00:06	2024-09-17 21:00:06
3335	183	Kursk Oblast	KRS	2024-09-17 21:00:06	2024-09-17 21:00:06
3336	183	Leningrad Oblast	LEN	2024-09-17 21:00:06	2024-09-17 21:00:06
3337	183	Lipetsk Oblast	LIP	2024-09-17 21:00:06	2024-09-17 21:00:06
3338	183	Magadan Oblast	MAG	2024-09-17 21:00:06	2024-09-17 21:00:06
3339	183	Mari El Republic	ME	2024-09-17 21:00:06	2024-09-17 21:00:06
3340	183	Moscow	MOW	2024-09-17 21:00:06	2024-09-17 21:00:06
3341	183	Moscow Oblast	MOS	2024-09-17 21:00:06	2024-09-17 21:00:06
3342	183	Murmansk Oblast	MUR	2024-09-17 21:00:06	2024-09-17 21:00:06
3343	183	Nenets Autonomous Okrug	NEN	2024-09-17 21:00:06	2024-09-17 21:00:06
3344	183	Nizhny Novgorod Oblast	NIZ	2024-09-17 21:00:06	2024-09-17 21:00:06
3345	183	Novgorod Oblast	NGR	2024-09-17 21:00:06	2024-09-17 21:00:06
3346	183	Novosibirsk	NVS	2024-09-17 21:00:06	2024-09-17 21:00:06
3347	183	Omsk Oblast	OMS	2024-09-17 21:00:06	2024-09-17 21:00:06
3348	183	Orenburg Oblast	ORE	2024-09-17 21:00:06	2024-09-17 21:00:06
3349	183	Oryol Oblast	ORL	2024-09-17 21:00:06	2024-09-17 21:00:06
3350	183	Penza Oblast	PNZ	2024-09-17 21:00:06	2024-09-17 21:00:06
3351	183	Perm Krai	PER	2024-09-17 21:00:06	2024-09-17 21:00:06
3352	183	Primorsky Krai	PRI	2024-09-17 21:00:06	2024-09-17 21:00:06
3353	183	Pskov Oblast	PSK	2024-09-17 21:00:06	2024-09-17 21:00:06
3354	183	Republic of Adygea	AD	2024-09-17 21:00:06	2024-09-17 21:00:06
3355	183	Republic of Bashkortostan	BA	2024-09-17 21:00:06	2024-09-17 21:00:06
3356	183	Republic of Buryatia	BU	2024-09-17 21:00:06	2024-09-17 21:00:06
3357	183	Republic of Dagestan	DA	2024-09-17 21:00:06	2024-09-17 21:00:06
3358	183	Republic of Ingushetia	IN	2024-09-17 21:00:06	2024-09-17 21:00:06
3359	183	Republic of Kalmykia	KL	2024-09-17 21:00:06	2024-09-17 21:00:06
3360	183	Republic of Karelia	KR	2024-09-17 21:00:06	2024-09-17 21:00:06
3361	183	Republic of Khakassia	KK	2024-09-17 21:00:06	2024-09-17 21:00:06
3362	183	Republic of Mordovia	MO	2024-09-17 21:00:06	2024-09-17 21:00:06
3363	183	Republic of North Ossetia-Alania	SE	2024-09-17 21:00:06	2024-09-17 21:00:06
3364	183	Republic of Tatarstan	TA	2024-09-17 21:00:06	2024-09-17 21:00:06
3365	183	Rostov Oblast	ROS	2024-09-17 21:00:06	2024-09-17 21:00:06
3366	183	Ryazan Oblast	RYA	2024-09-17 21:00:06	2024-09-17 21:00:06
3367	183	Saint Petersburg	SPE	2024-09-17 21:00:06	2024-09-17 21:00:06
3368	183	Sakha Republic	SA	2024-09-17 21:00:06	2024-09-17 21:00:06
3369	183	Sakhalin	SAK	2024-09-17 21:00:06	2024-09-17 21:00:06
3370	183	Samara Oblast	SAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3371	183	Saratov Oblast	SAR	2024-09-17 21:00:06	2024-09-17 21:00:06
3372	183	Sevastopol	UA-40	2024-09-17 21:00:06	2024-09-17 21:00:06
3373	183	Smolensk Oblast	SMO	2024-09-17 21:00:06	2024-09-17 21:00:06
3374	183	Stavropol Krai	STA	2024-09-17 21:00:06	2024-09-17 21:00:06
3375	183	Sverdlovsk	SVE	2024-09-17 21:00:06	2024-09-17 21:00:06
3376	183	Tambov Oblast	TAM	2024-09-17 21:00:06	2024-09-17 21:00:06
3377	183	Tomsk Oblast	TOM	2024-09-17 21:00:06	2024-09-17 21:00:06
3378	183	Tula Oblast	TUL	2024-09-17 21:00:06	2024-09-17 21:00:06
3379	183	Tuva Republic	TY	2024-09-17 21:00:06	2024-09-17 21:00:06
3380	183	Tver Oblast	TVE	2024-09-17 21:00:06	2024-09-17 21:00:06
3381	183	Tyumen Oblast	TYU	2024-09-17 21:00:06	2024-09-17 21:00:06
3382	183	Udmurt Republic	UD	2024-09-17 21:00:06	2024-09-17 21:00:06
3383	183	Ulyanovsk Oblast	ULY	2024-09-17 21:00:06	2024-09-17 21:00:06
3384	183	Vladimir Oblast	VLA	2024-09-17 21:00:06	2024-09-17 21:00:06
3385	183	Volgograd Oblast	VGG	2024-09-17 21:00:06	2024-09-17 21:00:06
3386	183	Vologda Oblast	VLG	2024-09-17 21:00:06	2024-09-17 21:00:06
3387	183	Voronezh Oblast	VOR	2024-09-17 21:00:06	2024-09-17 21:00:06
3388	183	Yamalo-Nenets Autonomous Okrug	YAN	2024-09-17 21:00:06	2024-09-17 21:00:06
3389	183	Yaroslavl Oblast	YAR	2024-09-17 21:00:06	2024-09-17 21:00:06
3390	183	Zabaykalsky Krai	ZAB	2024-09-17 21:00:06	2024-09-17 21:00:06
3391	184	Eastern Province	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3392	184	Kigali district	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3393	184	Northern Province	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3394	184	Southern Province	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3395	184	Western Province	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3396	186	Christ Church Nichola Town Parish	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3397	186	Nevis	N	2024-09-17 21:00:06	2024-09-17 21:00:06
3398	186	Saint Anne Sandy Point Parish	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3399	186	Saint George Gingerland Parish	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3400	186	Saint James Windward Parish	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3401	186	Saint John Capisterre Parish	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3402	186	Saint John Figtree Parish	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3403	186	Saint Kitts	K	2024-09-17 21:00:06	2024-09-17 21:00:06
3404	186	Saint Mary Cayon Parish	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3405	186	Saint Paul Capisterre Parish	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3406	186	Saint Paul Charlestown Parish	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3407	186	Saint Peter Basseterre Parish	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3408	186	Saint Thomas Lowland Parish	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3409	186	Saint Thomas Middle Island Parish	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3410	186	Trinity Palmetto Point Parish	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3411	187	Anse la Raye Quarter	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3412	187	Canaries	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3413	187	Castries Quarter	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3414	187	Choiseul Quarter	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3415	187	Dauphin Quarter	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3416	187	Dennery Quarter	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3417	187	Gros Islet Quarter	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3418	187	Laborie Quarter	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3419	187	Micoud Quarter	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3420	187	Praslin Quarter	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3421	187	Soufrière Quarter	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3422	187	Vieux Fort Quarter	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3423	189	Charlotte Parish	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3424	189	Grenadines Parish	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3425	189	Saint Andrew Parish	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3426	189	Saint David Parish	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3427	189	Saint George Parish	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3428	189	Saint Patrick Parish	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3429	192	A'ana	AA	2024-09-17 21:00:06	2024-09-17 21:00:06
3430	192	Aiga-i-le-Tai	AL	2024-09-17 21:00:06	2024-09-17 21:00:06
3431	192	Atua	AT	2024-09-17 21:00:06	2024-09-17 21:00:06
3432	192	Fa'asaleleaga	FA	2024-09-17 21:00:06	2024-09-17 21:00:06
3433	192	Gaga'emauga	GE	2024-09-17 21:00:06	2024-09-17 21:00:06
3434	192	Gaga'ifomauga	GI	2024-09-17 21:00:06	2024-09-17 21:00:06
3435	192	Palauli	PA	2024-09-17 21:00:06	2024-09-17 21:00:06
3436	192	Satupa'itea	SA	2024-09-17 21:00:06	2024-09-17 21:00:06
3437	192	Tuamasaga	TU	2024-09-17 21:00:06	2024-09-17 21:00:06
3438	192	Va'a-o-Fonoti	VF	2024-09-17 21:00:06	2024-09-17 21:00:06
3439	192	Vaisigano	VS	2024-09-17 21:00:06	2024-09-17 21:00:06
3440	193	Acquaviva	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3441	193	Borgo Maggiore	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3442	193	Chiesanuova	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3443	193	Domagnano	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3444	193	Faetano	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3445	193	Fiorentino	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3446	193	Montegiardino	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3447	193	San Marino	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3448	193	Serravalle	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3449	194	Príncipe Province	P	2024-09-17 21:00:06	2024-09-17 21:00:06
3450	194	São Tomé Province	S	2024-09-17 21:00:06	2024-09-17 21:00:06
3451	195	'Asir	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3452	195	Al Bahah	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3453	195	Al Jawf	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3454	195	Al Madinah	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3455	195	Al-Qassim	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3456	195	Eastern Province	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3457	195	Ha'il	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3458	195	Jizan	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3459	195	Makkah	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3460	195	Najran	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3461	195	Northern Borders	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3462	195	Riyadh	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3463	195	Tabuk	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3464	196	Dakar	DK	2024-09-17 21:00:06	2024-09-17 21:00:06
3465	196	Diourbel Region	DB	2024-09-17 21:00:06	2024-09-17 21:00:06
3466	196	Fatick	FK	2024-09-17 21:00:06	2024-09-17 21:00:06
3467	196	Kaffrine	KA	2024-09-17 21:00:06	2024-09-17 21:00:06
3468	196	Kaolack	KL	2024-09-17 21:00:06	2024-09-17 21:00:06
3469	196	Kédougou	KE	2024-09-17 21:00:06	2024-09-17 21:00:06
3470	196	Kolda	KD	2024-09-17 21:00:06	2024-09-17 21:00:06
3471	196	Louga	LG	2024-09-17 21:00:06	2024-09-17 21:00:06
3472	196	Matam	MT	2024-09-17 21:00:06	2024-09-17 21:00:06
3473	196	Saint-Louis	SL	2024-09-17 21:00:06	2024-09-17 21:00:06
3474	196	Sédhiou	SE	2024-09-17 21:00:06	2024-09-17 21:00:06
3475	196	Tambacounda Region	TC	2024-09-17 21:00:06	2024-09-17 21:00:06
3476	196	Thiès Region	TH	2024-09-17 21:00:06	2024-09-17 21:00:06
3477	196	Ziguinchor	ZG	2024-09-17 21:00:06	2024-09-17 21:00:06
3478	197	Belgrade	00	2024-09-17 21:00:06	2024-09-17 21:00:06
3479	197	Bor District	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3480	197	Braničevo District	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3481	197	Central Banat District	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3482	197	Jablanica District	23	2024-09-17 21:00:06	2024-09-17 21:00:06
3483	197	Kolubara District	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3484	197	Mačva District	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3485	197	Moravica District	17	2024-09-17 21:00:06	2024-09-17 21:00:06
3486	197	Nišava District	20	2024-09-17 21:00:06	2024-09-17 21:00:06
3487	197	North Bačka District	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3488	197	North Banat District	03	2024-09-17 21:00:06	2024-09-17 21:00:06
3489	197	Pčinja District	24	2024-09-17 21:00:06	2024-09-17 21:00:06
3490	197	Pirot District	22	2024-09-17 21:00:06	2024-09-17 21:00:06
3491	197	Podunavlje District	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3492	197	Pomoravlje District	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3493	197	Rasina District	19	2024-09-17 21:00:06	2024-09-17 21:00:06
3494	197	Raška District	18	2024-09-17 21:00:06	2024-09-17 21:00:06
3495	197	South Bačka District	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3496	197	South Banat District	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3497	197	Srem District	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3498	197	Šumadija District	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3499	197	Toplica District	21	2024-09-17 21:00:06	2024-09-17 21:00:06
3500	197	Vojvodina	VO	2024-09-17 21:00:06	2024-09-17 21:00:06
3501	197	West Bačka District	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3502	197	Zaječar District	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3503	197	Zlatibor District	16	2024-09-17 21:00:06	2024-09-17 21:00:06
3504	198	Anse Boileau	02	2024-09-17 21:00:06	2024-09-17 21:00:06
3505	198	Anse Royale	05	2024-09-17 21:00:06	2024-09-17 21:00:06
3506	198	Anse-aux-Pins	01	2024-09-17 21:00:06	2024-09-17 21:00:06
3507	198	Au Cap	04	2024-09-17 21:00:06	2024-09-17 21:00:06
3508	198	Baie Lazare	06	2024-09-17 21:00:06	2024-09-17 21:00:06
3509	198	Baie Sainte Anne	07	2024-09-17 21:00:06	2024-09-17 21:00:06
3510	198	Beau Vallon	08	2024-09-17 21:00:06	2024-09-17 21:00:06
3511	198	Bel Air	09	2024-09-17 21:00:06	2024-09-17 21:00:06
3512	198	Bel Ombre	10	2024-09-17 21:00:06	2024-09-17 21:00:06
3513	198	Cascade	11	2024-09-17 21:00:06	2024-09-17 21:00:06
3514	198	Glacis	12	2024-09-17 21:00:06	2024-09-17 21:00:06
3515	198	Grand'Anse Mahé	13	2024-09-17 21:00:06	2024-09-17 21:00:06
3516	198	Grand'Anse Praslin	14	2024-09-17 21:00:06	2024-09-17 21:00:06
3517	198	La Digue	15	2024-09-17 21:00:06	2024-09-17 21:00:06
3518	198	La Rivière Anglaise	16	2024-09-17 21:00:06	2024-09-17 21:00:06
3519	198	Les Mamelles	24	2024-09-17 21:00:06	2024-09-17 21:00:06
3520	198	Mont Buxton	17	2024-09-17 21:00:06	2024-09-17 21:00:06
3521	198	Mont Fleuri	18	2024-09-17 21:00:06	2024-09-17 21:00:06
3522	198	Plaisance	19	2024-09-17 21:00:06	2024-09-17 21:00:06
3523	198	Pointe La Rue	20	2024-09-17 21:00:06	2024-09-17 21:00:06
3524	198	Port Glaud	21	2024-09-17 21:00:06	2024-09-17 21:00:06
3525	198	Roche Caiman	25	2024-09-17 21:00:06	2024-09-17 21:00:06
3526	198	Saint Louis	22	2024-09-17 21:00:07	2024-09-17 21:00:07
3527	198	Takamaka	23	2024-09-17 21:00:07	2024-09-17 21:00:07
3528	199	Eastern Province	E	2024-09-17 21:00:07	2024-09-17 21:00:07
3529	199	Northern Province	N	2024-09-17 21:00:07	2024-09-17 21:00:07
3530	199	Southern Province	S	2024-09-17 21:00:07	2024-09-17 21:00:07
3531	199	Western Area	W	2024-09-17 21:00:07	2024-09-17 21:00:07
3532	200	Central Singapore Community Development Council	01	2024-09-17 21:00:07	2024-09-17 21:00:07
3533	200	North East Community Development Council	02	2024-09-17 21:00:07	2024-09-17 21:00:07
3534	200	North West Community Development Council	03	2024-09-17 21:00:07	2024-09-17 21:00:07
3535	200	South East Community Development Council	04	2024-09-17 21:00:07	2024-09-17 21:00:07
3536	200	South West Community Development Council	05	2024-09-17 21:00:07	2024-09-17 21:00:07
3537	202	Banská Bystrica Region	BC	2024-09-17 21:00:07	2024-09-17 21:00:07
3538	202	Bratislava Region	BL	2024-09-17 21:00:07	2024-09-17 21:00:07
3539	202	Košice Region	KI	2024-09-17 21:00:07	2024-09-17 21:00:07
3540	202	Nitra Region	NI	2024-09-17 21:00:07	2024-09-17 21:00:07
3541	202	Prešov Region	PV	2024-09-17 21:00:07	2024-09-17 21:00:07
3542	202	Trenčín Region	TC	2024-09-17 21:00:07	2024-09-17 21:00:07
3543	202	Trnava Region	TA	2024-09-17 21:00:07	2024-09-17 21:00:07
3544	202	Žilina Region	ZI	2024-09-17 21:00:07	2024-09-17 21:00:07
3545	203	Ajdovščina Municipality	001	2024-09-17 21:00:07	2024-09-17 21:00:07
3546	203	Ankaran Municipality	213	2024-09-17 21:00:07	2024-09-17 21:00:07
3547	203	Beltinci Municipality	002	2024-09-17 21:00:07	2024-09-17 21:00:07
3548	203	Benedikt Municipality	148	2024-09-17 21:00:07	2024-09-17 21:00:07
3549	203	Bistrica ob Sotli Municipality	149	2024-09-17 21:00:07	2024-09-17 21:00:07
3550	203	Bled Municipality	003	2024-09-17 21:00:07	2024-09-17 21:00:07
3551	203	Bloke Municipality	150	2024-09-17 21:00:07	2024-09-17 21:00:07
3552	203	Bohinj Municipality	004	2024-09-17 21:00:07	2024-09-17 21:00:07
3553	203	Borovnica Municipality	005	2024-09-17 21:00:07	2024-09-17 21:00:07
3554	203	Bovec Municipality	006	2024-09-17 21:00:07	2024-09-17 21:00:07
3555	203	Braslovče Municipality	151	2024-09-17 21:00:07	2024-09-17 21:00:07
3556	203	Brda Municipality	007	2024-09-17 21:00:07	2024-09-17 21:00:07
3557	203	Brežice Municipality	009	2024-09-17 21:00:07	2024-09-17 21:00:07
3558	203	Brezovica Municipality	008	2024-09-17 21:00:07	2024-09-17 21:00:07
3559	203	Cankova Municipality	152	2024-09-17 21:00:07	2024-09-17 21:00:07
3560	203	Cerklje na Gorenjskem Municipality	012	2024-09-17 21:00:07	2024-09-17 21:00:07
3561	203	Cerknica Municipality	013	2024-09-17 21:00:07	2024-09-17 21:00:07
3562	203	Cerkno Municipality	014	2024-09-17 21:00:07	2024-09-17 21:00:07
3563	203	Cerkvenjak Municipality	153	2024-09-17 21:00:07	2024-09-17 21:00:07
3564	203	City Municipality of Celje	011	2024-09-17 21:00:07	2024-09-17 21:00:07
3565	203	City Municipality of Novo Mesto	085	2024-09-17 21:00:07	2024-09-17 21:00:07
3566	203	Črenšovci Municipality	015	2024-09-17 21:00:07	2024-09-17 21:00:07
3567	203	Črna na Koroškem Municipality	016	2024-09-17 21:00:07	2024-09-17 21:00:07
3568	203	Črnomelj Municipality	017	2024-09-17 21:00:07	2024-09-17 21:00:07
3569	203	Destrnik Municipality	018	2024-09-17 21:00:07	2024-09-17 21:00:07
3570	203	Divača Municipality	019	2024-09-17 21:00:07	2024-09-17 21:00:07
3571	203	Dobje Municipality	154	2024-09-17 21:00:07	2024-09-17 21:00:07
3572	203	Dobrepolje Municipality	020	2024-09-17 21:00:07	2024-09-17 21:00:07
3573	203	Dobrna Municipality	155	2024-09-17 21:00:07	2024-09-17 21:00:07
3574	203	Dobrova–Polhov Gradec Municipality	021	2024-09-17 21:00:07	2024-09-17 21:00:07
3575	203	Dobrovnik Municipality	156	2024-09-17 21:00:07	2024-09-17 21:00:07
3576	203	Dol pri Ljubljani Municipality	022	2024-09-17 21:00:07	2024-09-17 21:00:07
3577	203	Dolenjske Toplice Municipality	157	2024-09-17 21:00:07	2024-09-17 21:00:07
3578	203	Domžale Municipality	023	2024-09-17 21:00:07	2024-09-17 21:00:07
3579	203	Dornava Municipality	024	2024-09-17 21:00:07	2024-09-17 21:00:07
3580	203	Dravograd Municipality	025	2024-09-17 21:00:07	2024-09-17 21:00:07
3581	203	Duplek Municipality	026	2024-09-17 21:00:07	2024-09-17 21:00:07
3582	203	Gorenja Vas–Poljane Municipality	027	2024-09-17 21:00:07	2024-09-17 21:00:07
3583	203	Gorišnica Municipality	028	2024-09-17 21:00:07	2024-09-17 21:00:07
3584	203	Gorje Municipality	207	2024-09-17 21:00:07	2024-09-17 21:00:07
3585	203	Gornja Radgona Municipality	029	2024-09-17 21:00:07	2024-09-17 21:00:07
3586	203	Gornji Grad Municipality	030	2024-09-17 21:00:07	2024-09-17 21:00:07
3587	203	Gornji Petrovci Municipality	031	2024-09-17 21:00:07	2024-09-17 21:00:07
3588	203	Grad Municipality	158	2024-09-17 21:00:07	2024-09-17 21:00:07
3589	203	Grosuplje Municipality	032	2024-09-17 21:00:07	2024-09-17 21:00:07
3590	203	Hajdina Municipality	159	2024-09-17 21:00:07	2024-09-17 21:00:07
3591	203	Hoče–Slivnica Municipality	160	2024-09-17 21:00:07	2024-09-17 21:00:07
3592	203	Hodoš Municipality	161	2024-09-17 21:00:07	2024-09-17 21:00:07
3593	203	Horjul Municipality	162	2024-09-17 21:00:07	2024-09-17 21:00:07
3594	203	Hrastnik Municipality	034	2024-09-17 21:00:07	2024-09-17 21:00:07
3595	203	Hrpelje–Kozina Municipality	035	2024-09-17 21:00:07	2024-09-17 21:00:07
3596	203	Idrija Municipality	036	2024-09-17 21:00:07	2024-09-17 21:00:07
3597	203	Ig Municipality	037	2024-09-17 21:00:07	2024-09-17 21:00:07
3598	203	Ivančna Gorica Municipality	039	2024-09-17 21:00:07	2024-09-17 21:00:07
3599	203	Izola Municipality	040	2024-09-17 21:00:07	2024-09-17 21:00:07
3600	203	Jesenice Municipality	041	2024-09-17 21:00:07	2024-09-17 21:00:07
3601	203	Jezersko Municipality	163	2024-09-17 21:00:07	2024-09-17 21:00:07
3602	203	Juršinci Municipality	042	2024-09-17 21:00:07	2024-09-17 21:00:07
3603	203	Kamnik Municipality	043	2024-09-17 21:00:07	2024-09-17 21:00:07
3604	203	Kanal ob Soči Municipality	044	2024-09-17 21:00:07	2024-09-17 21:00:07
3605	203	Kidričevo Municipality	045	2024-09-17 21:00:07	2024-09-17 21:00:07
3606	203	Kobarid Municipality	046	2024-09-17 21:00:07	2024-09-17 21:00:07
3607	203	Kobilje Municipality	047	2024-09-17 21:00:07	2024-09-17 21:00:07
3608	203	Kočevje Municipality	048	2024-09-17 21:00:07	2024-09-17 21:00:07
3609	203	Komen Municipality	049	2024-09-17 21:00:07	2024-09-17 21:00:07
3610	203	Komenda Municipality	164	2024-09-17 21:00:07	2024-09-17 21:00:07
3611	203	Koper City Municipality	050	2024-09-17 21:00:07	2024-09-17 21:00:07
3612	203	Kostanjevica na Krki Municipality	197	2024-09-17 21:00:07	2024-09-17 21:00:07
3613	203	Kostel Municipality	165	2024-09-17 21:00:07	2024-09-17 21:00:07
3614	203	Kozje Municipality	051	2024-09-17 21:00:07	2024-09-17 21:00:07
3615	203	Kranj City Municipality	052	2024-09-17 21:00:07	2024-09-17 21:00:07
3616	203	Kranjska Gora Municipality	053	2024-09-17 21:00:07	2024-09-17 21:00:07
3617	203	Križevci Municipality	166	2024-09-17 21:00:07	2024-09-17 21:00:07
3618	203	Kungota	055	2024-09-17 21:00:07	2024-09-17 21:00:07
3619	203	Kuzma Municipality	056	2024-09-17 21:00:07	2024-09-17 21:00:07
3620	203	Laško Municipality	057	2024-09-17 21:00:07	2024-09-17 21:00:07
3621	203	Lenart Municipality	058	2024-09-17 21:00:07	2024-09-17 21:00:07
3622	203	Lendava Municipality	059	2024-09-17 21:00:07	2024-09-17 21:00:07
3623	203	Litija Municipality	060	2024-09-17 21:00:07	2024-09-17 21:00:07
3624	203	Ljubljana City Municipality	061	2024-09-17 21:00:07	2024-09-17 21:00:07
3625	203	Ljubno Municipality	062	2024-09-17 21:00:07	2024-09-17 21:00:07
3626	203	Ljutomer Municipality	063	2024-09-17 21:00:07	2024-09-17 21:00:07
3627	203	Log–Dragomer Municipality	208	2024-09-17 21:00:07	2024-09-17 21:00:07
3628	203	Logatec Municipality	064	2024-09-17 21:00:07	2024-09-17 21:00:07
3629	203	Loška Dolina Municipality	065	2024-09-17 21:00:07	2024-09-17 21:00:07
3630	203	Loški Potok Municipality	066	2024-09-17 21:00:07	2024-09-17 21:00:07
3631	203	Lovrenc na Pohorju Municipality	167	2024-09-17 21:00:07	2024-09-17 21:00:07
3632	203	Luče Municipality	067	2024-09-17 21:00:07	2024-09-17 21:00:07
3633	203	Lukovica Municipality	068	2024-09-17 21:00:07	2024-09-17 21:00:07
3634	203	Majšperk Municipality	069	2024-09-17 21:00:07	2024-09-17 21:00:07
3635	203	Makole Municipality	198	2024-09-17 21:00:07	2024-09-17 21:00:07
3636	203	Maribor City Municipality	070	2024-09-17 21:00:07	2024-09-17 21:00:07
3637	203	Markovci Municipality	168	2024-09-17 21:00:07	2024-09-17 21:00:07
3638	203	Medvode Municipality	071	2024-09-17 21:00:07	2024-09-17 21:00:07
3639	203	Mengeš Municipality	072	2024-09-17 21:00:07	2024-09-17 21:00:07
3640	203	Metlika Municipality	073	2024-09-17 21:00:07	2024-09-17 21:00:07
3641	203	Mežica Municipality	074	2024-09-17 21:00:07	2024-09-17 21:00:07
3642	203	Miklavž na Dravskem Polju Municipality	169	2024-09-17 21:00:07	2024-09-17 21:00:07
3643	203	Miren–Kostanjevica Municipality	075	2024-09-17 21:00:07	2024-09-17 21:00:07
3644	203	Mirna Municipality	212	2024-09-17 21:00:07	2024-09-17 21:00:07
3645	203	Mirna Peč Municipality	170	2024-09-17 21:00:07	2024-09-17 21:00:07
3646	203	Mislinja Municipality	076	2024-09-17 21:00:07	2024-09-17 21:00:07
3647	203	Mokronog–Trebelno Municipality	199	2024-09-17 21:00:07	2024-09-17 21:00:07
3648	203	Moravče Municipality	077	2024-09-17 21:00:07	2024-09-17 21:00:07
3649	203	Moravske Toplice Municipality	078	2024-09-17 21:00:07	2024-09-17 21:00:07
3650	203	Mozirje Municipality	079	2024-09-17 21:00:07	2024-09-17 21:00:07
3651	203	Municipality of Apače	195	2024-09-17 21:00:07	2024-09-17 21:00:07
3652	203	Municipality of Cirkulane	196	2024-09-17 21:00:07	2024-09-17 21:00:07
3653	203	Municipality of Ilirska Bistrica	038	2024-09-17 21:00:07	2024-09-17 21:00:07
3654	203	Municipality of Krško	054	2024-09-17 21:00:07	2024-09-17 21:00:07
3655	203	Municipality of Škofljica	123	2024-09-17 21:00:07	2024-09-17 21:00:07
3656	203	Murska Sobota City Municipality	080	2024-09-17 21:00:07	2024-09-17 21:00:07
3657	203	Muta Municipality	081	2024-09-17 21:00:07	2024-09-17 21:00:07
3658	203	Naklo Municipality	082	2024-09-17 21:00:07	2024-09-17 21:00:07
3659	203	Nazarje Municipality	083	2024-09-17 21:00:07	2024-09-17 21:00:07
3660	203	Nova Gorica City Municipality	084	2024-09-17 21:00:07	2024-09-17 21:00:07
3661	203	Odranci Municipality	086	2024-09-17 21:00:07	2024-09-17 21:00:07
3662	203	Oplotnica	171	2024-09-17 21:00:07	2024-09-17 21:00:07
3663	203	Ormož Municipality	087	2024-09-17 21:00:07	2024-09-17 21:00:07
3664	203	Osilnica Municipality	088	2024-09-17 21:00:07	2024-09-17 21:00:07
3665	203	Pesnica Municipality	089	2024-09-17 21:00:07	2024-09-17 21:00:07
3666	203	Piran Municipality	090	2024-09-17 21:00:07	2024-09-17 21:00:07
3667	203	Pivka Municipality	091	2024-09-17 21:00:07	2024-09-17 21:00:07
3668	203	Podčetrtek Municipality	092	2024-09-17 21:00:07	2024-09-17 21:00:07
3669	203	Podlehnik Municipality	172	2024-09-17 21:00:07	2024-09-17 21:00:07
3670	203	Podvelka Municipality	093	2024-09-17 21:00:07	2024-09-17 21:00:07
3671	203	Poljčane Municipality	200	2024-09-17 21:00:07	2024-09-17 21:00:07
3672	203	Polzela Municipality	173	2024-09-17 21:00:07	2024-09-17 21:00:07
3673	203	Postojna Municipality	094	2024-09-17 21:00:07	2024-09-17 21:00:07
3674	203	Prebold Municipality	174	2024-09-17 21:00:07	2024-09-17 21:00:07
3675	203	Preddvor Municipality	095	2024-09-17 21:00:07	2024-09-17 21:00:07
3676	203	Prevalje Municipality	175	2024-09-17 21:00:07	2024-09-17 21:00:07
3677	203	Ptuj City Municipality	096	2024-09-17 21:00:07	2024-09-17 21:00:07
3678	203	Puconci Municipality	097	2024-09-17 21:00:07	2024-09-17 21:00:07
3679	203	Rače–Fram Municipality	098	2024-09-17 21:00:07	2024-09-17 21:00:07
3680	203	Radeče Municipality	099	2024-09-17 21:00:07	2024-09-17 21:00:07
3681	203	Radenci Municipality	100	2024-09-17 21:00:07	2024-09-17 21:00:07
3682	203	Radlje ob Dravi Municipality	101	2024-09-17 21:00:07	2024-09-17 21:00:07
3683	203	Radovljica Municipality	102	2024-09-17 21:00:07	2024-09-17 21:00:07
3684	203	Ravne na Koroškem Municipality	103	2024-09-17 21:00:07	2024-09-17 21:00:07
3685	203	Razkrižje Municipality	176	2024-09-17 21:00:07	2024-09-17 21:00:07
3686	203	Rečica ob Savinji Municipality	209	2024-09-17 21:00:07	2024-09-17 21:00:07
3687	203	Renče–Vogrsko Municipality	201	2024-09-17 21:00:07	2024-09-17 21:00:07
3688	203	Ribnica Municipality	104	2024-09-17 21:00:07	2024-09-17 21:00:07
3689	203	Ribnica na Pohorju Municipality	177	2024-09-17 21:00:07	2024-09-17 21:00:07
3690	203	Rogaška Slatina Municipality	106	2024-09-17 21:00:07	2024-09-17 21:00:07
3691	203	Rogašovci Municipality	105	2024-09-17 21:00:07	2024-09-17 21:00:07
3692	203	Rogatec Municipality	107	2024-09-17 21:00:07	2024-09-17 21:00:07
3693	203	Ruše Municipality	108	2024-09-17 21:00:07	2024-09-17 21:00:07
3694	203	Šalovci Municipality	033	2024-09-17 21:00:07	2024-09-17 21:00:07
3695	203	Selnica ob Dravi Municipality	178	2024-09-17 21:00:07	2024-09-17 21:00:07
3696	203	Semič Municipality	109	2024-09-17 21:00:07	2024-09-17 21:00:07
3697	203	Šempeter–Vrtojba Municipality	183	2024-09-17 21:00:07	2024-09-17 21:00:07
3698	203	Šenčur Municipality	117	2024-09-17 21:00:07	2024-09-17 21:00:07
3699	203	Šentilj Municipality	118	2024-09-17 21:00:07	2024-09-17 21:00:07
3700	203	Šentjernej Municipality	119	2024-09-17 21:00:07	2024-09-17 21:00:07
3701	203	Šentjur Municipality	120	2024-09-17 21:00:07	2024-09-17 21:00:07
3702	203	Šentrupert Municipality	211	2024-09-17 21:00:07	2024-09-17 21:00:07
3703	203	Sevnica Municipality	110	2024-09-17 21:00:07	2024-09-17 21:00:07
3704	203	Sežana Municipality	111	2024-09-17 21:00:07	2024-09-17 21:00:07
3705	203	Škocjan Municipality	121	2024-09-17 21:00:07	2024-09-17 21:00:07
3706	203	Škofja Loka Municipality	122	2024-09-17 21:00:07	2024-09-17 21:00:07
3707	203	Slovenj Gradec City Municipality	112	2024-09-17 21:00:07	2024-09-17 21:00:07
3708	203	Slovenska Bistrica Municipality	113	2024-09-17 21:00:07	2024-09-17 21:00:07
3709	203	Slovenske Konjice Municipality	114	2024-09-17 21:00:07	2024-09-17 21:00:07
3710	203	Šmarje pri Jelšah Municipality	124	2024-09-17 21:00:07	2024-09-17 21:00:07
3711	203	Šmarješke Toplice Municipality	206	2024-09-17 21:00:07	2024-09-17 21:00:07
3712	203	Šmartno ob Paki Municipality	125	2024-09-17 21:00:07	2024-09-17 21:00:07
3713	203	Šmartno pri Litiji Municipality	194	2024-09-17 21:00:07	2024-09-17 21:00:07
3714	203	Sodražica Municipality	179	2024-09-17 21:00:07	2024-09-17 21:00:07
3715	203	Solčava Municipality	180	2024-09-17 21:00:07	2024-09-17 21:00:07
3716	203	Šoštanj Municipality	126	2024-09-17 21:00:07	2024-09-17 21:00:07
3717	203	Središče ob Dravi	202	2024-09-17 21:00:07	2024-09-17 21:00:07
3718	203	Starše Municipality	115	2024-09-17 21:00:07	2024-09-17 21:00:07
3719	203	Štore Municipality	127	2024-09-17 21:00:07	2024-09-17 21:00:07
3720	203	Straža Municipality	203	2024-09-17 21:00:07	2024-09-17 21:00:07
3721	203	Sveta Ana Municipality	181	2024-09-17 21:00:07	2024-09-17 21:00:07
3722	203	Sveta Trojica v Slovenskih Goricah Municipality	204	2024-09-17 21:00:07	2024-09-17 21:00:07
3723	203	Sveti Andraž v Slovenskih Goricah Municipality	182	2024-09-17 21:00:07	2024-09-17 21:00:07
3724	203	Sveti Jurij ob Ščavnici Municipality	116	2024-09-17 21:00:07	2024-09-17 21:00:07
3725	203	Sveti Jurij v Slovenskih Goricah Municipality	210	2024-09-17 21:00:07	2024-09-17 21:00:07
3726	203	Sveti Tomaž Municipality	205	2024-09-17 21:00:07	2024-09-17 21:00:07
3727	203	Tabor Municipality	184	2024-09-17 21:00:07	2024-09-17 21:00:07
3728	203	Tišina Municipality	010	2024-09-17 21:00:07	2024-09-17 21:00:07
3729	203	Tolmin Municipality	128	2024-09-17 21:00:07	2024-09-17 21:00:07
3730	203	Trbovlje Municipality	129	2024-09-17 21:00:07	2024-09-17 21:00:07
3731	203	Trebnje Municipality	130	2024-09-17 21:00:07	2024-09-17 21:00:07
3732	203	Trnovska Vas Municipality	185	2024-09-17 21:00:07	2024-09-17 21:00:07
3733	203	Tržič Municipality	131	2024-09-17 21:00:07	2024-09-17 21:00:07
3734	203	Trzin Municipality	186	2024-09-17 21:00:07	2024-09-17 21:00:07
3735	203	Turnišče Municipality	132	2024-09-17 21:00:07	2024-09-17 21:00:07
3736	203	Velika Polana Municipality	187	2024-09-17 21:00:07	2024-09-17 21:00:07
3737	203	Velike Lašče Municipality	134	2024-09-17 21:00:07	2024-09-17 21:00:07
3738	203	Veržej Municipality	188	2024-09-17 21:00:07	2024-09-17 21:00:07
3739	203	Videm Municipality	135	2024-09-17 21:00:07	2024-09-17 21:00:07
3740	203	Vipava Municipality	136	2024-09-17 21:00:07	2024-09-17 21:00:07
3741	203	Vitanje Municipality	137	2024-09-17 21:00:07	2024-09-17 21:00:07
3742	203	Vodice Municipality	138	2024-09-17 21:00:07	2024-09-17 21:00:07
3743	203	Vojnik Municipality	139	2024-09-17 21:00:07	2024-09-17 21:00:07
3744	203	Vransko Municipality	189	2024-09-17 21:00:07	2024-09-17 21:00:07
3745	203	Vrhnika Municipality	140	2024-09-17 21:00:07	2024-09-17 21:00:07
3746	203	Vuzenica Municipality	141	2024-09-17 21:00:07	2024-09-17 21:00:07
3747	203	Zagorje ob Savi Municipality	142	2024-09-17 21:00:07	2024-09-17 21:00:07
3748	203	Žalec Municipality	190	2024-09-17 21:00:07	2024-09-17 21:00:07
3749	203	Zavrč Municipality	143	2024-09-17 21:00:07	2024-09-17 21:00:07
3750	203	Železniki Municipality	146	2024-09-17 21:00:07	2024-09-17 21:00:07
3751	203	Žetale Municipality	191	2024-09-17 21:00:07	2024-09-17 21:00:07
3752	203	Žiri Municipality	147	2024-09-17 21:00:07	2024-09-17 21:00:07
3753	203	Žirovnica Municipality	192	2024-09-17 21:00:07	2024-09-17 21:00:07
3754	203	Zreče Municipality	144	2024-09-17 21:00:07	2024-09-17 21:00:07
3755	203	Žužemberk Municipality	193	2024-09-17 21:00:07	2024-09-17 21:00:07
3756	204	Central Province	CE	2024-09-17 21:00:07	2024-09-17 21:00:07
3757	204	Choiseul Province	CH	2024-09-17 21:00:07	2024-09-17 21:00:07
3758	204	Guadalcanal Province	GU	2024-09-17 21:00:07	2024-09-17 21:00:07
3759	204	Honiara	CT	2024-09-17 21:00:07	2024-09-17 21:00:07
3760	204	Isabel Province	IS	2024-09-17 21:00:07	2024-09-17 21:00:07
3761	204	Makira-Ulawa Province	MK	2024-09-17 21:00:07	2024-09-17 21:00:07
3762	204	Malaita Province	ML	2024-09-17 21:00:07	2024-09-17 21:00:07
3763	204	Rennell and Bellona Province	RB	2024-09-17 21:00:07	2024-09-17 21:00:07
3764	204	Temotu Province	TE	2024-09-17 21:00:07	2024-09-17 21:00:07
3765	204	Western Province	WE	2024-09-17 21:00:07	2024-09-17 21:00:07
3766	205	Awdal Region	AW	2024-09-17 21:00:07	2024-09-17 21:00:07
3767	205	Bakool	BK	2024-09-17 21:00:07	2024-09-17 21:00:07
3768	205	Banaadir	BN	2024-09-17 21:00:07	2024-09-17 21:00:07
3769	205	Bari	BR	2024-09-17 21:00:07	2024-09-17 21:00:07
3770	205	Bay	BY	2024-09-17 21:00:07	2024-09-17 21:00:07
3771	205	Galguduud	GA	2024-09-17 21:00:07	2024-09-17 21:00:07
3772	205	Gedo	GE	2024-09-17 21:00:07	2024-09-17 21:00:07
3773	205	Hiran	HI	2024-09-17 21:00:07	2024-09-17 21:00:07
3774	205	Lower Juba	JH	2024-09-17 21:00:07	2024-09-17 21:00:07
3775	205	Lower Shebelle	SH	2024-09-17 21:00:07	2024-09-17 21:00:07
3776	205	Middle Juba	JD	2024-09-17 21:00:07	2024-09-17 21:00:07
3777	205	Middle Shebelle	SD	2024-09-17 21:00:07	2024-09-17 21:00:07
3778	205	Mudug	MU	2024-09-17 21:00:07	2024-09-17 21:00:07
3779	205	Nugal	NU	2024-09-17 21:00:07	2024-09-17 21:00:07
3780	205	Sanaag Region	SA	2024-09-17 21:00:07	2024-09-17 21:00:07
3781	205	Togdheer Region	TO	2024-09-17 21:00:07	2024-09-17 21:00:07
3782	206	Eastern Cape	EC	2024-09-17 21:00:07	2024-09-17 21:00:07
3783	206	Free State	FS	2024-09-17 21:00:07	2024-09-17 21:00:07
3784	206	Gauteng	GP	2024-09-17 21:00:07	2024-09-17 21:00:07
3785	206	KwaZulu-Natal	KZN	2024-09-17 21:00:07	2024-09-17 21:00:07
3786	206	Limpopo	LP	2024-09-17 21:00:07	2024-09-17 21:00:07
3787	206	Mpumalanga	MP	2024-09-17 21:00:07	2024-09-17 21:00:07
3788	206	North West	NW	2024-09-17 21:00:07	2024-09-17 21:00:07
3789	206	Northern Cape	NC	2024-09-17 21:00:07	2024-09-17 21:00:07
3790	206	Western Cape	WC	2024-09-17 21:00:07	2024-09-17 21:00:07
3791	208	Busan	26	2024-09-17 21:00:07	2024-09-17 21:00:07
3792	208	Daegu	27	2024-09-17 21:00:07	2024-09-17 21:00:07
3793	208	Daejeon	30	2024-09-17 21:00:07	2024-09-17 21:00:07
3794	208	Gangwon Province	42	2024-09-17 21:00:07	2024-09-17 21:00:07
3795	208	Gwangju	29	2024-09-17 21:00:07	2024-09-17 21:00:07
3796	208	Gyeonggi Province	41	2024-09-17 21:00:07	2024-09-17 21:00:07
3797	208	Incheon	28	2024-09-17 21:00:07	2024-09-17 21:00:07
3798	208	Jeju	49	2024-09-17 21:00:07	2024-09-17 21:00:07
3799	208	North Chungcheong Province	43	2024-09-17 21:00:07	2024-09-17 21:00:07
3800	208	North Gyeongsang Province	47	2024-09-17 21:00:07	2024-09-17 21:00:07
3801	208	North Jeolla Province	45	2024-09-17 21:00:07	2024-09-17 21:00:07
3802	208	Sejong City	50	2024-09-17 21:00:07	2024-09-17 21:00:07
3803	208	Seoul	11	2024-09-17 21:00:07	2024-09-17 21:00:07
3804	208	South Chungcheong Province	44	2024-09-17 21:00:07	2024-09-17 21:00:07
3805	208	South Gyeongsang Province	48	2024-09-17 21:00:07	2024-09-17 21:00:07
3806	208	South Jeolla Province	46	2024-09-17 21:00:07	2024-09-17 21:00:07
3807	208	Ulsan	31	2024-09-17 21:00:07	2024-09-17 21:00:07
3808	209	Central Equatoria	EC	2024-09-17 21:00:07	2024-09-17 21:00:07
3809	209	Eastern Equatoria	EE	2024-09-17 21:00:07	2024-09-17 21:00:07
3810	209	Jonglei State	JG	2024-09-17 21:00:07	2024-09-17 21:00:07
3811	209	Lakes	LK	2024-09-17 21:00:07	2024-09-17 21:00:07
3812	209	Northern Bahr el Ghazal	BN	2024-09-17 21:00:07	2024-09-17 21:00:07
3813	209	Unity	UY	2024-09-17 21:00:07	2024-09-17 21:00:07
3814	209	Upper Nile	NU	2024-09-17 21:00:07	2024-09-17 21:00:07
3815	209	Warrap	WR	2024-09-17 21:00:07	2024-09-17 21:00:07
3816	209	Western Bahr el Ghazal	BW	2024-09-17 21:00:07	2024-09-17 21:00:07
3817	209	Western Equatoria	EW	2024-09-17 21:00:07	2024-09-17 21:00:07
3818	210	Andalusia	AN	2024-09-17 21:00:07	2024-09-17 21:00:07
3819	210	Aragon	AR	2024-09-17 21:00:07	2024-09-17 21:00:07
3820	210	Asturias	AS	2024-09-17 21:00:07	2024-09-17 21:00:07
3821	210	Ávila	AV	2024-09-17 21:00:07	2024-09-17 21:00:07
3822	210	Balearic Islands	PM	2024-09-17 21:00:07	2024-09-17 21:00:07
3823	210	Basque Country	PV	2024-09-17 21:00:07	2024-09-17 21:00:07
3824	210	Burgos Province	BU	2024-09-17 21:00:07	2024-09-17 21:00:07
3825	210	Canary Islands	CN	2024-09-17 21:00:07	2024-09-17 21:00:07
3826	210	Cantabria	CB	2024-09-17 21:00:07	2024-09-17 21:00:07
3827	210	Castile and León	CL	2024-09-17 21:00:07	2024-09-17 21:00:07
3828	210	Castilla La Mancha	CM	2024-09-17 21:00:07	2024-09-17 21:00:07
3829	210	Catalonia	CT	2024-09-17 21:00:07	2024-09-17 21:00:07
3830	210	Ceuta	CE	2024-09-17 21:00:07	2024-09-17 21:00:07
3831	210	Extremadura	EX	2024-09-17 21:00:07	2024-09-17 21:00:07
3832	210	Galicia	GA	2024-09-17 21:00:07	2024-09-17 21:00:07
3833	210	La Rioja	RI	2024-09-17 21:00:07	2024-09-17 21:00:07
3834	210	Léon	LE	2024-09-17 21:00:07	2024-09-17 21:00:07
3835	210	Madrid	MD	2024-09-17 21:00:07	2024-09-17 21:00:07
3836	210	Melilla	ML	2024-09-17 21:00:07	2024-09-17 21:00:07
3837	210	Murcia	MC	2024-09-17 21:00:07	2024-09-17 21:00:07
3838	210	Navarra	NC	2024-09-17 21:00:07	2024-09-17 21:00:07
3839	210	Palencia Province	P	2024-09-17 21:00:07	2024-09-17 21:00:07
3840	210	Salamanca Province	SA	2024-09-17 21:00:07	2024-09-17 21:00:07
3841	210	Segovia Province	SG	2024-09-17 21:00:07	2024-09-17 21:00:07
3842	210	Soria Province	SO	2024-09-17 21:00:07	2024-09-17 21:00:07
3843	210	Valencia	VC	2024-09-17 21:00:07	2024-09-17 21:00:07
3844	210	Valladolid Province	VA	2024-09-17 21:00:07	2024-09-17 21:00:07
3845	210	Zamora Province	ZA	2024-09-17 21:00:07	2024-09-17 21:00:07
3846	211	Ampara District	52	2024-09-17 21:00:07	2024-09-17 21:00:07
3847	211	Anuradhapura District	71	2024-09-17 21:00:07	2024-09-17 21:00:07
3848	211	Badulla District	81	2024-09-17 21:00:07	2024-09-17 21:00:07
3849	211	Batticaloa District	51	2024-09-17 21:00:07	2024-09-17 21:00:07
3850	211	Central Province	2	2024-09-17 21:00:07	2024-09-17 21:00:07
3851	211	Colombo District	11	2024-09-17 21:00:07	2024-09-17 21:00:07
3852	211	Eastern Province	5	2024-09-17 21:00:07	2024-09-17 21:00:07
3853	211	Galle District	31	2024-09-17 21:00:07	2024-09-17 21:00:07
3854	211	Gampaha District	12	2024-09-17 21:00:07	2024-09-17 21:00:07
3855	211	Hambantota District	33	2024-09-17 21:00:07	2024-09-17 21:00:07
3856	211	Jaffna District	41	2024-09-17 21:00:07	2024-09-17 21:00:07
3857	211	Kalutara District	13	2024-09-17 21:00:07	2024-09-17 21:00:07
3858	211	Kandy District	21	2024-09-17 21:00:07	2024-09-17 21:00:07
3859	211	Kegalle District	92	2024-09-17 21:00:07	2024-09-17 21:00:07
3860	211	Kilinochchi District	42	2024-09-17 21:00:07	2024-09-17 21:00:07
3861	211	Mannar District	43	2024-09-17 21:00:07	2024-09-17 21:00:07
3862	211	Matale District	22	2024-09-17 21:00:07	2024-09-17 21:00:07
3863	211	Matara District	32	2024-09-17 21:00:07	2024-09-17 21:00:07
3864	211	Monaragala District	82	2024-09-17 21:00:07	2024-09-17 21:00:07
3865	211	Mullaitivu District	45	2024-09-17 21:00:07	2024-09-17 21:00:07
3866	211	North Central Province	7	2024-09-17 21:00:07	2024-09-17 21:00:07
3867	211	North Western Province	6	2024-09-17 21:00:07	2024-09-17 21:00:07
3868	211	Northern Province	4	2024-09-17 21:00:07	2024-09-17 21:00:07
3869	211	Nuwara Eliya District	23	2024-09-17 21:00:07	2024-09-17 21:00:07
3870	211	Polonnaruwa District	72	2024-09-17 21:00:07	2024-09-17 21:00:07
3871	211	Puttalam District	62	2024-09-17 21:00:07	2024-09-17 21:00:07
3872	211	Ratnapura district	91	2024-09-17 21:00:07	2024-09-17 21:00:07
3873	211	Sabaragamuwa Province	9	2024-09-17 21:00:07	2024-09-17 21:00:07
3874	211	Southern Province	3	2024-09-17 21:00:07	2024-09-17 21:00:07
3875	211	Trincomalee District	53	2024-09-17 21:00:07	2024-09-17 21:00:07
3876	211	Uva Province	8	2024-09-17 21:00:07	2024-09-17 21:00:07
3877	211	Vavuniya District	44	2024-09-17 21:00:07	2024-09-17 21:00:07
3878	211	Western Province	1	2024-09-17 21:00:07	2024-09-17 21:00:07
3879	212	Al Jazirah	GZ	2024-09-17 21:00:07	2024-09-17 21:00:07
3880	212	Al Qadarif	GD	2024-09-17 21:00:07	2024-09-17 21:00:07
3881	212	Blue Nile	NB	2024-09-17 21:00:07	2024-09-17 21:00:07
3882	212	Central Darfur	DC	2024-09-17 21:00:07	2024-09-17 21:00:07
3883	212	East Darfur	DE	2024-09-17 21:00:07	2024-09-17 21:00:07
3884	212	Kassala	KA	2024-09-17 21:00:07	2024-09-17 21:00:07
3885	212	Khartoum	KH	2024-09-17 21:00:07	2024-09-17 21:00:07
3886	212	North Darfur	DN	2024-09-17 21:00:07	2024-09-17 21:00:07
3887	212	North Kordofan	KN	2024-09-17 21:00:07	2024-09-17 21:00:07
3888	212	Northern	NO	2024-09-17 21:00:07	2024-09-17 21:00:07
3889	212	Red Sea	RS	2024-09-17 21:00:07	2024-09-17 21:00:07
3890	212	River Nile	NR	2024-09-17 21:00:07	2024-09-17 21:00:07
3891	212	Sennar	SI	2024-09-17 21:00:07	2024-09-17 21:00:07
3892	212	South Darfur	DS	2024-09-17 21:00:07	2024-09-17 21:00:07
3893	212	South Kordofan	KS	2024-09-17 21:00:07	2024-09-17 21:00:07
3894	212	West Darfur	DW	2024-09-17 21:00:07	2024-09-17 21:00:07
3895	212	West Kordofan	GK	2024-09-17 21:00:07	2024-09-17 21:00:07
3896	212	White Nile	NW	2024-09-17 21:00:07	2024-09-17 21:00:07
3897	213	Brokopondo District	BR	2024-09-17 21:00:07	2024-09-17 21:00:07
3898	213	Commewijne District	CM	2024-09-17 21:00:07	2024-09-17 21:00:07
3899	213	Coronie District	CR	2024-09-17 21:00:07	2024-09-17 21:00:07
3900	213	Marowijne District	MA	2024-09-17 21:00:07	2024-09-17 21:00:07
3901	213	Nickerie District	NI	2024-09-17 21:00:07	2024-09-17 21:00:07
3902	213	Para District	PR	2024-09-17 21:00:07	2024-09-17 21:00:07
3903	213	Paramaribo District	PM	2024-09-17 21:00:07	2024-09-17 21:00:07
3904	213	Saramacca District	SA	2024-09-17 21:00:07	2024-09-17 21:00:07
3905	213	Sipaliwini District	SI	2024-09-17 21:00:07	2024-09-17 21:00:07
3906	213	Wanica District	WA	2024-09-17 21:00:07	2024-09-17 21:00:07
3907	215	Hhohho District	HH	2024-09-17 21:00:07	2024-09-17 21:00:07
3908	215	Lubombo District	LU	2024-09-17 21:00:07	2024-09-17 21:00:07
3909	215	Manzini District	MA	2024-09-17 21:00:07	2024-09-17 21:00:07
3910	215	Shiselweni District	SH	2024-09-17 21:00:07	2024-09-17 21:00:07
3911	216	Blekinge	K	2024-09-17 21:00:07	2024-09-17 21:00:07
3912	216	Dalarna County	W	2024-09-17 21:00:07	2024-09-17 21:00:07
3913	216	Gävleborg County	X	2024-09-17 21:00:07	2024-09-17 21:00:07
3914	216	Gotland County	I	2024-09-17 21:00:07	2024-09-17 21:00:07
3915	216	Halland County	N	2024-09-17 21:00:07	2024-09-17 21:00:07
3916	216	Jönköping County	F	2024-09-17 21:00:07	2024-09-17 21:00:07
3917	216	Kalmar County	H	2024-09-17 21:00:07	2024-09-17 21:00:07
3918	216	Kronoberg County	G	2024-09-17 21:00:07	2024-09-17 21:00:07
3919	216	Norrbotten County	BD	2024-09-17 21:00:07	2024-09-17 21:00:07
3920	216	Örebro County	T	2024-09-17 21:00:07	2024-09-17 21:00:07
3921	216	Östergötland County	E	2024-09-17 21:00:07	2024-09-17 21:00:07
3922	216	Skåne County	M	2024-09-17 21:00:07	2024-09-17 21:00:07
3923	216	Södermanland County	D	2024-09-17 21:00:07	2024-09-17 21:00:07
3924	216	Stockholm County	AB	2024-09-17 21:00:07	2024-09-17 21:00:07
3925	216	Uppsala County	C	2024-09-17 21:00:07	2024-09-17 21:00:07
3926	216	Värmland County	S	2024-09-17 21:00:07	2024-09-17 21:00:07
3927	216	Västerbotten County	AC	2024-09-17 21:00:07	2024-09-17 21:00:07
3928	216	Västernorrland County	Y	2024-09-17 21:00:07	2024-09-17 21:00:07
3929	216	Västmanland County	U	2024-09-17 21:00:07	2024-09-17 21:00:07
3930	216	Västra Götaland County	O	2024-09-17 21:00:07	2024-09-17 21:00:07
3931	217	Aargau	AG	2024-09-17 21:00:07	2024-09-17 21:00:07
3932	217	Appenzell Ausserrhoden	AR	2024-09-17 21:00:07	2024-09-17 21:00:07
3933	217	Appenzell Innerrhoden	AI	2024-09-17 21:00:07	2024-09-17 21:00:07
3934	217	Basel-Land	BL	2024-09-17 21:00:07	2024-09-17 21:00:07
3935	217	Basel-Stadt	BS	2024-09-17 21:00:07	2024-09-17 21:00:07
3936	217	Bern	BE	2024-09-17 21:00:07	2024-09-17 21:00:07
3937	217	Fribourg	FR	2024-09-17 21:00:07	2024-09-17 21:00:07
3938	217	Geneva	GE	2024-09-17 21:00:07	2024-09-17 21:00:07
3939	217	Glarus	GL	2024-09-17 21:00:07	2024-09-17 21:00:07
3940	217	Graubünden	GR	2024-09-17 21:00:07	2024-09-17 21:00:07
3941	217	Jura	JU	2024-09-17 21:00:07	2024-09-17 21:00:07
3942	217	Lucerne	LU	2024-09-17 21:00:07	2024-09-17 21:00:07
3943	217	Neuchâtel	NE	2024-09-17 21:00:07	2024-09-17 21:00:07
3944	217	Nidwalden	NW	2024-09-17 21:00:07	2024-09-17 21:00:07
3945	217	Obwalden	OW	2024-09-17 21:00:07	2024-09-17 21:00:07
3946	217	Schaffhausen	SH	2024-09-17 21:00:07	2024-09-17 21:00:07
3947	217	Schwyz	SZ	2024-09-17 21:00:07	2024-09-17 21:00:07
3948	217	Solothurn	SO	2024-09-17 21:00:07	2024-09-17 21:00:07
3949	217	St. Gallen	SG	2024-09-17 21:00:07	2024-09-17 21:00:07
3950	217	Thurgau	TG	2024-09-17 21:00:07	2024-09-17 21:00:07
3951	217	Ticino	TI	2024-09-17 21:00:07	2024-09-17 21:00:07
3952	217	Uri	UR	2024-09-17 21:00:07	2024-09-17 21:00:07
3953	217	Valais	VS	2024-09-17 21:00:07	2024-09-17 21:00:07
3954	217	Vaud	VD	2024-09-17 21:00:07	2024-09-17 21:00:07
3955	217	Zug	ZG	2024-09-17 21:00:07	2024-09-17 21:00:07
3956	217	Zürich	ZH	2024-09-17 21:00:07	2024-09-17 21:00:07
3957	218	Al-Hasakah Governorate	HA	2024-09-17 21:00:07	2024-09-17 21:00:07
3958	218	Al-Raqqah Governorate	RA	2024-09-17 21:00:07	2024-09-17 21:00:07
3959	218	Aleppo Governorate	HL	2024-09-17 21:00:07	2024-09-17 21:00:07
3960	218	As-Suwayda Governorate	SU	2024-09-17 21:00:07	2024-09-17 21:00:07
3961	218	Damascus Governorate	DI	2024-09-17 21:00:07	2024-09-17 21:00:07
3962	218	Daraa Governorate	DR	2024-09-17 21:00:07	2024-09-17 21:00:07
3963	218	Deir ez-Zor Governorate	DY	2024-09-17 21:00:07	2024-09-17 21:00:07
3964	218	Hama Governorate	HM	2024-09-17 21:00:07	2024-09-17 21:00:07
3965	218	Homs Governorate	HI	2024-09-17 21:00:07	2024-09-17 21:00:07
3966	218	Idlib Governorate	ID	2024-09-17 21:00:07	2024-09-17 21:00:07
3967	218	Latakia Governorate	LA	2024-09-17 21:00:07	2024-09-17 21:00:07
3968	218	Quneitra Governorate	QU	2024-09-17 21:00:07	2024-09-17 21:00:07
3969	218	Rif Dimashq Governorate	RD	2024-09-17 21:00:07	2024-09-17 21:00:07
3970	218	Tartus Governorate	TA	2024-09-17 21:00:07	2024-09-17 21:00:07
3971	219	Changhua County	CHA	2024-09-17 21:00:07	2024-09-17 21:00:07
3972	219	Chiayi City	CYQ	2024-09-17 21:00:07	2024-09-17 21:00:07
3973	219	Chiayi County	CYI	2024-09-17 21:00:07	2024-09-17 21:00:07
3974	219	Hsinchu	HSZ	2024-09-17 21:00:07	2024-09-17 21:00:07
3975	219	Hsinchu County	HSQ	2024-09-17 21:00:07	2024-09-17 21:00:07
3976	219	Hualien County	HUA	2024-09-17 21:00:07	2024-09-17 21:00:07
3977	219	Kaohsiung	KHH	2024-09-17 21:00:07	2024-09-17 21:00:07
3978	219	Kaohsiung County	KHQ	2024-09-17 21:00:07	2024-09-17 21:00:07
3979	219	Kinmen	KIN	2024-09-17 21:00:07	2024-09-17 21:00:07
3980	219	Lienchiang County	LIE	2024-09-17 21:00:07	2024-09-17 21:00:07
3981	219	Miaoli County	MIA	2024-09-17 21:00:07	2024-09-17 21:00:07
3982	219	Nantou County	NAN	2024-09-17 21:00:07	2024-09-17 21:00:07
3983	219	Penghu County	PEN	2024-09-17 21:00:07	2024-09-17 21:00:07
3984	219	Pingtung County	PIF	2024-09-17 21:00:07	2024-09-17 21:00:07
3985	219	Taichung	TXG	2024-09-17 21:00:07	2024-09-17 21:00:07
3986	219	Taichung County	TXQ	2024-09-17 21:00:07	2024-09-17 21:00:07
3987	219	Tainan	TNN	2024-09-17 21:00:07	2024-09-17 21:00:07
3988	219	Tainan County	TNQ	2024-09-17 21:00:07	2024-09-17 21:00:07
3989	219	Taipei	TPE	2024-09-17 21:00:07	2024-09-17 21:00:07
3990	219	Taitung County	TTT	2024-09-17 21:00:07	2024-09-17 21:00:07
3991	219	Taoyuan City	TAO	2024-09-17 21:00:07	2024-09-17 21:00:07
3992	219	Yilan County	ILA	2024-09-17 21:00:07	2024-09-17 21:00:07
3993	219	Yunlin County	YUN	2024-09-17 21:00:07	2024-09-17 21:00:07
3994	220	districts of Republican Subordination	RA	2024-09-17 21:00:07	2024-09-17 21:00:07
3995	220	Gorno-Badakhshan Autonomous Province	GB	2024-09-17 21:00:07	2024-09-17 21:00:07
3996	220	Khatlon Province	KT	2024-09-17 21:00:07	2024-09-17 21:00:07
3997	220	Sughd Province	SU	2024-09-17 21:00:07	2024-09-17 21:00:07
3998	221	Arusha	01	2024-09-17 21:00:07	2024-09-17 21:00:07
3999	221	Dar es Salaam	02	2024-09-17 21:00:07	2024-09-17 21:00:07
4000	221	Dodoma	03	2024-09-17 21:00:07	2024-09-17 21:00:07
4001	221	Geita	27	2024-09-17 21:00:07	2024-09-17 21:00:07
4002	221	Iringa	04	2024-09-17 21:00:07	2024-09-17 21:00:07
4003	221	Kagera	05	2024-09-17 21:00:07	2024-09-17 21:00:07
4004	221	Katavi	28	2024-09-17 21:00:07	2024-09-17 21:00:07
4005	221	Kigoma	08	2024-09-17 21:00:07	2024-09-17 21:00:07
4006	221	Kilimanjaro	09	2024-09-17 21:00:07	2024-09-17 21:00:07
4007	221	Lindi	12	2024-09-17 21:00:07	2024-09-17 21:00:07
4008	221	Manyara	26	2024-09-17 21:00:07	2024-09-17 21:00:07
4009	221	Mara	13	2024-09-17 21:00:07	2024-09-17 21:00:07
4010	221	Mbeya	14	2024-09-17 21:00:07	2024-09-17 21:00:07
4011	221	Morogoro	16	2024-09-17 21:00:07	2024-09-17 21:00:07
4012	221	Mtwara	17	2024-09-17 21:00:07	2024-09-17 21:00:07
4013	221	Mwanza	18	2024-09-17 21:00:07	2024-09-17 21:00:07
4014	221	Njombe	29	2024-09-17 21:00:07	2024-09-17 21:00:07
4015	221	Pemba North	06	2024-09-17 21:00:07	2024-09-17 21:00:07
4016	221	Pemba South	10	2024-09-17 21:00:07	2024-09-17 21:00:07
4017	221	Pwani	19	2024-09-17 21:00:07	2024-09-17 21:00:07
4018	221	Rukwa	20	2024-09-17 21:00:07	2024-09-17 21:00:07
4019	221	Ruvuma	21	2024-09-17 21:00:07	2024-09-17 21:00:07
4020	221	Shinyanga	22	2024-09-17 21:00:07	2024-09-17 21:00:07
4021	221	Simiyu	30	2024-09-17 21:00:07	2024-09-17 21:00:07
4022	221	Singida	23	2024-09-17 21:00:07	2024-09-17 21:00:07
4023	221	Songwe	31	2024-09-17 21:00:07	2024-09-17 21:00:07
4024	221	Tabora	24	2024-09-17 21:00:07	2024-09-17 21:00:07
4025	221	Tanga	25	2024-09-17 21:00:07	2024-09-17 21:00:07
4026	221	Zanzibar North	07	2024-09-17 21:00:07	2024-09-17 21:00:07
4027	221	Zanzibar South	11	2024-09-17 21:00:07	2024-09-17 21:00:07
4028	221	Zanzibar West	15	2024-09-17 21:00:07	2024-09-17 21:00:07
4029	222	Amnat Charoen	37	2024-09-17 21:00:07	2024-09-17 21:00:07
4030	222	Ang Thong	15	2024-09-17 21:00:07	2024-09-17 21:00:07
4031	222	Bangkok	10	2024-09-17 21:00:07	2024-09-17 21:00:07
4032	222	Bueng Kan	38	2024-09-17 21:00:07	2024-09-17 21:00:07
4033	222	Buri Ram	31	2024-09-17 21:00:07	2024-09-17 21:00:07
4034	222	Chachoengsao	24	2024-09-17 21:00:07	2024-09-17 21:00:07
4035	222	Chai Nat	18	2024-09-17 21:00:07	2024-09-17 21:00:07
4036	222	Chaiyaphum	36	2024-09-17 21:00:07	2024-09-17 21:00:07
4037	222	Chanthaburi	22	2024-09-17 21:00:07	2024-09-17 21:00:07
4038	222	Chiang Mai	50	2024-09-17 21:00:07	2024-09-17 21:00:07
4039	222	Chiang Rai	57	2024-09-17 21:00:07	2024-09-17 21:00:07
4040	222	Chon Buri	20	2024-09-17 21:00:07	2024-09-17 21:00:07
4041	222	Chumphon	86	2024-09-17 21:00:07	2024-09-17 21:00:07
4042	222	Kalasin	46	2024-09-17 21:00:07	2024-09-17 21:00:07
4043	222	Kamphaeng Phet	62	2024-09-17 21:00:07	2024-09-17 21:00:07
4044	222	Kanchanaburi	71	2024-09-17 21:00:07	2024-09-17 21:00:07
4045	222	Khon Kaen	40	2024-09-17 21:00:07	2024-09-17 21:00:07
4046	222	Krabi	81	2024-09-17 21:00:07	2024-09-17 21:00:07
4047	222	Lampang	52	2024-09-17 21:00:07	2024-09-17 21:00:07
4048	222	Lamphun	51	2024-09-17 21:00:07	2024-09-17 21:00:07
4049	222	Loei	42	2024-09-17 21:00:07	2024-09-17 21:00:07
4050	222	Lop Buri	16	2024-09-17 21:00:07	2024-09-17 21:00:07
4051	222	Mae Hong Son	58	2024-09-17 21:00:07	2024-09-17 21:00:07
4052	222	Maha Sarakham	44	2024-09-17 21:00:07	2024-09-17 21:00:07
4053	222	Mukdahan	49	2024-09-17 21:00:07	2024-09-17 21:00:07
4054	222	Nakhon Nayok	26	2024-09-17 21:00:07	2024-09-17 21:00:07
4055	222	Nakhon Pathom	73	2024-09-17 21:00:07	2024-09-17 21:00:07
4056	222	Nakhon Phanom	48	2024-09-17 21:00:07	2024-09-17 21:00:07
4057	222	Nakhon Ratchasima	30	2024-09-17 21:00:07	2024-09-17 21:00:07
4058	222	Nakhon Sawan	60	2024-09-17 21:00:07	2024-09-17 21:00:07
4059	222	Nakhon Si Thammarat	80	2024-09-17 21:00:07	2024-09-17 21:00:07
4060	222	Nan	55	2024-09-17 21:00:07	2024-09-17 21:00:07
4061	222	Narathiwat	96	2024-09-17 21:00:07	2024-09-17 21:00:07
4062	222	Nong Bua Lam Phu	39	2024-09-17 21:00:07	2024-09-17 21:00:07
4063	222	Nong Khai	43	2024-09-17 21:00:07	2024-09-17 21:00:07
4064	222	Nonthaburi	12	2024-09-17 21:00:07	2024-09-17 21:00:07
4065	222	Pathum Thani	13	2024-09-17 21:00:07	2024-09-17 21:00:07
4066	222	Pattani	94	2024-09-17 21:00:07	2024-09-17 21:00:07
4067	222	Pattaya	S	2024-09-17 21:00:07	2024-09-17 21:00:07
4068	222	Phangnga	82	2024-09-17 21:00:07	2024-09-17 21:00:07
4069	222	Phatthalung	93	2024-09-17 21:00:07	2024-09-17 21:00:07
4070	222	Phayao	56	2024-09-17 21:00:07	2024-09-17 21:00:07
4071	222	Phetchabun	67	2024-09-17 21:00:07	2024-09-17 21:00:07
4072	222	Phetchaburi	76	2024-09-17 21:00:07	2024-09-17 21:00:07
4073	222	Phichit	66	2024-09-17 21:00:07	2024-09-17 21:00:07
4074	222	Phitsanulok	65	2024-09-17 21:00:07	2024-09-17 21:00:07
4075	222	Phra Nakhon Si Ayutthaya	14	2024-09-17 21:00:07	2024-09-17 21:00:07
4076	222	Phrae	54	2024-09-17 21:00:07	2024-09-17 21:00:07
4077	222	Phuket	83	2024-09-17 21:00:07	2024-09-17 21:00:07
4078	222	Prachin Buri	25	2024-09-17 21:00:07	2024-09-17 21:00:07
4079	222	Prachuap Khiri Khan	77	2024-09-17 21:00:07	2024-09-17 21:00:07
4080	222	Ranong	85	2024-09-17 21:00:07	2024-09-17 21:00:07
4081	222	Ratchaburi	70	2024-09-17 21:00:07	2024-09-17 21:00:07
4082	222	Rayong	21	2024-09-17 21:00:07	2024-09-17 21:00:07
4083	222	Roi Et	45	2024-09-17 21:00:07	2024-09-17 21:00:07
4084	222	Sa Kaeo	27	2024-09-17 21:00:07	2024-09-17 21:00:07
4085	222	Sakon Nakhon	47	2024-09-17 21:00:07	2024-09-17 21:00:07
4086	222	Samut Prakan	11	2024-09-17 21:00:07	2024-09-17 21:00:07
4087	222	Samut Sakhon	74	2024-09-17 21:00:07	2024-09-17 21:00:07
4088	222	Samut Songkhram	75	2024-09-17 21:00:07	2024-09-17 21:00:07
4089	222	Saraburi	19	2024-09-17 21:00:07	2024-09-17 21:00:07
4090	222	Satun	91	2024-09-17 21:00:07	2024-09-17 21:00:07
4091	222	Si Sa Ket	33	2024-09-17 21:00:07	2024-09-17 21:00:07
4092	222	Sing Buri	17	2024-09-17 21:00:07	2024-09-17 21:00:07
4093	222	Songkhla	90	2024-09-17 21:00:07	2024-09-17 21:00:07
4094	222	Sukhothai	64	2024-09-17 21:00:07	2024-09-17 21:00:07
4095	222	Suphan Buri	72	2024-09-17 21:00:07	2024-09-17 21:00:07
4096	222	Surat Thani	84	2024-09-17 21:00:07	2024-09-17 21:00:07
4097	222	Surin	32	2024-09-17 21:00:07	2024-09-17 21:00:07
4098	222	Tak	63	2024-09-17 21:00:07	2024-09-17 21:00:07
4099	222	Trang	92	2024-09-17 21:00:07	2024-09-17 21:00:07
4100	222	Trat	23	2024-09-17 21:00:07	2024-09-17 21:00:07
4101	222	Ubon Ratchathani	34	2024-09-17 21:00:07	2024-09-17 21:00:07
4102	222	Udon Thani	41	2024-09-17 21:00:07	2024-09-17 21:00:07
4103	222	Uthai Thani	61	2024-09-17 21:00:07	2024-09-17 21:00:07
4104	222	Uttaradit	53	2024-09-17 21:00:07	2024-09-17 21:00:07
4105	222	Yala	95	2024-09-17 21:00:07	2024-09-17 21:00:07
4106	222	Yasothon	35	2024-09-17 21:00:07	2024-09-17 21:00:07
4107	223	Centrale Region	C	2024-09-17 21:00:07	2024-09-17 21:00:07
4108	223	Kara Region	K	2024-09-17 21:00:07	2024-09-17 21:00:07
4109	223	Maritime	M	2024-09-17 21:00:07	2024-09-17 21:00:07
4110	223	Plateaux Region	P	2024-09-17 21:00:07	2024-09-17 21:00:07
4111	223	Savanes Region	S	2024-09-17 21:00:07	2024-09-17 21:00:07
4112	225	Haʻapai	02	2024-09-17 21:00:07	2024-09-17 21:00:07
4113	225	ʻEua	01	2024-09-17 21:00:07	2024-09-17 21:00:07
4114	225	Niuas	03	2024-09-17 21:00:07	2024-09-17 21:00:07
4115	225	Tongatapu	04	2024-09-17 21:00:07	2024-09-17 21:00:07
4116	225	Vavaʻu	05	2024-09-17 21:00:07	2024-09-17 21:00:07
4117	226	Arima	ARI	2024-09-17 21:00:07	2024-09-17 21:00:07
4118	226	Chaguanas	CHA	2024-09-17 21:00:07	2024-09-17 21:00:07
4119	226	Couva-Tabaquite-Talparo Regional Corporation	CTT	2024-09-17 21:00:07	2024-09-17 21:00:07
4120	226	Diego Martin Regional Corporation	DMN	2024-09-17 21:00:07	2024-09-17 21:00:07
4121	226	Eastern Tobago	ETO	2024-09-17 21:00:07	2024-09-17 21:00:07
4122	226	Penal-Debe Regional Corporation	PED	2024-09-17 21:00:07	2024-09-17 21:00:07
4123	226	Point Fortin	PTF	2024-09-17 21:00:07	2024-09-17 21:00:07
4124	226	Port of Spain	POS	2024-09-17 21:00:07	2024-09-17 21:00:07
4125	226	Princes Town Regional Corporation	PRT	2024-09-17 21:00:07	2024-09-17 21:00:07
4126	226	Rio Claro-Mayaro Regional Corporation	MRC	2024-09-17 21:00:07	2024-09-17 21:00:07
4127	226	San Fernando	SFO	2024-09-17 21:00:07	2024-09-17 21:00:07
4128	226	San Juan-Laventille Regional Corporation	SJL	2024-09-17 21:00:07	2024-09-17 21:00:07
4129	226	Sangre Grande Regional Corporation	SGE	2024-09-17 21:00:07	2024-09-17 21:00:07
4130	226	Siparia Regional Corporation	SIP	2024-09-17 21:00:07	2024-09-17 21:00:07
4131	226	Tunapuna-Piarco Regional Corporation	TUP	2024-09-17 21:00:07	2024-09-17 21:00:07
4132	226	Western Tobago	WTO	2024-09-17 21:00:07	2024-09-17 21:00:07
4133	227	Ariana Governorate	12	2024-09-17 21:00:07	2024-09-17 21:00:07
4134	227	Ben Arous Governorate	13	2024-09-17 21:00:07	2024-09-17 21:00:07
4135	227	Bizerte Governorate	23	2024-09-17 21:00:07	2024-09-17 21:00:07
4136	227	Gabès Governorate	81	2024-09-17 21:00:07	2024-09-17 21:00:07
4137	227	Gafsa Governorate	71	2024-09-17 21:00:07	2024-09-17 21:00:07
4138	227	Jendouba Governorate	32	2024-09-17 21:00:07	2024-09-17 21:00:07
4139	227	Kairouan Governorate	41	2024-09-17 21:00:07	2024-09-17 21:00:07
4140	227	Kasserine Governorate	42	2024-09-17 21:00:07	2024-09-17 21:00:07
4141	227	Kassrine	31	2024-09-17 21:00:07	2024-09-17 21:00:07
4142	227	Kebili Governorate	73	2024-09-17 21:00:07	2024-09-17 21:00:07
4143	227	Kef Governorate	33	2024-09-17 21:00:07	2024-09-17 21:00:07
4144	227	Mahdia Governorate	53	2024-09-17 21:00:07	2024-09-17 21:00:07
4145	227	Manouba Governorate	14	2024-09-17 21:00:07	2024-09-17 21:00:07
4146	227	Medenine Governorate	82	2024-09-17 21:00:07	2024-09-17 21:00:07
4147	227	Monastir Governorate	52	2024-09-17 21:00:07	2024-09-17 21:00:07
4148	227	Sfax Governorate	61	2024-09-17 21:00:07	2024-09-17 21:00:07
4149	227	Sidi Bouzid Governorate	43	2024-09-17 21:00:07	2024-09-17 21:00:07
4150	227	Siliana Governorate	34	2024-09-17 21:00:07	2024-09-17 21:00:07
4151	227	Sousse Governorate	51	2024-09-17 21:00:07	2024-09-17 21:00:07
4152	227	Tataouine Governorate	83	2024-09-17 21:00:07	2024-09-17 21:00:07
4153	227	Tozeur Governorate	72	2024-09-17 21:00:07	2024-09-17 21:00:07
4154	227	Tunis Governorate	11	2024-09-17 21:00:07	2024-09-17 21:00:07
4155	227	Zaghouan Governorate	22	2024-09-17 21:00:07	2024-09-17 21:00:07
4156	228	Adana	01	2024-09-17 21:00:07	2024-09-17 21:00:07
4157	228	Adıyaman	02	2024-09-17 21:00:07	2024-09-17 21:00:07
4158	228	Afyonkarahisar	03	2024-09-17 21:00:07	2024-09-17 21:00:07
4159	228	Ağrı	04	2024-09-17 21:00:07	2024-09-17 21:00:07
4160	228	Aksaray	68	2024-09-17 21:00:07	2024-09-17 21:00:07
4161	228	Amasya	05	2024-09-17 21:00:07	2024-09-17 21:00:07
4162	228	Ankara	06	2024-09-17 21:00:07	2024-09-17 21:00:07
4163	228	Antalya	07	2024-09-17 21:00:07	2024-09-17 21:00:07
4164	228	Ardahan	75	2024-09-17 21:00:07	2024-09-17 21:00:07
4165	228	Artvin	08	2024-09-17 21:00:07	2024-09-17 21:00:07
4166	228	Aydın	09	2024-09-17 21:00:07	2024-09-17 21:00:07
4167	228	Balıkesir	10	2024-09-17 21:00:07	2024-09-17 21:00:07
4168	228	Bartın	74	2024-09-17 21:00:07	2024-09-17 21:00:07
4169	228	Batman	72	2024-09-17 21:00:07	2024-09-17 21:00:07
4170	228	Bayburt	69	2024-09-17 21:00:07	2024-09-17 21:00:07
4171	228	Bilecik	11	2024-09-17 21:00:07	2024-09-17 21:00:07
4172	228	Bingöl	12	2024-09-17 21:00:07	2024-09-17 21:00:07
4173	228	Bitlis	13	2024-09-17 21:00:07	2024-09-17 21:00:07
4174	228	Bolu	14	2024-09-17 21:00:07	2024-09-17 21:00:07
4175	228	Burdur	15	2024-09-17 21:00:07	2024-09-17 21:00:07
4176	228	Bursa	16	2024-09-17 21:00:07	2024-09-17 21:00:07
4177	228	Çanakkale	17	2024-09-17 21:00:07	2024-09-17 21:00:07
4178	228	Çankırı	18	2024-09-17 21:00:07	2024-09-17 21:00:07
4179	228	Çorum	19	2024-09-17 21:00:07	2024-09-17 21:00:07
4180	228	Denizli	20	2024-09-17 21:00:07	2024-09-17 21:00:07
4181	228	Diyarbakır	21	2024-09-17 21:00:07	2024-09-17 21:00:07
4182	228	Düzce	81	2024-09-17 21:00:07	2024-09-17 21:00:07
4183	228	Edirne	22	2024-09-17 21:00:07	2024-09-17 21:00:07
4184	228	Elazığ	23	2024-09-17 21:00:07	2024-09-17 21:00:07
4185	228	Erzincan	24	2024-09-17 21:00:07	2024-09-17 21:00:07
4186	228	Erzurum	25	2024-09-17 21:00:07	2024-09-17 21:00:07
4187	228	Eskişehir	26	2024-09-17 21:00:07	2024-09-17 21:00:07
4188	228	Gaziantep	27	2024-09-17 21:00:07	2024-09-17 21:00:07
4189	228	Giresun	28	2024-09-17 21:00:07	2024-09-17 21:00:07
4190	228	Gümüşhane	29	2024-09-17 21:00:07	2024-09-17 21:00:07
4191	228	Hakkâri	30	2024-09-17 21:00:07	2024-09-17 21:00:07
4192	228	Hatay	31	2024-09-17 21:00:07	2024-09-17 21:00:07
4193	228	Iğdır	76	2024-09-17 21:00:07	2024-09-17 21:00:07
4194	228	Isparta	32	2024-09-17 21:00:07	2024-09-17 21:00:07
4195	228	Istanbul	34	2024-09-17 21:00:07	2024-09-17 21:00:07
4196	228	İzmir	35	2024-09-17 21:00:07	2024-09-17 21:00:07
4197	228	Kahramanmaraş	46	2024-09-17 21:00:07	2024-09-17 21:00:07
4198	228	Karabük	78	2024-09-17 21:00:07	2024-09-17 21:00:07
4199	228	Karaman	70	2024-09-17 21:00:07	2024-09-17 21:00:07
4200	228	Kars	36	2024-09-17 21:00:07	2024-09-17 21:00:07
4201	228	Kastamonu	37	2024-09-17 21:00:07	2024-09-17 21:00:07
4202	228	Kayseri	38	2024-09-17 21:00:07	2024-09-17 21:00:07
4203	228	Kilis	79	2024-09-17 21:00:07	2024-09-17 21:00:07
4204	228	Kırıkkale	71	2024-09-17 21:00:07	2024-09-17 21:00:07
4205	228	Kırklareli	39	2024-09-17 21:00:07	2024-09-17 21:00:07
4206	228	Kırşehir	40	2024-09-17 21:00:07	2024-09-17 21:00:07
4207	228	Kocaeli	41	2024-09-17 21:00:07	2024-09-17 21:00:07
4208	228	Konya	42	2024-09-17 21:00:07	2024-09-17 21:00:07
4209	228	Kütahya	43	2024-09-17 21:00:07	2024-09-17 21:00:07
4210	228	Malatya	44	2024-09-17 21:00:07	2024-09-17 21:00:07
4211	228	Manisa	45	2024-09-17 21:00:07	2024-09-17 21:00:07
4212	228	Mardin	47	2024-09-17 21:00:07	2024-09-17 21:00:07
4213	228	Mersin	33	2024-09-17 21:00:07	2024-09-17 21:00:07
4214	228	Muğla	48	2024-09-17 21:00:07	2024-09-17 21:00:07
4215	228	Muş	49	2024-09-17 21:00:07	2024-09-17 21:00:07
4216	228	Nevşehir	50	2024-09-17 21:00:07	2024-09-17 21:00:07
4217	228	Niğde	51	2024-09-17 21:00:07	2024-09-17 21:00:07
4218	228	Ordu	52	2024-09-17 21:00:07	2024-09-17 21:00:07
4219	228	Osmaniye	80	2024-09-17 21:00:07	2024-09-17 21:00:07
4220	228	Rize	53	2024-09-17 21:00:07	2024-09-17 21:00:07
4221	228	Sakarya	54	2024-09-17 21:00:07	2024-09-17 21:00:07
4222	228	Samsun	55	2024-09-17 21:00:07	2024-09-17 21:00:07
4223	228	Şanlıurfa	63	2024-09-17 21:00:07	2024-09-17 21:00:07
4224	228	Siirt	56	2024-09-17 21:00:07	2024-09-17 21:00:07
4225	228	Sinop	57	2024-09-17 21:00:07	2024-09-17 21:00:07
4226	228	Sivas	58	2024-09-17 21:00:07	2024-09-17 21:00:07
4227	228	Şırnak	73	2024-09-17 21:00:07	2024-09-17 21:00:07
4228	228	Tekirdağ	59	2024-09-17 21:00:07	2024-09-17 21:00:07
4229	228	Tokat	60	2024-09-17 21:00:07	2024-09-17 21:00:07
4230	228	Trabzon	61	2024-09-17 21:00:08	2024-09-17 21:00:08
4231	228	Tunceli	62	2024-09-17 21:00:08	2024-09-17 21:00:08
4232	228	Uşak	64	2024-09-17 21:00:08	2024-09-17 21:00:08
4233	228	Van	65	2024-09-17 21:00:08	2024-09-17 21:00:08
4234	228	Yalova	77	2024-09-17 21:00:08	2024-09-17 21:00:08
4235	228	Yozgat	66	2024-09-17 21:00:08	2024-09-17 21:00:08
4236	228	Zonguldak	67	2024-09-17 21:00:08	2024-09-17 21:00:08
4237	229	Ahal Region	A	2024-09-17 21:00:08	2024-09-17 21:00:08
4238	229	Ashgabat	S	2024-09-17 21:00:08	2024-09-17 21:00:08
4239	229	Balkan Region	B	2024-09-17 21:00:08	2024-09-17 21:00:08
4240	229	Daşoguz Region	D	2024-09-17 21:00:08	2024-09-17 21:00:08
4241	229	Lebap Region	L	2024-09-17 21:00:08	2024-09-17 21:00:08
4242	229	Mary Region	M	2024-09-17 21:00:08	2024-09-17 21:00:08
4243	231	Funafuti	FUN	2024-09-17 21:00:08	2024-09-17 21:00:08
4244	231	Nanumanga	NMG	2024-09-17 21:00:08	2024-09-17 21:00:08
4245	231	Nanumea	NMA	2024-09-17 21:00:08	2024-09-17 21:00:08
4246	231	Niutao Island Council	NIT	2024-09-17 21:00:08	2024-09-17 21:00:08
4247	231	Nui	NUI	2024-09-17 21:00:08	2024-09-17 21:00:08
4248	231	Nukufetau	NKF	2024-09-17 21:00:08	2024-09-17 21:00:08
4249	231	Nukulaelae	NKL	2024-09-17 21:00:08	2024-09-17 21:00:08
4250	231	Vaitupu	VAI	2024-09-17 21:00:08	2024-09-17 21:00:08
4251	232	Abim District	314	2024-09-17 21:00:08	2024-09-17 21:00:08
4252	232	Adjumani District	301	2024-09-17 21:00:08	2024-09-17 21:00:08
4253	232	Agago District	322	2024-09-17 21:00:08	2024-09-17 21:00:08
4254	232	Alebtong District	323	2024-09-17 21:00:08	2024-09-17 21:00:08
4255	232	Amolatar District	315	2024-09-17 21:00:08	2024-09-17 21:00:08
4256	232	Amudat District	324	2024-09-17 21:00:08	2024-09-17 21:00:08
4257	232	Amuria District	216	2024-09-17 21:00:08	2024-09-17 21:00:08
4258	232	Amuru District	316	2024-09-17 21:00:08	2024-09-17 21:00:08
4259	232	Apac District	302	2024-09-17 21:00:08	2024-09-17 21:00:08
4260	232	Arua District	303	2024-09-17 21:00:08	2024-09-17 21:00:08
4261	232	Budaka District	217	2024-09-17 21:00:08	2024-09-17 21:00:08
4262	232	Bududa District	218	2024-09-17 21:00:08	2024-09-17 21:00:08
4263	232	Bugiri District	201	2024-09-17 21:00:08	2024-09-17 21:00:08
4264	232	Buhweju District	420	2024-09-17 21:00:08	2024-09-17 21:00:08
4265	232	Buikwe District	117	2024-09-17 21:00:08	2024-09-17 21:00:08
4266	232	Bukedea District	219	2024-09-17 21:00:08	2024-09-17 21:00:08
4267	232	Bukomansimbi District	118	2024-09-17 21:00:08	2024-09-17 21:00:08
4268	232	Bukwo District	220	2024-09-17 21:00:08	2024-09-17 21:00:08
4269	232	Bulambuli District	225	2024-09-17 21:00:08	2024-09-17 21:00:08
4270	232	Buliisa District	416	2024-09-17 21:00:08	2024-09-17 21:00:08
4271	232	Bundibugyo District	401	2024-09-17 21:00:08	2024-09-17 21:00:08
4272	232	Bunyangabu District	430	2024-09-17 21:00:08	2024-09-17 21:00:08
4273	232	Bushenyi District	402	2024-09-17 21:00:08	2024-09-17 21:00:08
4274	232	Busia District	202	2024-09-17 21:00:08	2024-09-17 21:00:08
4275	232	Butaleja District	221	2024-09-17 21:00:08	2024-09-17 21:00:08
4276	232	Butambala District	119	2024-09-17 21:00:08	2024-09-17 21:00:08
4277	232	Butebo District	233	2024-09-17 21:00:08	2024-09-17 21:00:08
4278	232	Buvuma District	120	2024-09-17 21:00:08	2024-09-17 21:00:08
4279	232	Buyende District	226	2024-09-17 21:00:08	2024-09-17 21:00:08
4280	232	Central Region	C	2024-09-17 21:00:08	2024-09-17 21:00:08
4281	232	Dokolo District	317	2024-09-17 21:00:08	2024-09-17 21:00:08
4282	232	Eastern Region	E	2024-09-17 21:00:08	2024-09-17 21:00:08
4283	232	Gomba District	121	2024-09-17 21:00:08	2024-09-17 21:00:08
4284	232	Gulu District	304	2024-09-17 21:00:08	2024-09-17 21:00:08
4285	232	Ibanda District	417	2024-09-17 21:00:08	2024-09-17 21:00:08
4286	232	Iganga District	203	2024-09-17 21:00:08	2024-09-17 21:00:08
4287	232	Isingiro District	418	2024-09-17 21:00:08	2024-09-17 21:00:08
4288	232	Jinja District	204	2024-09-17 21:00:08	2024-09-17 21:00:08
4289	232	Kaabong District	318	2024-09-17 21:00:08	2024-09-17 21:00:08
4290	232	Kabale District	404	2024-09-17 21:00:08	2024-09-17 21:00:08
4291	232	Kabarole District	405	2024-09-17 21:00:08	2024-09-17 21:00:08
4292	232	Kaberamaido District	213	2024-09-17 21:00:08	2024-09-17 21:00:08
4293	232	Kagadi District	427	2024-09-17 21:00:08	2024-09-17 21:00:08
4294	232	Kakumiro District	428	2024-09-17 21:00:08	2024-09-17 21:00:08
4295	232	Kalangala District	101	2024-09-17 21:00:08	2024-09-17 21:00:08
4296	232	Kaliro District	222	2024-09-17 21:00:08	2024-09-17 21:00:08
4297	232	Kalungu District	122	2024-09-17 21:00:08	2024-09-17 21:00:08
4298	232	Kampala District	102	2024-09-17 21:00:08	2024-09-17 21:00:08
4299	232	Kamuli District	205	2024-09-17 21:00:08	2024-09-17 21:00:08
4300	232	Kamwenge District	413	2024-09-17 21:00:08	2024-09-17 21:00:08
4301	232	Kanungu District	414	2024-09-17 21:00:08	2024-09-17 21:00:08
4302	232	Kapchorwa District	206	2024-09-17 21:00:08	2024-09-17 21:00:08
4303	232	Kasese District	406	2024-09-17 21:00:08	2024-09-17 21:00:08
4304	232	Katakwi District	207	2024-09-17 21:00:08	2024-09-17 21:00:08
4305	232	Kayunga District	112	2024-09-17 21:00:08	2024-09-17 21:00:08
4306	232	Kibaale District	407	2024-09-17 21:00:08	2024-09-17 21:00:08
4307	232	Kiboga District	103	2024-09-17 21:00:08	2024-09-17 21:00:08
4308	232	Kibuku District	227	2024-09-17 21:00:08	2024-09-17 21:00:08
4309	232	Kiruhura District	419	2024-09-17 21:00:08	2024-09-17 21:00:08
4310	232	Kiryandongo District	421	2024-09-17 21:00:08	2024-09-17 21:00:08
4311	232	Kisoro District	408	2024-09-17 21:00:08	2024-09-17 21:00:08
4312	232	Kitgum District	305	2024-09-17 21:00:08	2024-09-17 21:00:08
4313	232	Koboko District	319	2024-09-17 21:00:08	2024-09-17 21:00:08
4314	232	Kole District	325	2024-09-17 21:00:08	2024-09-17 21:00:08
4315	232	Kotido District	306	2024-09-17 21:00:08	2024-09-17 21:00:08
4316	232	Kumi District	208	2024-09-17 21:00:08	2024-09-17 21:00:08
4317	232	Kween District	228	2024-09-17 21:00:08	2024-09-17 21:00:08
4318	232	Kyankwanzi District	123	2024-09-17 21:00:08	2024-09-17 21:00:08
4319	232	Kyegegwa District	422	2024-09-17 21:00:08	2024-09-17 21:00:08
4320	232	Kyenjojo District	415	2024-09-17 21:00:08	2024-09-17 21:00:08
4321	232	Kyotera District	125	2024-09-17 21:00:08	2024-09-17 21:00:08
4322	232	Lamwo District	326	2024-09-17 21:00:08	2024-09-17 21:00:08
4323	232	Lira District	307	2024-09-17 21:00:08	2024-09-17 21:00:08
4324	232	Luuka District	229	2024-09-17 21:00:08	2024-09-17 21:00:08
4325	232	Luwero District	104	2024-09-17 21:00:08	2024-09-17 21:00:08
4326	232	Lwengo District	124	2024-09-17 21:00:08	2024-09-17 21:00:08
4327	232	Lyantonde District	114	2024-09-17 21:00:08	2024-09-17 21:00:08
4328	232	Manafwa District	223	2024-09-17 21:00:08	2024-09-17 21:00:08
4329	232	Maracha District	320	2024-09-17 21:00:08	2024-09-17 21:00:08
4330	232	Masaka District	105	2024-09-17 21:00:08	2024-09-17 21:00:08
4331	232	Masindi District	409	2024-09-17 21:00:08	2024-09-17 21:00:08
4332	232	Mayuge District	214	2024-09-17 21:00:08	2024-09-17 21:00:08
4333	232	Mbale District	209	2024-09-17 21:00:08	2024-09-17 21:00:08
4334	232	Mbarara District	410	2024-09-17 21:00:08	2024-09-17 21:00:08
4335	232	Mitooma District	423	2024-09-17 21:00:08	2024-09-17 21:00:08
4336	232	Mityana District	115	2024-09-17 21:00:08	2024-09-17 21:00:08
4337	232	Moroto District	308	2024-09-17 21:00:08	2024-09-17 21:00:08
4338	232	Moyo District	309	2024-09-17 21:00:08	2024-09-17 21:00:08
4339	232	Mpigi District	106	2024-09-17 21:00:08	2024-09-17 21:00:08
4340	232	Mubende District	107	2024-09-17 21:00:08	2024-09-17 21:00:08
4341	232	Mukono District	108	2024-09-17 21:00:08	2024-09-17 21:00:08
4342	232	Nakapiripirit District	311	2024-09-17 21:00:08	2024-09-17 21:00:08
4343	232	Nakaseke District	116	2024-09-17 21:00:08	2024-09-17 21:00:08
4344	232	Nakasongola District	109	2024-09-17 21:00:08	2024-09-17 21:00:08
4345	232	Namayingo District	230	2024-09-17 21:00:08	2024-09-17 21:00:08
4346	232	Namisindwa District	234	2024-09-17 21:00:08	2024-09-17 21:00:08
4347	232	Namutumba District	224	2024-09-17 21:00:08	2024-09-17 21:00:08
4348	232	Napak District	327	2024-09-17 21:00:08	2024-09-17 21:00:08
4349	232	Nebbi District	310	2024-09-17 21:00:08	2024-09-17 21:00:08
4350	232	Ngora District	231	2024-09-17 21:00:08	2024-09-17 21:00:08
4351	232	Northern Region	N	2024-09-17 21:00:08	2024-09-17 21:00:08
4352	232	Ntoroko District	424	2024-09-17 21:00:08	2024-09-17 21:00:08
4353	232	Ntungamo District	411	2024-09-17 21:00:08	2024-09-17 21:00:08
4354	232	Nwoya District	328	2024-09-17 21:00:08	2024-09-17 21:00:08
4355	232	Omoro District	331	2024-09-17 21:00:08	2024-09-17 21:00:08
4356	232	Otuke District	329	2024-09-17 21:00:08	2024-09-17 21:00:08
4357	232	Oyam District	321	2024-09-17 21:00:08	2024-09-17 21:00:08
4358	232	Pader District	312	2024-09-17 21:00:08	2024-09-17 21:00:08
4359	232	Pakwach District	332	2024-09-17 21:00:08	2024-09-17 21:00:08
4360	232	Pallisa District	210	2024-09-17 21:00:08	2024-09-17 21:00:08
4361	232	Rakai District	110	2024-09-17 21:00:08	2024-09-17 21:00:08
4362	232	Rubanda District	429	2024-09-17 21:00:08	2024-09-17 21:00:08
4363	232	Rubirizi District	425	2024-09-17 21:00:08	2024-09-17 21:00:08
4364	232	Rukiga District	431	2024-09-17 21:00:08	2024-09-17 21:00:08
4365	232	Rukungiri District	412	2024-09-17 21:00:08	2024-09-17 21:00:08
4366	232	Sembabule District	111	2024-09-17 21:00:08	2024-09-17 21:00:08
4367	232	Serere District	232	2024-09-17 21:00:08	2024-09-17 21:00:08
4368	232	Sheema District	426	2024-09-17 21:00:08	2024-09-17 21:00:08
4369	232	Sironko District	215	2024-09-17 21:00:08	2024-09-17 21:00:08
4370	232	Soroti District	211	2024-09-17 21:00:08	2024-09-17 21:00:08
4371	232	Tororo District	212	2024-09-17 21:00:08	2024-09-17 21:00:08
4372	232	Wakiso District	113	2024-09-17 21:00:08	2024-09-17 21:00:08
4373	232	Western Region	W	2024-09-17 21:00:08	2024-09-17 21:00:08
4374	232	Yumbe District	313	2024-09-17 21:00:08	2024-09-17 21:00:08
4375	232	Zombo District	330	2024-09-17 21:00:08	2024-09-17 21:00:08
4376	233	Autonomous Republic of Crimea	43	2024-09-17 21:00:08	2024-09-17 21:00:08
4377	233	Cherkasy Oblast	71	2024-09-17 21:00:08	2024-09-17 21:00:08
4378	233	Chernihiv Oblast	74	2024-09-17 21:00:08	2024-09-17 21:00:08
4379	233	Chernivtsi Oblast	77	2024-09-17 21:00:08	2024-09-17 21:00:08
4380	233	Dnipropetrovsk Oblast	12	2024-09-17 21:00:08	2024-09-17 21:00:08
4381	233	Donetsk Oblast	14	2024-09-17 21:00:08	2024-09-17 21:00:08
4382	233	Ivano-Frankivsk Oblast	26	2024-09-17 21:00:08	2024-09-17 21:00:08
4383	233	Kharkiv Oblast	63	2024-09-17 21:00:08	2024-09-17 21:00:08
4384	233	Kherson Oblast	65	2024-09-17 21:00:08	2024-09-17 21:00:08
4385	233	Khmelnytsky Oblast	68	2024-09-17 21:00:08	2024-09-17 21:00:08
4386	233	Kiev	30	2024-09-17 21:00:08	2024-09-17 21:00:08
4387	233	Kirovohrad Oblast	35	2024-09-17 21:00:08	2024-09-17 21:00:08
4388	233	Kyiv Oblast	32	2024-09-17 21:00:08	2024-09-17 21:00:08
4389	233	Luhansk Oblast	09	2024-09-17 21:00:08	2024-09-17 21:00:08
4390	233	Lviv Oblast	46	2024-09-17 21:00:08	2024-09-17 21:00:08
4391	233	Mykolaiv Oblast	48	2024-09-17 21:00:08	2024-09-17 21:00:08
4392	233	Odessa Oblast	51	2024-09-17 21:00:08	2024-09-17 21:00:08
4393	233	Rivne Oblast	56	2024-09-17 21:00:08	2024-09-17 21:00:08
4394	233	Sumy Oblast	59	2024-09-17 21:00:08	2024-09-17 21:00:08
4395	233	Ternopil Oblast	61	2024-09-17 21:00:08	2024-09-17 21:00:08
4396	233	Vinnytsia Oblast	05	2024-09-17 21:00:08	2024-09-17 21:00:08
4397	233	Volyn Oblast	07	2024-09-17 21:00:08	2024-09-17 21:00:08
4398	233	Zakarpattia Oblast	21	2024-09-17 21:00:08	2024-09-17 21:00:08
4399	233	Zaporizhzhya Oblast	23	2024-09-17 21:00:08	2024-09-17 21:00:08
4400	233	Zhytomyr Oblast	18	2024-09-17 21:00:08	2024-09-17 21:00:08
4401	234	Abu Dhabi Emirate	AZ	2024-09-17 21:00:08	2024-09-17 21:00:08
4402	234	Ajman Emirate	AJ	2024-09-17 21:00:08	2024-09-17 21:00:08
4403	234	Dubai	DU	2024-09-17 21:00:08	2024-09-17 21:00:08
4404	234	Fujairah	FU	2024-09-17 21:00:08	2024-09-17 21:00:08
4405	234	Ras al-Khaimah	RK	2024-09-17 21:00:08	2024-09-17 21:00:08
4406	234	Sharjah Emirate	SH	2024-09-17 21:00:08	2024-09-17 21:00:08
4407	234	Umm al-Quwain	UQ	2024-09-17 21:00:08	2024-09-17 21:00:08
4408	235	Aberdeen	ABE	2024-09-17 21:00:08	2024-09-17 21:00:08
4409	235	Aberdeenshire	ABD	2024-09-17 21:00:08	2024-09-17 21:00:08
4410	235	Angus	ANS	2024-09-17 21:00:08	2024-09-17 21:00:08
4411	235	Antrim	ANT	2024-09-17 21:00:08	2024-09-17 21:00:08
4412	235	Antrim and Newtownabbey	ANN	2024-09-17 21:00:08	2024-09-17 21:00:08
4413	235	Ards	ARD	2024-09-17 21:00:08	2024-09-17 21:00:08
4414	235	Ards and North Down	AND	2024-09-17 21:00:08	2024-09-17 21:00:08
4415	235	Argyll and Bute	AGB	2024-09-17 21:00:08	2024-09-17 21:00:08
4416	235	Armagh City and District Council	ARM	2024-09-17 21:00:08	2024-09-17 21:00:08
4417	235	Armagh, Banbridge and Craigavon	ABC	2024-09-17 21:00:08	2024-09-17 21:00:08
4418	235	Ascension Island	SH-AC	2024-09-17 21:00:08	2024-09-17 21:00:08
4419	235	Ballymena Borough	BLA	2024-09-17 21:00:08	2024-09-17 21:00:08
4420	235	Ballymoney	BLY	2024-09-17 21:00:08	2024-09-17 21:00:08
4421	235	Banbridge	BNB	2024-09-17 21:00:08	2024-09-17 21:00:08
4422	235	Barnsley	BNS	2024-09-17 21:00:08	2024-09-17 21:00:08
4423	235	Bath and North East Somerset	BAS	2024-09-17 21:00:08	2024-09-17 21:00:08
4424	235	Bedford	BDF	2024-09-17 21:00:08	2024-09-17 21:00:08
4425	235	Belfast district	BFS	2024-09-17 21:00:08	2024-09-17 21:00:08
4426	235	Birmingham	BIR	2024-09-17 21:00:08	2024-09-17 21:00:08
4427	235	Blackburn with Darwen	BBD	2024-09-17 21:00:08	2024-09-17 21:00:08
4428	235	Blackpool	BPL	2024-09-17 21:00:08	2024-09-17 21:00:08
4429	235	Blaenau Gwent County Borough	BGW	2024-09-17 21:00:08	2024-09-17 21:00:08
4430	235	Bolton	BOL	2024-09-17 21:00:08	2024-09-17 21:00:08
4431	235	Bournemouth	BMH	2024-09-17 21:00:08	2024-09-17 21:00:08
4432	235	Bracknell Forest	BRC	2024-09-17 21:00:08	2024-09-17 21:00:08
4433	235	Bradford	BRD	2024-09-17 21:00:08	2024-09-17 21:00:08
4434	235	Bridgend County Borough	BGE	2024-09-17 21:00:08	2024-09-17 21:00:08
4435	235	Brighton and Hove	BNH	2024-09-17 21:00:08	2024-09-17 21:00:08
4436	235	Buckinghamshire	BKM	2024-09-17 21:00:08	2024-09-17 21:00:08
4437	235	Bury	BUR	2024-09-17 21:00:08	2024-09-17 21:00:08
4438	235	Caerphilly County Borough	CAY	2024-09-17 21:00:08	2024-09-17 21:00:08
4439	235	Calderdale	CLD	2024-09-17 21:00:08	2024-09-17 21:00:08
4440	235	Cambridgeshire	CAM	2024-09-17 21:00:08	2024-09-17 21:00:08
4441	235	Carmarthenshire	CMN	2024-09-17 21:00:08	2024-09-17 21:00:08
4442	235	Carrickfergus Borough Council	CKF	2024-09-17 21:00:08	2024-09-17 21:00:08
4443	235	Castlereagh	CSR	2024-09-17 21:00:08	2024-09-17 21:00:08
4444	235	Causeway Coast and Glens	CCG	2024-09-17 21:00:08	2024-09-17 21:00:08
4445	235	Central Bedfordshire	CBF	2024-09-17 21:00:08	2024-09-17 21:00:08
4446	235	Ceredigion	CGN	2024-09-17 21:00:08	2024-09-17 21:00:08
4447	235	Cheshire East	CHE	2024-09-17 21:00:08	2024-09-17 21:00:08
4448	235	Cheshire West and Chester	CHW	2024-09-17 21:00:08	2024-09-17 21:00:08
4449	235	City and County of Cardiff	CRF	2024-09-17 21:00:08	2024-09-17 21:00:08
4450	235	City and County of Swansea	SWA	2024-09-17 21:00:08	2024-09-17 21:00:08
4451	235	City of Bristol	BST	2024-09-17 21:00:08	2024-09-17 21:00:08
4452	235	City of Derby	DER	2024-09-17 21:00:08	2024-09-17 21:00:08
4453	235	City of Kingston upon Hull	KHL	2024-09-17 21:00:08	2024-09-17 21:00:08
4454	235	City of Leicester	LCE	2024-09-17 21:00:08	2024-09-17 21:00:08
4455	235	City of London	LND	2024-09-17 21:00:08	2024-09-17 21:00:08
4456	235	City of Nottingham	NGM	2024-09-17 21:00:08	2024-09-17 21:00:08
4457	235	City of Peterborough	PTE	2024-09-17 21:00:08	2024-09-17 21:00:08
4458	235	City of Plymouth	PLY	2024-09-17 21:00:08	2024-09-17 21:00:08
4459	235	City of Portsmouth	POR	2024-09-17 21:00:08	2024-09-17 21:00:08
4460	235	City of Southampton	STH	2024-09-17 21:00:08	2024-09-17 21:00:08
4461	235	City of Stoke-on-Trent	STE	2024-09-17 21:00:08	2024-09-17 21:00:08
4462	235	City of Sunderland	SND	2024-09-17 21:00:08	2024-09-17 21:00:08
4463	235	City of Westminster	WSM	2024-09-17 21:00:08	2024-09-17 21:00:08
4464	235	City of Wolverhampton	WLV	2024-09-17 21:00:08	2024-09-17 21:00:08
4465	235	City of York	YOR	2024-09-17 21:00:08	2024-09-17 21:00:08
4466	235	Clackmannanshire	CLK	2024-09-17 21:00:08	2024-09-17 21:00:08
4467	235	Coleraine Borough Council	CLR	2024-09-17 21:00:08	2024-09-17 21:00:08
4468	235	Conwy County Borough	CWY	2024-09-17 21:00:08	2024-09-17 21:00:08
4469	235	Cookstown District Council	CKT	2024-09-17 21:00:08	2024-09-17 21:00:08
4470	235	Cornwall	CON	2024-09-17 21:00:08	2024-09-17 21:00:08
4471	235	County Durham	DUR	2024-09-17 21:00:08	2024-09-17 21:00:08
4472	235	Coventry	COV	2024-09-17 21:00:08	2024-09-17 21:00:08
4473	235	Craigavon Borough Council	CGV	2024-09-17 21:00:08	2024-09-17 21:00:08
4474	235	Cumbria	CMA	2024-09-17 21:00:08	2024-09-17 21:00:08
4475	235	Darlington	DAL	2024-09-17 21:00:08	2024-09-17 21:00:08
4476	235	Denbighshire	DEN	2024-09-17 21:00:08	2024-09-17 21:00:08
4477	235	Derbyshire	DBY	2024-09-17 21:00:08	2024-09-17 21:00:08
4478	235	Derry City and Strabane	DRS	2024-09-17 21:00:08	2024-09-17 21:00:08
4479	235	Derry City Council	DRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4480	235	Devon	DEV	2024-09-17 21:00:08	2024-09-17 21:00:08
4481	235	Doncaster	DNC	2024-09-17 21:00:08	2024-09-17 21:00:08
4482	235	Dorset	DOR	2024-09-17 21:00:08	2024-09-17 21:00:08
4483	235	Down District Council	DOW	2024-09-17 21:00:08	2024-09-17 21:00:08
4484	235	Dudley	DUD	2024-09-17 21:00:08	2024-09-17 21:00:08
4485	235	Dumfries and Galloway	DGY	2024-09-17 21:00:08	2024-09-17 21:00:08
4486	235	Dundee	DND	2024-09-17 21:00:08	2024-09-17 21:00:08
4487	235	Dungannon and South Tyrone Borough Council	DGN	2024-09-17 21:00:08	2024-09-17 21:00:08
4488	235	East Ayrshire	EAY	2024-09-17 21:00:08	2024-09-17 21:00:08
4489	235	East Dunbartonshire	EDU	2024-09-17 21:00:08	2024-09-17 21:00:08
4490	235	East Lothian	ELN	2024-09-17 21:00:08	2024-09-17 21:00:08
4491	235	East Renfrewshire	ERW	2024-09-17 21:00:08	2024-09-17 21:00:08
4492	235	East Riding of Yorkshire	ERY	2024-09-17 21:00:08	2024-09-17 21:00:08
4493	235	East Sussex	ESX	2024-09-17 21:00:08	2024-09-17 21:00:08
4494	235	Edinburgh	EDH	2024-09-17 21:00:08	2024-09-17 21:00:08
4495	235	England	ENG	2024-09-17 21:00:08	2024-09-17 21:00:08
4496	235	Essex	ESS	2024-09-17 21:00:08	2024-09-17 21:00:08
4497	235	Falkirk	FAL	2024-09-17 21:00:08	2024-09-17 21:00:08
4498	235	Fermanagh and Omagh	FMO	2024-09-17 21:00:08	2024-09-17 21:00:08
4499	235	Fermanagh District Council	FER	2024-09-17 21:00:08	2024-09-17 21:00:08
4500	235	Fife	FIF	2024-09-17 21:00:08	2024-09-17 21:00:08
4501	235	Flintshire	FLN	2024-09-17 21:00:08	2024-09-17 21:00:08
4502	235	Gateshead	GAT	2024-09-17 21:00:08	2024-09-17 21:00:08
4503	235	Glasgow	GLG	2024-09-17 21:00:08	2024-09-17 21:00:08
4504	235	Gloucestershire	GLS	2024-09-17 21:00:08	2024-09-17 21:00:08
4505	235	Gwynedd	GWN	2024-09-17 21:00:08	2024-09-17 21:00:08
4506	235	Halton	HAL	2024-09-17 21:00:08	2024-09-17 21:00:08
4507	235	Hampshire	HAM	2024-09-17 21:00:08	2024-09-17 21:00:08
4508	235	Hartlepool	HPL	2024-09-17 21:00:08	2024-09-17 21:00:08
4509	235	Herefordshire	HEF	2024-09-17 21:00:08	2024-09-17 21:00:08
4510	235	Hertfordshire	HRT	2024-09-17 21:00:08	2024-09-17 21:00:08
4511	235	Highland	HLD	2024-09-17 21:00:08	2024-09-17 21:00:08
4512	235	Inverclyde	IVC	2024-09-17 21:00:08	2024-09-17 21:00:08
4513	235	Isle of Wight	IOW	2024-09-17 21:00:08	2024-09-17 21:00:08
4514	235	Isles of Scilly	IOS	2024-09-17 21:00:08	2024-09-17 21:00:08
4515	235	Kent	KEN	2024-09-17 21:00:08	2024-09-17 21:00:08
4516	235	Kirklees	KIR	2024-09-17 21:00:08	2024-09-17 21:00:08
4517	235	Knowsley	KWL	2024-09-17 21:00:08	2024-09-17 21:00:08
4518	235	Lancashire	LAN	2024-09-17 21:00:08	2024-09-17 21:00:08
4519	235	Larne Borough Council	LRN	2024-09-17 21:00:08	2024-09-17 21:00:08
4520	235	Leeds	LDS	2024-09-17 21:00:08	2024-09-17 21:00:08
4521	235	Leicestershire	LEC	2024-09-17 21:00:08	2024-09-17 21:00:08
4522	235	Limavady Borough Council	LMV	2024-09-17 21:00:08	2024-09-17 21:00:08
4523	235	Lincolnshire	LIN	2024-09-17 21:00:08	2024-09-17 21:00:08
4524	235	Lisburn and Castlereagh	LBC	2024-09-17 21:00:08	2024-09-17 21:00:08
4525	235	Lisburn City Council	LSB	2024-09-17 21:00:08	2024-09-17 21:00:08
4526	235	Liverpool	LIV	2024-09-17 21:00:08	2024-09-17 21:00:08
4527	235	London Borough of Barking and Dagenham	BDG	2024-09-17 21:00:08	2024-09-17 21:00:08
4528	235	London Borough of Barnet	BNE	2024-09-17 21:00:08	2024-09-17 21:00:08
4529	235	London Borough of Bexley	BEX	2024-09-17 21:00:08	2024-09-17 21:00:08
4530	235	London Borough of Brent	BEN	2024-09-17 21:00:08	2024-09-17 21:00:08
4531	235	London Borough of Bromley	BRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4532	235	London Borough of Camden	CMD	2024-09-17 21:00:08	2024-09-17 21:00:08
4533	235	London Borough of Croydon	CRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4534	235	London Borough of Ealing	EAL	2024-09-17 21:00:08	2024-09-17 21:00:08
4535	235	London Borough of Enfield	ENF	2024-09-17 21:00:08	2024-09-17 21:00:08
4536	235	London Borough of Hackney	HCK	2024-09-17 21:00:08	2024-09-17 21:00:08
4537	235	London Borough of Hammersmith and Fulham	HMF	2024-09-17 21:00:08	2024-09-17 21:00:08
4538	235	London Borough of Haringey	HRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4539	235	London Borough of Harrow	HRW	2024-09-17 21:00:08	2024-09-17 21:00:08
4540	235	London Borough of Havering	HAV	2024-09-17 21:00:08	2024-09-17 21:00:08
4541	235	London Borough of Hillingdon	HIL	2024-09-17 21:00:08	2024-09-17 21:00:08
4542	235	London Borough of Hounslow	HNS	2024-09-17 21:00:08	2024-09-17 21:00:08
4543	235	London Borough of Islington	ISL	2024-09-17 21:00:08	2024-09-17 21:00:08
4544	235	London Borough of Lambeth	LBH	2024-09-17 21:00:08	2024-09-17 21:00:08
4545	235	London Borough of Lewisham	LEW	2024-09-17 21:00:08	2024-09-17 21:00:08
4546	235	London Borough of Merton	MRT	2024-09-17 21:00:08	2024-09-17 21:00:08
4547	235	London Borough of Newham	NWM	2024-09-17 21:00:08	2024-09-17 21:00:08
4548	235	London Borough of Redbridge	RDB	2024-09-17 21:00:08	2024-09-17 21:00:08
4549	235	London Borough of Richmond upon Thames	RIC	2024-09-17 21:00:08	2024-09-17 21:00:08
4550	235	London Borough of Southwark	SWK	2024-09-17 21:00:08	2024-09-17 21:00:08
4551	235	London Borough of Sutton	STN	2024-09-17 21:00:08	2024-09-17 21:00:08
4552	235	London Borough of Tower Hamlets	TWH	2024-09-17 21:00:08	2024-09-17 21:00:08
4553	235	London Borough of Waltham Forest	WFT	2024-09-17 21:00:08	2024-09-17 21:00:08
4554	235	London Borough of Wandsworth	WND	2024-09-17 21:00:08	2024-09-17 21:00:08
4555	235	Magherafelt District Council	MFT	2024-09-17 21:00:08	2024-09-17 21:00:08
4556	235	Manchester	MAN	2024-09-17 21:00:08	2024-09-17 21:00:08
4557	235	Medway	MDW	2024-09-17 21:00:08	2024-09-17 21:00:08
4558	235	Merthyr Tydfil County Borough	MTY	2024-09-17 21:00:08	2024-09-17 21:00:08
4559	235	Metropolitan Borough of Wigan	WGN	2024-09-17 21:00:08	2024-09-17 21:00:08
4560	235	Mid and East Antrim	MEA	2024-09-17 21:00:08	2024-09-17 21:00:08
4561	235	Mid Ulster	MUL	2024-09-17 21:00:08	2024-09-17 21:00:08
4562	235	Middlesbrough	MDB	2024-09-17 21:00:08	2024-09-17 21:00:08
4563	235	Midlothian	MLN	2024-09-17 21:00:08	2024-09-17 21:00:08
4564	235	Milton Keynes	MIK	2024-09-17 21:00:08	2024-09-17 21:00:08
4565	235	Monmouthshire	MON	2024-09-17 21:00:08	2024-09-17 21:00:08
4566	235	Moray	MRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4567	235	Moyle District Council	MYL	2024-09-17 21:00:08	2024-09-17 21:00:08
4568	235	Neath Port Talbot County Borough	NTL	2024-09-17 21:00:08	2024-09-17 21:00:08
4569	235	Newcastle upon Tyne	NET	2024-09-17 21:00:08	2024-09-17 21:00:08
4570	235	Newport	NWP	2024-09-17 21:00:08	2024-09-17 21:00:08
4571	235	Newry and Mourne District Council	NYM	2024-09-17 21:00:08	2024-09-17 21:00:08
4572	235	Newry, Mourne and Down	NMD	2024-09-17 21:00:08	2024-09-17 21:00:08
4573	235	Newtownabbey Borough Council	NTA	2024-09-17 21:00:08	2024-09-17 21:00:08
4574	235	Norfolk	NFK	2024-09-17 21:00:08	2024-09-17 21:00:08
4575	235	North Ayrshire	NAY	2024-09-17 21:00:08	2024-09-17 21:00:08
4576	235	North Down Borough Council	NDN	2024-09-17 21:00:08	2024-09-17 21:00:08
4577	235	North East Lincolnshire	NEL	2024-09-17 21:00:08	2024-09-17 21:00:08
4578	235	North Lanarkshire	NLK	2024-09-17 21:00:08	2024-09-17 21:00:08
4579	235	North Lincolnshire	NLN	2024-09-17 21:00:08	2024-09-17 21:00:08
4580	235	North Somerset	NSM	2024-09-17 21:00:08	2024-09-17 21:00:08
4581	235	North Tyneside	NTY	2024-09-17 21:00:08	2024-09-17 21:00:08
4582	235	North Yorkshire	NYK	2024-09-17 21:00:08	2024-09-17 21:00:08
4583	235	Northamptonshire	NTH	2024-09-17 21:00:08	2024-09-17 21:00:08
4584	235	Northern Ireland	NIR	2024-09-17 21:00:08	2024-09-17 21:00:08
4585	235	Northumberland	NBL	2024-09-17 21:00:08	2024-09-17 21:00:08
4586	235	Nottinghamshire	NTT	2024-09-17 21:00:08	2024-09-17 21:00:08
4587	235	Oldham	OLD	2024-09-17 21:00:08	2024-09-17 21:00:08
4588	235	Omagh District Council	OMH	2024-09-17 21:00:08	2024-09-17 21:00:08
4589	235	Orkney Islands	ORK	2024-09-17 21:00:08	2024-09-17 21:00:08
4590	235	Outer Hebrides	ELS	2024-09-17 21:00:08	2024-09-17 21:00:08
4591	235	Oxfordshire	OXF	2024-09-17 21:00:08	2024-09-17 21:00:08
4592	235	Pembrokeshire	PEM	2024-09-17 21:00:08	2024-09-17 21:00:08
4593	235	Perth and Kinross	PKN	2024-09-17 21:00:08	2024-09-17 21:00:08
4594	235	Poole	POL	2024-09-17 21:00:08	2024-09-17 21:00:08
4595	235	Powys	POW	2024-09-17 21:00:08	2024-09-17 21:00:08
4596	235	Reading	RDG	2024-09-17 21:00:08	2024-09-17 21:00:08
4597	235	Redcar and Cleveland	RCC	2024-09-17 21:00:08	2024-09-17 21:00:08
4598	235	Renfrewshire	RFW	2024-09-17 21:00:08	2024-09-17 21:00:08
4599	235	Rhondda Cynon Taf	RCT	2024-09-17 21:00:08	2024-09-17 21:00:08
4600	235	Rochdale	RCH	2024-09-17 21:00:08	2024-09-17 21:00:08
4601	235	Rotherham	ROT	2024-09-17 21:00:08	2024-09-17 21:00:08
4602	235	Royal Borough of Greenwich	GRE	2024-09-17 21:00:08	2024-09-17 21:00:08
4603	235	Royal Borough of Kensington and Chelsea	KEC	2024-09-17 21:00:08	2024-09-17 21:00:08
4604	235	Royal Borough of Kingston upon Thames	KTT	2024-09-17 21:00:08	2024-09-17 21:00:08
4605	235	Rutland	RUT	2024-09-17 21:00:08	2024-09-17 21:00:08
4606	235	Saint Helena	SH-HL	2024-09-17 21:00:08	2024-09-17 21:00:08
4607	235	Salford	SLF	2024-09-17 21:00:08	2024-09-17 21:00:08
4608	235	Sandwell	SAW	2024-09-17 21:00:08	2024-09-17 21:00:08
4609	235	Scotland	SCT	2024-09-17 21:00:08	2024-09-17 21:00:08
4610	235	Scottish Borders	SCB	2024-09-17 21:00:08	2024-09-17 21:00:08
4611	235	Sefton	SFT	2024-09-17 21:00:08	2024-09-17 21:00:08
4612	235	Sheffield	SHF	2024-09-17 21:00:08	2024-09-17 21:00:08
4613	235	Shetland Islands	ZET	2024-09-17 21:00:08	2024-09-17 21:00:08
4614	235	Shropshire	SHR	2024-09-17 21:00:08	2024-09-17 21:00:08
4615	235	Slough	SLG	2024-09-17 21:00:08	2024-09-17 21:00:08
4616	235	Solihull	SOL	2024-09-17 21:00:08	2024-09-17 21:00:08
4617	235	Somerset	SOM	2024-09-17 21:00:08	2024-09-17 21:00:08
4618	235	South Ayrshire	SAY	2024-09-17 21:00:08	2024-09-17 21:00:08
4619	235	South Gloucestershire	SGC	2024-09-17 21:00:08	2024-09-17 21:00:08
4620	235	South Lanarkshire	SLK	2024-09-17 21:00:08	2024-09-17 21:00:08
4621	235	South Tyneside	STY	2024-09-17 21:00:08	2024-09-17 21:00:08
4622	235	Southend-on-Sea	SOS	2024-09-17 21:00:08	2024-09-17 21:00:08
4623	235	St Helens	SHN	2024-09-17 21:00:08	2024-09-17 21:00:08
4624	235	Staffordshire	STS	2024-09-17 21:00:08	2024-09-17 21:00:08
4625	235	Stirling	STG	2024-09-17 21:00:08	2024-09-17 21:00:08
4626	235	Stockport	SKP	2024-09-17 21:00:08	2024-09-17 21:00:08
4627	235	Stockton-on-Tees	STT	2024-09-17 21:00:08	2024-09-17 21:00:08
4628	235	Strabane District Council	STB	2024-09-17 21:00:08	2024-09-17 21:00:08
4629	235	Suffolk	SFK	2024-09-17 21:00:08	2024-09-17 21:00:08
4630	235	Surrey	SRY	2024-09-17 21:00:08	2024-09-17 21:00:08
4631	235	Swindon	SWD	2024-09-17 21:00:08	2024-09-17 21:00:08
4632	235	Tameside	TAM	2024-09-17 21:00:08	2024-09-17 21:00:08
4633	235	Telford and Wrekin	TFW	2024-09-17 21:00:08	2024-09-17 21:00:08
4634	235	Thurrock	THR	2024-09-17 21:00:08	2024-09-17 21:00:08
4635	235	Torbay	TOB	2024-09-17 21:00:08	2024-09-17 21:00:08
4636	235	Torfaen	TOF	2024-09-17 21:00:08	2024-09-17 21:00:08
4637	235	Trafford	TRF	2024-09-17 21:00:08	2024-09-17 21:00:08
4638	235	United Kingdom	UKM	2024-09-17 21:00:08	2024-09-17 21:00:08
4639	235	Vale of Glamorgan	VGL	2024-09-17 21:00:08	2024-09-17 21:00:08
4640	235	Wakefield	WKF	2024-09-17 21:00:08	2024-09-17 21:00:08
4641	235	Wales	WLS	2024-09-17 21:00:08	2024-09-17 21:00:08
4642	235	Walsall	WLL	2024-09-17 21:00:08	2024-09-17 21:00:08
4643	235	Warrington	WRT	2024-09-17 21:00:08	2024-09-17 21:00:08
4644	235	Warwickshire	WAR	2024-09-17 21:00:08	2024-09-17 21:00:08
4645	235	West Berkshire	WBK	2024-09-17 21:00:08	2024-09-17 21:00:08
4646	235	West Dunbartonshire	WDU	2024-09-17 21:00:08	2024-09-17 21:00:08
4647	235	West Lothian	WLN	2024-09-17 21:00:08	2024-09-17 21:00:08
4648	235	West Sussex	WSX	2024-09-17 21:00:08	2024-09-17 21:00:08
4649	235	Wiltshire	WIL	2024-09-17 21:00:08	2024-09-17 21:00:08
4650	235	Windsor and Maidenhead	WNM	2024-09-17 21:00:08	2024-09-17 21:00:08
4651	235	Wirral	WRL	2024-09-17 21:00:08	2024-09-17 21:00:08
4652	235	Wokingham	WOK	2024-09-17 21:00:08	2024-09-17 21:00:08
4653	235	Worcestershire	WOR	2024-09-17 21:00:08	2024-09-17 21:00:08
4654	235	Wrexham County Borough	WRX	2024-09-17 21:00:08	2024-09-17 21:00:08
4655	236	Alabama	AL	2024-09-17 21:00:08	2024-09-17 21:00:08
4656	236	Alaska	AK	2024-09-17 21:00:08	2024-09-17 21:00:08
4657	236	American Samoa	AS	2024-09-17 21:00:08	2024-09-17 21:00:08
4658	236	Arizona	AZ	2024-09-17 21:00:08	2024-09-17 21:00:08
4659	236	Arkansas	AR	2024-09-17 21:00:08	2024-09-17 21:00:08
4660	236	Baker Island	UM-81	2024-09-17 21:00:08	2024-09-17 21:00:08
4661	236	California	CA	2024-09-17 21:00:08	2024-09-17 21:00:08
4662	236	Colorado	CO	2024-09-17 21:00:08	2024-09-17 21:00:08
4663	236	Connecticut	CT	2024-09-17 21:00:08	2024-09-17 21:00:08
4664	236	Delaware	DE	2024-09-17 21:00:08	2024-09-17 21:00:08
4665	236	District of Columbia	DC	2024-09-17 21:00:08	2024-09-17 21:00:08
4666	236	Florida	FL	2024-09-17 21:00:08	2024-09-17 21:00:08
4667	236	Georgia	GA	2024-09-17 21:00:08	2024-09-17 21:00:08
4668	236	Guam	GU	2024-09-17 21:00:08	2024-09-17 21:00:08
4669	236	Hawaii	HI	2024-09-17 21:00:08	2024-09-17 21:00:08
4670	236	Howland Island	UM-84	2024-09-17 21:00:08	2024-09-17 21:00:08
4671	236	Idaho	ID	2024-09-17 21:00:08	2024-09-17 21:00:08
4672	236	Illinois	IL	2024-09-17 21:00:08	2024-09-17 21:00:08
4673	236	Indiana	IN	2024-09-17 21:00:08	2024-09-17 21:00:08
4674	236	Iowa	IA	2024-09-17 21:00:08	2024-09-17 21:00:08
4675	236	Jarvis Island	UM-86	2024-09-17 21:00:08	2024-09-17 21:00:08
4676	236	Johnston Atoll	UM-67	2024-09-17 21:00:08	2024-09-17 21:00:08
4677	236	Kansas	KS	2024-09-17 21:00:08	2024-09-17 21:00:08
4678	236	Kentucky	KY	2024-09-17 21:00:08	2024-09-17 21:00:08
4679	236	Kingman Reef	UM-89	2024-09-17 21:00:08	2024-09-17 21:00:08
4680	236	Louisiana	LA	2024-09-17 21:00:08	2024-09-17 21:00:08
4681	236	Maine	ME	2024-09-17 21:00:08	2024-09-17 21:00:08
4682	236	Maryland	MD	2024-09-17 21:00:08	2024-09-17 21:00:08
4683	236	Massachusetts	MA	2024-09-17 21:00:08	2024-09-17 21:00:08
4684	236	Michigan	MI	2024-09-17 21:00:08	2024-09-17 21:00:08
4685	236	Midway Atoll	UM-71	2024-09-17 21:00:08	2024-09-17 21:00:08
4686	236	Minnesota	MN	2024-09-17 21:00:08	2024-09-17 21:00:08
4687	236	Mississippi	MS	2024-09-17 21:00:08	2024-09-17 21:00:08
4688	236	Missouri	MO	2024-09-17 21:00:08	2024-09-17 21:00:08
4689	236	Montana	MT	2024-09-17 21:00:08	2024-09-17 21:00:08
4690	236	Navassa Island	UM-76	2024-09-17 21:00:08	2024-09-17 21:00:08
4691	236	Nebraska	NE	2024-09-17 21:00:08	2024-09-17 21:00:08
4692	236	Nevada	NV	2024-09-17 21:00:08	2024-09-17 21:00:08
4693	236	New Hampshire	NH	2024-09-17 21:00:08	2024-09-17 21:00:08
4694	236	New Jersey	NJ	2024-09-17 21:00:08	2024-09-17 21:00:08
4695	236	New Mexico	NM	2024-09-17 21:00:08	2024-09-17 21:00:08
4696	236	New York	NY	2024-09-17 21:00:08	2024-09-17 21:00:08
4697	236	North Carolina	NC	2024-09-17 21:00:08	2024-09-17 21:00:08
4698	236	North Dakota	ND	2024-09-17 21:00:08	2024-09-17 21:00:08
4699	236	Northern Mariana Islands	MP	2024-09-17 21:00:08	2024-09-17 21:00:08
4700	236	Ohio	OH	2024-09-17 21:00:08	2024-09-17 21:00:08
4701	236	Oklahoma	OK	2024-09-17 21:00:08	2024-09-17 21:00:08
4702	236	Oregon	OR	2024-09-17 21:00:08	2024-09-17 21:00:08
4703	236	Palmyra Atoll	UM-95	2024-09-17 21:00:08	2024-09-17 21:00:08
4704	236	Pennsylvania	PA	2024-09-17 21:00:08	2024-09-17 21:00:08
4705	236	Puerto Rico	PR	2024-09-17 21:00:08	2024-09-17 21:00:08
4706	236	Rhode Island	RI	2024-09-17 21:00:08	2024-09-17 21:00:08
4707	236	South Carolina	SC	2024-09-17 21:00:08	2024-09-17 21:00:08
4708	236	South Dakota	SD	2024-09-17 21:00:08	2024-09-17 21:00:08
4709	236	Tennessee	TN	2024-09-17 21:00:08	2024-09-17 21:00:08
4710	236	Texas	TX	2024-09-17 21:00:08	2024-09-17 21:00:08
4711	236	United States Minor Outlying Islands	UM	2024-09-17 21:00:08	2024-09-17 21:00:08
4712	236	United States Virgin Islands	VI	2024-09-17 21:00:08	2024-09-17 21:00:08
4713	236	Utah	UT	2024-09-17 21:00:08	2024-09-17 21:00:08
4714	236	Vermont	VT	2024-09-17 21:00:08	2024-09-17 21:00:08
4715	236	Virginia	VA	2024-09-17 21:00:08	2024-09-17 21:00:08
4716	236	Wake Island	UM-79	2024-09-17 21:00:08	2024-09-17 21:00:08
4717	236	Washington	WA	2024-09-17 21:00:08	2024-09-17 21:00:08
4718	236	West Virginia	WV	2024-09-17 21:00:08	2024-09-17 21:00:08
4719	236	Wisconsin	WI	2024-09-17 21:00:08	2024-09-17 21:00:08
4720	236	Wyoming	WY	2024-09-17 21:00:08	2024-09-17 21:00:08
4721	238	Artigas Department	AR	2024-09-17 21:00:08	2024-09-17 21:00:08
4722	238	Canelones Department	CA	2024-09-17 21:00:08	2024-09-17 21:00:08
4723	238	Cerro Largo Department	CL	2024-09-17 21:00:08	2024-09-17 21:00:08
4724	238	Colonia Department	CO	2024-09-17 21:00:08	2024-09-17 21:00:08
4725	238	Durazno Department	DU	2024-09-17 21:00:08	2024-09-17 21:00:08
4726	238	Flores Department	FS	2024-09-17 21:00:08	2024-09-17 21:00:08
4727	238	Florida Department	FD	2024-09-17 21:00:08	2024-09-17 21:00:08
4728	238	Lavalleja Department	LA	2024-09-17 21:00:08	2024-09-17 21:00:08
4729	238	Maldonado Department	MA	2024-09-17 21:00:08	2024-09-17 21:00:08
4730	238	Montevideo Department	MO	2024-09-17 21:00:08	2024-09-17 21:00:08
4731	238	Paysandú Department	PA	2024-09-17 21:00:08	2024-09-17 21:00:08
4732	238	Río Negro Department	RN	2024-09-17 21:00:08	2024-09-17 21:00:08
4733	238	Rivera Department	RV	2024-09-17 21:00:08	2024-09-17 21:00:08
4734	238	Rocha Department	RO	2024-09-17 21:00:08	2024-09-17 21:00:08
4735	238	Salto Department	SA	2024-09-17 21:00:08	2024-09-17 21:00:08
4736	238	San José Department	SJ	2024-09-17 21:00:08	2024-09-17 21:00:08
4737	238	Soriano Department	SO	2024-09-17 21:00:08	2024-09-17 21:00:08
4738	238	Tacuarembó Department	TA	2024-09-17 21:00:08	2024-09-17 21:00:08
4739	238	Treinta y Tres Department	TT	2024-09-17 21:00:08	2024-09-17 21:00:08
4740	239	Andijan Region	AN	2024-09-17 21:00:08	2024-09-17 21:00:08
4741	239	Bukhara Region	BU	2024-09-17 21:00:08	2024-09-17 21:00:08
4742	239	Fergana Region	FA	2024-09-17 21:00:08	2024-09-17 21:00:08
4743	239	Jizzakh Region	JI	2024-09-17 21:00:08	2024-09-17 21:00:08
4744	239	Karakalpakstan	QR	2024-09-17 21:00:08	2024-09-17 21:00:08
4745	239	Namangan Region	NG	2024-09-17 21:00:08	2024-09-17 21:00:08
4746	239	Navoiy Region	NW	2024-09-17 21:00:08	2024-09-17 21:00:08
4747	239	Qashqadaryo Region	QA	2024-09-17 21:00:08	2024-09-17 21:00:08
4748	239	Samarqand Region	SA	2024-09-17 21:00:08	2024-09-17 21:00:08
4749	239	Sirdaryo Region	SI	2024-09-17 21:00:08	2024-09-17 21:00:08
4750	239	Surxondaryo Region	SU	2024-09-17 21:00:08	2024-09-17 21:00:08
4751	239	Tashkent	TK	2024-09-17 21:00:08	2024-09-17 21:00:08
4752	239	Tashkent Region	TO	2024-09-17 21:00:08	2024-09-17 21:00:08
4753	239	Xorazm Region	XO	2024-09-17 21:00:08	2024-09-17 21:00:08
4754	240	Malampa	MAP	2024-09-17 21:00:08	2024-09-17 21:00:08
4755	240	Penama	PAM	2024-09-17 21:00:08	2024-09-17 21:00:08
4756	240	Sanma	SAM	2024-09-17 21:00:08	2024-09-17 21:00:08
4757	240	Shefa	SEE	2024-09-17 21:00:08	2024-09-17 21:00:08
4758	240	Tafea	TAE	2024-09-17 21:00:08	2024-09-17 21:00:08
4759	240	Torba	TOB	2024-09-17 21:00:08	2024-09-17 21:00:08
4760	242	Amazonas	Z	2024-09-17 21:00:08	2024-09-17 21:00:08
4761	242	Anzoátegui	B	2024-09-17 21:00:08	2024-09-17 21:00:08
4762	242	Apure	C	2024-09-17 21:00:08	2024-09-17 21:00:08
4763	242	Aragua	D	2024-09-17 21:00:08	2024-09-17 21:00:08
4764	242	Barinas	E	2024-09-17 21:00:08	2024-09-17 21:00:08
4765	242	Bolívar	F	2024-09-17 21:00:08	2024-09-17 21:00:08
4766	242	Capital District	A	2024-09-17 21:00:08	2024-09-17 21:00:08
4767	242	Carabobo	G	2024-09-17 21:00:08	2024-09-17 21:00:08
4768	242	Cojedes	H	2024-09-17 21:00:08	2024-09-17 21:00:08
4769	242	Delta Amacuro	Y	2024-09-17 21:00:08	2024-09-17 21:00:08
4770	242	Falcón	I	2024-09-17 21:00:08	2024-09-17 21:00:08
4771	242	Federal Dependencies of Venezuela	W	2024-09-17 21:00:08	2024-09-17 21:00:08
4772	242	Guárico	J	2024-09-17 21:00:08	2024-09-17 21:00:08
4773	242	Lara	K	2024-09-17 21:00:08	2024-09-17 21:00:08
4774	242	Mérida	L	2024-09-17 21:00:08	2024-09-17 21:00:08
4775	242	Miranda	M	2024-09-17 21:00:08	2024-09-17 21:00:08
4776	242	Monagas	N	2024-09-17 21:00:08	2024-09-17 21:00:08
4777	242	Nueva Esparta	O	2024-09-17 21:00:08	2024-09-17 21:00:08
4778	242	Portuguesa	P	2024-09-17 21:00:08	2024-09-17 21:00:08
4779	242	Sucre	R	2024-09-17 21:00:08	2024-09-17 21:00:08
4780	242	Táchira	S	2024-09-17 21:00:08	2024-09-17 21:00:08
4781	242	Trujillo	T	2024-09-17 21:00:08	2024-09-17 21:00:08
4782	242	Vargas	X	2024-09-17 21:00:08	2024-09-17 21:00:08
4783	242	Yaracuy	U	2024-09-17 21:00:08	2024-09-17 21:00:08
4784	242	Zulia	V	2024-09-17 21:00:08	2024-09-17 21:00:08
4785	243	An Giang	44	2024-09-17 21:00:08	2024-09-17 21:00:08
4786	243	Bà Rịa-Vũng Tàu	43	2024-09-17 21:00:08	2024-09-17 21:00:08
4787	243	Bắc Giang	54	2024-09-17 21:00:08	2024-09-17 21:00:08
4788	243	Bắc Kạn	53	2024-09-17 21:00:08	2024-09-17 21:00:08
4789	243	Bạc Liêu	55	2024-09-17 21:00:08	2024-09-17 21:00:08
4790	243	Bắc Ninh	56	2024-09-17 21:00:08	2024-09-17 21:00:08
4791	243	Bến Tre	50	2024-09-17 21:00:08	2024-09-17 21:00:08
4792	243	Bình Dương	57	2024-09-17 21:00:08	2024-09-17 21:00:08
4793	243	Bình Định	31	2024-09-17 21:00:08	2024-09-17 21:00:08
4794	243	Bình Phước	58	2024-09-17 21:00:08	2024-09-17 21:00:08
4795	243	Bình Thuận	40	2024-09-17 21:00:08	2024-09-17 21:00:08
4796	243	Cà Mau	59	2024-09-17 21:00:08	2024-09-17 21:00:08
4797	243	Cần Thơ	CT	2024-09-17 21:00:08	2024-09-17 21:00:08
4798	243	Cao Bằng	04	2024-09-17 21:00:08	2024-09-17 21:00:08
4799	243	Đà Nẵng	DN	2024-09-17 21:00:08	2024-09-17 21:00:08
4800	243	Đắk Lắk	33	2024-09-17 21:00:08	2024-09-17 21:00:08
4801	243	Đắk Nông	72	2024-09-17 21:00:08	2024-09-17 21:00:08
4802	243	Điện Biên	71	2024-09-17 21:00:08	2024-09-17 21:00:08
4803	243	Đồng Nai	39	2024-09-17 21:00:08	2024-09-17 21:00:08
4804	243	Đồng Tháp	45	2024-09-17 21:00:08	2024-09-17 21:00:08
4805	243	Gia Lai	30	2024-09-17 21:00:08	2024-09-17 21:00:08
4806	243	Hà Giang	03	2024-09-17 21:00:08	2024-09-17 21:00:08
4807	243	Hà Nam	63	2024-09-17 21:00:08	2024-09-17 21:00:08
4808	243	Hà Nội	HN	2024-09-17 21:00:08	2024-09-17 21:00:08
4809	243	Hà Tĩnh	23	2024-09-17 21:00:08	2024-09-17 21:00:08
4810	243	Hải Dương	61	2024-09-17 21:00:08	2024-09-17 21:00:08
4811	243	Hải Phòng	HP	2024-09-17 21:00:08	2024-09-17 21:00:08
4812	243	Hậu Giang	73	2024-09-17 21:00:08	2024-09-17 21:00:08
4813	243	Hồ Chí Minh	SG	2024-09-17 21:00:08	2024-09-17 21:00:08
4814	243	Hòa Bình	14	2024-09-17 21:00:08	2024-09-17 21:00:08
4815	243	Hưng Yên	66	2024-09-17 21:00:08	2024-09-17 21:00:08
4816	243	Khánh Hòa	34	2024-09-17 21:00:08	2024-09-17 21:00:08
4817	243	Kiên Giang	47	2024-09-17 21:00:08	2024-09-17 21:00:08
4818	243	Kon Tum	28	2024-09-17 21:00:08	2024-09-17 21:00:08
4819	243	Lai Châu	01	2024-09-17 21:00:08	2024-09-17 21:00:08
4820	243	Lâm Đồng	35	2024-09-17 21:00:08	2024-09-17 21:00:08
4821	243	Lạng Sơn	09	2024-09-17 21:00:08	2024-09-17 21:00:08
4822	243	Lào Cai	02	2024-09-17 21:00:08	2024-09-17 21:00:08
4823	243	Long An	41	2024-09-17 21:00:08	2024-09-17 21:00:08
4824	243	Nam Định	67	2024-09-17 21:00:08	2024-09-17 21:00:08
4825	243	Nghệ An	22	2024-09-17 21:00:08	2024-09-17 21:00:08
4826	243	Ninh Bình	18	2024-09-17 21:00:08	2024-09-17 21:00:08
4827	243	Ninh Thuận	36	2024-09-17 21:00:08	2024-09-17 21:00:08
4828	243	Phú Thọ	68	2024-09-17 21:00:08	2024-09-17 21:00:08
4829	243	Phú Yên	32	2024-09-17 21:00:08	2024-09-17 21:00:08
4830	243	Quảng Bình	24	2024-09-17 21:00:08	2024-09-17 21:00:08
4831	243	Quảng Nam	27	2024-09-17 21:00:08	2024-09-17 21:00:08
4832	243	Quảng Ngãi	29	2024-09-17 21:00:08	2024-09-17 21:00:08
4833	243	Quảng Ninh	13	2024-09-17 21:00:08	2024-09-17 21:00:08
4834	243	Quảng Trị	25	2024-09-17 21:00:08	2024-09-17 21:00:08
4835	243	Sóc Trăng	52	2024-09-17 21:00:08	2024-09-17 21:00:08
4836	243	Sơn La	05	2024-09-17 21:00:08	2024-09-17 21:00:08
4837	243	Tây Ninh	37	2024-09-17 21:00:08	2024-09-17 21:00:08
4838	243	Thái Bình	20	2024-09-17 21:00:08	2024-09-17 21:00:08
4839	243	Thái Nguyên	69	2024-09-17 21:00:08	2024-09-17 21:00:08
4840	243	Thanh Hóa	21	2024-09-17 21:00:08	2024-09-17 21:00:08
4841	243	Thừa Thiên-Huế	26	2024-09-17 21:00:08	2024-09-17 21:00:08
4842	243	Tiền Giang	46	2024-09-17 21:00:08	2024-09-17 21:00:08
4843	243	Trà Vinh	51	2024-09-17 21:00:08	2024-09-17 21:00:08
4844	243	Tuyên Quang	07	2024-09-17 21:00:08	2024-09-17 21:00:08
4845	243	Vĩnh Long	49	2024-09-17 21:00:08	2024-09-17 21:00:08
4846	243	Vĩnh Phúc	70	2024-09-17 21:00:08	2024-09-17 21:00:08
4847	243	Yên Bái	06	2024-09-17 21:00:08	2024-09-17 21:00:08
4848	248	'Adan Governorate	AD	2024-09-17 21:00:08	2024-09-17 21:00:08
4849	248	'Amran Governorate	AM	2024-09-17 21:00:08	2024-09-17 21:00:08
4850	248	Abyan Governorate	AB	2024-09-17 21:00:08	2024-09-17 21:00:08
4851	248	Al Bayda' Governorate	BA	2024-09-17 21:00:08	2024-09-17 21:00:08
4852	248	Al Hudaydah Governorate	HU	2024-09-17 21:00:08	2024-09-17 21:00:08
4853	248	Al Jawf Governorate	JA	2024-09-17 21:00:08	2024-09-17 21:00:08
4854	248	Al Mahrah Governorate	MR	2024-09-17 21:00:08	2024-09-17 21:00:08
4855	248	Al Mahwit Governorate	MW	2024-09-17 21:00:08	2024-09-17 21:00:08
4856	248	Dhamar Governorate	DH	2024-09-17 21:00:08	2024-09-17 21:00:08
4857	248	Hadhramaut Governorate	HD	2024-09-17 21:00:08	2024-09-17 21:00:08
4858	248	Hajjah Governorate	HJ	2024-09-17 21:00:08	2024-09-17 21:00:08
4859	248	Ibb Governorate	IB	2024-09-17 21:00:08	2024-09-17 21:00:08
4860	248	Lahij Governorate	LA	2024-09-17 21:00:08	2024-09-17 21:00:08
4861	248	Ma'rib Governorate	MA	2024-09-17 21:00:08	2024-09-17 21:00:08
4862	248	Raymah Governorate	RA	2024-09-17 21:00:08	2024-09-17 21:00:08
4863	248	Saada Governorate	SD	2024-09-17 21:00:08	2024-09-17 21:00:08
4864	248	Sana'a	SA	2024-09-17 21:00:08	2024-09-17 21:00:08
4865	248	Sana'a Governorate	SN	2024-09-17 21:00:08	2024-09-17 21:00:08
4866	248	Shabwah Governorate	SH	2024-09-17 21:00:08	2024-09-17 21:00:08
4867	248	Socotra Governorate	SU	2024-09-17 21:00:08	2024-09-17 21:00:08
4868	248	Ta'izz Governorate	TA	2024-09-17 21:00:08	2024-09-17 21:00:08
4869	249	Central Province	02	2024-09-17 21:00:08	2024-09-17 21:00:08
4870	249	Copperbelt Province	08	2024-09-17 21:00:08	2024-09-17 21:00:08
4871	249	Eastern Province	03	2024-09-17 21:00:08	2024-09-17 21:00:08
4872	249	Luapula Province	04	2024-09-17 21:00:08	2024-09-17 21:00:08
4873	249	Lusaka Province	09	2024-09-17 21:00:08	2024-09-17 21:00:08
4874	249	Muchinga Province	10	2024-09-17 21:00:08	2024-09-17 21:00:08
4875	249	Northern Province	05	2024-09-17 21:00:08	2024-09-17 21:00:08
4876	249	Northwestern Province	06	2024-09-17 21:00:08	2024-09-17 21:00:08
4877	249	Southern Province	07	2024-09-17 21:00:08	2024-09-17 21:00:08
4878	249	Western Province	01	2024-09-17 21:00:08	2024-09-17 21:00:08
4879	250	Bulawayo Province	BU	2024-09-17 21:00:08	2024-09-17 21:00:08
4880	250	Harare Province	HA	2024-09-17 21:00:08	2024-09-17 21:00:08
4881	250	Manicaland	MA	2024-09-17 21:00:08	2024-09-17 21:00:08
4882	250	Mashonaland Central Province	MC	2024-09-17 21:00:08	2024-09-17 21:00:08
4883	250	Mashonaland East Province	ME	2024-09-17 21:00:08	2024-09-17 21:00:08
4884	250	Mashonaland West Province	MW	2024-09-17 21:00:08	2024-09-17 21:00:08
4885	250	Masvingo Province	MV	2024-09-17 21:00:08	2024-09-17 21:00:08
4886	250	Matabeleland North Province	MN	2024-09-17 21:00:08	2024-09-17 21:00:08
4887	250	Matabeleland South Province	MS	2024-09-17 21:00:08	2024-09-17 21:00:08
4888	250	Midlands Province	MI	2024-09-17 21:00:08	2024-09-17 21:00:08
\.


--
-- Data for Name: metalhub_stripe_payment_intents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_stripe_payment_intents (id, cart_id, order_id, intent_id, status, event_id, processing_at, processed_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_taggables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_taggables (id, tag_id, taggable_type, taggable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tags (id, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_classes (id, name, created_at, updated_at, "default") FROM stdin;
1	Default Tax Class	2024-09-17 21:00:09	2024-09-17 21:00:09	t
\.


--
-- Data for Name: metalhub_tax_rate_amounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_rate_amounts (id, tax_class_id, tax_rate_id, percentage, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_rates (id, tax_zone_id, priority, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_zone_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_zone_countries (id, tax_zone_id, country_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_zone_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_zone_customer_groups (id, tax_zone_id, customer_group_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_zone_postcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_zone_postcodes (id, tax_zone_id, country_id, postcode, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_zone_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_zone_states (id, tax_zone_id, state_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_tax_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_tax_zones (id, name, zone_type, price_display, active, "default", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metalhub_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_transactions (id, order_id, success, driver, amount, reference, status, notes, card_type, last_four, meta, created_at, updated_at, parent_transaction_id, captured_at, type) FROM stdin;
\.


--
-- Data for Name: metalhub_urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metalhub_urls (id, language_id, element_type, element_id, slug, "default", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2014_10_12_100000_create_password_resets_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2021_07_29_100000_create_channels_table	1
7	2021_07_29_100001_create_languages_table	1
8	2021_07_29_100002_create_channelables_table	1
9	2021_07_29_100003_create_currencies_table	1
10	2021_07_29_100004_create_attribute_groups_table	1
11	2021_07_29_100005_create_attributes_table	1
12	2021_07_29_100006_create_attributables_table	1
13	2021_07_29_100010_create_product_types_table	1
14	2021_07_29_100011_create_tax_classes_table	1
15	2021_07_29_100012_create_tax_zones_table	1
16	2021_07_29_100020_create_products_table	1
17	2021_07_29_100025_create_product_associations_table	1
18	2021_07_29_100030_create_product_variants_table	1
19	2021_07_29_100040_create_customer_groups_table	1
20	2021_07_29_100041_create_customer_group_product_table	1
21	2021_07_29_100041_create_customers_table	1
22	2021_07_29_100042_create_customer_customer_group_table	1
23	2021_07_29_100042_create_customer_user_table	1
24	2021_07_29_100050_create_prices_table	1
25	2021_07_30_100000_create_countries_table	1
26	2021_07_30_100001_create_states_table	1
27	2021_07_30_100002_create_addresses_table	1
28	2021_07_30_100003_create_tax_zone_countries_table	1
29	2021_07_30_100004_create_tax_zone_states_table	1
30	2021_07_30_100005_create_tax_zone_postcodes_table	1
31	2021_07_30_100006_create_tax_zone_customer_groups_table	1
32	2021_07_30_100007_create_tax_rates_table	1
33	2021_07_30_100008_create_tax_rate_amounts_table	1
34	2021_08_10_101547_create_media_table	1
35	2021_08_10_102000_create_collection_groups_table	1
36	2021_08_10_103000_create_collections_table	1
37	2021_08_10_103001_create_collection_product_table	1
38	2021_08_10_103002_create_collection_customer_group_table	1
39	2021_08_17_142630_create_activity_log_table	1
40	2021_08_19_110000_create_staff_table	1
41	2021_09_09_100000_create_product_options_table	1
42	2021_09_09_100001_create_product_option_values_table	1
43	2021_09_09_100010_create_product_option_value_product_variant_table	1
44	2021_09_10_100000_create_tags_table	1
45	2021_09_10_100001_create_taggables_table	1
46	2021_09_29_100000_create_urls_table	1
47	2021_10_01_090000_create_orders_table	1
48	2021_10_01_090001_create_order_lines_table	1
49	2021_10_01_090002_create_order_addresses_table	1
50	2021_10_01_090003_create_transactions_table	1
51	2021_10_01_100000_create_carts_table	1
52	2021_10_01_100001_create_cart_addresses_table	1
53	2021_10_01_100001_create_cart_lines_table	1
54	2022_01_12_100000_add_columns_to_attributes_table	1
55	2022_01_12_100001_add_attribute_data_to_product_variants_table	1
56	2022_01_12_100002_add_default_column_to_tax_classes_table	1
57	2022_01_18_100000_add_starts_ends_at_to_channelables_table	1
58	2022_01_18_100001_add_customer_id_to_orders_table	1
59	2022_03_11_100000_remove_formatting_columns_from_currencies_table	1
60	2022_03_17_100000_add_fields_to_transactions_table	1
61	2022_03_29_100000_update_quantity_on_cart_lines_table	1
62	2022_03_30_100000_update_quantity_on_order_lines_table	1
63	2022_04_28_100000_create_shipping_zones_table	1
64	2022_04_28_110000_create_shipping_methods_table	1
65	2022_04_28_111000_create_shipping_rates_table	1
66	2022_04_28_120000_create_shipping_exclusion_lists_table	1
67	2022_04_28_130000_create_shipping_exclusions_table	1
68	2022_04_28_140000_create_shipping_exclusion_list_shipping_zone_table	1
69	2022_04_28_150000_create_country_shipping_zone_table	1
70	2022_04_28_160000_create_shipping_zone_postcodes_table	1
71	2022_04_28_170000_create_state_shipping_zone_table	1
72	2022_05_10_100000_fix_last_four_on_transactions_table	1
73	2022_05_19_100000_add_attributes_to_customers_table	1
74	2022_06_29_100000_create_assets_table	1
75	2022_07_15_100000_set_last_four_to_nullable_on_transactions	1
76	2022_07_23_215417_add_handle_position_to_product_options_table	1
77	2022_07_23_215418_add_position_to_product_option_values_table	1
78	2022_08_09_100000_create_media_variant_table	1
79	2022_08_09_100001_create_brands_table	1
80	2022_08_09_100002_add_brand_id_to_products_table	1
81	2022_09_05_100000_add_account_ref_to_customers_table	1
82	2022_09_08_100000_add_position_to_media_product_variant_table	1
83	2022_10_07_100000_create_order_shipping_zone_table	1
84	2022_11_13_110447_update_prices_on_prices_table	1
85	2022_11_13_111734_update_prices_on_orders_table	1
86	2022_11_13_111744_update_prices_on_order_lines_table	1
87	2022_11_18_100000_create_discounts_table	1
88	2022_11_18_100005_create_cart_line_discount_table	1
89	2022_11_18_100010_create_brand_discount_table	1
90	2022_11_18_100015_create_customer_group_discount_table	1
91	2022_11_18_100020_create_discount_collections_table	1
92	2022_11_18_100030_create_discount_purchasables_table	1
93	2022_12_09_100000_add_new_customer_flag_to_orders_table	1
94	2023_03_03_100001_add_discount_breakdown_to_orders_table	1
95	2023_03_03_100001_add_max_uses_per_user_to_discounts_table	1
96	2023_03_13_100030_create_discount_user_table	1
97	2023_04_19_100000_add_shipping_breakdown_to_orders_table	1
98	2023_05_20_100000_add_customer_id_to_carts_table	1
99	2023_05_26_100000_add_label_to_product_options_table	1
100	2023_05_31_100000_create_permission_tables	1
101	2023_06_07_100000_add_cart_id_to_orders_table	1
102	2023_08_16_100013_add_attributes_to_brands_table	1
103	2023_09_21_100000_set_section_to_nullable_on_attributes	1
104	2023_10_06_100010_add_type_to_brand_discount_table	1
105	2023_10_06_100010_add_type_to_collection_discount_table	1
106	2023_12_18_100000_add_quantity_increment_min_quantity_to_product_variants_table	1
107	2024_01_04_100013_add_attributes_to_customer_groups_table	1
108	2024_01_11_100000_add_description_to_attributes_table	1
109	2024_01_16_100000_create_product_product_option_table	1
110	2024_01_16_100010_update_product_option_relations	1
111	2024_01_16_100020_remove_position_from_product_options_table	1
112	2024_01_16_100030_add_and_set_shared_to_product_options_table	1
113	2024_01_24_100000_update_product_option_handle_fk	1
114	2024_01_29_100000_update_nullable_currency_on_prices_table	1
115	2024_01_31_100000_update_tier_to_min_quantity_on_prices_table	1
116	2024_03_15_100000_remap_polymorphic_relations	1
117	2024_03_19_100000_remap_shipping_polymorphic_relations	1
118	2024_03_26_100000_create_brand_collection_table	1
119	2024_04_23_100000_add_soft_deletes_to_carts_table	1
120	2024_05_25_100000_update_collection_group_handle_unique	1
121	2024_06_28_100000_create_customer_group_shipping_method_table	1
122	2024_07_23_100000_add_fingerprint_to_orders_table	1
123	2024_07_31_100000_create_stripe_payment_intents_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	settings	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
2	settings:core	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
3	settings:manage-staff	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
4	settings:manage-attributes	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
5	catalog:manage-products	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
6	catalog:manage-collections	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
7	sales:manage-orders	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
8	sales:manage-customers	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
9	sales:manage-discounts	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	admin	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
2	staff	staff	2024-09-17 20:59:37	2024-09-17 20:59:37
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 2, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: metalhub_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_addresses_id_seq', 1, false);


--
-- Name: metalhub_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_assets_id_seq', 1, false);


--
-- Name: metalhub_attributables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_attributables_id_seq', 2, true);


--
-- Name: metalhub_attribute_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_attribute_groups_id_seq', 2, true);


--
-- Name: metalhub_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_attributes_id_seq', 4, true);


--
-- Name: metalhub_brand_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_brand_collection_id_seq', 1, false);


--
-- Name: metalhub_brand_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_brand_discount_id_seq', 1, false);


--
-- Name: metalhub_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_brands_id_seq', 1, false);


--
-- Name: metalhub_cart_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_cart_addresses_id_seq', 1, false);


--
-- Name: metalhub_cart_line_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_cart_line_discount_id_seq', 1, false);


--
-- Name: metalhub_cart_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_cart_lines_id_seq', 1, false);


--
-- Name: metalhub_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_carts_id_seq', 1, false);


--
-- Name: metalhub_channelables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_channelables_id_seq', 1, false);


--
-- Name: metalhub_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_channels_id_seq', 1, true);


--
-- Name: metalhub_collection_customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_collection_customer_group_id_seq', 1, false);


--
-- Name: metalhub_collection_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_collection_discount_id_seq', 1, false);


--
-- Name: metalhub_collection_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_collection_groups_id_seq', 1, true);


--
-- Name: metalhub_collection_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_collection_product_id_seq', 1, false);


--
-- Name: metalhub_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_collections_id_seq', 1, false);


--
-- Name: metalhub_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_countries_id_seq', 250, true);


--
-- Name: metalhub_country_shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_country_shipping_zone_id_seq', 1, false);


--
-- Name: metalhub_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_currencies_id_seq', 1, true);


--
-- Name: metalhub_customer_customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_customer_group_id_seq', 1, false);


--
-- Name: metalhub_customer_group_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_group_discount_id_seq', 1, false);


--
-- Name: metalhub_customer_group_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_group_product_id_seq', 1, false);


--
-- Name: metalhub_customer_group_shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_group_shipping_method_id_seq', 1, false);


--
-- Name: metalhub_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_groups_id_seq', 1, true);


--
-- Name: metalhub_customer_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customer_user_id_seq', 1, false);


--
-- Name: metalhub_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_customers_id_seq', 1, false);


--
-- Name: metalhub_discount_purchasables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_discount_purchasables_id_seq', 1, false);


--
-- Name: metalhub_discount_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_discount_user_id_seq', 1, false);


--
-- Name: metalhub_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_discounts_id_seq', 1, false);


--
-- Name: metalhub_exclusion_list_shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_exclusion_list_shipping_zone_id_seq', 1, false);


--
-- Name: metalhub_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_languages_id_seq', 1, true);


--
-- Name: metalhub_media_product_variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_media_product_variant_id_seq', 1, false);


--
-- Name: metalhub_order_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_order_addresses_id_seq', 1, false);


--
-- Name: metalhub_order_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_order_lines_id_seq', 1, false);


--
-- Name: metalhub_order_shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_order_shipping_zone_id_seq', 1, false);


--
-- Name: metalhub_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_orders_id_seq', 1, false);


--
-- Name: metalhub_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_prices_id_seq', 1, false);


--
-- Name: metalhub_product_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_associations_id_seq', 1, false);


--
-- Name: metalhub_product_option_value_product_variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_option_value_product_variant_id_seq', 1, false);


--
-- Name: metalhub_product_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_option_values_id_seq', 1, false);


--
-- Name: metalhub_product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_options_id_seq', 1, false);


--
-- Name: metalhub_product_product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_product_option_id_seq', 1, false);


--
-- Name: metalhub_product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_types_id_seq', 1, true);


--
-- Name: metalhub_product_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_product_variants_id_seq', 1, false);


--
-- Name: metalhub_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_products_id_seq', 1, false);


--
-- Name: metalhub_shipping_exclusion_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_exclusion_lists_id_seq', 1, false);


--
-- Name: metalhub_shipping_exclusions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_exclusions_id_seq', 1, false);


--
-- Name: metalhub_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_methods_id_seq', 1, false);


--
-- Name: metalhub_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_rates_id_seq', 1, false);


--
-- Name: metalhub_shipping_zone_postcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_zone_postcodes_id_seq', 1, false);


--
-- Name: metalhub_shipping_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_shipping_zones_id_seq', 1, false);


--
-- Name: metalhub_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_staff_id_seq', 1, true);


--
-- Name: metalhub_state_shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_state_shipping_zone_id_seq', 1, false);


--
-- Name: metalhub_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_states_id_seq', 4888, true);


--
-- Name: metalhub_stripe_payment_intents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_stripe_payment_intents_id_seq', 1, false);


--
-- Name: metalhub_taggables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_taggables_id_seq', 1, false);


--
-- Name: metalhub_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tags_id_seq', 1, false);


--
-- Name: metalhub_tax_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_classes_id_seq', 1, true);


--
-- Name: metalhub_tax_rate_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_rate_amounts_id_seq', 1, false);


--
-- Name: metalhub_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_rates_id_seq', 1, false);


--
-- Name: metalhub_tax_zone_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_zone_countries_id_seq', 1, false);


--
-- Name: metalhub_tax_zone_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_zone_customer_groups_id_seq', 1, false);


--
-- Name: metalhub_tax_zone_postcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_zone_postcodes_id_seq', 1, false);


--
-- Name: metalhub_tax_zone_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_zone_states_id_seq', 1, false);


--
-- Name: metalhub_tax_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_tax_zones_id_seq', 1, false);


--
-- Name: metalhub_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_transactions_id_seq', 1, false);


--
-- Name: metalhub_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metalhub_urls_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 123, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 9, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: media media_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_uuid_unique UNIQUE (uuid);


--
-- Name: metalhub_addresses metalhub_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_addresses
    ADD CONSTRAINT metalhub_addresses_pkey PRIMARY KEY (id);


--
-- Name: metalhub_assets metalhub_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_assets
    ADD CONSTRAINT metalhub_assets_pkey PRIMARY KEY (id);


--
-- Name: metalhub_attributables metalhub_attributables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributables
    ADD CONSTRAINT metalhub_attributables_pkey PRIMARY KEY (id);


--
-- Name: metalhub_attribute_groups metalhub_attribute_groups_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attribute_groups
    ADD CONSTRAINT metalhub_attribute_groups_handle_unique UNIQUE (handle);


--
-- Name: metalhub_attribute_groups metalhub_attribute_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attribute_groups
    ADD CONSTRAINT metalhub_attribute_groups_pkey PRIMARY KEY (id);


--
-- Name: metalhub_attributes metalhub_attributes_attribute_type_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributes
    ADD CONSTRAINT metalhub_attributes_attribute_type_handle_unique UNIQUE (attribute_type, handle);


--
-- Name: metalhub_attributes metalhub_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributes
    ADD CONSTRAINT metalhub_attributes_pkey PRIMARY KEY (id);


--
-- Name: metalhub_brand_collection metalhub_brand_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_collection
    ADD CONSTRAINT metalhub_brand_collection_pkey PRIMARY KEY (id);


--
-- Name: metalhub_brand_discount metalhub_brand_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_discount
    ADD CONSTRAINT metalhub_brand_discount_pkey PRIMARY KEY (id);


--
-- Name: metalhub_brands metalhub_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brands
    ADD CONSTRAINT metalhub_brands_pkey PRIMARY KEY (id);


--
-- Name: metalhub_cart_addresses metalhub_cart_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_addresses
    ADD CONSTRAINT metalhub_cart_addresses_pkey PRIMARY KEY (id);


--
-- Name: metalhub_cart_line_discount metalhub_cart_line_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_line_discount
    ADD CONSTRAINT metalhub_cart_line_discount_pkey PRIMARY KEY (id);


--
-- Name: metalhub_cart_lines metalhub_cart_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_lines
    ADD CONSTRAINT metalhub_cart_lines_pkey PRIMARY KEY (id);


--
-- Name: metalhub_carts metalhub_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_pkey PRIMARY KEY (id);


--
-- Name: metalhub_channelables metalhub_channelables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channelables
    ADD CONSTRAINT metalhub_channelables_pkey PRIMARY KEY (id);


--
-- Name: metalhub_channels metalhub_channels_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channels
    ADD CONSTRAINT metalhub_channels_handle_unique UNIQUE (handle);


--
-- Name: metalhub_channels metalhub_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channels
    ADD CONSTRAINT metalhub_channels_pkey PRIMARY KEY (id);


--
-- Name: metalhub_collection_customer_group metalhub_collection_customer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_customer_group
    ADD CONSTRAINT metalhub_collection_customer_group_pkey PRIMARY KEY (id);


--
-- Name: metalhub_collection_discount metalhub_collection_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_discount
    ADD CONSTRAINT metalhub_collection_discount_pkey PRIMARY KEY (id);


--
-- Name: metalhub_collection_groups metalhub_collection_groups_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_groups
    ADD CONSTRAINT metalhub_collection_groups_handle_unique UNIQUE (handle);


--
-- Name: metalhub_collection_groups metalhub_collection_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_groups
    ADD CONSTRAINT metalhub_collection_groups_pkey PRIMARY KEY (id);


--
-- Name: metalhub_collection_product metalhub_collection_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_product
    ADD CONSTRAINT metalhub_collection_product_pkey PRIMARY KEY (id);


--
-- Name: metalhub_collections metalhub_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collections
    ADD CONSTRAINT metalhub_collections_pkey PRIMARY KEY (id);


--
-- Name: metalhub_countries metalhub_countries_iso2_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_countries
    ADD CONSTRAINT metalhub_countries_iso2_unique UNIQUE (iso2);


--
-- Name: metalhub_countries metalhub_countries_iso3_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_countries
    ADD CONSTRAINT metalhub_countries_iso3_unique UNIQUE (iso3);


--
-- Name: metalhub_countries metalhub_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_countries
    ADD CONSTRAINT metalhub_countries_pkey PRIMARY KEY (id);


--
-- Name: metalhub_country_shipping_zone metalhub_country_shipping_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_country_shipping_zone
    ADD CONSTRAINT metalhub_country_shipping_zone_pkey PRIMARY KEY (id);


--
-- Name: metalhub_currencies metalhub_currencies_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_currencies
    ADD CONSTRAINT metalhub_currencies_code_unique UNIQUE (code);


--
-- Name: metalhub_currencies metalhub_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_currencies
    ADD CONSTRAINT metalhub_currencies_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_customer_group metalhub_customer_customer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_customer_group
    ADD CONSTRAINT metalhub_customer_customer_group_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_group_discount metalhub_customer_group_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_discount
    ADD CONSTRAINT metalhub_customer_group_discount_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_group_product metalhub_customer_group_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_product
    ADD CONSTRAINT metalhub_customer_group_product_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_group_shipping_method metalhub_customer_group_shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_shipping_method
    ADD CONSTRAINT metalhub_customer_group_shipping_method_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_groups metalhub_customer_groups_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_groups
    ADD CONSTRAINT metalhub_customer_groups_handle_unique UNIQUE (handle);


--
-- Name: metalhub_customer_groups metalhub_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_groups
    ADD CONSTRAINT metalhub_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customer_user metalhub_customer_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_user
    ADD CONSTRAINT metalhub_customer_user_pkey PRIMARY KEY (id);


--
-- Name: metalhub_customers metalhub_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customers
    ADD CONSTRAINT metalhub_customers_pkey PRIMARY KEY (id);


--
-- Name: metalhub_discount_purchasables metalhub_discount_purchasables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_purchasables
    ADD CONSTRAINT metalhub_discount_purchasables_pkey PRIMARY KEY (id);


--
-- Name: metalhub_discount_user metalhub_discount_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_user
    ADD CONSTRAINT metalhub_discount_user_pkey PRIMARY KEY (id);


--
-- Name: metalhub_discounts metalhub_discounts_coupon_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discounts
    ADD CONSTRAINT metalhub_discounts_coupon_unique UNIQUE (coupon);


--
-- Name: metalhub_discounts metalhub_discounts_handle_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discounts
    ADD CONSTRAINT metalhub_discounts_handle_unique UNIQUE (handle);


--
-- Name: metalhub_discounts metalhub_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discounts
    ADD CONSTRAINT metalhub_discounts_pkey PRIMARY KEY (id);


--
-- Name: metalhub_exclusion_list_shipping_zone metalhub_exclusion_list_shipping_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_exclusion_list_shipping_zone
    ADD CONSTRAINT metalhub_exclusion_list_shipping_zone_pkey PRIMARY KEY (id);


--
-- Name: metalhub_languages metalhub_languages_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_languages
    ADD CONSTRAINT metalhub_languages_code_unique UNIQUE (code);


--
-- Name: metalhub_languages metalhub_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_languages
    ADD CONSTRAINT metalhub_languages_pkey PRIMARY KEY (id);


--
-- Name: metalhub_media_product_variant metalhub_media_product_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_media_product_variant
    ADD CONSTRAINT metalhub_media_product_variant_pkey PRIMARY KEY (id);


--
-- Name: metalhub_order_addresses metalhub_order_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_addresses
    ADD CONSTRAINT metalhub_order_addresses_pkey PRIMARY KEY (id);


--
-- Name: metalhub_order_lines metalhub_order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_lines
    ADD CONSTRAINT metalhub_order_lines_pkey PRIMARY KEY (id);


--
-- Name: metalhub_order_shipping_zone metalhub_order_shipping_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_shipping_zone
    ADD CONSTRAINT metalhub_order_shipping_zone_pkey PRIMARY KEY (id);


--
-- Name: metalhub_orders metalhub_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_pkey PRIMARY KEY (id);


--
-- Name: metalhub_orders metalhub_orders_reference_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_reference_unique UNIQUE (reference);


--
-- Name: metalhub_prices metalhub_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_prices
    ADD CONSTRAINT metalhub_prices_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_associations metalhub_product_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_associations
    ADD CONSTRAINT metalhub_product_associations_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_option_value_product_variant metalhub_product_option_value_product_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_value_product_variant
    ADD CONSTRAINT metalhub_product_option_value_product_variant_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_option_values metalhub_product_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_values
    ADD CONSTRAINT metalhub_product_option_values_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_options metalhub_product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_options
    ADD CONSTRAINT metalhub_product_options_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_product_option metalhub_product_product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_product_option
    ADD CONSTRAINT metalhub_product_product_option_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_types metalhub_product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_types
    ADD CONSTRAINT metalhub_product_types_pkey PRIMARY KEY (id);


--
-- Name: metalhub_product_variants metalhub_product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_variants
    ADD CONSTRAINT metalhub_product_variants_pkey PRIMARY KEY (id);


--
-- Name: metalhub_products metalhub_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_products
    ADD CONSTRAINT metalhub_products_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_exclusion_lists metalhub_shipping_exclusion_lists_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusion_lists
    ADD CONSTRAINT metalhub_shipping_exclusion_lists_name_unique UNIQUE (name);


--
-- Name: metalhub_shipping_exclusion_lists metalhub_shipping_exclusion_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusion_lists
    ADD CONSTRAINT metalhub_shipping_exclusion_lists_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_exclusions metalhub_shipping_exclusions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusions
    ADD CONSTRAINT metalhub_shipping_exclusions_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_methods metalhub_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_methods
    ADD CONSTRAINT metalhub_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_rates metalhub_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_rates
    ADD CONSTRAINT metalhub_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_zone_postcodes metalhub_shipping_zone_postcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_zone_postcodes
    ADD CONSTRAINT metalhub_shipping_zone_postcodes_pkey PRIMARY KEY (id);


--
-- Name: metalhub_shipping_zones metalhub_shipping_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_zones
    ADD CONSTRAINT metalhub_shipping_zones_pkey PRIMARY KEY (id);


--
-- Name: metalhub_staff metalhub_staff_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_staff
    ADD CONSTRAINT metalhub_staff_email_unique UNIQUE (email);


--
-- Name: metalhub_staff metalhub_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_staff
    ADD CONSTRAINT metalhub_staff_pkey PRIMARY KEY (id);


--
-- Name: metalhub_state_shipping_zone metalhub_state_shipping_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_state_shipping_zone
    ADD CONSTRAINT metalhub_state_shipping_zone_pkey PRIMARY KEY (id);


--
-- Name: metalhub_states metalhub_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_states
    ADD CONSTRAINT metalhub_states_pkey PRIMARY KEY (id);


--
-- Name: metalhub_stripe_payment_intents metalhub_stripe_payment_intents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_stripe_payment_intents
    ADD CONSTRAINT metalhub_stripe_payment_intents_pkey PRIMARY KEY (id);


--
-- Name: metalhub_taggables metalhub_taggables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_taggables
    ADD CONSTRAINT metalhub_taggables_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tags metalhub_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tags
    ADD CONSTRAINT metalhub_tags_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_classes metalhub_tax_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_classes
    ADD CONSTRAINT metalhub_tax_classes_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_rate_amounts metalhub_tax_rate_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rate_amounts
    ADD CONSTRAINT metalhub_tax_rate_amounts_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_rates metalhub_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rates
    ADD CONSTRAINT metalhub_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_zone_countries metalhub_tax_zone_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_countries
    ADD CONSTRAINT metalhub_tax_zone_countries_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_zone_customer_groups metalhub_tax_zone_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_customer_groups
    ADD CONSTRAINT metalhub_tax_zone_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_zone_postcodes metalhub_tax_zone_postcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_postcodes
    ADD CONSTRAINT metalhub_tax_zone_postcodes_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_zone_states metalhub_tax_zone_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_states
    ADD CONSTRAINT metalhub_tax_zone_states_pkey PRIMARY KEY (id);


--
-- Name: metalhub_tax_zones metalhub_tax_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zones
    ADD CONSTRAINT metalhub_tax_zones_pkey PRIMARY KEY (id);


--
-- Name: metalhub_transactions metalhub_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_transactions
    ADD CONSTRAINT metalhub_transactions_pkey PRIMARY KEY (id);


--
-- Name: metalhub_urls metalhub_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_urls
    ADD CONSTRAINT metalhub_urls_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activity_log_log_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);


--
-- Name: causer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);


--
-- Name: media_model_type_model_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_model_type_model_id_index ON public.media USING btree (model_type, model_id);


--
-- Name: metalhub_attributables_attributable_type_attributable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributables_attributable_type_attributable_id_index ON public.metalhub_attributables USING btree (attributable_type, attributable_id);


--
-- Name: metalhub_attribute_groups_attributable_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attribute_groups_attributable_type_index ON public.metalhub_attribute_groups USING btree (attributable_type);


--
-- Name: metalhub_attribute_groups_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attribute_groups_position_index ON public.metalhub_attribute_groups USING btree ("position");


--
-- Name: metalhub_attributes_attribute_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributes_attribute_type_index ON public.metalhub_attributes USING btree (attribute_type);


--
-- Name: metalhub_attributes_filterable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributes_filterable_index ON public.metalhub_attributes USING btree (filterable);


--
-- Name: metalhub_attributes_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributes_position_index ON public.metalhub_attributes USING btree ("position");


--
-- Name: metalhub_attributes_searchable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributes_searchable_index ON public.metalhub_attributes USING btree (searchable);


--
-- Name: metalhub_attributes_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_attributes_type_index ON public.metalhub_attributes USING btree (type);


--
-- Name: metalhub_cart_addresses_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_cart_addresses_type_index ON public.metalhub_cart_addresses USING btree (type);


--
-- Name: metalhub_cart_lines_purchasable_type_purchasable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_cart_lines_purchasable_type_purchasable_id_index ON public.metalhub_cart_lines USING btree (purchasable_type, purchasable_id);


--
-- Name: metalhub_carts_completed_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_carts_completed_at_index ON public.metalhub_carts USING btree (completed_at);


--
-- Name: metalhub_carts_coupon_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_carts_coupon_code_index ON public.metalhub_carts USING btree (coupon_code);


--
-- Name: metalhub_channelables_channelable_type_channelable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_channelables_channelable_type_channelable_id_index ON public.metalhub_channelables USING btree (channelable_type, channelable_id);


--
-- Name: metalhub_channelables_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_channelables_ends_at_index ON public.metalhub_channelables USING btree (ends_at);


--
-- Name: metalhub_channels_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_channels_default_index ON public.metalhub_channels USING btree ("default");


--
-- Name: metalhub_collection_customer_group_enabled_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collection_customer_group_enabled_index ON public.metalhub_collection_customer_group USING btree (enabled);


--
-- Name: metalhub_collection_customer_group_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collection_customer_group_ends_at_index ON public.metalhub_collection_customer_group USING btree (ends_at);


--
-- Name: metalhub_collection_customer_group_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collection_customer_group_starts_at_index ON public.metalhub_collection_customer_group USING btree (starts_at);


--
-- Name: metalhub_collection_customer_group_visible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collection_customer_group_visible_index ON public.metalhub_collection_customer_group USING btree (visible);


--
-- Name: metalhub_collection_product_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collection_product_position_index ON public.metalhub_collection_product USING btree ("position");


--
-- Name: metalhub_collections__lft__rgt_parent_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collections__lft__rgt_parent_id_index ON public.metalhub_collections USING btree (_lft, _rgt, parent_id);


--
-- Name: metalhub_collections_sort_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collections_sort_index ON public.metalhub_collections USING btree (sort);


--
-- Name: metalhub_collections_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_collections_type_index ON public.metalhub_collections USING btree (type);


--
-- Name: metalhub_currencies_decimal_places_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_currencies_decimal_places_index ON public.metalhub_currencies USING btree (decimal_places);


--
-- Name: metalhub_currencies_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_currencies_default_index ON public.metalhub_currencies USING btree ("default");


--
-- Name: metalhub_currencies_enabled_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_currencies_enabled_index ON public.metalhub_currencies USING btree (enabled);


--
-- Name: metalhub_customer_group_discount_enabled_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_discount_enabled_index ON public.metalhub_customer_group_discount USING btree (enabled);


--
-- Name: metalhub_customer_group_discount_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_discount_ends_at_index ON public.metalhub_customer_group_discount USING btree (ends_at);


--
-- Name: metalhub_customer_group_discount_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_discount_starts_at_index ON public.metalhub_customer_group_discount USING btree (starts_at);


--
-- Name: metalhub_customer_group_discount_visible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_discount_visible_index ON public.metalhub_customer_group_discount USING btree (visible);


--
-- Name: metalhub_customer_group_product_enabled_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_product_enabled_index ON public.metalhub_customer_group_product USING btree (enabled);


--
-- Name: metalhub_customer_group_product_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_product_ends_at_index ON public.metalhub_customer_group_product USING btree (ends_at);


--
-- Name: metalhub_customer_group_product_purchasable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_product_purchasable_index ON public.metalhub_customer_group_product USING btree (purchasable);


--
-- Name: metalhub_customer_group_product_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_product_starts_at_index ON public.metalhub_customer_group_product USING btree (starts_at);


--
-- Name: metalhub_customer_group_product_visible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_product_visible_index ON public.metalhub_customer_group_product USING btree (visible);


--
-- Name: metalhub_customer_group_shipping_method_enabled_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_shipping_method_enabled_index ON public.metalhub_customer_group_shipping_method USING btree (enabled);


--
-- Name: metalhub_customer_group_shipping_method_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_shipping_method_ends_at_index ON public.metalhub_customer_group_shipping_method USING btree (ends_at);


--
-- Name: metalhub_customer_group_shipping_method_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_shipping_method_starts_at_index ON public.metalhub_customer_group_shipping_method USING btree (starts_at);


--
-- Name: metalhub_customer_group_shipping_method_visible_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_group_shipping_method_visible_index ON public.metalhub_customer_group_shipping_method USING btree (visible);


--
-- Name: metalhub_customer_groups_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customer_groups_default_index ON public.metalhub_customer_groups USING btree ("default");


--
-- Name: metalhub_customers_account_ref_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_customers_account_ref_index ON public.metalhub_customers USING btree (account_ref);


--
-- Name: metalhub_discount_purchasables_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discount_purchasables_type_index ON public.metalhub_discount_purchasables USING btree (type);


--
-- Name: metalhub_discounts_ends_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_ends_at_index ON public.metalhub_discounts USING btree (ends_at);


--
-- Name: metalhub_discounts_priority_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_priority_index ON public.metalhub_discounts USING btree (priority);


--
-- Name: metalhub_discounts_restriction_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_restriction_index ON public.metalhub_discounts USING btree (restriction);


--
-- Name: metalhub_discounts_starts_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_starts_at_index ON public.metalhub_discounts USING btree (starts_at);


--
-- Name: metalhub_discounts_stop_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_stop_index ON public.metalhub_discounts USING btree (stop);


--
-- Name: metalhub_discounts_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_type_index ON public.metalhub_discounts USING btree (type);


--
-- Name: metalhub_discounts_uses_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_discounts_uses_index ON public.metalhub_discounts USING btree (uses);


--
-- Name: metalhub_languages_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_languages_default_index ON public.metalhub_languages USING btree ("default");


--
-- Name: metalhub_media_product_variant_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_media_product_variant_position_index ON public.metalhub_media_product_variant USING btree ("position");


--
-- Name: metalhub_media_product_variant_primary_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_media_product_variant_primary_index ON public.metalhub_media_product_variant USING btree ("primary");


--
-- Name: metalhub_order_addresses_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_addresses_type_index ON public.metalhub_order_addresses USING btree (type);


--
-- Name: metalhub_order_lines_discount_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_discount_total_index ON public.metalhub_order_lines USING btree (discount_total);


--
-- Name: metalhub_order_lines_identifier_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_identifier_index ON public.metalhub_order_lines USING btree (identifier);


--
-- Name: metalhub_order_lines_purchasable_type_purchasable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_purchasable_type_purchasable_id_index ON public.metalhub_order_lines USING btree (purchasable_type, purchasable_id);


--
-- Name: metalhub_order_lines_sub_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_sub_total_index ON public.metalhub_order_lines USING btree (sub_total);


--
-- Name: metalhub_order_lines_tax_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_tax_total_index ON public.metalhub_order_lines USING btree (tax_total);


--
-- Name: metalhub_order_lines_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_total_index ON public.metalhub_order_lines USING btree (total);


--
-- Name: metalhub_order_lines_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_type_index ON public.metalhub_order_lines USING btree (type);


--
-- Name: metalhub_order_lines_unit_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_unit_price_index ON public.metalhub_order_lines USING btree (unit_price);


--
-- Name: metalhub_order_lines_unit_quantity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_order_lines_unit_quantity_index ON public.metalhub_order_lines USING btree (unit_quantity);


--
-- Name: metalhub_orders_discount_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_discount_total_index ON public.metalhub_orders USING btree (discount_total);


--
-- Name: metalhub_orders_fingerprint_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_fingerprint_index ON public.metalhub_orders USING btree (fingerprint);


--
-- Name: metalhub_orders_new_customer_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_new_customer_index ON public.metalhub_orders USING btree (new_customer);


--
-- Name: metalhub_orders_placed_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_placed_at_index ON public.metalhub_orders USING btree (placed_at);


--
-- Name: metalhub_orders_shipping_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_shipping_total_index ON public.metalhub_orders USING btree (shipping_total);


--
-- Name: metalhub_orders_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_status_index ON public.metalhub_orders USING btree (status);


--
-- Name: metalhub_orders_sub_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_sub_total_index ON public.metalhub_orders USING btree (sub_total);


--
-- Name: metalhub_orders_tax_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_tax_total_index ON public.metalhub_orders USING btree (tax_total);


--
-- Name: metalhub_orders_total_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_orders_total_index ON public.metalhub_orders USING btree (total);


--
-- Name: metalhub_prices_price_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_prices_price_index ON public.metalhub_prices USING btree (price);


--
-- Name: metalhub_prices_priceable_type_priceable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_prices_priceable_type_priceable_id_index ON public.metalhub_prices USING btree (priceable_type, priceable_id);


--
-- Name: metalhub_prices_tier_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_prices_tier_index ON public.metalhub_prices USING btree (min_quantity);


--
-- Name: metalhub_product_associations_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_associations_type_index ON public.metalhub_product_associations USING btree (type);


--
-- Name: metalhub_product_option_values_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_option_values_position_index ON public.metalhub_product_option_values USING btree ("position");


--
-- Name: metalhub_product_options_handle_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_options_handle_index ON public.metalhub_product_options USING btree (handle);


--
-- Name: metalhub_product_options_shared_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_options_shared_index ON public.metalhub_product_options USING btree (shared);


--
-- Name: metalhub_product_product_option_position_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_product_option_position_index ON public.metalhub_product_product_option USING btree ("position");


--
-- Name: metalhub_product_variants_backorder_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_backorder_index ON public.metalhub_product_variants USING btree (backorder);


--
-- Name: metalhub_product_variants_ean_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_ean_index ON public.metalhub_product_variants USING btree (ean);


--
-- Name: metalhub_product_variants_gtin_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_gtin_index ON public.metalhub_product_variants USING btree (gtin);


--
-- Name: metalhub_product_variants_height_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_height_value_index ON public.metalhub_product_variants USING btree (height_value);


--
-- Name: metalhub_product_variants_length_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_length_value_index ON public.metalhub_product_variants USING btree (length_value);


--
-- Name: metalhub_product_variants_min_quantity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_min_quantity_index ON public.metalhub_product_variants USING btree (min_quantity);


--
-- Name: metalhub_product_variants_mpn_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_mpn_index ON public.metalhub_product_variants USING btree (mpn);


--
-- Name: metalhub_product_variants_purchasable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_purchasable_index ON public.metalhub_product_variants USING btree (purchasable);


--
-- Name: metalhub_product_variants_quantity_increment_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_quantity_increment_index ON public.metalhub_product_variants USING btree (quantity_increment);


--
-- Name: metalhub_product_variants_shippable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_shippable_index ON public.metalhub_product_variants USING btree (shippable);


--
-- Name: metalhub_product_variants_sku_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_sku_index ON public.metalhub_product_variants USING btree (sku);


--
-- Name: metalhub_product_variants_stock_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_stock_index ON public.metalhub_product_variants USING btree (stock);


--
-- Name: metalhub_product_variants_tax_ref_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_tax_ref_index ON public.metalhub_product_variants USING btree (tax_ref);


--
-- Name: metalhub_product_variants_unit_quantity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_unit_quantity_index ON public.metalhub_product_variants USING btree (unit_quantity);


--
-- Name: metalhub_product_variants_volume_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_volume_value_index ON public.metalhub_product_variants USING btree (volume_value);


--
-- Name: metalhub_product_variants_weight_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_weight_value_index ON public.metalhub_product_variants USING btree (weight_value);


--
-- Name: metalhub_product_variants_width_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_product_variants_width_value_index ON public.metalhub_product_variants USING btree (width_value);


--
-- Name: metalhub_products_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_products_status_index ON public.metalhub_products USING btree (status);


--
-- Name: metalhub_shipping_methods_code_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_shipping_methods_code_index ON public.metalhub_shipping_methods USING btree (code);


--
-- Name: metalhub_shipping_zone_postcodes_postcode_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_shipping_zone_postcodes_postcode_index ON public.metalhub_shipping_zone_postcodes USING btree (postcode);


--
-- Name: metalhub_shipping_zones_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_shipping_zones_type_index ON public.metalhub_shipping_zones USING btree (type);


--
-- Name: metalhub_staff_admin_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_staff_admin_index ON public.metalhub_staff USING btree (admin);


--
-- Name: metalhub_staff_firstname_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_staff_firstname_index ON public.metalhub_staff USING btree (firstname);


--
-- Name: metalhub_staff_lastname_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_staff_lastname_index ON public.metalhub_staff USING btree (lastname);


--
-- Name: metalhub_stripe_payment_intents_event_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_stripe_payment_intents_event_id_index ON public.metalhub_stripe_payment_intents USING btree (event_id);


--
-- Name: metalhub_stripe_payment_intents_intent_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_stripe_payment_intents_intent_id_index ON public.metalhub_stripe_payment_intents USING btree (intent_id);


--
-- Name: metalhub_taggables_taggable_type_taggable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_taggables_taggable_type_taggable_id_index ON public.metalhub_taggables USING btree (taggable_type, taggable_id);


--
-- Name: metalhub_tags_value_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tags_value_index ON public.metalhub_tags USING btree (value);


--
-- Name: metalhub_tax_classes_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_classes_default_index ON public.metalhub_tax_classes USING btree ("default");


--
-- Name: metalhub_tax_rate_amounts_percentage_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_rate_amounts_percentage_index ON public.metalhub_tax_rate_amounts USING btree (percentage);


--
-- Name: metalhub_tax_rates_priority_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_rates_priority_index ON public.metalhub_tax_rates USING btree (priority);


--
-- Name: metalhub_tax_zone_postcodes_postcode_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_zone_postcodes_postcode_index ON public.metalhub_tax_zone_postcodes USING btree (postcode);


--
-- Name: metalhub_tax_zones_active_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_zones_active_index ON public.metalhub_tax_zones USING btree (active);


--
-- Name: metalhub_tax_zones_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_zones_default_index ON public.metalhub_tax_zones USING btree ("default");


--
-- Name: metalhub_tax_zones_zone_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_tax_zones_zone_type_index ON public.metalhub_tax_zones USING btree (zone_type);


--
-- Name: metalhub_transactions_amount_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_amount_index ON public.metalhub_transactions USING btree (amount);


--
-- Name: metalhub_transactions_captured_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_captured_at_index ON public.metalhub_transactions USING btree (captured_at);


--
-- Name: metalhub_transactions_card_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_card_type_index ON public.metalhub_transactions USING btree (card_type);


--
-- Name: metalhub_transactions_reference_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_reference_index ON public.metalhub_transactions USING btree (reference);


--
-- Name: metalhub_transactions_success_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_success_index ON public.metalhub_transactions USING btree (success);


--
-- Name: metalhub_transactions_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_transactions_type_index ON public.metalhub_transactions USING btree (type);


--
-- Name: metalhub_urls_default_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_urls_default_index ON public.metalhub_urls USING btree ("default");


--
-- Name: metalhub_urls_element_type_element_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_urls_element_type_element_id_index ON public.metalhub_urls USING btree (element_type, element_id);


--
-- Name: metalhub_urls_slug_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX metalhub_urls_slug_index ON public.metalhub_urls USING btree (slug);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: purchasable_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchasable_idx ON public.metalhub_discount_purchasables USING btree (purchasable_type, purchasable_id);


--
-- Name: shipping_exclusions_purchasable_type_purchasable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shipping_exclusions_purchasable_type_purchasable_id_index ON public.metalhub_shipping_exclusions USING btree (purchasable_type, purchasable_id);


--
-- Name: subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);


--
-- Name: metalhub_addresses metalhub_addresses_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_addresses
    ADD CONSTRAINT metalhub_addresses_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_addresses metalhub_addresses_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_addresses
    ADD CONSTRAINT metalhub_addresses_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.metalhub_customers(id);


--
-- Name: metalhub_attributables metalhub_attributables_attribute_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributables
    ADD CONSTRAINT metalhub_attributables_attribute_id_foreign FOREIGN KEY (attribute_id) REFERENCES public.metalhub_attributes(id);


--
-- Name: metalhub_attributes metalhub_attributes_attribute_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_attributes
    ADD CONSTRAINT metalhub_attributes_attribute_group_id_foreign FOREIGN KEY (attribute_group_id) REFERENCES public.metalhub_attribute_groups(id);


--
-- Name: metalhub_brand_collection metalhub_brand_collection_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_collection
    ADD CONSTRAINT metalhub_brand_collection_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES public.metalhub_brands(id);


--
-- Name: metalhub_brand_collection metalhub_brand_collection_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_collection
    ADD CONSTRAINT metalhub_brand_collection_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.metalhub_collections(id);


--
-- Name: metalhub_brand_discount metalhub_brand_discount_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_discount
    ADD CONSTRAINT metalhub_brand_discount_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES public.metalhub_brands(id) ON DELETE CASCADE;


--
-- Name: metalhub_brand_discount metalhub_brand_discount_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_brand_discount
    ADD CONSTRAINT metalhub_brand_discount_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id) ON DELETE CASCADE;


--
-- Name: metalhub_cart_addresses metalhub_cart_addresses_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_addresses
    ADD CONSTRAINT metalhub_cart_addresses_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.metalhub_carts(id);


--
-- Name: metalhub_cart_addresses metalhub_cart_addresses_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_addresses
    ADD CONSTRAINT metalhub_cart_addresses_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_cart_line_discount metalhub_cart_line_discount_cart_line_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_line_discount
    ADD CONSTRAINT metalhub_cart_line_discount_cart_line_id_foreign FOREIGN KEY (cart_line_id) REFERENCES public.metalhub_carts(id) ON DELETE CASCADE;


--
-- Name: metalhub_cart_line_discount metalhub_cart_line_discount_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_line_discount
    ADD CONSTRAINT metalhub_cart_line_discount_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id) ON DELETE CASCADE;


--
-- Name: metalhub_cart_lines metalhub_cart_lines_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_cart_lines
    ADD CONSTRAINT metalhub_cart_lines_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.metalhub_carts(id);


--
-- Name: metalhub_carts metalhub_carts_channel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_channel_id_foreign FOREIGN KEY (channel_id) REFERENCES public.metalhub_channels(id);


--
-- Name: metalhub_carts metalhub_carts_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_currency_id_foreign FOREIGN KEY (currency_id) REFERENCES public.metalhub_currencies(id);


--
-- Name: metalhub_carts metalhub_carts_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.metalhub_customers(id);


--
-- Name: metalhub_carts metalhub_carts_merged_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_merged_id_foreign FOREIGN KEY (merged_id) REFERENCES public.metalhub_carts(id);


--
-- Name: metalhub_carts metalhub_carts_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_carts metalhub_carts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_carts
    ADD CONSTRAINT metalhub_carts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: metalhub_channelables metalhub_channelables_channel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_channelables
    ADD CONSTRAINT metalhub_channelables_channel_id_foreign FOREIGN KEY (channel_id) REFERENCES public.metalhub_channels(id);


--
-- Name: metalhub_collection_customer_group metalhub_collection_customer_group_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_customer_group
    ADD CONSTRAINT metalhub_collection_customer_group_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.metalhub_collections(id);


--
-- Name: metalhub_collection_customer_group metalhub_collection_customer_group_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_customer_group
    ADD CONSTRAINT metalhub_collection_customer_group_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_collection_discount metalhub_collection_discount_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_discount
    ADD CONSTRAINT metalhub_collection_discount_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.metalhub_collections(id) ON DELETE CASCADE;


--
-- Name: metalhub_collection_discount metalhub_collection_discount_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_discount
    ADD CONSTRAINT metalhub_collection_discount_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id) ON DELETE CASCADE;


--
-- Name: metalhub_collection_product metalhub_collection_product_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_product
    ADD CONSTRAINT metalhub_collection_product_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.metalhub_collections(id);


--
-- Name: metalhub_collection_product metalhub_collection_product_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collection_product
    ADD CONSTRAINT metalhub_collection_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_collections metalhub_collections_collection_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_collections
    ADD CONSTRAINT metalhub_collections_collection_group_id_foreign FOREIGN KEY (collection_group_id) REFERENCES public.metalhub_collection_groups(id);


--
-- Name: metalhub_country_shipping_zone metalhub_country_shipping_zone_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_country_shipping_zone
    ADD CONSTRAINT metalhub_country_shipping_zone_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_country_shipping_zone metalhub_country_shipping_zone_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_country_shipping_zone
    ADD CONSTRAINT metalhub_country_shipping_zone_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_customer_customer_group metalhub_customer_customer_group_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_customer_group
    ADD CONSTRAINT metalhub_customer_customer_group_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_customer_customer_group metalhub_customer_customer_group_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_customer_group
    ADD CONSTRAINT metalhub_customer_customer_group_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.metalhub_customers(id);


--
-- Name: metalhub_customer_group_discount metalhub_customer_group_discount_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_discount
    ADD CONSTRAINT metalhub_customer_group_discount_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_customer_group_discount metalhub_customer_group_discount_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_discount
    ADD CONSTRAINT metalhub_customer_group_discount_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id);


--
-- Name: metalhub_customer_group_product metalhub_customer_group_product_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_product
    ADD CONSTRAINT metalhub_customer_group_product_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_customer_group_product metalhub_customer_group_product_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_product
    ADD CONSTRAINT metalhub_customer_group_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_customer_group_shipping_method metalhub_customer_group_shipping_method_customer_group_id_forei; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_shipping_method
    ADD CONSTRAINT metalhub_customer_group_shipping_method_customer_group_id_forei FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_customer_group_shipping_method metalhub_customer_group_shipping_method_shipping_method_id_fore; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_group_shipping_method
    ADD CONSTRAINT metalhub_customer_group_shipping_method_shipping_method_id_fore FOREIGN KEY (shipping_method_id) REFERENCES public.metalhub_shipping_methods(id);


--
-- Name: metalhub_customer_user metalhub_customer_user_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_user
    ADD CONSTRAINT metalhub_customer_user_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.metalhub_customers(id);


--
-- Name: metalhub_customer_user metalhub_customer_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_customer_user
    ADD CONSTRAINT metalhub_customer_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: metalhub_discount_purchasables metalhub_discount_purchasables_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_purchasables
    ADD CONSTRAINT metalhub_discount_purchasables_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id) ON DELETE CASCADE;


--
-- Name: metalhub_discount_user metalhub_discount_user_discount_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_user
    ADD CONSTRAINT metalhub_discount_user_discount_id_foreign FOREIGN KEY (discount_id) REFERENCES public.metalhub_discounts(id) ON DELETE CASCADE;


--
-- Name: metalhub_discount_user metalhub_discount_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_discount_user
    ADD CONSTRAINT metalhub_discount_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: metalhub_exclusion_list_shipping_zone metalhub_exclusion_list_shipping_zone_exclusion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_exclusion_list_shipping_zone
    ADD CONSTRAINT metalhub_exclusion_list_shipping_zone_exclusion_id_foreign FOREIGN KEY (exclusion_id) REFERENCES public.metalhub_shipping_exclusion_lists(id);


--
-- Name: metalhub_exclusion_list_shipping_zone metalhub_exclusion_list_shipping_zone_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_exclusion_list_shipping_zone
    ADD CONSTRAINT metalhub_exclusion_list_shipping_zone_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_media_product_variant metalhub_media_product_variant_media_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_media_product_variant
    ADD CONSTRAINT metalhub_media_product_variant_media_id_foreign FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: metalhub_media_product_variant metalhub_media_product_variant_product_variant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_media_product_variant
    ADD CONSTRAINT metalhub_media_product_variant_product_variant_id_foreign FOREIGN KEY (product_variant_id) REFERENCES public.metalhub_product_variants(id) ON DELETE CASCADE;


--
-- Name: metalhub_order_addresses metalhub_order_addresses_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_addresses
    ADD CONSTRAINT metalhub_order_addresses_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_order_addresses metalhub_order_addresses_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_addresses
    ADD CONSTRAINT metalhub_order_addresses_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_order_lines metalhub_order_lines_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_lines
    ADD CONSTRAINT metalhub_order_lines_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_order_shipping_zone metalhub_order_shipping_zone_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_shipping_zone
    ADD CONSTRAINT metalhub_order_shipping_zone_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_order_shipping_zone metalhub_order_shipping_zone_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_order_shipping_zone
    ADD CONSTRAINT metalhub_order_shipping_zone_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_orders metalhub_orders_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.metalhub_carts(id) ON DELETE SET NULL;


--
-- Name: metalhub_orders metalhub_orders_channel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_channel_id_foreign FOREIGN KEY (channel_id) REFERENCES public.metalhub_channels(id);


--
-- Name: metalhub_orders metalhub_orders_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.metalhub_customers(id);


--
-- Name: metalhub_orders metalhub_orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_orders
    ADD CONSTRAINT metalhub_orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: metalhub_prices metalhub_prices_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_prices
    ADD CONSTRAINT metalhub_prices_currency_id_foreign FOREIGN KEY (currency_id) REFERENCES public.metalhub_currencies(id);


--
-- Name: metalhub_prices metalhub_prices_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_prices
    ADD CONSTRAINT metalhub_prices_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_product_associations metalhub_product_associations_product_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_associations
    ADD CONSTRAINT metalhub_product_associations_product_parent_id_foreign FOREIGN KEY (product_parent_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_product_associations metalhub_product_associations_product_target_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_associations
    ADD CONSTRAINT metalhub_product_associations_product_target_id_foreign FOREIGN KEY (product_target_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_product_option_value_product_variant metalhub_product_option_value_product_variant_value_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_value_product_variant
    ADD CONSTRAINT metalhub_product_option_value_product_variant_value_id_foreign FOREIGN KEY (value_id) REFERENCES public.metalhub_product_option_values(id);


--
-- Name: metalhub_product_option_value_product_variant metalhub_product_option_value_product_variant_variant_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_value_product_variant
    ADD CONSTRAINT metalhub_product_option_value_product_variant_variant_id_foreig FOREIGN KEY (variant_id) REFERENCES public.metalhub_product_variants(id);


--
-- Name: metalhub_product_option_values metalhub_product_option_values_product_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_option_values
    ADD CONSTRAINT metalhub_product_option_values_product_option_id_foreign FOREIGN KEY (product_option_id) REFERENCES public.metalhub_product_options(id);


--
-- Name: metalhub_product_product_option metalhub_product_product_option_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_product_option
    ADD CONSTRAINT metalhub_product_product_option_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_product_product_option metalhub_product_product_option_product_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_product_option
    ADD CONSTRAINT metalhub_product_product_option_product_option_id_foreign FOREIGN KEY (product_option_id) REFERENCES public.metalhub_product_options(id);


--
-- Name: metalhub_product_variants metalhub_product_variants_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_variants
    ADD CONSTRAINT metalhub_product_variants_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.metalhub_products(id);


--
-- Name: metalhub_product_variants metalhub_product_variants_tax_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_product_variants
    ADD CONSTRAINT metalhub_product_variants_tax_class_id_foreign FOREIGN KEY (tax_class_id) REFERENCES public.metalhub_tax_classes(id);


--
-- Name: metalhub_products metalhub_products_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_products
    ADD CONSTRAINT metalhub_products_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES public.metalhub_brands(id);


--
-- Name: metalhub_products metalhub_products_product_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_products
    ADD CONSTRAINT metalhub_products_product_type_id_foreign FOREIGN KEY (product_type_id) REFERENCES public.metalhub_product_types(id);


--
-- Name: metalhub_shipping_exclusions metalhub_shipping_exclusions_shipping_exclusion_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_exclusions
    ADD CONSTRAINT metalhub_shipping_exclusions_shipping_exclusion_list_id_foreign FOREIGN KEY (shipping_exclusion_list_id) REFERENCES public.metalhub_shipping_exclusion_lists(id);


--
-- Name: metalhub_shipping_rates metalhub_shipping_rates_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_rates
    ADD CONSTRAINT metalhub_shipping_rates_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.metalhub_shipping_methods(id);


--
-- Name: metalhub_shipping_rates metalhub_shipping_rates_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_rates
    ADD CONSTRAINT metalhub_shipping_rates_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_shipping_zone_postcodes metalhub_shipping_zone_postcodes_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_shipping_zone_postcodes
    ADD CONSTRAINT metalhub_shipping_zone_postcodes_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_state_shipping_zone metalhub_state_shipping_zone_shipping_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_state_shipping_zone
    ADD CONSTRAINT metalhub_state_shipping_zone_shipping_zone_id_foreign FOREIGN KEY (shipping_zone_id) REFERENCES public.metalhub_shipping_zones(id);


--
-- Name: metalhub_state_shipping_zone metalhub_state_shipping_zone_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_state_shipping_zone
    ADD CONSTRAINT metalhub_state_shipping_zone_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.metalhub_states(id);


--
-- Name: metalhub_states metalhub_states_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_states
    ADD CONSTRAINT metalhub_states_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_stripe_payment_intents metalhub_stripe_payment_intents_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_stripe_payment_intents
    ADD CONSTRAINT metalhub_stripe_payment_intents_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.metalhub_carts(id);


--
-- Name: metalhub_stripe_payment_intents metalhub_stripe_payment_intents_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_stripe_payment_intents
    ADD CONSTRAINT metalhub_stripe_payment_intents_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_taggables metalhub_taggables_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_taggables
    ADD CONSTRAINT metalhub_taggables_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES public.metalhub_tags(id);


--
-- Name: metalhub_tax_rate_amounts metalhub_tax_rate_amounts_tax_class_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rate_amounts
    ADD CONSTRAINT metalhub_tax_rate_amounts_tax_class_id_foreign FOREIGN KEY (tax_class_id) REFERENCES public.metalhub_tax_classes(id);


--
-- Name: metalhub_tax_rate_amounts metalhub_tax_rate_amounts_tax_rate_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rate_amounts
    ADD CONSTRAINT metalhub_tax_rate_amounts_tax_rate_id_foreign FOREIGN KEY (tax_rate_id) REFERENCES public.metalhub_tax_rates(id);


--
-- Name: metalhub_tax_rates metalhub_tax_rates_tax_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_rates
    ADD CONSTRAINT metalhub_tax_rates_tax_zone_id_foreign FOREIGN KEY (tax_zone_id) REFERENCES public.metalhub_tax_zones(id);


--
-- Name: metalhub_tax_zone_countries metalhub_tax_zone_countries_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_countries
    ADD CONSTRAINT metalhub_tax_zone_countries_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_tax_zone_countries metalhub_tax_zone_countries_tax_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_countries
    ADD CONSTRAINT metalhub_tax_zone_countries_tax_zone_id_foreign FOREIGN KEY (tax_zone_id) REFERENCES public.metalhub_tax_zones(id);


--
-- Name: metalhub_tax_zone_customer_groups metalhub_tax_zone_customer_groups_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_customer_groups
    ADD CONSTRAINT metalhub_tax_zone_customer_groups_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.metalhub_customer_groups(id);


--
-- Name: metalhub_tax_zone_customer_groups metalhub_tax_zone_customer_groups_tax_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_customer_groups
    ADD CONSTRAINT metalhub_tax_zone_customer_groups_tax_zone_id_foreign FOREIGN KEY (tax_zone_id) REFERENCES public.metalhub_tax_zones(id);


--
-- Name: metalhub_tax_zone_postcodes metalhub_tax_zone_postcodes_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_postcodes
    ADD CONSTRAINT metalhub_tax_zone_postcodes_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.metalhub_countries(id);


--
-- Name: metalhub_tax_zone_postcodes metalhub_tax_zone_postcodes_tax_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_postcodes
    ADD CONSTRAINT metalhub_tax_zone_postcodes_tax_zone_id_foreign FOREIGN KEY (tax_zone_id) REFERENCES public.metalhub_tax_zones(id);


--
-- Name: metalhub_tax_zone_states metalhub_tax_zone_states_state_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_states
    ADD CONSTRAINT metalhub_tax_zone_states_state_id_foreign FOREIGN KEY (state_id) REFERENCES public.metalhub_states(id);


--
-- Name: metalhub_tax_zone_states metalhub_tax_zone_states_tax_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_tax_zone_states
    ADD CONSTRAINT metalhub_tax_zone_states_tax_zone_id_foreign FOREIGN KEY (tax_zone_id) REFERENCES public.metalhub_tax_zones(id);


--
-- Name: metalhub_transactions metalhub_transactions_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_transactions
    ADD CONSTRAINT metalhub_transactions_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.metalhub_orders(id);


--
-- Name: metalhub_transactions metalhub_transactions_parent_transaction_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_transactions
    ADD CONSTRAINT metalhub_transactions_parent_transaction_id_foreign FOREIGN KEY (parent_transaction_id) REFERENCES public.metalhub_transactions(id);


--
-- Name: metalhub_urls metalhub_urls_language_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metalhub_urls
    ADD CONSTRAINT metalhub_urls_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.metalhub_languages(id);


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

