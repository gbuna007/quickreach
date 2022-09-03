class Template < ApplicationRecord
  belongs_to :user
  has_many :triggers

  validates :name, :subject, :body, presence: true
end
