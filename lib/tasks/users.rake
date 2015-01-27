namespace :db do
  desc "Reads users from a go/people and creates them in the database"
  task users: :environment do
    client = GoPeople.new
    client.each do |employee|
      User.find_or_create_by(username: employee.username).update(
        first_name: employee.preferred_first_name,
        last_name: employee.last_name
      )
    end
  end
end