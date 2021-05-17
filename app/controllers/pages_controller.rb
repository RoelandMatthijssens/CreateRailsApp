# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @form = FormExample.new
    @example1 = Example.find_or_create_by(name: 'test example 1', example_type_id: 1)
    @example2 = Example.find_or_create_by(name: 'test example 2', example_type_id: 2)
    @example3 = Example.find_or_create_by(name: 'test example 3', example_type_id: 3)
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
