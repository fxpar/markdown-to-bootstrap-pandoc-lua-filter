---
title: Markdown to Bootstrap
author: François Parlant
description: Pandoc Lua filter to convert markdown code into Beautiful Bootstrap components (carousel, accordion, cards, jumbotrons...)
url: https://fxpar.github.io/Pandoc-Lua-Markdown-Bootstrap/
---


# JUMBOTRON

::: jumbotron

# Learn Markdown

Lead text for this header block

Description part for this jumbotron

:::


# JUMBOTRON COLORED

::: {.jumbotron .bg-success .text-white}

# Learn Boostrap

Lead text for this header block

Description part for this jumbotron

:::



# ALERTS

::: danger

You must do this to be safe

:::



::: info

This is an information

:::


::: warning

[]{.bi .bi-bug} This is an information

:::



# CARD

::: card ::::::::

::: header

text of the header

:::

# a title in the body

Paragraph one of the body
Paragraph two of the body

::: footer

text of the footer

:::

::::::::::::::::::





# ACCORDION


::: accordion

# Accordion Item #1
First toggle content

# Accordion Item #2
Second toggle content

# Accordion Item #3
Third toggle content

:::





# CAROUSEL

::: carousel

# First slide label
Some representative placeholder content for the first slide.

# Second slide label
Some representative placeholder content for the second slide.

# Third slide label
Some representative placeholder content for the third slide.

:::





# TABS

::: tabs

# Linux

## Support for Linux users

Create a shell script

# Mac

## Support for Mac users

Do it with Cmd.

# Windows

## Support for windows users

Do it with Ctrl

:::



::: quiz

# special chapter

* at the start
* something else
* the end

:::




::: {.quiz .carousel}

# 2 most frequent questions
Earn points for the exam


# Which bootstrap component can be swyped?
* Carousel
  * Perfect! yes the carousel has controls to swype on mobile and click on desktop.
		Second paragraph of feedback
* Accordion
* Alert
* Carddeck

# Which language takes indentation very seriously?
* javascript
* Php
* Python
  * yes in Python indenting code is very important


:::


# BUTTONS

[Pandoc repository](https://github.com/pandoc)

[Pandoc repository](https://github.com/pandoc){.success}


# EMBEDS

[Moodle Bootstrap Design](https://www.youtube.com/watch?v=Uz7XbIxHf-4)


# Icons

I love []{.bi .bi-bootstrap} with markdown.



# normal chapter
* a normal list
* with items
* or more
* to finish