class Music < ActiveRecord::Base
  attr_accessible :first, :last, :piano, :solo, :title, :vocal
  validates_presence_of :title,:vocal
end
