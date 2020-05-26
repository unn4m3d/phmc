module UserFromEmail
  private def user_from_email : User?
    puts "Email : #{email.value}"
    email.value.try do |value|
      if value.includes? "@"
        UserQuery.new.email(value).first?
      else
        UserQuery.new.username(value).first?
      end
    end

  end


end
