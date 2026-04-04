clear*
set maxvar 11000

global date _2025_10_28
cd "/Users/atri0032/Dropbox/World Bank/Temperature, poverty, and inequality/Estimations/"

***************** Data matching
import excel using "${date}/_data/spid_v2/subnational-poverty-inequality-spid-poverty.xlsx", clear firstrow

drop AB AC AD AE AF AG AH

// Match with weather and other data
sort geo_code2_new year
	merge m:1 geo_code2_new year using "${date}/_data/temperature.dta"
	drop if _merge==2
	drop _merge
	merge m:1 geo_code2_new year using "${date}/_data/rainfall.dta"
	drop if _merge==2
	drop _merge
	merge m:1 geo_code2_new year using "${date}/_data/humidity.dta"
	drop if _merge==2
	drop _merge
	merge m:1 geo_code2_new year using "${date}/_data/temperature_bin.dta"
	drop if _merge==2
	drop _merge
	merge m:1 geo_code2_new year using "${date}/_data/temperature_bin_region.dta"
	drop if _merge==2
	drop _merge
	merge m:1 geo_code2_new year using "${date}/_data/inequality_alternative.dta"
	drop if _merge==2
	drop _merge	
	merge m:1 geo_code2_new year using "${date}/_data/ndvi.dta"
	drop if _merge==2
	drop _merge	
	merge m:1 geo_code2_new year using "${date}/_data/soil.dta"
	drop if _merge==2
	drop _merge	
	merge m:1 geo_code2_new year using "${date}/_data/poverty_gap.dta"
	drop if _merge==2
	drop _merge	
	
// Label variables	
label var temp "Temperature"
label var rainfall_ave "Precipitation"
label var humid "Humidity"

// Convert poverty/inequality variables
for var poor* gini theil: replace X = X*100
for var gap*: replace X = X*100

// Combine SAR & SAS: both in South Asia
replace pip_reg = "SAR" if pip_reg=="SAS"

// Match with country-level characteristics for heterogeneity analysis
sort code
	merge m:1 code using "${date}/_data/agri_trade_manufacturing.dta"
	drop if _merge==2
	drop _merge
	merge m:1 code using "${date}/_data/democracy.dta"
	drop if _merge==2
	drop _merge
	merge m:1 code using "${date}/_data/ICT.dta"
	drop if _merge==2
	drop _merge
	merge m:1 code using "${date}/_data/countries_equator.dta"
	drop if _merge==2
	drop _merge
		
su temp

****************************** WDI characteristics
preserve
import delimited using "${date}/_data/WDI_additional1.csv", clear

gen indicator = ""
	replace indicator = "GDPppp" if seriesname=="GDP per capita, PPP (constant 2021 international $)"
	replace indicator = "GDP" if seriesname=="GDP per capita (constant 2015 US$)"
	replace indicator = "Unemp" if seriesname=="Unemployment, total (% of total labor force) (national estimate)"
	replace indicator = "Unempilo" if seriesname=="Unemployment, total (% of total labor force) (modeled ILO estimate)"
	replace indicator = "popgr" if seriesname=="Population growth (annual %)"
	replace indicator = "agri" if seriesname=="Agriculture, forestry, and fishing, value added (% of GDP)"
	replace indicator = "manuf" if seriesname=="Manufacturing, value added (% of GDP)"
	replace indicator = "tech" if seriesname=="High-technology exports (% of manufactured exports)"
	replace indicator = "eduter" if seriesname=="Educational attainment, at least Bachelor's or equivalent, population 25+, total (%) (cumulative)"
	replace indicator = "edupri" if seriesname=="Educational attainment, at least completed primary, population 25+ years, total (%) (cumulative)"
	
	replace indicator = "broad_money" if seriesname=="Broad money (% of GDP)"
	replace indicator = "edulowerpri" if seriesname=="Educational attainment, at least completed lower secondary, population 25+, total (%) (cumulative)"
	replace indicator = "edupostpri" if seriesname=="Educational attainment, at least completed post-secondary, population 25+, total (%) (cumulative)"
	replace indicator = "eduupperpri" if seriesname=="Educational attainment, at least completed upper secondary, population 25+, total (%) (cumulative)"
	replace indicator = "rule_of_law_est" if seriesname=="Rule of Law: Estimate"
	replace indicator = "rule_of_law_pct" if seriesname=="Rule of Law: Percentile Rank"
	replace indicator = "inflation" if seriesname=="Inflation, consumer prices (annual %)"
	replace indicator = "consumption_exp" if seriesname=="Final consumption expenditure (% of GDP)"
	replace indicator = "trade" if seriesname=="Trade (% of GDP)"
	replace indicator = "voice_acc_est" if seriesname=="Voice and Accountability: Estimate"
	replace indicator = "voice_acc_pct" if seriesname=="Voice and Accountability: Percentile Rank"
	replace indicator = "primary_completion" if seriesname=="Primary completion rate, total (% of relevant age group)"
	replace indicator = "life_expectancy" if seriesname=="Life expectancy at birth, total (years)"

drop seriesname seriescode

reshape long yr_, i(countrycode indicator) j(year)
reshape wide yr_, i(countrycode year) j(indicator) string
renvars yr_*, presub(yr_)

rename countrycode code

tempfile WDI
save `WDI'

restore

sort code year
	merge m:1 code year using `WDI'
	drop if _merge==2
	drop _merge
for var GDP GDPppp: gen ln_X = ln(X)

****************************** Remove one duplication of subnational area
drop if geo_code2_new =="CPV_2022_GADM1_20"

compress

save "${date}/_data/spid_for_analysis_v2.dta", replace
