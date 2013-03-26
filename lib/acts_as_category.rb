require "acts_as_category/version"

module ActsAsCategory

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_category
      class_eval <<-EOV
        belongs_to :resource, :polymorphic => true
        scope :used_by, lambda { |resource| where(:resource_type => resource) }
        include InstanceMethods
      EOV
    end
  end

  module InstanceMethods
    def used_by?(resource)
      if resource.is_a?(Class)
        self.class.where(:resource_type => resource).size > 0
      else
        self.class.where(:resource_id => resource, :resource_type => resource.class).size > 0
      end
    end
  end

end

ActiveRecord::Base.send :include, ActsAsCategory