******************************************************
********************* Master *************************
******************************************************

clear*
set maxvar 11000

global date _2025_10_28
cd "/Users/atri0032/Dropbox/World Bank/Temperature, poverty, and inequality/Estimations/"

cap log close
log using "${date}/_logfiles/_master.smcl", replace

******** Data setup
// Output: spid_for_analysis_v2.dta
do "${date}/_dofiles/setup", nostop

******** Table 1: The effects of temperature on poverty and inequality by income group
do "${date}/_dofiles/tab_1", nostop

******** Figure 1: Subnational poverty, inequality and temperature in Indonesia
do "${date}/_dofiles/fig_1", nostop

******** Figure 2: The effects of temperature on poverty and inequality
do "${date}/_dofiles/fig_2", nostop

******** Figure 3: The effects of temperature on poverty and inequality
do "${date}/_dofiles/fig_3", nostop

******** Figure 4: The effects of temperature on poverty and inequality across countries adjusted by real GDP
do "${date}/_dofiles/fig_4", nostop

******** Figure S1: Subnational poverty and inequality – SPID database
do "${date}/_dofiles/fig_s1", nostop

******** Figure S2: Distribution of average annual temperature
do "${date}/_dofiles/fig_s2", nostop

******** Figure S3: Nonlinear effects of temperature on income per capita
do "${date}/_dofiles/fig_s3", nostop

******** Figure S4: Nonlinear effects of daily temperature on poverty and inequality
do "${date}/_dofiles/fig_s4", nostop

******** Figure S5: Nonlinear effects of temperature on poverty and inequality – Country-level analysis
do "${date}/_dofiles/fig_s5", nostop

******** Figure S6: Placebo test
do "${date}/_dofiles/fig_s6", nostop

******** Figure S7: The effects of temperature on poverty and inequality across countries adjusted by real GDP using median temperature
do "${date}/_dofiles/fig_s7", nostop

******** Table S1: Data sources and summary statistics
do "${date}/_dofiles/tab_s1", nostop

******** Table S2: The effects of temperature on poverty
do "${date}/_dofiles/tab_s2", nostop

******** Table S3: The effects of temperature on inequality
do "${date}/_dofiles/tab_s3", nostop

******** Table S4: Heterogeneity analysis by country characteristics
do "${date}/_dofiles/tab_s4", nostop

******** Table S5: Causal mediation analysis
do "${date}/_dofiles/tab_s5", nostop

******** Table S6: Simulated effect of temperature on poverty and inequality by 2030
// Note: see calculation from excel sheet

******** Table S7: Alternative measure of poverty – Multidimensional poverty
do "${date}/_dofiles/tab_s7", nostop

******** Table S8: The effects of temperature on poverty gap
do "${date}/_dofiles/tab_s8", nostop

******** Table S9: Robustness test – Alternative measures of temperature
do "${date}/_dofiles/tab_s9", nostop

******** Table S10: Robustness test – Alternative samples
do "${date}/_dofiles/tab_s10", nostop

******** Table S11: The effects of temperature on poverty and inequality – 10-year analysis
do "${date}/_dofiles/tab_s11", nostop

******** Table S12: The effects of temperature on poverty – Subnational GDP analysis
do "${date}/_dofiles/tab_s12", nostop

******** Table S13: The effects of temperature on poverty and inequality – Country level analysis using alternative data from WDI and SWIID
do "${date}/_dofiles/tab_s13", nostop

******** Table S14: The effects of temperature on poverty and inequality by income group (using time-varying WB income classification)
do "${date}/_dofiles/tab_s14", nostop

******** Table S15: The effects of temperature on poverty and inequality for higher poverty lines and Theil index, by income group
do "${date}/_dofiles/tab_s15", nostop

******** Table S16: Controlling for other country's characteristics
do "${date}/_dofiles/tab_s16", nostop

log close
