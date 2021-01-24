class CreateListItemsTable < ActiveRecord::Migration
    def change
      create_table :list_items do |t|
        t.string :name
        t.string :desc
      end 
    end
  end