class Draft < ApplicationRecord
  belongs_to :trigger
  belongs_to :template
end
