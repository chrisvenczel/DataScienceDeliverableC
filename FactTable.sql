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

/* Populate fact_table */

insert into fact_table(
date_key, economy_key, event_key, country_key, population_key,
education_key, climate_key, quality_of_life_key, health_key,
human_development_index, gdp, death_rate_per_1000, birth_rate_per_1000,
life_expectancy_at_birth)
-- Get all data joined together
select
-- The keys from the dimensions
date.date_key,
econ.economy_key,
event.event_key,
cntry.country_key,
pop.population_key,
educ.education_key,
clm.climate_key,
qol.quality_of_life_key,
health.health_key,
-- The facts from the (temporary) key_indicators table
ki.human_development_index,
ki.gdp,
ki.death_rate_per_1000,
ki.birth_rate_per_1000,
ki.life_expectancy_at_birth
from
"event",
"date",
health,
climate as clm,
country as cntry,  
economy as econ,
education as educ,
population as pop,
quality_of_life as qol,
key_indicators as ki
-- Join them together by country and year
where
ki.yr = clm.yr and ki.country_code = clm.country_code and
ki.yr = cntry.yr and ki.country_code = cntry.country_code and
ki.yr = econ.yr and ki.country_code = econ.country_code and
ki.yr = event.yr and ki.country_code = event.country_code and
ki.yr = educ.yr and ki.country_code = educ.country_code and
ki.yr = health.yr and ki.country_code = health.country_code and
ki.yr = pop.yr and ki.country_code = pop.country_code and
ki.yr = qol.yr and ki.country_code = qol.country_code and
ki.yr = date.year_num
