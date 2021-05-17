# frozen_string_literal: true

class Example < ApplicationRecord
  include BelongsToNonDb

  belongs_to_non_db :example_type, class: ExampleType
end
