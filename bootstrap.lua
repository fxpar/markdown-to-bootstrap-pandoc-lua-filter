
-- created with lots of help from tarleb



local normal_filter, special_filter, carousel_filter, tabs_filter, accordion_filter, card_filter, carddeck_filter, alert_filter
local mytoc=''
local num = 1


-- jumbo
jumbotron_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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

-- alert
alert_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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


-- card
card_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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

-- cartddeck
carddeck_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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


-- carousel
carousel_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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

-- Accordion
accordion_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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



-- Tabs
tabs_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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


-- quiz
quiz_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
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
  Meta = function(metadata)
  -- Gets the toc and pass it to the template via metadata
	metadata.toc = pandoc.RawInline('html',mytoc)
	if metadata.direction then direction = metadata.direction end
	return metadata
  end,
  Header = function (el)
	local mytitle = pandoc.utils.stringify(el)
    el.classes = {'normalHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
	mytoc = mytoc ..'<li><a href="#title'..num..'">'..el.content[1].text..'</a></li>'
    return el
  end,
  BulletList = function (el)
    local mylist ='<ul >\n'
    for i, item in ipairs(el.content) do
      local first = item[1]
      if first  then
        mylist =  mylist .. '<li class="list-group-item">' .. pandoc.utils.stringify(first) ..  '</li>\n'
      end
    end
    mylist =  mylist .. '</ul>\n'
    return pandoc.RawInline('html', mylist)
  end,

  Div = function (div)
    local filter

    if div.classes[1] == 'carousel' then
      filter = carousel_filter
	elseif div.classes[1] == 'accordion' then
      filter = accordion_filter
	elseif div.classes[1] == 'tabs' then
      filter = tabs_filter
	elseif div.classes[1] == ('info' or 'danger' or 'warning') then
      filter = alert_filter
    else
      filter = normal_filter
    end
    return div:walk(filter), false
  end
}

Pandoc = function (doc)
  return doc:walk(normal_filter)
end




function make_id (inlines, via)
  local via = via or 'html'
  local heading = pandoc.Header(1, inlines)
  local temp_doc = pandoc.Pandoc{heading}
  local roundtripped_doc = pandoc.read(pandoc.write(temp_doc, via), via)
  return roundtripped_doc.blocks[1].identifier
end

function sanitize_string(source)
    return source:gsub("%W", function(ch)
        return string.gsub(string.format("%%%02X", ch:byte())," ","")
    end)
end





