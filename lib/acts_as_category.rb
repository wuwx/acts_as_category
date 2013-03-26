require "acts_as_category/version"

module ActsAsCategory

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_category
      class_eval <<-EOV
      
        belongs_to :resource, :polymorphic => true
        
        def self.used_by(*resources)
          context = resource_id = resource_type = nil
          resources.each do |resource|
            if resource.kind_of?(ActiveRecord::Base)
              resource_id   ||= resource.id
              resource_type ||= resource.class
            else
              context ||= resource
            end
          end
          where(:context => context, :resource_id => resource_id, :resource_type => resource_type)
        end
        
        include InstanceMethods
        
      EOV
    end
  end

  module InstanceMethods
    
    def used_by?(*resources)
      context = resource_id = resource_type = nil
      resources.each do |resource|
        if resource.kind_of?(ActiveRecord::Base)
          resource_id   ||= resource.id
          resource_type ||= resource.class
        else
          context ||= resource
        end
      end
      self.class.where(:context => context, :resource_id => resource_id, :resource_type => resource_type).size > 0
    end
    
  end

end

ActiveRecord::Base.send :include, ActsAsCategory