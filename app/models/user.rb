class User < ApplicationRecord
  validates_presence_of :name, :email, :password

  def self.authenticate(email, password)
    find_by(email: email, password: password) ? true : false 
  end
end
