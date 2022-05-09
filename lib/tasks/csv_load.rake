namespace :csv_load do
  desc 'All'

  task all: [:create_hikes] do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  desc 'Create Hikes'
  task create_hikes: :environment do
    require 'csv'
    CSV.foreach('db/data/hike.csv', :headers => true) do |row|
      Hike.create!(row.to_hash)
    end
  end
end
