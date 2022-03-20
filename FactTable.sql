create table fact_table(
  date_key serial references date(date_key),
  economy_key serial references economy(economy_key),
  event_key serial references event(event_key),
  country_key serial references country(country_key),
  population_key serial references population(population_key),
  education_key serial references education(education_key),
  climate_key serial references climate(climate_key),
  quality_of_life_key serial references quality_of_life(quality_of_life_key),
  health_key serial references health(health_key),
  primary key (date_key, economy_key, event_key, country_key, population_key, education_key, climate_key, quality_of_life_key, health_key),
  human_development_index numeric check (
    human_development_index >= 0
    and human_development_index <= 1
  ),
  gdp bigint check (
    gdp >= 0
    and gdp <= 100000000000000
  ),
  death_rate_per_1000 numeric check (
    death_rate_per_1000 >= 0
    and death_rate_per_1000 <= 1000
  ),
  birth_rate_per_1000 numeric check (
    birth_rate_per_1000 >= 0
    and birth_rate_per_1000 <= 1000
  ),
  life_expectancy_at_birth numeric check (
    life_expectancy_at_birth >= 0
    and life_expectancy_at_birth <= 130
  )
);

/* populate the fact table */

INSERT INTO fact_table(date_key,economy_key, event_key, country_key,
population_key, education_key, climate_key, quality_of_life_key, health_key)

Select d.date_key, e.economy_key, ev.event_key, c.country_key, p.population_key, 
ed.education_key, cl.climate_key, q.quality_of_life_key, h.health_key 

FROM "date" d, "economy" e, "event" ev, "country" c,
"population" p, "education" ed, "climate" cl, "quality_of_life" q, "health" h 

WHERE d.year_num = e.yr and e.country_code = p.country_code AND p.yr = ed.yr AND 
cl.yr = q.yr AND cl.country_code = c.country_code AND ev.yr = q.yr AND h.yr = p.yr
AND h.country_code = p.country_code
