# Pandoc-Lua-Markdown-Bootstrap-

Project of creating a Lua filter to converts markdown to Bootstrap components.

# Headers

A title followed by a paragraph a line and another paragraph should be converted into a "jumbotron" (bootstrap 4) or a header (Bootstrap 5).
```
# title
Lead text
---
Description
```


# Cards
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


# Carousel
A section called carousel with multiple Headers should be converted into a carousel, each header becoming a slide.

```
::: carousel

# first slide
Some text

# Second slide
Some text

:::

```

# Accordion
A section called accordion with multiple Headers and text should be converted into collapsible accordion, each header becoming the toglle link name.

```
::: accordion

# first toggle link
Some text

# Second toggle link
Some text

:::

```



# Tabs
A section called tabs with multiple Headers and text should be converted into tabs, each header becoming a tab header or pill.

```
::: tabs

# first tab or pill
Some text

# Second tab or pill
Some text

:::

```



# Quiz
A heading with a list inside a Quiz section should be converted into a quiz

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
