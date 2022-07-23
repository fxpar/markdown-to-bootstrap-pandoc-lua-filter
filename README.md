# Pandoc Lua filter : Markdown To Bootstrap

**BETA VERSION**

A Lua filter to convert markdown to Bootstrap components like cards, carousel, accordion, tabs, jumbotrons, alerts, buttons, embeds... 

**Main target**: helping course creation from teachers to Learning Management Software (Moodle's main themes, like "Boost" are Bootstrap based) or web/mobile page.

Hopefully one day included in the https://github.com/pandoc/lua-filters repository.

# STATUS

Here is the list of the components successfully created with this filter

* [x] Jumbotrons
* [x] Accordions
* [x] Alerts
* [x] Tabs
* [x] Carousel
* [x] Buttons
* [ ] Carddeck
* [ ] ButtonGroups
* [ ] Dropdowns
* [ ] YouTube Embeds

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

# COMPONENTS

These are syntax propositions. Ideally, the codes to be added to a raw md document should be minimal to convert it into bootstrap.

In a perfect solution, only a few sections like :::carousel or :::quiz should be added. The rest of the component should be "deduced" from the structure of the source document.

# Header block (jumbotron)

<table> 
<tr><th>Simply type this:</th>  <th>Get that: </th><tr>

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

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionJumbo)

* **Expected syntax**: a section called jumbotron
* **Should be converted into**: a "jumbotron" (bootstrap 4) or a header (Bootstrap 5)
  * the title
  * the first paragraph
  * a horizontal rule
  * all the other paragraphs or content

```
::: jumbotron
# Title of the jumbotron
Lead text for this header block

Description part for this jumbotron
:::
```

Becomes

```
<div class="jumbotron">
  <h1 class="display-4">Title of the jumbotron</h1>
  <p class="lead">Lead text for this header block</p>
  <hr class="my-4">
  <p>Description part for this jumbotron</p>
</div>
```


## Simple Quiz

<table> 
<tr><th>Simply type the question and proposals:</th>  <th>And get that :</th><tr>

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

<table> 
<tr><th>Type simply the slide content:</th>  <th>And get that: </th><tr>

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


A section called carousel with multiple Headers should be converted into a carousel, each header becoming a slide.

The text can be cards of other component nested.

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionCarousel)


```
::: carousel carouselId

# first slide
Content of first slide

# Second slide
Content of second slide

# Third slide
Content of third slide

:::

```


Becomes

```
<div id="carouselId" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      Content of first slide (including title)
    </div>
    <div class="carousel-item">
      Content of second slide (including title)
    </div>
    <div class="carousel-item">
      Content of Third slide (including title)
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselId" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselId" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
```


## Accordion

<table> 
<tr><th>Simply type the content of the toggle:</th>  <th>And get that: </th><tr>

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

A section called accordion with multiple Headers and text should be converted into collapsible accordion, each header becoming the toglle link name.

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionAccordion)

```
::: accordion accordionId

# first toggle link
First toggle content

# Second toggle link
Second toggle content

# Third toggle link
Third toggle content

:::

```



```
<div id="accordionId">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          first toggle link
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
        First toggle content
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Second toggle link
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
        Second toggle content
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Third toggle link
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
        Third toggle content
      </div>
    </div>
  </div>
</div>

```



## Tabs


<table> 
<tr><th>Type simply this:</th>  <th>Get that </th><tr>

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

A section called tabs with multiple Headers and text should be converted into tabs, each header becoming a tab header or pill.

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionTabs)

```
::: tabs

# first tab or pill
Some text

# Second tab or pill
Some text

# Third tab or pill
Some text

:::

```


Becomes

```

                <p><br></p>
                <div class="card-header">
                    <ul class="nav nav-pills card-header-pills" style="list-style-type: none;">
                        <li class="nav-item">
                            <a class="nav-link  active show" data-bs-toggle="tab" href="#menu1">Linux</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#menu2">Mac</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#menu3">Windows</a>
                        </li>

                    </ul>
                </div>

                <div class="tab-content border-left border-right border-bottom p-3">
                    <div id="menu1" class="tab-pane fade in active show">
                        <h3 class="display-4">Support For linux users</h3>
                        <p class="lead">Create a shell script</p>
                       
                    </div>
                    <div id="menu2" class="tab-pane fade">
                        <h3 class="display-4">Support for MAc users</h3>
                        <p class="lead">Do it with Cmd.</p>
                        
                    </div>
                    <div id="menu3" class="tab-pane fade ">
                        <h3 class="display-4">Support for windows users</h3>
                        <p class="lead">Do it with Ctrl</p>
                        
                    </div>

                </div>
```







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

<table> 
<tr><th>Type simply this:</th>  <th>Get that </th><tr>

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

_For now, a section needs to be added. Hopefully, a more evident syntax could be used to deduce a card structure directly in the source file without any addition._

A section called card with some paragraph are turned into a card. The paragraphs are the card body.

The card section can have a nested header section and or a nested footer section with some paragraphs.

[Check the demo]( https://fxpar.github.io/markdown-to-bootstrap-pandoc-lua-filter/index.html#sectionCards)


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


```
<div class="card text-center">
  <div class="card-header">
    text of the header
  </div>
  <div class="card-body">
    <h5 class="card-title">a title in the body</h5>
    <p class="card-text">Paragraph one of the body</p>
    <p class="card-text">Paragraph two of the body</p>
  </div>
  <div class="card-footer text-muted">
    text of the footer
  </div>
</div>
```




## Swyping Quiz

<table> 
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


A heading with a list inside a Quiz section should be converted into a quiz

Correct solutions DO have a feedback.

(A former proposition was to have the correct answer start with * or + and the other propositions start with - , but pandoc's abstract tree doesn't keep the symbol used in the list)

Quiz questions can be nested into a carousel. A "next" button should be added if it is the case.

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

## Images

Images references are converted to img or card-img if they are inside a card section.

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

A link becomes by default a button

## Media link

<table> 
<tr><th>Type simply this:</th>  <th>Get that </th><tr>

<tr><td>

```

[Bootstrap design](https://www.youtube.com/watch?v=Uz7XbIxHf-4)

```

</td>
<td> 

![jumbotron](/media/youtube.png) 

</td></tr>
</table>

A link to a media (YouTube, Vimeo...) becomes an iframe with embed

# ALTERNATIVES
Other languages or tools could be used
* markdown-it converter
* Hugo 
* Vuepress / Vitepress
* python
* perl parser
