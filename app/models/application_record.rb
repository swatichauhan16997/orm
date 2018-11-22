# this is abstract class for supporting functionalities
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
