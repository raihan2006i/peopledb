class PagesController < ApplicationController
  def welcome
    @people = Person.page(params[:page] || 1).per(params[:per_page] || 10)
  end
end
