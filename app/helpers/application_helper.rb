# frozen_string_literal: true

module ApplicationHelper
  def flash_key_mapping(key)
    {
      notice: 'success',
      alert: 'danger',
      warning: 'warning'
    }[key.to_sym]
  end
end
