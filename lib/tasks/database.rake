namespace :db do
  task :backup => :environment do
    filename = "#{Time.now.to_i}-backup-#{ENV['RAILS_ENV'] ||= 'development'}.dump"

    ::Utils::BackupDatabase.new(
      config: {
        destination_file: "#{Rails.root}/#{filename}"
      }
    ).execute!
  end

   task :restore => :environment do
    puts "Restoring database..."

    if ::ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == 'postgresql'
      cmd = nil
      with_config do |app, host, db, user, pw|
        cmd = "PGPASSWORD=#{pw} pg_restore --verbose --host #{host} --username #{user} --clean --no-owner --no-acl --dbname #{db} #{ENV['PG_BACKUP_DUMP']}"
      end
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      puts cmd
      exec cmd
    else
      puts "Invalid database adapter"
    end
  end

  def with_config
    yield Rails.application.class.name.partition('::').first,
      ActiveRecord::Base.connection_db_config.configuration_hash[:host],
      ActiveRecord::Base.connection_db_config.configuration_hash[:database],
      ActiveRecord::Base.connection_db_config.configuration_hash[:username],
      ActiveRecord::Base.connection_db_config.configuration_hash[:password]
  end
end