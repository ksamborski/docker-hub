begin
  if Rails.env.production? && `whoami`.chomp == 'root'
    print "\n\n\trunning the console as root when RAILS_ENV is 'production' is disabled in ~/.irbrc\n\n"
    exit
  end
rescue
end
