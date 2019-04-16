class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :browsing_histories, dependent: :destroy
  has_many :stocks, dependent: :destroy



  def already_stocked?(entry)
    self.stocks.exists?(entry_id: entry.id)
  end
end
