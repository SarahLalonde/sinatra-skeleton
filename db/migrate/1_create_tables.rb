class CreateTables < ActiveRecord::Migration

    def change
        create_table :users do |t|
            t.string :username
            t.string :email
            t.string :password
            t.timestamps
        end

        create_table :movies do |t|
            # Your code goes here
            t.string :title
            t.string :director
            t.datetime :release_date
            t.string :genre
            t.integer :run_time
            t.timestamps
        end

        create_table :reviews do |t|
            t.string :title
            t.string :review
            t.integer :user_rating
            t.timestamps
        end

    end

end