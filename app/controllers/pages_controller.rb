# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @form = FormExample.new
  end

  def form_target
    @form = FormExample.new(random_form_params)
    if @form.valid?
      redirect_to root_path, notice: 'Form valid!'
    else
      redirect_to root_path, notice: 'Form invalid!'
    end
  end

  private

  def random_form_params
    params.require(:random_form).permit(:random_nr, :random_letter)
  end
end
