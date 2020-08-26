require "i18n"
require "i18n/backends/yaml"

module Translator
  DEFAULT_LOCALE = "ru"

  def locale
    DEFAULT_LOCALE #TODO Language switching
  end

  def t(str, count : Int32? = nil, *args)
    puts "Translating #{str}"
    if args.empty?
      I18n.translate(str, locale, count)
    else
      sprintf I18n.translate(str, locale, count), *args
    end
  end
end
