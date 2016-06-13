class User < ActiveRecord::Base
  belongs_to :role

  validates :role, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :name, length: { minimum: 2, maximum: 64, if: 'name.present?' }, format: { with: /\A[^<>]*\z/ }, uniqueness: true, presence: true
end
