# Packages for generating LaTeX output from Stata code

## Automated table creation

These packages generate tex files (and perhaps other formats) with customization via Stata command options



### `estout`/`esttab`

[Package page](http://repec.sowi.unibe.ch/stata/estout/)

- Install using `ssc install estout, replace`
- [Examples](http://repec.org/bocode/e/estout/examples.html) from RePEc documentation page (older?)
- [Creating Publication-Quality Tables in Stata](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm) from University of Wisconsin SSCC
- [Regression Tables That Look Like Those in Journal Articles](https://stats.idre.ucla.edu/stata/faq/how-can-i-use-estout-to-make-regression-tables-that-look-like-those-in-journal-articles/) from UCLA IDRE
- [Automated Table generation in Stata and integration into LaTeX](https://www.jwe.cc/2012/03/stata-latex-tables-estout/) (parts [2](https://www.jwe.cc/2012/08/latex-and-stata-integration-solving-some-problems/) and [3](https://www.jwe.cc/2012/08/latex-stata-design/)) by [Jörg Weber](https://www.jwe.cc/)
- [Customization example using prehead and postfoot](http://www.eyalfrank.com/code-riffs-stata-and-regression-tables/) by [Eyal Frank](http://www.eyalfrank.com/)
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0085) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)




### `outreg2`

[Package page](http://repec.org/bocode/o/outreg2.html)

- Install using `ssc install outreg2, replace`
- Supercedes older `outreg` package



### `regsave`/`texsave`

Regression results are saved as Stata datasets before being exported to tex

- Install using `ssc install regsave, replace` and `ssc install texsave, replace`
- Package pages: [regsave](https://econpapers.repec.org/software/bocbocode/S456964.htm) and [texsave](https://econpapers.repec.org/software/bocbocode/S456974.htm)
- [Slides with examples](https://www.stata.com/meeting/boston10/boston10_reif.pdf) by [Julian Reif](http://julianreif.com/)



### `tabout`

[Package page](http://tabout.net.au/)

For descriptive statistics and tabulations, not regression results

- Install using `ssc install tabout, replace`



## Semi-automated table creation

These packages typically fill in a manually created tex template with calculated values



### `stata-tex`

[Package page](https://github.com/paulnov/stata-tex)

Calculated values are saved as csv and then inserted into an external tex template

- Install manually from github page (requires Python)
- [Explanatory Twitter thread](https://twitter.com/paulnovosad/status/1056922582795075584) by [Paul Novosad](http://www.dartmouth.edu/~novosad/)



### `texdoc`

[Package page](http://repec.sowi.unibe.ch/stata/texdoc/)

Calculated values are inserted directly into a tex template included in the do file

- Install using `ssc install texdoc, replace`
- [Slides with examples](https://www.stata.com/meeting/switzerland16/slides/jann-switzerland16.pdf) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)
- [Example Twitter thread](https://twitter.com/maibennett/status/1051145477922717696) by Magdalena Bennett



### `json-this`/`coeftable`

Package pages: [json-this](https://github.com/gn0/json-this) and [coeftable](https://github.com/gn0/coeftable)

Calculated values are saved as json and then inserted into an external tex template

- Install manually from github pages



### `write_mats`

[Package page](https://github.com/alemartinello/write_mats)

Calculated values are saved as `.ster` files, desired values are arranged as a Stata matrix, and then exported as tex

- Install manually from github page
- [Explanatory Twitter thread](https://twitter.com/ale_martinello/status/1054079452437798912) by [Alessandro Martinello](https://www.alemartinello.com/)



### `listtab`

[Package page](http://fmwww.bc.edu/RePEc/bocode/l/listtab.html)

Tables are set up as a Stata dataset and then exported as tex

- Install using `ssc install listtab, replace`
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0254) by [Roger Newson](http://www.rogernewsonresources.org.uk/)
- Supercedes older `listtex` package




## Other methods
- Generate tex code in string variables and export using `outsheet` (per [Damon Jones' Twitter thread](https://twitter.com/nomadj1s/status/1051112991393964032))
- Write tex code directly using `file write` (per [Paul Goldsmith-Pinkham's example](https://gist.github.com/paulgp/7e0c0ad9dee76c4ab8e475e1165d493f))
- Convert regression output from Stata log files to tex using `extract-from-stata` ([package page](https://github.com/gn0/extract-from-stata))
