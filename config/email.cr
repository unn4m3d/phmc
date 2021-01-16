Carbon::SmtpAdapter.configure do |s|
  s.host = "smtp.yandex.ru"
  s.port = 25
  s.use_tls = true
  s.username = "noreply@unn4m3d.tech"
  s.password = ENV["SMTP_PASSWORD"]
end

BaseEmail.configure do |settings|
  if Lucky::Env.production?
    
    settings.adapter = Carbon::SmtpAdapter.new
  else
    settings.adapter = Carbon::DevAdapter.new
  end
end

