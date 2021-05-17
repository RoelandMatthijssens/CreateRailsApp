# frozen_string_literal: true

module IdentifierName
  def name
    key = "#{self.class::I18N_NAME_PREFIX}.#{identifier}"
    I18n.t(key)
  end
end
