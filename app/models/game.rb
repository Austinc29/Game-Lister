class Game < ActiveRecord::Base
    has_many :title
    belongs_to :user
end