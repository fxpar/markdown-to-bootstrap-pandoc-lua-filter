 Para = function (para) 
     return pandoc.Plain(
    {pandoc.RawInline('html', '<p class="lead">')} ..
    para.content ..
    {pandoc.RawInline('html', '</p>')}
  )
 end