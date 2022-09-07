class Trigger < ApplicationRecord
  # a trigger only has one contact
  # bc we only create a draft for one recipient
  # the user can add more recipients themselves
  belongs_to :contact
  belongs_to :account
  belongs_to :template

  delegate :user, to: :accounts
  has_many :drafts, dependent: :destroy

  has_many :keywords, dependent: :destroy
  accepts_nested_attributes_for :keywords, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
