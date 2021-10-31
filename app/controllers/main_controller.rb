class MainController < ApplicationController
  def index
    @sample_variable = {
      :user_name => "Vignesh",
      :age => 20,
    }
  end
end
