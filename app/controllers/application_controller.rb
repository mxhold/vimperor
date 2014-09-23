class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :decode_hashid

  def decode_hashid
    params[:id] = Hashids.new(Rails.application.secrets.hashid_salt, 6).decode(params[:id]).first
  end
end
