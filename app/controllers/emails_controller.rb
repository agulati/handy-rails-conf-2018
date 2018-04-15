class EmailsController < ApplicationController

  def new
    @email = Email.new
  end

  def create
    Email.create!(params.require(:email).permit(:email))
  end
end
