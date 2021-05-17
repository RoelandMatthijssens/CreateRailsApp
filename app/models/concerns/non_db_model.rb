# frozen_string_literal: true

module NonDbModel
  # Model without corresponding database table
  # classes including this module need two constant arrays before including the module:
  # * ATTRIBUTES --> the model's attributes, e.g. [ :id, :name, :number ]. :id must be present.
  # * OBJECTS -> the collection of objects as array of hashes, e.g.:
  #   OBJECTS = [
  #     { :id => 1, :name => 'aaa', :number => 10 },
  #     { :id => 2, :name => 'bbb', :number => 11 }
  #   ]

  def self.included(base)
    base.extend(ClassMethods)
    base.class_eval do
      attr_accessor(*base::ATTRIBUTES)
    end
  end

  def initialize(attributes = {})
    all_attributes.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end

  module ClassMethods
    def all
      self::OBJECTS.map do |params|
        new(params)
      end
    end

    def active
      all.select(&:active)
    end

    def options
      base = if self::ATTRIBUTES.include?(:active)
               active
             else
               all
             end
      base.map { |object| [object.name, object.id] }
    end

    def find_by_id(id)
      id_ = id.to_i
      self::OBJECTS.each do |params|
        return new(params) if params[:id] == id_
      end
      nil
    end

    def find(id)
      result = find_by_id(id)
      raise ActiveRecord::RecordNotFound if result.nil?

      result
    end

    def count
      self::OBJECTS.length
    end

    def first
      new(self::OBJECTS.first)
    end

    def last
      new(self::OBJECTS.last)
    end
  end

  private

  def all_attributes
    self.class::ATTRIBUTES
  end
end
