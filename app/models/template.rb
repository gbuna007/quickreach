class Template < ApplicationRecord
  belongs_to :user
  has_many :triggers
end
