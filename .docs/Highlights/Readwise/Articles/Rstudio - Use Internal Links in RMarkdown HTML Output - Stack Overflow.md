---
Date: 2021-10-26
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: instapaper
Link: https://stackoverflow.com/questions/39281266/use-internal-links-in-rmarkdown-html-output
---
# Rstudio - Use Internal Links in RMarkdown HTML Output - Stack Overflow

## Metadata
- Author: 
- Full Title: Rstudio - Use Internal Links in RMarkdown HTML Output - Stack Overflow
- Category: #Type/Highlights/Article
- URL: https://stackoverflow.com/questions/39281266/use-internal-links-in-rmarkdown-html-output

## Highlights
- Pandoc supports explicit and implicit section references for headers; see the pandoc manual.
  explicit: you give a custom name to a header ## Test {#test} and later refer to it with a link syntax: see [the relevant section](#test).
  implicit: headers where you don't set a custom name, like ## Test, can still be refered to: See the section called [Test].
