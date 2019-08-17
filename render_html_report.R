# Render markdown report to HTML
rmarkdown::render("icymi_report.Rmd", "html_document")
#rawHTML <- paste(readLines("icymi_report.html"), collapse="\n")
aws.s3::put_object(file = "icymi_report.html", object = "icymi_report.html", bucket = "bucket-number-01")

