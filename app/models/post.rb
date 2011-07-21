class Post < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  attr_accessible :column_one, :column_two, :column_three, :column_four, :column_five
end
