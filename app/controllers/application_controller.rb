require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_filter :flash_to_headers

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def after_sign_in_path_for(resource)
    list_path(1)
  end

  private
 
  def flash_to_headers
    return unless request.xhr?
    msg = flash_message
    #replace german umlaute encoded in utf-8 to html escaped ones
    msg = msg.gsub("ä","&auml;").gsub("ü","&uuml;").gsub("ö","&ouml;").gsub("Ä","&Auml;").gsub("Ü","&Uuml;").gsub("Ö","&Ouml;").gsub("ß","&szlig;")
    response.headers['X-Message'] = msg
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end

  def flash_message
    [:error, :warning, :notice].each do |type|
      return flash[type] unless flash[type].blank?
    end
    # if we don't return something here, the above code will return "error, warning, notice"
    return ''
  end

  def flash_type
    #:keep will instruct the js to not update or remove the shown message.
    #just write flash[:keep] = true (or any other value) in your controller code
    [:error, :warning, :notice, :keep].each do |type|
      return type unless flash[type].blank?
    end
    #don't return the array from above which would happen if we don't have an explicit return statement
    #returning :empty will also allow you to easily know that no flash message was transmitted
    return :empty
  end
  
end
