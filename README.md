# Packages for generating LaTeX output from Stata code

## Automated table creation

These packages generate tex files (and perhaps other formats) with customization via Stata command options

### `estout`/`esttab`

- Install using `ssc install estout, replace`
- [Package page](http://repec.sowi.unibe.ch/stata/estout/)
- [Customization example using prehead and postfoot](http://www.eyalfrank.com/code-riffs-stata-and-regression-tables/) by [Eyal Frank](http://www.eyalfrank.com/)


### `outreg2`

- Install using `ssc install outreg2, replace`
- [Package page](http://repec.org/bocode/o/outreg2.html)



### `regsave`/`texsave`

Regression results are saved as Stata datasets before being exported to tex

- Install using `ssc install regsave, replace` and `ssc install texsave, replace`
- Package pages: [regsave](https://econpapers.repec.org/software/bocbocode/S456964.htm) and [texsave](https://econpapers.repec.org/software/bocbocode/S456974.htm)
- [Slides with examples](https://www.stata.com/meeting/boston10/boston10_reif.pdf) by [Julian Reif](http://julianreif.com/)



### `tabout`

For descriptive statistics and tabulations, not regression results

- Install using `ssc install tabout, replace`
- [Package page](http://tabout.net.au/)





## Semi-automated table creation

These packages fill in manually created tex shell with calculated values


### `stata-tex`

Calculated values are saved in specially-formatted external files, and then inserted into an external tex shell file

- Install manually from github page (requires Python)
- [Package page](https://github.com/paulnov/stata-tex)
- [Explanatory Twitter thread](https://twitter.com/paulnovosad/status/1056922582795075584) by [Paul Novosad](http://www.dartmouth.edu/~novosad/)



### `texdoc`

Calculated values are inserted into tex shell included in do file

- Install using `ssc install texdoc, replace`
- [Package page](http://repec.sowi.unibe.ch/stata/texdoc/)
- [Slides with examples](https://www.stata.com/meeting/switzerland16/slides/jann-switzerland16.pdf) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)
- [Example Twitter thread](https://twitter.com/maibennett/status/1051145477922717696) by Magdalena Bennett



### `json-this`/`coeftable`

Calculated values (select regression commands only) are saves as JSON files, and then inserted into an external tex shell file

- Install manually from github pages
- Package pages: [json-this](https://github.com/gn0/json-this) and [coeftable](https://github.com/gn0/coeftable)



### `write_mats`

Regressions are saved as `.ster` files, desired values are arranged as Stata matrix, and then exported to tex

- Install manually from github page
- [Package page](https://github.com/alemartinello/write_mats)
- [Explanatory Twitter thread](https://twitter.com/ale_martinello/status/1054079452437798912) by [Alessandro Martinello](https://www.alemartinello.com/)



### `listtab` (supercedes `listtex`)

Tables are set up as Stata datasets (perhaps with `preserve`/`restore`) and then exported using tex shell included in do file

- Install using `ssc install listtab, replace`
- [Package page](http://fmwww.bc.edu/RePEc/bocode/l/listtab.html)
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0254) by [Roger Newson](http://www.rogernewsonresources.org.uk/)




## Other methods
- Export manual tex code from string variables using `outsheet` (per [Damon Jones' Twitter thread](https://twitter.com/nomadj1s/status/1051112991393964032); now deprecated in favor of texdoc?)
- Write manual tex code using `file write` (per [Paul Goldsmith-Pinkham's example](https://gist.github.com/paulgp/7e0c0ad9dee76c4ab8e475e1165d493f))
- Convert regression output from Stata log files to tex using `extract-from-stata` ([package page](https://github.com/gn0/extract-from-stata))
