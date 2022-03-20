/* Creating the database tables and setting column constraints */

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

create table event(
  event_key serial primary key,
  country_code text,
  yr integer check (
    yr >= 2005
    and yr <= 2020
  ),
  event_name text,
  event_type text,
  countries_affected text[],
  num_of_deaths bigint check (
    num_of_deaths >= 0
    and num_of_deaths <= 1000000000
  ),
  num_of_injuries bigint check (
    num_of_injuries >= 0
    and num_of_injuries <= 1000000000
  ),
  costs bigint check (
    costs >= 0
    and costs <= 100000000000
  ),
  foreign_aid bigint check (
    foreign_aid >= 0
    and foreign_aid <= 100000000000
  ),
  start_date date check (
    start_date >= '2005-01-01'
    and start_date <= '2020-12-31'
  ),
  end_date date check (
    end_date >= '2005-01-01'
    and end_date <= '2020-12-31'
  )
);

create table economy(
  economy_key serial primary key,
  country_code text,
  yr integer check (
    yr >= 2005
    and yr <= 2020
  ),
  imports_goods_and_services_usd bigint check (
    imports_goods_and_services_usd >= 0
    and imports_goods_and_services_usd <= 100000000000000
  ),
  exports_goods_and_services_usd bigint check (
    exports_goods_and_services_usd >= 0
    and exports_goods_and_services_usd <= 100000000000000
  ),
  female_unemployment_percentage numeric check (
    female_unemployment_percentage >= 0
    and female_unemployment_percentage <= 100
  ),
  male_unemployment_percentage numeric check (
    male_unemployment_percentage >= 0
    and male_unemployment_percentage <= 100
  ),
  total_unemployment_percentage numeric check (
    total_unemployment_percentage >= 0
    and total_unemployment_percentage <= 100
  ),
  income_share_held_by_highest_10_percent numeric check (
    income_share_held_by_highest_10_percent >= 0
    and income_share_held_by_highest_10_percent <= 100
  ),
  income_share_held_by_highest_20_percent numeric check (
    income_share_held_by_highest_20_percent >= 0
    and income_share_held_by_highest_20_percent <= 100
  ),
  income_share_held_by_lowest_10_percent numeric check (
    income_share_held_by_lowest_10_percent >= 0
    and income_share_held_by_lowest_10_percent <= 100
  ),
  income_share_held_by_lowest_20_percent numeric check (
    income_share_held_by_lowest_20_percent >= 0
    and income_share_held_by_lowest_20_percent <= 100
  ),
  income_share_held_by_second_20_percent numeric check (
    income_share_held_by_second_20_percent >= 0
    and income_share_held_by_second_20_percent <= 100
  ),
  income_share_held_by_third_20_percent numeric check (
    income_share_held_by_third_20_percent >= 0
    and income_share_held_by_third_20_percent <= 100
  ),
  income_share_held_by_fourth_20_percent numeric check (
    income_share_held_by_fourth_20_percent >= 0
    and income_share_held_by_fourth_20_percent <= 100
  ),
  labor_force_female_percentage numeric check (
    labor_force_female_percentage >= 0
    and labor_force_female_percentage <= 100
  ),
  consumer_price_index numeric check (
    consumer_price_index >= 0
    and consumer_price_index <= 500
  ),
  consumer_price_inflation_percentage numeric check (
    consumer_price_inflation_percentage >= -100
    and consumer_price_inflation_percentage <= 1000000
  ),
  labor_force_total integer check (
    labor_force_total >= 0
    and labor_force_total <= 3000000000
  )
);

create table education(
  education_key serial primary key,
  country_code text,
  yr integer check (
    yr >= 2005
    and yr <= 2020
  ),
  public_spending_education_percentage_of_gdp numeric check (
    public_spending_education_percentage_of_gdp >= 0
    and public_spending_education_percentage_of_gdp <= 100
  ),
  literacy_rate_adult_female_percentage numeric check (
    literacy_rate_adult_female_percentage >= 0
    and literacy_rate_adult_female_percentage <= 100
  ),
  literacy_rate_adult_male_percentage numeric check (
    literacy_rate_adult_male_percentage >= 0
    and literacy_rate_adult_male_percentage <= 100
  ),
  literacy_rate_adult_total_percentage numeric check (
    literacy_rate_adult_total_percentage >= 0
    and literacy_rate_adult_total_percentage <= 100
  ),
  literacy_rate_youth_total_percentage numeric check (
    literacy_rate_youth_total_percentage >= 0
    and literacy_rate_youth_total_percentage <= 100
  ),
  literacy_rate_youth_male_percentage numeric check (
    literacy_rate_youth_male_percentage >= 0
    and literacy_rate_youth_male_percentage <= 100
  ),
  primary_education_completed_percentage numeric check (
    primary_education_completed_percentage >= 0
    and primary_education_completed_percentage <= 200
  ),
  school_enrollment_primary_percentage_gross numeric check (
    school_enrollment_primary_percentage_gross >= 0
    and school_enrollment_primary_percentage_gross <= 200
  ),
  school_enrollment_primary_percentage_net numeric check (
    school_enrollment_primary_percentage_net >= 0
    and school_enrollment_primary_percentage_net <= 100
  ),
  school_enrollment_primary_percentage_female_gross numeric check (
    school_enrollment_primary_percentage_female_gross >= 0
    and school_enrollment_primary_percentage_female_gross <= 200
  ),
  school_enrollment_primary_percentage_female_net numeric check (
    school_enrollment_primary_percentage_female_net >= 0
    and school_enrollment_primary_percentage_female_net <= 100
  ),
  school_enrollment_primary_percentage_male_gross numeric check (
    school_enrollment_primary_percentage_male_gross >= 0
    and school_enrollment_primary_percentage_male_gross <= 200
  ),
  school_enrollment_primary_percentage_male_net numeric check (
    school_enrollment_primary_percentage_male_net >= 0
    and school_enrollment_primary_percentage_male_net <= 100
  ),
  school_enrollment_secondary_percentage_gross numeric check (
    school_enrollment_secondary_percentage_gross >= 0
    and school_enrollment_secondary_percentage_gross <= 200
  ),
  school_enrollment_secondary_percentage_net numeric check (
    school_enrollment_secondary_percentage_net >= 0
    and school_enrollment_secondary_percentage_net <= 100
  ),
  school_enrollment_secondary_percentage_female_gross numeric check (
    school_enrollment_secondary_percentage_female_gross >= 0
    and school_enrollment_secondary_percentage_female_gross <= 200
  ),
  school_enrollment_secondary_percentage_female_net numeric check (
    school_enrollment_secondary_percentage_female_net >= 0
    and school_enrollment_secondary_percentage_female_net <= 100
  ),
  school_enrollment_secondary_percentage_male_gross numeric check (
    school_enrollment_secondary_percentage_male_gross >= 0
    and school_enrollment_secondary_percentage_male_gross <= 200
  ),
  school_enrollment_secondary_percentage_male_net numeric check (
    school_enrollment_secondary_percentage_male_net >= 0
    and school_enrollment_secondary_percentage_male_net <= 100
  ),
  school_enrollment_tertiary_percentage_gross numeric check (
    school_enrollment_tertiary_percentage_gross >= 0
    and school_enrollment_tertiary_percentage_gross <= 200
  ),
  school_enrollment_tertiary_percentage_female_gross numeric check (
    school_enrollment_tertiary_percentage_female_gross >= 0
    and school_enrollment_tertiary_percentage_female_gross <= 200
  )
);

create table climate(
  climate_key serial primary key,
  country_code text,
  yr integer check (
    yr >= 2005
    and yr <= 2020
  ),
  average_annual_precipitation_mm integer check (
    average_annual_precipitation_mm >= 0
    and average_annual_precipitation_mm <= 10000
  ),
  agricultural_land_percent_of_total numeric check (
    agricultural_land_percent_of_total >= 0
    and agricultural_land_percent_of_total <= 100
  ),
  forest_land_percent_of_total numeric check (
    forest_land_percent_of_total >= 0
    and forest_land_percent_of_total <= 100
  ),
  terrestrial_and_marine_protected_area_percent numeric check (
    terrestrial_and_marine_protected_area_percent >= 0
    and terrestrial_and_marine_protected_area_percent <= 100
  ),
  terrestrial_protected_area_percent numeric check (
    terrestrial_protected_area_percent >= 0
    and terrestrial_protected_area_percent <= 100
  ),
  annual_freshwater_withdrawals_percent_of_total numeric check (
    annual_freshwater_withdrawals_percent_of_total >= 0
    and annual_freshwater_withdrawals_percent_of_total <= 1000
  ),
  num_of_bird_species_threatened integer check (
    num_of_bird_species_threatened >= 0
    and num_of_bird_species_threatened <= 1000
  ),
  num_of_fish_species_threatened integer check (
    num_of_fish_species_threatened >= 0
    and num_of_fish_species_threatened <= 1000
  ),
  num_of_mammal_species_threatened integer check (
    num_of_mammal_species_threatened >= 0
    and num_of_mammal_species_threatened <= 1000
  ),
  percent_population_exposed_air_pollution_over_who_guideline numeric check (
    percent_population_exposed_air_pollution_over_who_guideline >= 0
    and percent_population_exposed_air_pollution_over_who_guideline <= 100
  ),
  co2_emissions_kt bigint check (
    co2_emissions_kt >= 0
    and co2_emissions_kt <= 1000000000
  ),
  co2_emissions_metric_tons_per_capita numeric check (
    co2_emissions_metric_tons_per_capita >= 0
    and co2_emissions_metric_tons_per_capita <= 100
  ),
  total_ghg_emissions_kt_of_co2_equivalent bigint check (
    total_ghg_emissions_kt_of_co2_equivalent >= 0
    and total_ghg_emissions_kt_of_co2_equivalent <= 1000000000
  )
);


CREATE TABLE public.health
(
    health_key integer NOT NULL DEFAULT nextval('health_health_key_seq'::regclass),
    hospital_beds_per_1000 numeric,
    nurses_and_midwives_per_1000 numeric,
    physicians_per_1000 numeric,
    hiv_per_1000 numeric,
    prevalence_hiv_female_15_to_24_year_old_percentage numeric,
    prevalence_hiv_male_15_to_24_year_old_percentage numeric,
    hiv_adults_newly_infected integer,
    hiv_children_newly_infected integer,
    aids_death integer,
    tuberculosis_per_100000 numeric,
    tuberculosis_death_rate_per_100000 numeric,
    incidence_of_malaria_per_1000 numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per numeric,
    total_undernourished integer,
    prevalence_of_undernourishment_percentage numeric,
    health_expenditure_per_capita numeric,
    domestic_general_government_health_expenditure_per_capita numeric,
    domestic_private_health_expenditure_per_capita numeric,
    immunization_hepb3_percentage_of_one_year_olds numeric,
    immunization_dpt_percentage_of_12_to_23_months_old numeric,
    immunization_measles_two_doses_percentage_children numeric,
    immunization_pol3_percentage_of_one_year_olds numeric,
    mortality_rate_adult_female_per_1000 numeric,
    mortality_rate_adult_male_per_1000 numeric,
    mortality_rate_infant_per_1000 numeric,
    mortality_rate_infant_female_per_1000 numeric,
    mortality_rate_infant_male_per_1000 numeric,
    number_of_stillbirths integer,
    prevalence_of_overweight_adults_percentage numeric,
    prevalence_of_overweight_male_adults_percentage numeric,
    prevalence_of_anemia_children_6_to_59_months numeric,
    prevalence_of_anemia_women_15_to_49_years_percentage numeric,
    country_code text COLLATE pg_catalog."default",
    yr integer,
    prevalence_of_overweight_female_adults_percentage numeric,
    CONSTRAINT health_pkey PRIMARY KEY (health_key),
    CONSTRAINT prevalence_of_overweight_female_adults_percentage CHECK (prevalence_of_overweight_female_adults_percentage >= 0::numeric AND prevalence_of_overweight_female_adults_percentage <= 100::numeric),
    CONSTRAINT yr CHECK (yr >= 2005 AND yr <= 2020),
    CONSTRAINT health_aids_death_check CHECK (aids_death < 500000000),
    CONSTRAINT hospital_beds_per_1000 CHECK (hospital_beds_per_1000 >= 0::numeric AND hospital_beds_per_1000 <= 1000::numeric),
    CONSTRAINT nurses_and_midwives_per_1000 CHECK (nurses_and_midwives_per_1000 >= 0::numeric AND nurses_and_midwives_per_1000 <= 1000::numeric),
    CONSTRAINT physicians_per_1000 CHECK (physicians_per_1000 >= 0::numeric AND physicians_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_per_1000 CHECK (hiv_per_1000 >= 0::numeric AND hiv_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_female_ages_15_to_24_years_old_per_1000 CHECK (prevalence_hiv_female_15_to_24_year_old_percentage >= 0::numeric AND prevalence_hiv_female_15_to_24_year_old_percentage <= 1000::numeric),
    CONSTRAINT hiv_male_ages_15_to_24_years_old_per_1000 CHECK (prevalence_hiv_male_15_to_24_year_old_percentage >= 0::numeric AND prevalence_hiv_male_15_to_24_year_old_percentage <= 1000::numeric),
    CONSTRAINT hiv_adults_newly_infected CHECK (hiv_adults_newly_infected >= 0 AND hiv_adults_newly_infected <= 500000000),
    CONSTRAINT hiv_children_newly_infected CHECK (hiv_children_newly_infected >= 0 AND hiv_children_newly_infected <= 500000000),
    CONSTRAINT health_tuberculosis_per_100000_check CHECK (tuberculosis_per_100000 >= 0::numeric AND tuberculosis_per_100000 <= 100000::numeric),
    CONSTRAINT health_tuberculosis_death_rate_per_100000_check CHECK (tuberculosis_death_rate_per_100000 >= 0::numeric AND tuberculosis_death_rate_per_100000 <= 100000::numeric),
    CONSTRAINT health_incidence_of_malaria_per_100000_check CHECK (incidence_of_malaria_per_1000 >= 0::numeric AND incidence_of_malaria_per_1000 <= 100000::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_ol_check CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage <= 100::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_o_check1 CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce <= 100::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_o_check2 CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per <= 100::numeric),
    CONSTRAINT health_total_undernourished_check CHECK (total_undernourished <= 2000000000),
    CONSTRAINT health_prevalance_of_undernourishment_percentage_check CHECK (prevalence_of_undernourishment_percentage >= 0::numeric AND prevalence_of_undernourishment_percentage <= 100::numeric),
    CONSTRAINT health_health_expenditure_per_capita_check CHECK (health_expenditure_per_capita <= 2000000000::numeric),
    CONSTRAINT health_immunization_hepb3_percentage_of_one_year_olds_check CHECK (immunization_hepb3_percentage_of_one_year_olds >= 0::numeric AND immunization_hepb3_percentage_of_one_year_olds <= 100::numeric),
    CONSTRAINT health_immunization_dpt_percentage_of_12_to_23_months_old_check CHECK (immunization_dpt_percentage_of_12_to_23_months_old >= 0::numeric AND immunization_dpt_percentage_of_12_to_23_months_old <= 100::numeric),
    CONSTRAINT health_immunization_measles_two_doses_percentage_children_check CHECK (immunization_measles_two_doses_percentage_children >= 0::numeric AND immunization_measles_two_doses_percentage_children <= 100::numeric),
    CONSTRAINT health_immunization_pol3_percentage_of_one_year_olds_check CHECK (immunization_pol3_percentage_of_one_year_olds >= 0::numeric AND immunization_pol3_percentage_of_one_year_olds <= 100::numeric),
    CONSTRAINT health_mortality_rate_adult_female_per_1000_check CHECK (mortality_rate_adult_female_per_1000 >= 0::numeric AND mortality_rate_adult_female_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_adult_male_per_1000_check CHECK (mortality_rate_adult_male_per_1000 >= 0::numeric AND mortality_rate_adult_male_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_per_1000_check CHECK (mortality_rate_infant_per_1000 >= 0::numeric AND mortality_rate_infant_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_female_per_1000_check CHECK (mortality_rate_infant_female_per_1000 >= 0::numeric AND mortality_rate_infant_female_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_male_per_1000_check CHECK (mortality_rate_infant_male_per_1000 >= 0::numeric AND mortality_rate_infant_male_per_1000 <= 1000::numeric),
    CONSTRAINT health_number_of_stillbirths_check CHECK (number_of_stillbirths < 2000000000),
    CONSTRAINT health_prevalence_of_overweight_adults_percentage_check CHECK (prevalence_of_overweight_adults_percentage >= 0::numeric AND prevalence_of_overweight_adults_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_overweight_male_adults_percentage_check CHECK (prevalence_of_overweight_male_adults_percentage >= 0::numeric AND prevalence_of_overweight_male_adults_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_anemia_children_6_to_59_months_perce_check CHECK (prevalence_of_anemia_children_6_to_59_months >= 0::numeric AND prevalence_of_anemia_children_6_to_59_months <= 100::numeric),
    CONSTRAINT health_prevalence_of_anemia_women_15_to_49_years_percenta_check CHECK (prevalence_of_anemia_women_15_to_49_years_percentage >= 0::numeric AND prevalence_of_anemia_women_15_to_49_years_percentage <= 100::numeric)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;


---quality of life table: ------

ALTER TABLE quality_of_life

  ADD quality_of_life_key serial primary key,
  ADD access_at_least_drinking_basic_water_percentage numeric check (
    access_at_least_drinking_basic_water_percentage >= 0
    and access_at_least_drinking_basic_water_percentage <= 100000000000000
  ),
  ADD access_at_least_drinking_basic_water_urban_percentage  numeric check (
    access_at_least_drinking_basic_water_urban_percentage >= 0
    and access_at_least_drinking_basic_water_urban_percentage <= 100000000000000
  ),
  ADD access_at_least_drinking_basic_water_rural_percentage  numeric check (
    access_at_least_drinking_basic_water_rural_percentage >= 0
    and access_at_least_drinking_basic_water_rural_percentage <= 100000000000000
  ),

  ADD access_safely_managed_drinking_water_percentage   numeric check (
    access_safely_managed_drinking_water_percentage  >= 0
    and access_safely_managed_drinking_water_percentage  <= 100000000000000
 ),
  ADD access_safely_managed_drinking_water_urban_percentage    numeric check (
    access_safely_managed_drinking_water_urban_percentage   >= 0
    and access_safely_managed_drinking_water_urban_percentage   <= 100000000000000
 ),
 ADD access_safely_managed_drinking_water_rural_percentage    numeric check (
    access_safely_managed_drinking_water_rural_percentage   >= 0
    and access_safely_managed_drinking_water_rural_percentage   <= 100000000000000
 ),
 ADD access_handwashing_facilities_percentage    numeric check (
    access_handwashing_facilities_percentage   >= 0
    and access_handwashing_facilities_percentage   <= 100000000000000
 ),
 ADD access_handwashing_facilities_urban_percentage    numeric check (
    access_handwashing_facilities_urban_percentage   >= 0
    and access_handwashing_facilities_urban_percentage   <= 100000000000000
 ),
 ADD access_handwashing_facilities_rural_percentage    numeric check (
    access_handwashing_facilities_rural_percentage   >= 0
    and access_handwashing_facilities_rural_percentage   <= 100000000000000
 ),
 ADD mortality_rate_unsafe_water_or_sanitation_per_1000    numeric check (
    mortality_rate_unsafe_water_or_sanitation_per_1000    >= 0
    and mortality_rate_unsafe_water_or_sanitation_per_1000    <= 100000000000000
 ),
 ADD maternal_leave_benefits_percentage_of_wages     numeric check (
    maternal_leave_benefits_percentage_of_wages    >= 0
    and maternal_leave_benefits_percentage_of_wages    <= 100000000000000
 ),
 ADD maternal_mortality_ratio     numeric check (
    maternal_mortality_ratio    >= 0
    and maternal_mortality_ratio    <= 100000000000000
 ),
 ADD lifetime_risk_maternal_death_percentage     numeric check (
    lifetime_risk_maternal_death_percentage    >= 0
    and lifetime_risk_maternal_death_percentage    <= 100000000000000
 );
 

  ADD country_code  varchar,
  ADD yr integer;



---- country table: -----

ALTER TABLE country

ALTER TABLE country

   ADD country_code  varchar,
  ADD yr integer,
ADD total_population_count integer check (
    total_population_count >= 0
    and total_population_count <= 100000000000000
  ),
 ADD fertility_rate   numeric check (
    fertility_rate  >= 0
    and fertility_rate  <= 100000000000000
 ),
 ADD suicide_death_rate    numeric check (
    suicide_death_rate   >= 0
    and suicide_death_rate   <= 100000000000000
 ),
 ADD age_dependency_ratio_percent_working_age    numeric check (
    age_dependency_ratio_percent_working_age   >= 0
    and age_dependency_ratio_percent_working_age   <= 100000000000000
 ),
 ADD age_dependency_ratio_old    numeric check (
    age_dependency_ratio_old   >= 0
    and age_dependency_ratio_old   <= 100000000000000
 ),
 ADD age_dependency_ratio_young    numeric check (
    age_dependency_ratio_young   >= 0
    and age_dependency_ratio_young   <= 100000000000000
 ),
   ADD income_group text,
  ADD region text,
  ADD currency_type text,
  ADD trade_system text,
ADD government_accounting_concept text,
  ADD two_alpha_code text,
ADD short_name text,
ADD land_area_in_square_km    numeric check (
    land_area_in_square_km   >= 0
    and land_area_in_square_km   <= 100000000000000
 ),
   ADD continent text,
  ADD capital_city text,
  ADD leader_name text,
  ADD party_stance text,
  ADD government_type text;






----population table-----
ALTER TABLE population

  ADD population_key serial primary key,
  
  ADD country_code  varchar,
  ADD yr integer,

ADD life_expectancy_at_birth_for_females  numeric check (
    life_expectancy_at_birth_for_females   >= 0
    and life_expectancy_at_birth_for_females   <= 100000000000000
 ),
  
  ADD life_expectancy_at_birth_for_males  numeric check (
    life_expectancy_at_birth_for_males  >= 0
    and life_expectancy_at_birth_for_males  <= 100000000000000
  ),

  
  ADD net_migration  numeric check (
    net_migration  >= 0
    and net_migration  <= 100000000000000
 ),
 ADD percent_demographics_in_rural     numeric check (
    percent_demographics_in_rural    >= 0
    and percent_demographics_in_rural    <= 100000000000000
 ),
 ADD percent_demographics_in_urban     numeric check (
    percent_demographics_in_urban    >= 0
    and percent_demographics_in_urban    <= 100000000000000
 ),
 ADD percent_poverty_headcount_ratio_at_national_poverty_line    numeric check (
    percent_poverty_headcount_ratio_at_national_poverty_line   >= 0
    and percent_poverty_headcount_ratio_at_national_poverty_line   <= 100000000000000
 ),
 ADD percent_rural_poverty_headcount_ratio_at_national_poverty_line    numeric check (
    percent_rural_poverty_headcount_ratio_at_national_poverty_line   >= 0
    and percent_rural_poverty_headcount_ratio_at_national_poverty_line   <= 100000000000000
 ),
 ADD percent_urban_poverty_headcount_ratio_at_national_poverty_line    numeric check (
    percent_urban_poverty_headcount_ratio_at_national_poverty_line    >= 0
    and percent_urban_poverty_headcount_ratio_at_national_poverty_line    <= 100000000000000
 ),
 ADD percent_population_growth   numeric check (
    percent_population_growth    >= 0
    and percent_population_growth    <= 100000000000000
 ),
  ADD percent_rural_population_growth    numeric check (
    percent_rural_population_growth     >= 0
    and percent_rural_population_growth     <= 100000000000000
 ),
  ADD percent_urban_population_growth    numeric check (
    percent_urban_population_growth     >= 0
    and percent_urban_population_growth     <= 100000000000000
 ),
  ADD percent_population_female   numeric check (
    percent_population_female    >= 0
    and percent_population_female    <= 100000000000000
 ),
  ADD percent_population_male   numeric check (
    percent_population_male    >= 0
    and percent_population_male    <= 100000000000000
 ),
  ADD percent_population_ages_0_to_14_female   numeric check (
    percent_population_ages_0_to_14_female    >= 0
    and percent_population_ages_0_to_14_female    <= 100000000000000
 ),
 ADD percent_population_ages_0_to_14_male   numeric check (
    percent_population_ages_0_to_14_male    >= 0
    and percent_population_ages_0_to_14_male    <= 100000000000000
 ),
 ADD percent_population_ages_15_to_19_female   numeric check (
    percent_population_ages_15_to_19_female    >= 0
    and percent_population_ages_15_to_19_female    <= 100000000000000
 ),
 ADD percent_population_ages_15_to_19_male   numeric check (
    percent_population_ages_15_to_19_male    >= 0
    and percent_population_ages_15_to_19_male    <= 100000000000000
 ),
 ADD percent_population_ages_20_to_24_female   numeric check (
    percent_population_ages_20_to_24_female    >= 0
    and percent_population_ages_20_to_24_female    <= 100000000000000
 ),
 ADD percent_population_ages_20_to_24_male   numeric check (
    percent_population_ages_20_to_24_male    >= 0
    and percent_population_ages_20_to_24_male    <= 100000000000000
 ),
  ADD percent_population_ages_25_to_29_female   numeric check (
    percent_population_ages_25_to_29_female    >= 0
    and percent_population_ages_25_to_29_female    <= 100000000000000
 ),
  ADD percent_population_ages_25_to_29_male   numeric check (
    percent_population_ages_25_to_29_male    >= 0
    and percent_population_ages_25_to_29_male    <= 100000000000000
 ),
  ADD percent_population_ages_30_to_34_female   numeric check (
    percent_population_ages_30_to_34_female    >= 0
    and percent_population_ages_30_to_34_female    <= 100000000000000
 ),
  ADD percent_population_ages_30_to_34_male   numeric check (
    percent_population_ages_30_to_34_male    >= 0
    and percent_population_ages_30_to_34_male    <= 100000000000000
 ),
  ADD percent_population_ages_35_to_39_female   numeric check (
    percent_population_ages_35_to_39_female    >= 0
    and percent_population_ages_35_to_39_female    <= 100000000000000
 ),
  ADD percent_population_ages_35_to_39_male   numeric check (
    percent_population_ages_35_to_39_male    >= 0
    and percent_population_ages_35_to_39_male    <= 100000000000000
 ),
  ADD percent_population_ages_40_to_44_female   numeric check (
    percent_population_ages_40_to_44_female    >= 0
    and percent_population_ages_40_to_44_female    <= 100000000000000
 ),
  ADD percent_population_ages_40_to_44_male   numeric check (
    percent_population_ages_40_to_44_male    >= 0
    and percent_population_ages_40_to_44_male    <= 100000000000000
 ),
  ADD percent_population_ages_45_to_49_female   numeric check (
    percent_population_ages_45_to_49_female    >= 0
    and percent_population_ages_45_to_49_female    <= 100000000000000
 ),
  ADD percent_population_ages_45_to_49_male   numeric check (
    percent_population_ages_45_to_49_male    >= 0
    and percent_population_ages_45_to_49_male    <= 100000000000000
 ),
  ADD percent_population_ages_50_to_54_female   numeric check (
    percent_population_ages_50_to_54_female    >= 0
    and percent_population_ages_50_to_54_female    <= 100000000000000
 ),
  ADD percent_population_ages_50_to_54_male   numeric check (
    percent_population_ages_50_to_54_male    >= 0
    and percent_population_ages_50_to_54_male    <= 100000000000000
 ),
  ADD percent_population_ages_55_to_59_female   numeric check (
    percent_population_ages_55_to_59_female    >= 0
    and percent_population_ages_55_to_59_female    <= 100000000000000
 ),
  ADD percent_population_ages_55_to_59_male   numeric check (
    percent_population_ages_55_to_59_male    >= 0
    and percent_population_ages_55_to_59_male    <= 100000000000000
 ),
  ADD percent_population_ages_60_to_64_female   numeric check (
    percent_population_ages_60_to_64_female    >= 0
    and percent_population_ages_60_to_64_female    <= 100000000000000
 ),
  ADD percent_population_ages_60_to_64_male   numeric check (
    percent_population_ages_60_to_64_male    >= 0
    and percent_population_ages_60_to_64_male    <= 100000000000000
 ),
  ADD percent_population_ages_65_and_above_female   numeric check (
    percent_population_ages_65_and_above_female    >= 0
    and percent_population_ages_65_and_above_female    <= 100000000000000
 ),
  ADD percent_population_ages_65_and_above_male   numeric check (
    percent_population_ages_65_and_above_male    >= 0
    and percent_population_ages_65_and_above_male    <= 100000000000000
 );
  
--population add v2:
ALTER TABLE population
  
  ADD country_code  varchar,
  ADD yr integer,

ADD life_expectancy_at_birth_for_females  numeric,
  
  ADD life_expectancy_at_birth_for_males  numeric,

  
  ADD net_migration  numeric ,
 ADD percent_demographics_in_rural     numeric ,
 ADD percent_demographics_in_urban     numeric ,
 ADD percent_poverty_headcount_ratio_at_national_poverty_line    numeric ,
 ADD percent_rural_poverty_headcount_ratio_at_national_poverty_line    numeric ,
 ADD percent_urban_poverty_headcount_ratio_at_national_poverty_line    numeric ,
 ADD percent_population_growth   numeric ,
  ADD percent_rural_population_growth    numeric ,
  ADD percent_urban_population_growth    numeric ,
  ADD percent_population_female   numeric ,
  ADD percent_population_male   numeric ,
  ADD percent_population_ages_0_to_14_female   numeric ,
 ADD percent_population_ages_0_to_14_male   numeric ,
 ADD percent_population_ages_15_to_19_female   numeric ,
 ADD percent_population_ages_15_to_19_male   numeric ,
 ADD percent_population_ages_20_to_24_female   numeric ,
 ADD percent_population_ages_20_to_24_male   numeric ,
  ADD percent_population_ages_25_to_29_female   numeric ,
  ADD percent_population_ages_25_to_29_male   numeric ,
  ADD percent_population_ages_30_to_34_female   numeric ,
  ADD percent_population_ages_30_to_34_male   numeric ,
  ADD percent_population_ages_35_to_39_female   numeric ,
  ADD percent_population_ages_35_to_39_male   numeric ,
  ADD percent_population_ages_40_to_44_female   numeric ,
  ADD percent_population_ages_40_to_44_male   numeric ,
  ADD percent_population_ages_45_to_49_female   numeric ,
  ADD percent_population_ages_45_to_49_male   numeric ,
  ADD percent_population_ages_50_to_54_female   numeric ,
  ADD percent_population_ages_50_to_54_male   numeric ,
  ADD percent_population_ages_55_to_59_female   numeric ,
  ADD percent_population_ages_55_to_59_male   numeric ,
  ADD percent_population_ages_60_to_64_female   numeric ,
  ADD percent_population_ages_60_to_64_male   numeric ,
  ADD percent_population_ages_65_and_above_female   numeric ,
  ADD percent_population_ages_65_and_above_male   numeric;
  
  

----DROPS----
----drop for population:----
ALTER TABLE population
  
  DROP COLUMN life_expectancy_at_birth_for_males,

  DROP COLUMN life_expectancy_at_birth_for_females,
  DROP COLUMN net_migration,
 DROP COLUMN percent_demographics_in_rural,
 DROP COLUMN percent_demographics_in_urban, 
 DROP COLUMN percent_poverty_headcount_ratio_at_national_poverty_line,
 DROP COLUMN percent_rural_poverty_headcount_ratio_at_national_poverty_line,
 DROP COLUMN percent_urban_poverty_headcount_ratio_at_national_poverty_line,
 DROP COLUMN percent_population_growth,
  DROP COLUMN percent_rural_population_growth,
  DROP COLUMN percent_urban_population_growth,
  DROP COLUMN percent_population_female,
  DROP COLUMN percent_population_male,
  DROP COLUMN percent_population_ages_0_to_14_female,
 DROP COLUMN percent_population_ages_0_to_14_male,
 DROP COLUMN percent_population_ages_15_to_19_female,
 DROP COLUMN percent_population_ages_15_to_19_male,
 DROP COLUMN percent_population_ages_20_to_24_female,
 DROP COLUMN percent_population_ages_20_to_24_male,
  DROP COLUMN percent_population_ages_25_to_29_female,
  DROP COLUMN percent_population_ages_25_to_29_male,
  DROP COLUMN percent_population_ages_30_to_34_female,
  DROP COLUMN percent_population_ages_30_to_34_male,
  DROP COLUMN percent_population_ages_35_to_39_female,
  DROP COLUMN percent_population_ages_35_to_39_male,
  DROP COLUMN percent_population_ages_40_to_44_female,
  DROP COLUMN percent_population_ages_40_to_44_male ,
  DROP COLUMN percent_population_ages_45_to_49_female ,
  DROP COLUMN percent_population_ages_45_to_49_male ,
  DROP COLUMN percent_population_ages_50_to_54_female ,
  DROP COLUMN percent_population_ages_50_to_54_male ,
  DROP COLUMN percent_population_ages_55_to_59_female,
  DROP COLUMN percent_population_ages_55_to_59_male,
  DROP COLUMN percent_population_ages_60_to_64_female ,
  DROP COLUMN percent_population_ages_60_to_64_male,
  DROP COLUMN percent_population_ages_65_and_above_female ,
  DROP COLUMN percent_population_ages_65_and_above_male ,
  

  DROP COLUMN country_code,
  DROP COLUMN yr;


--

ALTER TABLE country

  DROP COLUMN name,
  DROP COLUMN continent,
  DROP COLUMN capital_city,
  DROP COLUMN region,
  DROP COLUMN income_group,
  DROP COLUMN trade_system,
  DROP COLUMN two_alpha_code,
  DROP COLUMN leader_name,
  DROP COLUMN party_stance,
  DROP COLUMN government_type,
  DROP COLUMN currency_type,
  DROP COLUMN total_population_count,
  DROP COLUMN population_density,

  DROP COLUMN fertility_rate,
  DROP COLUMN suicide_death_rate ,
 DROP COLUMN age_dependency_ratio_percent_working_age  ,
 DROP COLUMN age_dependency_ratio_old ,
 DROP COLUMN age_dependency_ratio_young ,
 DROP COLUMN land_area_in_square_km ,
 DROP COLUMN average_age ,
 

  DROP COLUMN country_code ,
  DROP COLUMN yr;

