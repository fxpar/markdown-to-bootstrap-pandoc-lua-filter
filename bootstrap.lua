[[DRAFT or a SKETCH not working... yet]]

local normal_filter, special_filter
local mytoc=''
local num = 1
special_filter = {
  Header = function(el)
    el.attributes['class'] = 'specialHeader'
    return el
  end,
  BulletList = function (el)
	print("specialBulletList")
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
  Header = function (el)
    el.attributes['class']='normalHeader'
    return el
  end,
  BulletList = function (el)
    print("normalBulletList")
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
	  print("Special")
      filter = special_filter
    else
	  print("normal")
      filter = normal_filter
    end

    return div:walk(filter)
  end
}

return {normal_filter}










