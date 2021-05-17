# frozen_string_literal: true

module ActiveModelForm
  def self.included(base)
    base.class_eval do
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming

      attr_accessor(*base::ATTRIBUTES)
    end
  end

  def initialize(attributes = {})
    all_attributes.each do |attribute|
      send("#{attribute}=", attributes[attribute] || attributes[attribute.to_s])
    end
  end

  def persisted?
    false
  end

  def save
    valid? ? self : false
  end

  private

  def all_attributes
    self.class::ATTRIBUTES
  end

  # redefine two methods from FormPath
  def singular_path_method_name
    self.class.name.underscore[0..-6]  # take away the '_form'
  end

  def plural_path_method_name
    singular_path_method_name.pluralize
  end
end
