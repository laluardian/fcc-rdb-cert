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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10),
    is_official_constellation boolean,
    description text,
    number_of_stars integer,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    distance_from_earth_in_light_years numeric(10,2),
    number_of_stars_in_billions integer,
    discovered_date date
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
    name character varying(100) NOT NULL,
    diameter_in_kilometers numeric(10,2),
    mass_in_lunar_masses numeric(10,2),
    orbital_period_in_days numeric(10,2),
    distance_from_planet_in_kilometers numeric(10,2),
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
    name character varying(100) NOT NULL,
    type character varying(50),
    mass_in_earth_masses numeric(10,2),
    orbital_period_in_days numeric(10,2),
    distance_from_star_in_au numeric(10,2),
    has_life boolean,
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
    name character varying(100) NOT NULL,
    type character varying(50),
    mass_in_solar_masses numeric(10,2),
    distance_from_earth_in_light_years numeric(10,2),
    distance_from_galactic_center_in_light_years numeric(10,2),
    luminosity_in_watts double precision,
    galaxy_id integer,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Pegasus', 'Peg', true, 'A large constellation in the northern sky, named after the winged horse Pegasus in Greek mythology.', 88, 1);
INSERT INTO public.constellation VALUES (2, 'Orion', 'Ori', true, 'One of the most conspicuous and recognizable constellations in the night sky, named after the Greek mythological hunter Orion.', 85, 2);
INSERT INTO public.constellation VALUES (3, 'Draco', 'Dra', true, 'A large constellation in the northern sky, representing the dragon Ladon in Greek mythology.', 75, 2);
INSERT INTO public.constellation VALUES (4, 'Coma Berenices', 'Com', true, 'A small constellation in the northern sky, representing the hair of Berenice II of Egypt.', 40, 4);
INSERT INTO public.constellation VALUES (5, 'Phoenix', 'Phe', false, 'An unofficial constellation named after the mythical phoenix, symbolizing rebirth and renewal.', 15, 2);
INSERT INTO public.constellation VALUES (6, 'Cetus Minor', 'CetMi', false, 'An unofficial constellation representing a smaller version of Cetus, the sea monster in Greek mythology.', 12, 3);
INSERT INTO public.constellation VALUES (7, 'Scutum Minor', 'SctMi', false, 'An unofficial constellation representing a smaller version of Scutum, the shield.', 10, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2537000.00, 1000, '0964-10-04');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 0.00, 250, '1610-01-07');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000.00, 40, '1764-08-25');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 29000000.00, 800, '1912-05-11');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000.00, 100, '1845-06-01');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 160000.00, 30, '1500-12-31');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474.80, 1.00, 27.32, 384400.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.40, 0.00, 0.32, 9377.00, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.40, 0.00, 1.26, 23460.00, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262.40, 2.02, 7.15, 1070400.00, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, 0.65, 3.55, 671100.00, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 5150.00, 1.48, 15.95, 1221870.00, 4);
INSERT INTO public.moon VALUES (7, 'Rhea', 1528.00, 0.02, 4.52, 527040.00, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', 504.20, 0.00, 1.37, 238020.00, 5);
INSERT INTO public.moon VALUES (9, 'Triton', 2706.80, 0.30, 5.88, 354759.00, 5);
INSERT INTO public.moon VALUES (10, 'Oberon', 1522.80, 0.02, 13.46, 583520.00, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 1577.80, 0.02, 8.71, 436300.00, 6);
INSERT INTO public.moon VALUES (12, 'Charon', 1212.00, 0.11, 6.39, 19591.00, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169.40, 0.01, 4.14, 265970.00, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 471.60, 0.00, 1.41, 129390.00, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 1158.80, 0.01, 2.52, 191020.00, 8);
INSERT INTO public.moon VALUES (16, 'Dysnomia', 700.00, 0.00, 15.78, 378550.00, 9);
INSERT INTO public.moon VALUES (17, 'Nix', 49.80, 0.00, 24.86, 48760.00, 10);
INSERT INTO public.moon VALUES (18, 'Hydra', 55.00, 0.00, 38.20, 65470.00, 10);
INSERT INTO public.moon VALUES (19, 'Kerberos', 19.00, 0.00, 32.10, 57700.00, 11);
INSERT INTO public.moon VALUES (20, 'Styx', 16.00, 0.00, 20.16, 42380.00, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 'Terrestrial', 1.27, 11.20, 0.05, false, 1);
INSERT INTO public.planet VALUES (2, 'Alpha Centauri Bb', 'Terrestrial', 1.10, 3.24, 0.04, false, 1);
INSERT INTO public.planet VALUES (3, 'Betelgeuse I', 'Gas Giant', 317.80, 4332.59, 5.20, false, 2);
INSERT INTO public.planet VALUES (4, 'Betelgeuse II', 'Ice Giant', 14.50, 10759.22, 9.58, false, 2);
INSERT INTO public.planet VALUES (5, 'Rigel I', 'Gas Giant', 95.16, 305.26, 0.72, false, 3);
INSERT INTO public.planet VALUES (6, 'Rigel II', 'Terrestrial', 0.82, 224.70, 0.39, false, 3);
INSERT INTO public.planet VALUES (7, 'Messier 32 V1-a', 'Gas Giant', 318.00, 4331.00, 5.21, false, 4);
INSERT INTO public.planet VALUES (8, 'Messier 32 V1-b', 'Ice Giant', 14.60, 10752.00, 9.59, false, 4);
INSERT INTO public.planet VALUES (9, 'M33 X-7 I', 'Terrestrial', 0.55, 88.00, 0.28, false, 5);
INSERT INTO public.planet VALUES (10, 'M33 X-7 II', 'Terrestrial', 0.68, 365.25, 1.00, false, 5);
INSERT INTO public.planet VALUES (11, 'NGC 4414-1a', 'Gas Giant', 317.90, 4329.63, 5.19, false, 6);
INSERT INTO public.planet VALUES (12, 'NGC 4414-1b', 'Ice Giant', 14.40, 10754.00, 9.60, false, 6);
INSERT INTO public.planet VALUES (13, 'Alpha Centauri Bc', 'Terrestrial', 1.00, 365.25, 1.00, false, 1);
INSERT INTO public.planet VALUES (14, 'Betelgeuse III', 'Gas Giant', 318.20, 4333.00, 5.22, false, 2);
INSERT INTO public.planet VALUES (15, 'Rigel III', 'Ice Giant', 14.40, 10758.00, 9.57, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 'G2V', 1.10, 4.37, 25000.00, 3.828e+26, 2, NULL);
INSERT INTO public.star VALUES (4, 'Messier 32 V1', 'Cepheid', 5.50, 2537000.00, 100.00, 5e+29, 1, NULL);
INSERT INTO public.star VALUES (5, 'M33 X-7', 'Black Hole', 15.65, 3000000.00, 50.00, 1.6e+32, 3, NULL);
INSERT INTO public.star VALUES (6, 'NGC 4414-1', 'G2V', 1.00, 62000000.00, 15000.00, 3.828e+26, 4, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'M2Iab', 20.00, 642.50, 10000.00, 1.37e+31, 2, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 'B8Ia', 18.00, 863.00, 20000.00, 8.6e+31, 2, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id) ON DELETE SET NULL;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

