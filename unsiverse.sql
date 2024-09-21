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
-- Name: stellar_distance; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_distance (
    stellar_distance_id integer NOT NULL,
    lightyears numeric(15,1) NOT NULL,
    name character varying(50) NOT NULL,
    is_confirmed boolean,
    is_visible boolean,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.stellar_distance OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_from_earth_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_from_earth_distance_id_seq OWNER TO freecodecamp;

--
-- Name: distance_from_earth_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_from_earth_distance_id_seq OWNED BY public.stellar_distance.stellar_distance_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    num_planets integer NOT NULL,
    num_stars integer NOT NULL,
    description text,
    type character varying(50),
    stellar_distance_id integer
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
    name character varying(50) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    stellar_distance_id integer
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
    name character varying(40) NOT NULL,
    description text,
    star_id integer NOT NULL,
    stellar_distance_id integer
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
    name character varying(40) NOT NULL,
    description text,
    lightyears numeric(15,1),
    is_visible boolean,
    is_confirmed boolean,
    galaxy_id integer NOT NULL,
    stellar_distance_id integer
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
-- Name: stellar_distance stellar_distance_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance ALTER COLUMN stellar_distance_id SET DEFAULT nextval('public.distance_from_earth_distance_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstrße', 50, 150, 'Unsere Heimatgalaxie. Sterne und Planenten in Milliarden angegeben.', 'Spiralgalaxie', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100, 1000, 'in Milliarden. Die größte Galaxie der Lokalen Gruppe', 'Spiralgalaxie', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10, 40, 'Eine kleinere Galaxie der Lokalen Gruppe', 'Spiralgalaxie', NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 30, 200, 'Eine auffällige Spiralgalaxie, bekannt für ihre Form.', 'Spiralgalaxie', NULL);
INSERT INTO public.galaxy VALUES (5, 'Große Magellansche Wolke', 25, 300, 'Die größte Satellitengalaxie der Milchstraße, bekannt für ihre Sternentstehungsgebiete.', 'Irreguläre Galaxie', NULL);
INSERT INTO public.galaxy VALUES (6, 'Kleine Magellansche Wolke', 15, 200, 'Eine kleinere Satellitengalaxie der Milchstraße mit jungen Sternen.', 'Irreguläre Galaxie', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mond', 'Der einzige natürliche Satellit der Erde.', 1, NULL);
INSERT INTO public.moon VALUES (2, 'Alpha Centauri B1', 'Ein hypothetischer Mond, der Alpha Centauri Bb umkreist.', 2, NULL);
INSERT INTO public.moon VALUES (3, 'Alpha Centauri B2', 'Ein weiterer hypothetischer Mond, der Alpha Centauri Bb umkreist.', 2, NULL);
INSERT INTO public.moon VALUES (4, 'Phobos', 'Der größere der beiden Marsmonde, benannt nach der griechischen Gottheit der Furcht.', 13, NULL);
INSERT INTO public.moon VALUES (5, 'Deimos', 'Der kleinere der beiden Marsmonde, benannt nach der griechischen Gottheit des Schreckens.', 13, NULL);
INSERT INTO public.moon VALUES (6, 'Alpha Bb Mond 1', 'Ein kleiner Mond, der Alpha Centauri Bb umkreist.', 2, NULL);
INSERT INTO public.moon VALUES (7, 'Alpha Bb Mond 2', 'Ein Mond mit dünner Atmosphäre.', 2, NULL);
INSERT INTO public.moon VALUES (8, 'Alpha Bb Mond 3', 'Ein felsiger Mond mit Vulkanaktivität.', 2, NULL);
INSERT INTO public.moon VALUES (9, 'Sombrero I Mond 1', 'Der erste Mond von Sombrero I.', 3, NULL);
INSERT INTO public.moon VALUES (10, 'Sombrero I Mond 2', 'Der zweite Mond von Sombrero I.', 3, NULL);
INSERT INTO public.moon VALUES (11, 'Sombrero II Mond 1', 'Ein großer Mond mit einer eisigen Oberfläche.', 4, NULL);
INSERT INTO public.moon VALUES (12, 'Sombrero II Mond 2', 'Ein Mond mit einem unterirdischen Ozean.', 4, NULL);
INSERT INTO public.moon VALUES (13, 'LMC 1 Mond 1', 'Ein kleiner Mond in der Großen Magellanschen Wolke.', 5, NULL);
INSERT INTO public.moon VALUES (14, 'LMC 1 Mond 2', 'Ein Mond mit dichten Wolken und Stürmen.', 5, NULL);
INSERT INTO public.moon VALUES (15, 'SMC 1 Mond 1', 'Ein aktiver Mond mit tektonischer Aktivität.', 6, NULL);
INSERT INTO public.moon VALUES (16, 'LMC 2 Mond 1', 'Ein felsiger Mond, der LMC Planet 2 umkreist.', 7, NULL);
INSERT INTO public.moon VALUES (17, 'LMC 2 Mond 2', 'Ein eisiger Mond mit Vulkanen.', 7, NULL);
INSERT INTO public.moon VALUES (18, 'Mars Mond 3', 'Ein hypothetischer dritter Mond von Mars.', 13, NULL);
INSERT INTO public.moon VALUES (19, 'SMC 2 Mond 1', 'Ein kleiner felsiger Mond, der SMC Planet 2 umkreist.', 10, NULL);
INSERT INTO public.moon VALUES (20, 'SMC 2 Mond 2', 'Ein Mond mit einem eisigen Mantel und aktiven Kryovulkanen.', 10, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', 'Der dritte Planet unseres Sonnensystems und der einzige bekannte Planet mit Leben.', 1, NULL);
INSERT INTO public.planet VALUES (2, 'Alpha Centauri Bb', 'Ein potenzieller Exoplanet im Alpha Centauri-System, der nahe seinem Stern kreist.', 2, NULL);
INSERT INTO public.planet VALUES (3, 'Sombrero I', 'Ein hypothetischer Planet in der Sombrero-Galaxie.', 4, NULL);
INSERT INTO public.planet VALUES (4, 'Sombrero II', 'Ein weiterer hypothetischer Planet in der Sombrero-Galaxie.', 4, NULL);
INSERT INTO public.planet VALUES (5, 'LMC Planet 1', 'Ein hypothetischer Planet in der Großen Magellanschen Wolke.', 5, NULL);
INSERT INTO public.planet VALUES (6, 'SMC Planet 1', 'Ein hypothetischer Planet in der Kleinen Magellanschen Wolke.', 6, NULL);
INSERT INTO public.planet VALUES (7, 'LMC Planet 2', 'Ein zweiter hypothetischer Planet in der Großen Magellanschen Wolke.', 5, NULL);
INSERT INTO public.planet VALUES (8, 'LMC Planet 3', 'Ein Planet mit einer potenziellen Atmosphäre in der Großen Magellanschen Wolke.', 5, NULL);
INSERT INTO public.planet VALUES (9, 'LMC Planet 4', 'Ein gasförmiger Planet in der Nähe eines Sternentstehungsgebiets in der Großen Magellanschen Wolke.', 5, NULL);
INSERT INTO public.planet VALUES (10, 'SMC Planet 2', 'Ein kleiner Planet in der Kleinen Magellanschen Wolke.', 6, NULL);
INSERT INTO public.planet VALUES (11, 'SMC Planet 3', 'Ein felsiger Planet in der Nähe eines jungen Sterns in der Kleinen Magellanschen Wolke.', 6, NULL);
INSERT INTO public.planet VALUES (12, 'SMC Planet 4', 'Ein großer gasförmiger Planet in der Kleinen Magellanschen Wolke.', 6, NULL);
INSERT INTO public.planet VALUES (13, 'Mars', 'Der vierte Planet unseres Sonnensystems, bekannt als der rote Planet.', 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sonne', 'Durchmesser ist mit 1,4 Millionen Kilometern etwa 110-mal so groß wie der der Erde und etwa viermal so groß wie der mittlere Abstand zwischen Erde und Mond. Die Oberfläche der Sonne zeigt eine wechselnde Zahl von Sonnenflecken, die in Zusammenhang mit starken Magnetfeldern stehen.', 0.0, true, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Alpha Centauri besteht aus dem helleren gelben Stern Alpha Centauri A und dem orangefarbenen Alpha Centauri B in derzeit 6″ Abstand. Zusammen mit der Sonne befindet es sich in der sogenannten Lokalen Flocke. ', 4.4, true, true, 1, NULL);
INSERT INTO public.star VALUES (3, 'Andromeda Sun', NULL, 2500000.0, true, true, 2, NULL);
INSERT INTO public.star VALUES (4, 'Triangulum Sun', NULL, 3000000.0, true, true, 3, NULL);
INSERT INTO public.star VALUES (5, 'LMC Star 1', 'Ein heller Stern in der Großen Magellanschen Wolke.', 160000.0, true, true, 5, NULL);
INSERT INTO public.star VALUES (6, 'SMC Star 1', 'Ein junger Stern in der Kleinen Magellanschen Wolke.', 200000.0, true, true, 6, NULL);


--
-- Data for Name: stellar_distance; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_distance VALUES (1, 2500000.0, 'Andromeda', true, true, NULL, NULL, NULL, NULL);
INSERT INTO public.stellar_distance VALUES (2, 3000000.0, 'Triangulum', true, true, NULL, NULL, NULL, NULL);
INSERT INTO public.stellar_distance VALUES (3, 28000000.0, 'Sombrero', true, true, NULL, NULL, NULL, NULL);


--
-- Name: distance_from_earth_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_from_earth_distance_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stellar_distance distance_from_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT distance_from_earth_pkey PRIMARY KEY (stellar_distance_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: stellar_distance unique_stellar_distance_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT unique_stellar_distance_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_distance; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_distance FOREIGN KEY (stellar_distance_id) REFERENCES public.stellar_distance(stellar_distance_id);


--
-- Name: moon fk_moon_distance; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_distance FOREIGN KEY (stellar_distance_id) REFERENCES public.stellar_distance(stellar_distance_id);


--
-- Name: planet fk_planet_distance; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_distance FOREIGN KEY (stellar_distance_id) REFERENCES public.stellar_distance(stellar_distance_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_distance; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_distance FOREIGN KEY (stellar_distance_id) REFERENCES public.stellar_distance(stellar_distance_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: stellar_distance stellar_distance_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT stellar_distance_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: stellar_distance stellar_distance_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT stellar_distance_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: stellar_distance stellar_distance_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT stellar_distance_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: stellar_distance stellar_distance_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_distance
    ADD CONSTRAINT stellar_distance_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
