# frozen_string_literal: true

class FormExample
  ATTRIBUTES = %i[random_nr random_letter].freeze

  include ActiveModelForm

  validates :random_nr, presence: true, numericality: true
  validates :random_letter, presence: true, numericality: false
end
