# Getting Data From PDFs the Easy Way With R - Open Source Automation

![rw-book-cover](https://readwise-assets.s3.amazonaws.com/static/images/article3.5c705a01b476.png)

## Metadata
- Author: 
- Full Title: Getting Data From PDFs the Easy Way With R - Open Source Automation
- 
- URL: http://theautomatic.net/2018/08/24/getting-data-from-pdfs-the-easy-way-with-r/

## Highlights
- package called tabulizer was released in R, which allows you to automatically pull out tables and text from PDFs. Note, this package only works if the PDF’s text is highlightable (if it’s typed) — i.e. it won’t work for scanned-in PDFs, or image files converted to PDFs
- You can extract tables from this PDF using the aptly-named extract_tables function, like this:
  # default call with no parameters changed
  matrix_results <- extract_tables(site)
  # get back the tables as data frames, keeping their headers
  df_results <- extract_tables(site, output = "data.frame", header = TRUE)
    - Tags: [[r]] 
