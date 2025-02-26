* Load the dataset (if not already loaded)
import excel using "C:/Users/mizza/Downloads/model_data.xlsx", firstrow clear

* Calculate the ratios
gen Y_P = Y / P
gen Y_E = Y / E
gen E_L = E / L
gen L_P = L / P

* Display the results
list State Year Y_P Y_E E_L L_P, sepby(State)

* Calculate the growth rate
bysort State (Year): gen Y_growth = (Y - Y[_n-1]) / Y[_n-1] * 100
bysort State (Year): gen P_growth = (P - P[_n-1]) / P[_n-1] * 100
bysort State (Year): gen E_growth = (E - E[_n-1]) / E[_n-1] * 100
bysort State (Year): gen L_growth = (L - L[_n-1]) / L[_n-1] * 100

* Display growth rates
list State Year Y_growth P_growth E_growth L_growth, sepby(State)
