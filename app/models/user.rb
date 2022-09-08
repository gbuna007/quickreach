class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :templates, dependent: :destroy
  has_many :triggers, through: :accounts
  has_many :drafts, through: :triggers
  has_many :notifications, as: :recipient
end
