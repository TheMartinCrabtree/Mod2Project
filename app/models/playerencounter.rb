class Playerencounter < ApplicationRecord
  belongs_to :player
  belongs_to :encounter
end
