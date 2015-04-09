class Movie < ActiveRecord::Base
belongs_to :users
has_many :reviews
end