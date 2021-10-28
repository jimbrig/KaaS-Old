---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@pwc.com>
Tags: ["#Type/Repo", "#Category/Development/Actuarial"]
Alias:
---

# R Package - conjuror

[[KasaAI GitHub Organization|KasaAI]]

[[R]]

## Overview

Data simulators are important for advancing insurance research because publicly available datasets from industry are scarce. The conjuror package and conventions aim to unify the interfaces of data simulation packages and make them more accessible to researchers and practitioners. It provides a set of standardized methods and functions for package authors to implement and use, along with a set of principles for each research discipline developed with input from the community.

## Framework

The main class in `conjuror` is `charm`, representing a specification that includes parameters needed to define a simulation run. The conjuror package provides the `scribe()` function as the constructor of charms, and package authors can call it from a user-facing helper function. The `conjure()` method is an [[S3 Generic]], which should be implemented for each charm class. In other words, a simulation package should provide at least two user-facing functions:

1.  A helper function, e.g. `my_simulator()`, that takes user-input parameters and returns an object of class `[c("my_simulator", "charm")]`.
2.  A `conjure.my_simulator()` method that performs the actual simulation.

It is expected that parameters related to mathematical properties of the simulation be defined in the constructor, while parameters dealing with runtime behavior, such as random seeds and parallelism, be defined in the `conjure()` method.

## Example

See the [[R Package - simulationmachine|simulationmachine]] package for a sample implementation of the conjuror interface.

## Installation

You can install the current development version of conjuror from [[GitHub]] with

```
remotes::install_github("kasaai/conjuror")
```

## General Principles

https://conjuror.kasa.ai/articles/general-principles.html

While the data formats and interfaces will be different for each discipline, there are a few conventions that we follow in general.

-   The output data should be [tidy](http://vita.had.co.nz/papers/tidy-data.html).
-   The output should be a `tibble`.
-   All argument names and variable names should be in `snake_case`.
-   The `print()` method should include a short description on what each row represents.

## Individual Claims

https://conjuror.kasa.ai/articles/individual-claims.html

This article outlines the conventions for simulators that generate individual claims data for P&C (aka general and nonlife) insurance.

### Data Format

Each row should represent the state of a claim at one point in time.

Good:

```
#> # A tibble: 3 x 4
#>   claim_id accident_year development_year paid_loss
#>   <chr>            <int>            <int>     <dbl>
#> 1 00001             2000                1       250
#> 2 00001             2000                2       150
#> 3 00001             2000                3        50
```

Bad:

```
#> # A tibble: 1 x 5
#>   claim_id accident_year paid_loss_1 paid_loss_2 paid_loss_3
#>   <chr>            <int>       <dbl>       <dbl>       <dbl>
#> 1 00001             2000         250         150          50
```

We note that the output should be at the most granular level possible, which allows the user to aggregate up as needed. For example, if instead of accident year, the simulator produces accident dates and transaction dates, those should be included instead of accident/development periods.

Variables with redundant information should not be included. E.g. if `accident_year` and `reporting_delay` are included, `reporting_lag` should not be included.

### Column Names and Types

In the following table, we list the preferred names for various variables that may be included in the output of a simulator. If you’re writing a conjuror implementation that introduces new names, please open an issue or PR with the proposal.

|                 Description                  |    Pattern    |     Example      |   Type    |
| :------------------------------------------: | :-----------: | :--------------: | :-------: |
|               Accident Period                |  accident_*   |  accident_year   |  integer  |
|                 Identifiers                  |     *_id      |     claim_id     | character |
|             Development Periods              | development_* | development_year |  integer  |
|           Incremental Paid Losses            |               |    paid_loss     |  double   |
| Categorical Claim and Policy Characteristics |               |  claimaint_age   | character |