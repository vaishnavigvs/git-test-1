
SET check_function_bodies = false;
CREATE TABLE public.names (
    number integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);
CREATE SEQUENCE public.names_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.names_number_seq OWNED BY public.names.number;
ALTER TABLE ONLY public.names ALTER COLUMN number SET DEFAULT nextval('public.names_number_seq'::regclass);
ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (number);

CREATE TABLE "public"."addresses" ("address_id" integer NOT NULL, "street" text NOT NULL, "area" text NOT NULL, "pin_code" integer NOT NULL, PRIMARY KEY ("address_id") , FOREIGN KEY ("address_id") REFERENCES "public"."names"("number") ON UPDATE restrict ON DELETE restrict);
