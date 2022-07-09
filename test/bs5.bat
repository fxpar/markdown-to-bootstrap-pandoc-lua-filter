pandoc input.md --lua-filter ..\docs\md-to-bootstrap5.lua --template ..\template\bs5.template.html -o result-v2.html


pandoc sample.md --lua-filter bootstrap.lua -o result.html --template bs5.template.html -f markdown+inline_code_attributes





-f commonmark+attributes

ou 

-f markdown+raw_attribute
-f markdown+inline_code_attributes

-f gsm+task_lists
