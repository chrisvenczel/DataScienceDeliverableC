-- Table: public.health

-- DROP TABLE public.health;

CREATE TABLE public.health
(
    health_key integer NOT NULL DEFAULT nextval('health_health_key_seq'::regclass),
    hospital_beds_per_1000 numeric,
    community_health_workers_per_1000 numeric,
    nurses_and_midwives_per_1000 numeric,
    physicians_per_1000 numeric,
    total_births integer,
    total_deaths integer,
    disease_rate_per_1000 numeric,
    hiv_per_1000 numeric,
    hiv_female_ages_15_to_24_years_old_per_1000 numeric,
    hiv_male_ages_15_to_24_years_old_per_1000 numeric,
    hiv_adults_newly_infected integer,
    hiv_children_newly_infected integer,
    aids_death integer,
    tuberculosis_per_100000 numeric,
    tuberculosis_death_rate_per_100000 numeric,
    incidence_of_malaria_per_100000 numeric,
    prevalance_of_syphilis_women_antenatal_care_percentage numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce numeric,
    mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per numeric,
    total_undernourished integer,
    prevalance_of_undernourishment_percentage numeric,
    health_expenditure_per_capita numeric,
    domestic_general_government_health_expenditure numeric,
    domestic_private_health_expenditure_per_capita numeric,
    immunization_hepb3_percentage_of_one_year_olds numeric,
    immunization_dpt_percentage_of_12_to_23_months_olds numeric,
    immunization_measles_two_doses_percentage_children numeric,
    immunization_pol3_percentage_of_one_year_olds numeric,
    percent_disease_death_rate_by_communicable_disease numeric,
    percent_disease_death_rate_by_non_communicable_disease numeric,
    mortality_rate_adult_female_per_1000 numeric,
    mortality_rate_adult_male_per_1000 numeric,
    mortality_rate_infant_per_1000 numeric,
    mortality_rate_infant_female_per_1000 numeric,
    mortality_rate_infant_male_per_1000 numeric,
    number_of_stillbirths integer,
    prevalence_of_stunting_children_under_5_percentage numeric,
    prevalence_of_stunting_female_children_under_5_percentage numeric,
    prevalence_of_stunting_male_children_under_5_percentage numeric,
    prevalence_of_overweight_adults_percentage numeric,
    prevalence_of_overweight_male_adults_percentage numeric,
    prevalence_of_overweight_female_adults_percentage numeric,
    prevalence_of_overweight_children_under_5_percentage numeric,
    prevelance_of_severe_wasting_children_under_5_percentage numeric,
    prevelance_of_severe_wasting_male_children_under_5_percentage numeric,
    prevelance_of_severe_wasting_female_children_under_5_percentage numeric,
    prevalence_of_underweight_children_under_5_percentage numeric,
    prevalence_of_underweight_male_children_under_5_percentage numeric,
    prevalence_of_underweight_female_children_under_5_percentage numeric,
    prevalence_of_wasting_children_under_5_percentage numeric,
    prevalence_of_wasting_male_children_under_5_percentage numeric,
    prevalence_of_wasting_female_children_under_5_percentage numeric,
    prevalence_of_diabetes_20_to_79_years_old_percentage numeric,
    prevalence_of_anemia_children_6_to_59_months_percentage numeric,
    prevalence_of_anemia_women_15_to_49_years_percentage numeric,
    CONSTRAINT health_pkey PRIMARY KEY (health_key),
    CONSTRAINT total_deaths CHECK (total_deaths >= 0 AND total_deaths <= 500000000),
    CONSTRAINT health_aids_death_check CHECK (aids_death < 500000000),
    CONSTRAINT hospital_beds_per_1000 CHECK (hospital_beds_per_1000 >= 0::numeric AND hospital_beds_per_1000 <= 1000::numeric),
    CONSTRAINT community_health_workers_per_1000 CHECK (community_health_workers_per_1000 >= 0::numeric AND community_health_workers_per_1000 <= 1000::numeric),
    CONSTRAINT nurses_and_midwives_per_1000 CHECK (nurses_and_midwives_per_1000 >= 0::numeric AND nurses_and_midwives_per_1000 <= 1000::numeric),
    CONSTRAINT physicians_per_1000 CHECK (physicians_per_1000 >= 0::numeric AND physicians_per_1000 <= 1000::numeric),
    CONSTRAINT total_births CHECK (total_births >= 0 AND total_births <= 500000000),
    CONSTRAINT disease_rate_per_1000 CHECK (disease_rate_per_1000 >= 0::numeric AND disease_rate_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_per_1000 CHECK (hiv_per_1000 >= 0::numeric AND hiv_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_female_ages_15_to_24_years_old_per_1000 CHECK (hiv_female_ages_15_to_24_years_old_per_1000 >= 0::numeric AND hiv_female_ages_15_to_24_years_old_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_male_ages_15_to_24_years_old_per_1000 CHECK (hiv_male_ages_15_to_24_years_old_per_1000 >= 0::numeric AND hiv_male_ages_15_to_24_years_old_per_1000 <= 1000::numeric),
    CONSTRAINT hiv_adults_newly_infected CHECK (hiv_adults_newly_infected >= 0 AND hiv_adults_newly_infected <= 500000000),
    CONSTRAINT hiv_children_newly_infected CHECK (hiv_children_newly_infected >= 0 AND hiv_children_newly_infected <= 500000000),
    CONSTRAINT health_tuberculosis_per_100000_check CHECK (tuberculosis_per_100000 >= 0::numeric AND tuberculosis_per_100000 <= 100000::numeric),
    CONSTRAINT health_tuberculosis_death_rate_per_100000_check CHECK (tuberculosis_death_rate_per_100000 >= 0::numeric AND tuberculosis_death_rate_per_100000 <= 100000::numeric),
    CONSTRAINT health_incidence_of_malaria_per_100000_check CHECK (incidence_of_malaria_per_100000 >= 0::numeric AND incidence_of_malaria_per_100000 <= 100000::numeric),
    CONSTRAINT health_prevalance_of_syphilis_women_antenatal_care_percen_check CHECK (prevalance_of_syphilis_women_antenatal_care_percentage >= 0::numeric AND prevalance_of_syphilis_women_antenatal_care_percentage <= 100::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_ol_check CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_percentage <= 100::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_o_check1 CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_male_perce <= 100::numeric),
    CONSTRAINT health_mortality_cvd_cancer_diabetes_crd_30_to_70_year_o_check2 CHECK (mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per >= 0::numeric AND mortality_cvd_cancer_diabetes_crd_30_to_70_year_olds_female_per <= 100::numeric),
    CONSTRAINT health_total_undernourished_check CHECK (total_undernourished <= 2000000000),
    CONSTRAINT health_prevalance_of_undernourishment_percentage_check CHECK (prevalance_of_undernourishment_percentage >= 0::numeric AND prevalance_of_undernourishment_percentage <= 100::numeric),
    CONSTRAINT health_health_expenditure_per_capita_check CHECK (health_expenditure_per_capita <= 2000000000::numeric),
    CONSTRAINT health_immunization_hepb3_percentage_of_one_year_olds_check CHECK (immunization_hepb3_percentage_of_one_year_olds >= 0::numeric AND immunization_hepb3_percentage_of_one_year_olds <= 100::numeric),
    CONSTRAINT health_immunization_dpt_percentage_of_12_to_23_months_old_check CHECK (immunization_dpt_percentage_of_12_to_23_months_olds >= 0::numeric AND immunization_dpt_percentage_of_12_to_23_months_olds <= 100::numeric),
    CONSTRAINT health_immunization_measles_two_doses_percentage_children_check CHECK (immunization_measles_two_doses_percentage_children >= 0::numeric AND immunization_measles_two_doses_percentage_children <= 100::numeric),
    CONSTRAINT health_immunization_pol3_percentage_of_one_year_olds_check CHECK (immunization_pol3_percentage_of_one_year_olds >= 0::numeric AND immunization_pol3_percentage_of_one_year_olds <= 100::numeric),
    CONSTRAINT health_percent_disease_death_rate_by_communicable_disease_check CHECK (percent_disease_death_rate_by_communicable_disease >= 0::numeric AND percent_disease_death_rate_by_communicable_disease <= 100000::numeric),
    CONSTRAINT health_percent_disease_death_rate_by_non_communicable_dis_check CHECK (percent_disease_death_rate_by_non_communicable_disease >= 0::numeric AND percent_disease_death_rate_by_non_communicable_disease <= 100000::numeric),
    CONSTRAINT health_mortality_rate_adult_female_per_1000_check CHECK (mortality_rate_adult_female_per_1000 >= 0::numeric AND mortality_rate_adult_female_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_adult_male_per_1000_check CHECK (mortality_rate_adult_male_per_1000 >= 0::numeric AND mortality_rate_adult_male_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_per_1000_check CHECK (mortality_rate_infant_per_1000 >= 0::numeric AND mortality_rate_infant_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_female_per_1000_check CHECK (mortality_rate_infant_female_per_1000 >= 0::numeric AND mortality_rate_infant_female_per_1000 <= 1000::numeric),
    CONSTRAINT health_mortality_rate_infant_male_per_1000_check CHECK (mortality_rate_infant_male_per_1000 >= 0::numeric AND mortality_rate_infant_male_per_1000 <= 1000::numeric),
    CONSTRAINT health_number_of_stillbirths_check CHECK (number_of_stillbirths < 2000000000),
    CONSTRAINT health_prevalence_of_stunting_children_under_5_percentage_check CHECK (prevalence_of_stunting_children_under_5_percentage >= 0::numeric AND prevalence_of_stunting_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_stunting_female_children_under_5_per_check CHECK (prevalence_of_stunting_female_children_under_5_percentage >= 0::numeric AND prevalence_of_stunting_female_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_stunting_male_children_under_5_perce_check CHECK (prevalence_of_stunting_male_children_under_5_percentage >= 0::numeric AND prevalence_of_stunting_male_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_overweight_adults_percentage_check CHECK (prevalence_of_overweight_adults_percentage >= 0::numeric AND prevalence_of_overweight_adults_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_overweight_male_adults_percentage_check CHECK (prevalence_of_overweight_male_adults_percentage >= 0::numeric AND prevalence_of_overweight_male_adults_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_overweight_female_adults_percentage_check CHECK (prevalence_of_overweight_female_adults_percentage >= 0::numeric AND prevalence_of_overweight_female_adults_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_overweight_children_under_5_percenta_check CHECK (prevalence_of_overweight_children_under_5_percentage >= 0::numeric AND prevalence_of_overweight_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevelance_of_severe_wasting_children_under_5_perc_check CHECK (prevelance_of_severe_wasting_children_under_5_percentage >= 0::numeric AND prevelance_of_severe_wasting_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevelance_of_severe_wasting_male_children_under_5_check CHECK (prevelance_of_severe_wasting_male_children_under_5_percentage >= 0::numeric AND prevelance_of_severe_wasting_male_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevelance_of_severe_wasting_female_children_under_check CHECK (prevelance_of_severe_wasting_female_children_under_5_percentage >= 0::numeric AND prevelance_of_severe_wasting_female_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_underweight_children_under_5_percent_check CHECK (prevalence_of_underweight_children_under_5_percentage >= 0::numeric AND prevalence_of_underweight_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_underweight_male_children_under_5_pe_check CHECK (prevalence_of_underweight_male_children_under_5_percentage >= 0::numeric AND prevalence_of_underweight_male_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_underweight_female_children_under_5__check CHECK (prevalence_of_underweight_female_children_under_5_percentage >= 0::numeric AND prevalence_of_underweight_female_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_wasting_children_under_5_percentage_check CHECK (prevalence_of_wasting_children_under_5_percentage >= 0::numeric AND prevalence_of_wasting_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_wasting_male_children_under_5_percen_check CHECK (prevalence_of_wasting_male_children_under_5_percentage >= 0::numeric AND prevalence_of_wasting_male_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_wasting_female_children_under_5_perc_check CHECK (prevalence_of_wasting_female_children_under_5_percentage >= 0::numeric AND prevalence_of_wasting_female_children_under_5_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_diabetes_20_to_79_years_old_percenta_check CHECK (prevalence_of_diabetes_20_to_79_years_old_percentage >= 0::numeric AND prevalence_of_diabetes_20_to_79_years_old_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_anemia_children_6_to_59_months_perce_check CHECK (prevalence_of_anemia_children_6_to_59_months_percentage >= 0::numeric AND prevalence_of_anemia_children_6_to_59_months_percentage <= 100::numeric),
    CONSTRAINT health_prevalence_of_anemia_women_15_to_49_years_percenta_check CHECK (prevalence_of_anemia_women_15_to_49_years_percentage >= 0::numeric AND prevalence_of_anemia_women_15_to_49_years_percentage <= 100::numeric)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.health
    OWNER to rtakw072;

GRANT ALL ON TABLE public.health TO cvenc066;

GRANT ALL ON TABLE public.health TO eassa062;

GRANT ALL ON TABLE public.health TO rtakw072;
