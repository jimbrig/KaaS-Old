---
Date: 2021-10-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: instapaper
Link: https://petermeissner.de/blog/2018/04/27/re-exporting-the-pipe/
---
# Re-Exporting the Magrittr Pipe Operator › Petermeissner

## Metadata
- Author: [[Peter Meissner]]
- Full Title: Re-Exporting the Magrittr Pipe Operator › Petermeissner
- Category: #articles
- URL: https://petermeissner.de/blog/2018/04/27/re-exporting-the-pipe/

## Highlights
- Magrittr’s pipe operator is one of those newish R-universe features that I really want to have around whenever I put some lines into an R-console. This is even TRUE when writing a package.
- So the first thing I do is put magrittr into the DESCRIPTION file and add an __imports.R file to the packages R/-directory with the following lines:
    - Note: R/_imports.R
      #' re-export magrittr pipe operator
      #'
      #' @importFrom magrittr %>%
      #' @name %>%
      #' @rdname pipe
      #' @export
      NULL
