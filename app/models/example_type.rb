# frozen_string_literal: true

class ExampleType
  ATTRIBUTES = %i[id type_name].freeze

  OBJECTS = [
    { id: 1, type_name: 'type_1' },
    { id: 2, type_name: 'type_2' },
    { id: 3, type_name: 'type_3' }
  ].freeze

  include NonDbModel

  def name
    type_name.split('_').join(' ').capitalize
  end
end
