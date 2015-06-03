# User.create({:email => "lugatex@yahoo.com", :name => "Oleg G.Kapranov", :password => "12345678", :password_confirmation => "12345678", :confirmed_at => Time.now })
User.create({:email => "zhuk_andriy@hotmail.com", :name => "Andrey Zhuk", :password => "qwerty", :password_confirmation => "qwerty", :confirmed_at => Time.now })
User.create({:email => "test@example.com", :name => "Test", :password => "qwerty", :password_confirmation => "qwerty", :confirmed_at => Time.now })
# User.update_all(:confirmed_at => Time.now)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
