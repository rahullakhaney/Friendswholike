class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :links, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def confirmation_required?
  	false
  end

  def name; "#{first_name} #{last_name}"; end
  def short_name; "#{first_name} #{last_name.first}."; end
end
