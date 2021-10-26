# Rstudio - Use Internal Links in RMarkdown HTML Output - Stack Overflow

![rw-book-cover](https://readwise-assets.s3.amazonaws.com/static/images/article3.5c705a01b476.png)

## Metadata
- Author: 
- Full Title: Rstudio - Use Internal Links in RMarkdown HTML Output - Stack Overflow
- Category: #articles
- URL: https://stackoverflow.com/questions/39281266/use-internal-links-in-rmarkdown-html-output

## Highlights
- Pandoc supports explicit and implicit section references for headers; see the pandoc manual.
  explicit: you give a custom name to a header ## Test {#test} and later refer to it with a link syntax: see [the relevant section](#test).
  implicit: headers where you don't set a custom name, like ## Test, can still be refered to: See the section called [Test].
