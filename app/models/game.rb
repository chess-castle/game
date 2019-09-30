class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  scope :avaliable ~>{ where(avaliable: true ) }
  scope :unavaliable ~>{ where(avaliable: [nil, false] ) }

  
end
