class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  validates :nickname, uniqueness: true, presence: true
  validates_format_of :nickname, with: /\w/, :multiline => false
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_param
    nickname
  end
end
