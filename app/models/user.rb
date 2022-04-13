class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships
  def full_name
   return "#{first_name} #{last_name}" if first_name || last_name
   "Anonymus"
  end
  def self.search(param)
    param.strip!
    match_results = (first_name_matches(param)+last_name_matches(param)+email_matches(param)).uniq
    return nil  if match_results.empty?

    match_results
  end
  def self.first_name_matches(param)
    matches('first_name',param)
  end
  def self.last_name_matches(param)
    matches('last_name',param)
  end
  def self.email_matches(param)
    matches('email',param)
  end
  def self.matches(field_name,param)
    where("#{field_name} like ?","%#{param}%")
  end
  def not_friends_with?(id_of_friend)
   !self.friends.where(id: id_of_friend).exists?
  end
end
