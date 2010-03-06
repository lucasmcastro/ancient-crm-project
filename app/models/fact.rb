class Fact < ActiveRecord::Base
  belongs_to :informable, :polymorphic => true
  belongs_to :information_category

end
