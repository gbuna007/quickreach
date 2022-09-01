class AddTemplateToTriggers < ActiveRecord::Migration[7.0]
  def change
    add_reference :triggers, :template, foreign_key: true
  end
end
