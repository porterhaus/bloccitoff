module AjaxFlash
  extend ActiveSupport::Concern

  included do
    after_filter :add_flash_to_header
  end

  private
  def add_flash_to_header
    # only run this in case it's an Ajax request.
    return unless request.xhr?
    # add flash to header
    response.headers['X-Flash'] = flash.to_h.to_json
    # make sure flash does not appear on the next page
    flash.discard
  end

end