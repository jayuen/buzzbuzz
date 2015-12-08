class BuzzSession < ActiveRecord::Base
  has_many :buzzes, class_name: 'Buzz'
end
