---
title: bayestraitr
author: 'Sam Passmore'
date: '2019-06-06'
slug: []
categories: [Software]
tags: [Software]
Description: 'Introduction to bayestraitr'
Tags: []
Categories: []
DisableComments: yes
---

I’ve been using BayesTraits for the last year or so, and had developed a package to make it easy to create data for BayesTraits and to read the output into R - called bayestraitr.

The main difference between this package and the existing [R-BayesTraits package btw](http://www.randigriffin.com/projects/btw.html) is that my package doesn't let you interact with BayesTraits in R, only create BayesTraits input, and read BayesTraits output. I found this approach useful because BayesTraits is a constantly evolving software. By only dealing with inputs and outputs, users can interact with the most up-to-date version of BayesTraits, without relying on R packages to update alongside. 

You can check out the code and some more examples on the [github page](https://github.com/SamPassmore/bayestraitr).

Here I will walk through how to use it!

# Installing

To install this package run this line:

```
devtools::install_github('SamPassmore/bayestraitr')
```

and load with

```
library(bayestraitr)
```

# Reading output files

There are three functions in this package at the moment for reading in BayesTrait \*.Log files, \*.Schedule files, & \*.Stones

```
log = bt_read.log('./bayestrait_output/Artiodactyl.txt.Log.txt')
```

Will return a dataframe of the log matrix. The file header are contained as an attribute which can be accessed by using ```attributes(log)$settings```

```
schedule = bt_read.schedule('./bayestrait_output/Artiodactyl.txt.Schedule.txt')
```

This returns one data.frame with the contents of the Schedule file.

```
stones = bt_read.stones('./bayestrait_output/Artiodactyl.txt.Stones.txt')
```

This returns a list of 2 items. ```\$stones_sampling``` holds the stones sampling, and ```marginal_likelihood``` holds the marginal log-likelihood. The stones file header can be found in the attributes by using the code ```attributes(stones)$settings```

# Writing input files

The function ```bt_write``` takes various tree types (e.g. phylo & multiphylo) and data.frame input and writes them as input files for BayesTraits. This means replacing NAs with "-", removing column headers, and ensuring data files are tab-delimited. 

First, have you data and phylogeny loaded into R

```
library(ape)
tree = read.nexus('bayestraits_output/Artiodactyl.trees')
data = read.csv('bayestraits_output/Artiodactyl.tsv', sep = "\t")
```

As with most phylogenetic software in R, you need to make sure the rows of your dataframe indicate the taxa of the phylogeny they connect to.

```
rownames(data) = data$taxa
```

Finally, use ```bt_write``` to write your BayesTraits input files by indicating the names of your data, tree(s), as well as your variable(s) of interest, and the location and filename for the outputs. This function will save two files, one which holds your data (with the suffix ```*.btdata```) and one which holds your tree(s) (```*.bttrees```). 



```
bt_write(tree = tree, data = data, variables = 'trait1', filename = 'test')
```

This package is in development, so please log any issues you find while using it! And keep an eye out for new functions! 
