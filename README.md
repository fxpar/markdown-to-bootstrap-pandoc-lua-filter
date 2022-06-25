# Pandoc Lua filter : Markdown To Bootstrap

Project of creating a Lua filter to converts markdown to html Bootstrap components. 

Main target: helping course creation from teachers to Learning Management Software (Moodle's main themes, like "Boost" are Bootstrap based) or web/mobile page.

Hopefully one day included in the https://github.com/pandoc/lua-filters repository.



# USAGE

```
pandoc sample.md --lua-filter bootstrap.lua -o expected.html
```

Or with a template to add the bootstrap headers and navbar with Table of content.

# COMPONENTS

These are syntax propositions. Ideally, the codes to be added to a raw md document should be minimal to convert it into bootstrap.

In a perfect solution, only a few sections like :::carousel or :::quiz should be added. The rest of the component should be "deduced" from the structure of the source document.

# Header block (jumbotron)

* **Expected syntax**: 1) A title followed by 2) a paragraph 3) a line and 4) another paragraph 
* **Should be converted into**: a "jumbotron" (bootstrap 4) or a header (Bootstrap 5)

```
# title
Lead text
---
Description
```

## Alerts
* Sections called info, warning, danger... 
* Should be rendered as alerts

```
:::danger
You must do this to be safe
:::
```

## Cards

_For now, a section needs to be added. Hopefully, a more evident syntax could be used to deduce a card structure directly in the source file without any addition._

A section called card with some paragraph are turned into a card. The paragraphs are the card body.

The card section can have a nested header section and or a nested footer section with some paragraphs.

```
:::card

:::header (optional)
text of the header
:::

Paragraph one of the body
Paragraph two of the body

:::footer (optional)
text of the footer
:::

:::

```


## Carousel
A section called carousel with multiple Headers should be converted into a carousel, each header becoming a slide.

The text can be cards of other component nested.

```
::: carousel

# first slide
Some text

# Second slide
Some text

:::

```

## Accordion
A section called accordion with multiple Headers and text should be converted into collapsible accordion, each header becoming the toglle link name.

```
::: accordion

# first toggle link
Some text

# Second toggle link
Some text

:::

```



## Tabs
A section called tabs with multiple Headers and text should be converted into tabs, each header becoming a tab header or pill.

```
::: tabs

# first tab or pill
Some text

# Second tab or pill
Some text

:::

```



## Quiz
A heading with a list inside a Quiz section should be converted into a quiz

Correct solutions DO have a feedback.

(A former proposition was to have the correct answer start with * or + and the other propositions start with - , but pandoc's abstract tree doesn't keep the symbol used in the list)

Quiz questions can be nested into a carousel. A "next" button should be added if it is the case.

```
::: quiz

# Question 1

* proposition a
* proposition b
  * feedback for proposition b
* proposition c
* proposition d
  * feedback for proposition d
  
# Question 2

* prop a
  * feedback prop a
* prop b
* prop c
* prop d
:::
```

## Images

Images references are converted to img or card-img if they are inside a card section.

## Buttons

A link becomes by default a button

## Media link

A link to a media (YouTube, Vimeo...) becomes an iframe with embed

# ALTERNATIVES
Other languages or tools could be used
* markdown-it converter
* Hugo 
* Vuepress / Vitepress
* python
* perl parser
