--[[
-- title:  Markdown to Bootstrap Lua filter for Pandoc
-- author: François Parlant
-- with lots of help from tarleb
-- version: 0.1
--]]

-- TODO mytoc
local filter_class, normal_filter, special_filter, carousel_filter, tabs_filter, accordion_filter, card_filter, carddeck_filter, alert_filter, jumbotron_filter, quiz_filter
local mytoc=''
local num = 1
local section_num = 0
local paranum = 0
local tabs_title_list = ''
local tabs_h1_num =0
local accordion_h1_num =0
local carousel_h1_num =0



-- jumbo
-- TODO stop section to add "Display-4" from title or stop section
jumbotron_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'display-4'}
	-- print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
    return el
  end,
  Para = function (para) 
	paranum = paranum + 1
      if paranum == 1  then
		  
		  
        return pandoc.Plain(
			{pandoc.RawInline('html', '<p class="lead">')} ..
			para.content ..
			{pandoc.RawInline('html', '</p>\n<hr class="my-4"/>')}
		)
	  else
	    return para
      end
  end

}

-- alert
alert_filter = {
  traverse = 'topdown',
  print("ALERT")
}


-- card
-- TODO put a card-body div around the content
card_filter = {
  traverse = 'topdown',
  Header = function(el)
    local mytitle = pandoc.utils.stringify(el)
    el.classes = {'specialHeader'}
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
    return el
  end,
  Div = function (el)
		print('CARD:::'..el.classes[1])
    if el.classes[1] == 'header' then
		-- mylist =  mylist .. '</ul>\n'
		el.classes = {'card-header'}
		return el
	elseif el.classes[1] == 'footer' then
		el.classes = {'card-footer'}
		return el
	else
		return el
	end
  end
}

-- cardddeck
-- NOT DONE
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
    if el.level==1 then 
		local active ='active'
		local before =''
		carousel_h1_num = carousel_h1_num + 1
		if carousel_h1_num == 1 then 
			active = 'active' 
			before = ''
		else
			active=''
			before ='</div>'
		end
		-- TODO add the num of the carousel in case
		-- there are more than one in the document
		local pre =pandoc.RawBlock('html',before..[[
			<div class="carousel-item ]]..active..[["><h2>
		]])
		local post =pandoc.RawBlock('html','</h2>')
		local content = el.content
		table.insert(content,1,pre)
		table.insert(content, post)
		return content
	else
		return el
	end
	
  end
}







-- Accordion
accordion_filter = {
  traverse = 'topdown',
  Header = function(el)
    if el.level==1 then 
		local show ='show'
		local before =''
		accordion_h1_num = accordion_h1_num + 1
		if accordion_h1_num == 1 then 
			show = 'show' 
			before = ''
		else
			show=''
			before ='</div></div></div>'
		end
		-- TODO add the num of the accordion in case
		-- there are more than one in the document
		local pre =pandoc.RawBlock('html',before..[[
	
  <div class="accordion-item">
    <h2 class="accordion-header" id="heading]]..accordion_h1_num..[[">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse]]..accordion_h1_num..[[" aria-expanded="true" aria-controls="collapse]]..accordion_h1_num..[[">
        ]]..pandoc.utils.stringify(el) ..[[
      </button>
    </h2>
    <div id="collapse]]..accordion_h1_num..[[" class="accordion-collapse collapse ]].. show..[[" aria-labelledby="heading]]..accordion_h1_num..[[" data-bs-parent="#accordionExample">
      <div class="accordion-body">
	
		]])
		local post =pandoc.RawBlock('html','')
		local content = el.content
		table.insert(content,1,pre)
		table.insert(content, post)
		return content
	else
		return el
	end
	
  end
}



-- Tabs
tabs_filter = {
  traverse = 'topdown',
  Header = function(el)
	-- we need to process twice the level 1 headings
	-- once to create the card header
	-- once to process the content
    if el.level==1 then 
	 print("TABS_TITLE_1")
	 -- create the tab header
		local show = ''
		-- we want to add the "show active" class only to the first h1
		tabs_h1_num = tabs_h1_num + 1
		if tabs_h1_num == 1 then show = 'show active' end
		tabs_title_list = tabs_title_list .. '<li class="nav-item"><a class="nav-link '..show..'" data-bs-toggle="tab" href="#menu'..tabs_h1_num..'">'.. pandoc.utils.stringify(el) ..'</a></li>'
			show ='' 
		
	-- create the tab content
		local active = ''
		local pre =''

		if tabs_h1_num == 1 then
			active = ''
			-- we close the tab header and we add active
			pre = pandoc.RawBlock('html','</ul></div> \n\n<div class="tab-content border-left border-right border-bottom ">\n\t<div id="menu'..tabs_h1_num..'" class="tab-pane fade in active show border p-3"><h1>')
		else
			-- we close previous menu and we start the menu
			pre = pandoc.RawBlock('html','</div><div id="menu'..tabs_h1_num..'" class="tab-pane fade in border p-3"><h1>')
		end
		local post =pandoc.RawBlock('html','</h1>')
		local content = el.content
		table.insert(content,1,pre)
		table.insert(content, post)
		return content
	else
		return el
	end
		

	
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


--[[
NORMAL FILTER
For everything outside a special filter
--]]
normal_filter = {
  traverse = 'topdown',
  Meta = function(metadata)
  -- Gets the toc and pass it to the template via metadata
	-- metadata.toc = pandoc.RawInline('html',"<!-- test -->"..mytoc)
	-- if metadata.direction then direction = metadata.direction end
	if metadata.url then url = metadata.url end
	local t = pandoc.utils.stringify(metadata.title)
	local u = pandoc.utils.stringify(metadata.url)
	local link = pandoc.Link(t,u)
	local socialblock = make_social(link, false)
	metadata.socialblock = socialblock
	return metadata
  end,
  Header = function (el)
	local mytitle = pandoc.utils.stringify(el)
	if el.level == 1 then el.classes = {"display-2"} end
	el.identifier = "title"..num
	print(make_id(pandoc.Inlines (pandoc.utils.stringify(el))))
	-- mytoc = mytoc ..'<li><a href="#title'..num..'">'..el.content[1].text..'</a></li>'
	addToToc(el)
    return el
  end,
  Link = function(el)
	local  c ='primary'
	if el.classes[1] then c = el.classes[1] end
		el.classes = {'btn','btn-'..c}
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

--[[
Very important part. 
This where we assign filters.
--]]
  Div = function (div)
    if div.classes[1] == 'carousel' then
	  return make_carousel(div)
	elseif div.classes[1] == 'quiz' then
      filter = quiz_filter
	elseif div.classes[1] == 'card' then
      filter = card_filter
	elseif div.classes[1] == 'jumbotron' then
	  return make_jumbotron(div)
	elseif div.classes[1] == 'accordion' then
		return make_accordion(div)
	elseif div.classes[1] == 'tabs' then
	  return make_tabs(div)
	elseif (div.classes[1] == 'primary' or div.classes[1] == 'secondary' or div.classes[1] == 'light' or div.classes[1] == 'dark' or div.classes[1] == 'info' or div.classes[1] == 'danger' or div.classes[1] == 'warning') then
	  div.classes = {'alert','alert-'..div.classes[1]}
      filter = alert_filter
    else
      filter = normal_filter
    end	
	return div:walk(filter), false
  end
}

Pandoc = function (doc)
  -- return doc:walk(normal_filter)
  doc.meta.toc = pandoc.RawInline('html',mytoc)
  return makeTOC(doc:walk(normal_filter))
end


function make_jumbotron(div)
	local content = pandoc.walk_block(div,jumbotron_filter).content
	local pre = pandoc.RawBlock('html','')
	local post = pandoc.RawBlock('html','')
	table.insert(content,1,pre)
	table.insert(content, post)
	return content
end

function make_accordion(div)
      -- filter = accordion_filter
	  local content = pandoc.walk_block(div,accordion_filter).content
	  -- TODO change id of the accordion to be variable
	  local pre = pandoc.RawBlock('html','<div class="accordion" id="accordionExample">')
	  local post = pandoc.RawBlock('html','</div></div></div></div>')
	  table.insert(content,1,pre)
	  table.insert(content, post)
	  -- reset accordion_h1_num for another tab in document
	  accordion_h1_num = 0
	  return content
end

function make_carousel(div)
	section_id = section_num + 1
      filter = carousel_filter
	  local content = pandoc.walk_block(div,carousel_filter).content
	  local pre = pandoc.RawBlock('html','<div id="carousel'..section_id..'" class="carousel slide" data-bs-ride="carousel">\n<div class="carousel-inner">')
	  local post = pandoc.RawBlock('html',[[    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carousel]]..section_id..[[" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carousel]]..section_id..[[" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		  </button>
		</div>]])
	  table.insert(content,1,pre)
	  table.insert(content, post)
	  -- reset carousel_h1_num for another tab in document
	  carousel_h1_num = 0
	  return content
end

function make_tabs(div)
      -- filter = tabs_filter
	  -- we need to insert the tab header 
	  -- before we add the content
	  local content = pandoc.walk_block(div,tabs_filter).content 
	  local pre = pandoc.RawBlock('html','<div class="card-header"><ul class="nav nav-pills card-header-pills" style="list-style-type: none;">'..tabs_title_list..'</ul></div><div class="tab-content border-left border-right border-bottom ">')
	  -- we close last menu and content
	  local post = pandoc.RawBlock('html','</div></div>')
	  table.insert(content,1,pre)
	  table.insert(content, post)
	  -- reset tabs_h1_num for another tab in document
	  tabs_h1_num = 0
	  return content

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

function addToToc(el)
	print("TOC: "..pandoc.utils.stringify(el))
	mytoc = mytoc ..'<li><a href="#title'..num..'">'.. pandoc.utils.stringify(el).."</a></li>"
	num = num + 1
	return true
end







function make_social(el, includelink)
	-- local post = make_social(el)
	local content=pandoc.utils.stringify(el.content)
	local content_e = urlencode(content)
	local target = el.target
	local target_e = urlencode(target)
	-- local mysocial = '<span>finished</span>'
	local mysocial = [[
	
	
	<li><a class="dropdown-item" href="https://www.facebook.com/sharer/sharer.php?u=]]..target_e..[["><i class="bi-facebook p-3"></i> Facebook</a>
	
	
	<li><a class="dropdown-item" href="http://twitter.com/intent/tweet?text=]]..content_e..[[&url=]]..target_e..[["><i class="bi-twitter p-3"></i> Twitter</a></li>
	
	<li><a class="dropdown-item" href="http://www.linkedin.com/shareArticle?mini=true&url=]]..target_e..[[&title=]]..content_e..[["><i class="bi-linkedin p-3"></i> LinkedIn</a></li>
	
	<li><a class="dropdown-item" href="https://wa.me/?text=]]..content_e..[[%20]]..target_e..[["><i class="bi-whatsapp p-3"></i> Whatsapp</a></li>
	
	<li><a class="dropdown-item" href="https://telegram.me/share/url?url=]]..target_e..[[&text=]]..content_e..[["><i class="bi-telegram p-3"></i> Telegram</a></li>
	
	<li><a class="dropdown-item" href="mailto:?subject=Super%2
	0link&body=]]..target_e..[[%0D%0A]]..content_e..[["><i class="bi-envelope p-3"></i> Mail</a></li>
	

	]]
	
	local post = pandoc.RawInline('html',mysocial)
	-- print(el.content)
	if includelink == false then
		return post
	else
		return {el, post}
	end
end

-- we need to modify the doc AT THE END to add the toc
function makeTOC(doc)
	doc.meta.toc = pandoc.RawInline('html',"<!-- test 2-->\n"..mytoc)
	return doc
end


--used to create the social links url with special chars converted to hex
function urlencode (str)
   str = string.gsub (str, "([^0-9a-zA-Z!'()*._~-])", -- locale independent
      function (c) return string.format ("%%%02X", string.byte(c)) end)
   --str = string.gsub (str, " ", "+")
   return str
end






