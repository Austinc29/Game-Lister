class Game < ActiveRecord::Base
    attr_accessor :title, :release_date, :description
    belongs_to :user
end