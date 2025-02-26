*ESTABLISH RELATIONSHIP B/W MEAN YEARS OF SCHOOLING AND NOT IN EDUCATION, EMPLOYMENT AND TRAINING WITH NET STATE DOMESTIC PRODUCT

*Import excel file 
import excel using "C:/Users/mizza/OneDrive/Desktop/Assignment/Final I/MYS and NEET.xlsx", sheet("Data") firstrow clear

*Check pearson's correlation and statistical significance of MYS and NEET with Net State Domestic Product
pwcorr MeanYearsofSchooling15yrs NetStateDomesticProduct, sig
pwcorr NEET15to29yrsofage NetStateDomesticProduct, sig

*Multiple Linear Regression
reg NetStateDomesticProduct MeanYearsofSchooling15yrs NEET15to29yrsofage

*Normality Test - Shapiro-WIlk
predict residuals, residual
swilk residuals


*Test for Multicollinearity - VIF
vif

*Test for Heteroskedasticity - breusch pagan test
hettest

*Test for Normality - Shapiro Wilk Test
swilk r

*Two sample test
gen MYS_Category = (MeanYearsofSchooling15yrs >= 8.7)
label define mys_label 0 "Low_MYS" 1 "High_MYS"
label values MYS_Category mys_label

gen NEET_Category = (NEET15to29yrsofage >= 25.6)
label define neet_label 0 "Low_NEET" 1 "High_NEET"
label values NEET_Category neet_label

ttest NetStateDomesticProduct, by(MYS_Category)
ttest NetStateDomesticProduct, by(NEET_Category)


*Create Boxplots
replace MYS_Category = 1 if MeanYearsofSchooling15yrs < 8.7
replace MYS_Category = 2 if MeanYearsofSchooling15yrs >= 8.7
label define mys_label 1 "Low MYS" 2 "High MYS", replace
label values MYS_Category mys_label

graph box NetStateDomesticProduct, over(MYS_Category, label(angle(45))) ///
    asyvars box(1, color(greem)) box(2, color(red)) ///
    title("Net State Domestic Product by MYS Category") ///
    ylabel(, format(%9.0gc)) ///
    ytitle("Net State Domestic Product") ///
    legend(order(1 "Low MYS" 2 "High MYS")) ///
    scheme(s2color)
	
replace NEET_Category = 1 if NEET15to29yrsofage < 25.6
replace NEET_Category = 2 if NEET15to29yrsofage >= 25.6
label define neet_label 1 "Low NEET" 2 "High NEET", replace
label values NEET_Category neet_label









	
	
	
	
	
	
	
