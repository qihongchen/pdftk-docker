1. Assume there are individual pdfs for each chapter. The first step is to combine all pdfs files in one big pdf:

```
pdftk frontmatter.pdf content.pdf foreword.pdf intro.pdf ch01.pdf ch02.pdf ch03.pdf ch04.pdf ch05.pdf \
ch06.pdf ch07.pdf ch08.pdf ch09.pdf ch10.pdf ch11.pdf ch12.pdf ch13.pdf ch14.pdf ch15.pdf ch16.pdf \
ch17.pdf ch18.pdf ch19.pdf ch20.pdf ch21.pdf ch22.pdf ch23.pdf ch24.pdf ch25.pdf ch26.pdf apa.pdf \
apb.pdf apc.pdf apd.pdf glossary.pdf references.pdf index.pdf cat output book.pdf
```

2. Dump book metadata
```
pdftk book.pdf dump_data > metadata.txt
```


3. Update book metadata with Bookmarks: After line of "NumberOfPages: XXX", insert book marks
```
BookmarkBegin
BookmarkTitle: Content
BookmarkLevel: 1
BookmarkPageNumber: 11

BookmarkBegin
BookmarkTitle: PART I. NBT: NetBIOS over TCP/IP
BookmarkLevel: 1
BookmarkPageNumber: 33

BookmarkBegin
BookmarkTitle: Chapter 1. A Short Bio of NetBIOS
BookmarkLevel: 2
BookmarkPageNumber: 35

BookmarkBegin
BookmarkTitle: Chapter 2. Speaking NetBIOS
BookmarkLevel: 2
BookmarkPageNumber: 37
```
note that you can have multiple levels of bookmarks

4. The last step is to update the book pdf with new metadata
```
pdftk book.pdf update_info_utf8 metadata.txt output book-with-index.pdf
```
