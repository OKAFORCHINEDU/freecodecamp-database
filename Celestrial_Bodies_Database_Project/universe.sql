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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    discovered_by character varying(50),
    has_tail boolean,
    number_of_stars integer,
    discovery_year date,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    number_of_planets integer,
    description text,
    has_life boolean
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
    name character varying(255) NOT NULL,
    is_habitable boolean,
    age_in_millions_of_years integer,
    surface_temperature numeric(4,1),
    planet_id integer
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
    name character varying(255) NOT NULL,
    planet_type character varying(100),
    distance_from_earth numeric(10,3),
    has_atmosphere boolean,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    spherical_type character varying(10),
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Edmond Halley', true, 20, '1962-01-01', 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Alan Hale and Thomas Bopp', true, 2, '1995-01-01', 2);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 'NASA', true, 1, '2020-01-01', 3);
INSERT INTO public.comet VALUES (4, 'Hallay', 'Admond Halley', true, 4, '1682-01-01', 4);
INSERT INTO public.comet VALUES (5, 'Hale', 'Alan Hale and Thomas Bopp', true, 5, '1995-01-01', 5);
INSERT INTO public.comet VALUES (6, 'NEO', 'NASA', true, 6, '2020-01-01', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 4500, 10, 'Spiral galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 4500, 5, 'Elliptical galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4000, 6, 'Spiral galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 3500, 5, 'Spiral Galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 4500, 10, 'Elliptical Galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 4500, 6, 'Spiral Galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 'Luna', true, 4500, -23.0, 1);
INSERT INTO public.moon VALUES (14, 'Phobos', false, 4300, 4.0, 2);
INSERT INTO public.moon VALUES (15, 'Europa', true, 4500, 160.0, 2);
INSERT INTO public.moon VALUES (16, 'Ganymed', true, 4500, 163.0, 3);
INSERT INTO public.moon VALUES (17, 'Tethys', false, 4500, 187.0, 3);
INSERT INTO public.moon VALUES (18, 'Rhea', false, 4500, 174.0, 1);
INSERT INTO public.moon VALUES (19, 'Ariel', false, 4500, 210.0, 6);
INSERT INTO public.moon VALUES (20, 'Triton', false, 4500, 235.0, 7);
INSERT INTO public.moon VALUES (21, 'Miranda', false, 4500, 187.0, 5);
INSERT INTO public.moon VALUES (22, 'Nereid', false, 4500, 220.0, 8);
INSERT INTO public.moon VALUES (23, 'Moranga', true, 4500, 200.0, 8);
INSERT INTO public.moon VALUES (24, 'Trotan', true, 4500, 122.0, 9);
INSERT INTO public.moon VALUES (25, 'Phabos', false, 4300, 4.0, 10);
INSERT INTO public.moon VALUES (26, 'Eoropa', true, 4500, 160.0, 7);
INSERT INTO public.moon VALUES (27, 'Genymed', true, 4500, 163.0, 3);
INSERT INTO public.moon VALUES (28, 'Tathys', false, 4500, 187.0, 8);
INSERT INTO public.moon VALUES (29, 'Rhae', false, 4500, 174.0, 2);
INSERT INTO public.moon VALUES (30, 'Arial', false, 4500, 210.0, 6);
INSERT INTO public.moon VALUES (31, 'Troton', false, 4500, 235.0, 9);
INSERT INTO public.moon VALUES (32, 'Mirenda', false, 4500, 187.0, 5);
INSERT INTO public.moon VALUES (33, 'Nareid', false, 4500, 220.0, 1);
INSERT INTO public.moon VALUES (34, 'Maranga', true, 4500, 200.0, 8);
INSERT INTO public.moon VALUES (35, 'Tretan', true, 4500, 122.0, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'terrestrial', 150.000, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'terrestrial', 228.000, true, 1, 2);
INSERT INTO public.planet VALUES (3, 'jupiter', 'Gas giant', 779.000, false, 2, 3);
INSERT INTO public.planet VALUES (4, 'Mercury', 'terrestrial', 92.000, false, 0, 4);
INSERT INTO public.planet VALUES (5, 'Venus', 'terrestrial', 41.000, true, 1, 5);
INSERT INTO public.planet VALUES (6, 'Gliese 581 c', 'Exoplanet', 20300.000, true, 0, 5);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 'Exoplanet', 15040.000, true, 0, 4);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 'Exoplanet', 42000.000, true, 1, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Exoplanet', 49210.000, true, 2, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Ice giant', 29000.000, true, 27, 1);
INSERT INTO public.planet VALUES (11, 'Neptune', 'Ice giant', 45000.000, true, 14, 3);
INSERT INTO public.planet VALUES (12, 'Pluto', 'Dwarf planet', 59000.000, false, 5, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, true, 'G-Type', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 200, NULL, 'A-Type', 2);
INSERT INTO public.star VALUES (3, 'proxima', 4850, true, 'M-Type', 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 9, NULL, 'A-Type', 4);
INSERT INTO public.star VALUES (5, 'Antares', 12, true, 'M-Type', 5);
INSERT INTO public.star VALUES (6, 'Vega', 455, NULL, 'A-Type', 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

