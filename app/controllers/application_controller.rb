class ApplicationController < ActionController::Base
  # coding: utf-8
  before_filter :set_locale
  protect_from_forgery
  
  require 'csv' 
  require 'open-uri'
  
  def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
end

