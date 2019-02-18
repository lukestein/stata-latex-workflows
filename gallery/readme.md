# Stata/LaTeX workflow gallery

## `estout`/`esttab`

### Interactions, checkmarks, test statistics

<details>
<summary>Stata code</summary>

~~~
eststo  clear
eststo: areg empend_normsqi               after##c.frac lnpop lnpercap lnvc chHPI i.yq i.industry [weight=pa]  if ${SAMPLEIF} & age_buckets == 1, absorb(state) cluster(state)

eststo: areg empend_normsqi  lowsectorvc##after##c.frac lnpop lnpercap lnvc chHPI i.yq i.industry [weight=pa]  if ${SAMPLEIF} & age_buckets == 1, absorb(state) cluster(state)
test 1.after#c.frac + 1.lowsectorvc#1.after#c.frac = 0
estadd scalar sum_afterfrac_p = r(p)

eststo: areg empend_normsqi    empconc50##after##c.frac lnpop lnpercap lnvc chHPI i.yq i.industry [weight=pa]  if ${SAMPLEIF} & age_buckets == 1, absorb(state) cluster(state)
test 1.after#c.frac + 1.empconc50#1.after#c.frac = 0
estadd scalar sum_afterfrac_p = r(p)

eststo: areg empend_normsqi      highcap##after##c.frac lnpop lnpercap lnvc chHPI i.yq i.industry [weight=pa]  if ${SAMPLEIF} & age_buckets == 1, absorb(state) cluster(state)
test 1.after#c.frac + 1.highcap#1.after#c.frac = 0
estadd scalar sum_afterfrac_p = r(p)


esttab using "${OUTPATH}emp_entrants_industry", ///
nomtitles booktabs replace ///
order(1.after#c.frac ///
	1.lowsectorvc#1.after  1.lowsectorvc#c.frac 1.lowsectorvc#1.after#c.frac ///
	1.empconc50#1.after  1.empconc50#c.frac 1.empconc50#1.after#c.frac ///
	1.highcap#1.after  1.highcap#c.frac 1.highcap#1.after#c.frac ///
	lnpop lnpercap lnvc chHPI) ///
drop(frac 1.after  1.empconc50 1.lowsectorvc 1.highcap) ///
indicate("Annual state-level controls = lnpop lnpercap lnvc chHPI"   "State FE = _cons" "Quarterly FE = *.yq" "Industry FE = *.industry", labels("\checkmark" "")) ///
stats(N sum_afterfrac_p, labels("Observations" "\$p\$-val: \$\beta_{\text{Aft}\times\text{Frac}} + \beta_{\text{\ldots industry}\times\text{Aft}\times\text{Frac}} = 0 \$")) ///
label nobaselevels interaction("\$\times\$") substitute("=1" "") nonotes se star(* 0.10 ** 0.05 *** 0.01)
~~~

</details>

![Table 6 from Lindsey and Stein (2019 WP)](images/lindseystein_t6.png "Sample table")

By [Luke Stein](http://lukestein.com)






### Summary statistics

<details>
<summary>Stata code</summary>

~~~
gen t_entry_norm1 = entry_norm1 * 100
label var t_entry_norm1	"Firm entry rate (\%)"

gen t_frac = frac * 100
label var t_frac	"Frac (\%)"

gen t_chHPI = chHPI * 100
label var t_chHPI	"House price index change (\%)"

eststo clear
eststo: quietly estpost summarize	t_entry_norm1 ///
									t_frac lnpop lnpercap lnvc t_chHPI ///
								if ${SAMPLEIF} & (age_buckets == 1) & (pa > 0), detail

esttab using "${OUTPATH}summstat_bds_sy.tex", replace ///
	cells("mean(fmt(2)) sd(fmt(2)) p50(fmt(2)) p25(fmt(2)) p75(fmt(2))") label booktab nonumber nomtitles
eststo clear
~~~

</details>

![Table 2a from Lindsey and Stein (2019 WP)](images/lindseystein_t2a.png "Sample table")

By [Luke Stein](http://lukestein.com)
