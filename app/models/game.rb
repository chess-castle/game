class Game < ApplicationRecord
  has_many :pieces
  has_many :users
<<<<<<< HEAD
  scope :avaliable ~>{ where(avaliable: true ) }
  scope :unavaliable ~>{ where(avaliable: [nil, false] ) }
=======
>>>>>>> dbb74f7019366c19d09fea47f120d2141792b2aa
end
