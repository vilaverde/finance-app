# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models

  devise :registerable, :database_authenticatable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_one :account

  validates :email, presence: true, uniqueness: true
end
