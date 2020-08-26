require "i18n"

I18n.default_locale = Translator::DEFAULT_LOCALE

I18n::Backend.quantity_key_procs.merge({"ru" => I18n::Backend::QuantityKeyProc.new do |count|
  case count
  when 0
    "zero" # 0 яблок
  when 1
    "single" # 1 яблоко
  when 2...4
    "plural" # 3 яблока
  when 5...20
    "plural_many" # 13 яблок
  else
    case count % 10
    when 0, 5...9
      "plural_many" # 25 яблок
    when 1
      "single" # 41 яблоко
    else
      "plural" # 24 яблока
    end
  end
end})

I18n.backend = I18n::Backends::YAML.new.tap do |backend|
  backend.load_paths << File.join(Dir.current, "config/locales")
  backend.load
end
