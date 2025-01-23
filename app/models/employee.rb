class Employee < ApplicationRecord


	def full_name
		"#{first_name.upcase} #{last_name.upcase}"
	end

	def age 
    if self.birthday.nil?
      "Please set date of birth"
    else
      begin
        now = Time.now.utc.to_date
        now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
        #now.year - self.date_of_birth.year - (self.date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
      rescue Exception
        "Invalid date of birth: #{self.birthday}"
      end 
    end 
  end
end
