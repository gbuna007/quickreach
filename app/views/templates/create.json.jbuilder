if @template.persisted?
  json.form render(partial: "templates/form", formats: :html, locals: {template: Template.new})
  json.inserted_item render(partial: "templates/template_rows", formats: :html, locals: {templates: @template})
else
  json.form render(partial: "templates/form", formats: :html, locals: {templates: @template})
end
