class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :delete_all

  has_one :UserLookingForTeam, dependent: :destroy

  validates :battlenetid, presence: true
  validates :battlenetid, uniqueness: true, if: -> {self.battlenetid.present? }

end
