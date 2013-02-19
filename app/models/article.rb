class Article < ActiveRecord::Base
  attr_accessible :content, :description, :keywords, :permalink, :title, :topic

  validates_presence_of :content, :description, :keywords, :permalink, :title, :topic 

  validates_uniqueness_of :permalink

  def to_param
    permalink
  end
end

