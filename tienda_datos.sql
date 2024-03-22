--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2024-03-21 18:00:21

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
-- TOC entry 228 (class 1259 OID 26123)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    id_bitacora bigint NOT NULL,
    tabla_afectada character varying(60) NOT NULL,
    operacion character varying(10) NOT NULL,
    usuario character varying(15) NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL,
    consulta_realizada text NOT NULL
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26122)
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bitacora_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_id_bitacora_seq OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 227
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;


--
-- TOC entry 222 (class 1259 OID 26057)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria smallint NOT NULL,
    nombre_categoria character varying(25) NOT NULL,
    descripcion character varying(40)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26002)
-- Name: cliente_direcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_direcs (
    id_cliente smallint NOT NULL,
    id_direccion smallint NOT NULL,
    calle character varying(35) NOT NULL,
    numero smallint NOT NULL,
    colonia character varying(20),
    ciudad character varying(20) NOT NULL,
    codigo_postal character(5)
);


ALTER TABLE public.cliente_direcs OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25992)
-- Name: cliente_tels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_tels (
    id_cliente smallint NOT NULL,
    telefono character(10) NOT NULL
);


ALTER TABLE public.cliente_tels OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25987)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente smallint NOT NULL,
    nombre character varying(25) NOT NULL,
    apaterno character varying(20) NOT NULL,
    amaterno character varying(20),
    preferencias character varying(70)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26097)
-- Name: entradas_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entradas_producto (
    id_proveedor smallint NOT NULL,
    id_producto smallint NOT NULL,
    fecha_entrega timestamp without time zone NOT NULL,
    producto_malogrado boolean
);


ALTER TABLE public.entradas_producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26052)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marcas (
    id_marca smallint NOT NULL,
    nombre_marca character varying(30) NOT NULL
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 26012)
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id_pago smallint NOT NULL,
    id_cliente smallint NOT NULL,
    tipo_pago character varying(25),
    banco character varying(25),
    numero_tarjeta character varying(25)
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26062)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto smallint NOT NULL,
    id_marca smallint NOT NULL,
    id_proveedor smallint NOT NULL,
    id_categoria smallint NOT NULL,
    nombre_producto character varying(40) NOT NULL,
    precio numeric(10,2) NOT NULL,
    impuesto numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    descripcion character varying(70)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26042)
-- Name: proveedor_direcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor_direcs (
    id_direccion smallint NOT NULL,
    id_proveedor smallint NOT NULL,
    calle character varying(35) NOT NULL,
    numero smallint NOT NULL,
    colonia character varying(35),
    ciudad character varying(20) NOT NULL,
    codigo_postal character(5)
);


ALTER TABLE public.proveedor_direcs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26112)
-- Name: proveedor_tels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor_tels (
    id_proveedor smallint NOT NULL,
    telefono character(10) NOT NULL
);


ALTER TABLE public.proveedor_tels OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26037)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id_proveedor smallint NOT NULL,
    nombre_proveedor character varying(50) NOT NULL,
    sitio_web character varying(70) NOT NULL
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 26022)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id_venta smallint NOT NULL,
    id_cliente smallint NOT NULL,
    id_pago smallint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    descuento numeric(10,2),
    total_impuesto numeric(10,2),
    monto_final numeric(10,2)
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26082)
-- Name: ventas_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_detalle (
    id_venta smallint NOT NULL,
    id_producto smallint NOT NULL,
    cantidad smallint NOT NULL,
    precio numeric(10,2) NOT NULL,
    parcial numeric(10,2) NOT NULL
);


ALTER TABLE public.ventas_detalle OWNER TO postgres;

--
-- TOC entry 3225 (class 2604 OID 26126)
-- Name: bitacora id_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('public.bitacora_id_bitacora_seq'::regclass);


--
-- TOC entry 3424 (class 0 OID 26123)
-- Dependencies: 228
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (id_bitacora, tabla_afectada, operacion, usuario, fecha_modificacion, consulta_realizada) FROM stdin;
\.


--
-- TOC entry 3418 (class 0 OID 26057)
-- Dependencies: 222
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, nombre_categoria, descripcion) FROM stdin;
1	Lácteos	Productos lácteos y derivados
2	Panadería	Productos de panadería y pastelería
3	Frutas y Verduras	Frutas y verduras frescas
4	Carnes	Carnes frescas y procesadas
5	Bebidas	Bebidas alcohólicas y no alcohólicas
6	Abarrotes	Productos envasados y conservas
7	Limpieza	Productos de limpieza para el hogar
8	Snacks	Botanas y snacks
9	Cuidado Personal	Artículos de higiene y cuidado personal
10	Electrodomésticos	Pequeños electrodomésticos para el hogar
\.


--
-- TOC entry 3412 (class 0 OID 26002)
-- Dependencies: 216
-- Data for Name: cliente_direcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_direcs (id_cliente, id_direccion, calle, numero, colonia, ciudad, codigo_postal) FROM stdin;
1	1	Calle Falsa	123	Centro	Ciudad Real	12345
2	2	Avenida Siempreviva	456	Norte	Ciudad Real	23456
3	3	Calle Nueva	789	Este	Ciudad Real	34567
4	4	Boulevard de los Sueños	101	Sur	Ciudad Real	45678
5	5	Avenida Principal	202	Oeste	Ciudad Real	56789
6	6	Calle Antigua	303	Centro	Ciudad Real	67890
7	7	Camino Largo	404	Norte	Ciudad Real	78901
8	8	Ruta Solar	505	Este	Ciudad Real	89012
9	9	Vía Láctea	606	Sur	Ciudad Real	90123
10	10	Calle de la Amargura	707	Oeste	Ciudad Real	01234
\.


--
-- TOC entry 3411 (class 0 OID 25992)
-- Dependencies: 215
-- Data for Name: cliente_tels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_tels (id_cliente, telefono) FROM stdin;
1	555-1234  
2	555-5678  
3	555-9012  
4	555-3456  
5	555-7890  
6	555-6543  
7	555-9876  
8	555-4321  
9	555-8765  
10	555-2109  
\.


--
-- TOC entry 3410 (class 0 OID 25987)
-- Dependencies: 214
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nombre, apaterno, amaterno, preferencias) FROM stdin;
1	Laura	Martínez	Ruiz	Compra semanal de verduras y frutas
2	Roberto	Gómez	Fernández	Prefiere carnes y lácteos
3	Carmen	Jiménez	Moreno	Compra mensual grande con variedad
4	José	López	Pérez	Interesado en productos de limpieza
5	Patricia	Sánchez	Díaz	Snacks y bebidas para reuniones
6	Miguel	Hernández	García	Lácteos y panadería para el desayuno
7	Ana	González	Santos	Cuidado personal y limpieza
8	Carlos	Ramírez	Vega	Bebidas alcohólicas para eventos
9	Fernanda	Pérez	López	Frutas, verduras y productos veganos
10	Jorge	Ruiz	Martínez	Carnes y snacks para asados
\.


--
-- TOC entry 3421 (class 0 OID 26097)
-- Dependencies: 225
-- Data for Name: entradas_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entradas_producto (id_proveedor, id_producto, fecha_entrega, producto_malogrado) FROM stdin;
1	1	2023-03-01 00:00:00	f
2	2	2023-03-02 00:00:00	f
3	3	2023-03-03 00:00:00	t
4	4	2023-03-04 00:00:00	f
5	5	2023-03-05 00:00:00	f
6	6	2023-03-06 00:00:00	t
7	7	2023-03-07 00:00:00	f
8	8	2023-03-08 00:00:00	f
9	9	2023-03-09 00:00:00	t
10	10	2023-03-10 00:00:00	f
\.


--
-- TOC entry 3417 (class 0 OID 26052)
-- Dependencies: 221
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marcas (id_marca, nombre_marca) FROM stdin;
1	Granja del Valle
2	La Costeña
3	Alpura
4	Bimbo
5	Frutas Selectas
6	Bachoco
7	Jumex
8	Ariel
9	Sabritas
10	Head & Shoulders
\.


--
-- TOC entry 3413 (class 0 OID 26012)
-- Dependencies: 217
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id_pago, id_cliente, tipo_pago, banco, numero_tarjeta) FROM stdin;
1	1	Tarjeta	Banco Estado	1234567890123456
2	2	Efectivo	\N	\N
3	3	Tarjeta	Banco Popular	6543210987654321
4	4	Efectivo	\N	\N
5	5	Tarjeta	Banco de la Nación	1111222233334444
6	6	Efectivo	\N	\N
7	7	Tarjeta	Banco Mercantil	9999888877776666
8	8	Efectivo	\N	\N
9	9	Tarjeta	Banco Provincia	4444555566667777
10	10	Efectivo	\N	\N
\.


--
-- TOC entry 3419 (class 0 OID 26062)
-- Dependencies: 223
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, id_marca, id_proveedor, id_categoria, nombre_producto, precio, impuesto, stock, descripcion) FROM stdin;
1	1	1	1	Leche Entera 1L	19.99	0.16	100	Leche entera pasteurizada de 1 litro
2	2	2	2	Pan Multigrano 500g	29.99	0.16	50	Pan multigrano orgánico en paquete de 500g
3	3	3	3	Manzanas Golden 1kg	34.99	0.08	75	Manzanas Golden, paquete de 1kg
4	4	4	4	Pechuga de Pollo 1kg	49.99	0.16	50	Pechuga de pollo sin hueso, 1kg
5	5	5	5	Jugo de Naranja 1L	14.99	0.08	100	Jugo de naranja natural sin azúcar añadido, 1 litro
6	6	6	6	Cereal de Maíz 500g	24.99	0.16	80	Cereal de maíz tostado y endulzado, 500g
7	7	7	7	Yogurt Griego 150g	9.99	0.08	120	Yogurt griego natural sin grasa, 150g
8	8	8	8	Papas Fritas 200g	15.99	0.16	60	Papas fritas crujientes con sal, paquete de 200g
9	9	9	9	Agua Mineral 1L	10.99	0.08	200	Agua mineral natural sin gas, botella de 1L
10	10	10	10	Chocolate Amargo 100g	22.99	0.16	90	Chocolate amargo 70% cacao, tableta de 100g
\.


--
-- TOC entry 3416 (class 0 OID 26042)
-- Dependencies: 220
-- Data for Name: proveedor_direcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor_direcs (id_direccion, id_proveedor, calle, numero, colonia, ciudad, codigo_postal) FROM stdin;
11	1	Avenida de la Industria	100	Zona Industrial	Ciudad Comercio	12345
12	2	Calle del Progreso	200	Zona Comercial	Ciudad Comercio	23456
13	3	Boulevard Empresarial	300	Parque Industrial	Ciudad Comercio	34567
14	4	Callejón del Comercio	400	Centro Comercial	Ciudad Comercio	45678
15	5	Ruta de la Exportación	500	Puerto Comercial	Ciudad Comercio	56789
16	6	Camino a la Fábrica	600	Zona Industrial	Ciudad Comercio	67890
17	7	Vía del Transporte	700	Logística	Ciudad Comercio	78901
18	8	Pasaje del Abasto	800	Mercado Central	Ciudad Comercio	89012
19	9	Trayecto de la Distribución	900	Distribuidora	Ciudad Comercio	90123
20	10	Ronda de Negocios	1000	Negocios Internacionales	Ciudad Comercio	01234
\.


--
-- TOC entry 3422 (class 0 OID 26112)
-- Dependencies: 226
-- Data for Name: proveedor_tels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor_tels (id_proveedor, telefono) FROM stdin;
1	655-1001  
2	655-2002  
3	655-3003  
4	655-4004  
5	655-5005  
6	655-6006  
7	655-7007  
8	655-8008  
9	655-9009  
10	655-1010  
\.


--
-- TOC entry 3415 (class 0 OID 26037)
-- Dependencies: 219
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id_proveedor, nombre_proveedor, sitio_web) FROM stdin;
1	Distribuidora Los Campos	http://www.loscampos.com
2	Productos La Finca	http://www.lafinca.com
3	Lácteos El Ranchero	http://www.elranchero.com
4	Panadería San José	http://www.sanjosepan.com
5	Verduras y Frutas Frescas	http://www.frescura.com
6	Carnes San Martín	http://www.sanmartincarnes.com
7	Bebidas Naturales	http://www.naturalesbebidas.com
8	LimpioMás	http://www.limpiomas.com
9	SnackLand	http://www.snackland.com
10	PersonalCare	http://www.personalcare.com
\.


--
-- TOC entry 3414 (class 0 OID 26022)
-- Dependencies: 218
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id_venta, id_cliente, id_pago, fecha, descuento, total_impuesto, monto_final) FROM stdin;
1	1	1	2023-03-01 00:00:00	5.00	\N	\N
2	2	2	2023-03-05 00:00:00	0.00	\N	\N
3	3	3	2023-03-10 00:00:00	10.00	\N	\N
4	4	4	2023-03-15 00:00:00	0.00	\N	\N
5	5	5	2023-03-20 00:00:00	15.00	\N	\N
6	6	6	2023-03-25 00:00:00	0.00	\N	\N
7	7	7	2023-03-30 00:00:00	10.00	\N	\N
8	8	8	2023-04-04 00:00:00	20.00	\N	\N
9	9	9	2023-04-09 00:00:00	0.00	\N	\N
10	10	10	2023-04-14 00:00:00	5.00	\N	\N
\.


--
-- TOC entry 3420 (class 0 OID 26082)
-- Dependencies: 224
-- Data for Name: ventas_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_detalle (id_venta, id_producto, cantidad, precio, parcial) FROM stdin;
1	1	2	20.00	40.00
1	3	1	15.00	15.00
2	2	3	30.00	90.00
2	4	2	25.00	50.00
3	5	4	10.00	40.00
3	6	1	80.00	80.00
4	7	2	12.00	24.00
4	8	1	100.00	100.00
5	9	3	5.00	15.00
5	10	2	50.00	100.00
6	1	1	20.00	20.00
7	2	2	30.00	60.00
8	3	3	15.00	45.00
9	4	4	25.00	100.00
10	5	5	10.00	50.00
\.


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 227
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 1, false);


--
-- TOC entry 3243 (class 2606 OID 26061)
-- Name: categorias pk_categorias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (id_categoria);


--
-- TOC entry 3231 (class 2606 OID 26006)
-- Name: cliente_direcs pk_clien_direcs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_direcs
    ADD CONSTRAINT pk_clien_direcs PRIMARY KEY (id_direccion, id_cliente);


--
-- TOC entry 3229 (class 2606 OID 25996)
-- Name: cliente_tels pk_clien_tels; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_tels
    ADD CONSTRAINT pk_clien_tels PRIMARY KEY (id_cliente, telefono);


--
-- TOC entry 3227 (class 2606 OID 25991)
-- Name: clientes pk_clientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (id_cliente);


--
-- TOC entry 3249 (class 2606 OID 26101)
-- Name: entradas_producto pk_entradas_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT pk_entradas_producto PRIMARY KEY (id_proveedor, id_producto, fecha_entrega);


--
-- TOC entry 3253 (class 2606 OID 26130)
-- Name: bitacora pk_id_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT pk_id_bitacora PRIMARY KEY (id_bitacora);


--
-- TOC entry 3241 (class 2606 OID 26056)
-- Name: marcas pk_marcas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT pk_marcas PRIMARY KEY (id_marca);


--
-- TOC entry 3233 (class 2606 OID 26016)
-- Name: pagos pk_pagos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pk_pagos PRIMARY KEY (id_pago);


--
-- TOC entry 3245 (class 2606 OID 26066)
-- Name: productos pk_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (id_producto);


--
-- TOC entry 3239 (class 2606 OID 26046)
-- Name: proveedor_direcs pk_proveedor_direcs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_direcs
    ADD CONSTRAINT pk_proveedor_direcs PRIMARY KEY (id_direccion, id_proveedor);


--
-- TOC entry 3251 (class 2606 OID 26116)
-- Name: proveedor_tels pk_proveedor_tels; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_tels
    ADD CONSTRAINT pk_proveedor_tels PRIMARY KEY (id_proveedor, telefono);


--
-- TOC entry 3237 (class 2606 OID 26041)
-- Name: proveedores pk_proveedores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (id_proveedor);


--
-- TOC entry 3235 (class 2606 OID 26026)
-- Name: ventas pk_ventas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT pk_ventas PRIMARY KEY (id_venta);


--
-- TOC entry 3247 (class 2606 OID 26086)
-- Name: ventas_detalle pk_ventas_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT pk_ventas_detalle PRIMARY KEY (id_venta, id_producto);


--
-- TOC entry 3255 (class 2606 OID 26007)
-- Name: cliente_direcs fk_clientes_cliente_direcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_direcs
    ADD CONSTRAINT fk_clientes_cliente_direcs FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 3254 (class 2606 OID 25997)
-- Name: cliente_tels fk_clientes_cliente_tels; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_tels
    ADD CONSTRAINT fk_clientes_cliente_tels FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 3265 (class 2606 OID 26107)
-- Name: entradas_producto fk_entradas_producto_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT fk_entradas_producto_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 3266 (class 2606 OID 26102)
-- Name: entradas_producto fk_entradas_producto_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas_producto
    ADD CONSTRAINT fk_entradas_producto_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


--
-- TOC entry 3256 (class 2606 OID 26017)
-- Name: pagos fk_pagos_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT fk_pagos_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 3260 (class 2606 OID 26077)
-- Name: productos fk_productos_categorias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- TOC entry 3261 (class 2606 OID 26067)
-- Name: productos fk_productos_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_marca FOREIGN KEY (id_marca) REFERENCES public.marcas(id_marca);


--
-- TOC entry 3262 (class 2606 OID 26072)
-- Name: productos fk_productos_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


--
-- TOC entry 3259 (class 2606 OID 26047)
-- Name: proveedor_direcs fk_proveedor_direcs_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_direcs
    ADD CONSTRAINT fk_proveedor_direcs_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


--
-- TOC entry 3267 (class 2606 OID 26117)
-- Name: proveedor_tels fk_proveedor_tels_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor_tels
    ADD CONSTRAINT fk_proveedor_tels_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


--
-- TOC entry 3257 (class 2606 OID 26027)
-- Name: ventas fk_ventas_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 3263 (class 2606 OID 26092)
-- Name: ventas_detalle fk_ventas_detalle_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT fk_ventas_detalle_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 3264 (class 2606 OID 26087)
-- Name: ventas_detalle fk_ventas_detalle_ventas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT fk_ventas_detalle_ventas FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta);


--
-- TOC entry 3258 (class 2606 OID 26032)
-- Name: ventas fk_ventas_pagos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_pagos FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago);


-- Completed on 2024-03-21 18:00:21

--
-- PostgreSQL database dump complete
--

