class Account < ApplicationRecord
  belongs_to :user
  has_many :contacts, dependent: :destroy
  has_many :triggers, dependent: :destroy
  has_many :drafts, through: :triggers
  has_many :templates, through: :triggers
end
