class Account < ApplicationRecord
  belongs_to :user
  has_many :triggers, through: :contacts
end
