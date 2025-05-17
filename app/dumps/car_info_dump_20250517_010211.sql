--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Debian 14.18-1.pgdg120+1)
-- Dumped by pg_dump version 15.12 (Debian 15.12-0+deb12u2)

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
-- Name: car_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_info (
    url character varying NOT NULL,
    title character varying,
    price_usd integer,
    odometer integer,
    username character varying,
    phone_number character varying,
    image_url character varying,
    images_count integer,
    car_number character varying,
    car_vin character varying,
    datetime_found timestamp with time zone
);


ALTER TABLE public.car_info OWNER TO postgres;

--
-- Data for Name: car_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_info (url, title, price_usd, odometer, username, phone_number, image_url, images_count, car_number, car_vin, datetime_found) FROM stdin;
https://auto.ria.com/uk/auto_porsche_cayenne_38301045.html	Porsche Cayenne 2020	78700	127000	Сергій Станіславович	(067) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_cayenne__598903225f.jpg	213	None	WP1ZZZ9YZLDA30886	2025-05-17 01:01:56.758264+00
https://auto.ria.com/uk/auto_toyota_carina_e_38306605.html	Toyota Carina E 1994	4900	87000	Ім’я не вказане	(063) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_carina-e__599077272f.jpg	84	None	None	2025-05-17 01:01:57.67307+00
https://auto.ria.com/uk/auto_volkswagen_touareg_38304867.html	Volkswagen Touareg 2021	59800	96000	Ілта TRADE-IN	(066) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_touareg__599022666f.jpg	20	KA 0142 PH	WVGZZZCRZMD027931	2025-05-17 01:01:57.928056+00
https://auto.ria.com/uk/auto_audi_q7_38163822.html	Audi Q7 2018	34500	93000	Олег	(067) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q7__595153577f.jpg	44	None	None	2025-05-17 01:01:58.15434+00
https://auto.ria.com/uk/auto_volkswagen_tiguan_38285805.html	Volkswagen Tiguan 2012	14800	225000	Slavik	(067) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__598529471f.jpg	99	CA 1363 KC	WVGZZZ5NZDW054361	2025-05-17 01:01:58.337556+00
https://auto.ria.com/uk/auto_toyota_highlander_38244010.html	Toyota Highlander 2023	44900	37000	Артур	(066) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_highlander__597405073f.jpg	25	None	None	2025-05-17 01:01:58.693294+00
https://auto.ria.com/uk/auto_mercedes_benz_gle_class_37313531.html	Mercedes-Benz GLE-Class 2019	49400	147000	Руслан	(067) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_gle-class__571496523f.jpg	33	AE 0999 KC	4JGFB5KB9LA015896	2025-05-17 01:01:59.036596+00
https://auto.ria.com/uk/auto_volkswagen_tiguan_38305278.html	Volkswagen Tiguan 2020	31950	117000	Руслан Дорошенко	(093) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__599035693f.jpg	42	KA 5006 PE	WVGZZZ5NxMWxxxx92	2025-05-17 01:01:59.193936+00
https://auto.ria.com/uk/auto_volkswagen_touareg_38001466.html	Volkswagen Touareg 2016	32900	168000	Ін Карс	(097) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_touareg__590592543f.jpg	67	None	WVGZZZ7PxGDxxxx92	2025-05-17 01:01:58.521005+00
https://auto.ria.com/uk/auto_audi_a8_36990078.html	Audi A8 2019	61000	60000	Яків	(093) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/audi_a8__562431427f.jpg	34	AB 4617 KO	WAU8EAF82KN025007	2025-05-17 01:01:58.870244+00
https://auto.ria.com/uk/auto_bmw_x5_38305989.html	BMW X5 2011	19999	140000	Сергей	(067) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__599056293f.jpg	55	KA 5050 KI	5UXZW0C5xBLxxxx76	2025-05-17 01:02:01.724777+00
https://auto.ria.com/uk/auto_porsche_cayenne_38033967.html	Porsche Cayenne 2018	50750	114000	Антон Кот	(050) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/porsche_cayenne__591494478f.jpg	56	KA 2150 OX	WP1AB2AY1KDA62144	2025-05-17 01:02:01.944636+00
https://auto.ria.com/uk/auto_skoda_octavia_38284907.html	Skoda Octavia 2020	17300	175000	IZI AUTO LUTSK	(097) xxx-xx-xx	https://img.youtube.com/vi/23jdeT5IJFc/default.jpg	92	None	None	2025-05-17 01:02:02.211175+00
https://auto.ria.com/uk/auto_neta_u_pro_400_36871296.html	Neta U Pro 400 2022	14900	50000	Владимир	(067) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/neta_u-pro-400__559249256f.jpg	25	AI 0516 YA	LUZBGAFB4NA019480	2025-05-17 01:02:02.443918+00
https://auto.ria.com/uk/auto_mercedes_benz_s_class_38302455.html	Mercedes-Benz S-Class 2017	44900	218000	Mihail Bilanici	(097) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__598960425f.jpg	29	AT 0044 CH	WDDUG6GB2JA356135	2025-05-17 01:02:02.601591+00
https://auto.ria.com/uk/auto_bmw_3_series_38277391.html	BMW 3 Series 2015	12600	238000	Яков	(093) xxx-xx-xx	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_3-series__598610784f.jpg	25	KA 2169 EX	WBA3X5C56FD561735	2025-05-17 01:02:02.739611+00
https://auto.ria.com/uk/auto_toyota_corolla_37697615.html	Toyota Corolla 2008	6999	162000	Степан	(098) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_corolla__582112735f.jpg	51	None	None	2025-05-17 01:02:02.900785+00
https://auto.ria.com/uk/auto_mercedes_benz_s_class_37719144.html	Mercedes-Benz S-Class 2015	105000	115000	Микола Вогнивий	(097) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__582701193f.jpg	15	AB 6666 CM	WDDXJ7KB2GA011434	2025-05-17 01:02:03.014259+00
https://auto.ria.com/uk/auto_mazda_cx_5_38252506.html	Mazda CX-5 2017	21990	157000	Олег	(067) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/mazda_cx-5__597623295f.jpg	80	None	None	2025-05-17 01:02:03.20582+00
https://auto.ria.com/uk/auto_hyundai_santa_fe_37990009.html	Hyundai Santa FE 2013	11600	236000	Slavik	(067) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/hyundai_santa-fe__590264561f.jpg	40	CA 9403 KI	5XYZT3LBXDG075480	2025-05-17 01:02:03.384967+00
https://auto.ria.com/uk/auto_hyundai_elantra_38127387.html	Hyundai Elantra 2013	10550	152000	Анжеліка	(093) xxx-xx-xx	https://cdn4.riastatic.com/photosnew/auto/photo/hyundai_elantra__598927194f.jpg	18	AI 5350 CO	KMHDH41EBDU866824	2025-05-17 01:02:04.948437+00
https://auto.ria.com/uk/auto_nissan_qashqai_2_38305988.html	Nissan Qashqai+2 2011	11500	224000	Andrew	(063) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/nissan_qashqai-2__599058678f.jpg	105	None	None	2025-05-17 01:02:05.186198+00
https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38285633.html	Mercedes-Benz Sprinter 2021	29750	94000	Роман	(068) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__598525352f.jpg	146	None	None	2025-05-17 01:02:05.457964+00
https://auto.ria.com/uk/auto_volkswagen_touareg_38086146.html	Volkswagen Touareg 2021	63900	44000	GT Autogroup	(067) xxx-xx-xx	https://img.youtube.com/vi/Qqb32kA7upE/default.jpg	67	None	WVGZZZCRZMD030030	2025-05-17 01:02:05.661693+00
https://auto.ria.com/uk/auto_nissan_qashqai_38302008.html	Nissan Qashqai 2013	11999	183000	Taras	(093) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/nissan_qashqai__598945377f.jpg	165	None	None	2025-05-17 01:02:05.902533+00
https://auto.ria.com/uk/auto_audi_q7_38300848.html	Audi Q7 2016	38700	251000	Геннадій Павлович	(066) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q7__598913288f.jpg	74	CE 4138 EX	WAUZZZ4M1GD052087	2025-05-17 01:02:06.122198+00
https://auto.ria.com/uk/auto_audi_a6_38271303.html	Audi A6 2015	20999	238000	Roman	(093) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/audi_a6__598134926f.jpg	133	BC 1700 PC	WAUZZZ4GxFNxxxx20	2025-05-17 01:02:06.318447+00
https://auto.ria.com/uk/auto_nissan_rogue_36294829.html	Nissan Rogue 2014	15299	154000	Василь Володимирович	(068) xxx-xx-xx	https://cdn4.riastatic.com/photosnew/auto/photo/nissan_rogue__593343314f.jpg	44	BC 3585 PT	5N1AT2MT5EC861798	2025-05-17 01:02:06.460835+00
https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38306645.html	Mercedes-Benz Sprinter 2020	33900	405000	Сергей Борисович Демянчук	(067) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__599079163f.jpg	9	BK 7309 IH	W1V9076351P223629	2025-05-17 01:02:06.570139+00
https://auto.ria.com/uk/auto_volkswagen_passat_38292515.html	Volkswagen Passat 2019	19000	265000	Роман	(063) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_passat__598682670f.jpg	37	KA 4732 OT	WVWZZZ3CZLE013823	2025-05-17 01:02:06.707837+00
https://auto.ria.com/uk/auto_audi_a6_36187123.html	Audi A6 2014	21900	132000	Микола	(097) xxx-xx-xx	https://img.youtube.com/vi/-lhxdXJQU_A/default.jpg	30	BK 6752 CM	WAUGFAFC1FN037653	2025-05-17 01:02:09.675043+00
https://auto.ria.com/uk/auto_mercedes_benz_sprinter_37457884.html	Mercedes-Benz Sprinter 2017	19800	231000	Ivan	(067) xxx-xx-xx	https://cdn1.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__575483316f.jpg	30	BO 2290 EO	WDB9066331P397888	2025-05-17 01:02:09.931413+00
https://auto.ria.com/uk/auto_audi_q7_38299592.html	Audi Q7 2018	47999	150000	Олександр	(095) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q7__598880617f.jpg	87	None	None	2025-05-17 01:02:10.141867+00
https://auto.ria.com/uk/auto_volkswagen_tiguan_37915585.html	Volkswagen Tiguan 2021	38000	67000	Богдан	(093) xxx-xx-xx	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__598969010f.jpg	28	None	WVGZZZ5NZNW503402	2025-05-17 01:02:10.27331+00
https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38298676.html	Mercedes-Benz Sprinter 2019	34500	435000	Ivan	(050) xxx-xx-xx	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__598856118f.jpg	24	None	WD4PF1CD3KP160388	2025-05-17 01:02:10.424908+00
https://auto.ria.com/uk/auto_audi_a6_37788396.html	Audi A6 2020	36000	102000	Филипп	(096) xxx-xx-xx	https://cdn2.riastatic.com/photosnew/auto/photo/audi_a6__584606007f.jpg	15	KA 5076 MK	WAUL2AF21LN057673	2025-05-17 01:02:10.563885+00
https://auto.ria.com/uk/auto_bmw_5_series_38303987.html	BMW 5 Series 2020	44990	107000	Александр Олегович Карпенко	(063) xxx-xx-xx	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_5-series__599000309f.jpg	51	BM 7605 EI	WBAJA9C04LCE01443	2025-05-17 01:02:10.734534+00
https://auto.ria.com/uk/auto_audi_q7_37075085.html	Audi Q7 2016	35900	156000	Konstantin Dovzhenko		https://cdn0.riastatic.com/photosnew/auto/photo/audi_q7__564805930f.jpg	10	KA 5200 IA	WAUZZZ4M3GD058621	2025-05-17 01:02:10.909713+00
https://auto.ria.com/uk/auto_bmw_5_series_38281065.html	BMW 5 Series 2011	13500	235000	Сергій		https://cdn3.riastatic.com/photosnew/auto/photo/bmw_5-series__598406703f.jpg	98	BH 0353 OB	WBAXH5C55CC594872	2025-05-17 01:02:11.10679+00
\.


--
-- Name: car_info car_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_info
    ADD CONSTRAINT car_info_pkey PRIMARY KEY (url);


--
-- PostgreSQL database dump complete
--

