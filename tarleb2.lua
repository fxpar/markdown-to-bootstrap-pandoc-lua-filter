local normal_filter, special_filter
special_filter = {
  traverse = 'topdown',
  Header = function(el)
    el.classes = {'specialHeader'}
    return el
  end,
  BulletList = function (el)
    local mylist ='<ul >\n'
    for i, item in ipairs(el.content) do
      local first = item[1]
      if first  then
        mylist =  mylist .. '<li class="special-item">' .. pandoc.utils.stringify(first) ..  '</li>\n'
      end
    end
    mylist =  mylist .. '</ul>\n'
    return pandoc.RawInline('html', mylist)
  end
}

normal_filter = {
  traverse = 'topdown',
  Header = function (el)
    el.classes = {'normalHeader'}
    return el
  end,
  BulletList = function (el)
    local mylist ='<ul >\n'
    for i, item in ipairs(el.content) do
      local first = item[1]
      if first  then
        mylist =  mylist .. '<li class="normal-item">' .. pandoc.utils.stringify(first) ..  '</li>\n'
      end
    end
    mylist =  mylist .. '</ul>\n'
    return pandoc.RawInline('html', mylist)
  end,

  Div = function (div)
    local filter

    if div.classes[1] == 'Special' then
      filter = special_filter
    else
      filter = normal_filter
    end
    return div:walk(filter), false
  end
}

Pandoc = function (doc)
  return doc:walk(normal_filter)
end
