if @template.persisted? # if template is saved
  # insert_item is the submitted form
  json.inserted_item render(partial: "templates/template", formats: :html, locals: { template: @template })
  # form is the new empty form
  # tried to pass in Template.new but doesn't work so we set @template = Template.new in templates_controller
  json.form render(partial: 'templates/form', formats: :html, locals: { template: @template })
else
  # form is the existing form with errors
  json.form render(partial: "templates/form", formats: :html, locals: { template: @template })
end
