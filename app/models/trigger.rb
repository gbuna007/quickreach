class Trigger < ApplicationRecord
  belongs_to :account

  # a trigger only has one contact
  # bc we only create a draft for one recipient
  # the user can add more recipients themselves
  belongs_to :contact
  has_many :keywords
end
