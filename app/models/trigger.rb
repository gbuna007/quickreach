class Trigger < ApplicationRecord
  belongs_to :account

  # a trigger only has one contact
  # bc we only create a draft for one recipient
  # the user can add more recipients themselves
  belongs_to :contact
  belongs_to :template

  has_many :keywords
  # accepts_nested_attributes_for :keywords
  has_many :drafts
end
