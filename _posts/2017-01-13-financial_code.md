---
title: "My code for financial summaries in R"
author: "Kathryn"
date: "January 13, 2017"
output: html_document
layout: post
tags: [jekyll, markdown]
permalink: money_code
comments: yes
---

As promised, you can [see the code I wrote](https://github.com/kathryntmorrison/kathryntmorrison.github.io/tree/master/financial_code)  for taking an exported csv from Mint.com and turning it into an earnings and spending summary report in R. There are four files (src.R, queries.R, reports.Rmd, and a css file that I just use to pretty the tables). <!--more-->

Some of this will need to be cusotmized to suit your needs - for example in the function clean_data, I exclude a bunch of categories that I don't want to summarize (mostly transfers between accounts). You can tailor these for yourself.

I'll update this as I continue to improve it - going to add more summaries, more breakdowns, and some visuals. 








 




