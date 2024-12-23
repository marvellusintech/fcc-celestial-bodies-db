--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    description text,
    is_spherical boolean,
    distance_from_earth numeric(4,2) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    type character varying(20),
    size integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(20) NOT NULL,
    distance_from_planet numeric(4,2),
    diameter integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    type character varying(20) NOT NULL,
    star_id integer NOT NULL,
    temperature numeric(4,2),
    has_moon boolean,
    mass integer NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20),
    planet_moon_id integer NOT NULL
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    type character varying(20),
    galaxy_id integer NOT NULL,
    is_visible_from_earth boolean,
    distance_from_earth numeric(15,2),
    luminosity numeric(15,2),
    shape character varying(20),
    mass numeric(4,2),
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'our home glaxy', true, 0.00, 12, true, 'barred spiral', 100000);
INSERT INTO public.galaxy VALUES (2, 'Andremeda', 'The nearest spiral galaxy', false, 2.50, 10000, false, 'spiral', 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy', false, 3.20, 12000, false, 'spiral', 60000);
INSERT INTO public.galaxy VALUES (4, 'lg magellanic cloud', 'A satellite galaxy', false, 3.20, 12000, false, 'irregular', 60000);
INSERT INTO public.galaxy VALUES (5, 'sm magellanic cloud', 'A satellite galaxy', false, 3.20, 12000, false, 'irregular', 60000);
INSERT INTO public.galaxy VALUES (6, 'Whirl', 'A classic spiral', false, 23.00, 10, false, 'spiral', 76);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (4, 'phobos', 3, 'natural satellite', NULL, 34, 'larger and closer of mas two moons');
INSERT INTO public.moon VALUES (5, 'deimos', 2, 'natural satellite', NULL, 22, 'smaller  mars two moons');
INSERT INTO public.moon VALUES (6, 'europa', 5, 'natural satellite', NULL, 22, 'a jupiter galilean');
INSERT INTO public.moon VALUES (7, 'titan', 5, 'natural satellite', NULL, 22, 'moon');
INSERT INTO public.moon VALUES (8, 'titan a', 5, 'natural satellite', NULL, 22, 'moon');
INSERT INTO public.moon VALUES (9, 'titan b', 5, 'natural satellite', NULL, 22, 'moon');
INSERT INTO public.moon VALUES (10, 'titan c', 1, 'natural satellite', NULL, 22, 'moon');
INSERT INTO public.moon VALUES (11, 'titan d', 1, 'natural satellite', NULL, 22, 'moon');
INSERT INTO public.moon VALUES (12, 'europa a', 5, 'natural satellite', NULL, 22, 'a jupiter galilean');
INSERT INTO public.moon VALUES (13, 'europa b', 5, 'natural satellite', NULL, 22, 'a jupiter galilean');
INSERT INTO public.moon VALUES (14, 'europa c', 5, 'natural satellite', NULL, 22, 'a jupiter galilean');
INSERT INTO public.moon VALUES (15, 'europa d', 5, 'natural satellite', NULL, 22, 'a jupiter galilean');
INSERT INTO public.moon VALUES (16, 'moon a', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (17, 'moon b', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (18, 'moon c', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (19, 'moon d', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (20, 'moon e', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (21, 'moon f', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (23, 'moonlight', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (24, 'moonlight a', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (25, 'moonlight b', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (26, 'moonlight c', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (27, 'moonlight e', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (28, 'moonlight f', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (29, 'moonlight g', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (30, 'moonlight h', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');
INSERT INTO public.moon VALUES (31, 'moonlight i', 3, 'natural satellite', NULL, 34, 'earths only natural satellite,known for its phases');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mecury', 'terrestrial', 1, 34.00, false, 3, 'the smallest planet');
INSERT INTO public.planet VALUES (2, 'venus', 'terrestrial', 1, 34.00, false, 3, 'a rocky planet');
INSERT INTO public.planet VALUES (3, 'earth', 'terrestrial', 1, 34.00, true, 3, 'the only known planet to support life');
INSERT INTO public.planet VALUES (5, 'mars', 'terrestrial', 1, 34.00, true, 3, 'red planet');
INSERT INTO public.planet VALUES (6, 'jupiter', 'gas giant', 1, 34.00, true, 3, 'largest planet');
INSERT INTO public.planet VALUES (7, 'saturn', 'gas giant', 1, 34.00, true, 3, 'ring system planet');
INSERT INTO public.planet VALUES (8, 'sirius b', 'white dwarf', 4, 34.00, false, 3, 'A dense, small companion..');
INSERT INTO public.planet VALUES (9, 'proxima b', 'terrestrial', 3, 34.00, false, 3, 'A potentially habitable exoplanet');
INSERT INTO public.planet VALUES (10, 'kepler', 'super-earth', 3, 34.00, false, 3, 'An exoplanet');
INSERT INTO public.planet VALUES (11, 'titan', 'moon', 3, 34.00, false, 3, 'Large moon of saturn');
INSERT INTO public.planet VALUES (12, 'Betelgeuse', 'gas giant', 3, 34.00, true, 3, 'A gas giant');
INSERT INTO public.planet VALUES (13, 'antares c', 'gas giant', 3, 34.00, true, 3, 'A gas giant');


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (3, 1, NULL, 1);
INSERT INTO public.planet_moon VALUES (5, 1, NULL, 2);
INSERT INTO public.planet_moon VALUES (5, 6, NULL, 3);
INSERT INTO public.planet_moon VALUES (5, 4, NULL, 4);
INSERT INTO public.planet_moon VALUES (5, 5, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type-Main', 1, true, 0.00, 1.00, 'spherical', 1.90, 'the star at the center of the solar system');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'red-supergiant', 2, true, 0.00, 1.00, 'spherical', 1.90, 'a red massive supergiant in the constellation');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M-type red dwarf', 1, true, 0.00, 1.00, 'spherical', 1.90, 'the closest star to the sun');
INSERT INTO public.star VALUES (4, 'sirius A', 'A-type', 3, true, 8.60, 25.40, 'spherical', 2.20, 'the brightest star on earth');
INSERT INTO public.star VALUES (5, 'Vega', 'A-type', 4, true, 8.60, 25.40, 'oblate', 2.20, 'a prominet star');
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue supergiant', 2, true, 8.60, 25.40, 'spherical', 2.20, 'a brilliant blue');
INSERT INTO public.star VALUES (7, 'UY scuti', 'red supergiant', 5, false, 8.60, 25.40, 'spherical', 2.20, 'one of the largest stars by radius');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_moon_planet_id_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_moon_id_key UNIQUE (planet_id, moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

