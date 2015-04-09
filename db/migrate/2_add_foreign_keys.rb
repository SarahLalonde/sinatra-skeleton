class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :movies do |t|
            t.references :user
        end
        change_table :movies do |t|
        	t.references :review
        end
    end
end