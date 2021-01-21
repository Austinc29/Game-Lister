class CreateListItemsTable < ActiveRecord::Migration
    def change
      create_table :list_items do |t|
        t.string :title
        t.string :release_date
        t.string :description
      end 
    end
  end