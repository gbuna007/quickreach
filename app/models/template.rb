class Template < ApplicationRecord
  belongs_to :user
  has_many :triggers, dependent: :destroy

  validates :name, :subject, :body, presence: true
end
