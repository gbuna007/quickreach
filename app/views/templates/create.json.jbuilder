if @template.persisted?
  json.inserted_item render(partial: "templates/template", formats: :html, locals: { template: @template })
  json.form render(partial: 'templates/form', formats: :html, locals: { template: @template })
else
  json.form render(partial: "templates/form", formats: :html, locals: { template: @template })
end
