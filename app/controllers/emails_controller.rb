class EmailsController < ApplicationController
  before_action :store_params_in_session, only: [:create]

  def new
    @email = Email.new
  end

  def create
    @coupon = Coupon.next_available(email: Email.create!(email: email_param))
    clear_stored_params
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message
    redirect_to root_path
  rescue => e
    flash[:error] = "Uh-oh! Something went wrong. Please try again or email us @ <a href=\"mailto:railsconf@handy.com\">railsconf@handy.com</a>"
    redirect_to root_path
  end

  private

  def store_params_in_session
    session[:email_param] = email_param
  end

  def clear_stored_params
    session.delete(:email_param)
  end

  def form_params
    @form_params ||= params.require(:email).permit(:email)
  end

  def email_param
    form_params["email"]
  end
end
