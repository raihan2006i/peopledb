class PagesController < ApplicationController
  def welcome
    scope = params[:query].present? ? Person.query(params[:query]) : Person
    @people = scope.page(params[:page] || 1).per(params[:per_page] || 5)
  end
end
