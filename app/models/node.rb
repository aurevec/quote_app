class Node < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :description
end
