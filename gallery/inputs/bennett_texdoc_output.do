/**********************************************************************************************
* Title: Example for LaTeX output using texdoc
* Created by: M. Bennett
* Created on: 04/02/19
* Purpose: This dofile generates fake data and shows how to build different tables in LaTeX
			using texdoc
* Last Modified on: 04/02/19
* Last Modified by: MB
* Edits:
	[04/02/19]: Created dofile
**********************************************************************************************/

* Start with an empty dataset
clear 

* Set a seed so results are replicable (I'm using Stata 15, just in case)
set seed 123

* Set number of obs
set obs 1000

* Generate an error term u normally distributed
gen u=rnormal(0,100)

* Generate a random treatment variable:
gen treat = runiform(0,1)>0.5
label var treat "Treatment"

* Generate a binary covariate (50% of the population)
gen x1=runiform(0,1)>0.7
label var x1 "High income"

* Generate a continuous covariate
gen x2=rnormal(400,110)
label var x2 "Test score in 4th grade"

* Generate an outcome:
gen y= 100 + 50*x1 + 1*x2 + 20*treat + u
label var y "Test score in 8th grade"

* Generate a simple covariate table (there are different ways to run this, but here's one):
foreach var of varlist x1 x2{
	* Run a regression (using , robust to account for heteroskedasticity)
	reg `var' treat, robust
	
	* Store whatever you want (in this case, we are going to save the means for each group and the difference)
	global m`var'_0: di %6.3fc _b[_cons]
	global m`var'_1: di %6.3fc _b[_cons] + _b[treat]
	global dif_`var': di %6.3fc _b[treat]
	
	* Store the label of the variable, because it's easier then to put it in the tables:
	global lbe_`var' : var label `var'
	
	* Because I also want to know if the difference is significant, I'm going to store the p-value (and the star level)
	qui test treat=0
	global p_`var': di %12.3fc r(p)
	glo star_`var'=cond(${p_`var'}<.01,"***",cond(${p_`var'}<.05,"**",cond(${p_`var'}<.1,"*","")))
}

* Now, lets generate our balance table! (heads up, if you haven't set a current directory (cd), it's going to store this table wherever is the default).
* PS: It's not necessary to do this with a loop, but if you have a lot of covariates, might be useful.

texdoc init balance_table.tex, replace force
tex \begin{tabular}{lccc} \toprule \toprule
tex Variable			& 	Control	& Treatment & Difference \\ 
tex \addlinespace \hline \\
foreach var of varlist x1 x2{
tex ${lbe_`var'} & ${m`var'_0} & ${m`var'_1} & ${dif_`var'}${star_`var'}\\
}
tex \hline \hline
tex \end{tabular}

texdoc close


* Let's run a regression now! (with and without controls)

global covs0 "treat"
global covs1 "treat x*"

global lbe_y : var label y
global lbe_treat : var label treat

forvalues spec=0(1)1{
	
	*Run the regression
	reg y ${covs`spec'}, robust
	*Save some outputs
	scalar N=e(N)
	scalar r2=e(r2)
	global N_`spec'=N
	global r2_`spec': di %6.3fc r2
	
	*Store the variable of interest
	global b_`spec': di %6.3fc _b[treat]
	global se_`spec': di %6.3fc _se[treat]
	
	qui test treat=0
	global p_`spec': di %12.3fc r(p)
	glo star_`spec'=cond(${p_`spec'}<.01,"***",cond(${p_`spec'}<.05,"**",cond(${p_`spec'}<.1,"*","")))
}


texdoc init treatment_effect.tex, replace force
tex \begin{tabular}{lcc} \toprule \toprule
tex Variable			& 	${lbe_y}	& ${lbe_y} \\ 
tex \addlinespace \hline \\
tex ${lbe_treat} & ${b_0}${star_0} & ${b_1}${star_1}\\
tex 			& (${se_0}) & (${se_1})\\ \addlinespace
tex Controls & No & Yes \\
tex Observations & $N_0 & $N_1 \\
tex R-square & $r2_0 & $r2_1 \\
tex \hline \hline
tex \end{tabular}

texdoc close
