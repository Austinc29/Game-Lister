class Game < ActiveRecord::Base
    attr_accessor :title, :release_date, :description, :user_id
    belongs_to :user
end