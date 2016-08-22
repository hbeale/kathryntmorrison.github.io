---
title: "R package outbreakvelocity available"
author: "Kathryn"
date: "June 29, 2016"
output: html_document
layout: post
tags: [R, R packages, infectious disease methods]
permalink: outbreakvelocity
comments: yes
---
  
  
Last year, <a href="https://www.linkedin.com/in/kate-zinszer-9051671a" target="_blank"> Kate Zinszer </a> had the idea to use surface trend analysis to estimate the front-wave velocity of Ebola viral disease (EVD) for the 2015 outbreak, based on how it has been prevoiusly used for rabies<sup>1</sup> and sleeping sickness.<sup>2</sup> We implemented the methodology and published our findings<sup>3</sup>, and are currently working on using the method for the recent Brazilian outbreak of Zika virus. 

<!--more-->

Estimating front-wave velocity is a straightforward method but there is no pre-existing software we could find, and some of the calculations are a bit tedious. To streamline our work, I developed an R package that automates most of the calculations. All the package requires is an integer ranking of case date, and coordinates of the cases. These coordinates could either be the specific location of the case, or (more commonly), the centroid of the region and corresponding date of first case within the region. 

I will be writing a more detailed vignette in the near future, but in the meantime the package, while under active development, is useable. **Please** report any errors or requests for additional functionality to me, twitter: @kathryn_tm or email: kt.morrison AT mail.mcgill.ca 

The package is not yet on the CRAN but is hosted on github can can be installed using devtools. 


``` r
library(devtools)
install_github("kathryntmorrison/outbreakvelocity")
```

You can also <a href="https://github.com/kathryntmorrison/outbreakvelocity" target="_blank"> view the source code and submit pull requests</a>.

<sup>1</sup> Ball, Frank G. "Front-wave velocity and fox habitat heterogeneity." Population dynamics of rabies in wildlife. Edited by Philip J. Bacon (1985).

<sup>2</sup> Berrang-Ford, Lea, et al. "Spatial analysis of sleeping sickness, southeastern Uganda, 1970–2003." Emerging Infectious Diseases 12.5 (2006): 813-820. 

<sup>3</sup> Zinszer K, Morrison K, Anema A, Majumder M, Brownstein J. 2015. <a href="http://www.thelancet.com/journals/laninf/article/PIIS1473-3099(15)00234-0/abstract" target="_blank"> 'The velocity of Ebola spread in parts of west Africa.' </a> *The Lancet Infectious Diseases*, 15(9): 1005-1007.site using R markdown/knitr and github pages (like this one!) 


