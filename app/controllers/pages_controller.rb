class PagesController < ApplicationController
  def home
    @shelters = Shelter.all

  end
end
