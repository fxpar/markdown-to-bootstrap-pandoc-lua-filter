# Bootstrap Template for pandoc

A template to add some basic bootstrap architecture around a document.


* meta
	* title
	* author
	* description
	* base
* css
	* bootstrap 5 min
	* bootstrap icons
	* sidebar (for turning chevrons)
* scripts
	* bootstrap 5 min
* sidebar
	* table of content
	

## Usage

This template can be applied to other formats than markdown.

pandoc input.md --template bs5.template.html -o output.html



## Markdown

```
---
title: Markdown to Bootstrap
author: François Parlant
description: Pandoc Lua filter to convert markdown code into Beautiful Bootstrap components (carousel, accordion, cards, jumbotrons...)

---

# title one of the document

Some introduction text

## A level 2 title

Some text

# another level 1 title

More text

```

## References

* Used by the [markdown to bootstrap](https://github.com/fxpar/markdown-to-bootstrap-pandoc-lua-filter) components filter
