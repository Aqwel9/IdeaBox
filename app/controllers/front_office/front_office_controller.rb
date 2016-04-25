module FrontOffice
  class FrontOfficeController < ::ApplicationController
    layout 'application_front_office'
    before_action :authenticate_user!

    def set_locale
      locale = params[:lang].present? ? params[:lang] : extract_locale_from_accept_language_header
      locale = current_user.present? && current_user.language.present? ? current_user.language : locale

      I18n.locale = I18n.available_locales.include?(locale.to_sym) ? locale : :en
    end

    private

    def extract_locale_from_accept_language_header
      return 'en' unless request.env['HTTP_ACCEPT_LANGUAGE']
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    def default_url_options(options = {})
      { lang: I18n.locale }.merge options
    end

  end
end
