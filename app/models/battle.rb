class Battle < ActiveRecord::Base
  has_many :tweets, dependent: :destroy

  #search for a specific hashtag
  def self.search(search)
    if search
      where('brand1 LIKE ? or brand2 LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
