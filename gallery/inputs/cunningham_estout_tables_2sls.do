clear
capture log close

* This file will estimate the returns to college education using the "college in the county" instrumental variable
* which instruments for college attendance with whether there is a 2 or 4 year college near the respondent of the NLS. 
* You will first need to install estout (ssc install estout), and you will need to pull the card data from my Mixtape
* in the cloud.  

use "https://storage.googleapis.com/causal-inference-mixtape.appspot.com/card", replace

* scuse card


				cap n tempvar tempsample
				cap n local specname=`specname'+1
				reg  lwage  educ  exper black south married   smsa 
				cap n estadd ysumm
				cap n estimates store ols_`specname'

				cap n local specname=`specname'+1
				reg educ nearc4 exper black south married   smsa 
				cap n local biv = _b[nearc4]
				cap n local seiv = _se[nearc4]
				cap n unab ivs: nearc4
				cap n local xlist: colnames e(b)
				cap n local ivs: list ivs & xlist
				cap n test `ivs'
				cap n local F_iv=r(F)
				cap n local specname=`specname'+1

				cap n ivregress 2sls lwage (educ=nearc4) exper black south married   smsa, first
				cap n estadd ysumm
				cap n estadd scalar biv  = `biv'
				cap n estadd scalar seiv = `seiv'
				cap n estadd scalar F_iv = `F_iv'
				cap n rivtest
				n return list
				cap n local ar_chi2=r(ar_chi2)
				cap n local ar_p=r(ar_p)
				cap n estadd scalar ar_chi2 = `ar_chi2'
				cap n estadd scalar ar_p = `ar_p'
				cap n estimates store tsls_`specname'



#delimit ;
	cap n estout * using ./card.tex, 
		style(tex) label notype 
		cells((b(star fmt(%9.3f))) (se(fmt(%9.3f)par))) 		
		stats(biv seiv F_iv ar_p N ymean ysd, star(biv) 
		labels("College in the county" "Robust standard error " "F statistic for IV in first stage" "Anderson-Rubin test" "N" "Mean Dependent Variable" "Std. Dev. Dependent Variable") 
			fmt(3 3 3 2 %9.0fc 3 3)) 
		keep(educ exper black south married smsa) replace noabbrev starlevels(* 0.10 ** 0.05 *** 0.01) 
		title(OLS and 2SLS regressions of Log Earnings on Schooling)   
		collabels(none) eqlabels(none) mlabels(none) mgroups(none) 
		prehead("\begin{table}[htbp]\centering" "\scriptsize" "\caption{@title}" "\label{2sls_1}" "\begin{center}" "\begin{threeparttable}" "\begin{tabular}{l*{@E}{c}}"
"\toprule"
"\multicolumn{1}{l}{\textbf{Dependent variable}}&"
"\multicolumn{2}{c}{\textbf{Log wage}}\\"
"\multicolumn{1}{c}{}&"
"\multicolumn{1}{c}{OLS}&"
"\multicolumn{1}{c}{2SLS}\\")
		posthead("\midrule")
		prefoot("\\" "\midrule" "\multicolumn{1}{c}{First Stage Instrument}\\")  
		postfoot("\bottomrule" "\end{tabular}" "\begin{tablenotes}" "\tiny" "\item Standard errors in parenthesis. * p$<$0.10, ** p$<$0.05, *** p$<$0.01" "\end{tablenotes}" \end{threeparttable} \end{center} \end{table});
#delimit cr
	cap n estimates clear
	
	
	
* Fulton Fish Market
clear

use "https://storage.googleapis.com/causal-inference-mixtape.appspot.com/fish", replace

* scuse fish

gen lnp=ln(price)
gen lnq=ln(quantity)

* avg max last 2 days wave height

				cap n tempvar tempsample
				cap n local specname=`specname'+1
				reg  lnq lnp mon tues wed thurs time 
				cap n estadd ysumm
				cap n estimates store ols_`specname'

				cap n local specname=`specname'+1
				reg lnp wave2 mon tues wed thurs time 
				cap n local biv = _b[wave2]
				cap n local seiv = _se[wave2]
				cap n unab ivs: wave2
				cap n local xlist: colnames e(b)
				cap n local ivs: list ivs & xlist
				cap n test `ivs'
				cap n local F_iv=r(F)
				cap n local specname=`specname'+1

				cap n ivregress 2sls lnq mon tues wed thurs time (lnp = wave2), first
				cap n estadd ysumm
				cap n estadd scalar biv  = `biv'
				cap n estadd scalar seiv = `seiv'
				cap n estadd scalar F_iv = `F_iv'
				cap n rivtest
				n return list
				cap n local ar_chi2=r(ar_chi2)
				cap n local ar_p=r(ar_p)
				cap n estadd scalar ar_chi2 = `ar_chi2'
				cap n estadd scalar ar_p = `ar_p'
				cap n estimates store tsls_`specname'



#delimit ;
	cap n estout * using ./fish1.tex, 
		style(tex) label notype 
		cells((b(star fmt(%9.3f))) (se(fmt(%9.3f)par))) 		
		stats(biv seiv F_iv ar_p N ymean ysd, star(biv) 
		labels("Average wave height" "Robust standard error " "F statistic for IV in first stage" "Anderson-Rubin test" "N" "Mean Dependent Variable" "Std. Dev. Dependent Variable") 
			fmt(3 3 3 2 %9.0fc 3 3)) 
		keep(lnp mon tues wed thurs time) replace noabbrev starlevels(* 0.10 ** 0.05 *** 0.01) 
		title(OLS and 2SLS regressions of Log Quantity on Log Price with wave height instrument)   
		collabels(none) eqlabels(none) mlabels(none) mgroups(none) 
		prehead("\begin{table}[htbp]\centering" "\scriptsize" "\caption{@title}" "\label{2sls_2}" "\begin{center}" "\begin{threeparttable}" "\begin{tabular}{l*{@E}{c}}"
"\toprule"
"\multicolumn{1}{l}{\textbf{Dependent variable}}&"
"\multicolumn{2}{c}{\textbf{Log quantity}}\\"
"\multicolumn{1}{c}{}&"
"\multicolumn{1}{c}{OLS}&"
"\multicolumn{1}{c}{2SLS}\\")
		posthead("\midrule")
		prefoot("\\" "\midrule" "\multicolumn{1}{c}{First Stage Instrument}\\")  
		postfoot("\bottomrule" "\end{tabular}" "\begin{tablenotes}" "\tiny" "\item Standard errors in parenthesis. * p$<$0.10, ** p$<$0.05, *** p$<$0.01" "\end{tablenotes}" \end{threeparttable} \end{center} \end{table});
#delimit cr
	cap n estimates clear


	* 3 day lagged max windspeed

					cap n tempvar tempsample
					cap n local specname=`specname'+1
					reg  lnq lnp mon tues wed thurs time 
					cap n estadd ysumm
					cap n estimates store ols_`specname'

					cap n local specname=`specname'+1
					reg lnp speed3 mon tues wed thurs time 
					cap n local biv = _b[speed3]
					cap n local seiv = _se[speed3]
					cap n unab ivs: speed3
					cap n local xlist: colnames e(b)
					cap n local ivs: list ivs & xlist
					cap n test `ivs'
					cap n local F_iv=r(F)
					cap n local specname=`specname'+1

					cap n ivregress 2sls lnq mon tues wed thurs time (lnp = speed3), first
					cap n estadd ysumm
					cap n estadd scalar biv  = `biv'
					cap n estadd scalar seiv = `seiv'
					cap n estadd scalar F_iv = `F_iv'
					cap n rivtest
					n return list
					cap n local ar_chi2=r(ar_chi2)
					cap n local ar_p=r(ar_p)
					cap n estadd scalar ar_chi2 = `ar_chi2'
					cap n estadd scalar ar_p = `ar_p'
					cap n estimates store tsls_`specname'



	#delimit ;
		cap n estout * using ./fish2.tex, 
			style(tex) label notype 
			cells((b(star fmt(%9.3f))) (se(fmt(%9.3f)par))) 		
			stats(biv seiv F_iv ar_p N ymean ysd, star(biv) 
			labels("Wind speed" "Robust standard error " "F statistic for IV in first stage" "Anderson-Rubin test" "N" "Mean Dependent Variable" "Std. Dev. Dependent Variable") 
				fmt(3 3 3 2 %9.0fc 3 3)) 
			keep(lnp mon tues wed thurs time) replace noabbrev starlevels(* 0.10 ** 0.05 *** 0.01) 
			title(OLS and 2SLS regressions of Log Quantity on Log Price with windspeed instrument)   
			collabels(none) eqlabels(none) mlabels(none) mgroups(none) 
			prehead("\begin{table}[htbp]\centering" "\scriptsize" "\caption{@title}" "\label{2sls_3}" "\begin{center}" "\begin{threeparttable}" "\begin{tabular}{l*{@E}{c}}"
	"\toprule"
	"\multicolumn{1}{l}{\textbf{Dependent variable}}&"
	"\multicolumn{2}{c}{\textbf{Log quantity}}\\"
	"\multicolumn{1}{c}{}&"
	"\multicolumn{1}{c}{OLS}&"
	"\multicolumn{1}{c}{2SLS}\\")
			posthead("\midrule")
			prefoot("\\" "\midrule" "\multicolumn{1}{c}{First Stage Instrument}\\")  
			postfoot("\bottomrule" "\end{tabular}" "\begin{tablenotes}" "\tiny" "\item Standard errors in parenthesis. * p$<$0.10, ** p$<$0.05, *** p$<$0.01" "\end{tablenotes}" \end{threeparttable} \end{center} \end{table});
	#delimit cr
		cap n estimates clear
	
	
