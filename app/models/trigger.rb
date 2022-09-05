class Trigger < ApplicationRecord
  belongs_to :account

  # a trigger only has one contact
  # bc we only create a draft for one recipient
  # the user can add more recipients themselves
  belongs_to :contact
  belongs_to :template

  delegate :user, to: :accounts

  has_many :keywords
  accepts_nested_attributes_for :keywords, reject_if: :all_blank, allow_destroy: true

  has_many :drafts

  validates :name, presence: true
end
