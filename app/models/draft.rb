class Draft < ApplicationRecord
  belongs_to :trigger
  has_one :news
end
