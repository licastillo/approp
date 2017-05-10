class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :favorites
  has_many :favorited_properties, through: :favorites

  def is_admin?
    return self.role == 3
  end

  def self.find_or_create_agent(user_hash)
    email = user_hash[:email]
    user = User.find_by(email: email)
    return user if user.present?
    User.create(user_hash)
  end

  def nombre_completo
    return "#{nombre} #{apellido}"
  end
end
