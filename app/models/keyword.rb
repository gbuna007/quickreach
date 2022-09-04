class Keyword < ApplicationRecord
  belongs_to :trigger

  validates :name, presence: true
end
