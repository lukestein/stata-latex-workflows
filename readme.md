# Packages for generating LaTeX output from Stata code

> [Stata Table Gallery](./gallery/) (sample tables with code; contributions welcome!)

A variety of packages (and manual techniques) are available for programmatically generating LaTeX output using Stata.

Generally, more automated approaches such as `estout`/`esttab` make it easy to quickly generate nearly-production-ready output, but make it more difficult (if not impossible) to implement significant customization. (That is, costs may be convex.) Automated approaches may also work best with interactive and exploratory analysis, since attractively formatted results can also be displayed as Stata output or exported as simple text or csv files.

Semi-automated approaches such as `json-this`/`coeftable` and `stata-tex` generally require manually creating LaTeX code to generate even simple tables, but their output is fully customizable. (That is, costs may be concave.)

Semi-automated approaches often involve saving calculated values in an external file before generating LaTeX output. (This is also possible with automated approaches using Stata’s `estimates save` command.) While slightly more complicated, this separation of analysis from table generation has real advantages. For example, saving calculated values
- Allows restructured tables to be generated without re-running estimation commands;
- Makes it easy to generate identically-structured tables with different samples, variable definitions, etc.;
- Allows easy generation of alternate table versions, such as for a paper vs. a presentation;
- Allows calculated values to be accessed by other scripts (e.g., for plotting);
- Works well with version control.



## Automated table creation

These packages generate tex files (and perhaps other formats) with customization via Stata command options.



### `estout`/`esttab`

> [Package page](http://repec.sowi.unibe.ch/stata/estout/)

- Install using `ssc install estout, replace`
- Relative to the documentation on the [package page](http://repec.sowi.unibe.ch/stata/estout/), descriptions of some options are easier to find in the [old documentation](http://repec.org/bocode/e/estout/documentation.html), including at the “[Advanced](http://repec.org/bocode/e/estout/advanced.html)” page
- Several examples with code at [this site’s (minimal) gallery page](./gallery/)
- Estimation can be separated from table creation by saving estimates (as `.ster` files) using Stata’s `estimates save` command; this supercedes the older `estwrite` [package](http://fmwww.bc.edu/RePEc/bocode/e/estwrite.html)
- [Examples](http://repec.org/bocode/e/estout/examples.html) from RePEc documentation page (older?)
- [Creating Publication-Quality Tables in Stata](https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm) from University of Wisconsin SSCC
- [Regression Tables That Look Like Those in Journal Articles](https://stats.idre.ucla.edu/stata/faq/how-can-i-use-estout-to-make-regression-tables-that-look-like-those-in-journal-articles/) from UCLA IDRE
- [Automated Table generation in Stata and integration into LaTeX](https://www.jwe.cc/2012/03/stata-latex-tables-estout/) (blog post; continued in parts [2](https://www.jwe.cc/2012/08/latex-and-stata-integration-solving-some-problems/) and [3](https://www.jwe.cc/2012/08/latex-stata-design/)) by [Jörg Weber](https://www.jwe.cc/)
- [The Stata-to-LaTeX guide](https://medium.com/the-stata-guide/the-stata-to-latex-guide-6e7ed5622856) (blog post with detailed, documented examples including shared Overleaf files) by [Asjad Naqvi](https://medium.com/the-stata-guide)
- [Customization example using prehead and postfoot](http://www.eyalfrank.com/code-riffs-stata-and-regression-tables/) by [Eyal Frank](http://www.eyalfrank.com/)
- [Stata Journal article](https://www.stata-journal.com/sjpdf.html?articlenum=st0085) by [Ben Jann](http://www.soz.unibe.ch/about_us/people/prof_dr_jann_ben/index_eng.html)




### `outreg2`

> [Package page](http://repec.org/bocode/o/outreg2.html)

- Install using `ssc install outreg2, replace`
- Supercedes older `outreg` [package](https://econpapers.repec.org/software/bocbocode/s375201.htm)
- [Using outreg2 to report regression output, descriptive statistics, frequencies and basic crosstabulations](https://dss.princeton.edu/training/Outreg2.pdf) from Princeton DSS



### `tabout`

> [Package page](http://tabout.net.au/)

For descriptive statistics and tabulations, not regression results

- Install using `ssc install tabout, replace`
- Several examples with code at [this site’s (minimal) gallery page](./gallery/)
- [Slides with examples](https://www.stata.com/meeting/oceania16/slides/watson-oceania16.pdf) by [Ian Watson](http://ianwatson.com.au/)




### `orth_out`

> Package pages: [github](https://github.com/jjlong/orth_out), [RePEc](https://ideas.repec.org/c/boc/bocode/s457800.html)

For summary statistics and orthogonality tables, not regression results

- Install using `ssc install orth_out, replace`





### `frmttable`

"A programmer's command to write formatted Word or TeX tables from a matrix of statistics," `frmttable` is the command that underlies `outreg`, but can also be used directly to generate more customized output

- [Help file](http://fmwww.bc.edu/RePEc/bocode/f/frmttable.html) from RePEc
- [Slides with background](https://www.stata.com/meeting/germany13/abstracts/materials/de13_gallup.pdf) by [John Luke Gallup](https://www.pdx.edu/econ/john-luke-gallup)
- [Stata Journal article](https://www.pdx.edu/econ/sites/www.pdx.edu.econ/files/frmttable_sj.pdf) by [John Luke Gallup](https://www.pdx.edu/econ/john-luke-gallup)





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



### `texresults`

> [Package page](https://ideas.repec.org/c/boc/bocode/s458334.html)

Calculated values are saved as a set of tex macros

- Install using `ssc install texresults, replace`
- Latest builds can be installed manually from github [package page](https://github.com/acarril/texresults)
- [Discussion with examples](https://acarril.github.io/posts/export-results-latex) by [Alvaro Carril](https://acarril.github.io/posts/export-results-latex)



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
- `parmest` [package](http://fmwww.bc.edu/RePEc/bocode/p/parmest.html) can produce Stata datasets of estimated parameters



## “Dynamic Document”-based approaches

These approaches are usually used to more fully integrate analysis into document creation, but can also be used to generate LaTeX output (perhaps requiring a tool like [pandoc](https://pandoc.org/) to convert from markdown or HTML to LaTeX).

- Stata’s built-in `dyntext` [command](https://www.stata.com/help.cgi?dyntext) (text, including tex source) or `dyndoc` [command](https://www.stata.com/help.cgi?dyndoc) (markdown)
- The `markstat` [package](https://data.princeton.edu/stata/markdown/) by [Germán Rodríguez](https://data.princeton.edu/)



## Other methods
- Generate tex code in string variables and export using `outsheet` (per [Damon Jones’ Twitter thread](https://twitter.com/nomadj1s/status/1051112991393964032))
- Write tex code directly using `file write` (per [Paul Goldsmith-Pinkham’s example](https://gist.github.com/paulgp/7e0c0ad9dee76c4ab8e475e1165d493f))
- Convert regression output from Stata log files to tex using `extract-from-stata` ([package page](https://github.com/gn0/extract-from-stata))
- Use r instead of Stata (perhaps with the `stargazer` [package](https://CRAN.R-project.org/package=stargazer) for LaTeX output)



## Note

I created this page in response to Twitter discussions suggesting there’s interest in learning more about the wide range of techniques researchers use to work with Stata and LaTeX. I also wanted to learn more about how to use github (where this page is hosted).

I added the resources I was aware of, and quickly characterized them as best I could. Please feel free to suggest additions or updates, either by submitting pull requests to the github respository (if you know how to do so), or by [contacting me directly](http://lukestein.com/).
