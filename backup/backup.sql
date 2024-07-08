--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: itkui_learning_local; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA itkui_learning_local;


ALTER SCHEMA itkui_learning_local OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: billboard; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.billboard (
    id text NOT NULL,
    "storeId" text NOT NULL,
    label text NOT NULL,
    "imageUrl" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE itkui_learning_local.billboard OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.category (
    id text NOT NULL,
    "storeId" text NOT NULL,
    "billboardId" text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.category OWNER TO postgres;

--
-- Name: color; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.color (
    id text NOT NULL,
    "storeId" text NOT NULL,
    name text NOT NULL,
    value text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.color OWNER TO postgres;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE itkui_learning_local.flyway_schema_history OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.image (
    id text NOT NULL,
    "productId" text NOT NULL,
    url text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.image OWNER TO postgres;

--
-- Name: keep_alive; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.keep_alive (
    id bigint NOT NULL,
    name text DEFAULT ''::text,
    random uuid DEFAULT gen_random_uuid()
);


ALTER TABLE itkui_learning_local.keep_alive OWNER TO postgres;

--
-- Name: keep_alive_id_seq; Type: SEQUENCE; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE itkui_learning_local.keep_alive ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME itkui_learning_local.keep_alive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local."order" (
    id text NOT NULL,
    "storeId" text NOT NULL,
    "isPaid" boolean DEFAULT false NOT NULL,
    phone text DEFAULT ''::text NOT NULL,
    address text DEFAULT ''::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local."order" OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.order_item (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "productId" text NOT NULL
);


ALTER TABLE itkui_learning_local.order_item OWNER TO postgres;

--
-- Name: permission; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.permission (
    permission_id integer NOT NULL,
    permission_name character varying(50) NOT NULL
);


ALTER TABLE itkui_learning_local.permission OWNER TO postgres;

--
-- Name: permission_permission_id_seq; Type: SEQUENCE; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE itkui_learning_local.permission ALTER COLUMN permission_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME itkui_learning_local.permission_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.product (
    id text NOT NULL,
    "storeId" text NOT NULL,
    "categoryId" text NOT NULL,
    name text NOT NULL,
    price numeric(65,30) NOT NULL,
    "isFeatured" boolean DEFAULT false NOT NULL,
    "isArchived" boolean DEFAULT false NOT NULL,
    "sizeId" text NOT NULL,
    "colorId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.product OWNER TO postgres;

--
-- Name: role_permission; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.role_permission (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE itkui_learning_local.role_permission OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.roles (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE itkui_learning_local.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE itkui_learning_local.roles ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME itkui_learning_local.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: size; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.size (
    id text NOT NULL,
    "storeId" text NOT NULL,
    name text NOT NULL,
    value text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.size OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.store (
    id text NOT NULL,
    name text NOT NULL,
    "userId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE itkui_learning_local.store OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character(64) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE itkui_learning_local.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: itkui_learning_local; Owner: postgres
--

CREATE TABLE itkui_learning_local.users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE itkui_learning_local.users_roles OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE itkui_learning_local.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME itkui_learning_local.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: billboard; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.billboard (id, "storeId", label, "imageUrl", "updatedAt", "createdAt") FROM stdin;
54498c8e-6b67-4ab2-b3f7-8f1785f8b7d0	53531b7f-ad43-4bbf-a97f-f8b186d9f80a	- GitHub	https://res.cloudinary.com/didoxyooo/image/upload/v1719636305/nbkjgmauuy9bhkx4eo1e.png	2024-06-29 04:45:16.902	2024-06-30 04:00:33.272
a585671c-c94a-4ebb-aa9c-02b57e15b5c3	53531b7f-ad43-4bbf-a97f-f8b186d9f80a	Subtopic 1 (Learn the Basics)	https://res.cloudinary.com/didoxyooo/image/upload/v1719647621/z7clvilmeewhswu9z2zg.png	2024-06-29 07:53:50.044	2024-06-30 04:00:33.272
24acfcec-c24b-4153-82a2-d51aa1c05ba1	8920f40b-5ca6-46b3-98eb-c5ffc47b5c53	cxz	https://res.cloudinary.com/didoxyooo/image/upload/v1719655915/awuq79yshcsax16cfpku.png	2024-06-29 10:11:58.969	2024-06-30 04:00:33.272
6333c72e-b931-4631-89ff-ccfc717b480e	8920f40b-5ca6-46b3-98eb-c5ffc47b5c53	ssss22009	https://res.cloudinary.com/didoxyooo/image/upload/v1719656571/h0cjrmkrpfkrllkgljwo.png	2024-06-29 10:23:15.151	2024-06-30 04:00:33.272
49a20a78-1f98-4cee-8489-3cad062c37a0	f96d5257-3d64-4b3f-852e-62a6c57f9790	First Headline	https://res.cloudinary.com/didoxyooo/image/upload/v1719926506/zmiry1et5jfgnieskiwq.jpg	2024-07-02 13:22:04.451	2024-06-30 04:00:33.272
8f92d6e9-2ee6-4e80-8b9b-ebf481dedfa7	f96d5257-3d64-4b3f-852e-62a6c57f9790	Call to Action T1	https://res.cloudinary.com/didoxyooo/image/upload/v1719926617/f3vokuvro33hcoi1opyv.png	2024-07-03 23:00:03.55	2024-06-30 04:00:33.272
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.category (id, "storeId", "billboardId", name, "createdAt", "updatedAt") FROM stdin;
47d82d16-077b-430b-b4aa-48026b658283	f96d5257-3d64-4b3f-852e-62a6c57f9790	8f92d6e9-2ee6-4e80-8b9b-ebf481dedfa7	Software	2024-06-30 04:03:07.093	2024-06-30 08:00:41.869
42156055-c00c-4fb3-b55b-43bdf0a2c3ea	f96d5257-3d64-4b3f-852e-62a6c57f9790	49a20a78-1f98-4cee-8489-3cad062c37a0	Accessories	2024-06-29 16:21:11.653	2024-06-30 08:00:53.395
3b81c5d7-96f4-4336-89e1-236d710ab791	f96d5257-3d64-4b3f-852e-62a6c57f9790	49a20a78-1f98-4cee-8489-3cad062c37a0	Keyboard	2024-07-02 01:08:55.888	2024-07-02 01:08:55.888
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.color (id, "storeId", name, value, "createdAt", "updatedAt") FROM stdin;
196420d5-2811-4013-bf74-819d1d267959	f96d5257-3d64-4b3f-852e-62a6c57f9790	Black	#000	2024-06-30 02:21:27.35	2024-06-30 07:56:03.845
1464c4f4-d0c9-44fa-bf74-cc2bfc4fb6aa	f96d5257-3d64-4b3f-852e-62a6c57f9790	White	#fff	2024-06-30 02:21:11.884	2024-06-30 07:56:15.621
a54a41b6-7c13-4e03-a409-2294364eafd2	f96d5257-3d64-4b3f-852e-62a6c57f9790	Red	#f00	2024-06-30 07:56:37.688	2024-06-30 07:56:37.688
e8187bb9-35ae-4d16-8fd2-514726bc9fc4	f96d5257-3d64-4b3f-852e-62a6c57f9790	Blue	#0096FF	2024-06-30 07:57:10.232	2024-06-30 07:57:41.707
7b95a89a-2c48-4d3a-a5cd-c4891d40cdde	f96d5257-3d64-4b3f-852e-62a6c57f9790	Green	#AAFF00	2024-06-30 07:58:22.72	2024-06-30 07:58:22.72
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"itkui_learning_local"	\N	postgres	2024-06-29 05:06:14.808238	0	t
1	1.0	baseline	SQL	V1_0__baseline.sql	-227535741	postgres	2024-06-29 05:06:14.881567	202	t
2	1.1	keep alive-db	SQL	V1_1__keep_alive-db.sql	528078855	postgres	2024-06-29 05:06:15.182408	29	t
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.image (id, "productId", url, "createdAt", "updatedAt") FROM stdin;
4135e6b0-f8ff-4cef-b02b-3c3c45e00d01	535633c5-9b97-42b3-ae32-cdc203b23955	https://res.cloudinary.com/didoxyooo/image/upload/v1719734657/xidqhgxgcmvkiac2t9wq.webp	2024-06-30 08:10:52.952	2024-06-30 08:10:52.952
8a68f129-5b1e-477f-b274-5e625330645a	b6ee32f9-43bc-400c-9ade-455167ebc71b	https://res.cloudinary.com/didoxyooo/image/upload/v1719735253/gpdip0ne8sjni1rrzfev.jpg	2024-06-30 08:15:11.554	2024-06-30 08:15:11.554
735ffdf3-be80-4f07-b8fa-30b2a1c97eb2	b6ee32f9-43bc-400c-9ade-455167ebc71b	https://res.cloudinary.com/didoxyooo/image/upload/v1719735302/uflsmi46f8twtfxit4sk.webp	2024-06-30 08:15:11.554	2024-06-30 08:15:11.554
f2301e97-9386-4181-87c2-5a094a4582de	b6ee32f9-43bc-400c-9ade-455167ebc71b	https://res.cloudinary.com/didoxyooo/image/upload/v1719735308/ldj8r4tboknb1qlxmzcg.jpg	2024-06-30 08:15:11.554	2024-06-30 08:15:11.554
6526db21-943b-4983-ac74-23955ef0c879	4cfe1fcd-f621-4116-b09a-f648a2469cf8	https://res.cloudinary.com/didoxyooo/image/upload/v1720012611/guv9qkgedwfkbngmivm2.jpg	2024-07-03 13:17:01.417	2024-07-03 13:17:01.417
\.


--
-- Data for Name: keep_alive; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.keep_alive (id, name, random) FROM stdin;
1	itkui_learning_keep_alive	5e92d189-b09d-4831-b860-e84555691272
2	itkui_random_connection	c0a2f436-aef0-44f4-bf0d-1b2c517be10c
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local."order" (id, "storeId", "isPaid", phone, address, "createdAt", "updatedAt") FROM stdin;
9cd6d5e0-a3af-43f1-9972-6045a8046094	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:34:05.692	2024-07-06 12:34:05.692
27f86a94-2dc1-400a-ab12-cb22a9b98266	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:36:28.035	2024-07-06 12:36:28.035
dc1d1649-dde6-41c1-84df-346344d25ed8	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:37:02.093	2024-07-06 12:37:02.093
ae17e470-acb3-4344-8af6-aaa4bf0cbc72	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:37:46.401	2024-07-06 12:37:46.401
bac2a329-6330-4143-a3b7-3275ae4fb938	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:38:10.992	2024-07-06 12:38:10.992
21df4151-7162-47ad-b7d3-6c673defd506	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:38:26.153	2024-07-06 12:38:26.153
72ad76aa-80e7-44be-88e4-b55c1778203b	f96d5257-3d64-4b3f-852e-62a6c57f9790	f			2024-07-06 12:38:54.156	2024-07-06 12:38:54.156
476917a8-b5f4-4c8b-a486-0d36e7f64bbb	f96d5257-3d64-4b3f-852e-62a6c57f9790	t	+84332222222	fdsaf, csxazm, fdsam, Bình Phước, 95132, VN	2024-07-06 14:04:34.94	2024-07-06 14:06:25.204
fa398302-0616-4db7-86e8-0af4e93b76ed	f96d5257-3d64-4b3f-852e-62a6c57f9790	t	+84912222222	dsad, dfsad, Cà Mau, 222, VN	2024-01-06 14:11:52.51	2024-07-06 14:12:54.697
ce17f4e2-23d6-466f-925b-4fbe697b08ce	f96d5257-3d64-4b3f-852e-62a6c57f9790	t	+84932222228	gf, gf, Đồng Nai, 3233, VN	2024-07-06 18:34:45.607	2024-07-06 18:35:48.528
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.order_item (id, "orderId", "productId") FROM stdin;
e866a646-cbf3-443b-a533-644eb74ea807	9cd6d5e0-a3af-43f1-9972-6045a8046094	4cfe1fcd-f621-4116-b09a-f648a2469cf8
c9d9ac27-5578-4b59-b0b2-39e77f6582d5	27f86a94-2dc1-400a-ab12-cb22a9b98266	4cfe1fcd-f621-4116-b09a-f648a2469cf8
c7757c3b-d480-4cff-a84d-14a0ac5e36a9	dc1d1649-dde6-41c1-84df-346344d25ed8	4cfe1fcd-f621-4116-b09a-f648a2469cf8
35f7c613-4b29-4bb7-9389-8cb05e576c11	ae17e470-acb3-4344-8af6-aaa4bf0cbc72	4cfe1fcd-f621-4116-b09a-f648a2469cf8
7d7c0fa7-9f77-4997-9ef3-cd0d481b388d	bac2a329-6330-4143-a3b7-3275ae4fb938	4cfe1fcd-f621-4116-b09a-f648a2469cf8
676fb484-a03b-409a-9c9a-28692c8cb91e	21df4151-7162-47ad-b7d3-6c673defd506	4cfe1fcd-f621-4116-b09a-f648a2469cf8
1b235a27-d25c-4523-8b19-e86425a44313	72ad76aa-80e7-44be-88e4-b55c1778203b	4cfe1fcd-f621-4116-b09a-f648a2469cf8
4e147c3f-263c-421b-9e8d-70ee49cf06e1	476917a8-b5f4-4c8b-a486-0d36e7f64bbb	b6ee32f9-43bc-400c-9ade-455167ebc71b
86ad0561-8ec5-42ce-a057-5863d990dae5	476917a8-b5f4-4c8b-a486-0d36e7f64bbb	4cfe1fcd-f621-4116-b09a-f648a2469cf8
d82638d0-e72a-4299-a25f-078ccf635f32	fa398302-0616-4db7-86e8-0af4e93b76ed	b6ee32f9-43bc-400c-9ade-455167ebc71b
b0e6100e-5941-43b3-8fb1-43f79204a060	ce17f4e2-23d6-466f-925b-4fbe697b08ce	4cfe1fcd-f621-4116-b09a-f648a2469cf8
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.permission (permission_id, permission_name) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.product (id, "storeId", "categoryId", name, price, "isFeatured", "isArchived", "sizeId", "colorId", "createdAt", "updatedAt") FROM stdin;
535633c5-9b97-42b3-ae32-cdc203b23955	f96d5257-3d64-4b3f-852e-62a6c57f9790	47d82d16-077b-430b-b4aa-48026b658283	 Antivirus	23423.000000000000000000000000000000	t	f	9e062c2b-cbba-4706-aeb0-053e6a0d5fcf	196420d5-2811-4013-bf74-819d1d267959	2024-06-30 08:04:20.554	2024-06-30 08:10:52.933
b6ee32f9-43bc-400c-9ade-455167ebc71b	f96d5257-3d64-4b3f-852e-62a6c57f9790	42156055-c00c-4fb3-b55b-43bdf0a2c3ea	Home Office PC	9999.000000000000000000000000000000	t	t	4a7ac8c4-435f-4d11-baa2-df28efc9fa79	7b95a89a-2c48-4d3a-a5cd-c4891d40cdde	2024-06-30 08:15:11.554	2024-07-06 14:12:54.707
4cfe1fcd-f621-4116-b09a-f648a2469cf8	f96d5257-3d64-4b3f-852e-62a6c57f9790	47d82d16-077b-430b-b4aa-48026b658283	iPhone 15 Pro Max	999.000000000000000000000000000000	t	t	9e062c2b-cbba-4706-aeb0-053e6a0d5fcf	a54a41b6-7c13-4e03-a409-2294364eafd2	2024-07-03 13:17:01.417	2024-07-06 18:35:48.667
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.role_permission (role_id, permission_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.roles (role_id, role_name) FROM stdin;
\.


--
-- Data for Name: size; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.size (id, "storeId", name, value, "createdAt", "updatedAt") FROM stdin;
4a7ac8c4-435f-4d11-baa2-df28efc9fa79	f96d5257-3d64-4b3f-852e-62a6c57f9790	Mid-Tower	20%	2024-06-30 02:16:59.757	2024-06-30 07:59:15.239
9e062c2b-cbba-4706-aeb0-053e6a0d5fcf	f96d5257-3d64-4b3f-852e-62a6c57f9790	Full-Tower	100%	2024-06-30 01:44:34.945	2024-06-30 07:59:29.526
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.store (id, name, "userId", "createdAt", "updatedAt") FROM stdin;
8920f40b-5ca6-46b3-98eb-c5ffc47b5c53	itkui sandan store	user_2hubn3RRhSaV7tJjS2A7jPbpFgM	2024-06-28 22:33:37.876	2024-06-28 22:33:37.876
53531b7f-ad43-4bbf-a97f-f8b186d9f80a	alofdsadf	user_2hubn3RRhSaV7tJjS2A7jPbpFgM	2024-06-29 04:44:42.898	2024-06-29 04:44:42.898
f96d5257-3d64-4b3f-852e-62a6c57f9790	ITKui-Learning	user_2iYGFfj0VBNuOqGQDoZcVZxEpUP	2024-06-29 11:20:03.981	2024-06-30 12:56:56.935
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.users (user_id, username, password_hash, first_name, last_name, email, is_active) FROM stdin;
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: itkui_learning_local; Owner: postgres
--

COPY itkui_learning_local.users_roles (user_id, role_id) FROM stdin;
\.


--
-- Name: keep_alive_id_seq; Type: SEQUENCE SET; Schema: itkui_learning_local; Owner: postgres
--

SELECT pg_catalog.setval('itkui_learning_local.keep_alive_id_seq', 2, true);


--
-- Name: permission_permission_id_seq; Type: SEQUENCE SET; Schema: itkui_learning_local; Owner: postgres
--

SELECT pg_catalog.setval('itkui_learning_local.permission_permission_id_seq', 1, false);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: itkui_learning_local; Owner: postgres
--

SELECT pg_catalog.setval('itkui_learning_local.roles_role_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: itkui_learning_local; Owner: postgres
--

SELECT pg_catalog.setval('itkui_learning_local.users_user_id_seq', 1, false);


--
-- Name: billboard billboard_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.billboard
    ADD CONSTRAINT billboard_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: keep_alive keep_alive_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.keep_alive
    ADD CONSTRAINT keep_alive_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: permission permission_permission_name_key; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.permission
    ADD CONSTRAINT permission_permission_name_key UNIQUE (permission_name);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: role_permission role_permission_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- Name: size size_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- Name: users unique_email; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: permission unique_permission_id; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.permission
    ADD CONSTRAINT unique_permission_id UNIQUE (permission_id);


--
-- Name: permission unique_permission_name; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.permission
    ADD CONSTRAINT unique_permission_name UNIQUE (permission_name);


--
-- Name: roles unique_role_id; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.roles
    ADD CONSTRAINT unique_role_id UNIQUE (role_id);


--
-- Name: roles unique_role_name; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.roles
    ADD CONSTRAINT unique_role_name UNIQUE (role_name);


--
-- Name: users unique_user_id; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users
    ADD CONSTRAINT unique_user_id UNIQUE (user_id);


--
-- Name: users unique_username; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: billboard_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "billboard_storeId_idx" ON itkui_learning_local.billboard USING btree ("storeId");


--
-- Name: category_billboardId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "category_billboardId_idx" ON itkui_learning_local.category USING btree ("billboardId");


--
-- Name: category_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "category_storeId_idx" ON itkui_learning_local.category USING btree ("storeId");


--
-- Name: color_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "color_storeId_idx" ON itkui_learning_local.color USING btree ("storeId");


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON itkui_learning_local.flyway_schema_history USING btree (success);


--
-- Name: image_productId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "image_productId_idx" ON itkui_learning_local.image USING btree ("productId");


--
-- Name: order_item_orderId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "order_item_orderId_idx" ON itkui_learning_local.order_item USING btree ("orderId");


--
-- Name: order_item_productId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "order_item_productId_idx" ON itkui_learning_local.order_item USING btree ("productId");


--
-- Name: order_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "order_storeId_idx" ON itkui_learning_local."order" USING btree ("storeId");


--
-- Name: product_categoryId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "product_categoryId_idx" ON itkui_learning_local.product USING btree ("categoryId");


--
-- Name: product_colorId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "product_colorId_idx" ON itkui_learning_local.product USING btree ("colorId");


--
-- Name: product_sizeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "product_sizeId_idx" ON itkui_learning_local.product USING btree ("sizeId");


--
-- Name: product_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "product_storeId_idx" ON itkui_learning_local.product USING btree ("storeId");


--
-- Name: size_storeId_idx; Type: INDEX; Schema: itkui_learning_local; Owner: postgres
--

CREATE INDEX "size_storeId_idx" ON itkui_learning_local.size USING btree ("storeId");


--
-- Name: billboard billboard_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.billboard
    ADD CONSTRAINT "billboard_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: category category_billboardId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.category
    ADD CONSTRAINT "category_billboardId_fkey" FOREIGN KEY ("billboardId") REFERENCES itkui_learning_local.billboard(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: category category_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.category
    ADD CONSTRAINT "category_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: color color_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.color
    ADD CONSTRAINT "color_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: image image_productId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.image
    ADD CONSTRAINT "image_productId_fkey" FOREIGN KEY ("productId") REFERENCES itkui_learning_local.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item order_item_orderId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.order_item
    ADD CONSTRAINT "order_item_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES itkui_learning_local."order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_item order_item_productId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.order_item
    ADD CONSTRAINT "order_item_productId_fkey" FOREIGN KEY ("productId") REFERENCES itkui_learning_local.product(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order order_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local."order"
    ADD CONSTRAINT "order_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product product_categoryId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.product
    ADD CONSTRAINT "product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES itkui_learning_local.category(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product product_colorId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.product
    ADD CONSTRAINT "product_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES itkui_learning_local.color(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product product_sizeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.product
    ADD CONSTRAINT "product_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES itkui_learning_local.size(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product product_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.product
    ADD CONSTRAINT "product_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: role_permission role_permission_permission_id_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.role_permission
    ADD CONSTRAINT role_permission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES itkui_learning_local.permission(permission_id);


--
-- Name: role_permission role_permission_role_id_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.role_permission
    ADD CONSTRAINT role_permission_role_id_fkey FOREIGN KEY (role_id) REFERENCES itkui_learning_local.roles(role_id);


--
-- Name: size size_storeId_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.size
    ADD CONSTRAINT "size_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES itkui_learning_local.store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: users_roles users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES itkui_learning_local.roles(role_id);


--
-- Name: users_roles users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: itkui_learning_local; Owner: postgres
--

ALTER TABLE ONLY itkui_learning_local.users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES itkui_learning_local.users(user_id);


--
-- PostgreSQL database dump complete
--

