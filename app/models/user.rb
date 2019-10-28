class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :airplanes
  validates :first_name, :last_name, presence: true
  # validates :phone, numericality: { only_integer: true }
  validates_uniqueness_of :email, scope: [:first_name, :last_name]
  # mount_uploader :photo, PhotoUploader
end
