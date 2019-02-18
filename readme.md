# Packages for generating LaTeX output from Stata code

A variety of packages (and manual techniques) are available for programmatically generating LaTeX output using Stata.

Generally, more automated approaches such as `estout`/`esttab` make it easy to quickly generate nearly-production-ready output, but make it more difficult (if not impossible) to implement significant customization. (That is, costs may be convex.) Automated approaches may also work best with interactive and exploratory analysis, since attractively formatted results can also be displayed as Stata output or exported as simple text or csv files.

Semi-automated approaches such as `json-this`/`coeftable` and `stata-tex` generally require manually creating LaTeX code to generate even simple tables, but their output is fully customizable. (That is, costs may be concave.) These approaches can involve saving calculated values in an external file before generating LaTeX output; while slightly more complicated, this separation of analysis from table generation has real advantages. For example, saving calculated values
- Allows restructured tables to be generated without re-running estimation commands;
- Makes it easy to generate identically-structured tables with different samples, variable definitions, etc.;
- Allows easy generation of alternate table versions, such as for a paper vs. a presentation;
- Allows calculated values to be accessed by other scripts (e.g., for plotting)
- Works well with version control.



## Automated table creation

These packages generate tex files (and perhaps other formats) with customization via Stata command options.



### `estout`/`esttab`

> [Package page](http://repec.sowi.unibe.ch/stata/estout/)

- Install using `ssc install estout, replace`
- [Examples](http://repec.org/bocode/e/estout/examples.html) from RePEc documentation page (older?)
- [Creating Publication-Quality Tables in Stata](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm) from University of Wisconsin SSCC
- [Regression Tables That Look Like Those in Journal Articles](https://stats.idre.ucla.edu/stata/faq/how-can-i-use-estout-to-make-regression-tables-that-look-like-those-in-journal-articles/) from UCLA IDRE
- [Automated Table generation in Stata and integration into LaTeX](https://www.jwe.cc/2012/03/stata-latex-tables-estout/) (blog post; continued in parts [2](https://www.jwe.cc/2012/08/latex-and-stata-integration-solving-some-problems/) and [3](https://www.jwe.cc/2012/08/latex-stata-design/)) by [Jörg Weber](https://www.jwe.cc/)
- [Customization example using prehead and postfoot](http://www.eyalfrank.com/code-riffs-stata-and-regression-tables/) by [Eyal Frank](http://www.eyalfrank.com/)
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0085) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)




### `outreg2`

> [Package page](http://repec.org/bocode/o/outreg2.html)

- Install using `ssc install outreg2, replace`
- Supercedes older `outreg` [package](https://econpapers.repec.org/software/bocbocode/s375201.htm)



### `tabout`

> [Package page](http://tabout.net.au/)

For descriptive statistics and tabulations, not regression results

- Install using `ssc install tabout, replace`






## Semi-automated table creation

These packages typically fill in a manually created tex template with calculated values.



### `json-this`/`coeftable`

> Package pages: [json-this](https://github.com/gn0/json-this) and [coeftable](https://github.com/gn0/coeftable)

Calculated values are saved as json and then inserted into an external tex template

- Install manually from github pages (requires Python)



### `stata-tex`

> [Package page](https://github.com/paulnov/stata-tex)

Calculated values are saved as csv and then inserted into an external tex template

- Install manually from github page (requires Python)
- [Explanatory Twitter thread](https://twitter.com/paulnovosad/status/1056922582795075584) by [Paul Novosad](http://www.dartmouth.edu/~novosad/)



### `regsave`/`texsave`

> Package pages: [regsave](https://econpapers.repec.org/software/bocbocode/S456964.htm) and [texsave](https://econpapers.repec.org/software/bocbocode/S456974.htm)

Calculated values are saved as Stata datasets and then exported as tex

- Install using `ssc install regsave, replace` and `ssc install texsave, replace`
- Latest (developer) builds can be installed manually from github package pages ([regsave](https://github.com/reifjulian/regsave) and [texsave](https://github.com/reifjulian/texsave))
- `sortobs` [package](https://github.com/reifjulian/sortobs) can help with ordering variables for tex output
- [Slides with examples](https://www.stata.com/meeting/boston10/boston10_reif.pdf) by [Julian Reif](http://julianreif.com/)



### `texdoc`

> [Package page](http://repec.sowi.unibe.ch/stata/texdoc/)

Calculated values are inserted directly into a tex template included in the do file

- Install using `ssc install texdoc, replace`
- [Slides with examples](https://www.stata.com/meeting/switzerland16/slides/jann-switzerland16.pdf) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)
- [Example Twitter thread](https://twitter.com/maibennett/status/1051145477922717696) by Magdalena Bennett



### `write_mats`

> [Package page](https://github.com/alemartinello/write_mats)

Calculated values are saved as `.ster` files, desired values are arranged as a Stata matrix, and then exported as tex

- Install manually from github page
- [Explanatory Twitter thread](https://twitter.com/ale_martinello/status/1054079452437798912) by [Alessandro Martinello](https://www.alemartinello.com/)



### `listtab`

> [Package page](http://fmwww.bc.edu/RePEc/bocode/l/listtab.html)

Tables are set up as a Stata dataset and then exported as tex

- Install using `ssc install listtab, replace`
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0254) by [Roger Newson](http://www.rogernewsonresources.org.uk/)
- Supercedes older `listtex` [package](https://ideas.repec.org/c/boc/bocode/s423201.html)




## Other methods
- Generate tex code in string variables and export using `outsheet` (per [Damon Jones' Twitter thread](https://twitter.com/nomadj1s/status/1051112991393964032))
- Write tex code directly using `file write` (per [Paul Goldsmith-Pinkham's example](https://gist.github.com/paulgp/7e0c0ad9dee76c4ab8e475e1165d493f))
- Convert regression output from Stata log files to tex using `extract-from-stata` ([package page](https://github.com/gn0/extract-from-stata))
- Use r instead of Stata (perhaps with the `stargazer` [package](https://CRAN.R-project.org/package=stargazer) for LaTeX output)
