# Pandoc Lua filter : Markdown To Bootstrap

**BETA VERSION**

A Lua filter to convert markdown to Bootstrap components like cards, carousel, accordion, tabs, jumbotrons, alerts, buttons, embeds... 

**Main target**: helping course creation from teachers to Learning Management Software (Moodle's main themes, like "Boost" are Bootstrap based) or web/mobile page.

Hopefully one day included in the https://github.com/pandoc/lua-filters repository.



## Other tools included
This filter comes with a template to include:

* [x] Table of content for the sidebar

Another filter can be used to insert social network blocks:

* [x] [Social-snetwork](https://github.com/fxpar/social-networks-pandoc-lua-filter) filter to create recommandation blocks



# USAGE


```
pandoc sample.md --lua-filter bootstrap.lua -o expected.html -f markdown+inline_code_attributes
```

Or with a template to add the bootstrap headers and navbar with Table of content.
```
pandoc sample.md --lua-filter bootstrap.lua -o result.html --template bs5.template.html -f markdown+inline_code_attributes
```



## Header block (jumbotron)

<table style="width:100%"> 
<tr><th style="width:50%">Simply type this:</th>  <th>Get that: </th><tr>

<tr><td>

 ```
::: jumbotron
# Markdown to Bootstrap
Discovert how some simple Mardown can 
 be converted

Here is an implementation with pandoc 
 and Lua filter
:::
``` 
</td>
<td> 

![jumbotron](/media/jumbotron.png) 

</td></tr>
</table>



## Simple Quiz

<table style="width:100%"> 
<tr><th style="width:50%">>Simply type the question and proposals:</th>  <th>And get that :</th><tr>

<tr><td>

 ```
::: quiz
# This is the question?

* First proposition
  * Explanation about first
* Second proposition
* Third proposition
* Fourth proposition
  * Explanation about fourth

:::
``` 
</td>
<td> 

![jumbotron](/media/quiz.gif) 

</td></tr>
</table>



## Carousel

<table style="width:100%"> 
<tr><th style="width:50%">Type simply the slide content:</th>  <th>And get that: </th><tr>

<tr><td>

```
::: carousel carouselId

# first slide
Some content for first slide

# Second slide
Some content for second slide

# Third slide
Some content for third slide

:::

```

</td>
<td> 

![jumbotron](/media/carousel.gif) 

</td></tr>
</table>





## Accordion

<table style="width:100%"> 
<tr><th style="width:50%">Simply type the content of the toggle:</th>  <th>And get that: </th><tr>

<tr><td>

```
::: accordion accordionId

# first toggle link
Content of the first toggle

# Second toggle link
Content of the second toggle

# Third toggle link
Content of the third toggle

:::

```


</td>
<td> 

![jumbotron](/media/accordion.gif) 

</td></tr>
</table>




## Tabs


<table style="width:100%"> 
<tr><th style="width:50%">Type simply this:</th>  <th>Get that </th><tr>

<tr><td>

```
::: tabs

# Choice 1
Some content for first choice

# Choice 2
Some content for second choice

# Choice 3
Some content for third choice

:::

```
</td>
<td> 

![jumbotron](/media/tabs.gif) 

</td></tr>
</table>






## Alerts
* Sections called info, warning, danger... 
* Should be rendered as alerts

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionAlerts)

```
::: danger
You must do this to be safe
:::
```

Becomes

```
<div class="alert alert-danger" role="alert">
  You must do this to be safe
</div>
```


## Cards

<table style="width:100%"> 
<tr><th style="width:50%">Type simply the card content:</th>  <th>Get that </th><tr>

<tr><td>

```
::: card

::: header (optional)
text of the header
:::

# a title in the body

Paragraph one of the body
Paragraph two of the body

:::footer (optional)
text of the footer
:::

:::

```

</td>
<td> 

![jumbotron](/media/card.png) 

</td></tr>
</table>



## Swyping Quiz

<table  style="width:100%"> 
<tr><th>Type simply this:</th>  <th>And get that: </th><tr>

<tr><td>

```
::: carousel

::: quiz

# Check your level

A little quiz for you!

# Question 1

* proposition 1
  * feedback for proposition 1
* proposition 2
* proposition c
* proposition d

  
# Question 2

* Prop A
* Prop B
* Prop C
  * feedback prop C
* prop D
:::

:::
```

</td>
<td> 

![jumbotron](/media/carouselquiz.gif) 

</td></tr>
</table>




## Images



## Buttons
<table> 
<tr><th>Type simply this:</th>  <th>Get that </th><tr>

<tr><td>

```

You can [Click me](https://github.com/pandoc)

```

</td>
<td> 

![jumbotron](/media/button.png) 

</td></tr>
</table>



## Media link

<table> 
<tr><th>Type simply this:</th>  <th>Get that </th><tr>

<tr><td>

```

[Bootstrap design](https://www.youtube.com/watch?v=Uz7XbIxHf-4)

```

</td>
<td> 

![youtube embed](/media/youtube.png) 

</td></tr>
</table>



# ROADMAP

Here is what is already done and which components are planned:

* [x] Jumbotrons
* [x] Accordions
* [x] Alerts
* [x] Tabs
* [x] Carousel
* [x] Buttons
* [ ] Carddeck
* [ ] ButtonGroups
* [ ] Dropdowns
* [x] YouTube Embeds