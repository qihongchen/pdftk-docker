# pdftk-docker

A docker environment for PDFtk command tool.

The scanner in my office can only scan one side of the documents, and there's time 
I need to scan double-side documents. I found [PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
that can to put the scanned pages in the original order quickly.

But people had [problem](https://stackoverflow.com/questions/39750883/pdftk-hanging-on-macos-sierra) to run
it on OS X. And even someone make it works today, future OS X updates may break it again.
Therefore I create a docker image to run it in a stable environment regardless OS X version.

```
// create docker image, don't forget the '.' at the end
$ docker build --tag pdftk:2.02 . 

// run docker image, I put scanned document in directory /Users/qchen/Documents/pdfs,
// and it's mapped to /root/pdfs inside the docker container
docker run -v /Users/qchen/Documents/pdfs:/root/pdfs -it --rm --entrypoint=/bin/bash pdftk:2.02

// now you are inside the docker container as 'root'
// odd.pdf contains all odd pages, and even.pdf contains all even pages in reverse order
// the output is 'combined.pdf'
# pdftk A=odd.pdf B=even.pdf shuffle A Bend-1 output combined.pdf 

// extract pages 3-5, 7-9, 11, 10 from input "aaa.pdf" to output "bbb.pdf" in that order
pdftk A=aaa.pdf cat A3-5 A7-9 A11 A10 output bbb.pdf
```

See [examples](https://www.pdflabs.com/docs/pdftk-cli-examples/) for more PDFtk usages.
