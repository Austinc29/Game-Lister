class CreateGamesTable < ActiveRecord::Migration
    def change
      create_table :games do |t|
        t.string :title
        t.datetime :release_date
        t.string :description
        t.integer :user_id
      end
    end
  end