namespace :upload do
 task :upload_employees_data => :environment do
 	
     require 'csv'
     require 'json'
 	
     filename = ENV['FILENAME']
    
     csv_table = CSV.parse(File.read(filename), headers: true)
     json_string = csv_table.map(&:to_h).to_json
     data = JSON.parse(json_string)
     data.each do |d|
          @employee_number = d["employee_number"]
          @last_name = d["last_name"]
          @first_name = d["first_name"]
          @middle_name = d["middle_name"]
          @sex = d["sex"]
          @civil_status = d["civil_status"]
          @email_address = d["email_address"]

          if d["birthday"].present?
               date = Date.strptime(d["birthday"],'%m-%d-%Y')
               dob = date.strftime('%d/%m/%Y')
               @birthday = dob.to_date
          end

          @employee = Employee.new(
               employee_number: @employee_number, 
               last_name: @last_name, 
               first_name: @first_name,
               middle_name: @middle_name,
               sex: @sex,
               civil_status: @civil_status,
               birthday: @birthday,
               email_address: @email_address
               )
          if @birthday.present?
               now = Time.now.utc.to_date
               age = now.year - @birthday.year- ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
               @employee.update(age: age)
          end
          @employee.save!
          
     end
 end
end