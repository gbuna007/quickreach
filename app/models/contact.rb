class Contact < ApplicationRecord
  belongs_to :account
  has_many :triggers, dependent: :destroy
end
