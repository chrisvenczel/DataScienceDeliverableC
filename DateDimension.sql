-- Table: public.date

-- DROP TABLE public.date;

CREATE TABLE public.date
(
    date_key integer NOT NULL DEFAULT nextval('date_date_key_seq'::regclass),
    full_date date,
    day_num integer,
    week_num integer,
    month_num integer,
    season text COLLATE pg_catalog."default",
    day_of_week text COLLATE pg_catalog."default",
    year_num integer,
    quarter integer,
    CONSTRAINT date_pkey PRIMARY KEY (date_key),
    CONSTRAINT month_num CHECK (month_num >= 1 AND month_num <= 12),
    CONSTRAINT day_num CHECK (day_num >= 1 AND day_num <= 366),
    CONSTRAINT year_num CHECK (year_num >= 2005 AND year_num <= 2020),
    CONSTRAINT quarter CHECK (quarter >= 1 AND quarter <= 4),
    CONSTRAINT week_num CHECK (week_num >= 1 AND week_num <= 53)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.date
    OWNER to rtakw072;


/* Code for populating the date dimension was taken from: suvash/creating_a_date_dimension_table_in_postgresql.sql
https://gist.github.com/suvash/ddd1c689101c9e1bafcd8ba5c46cec76
It was modified to fit our chosen attributes */


INSERT INTO date
SELECT TO_CHAR(datum, 'yyyymmdd')::INT AS date_key,
       datum AS full_date,
       EXTRACT(DOY FROM datum) AS day_num,
	   CEILING ((EXTRACT (DOY FROM datum))/7) AS week_num,
       EXTRACT(MONTH FROM datum) AS month_num,
	   CASE
           WHEN EXTRACT(QUARTER FROM datum) = 1 THEN 'Winter'
           WHEN EXTRACT(QUARTER FROM datum) = 2 THEN 'Spring'
           WHEN EXTRACT(QUARTER FROM datum) = 3 THEN 'Summer'
           WHEN EXTRACT(QUARTER FROM datum) = 4 THEN 'Autumn'
           END AS season,
	   TO_CHAR(datum, 'TMDay') AS day_of_week,
	   EXTRACT(YEAR FROM datum) AS year_num,
       EXTRACT(QUARTER FROM datum) AS quarter
	FROM (SELECT '2005-01-01'::DATE + SEQUENCE.DAY AS datum
      FROM GENERATE_SERIES(0, 5843) AS SEQUENCE (DAY)
      GROUP BY SEQUENCE.DAY) DQ
ORDER BY 1;
