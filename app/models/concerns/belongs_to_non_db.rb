# frozen_string_literal: true

module BelongsToNonDb
  extend ActiveSupport::Concern

  class_methods do
    def belongs_to_non_db(name, options = {})
      id_property = "#{name}_id"
      class_name  = name.to_s.classify
      class_name =  options[:class].to_s.classify if options[:class]
      # define new methods, similar to what belongs_to would do
      class_eval <<-EOS, __FILE__, __LINE__ + 1
        def #{name}
          id_ = send('#{id_property}')
          #{class_name}.find_by_id( id_ )
        end

        def #{name}=( object_ )
          self.#{id_property} = object_.id
        end
      EOS
    end
  end
end
