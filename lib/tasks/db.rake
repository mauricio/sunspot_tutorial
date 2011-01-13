namespace :db do 
  
  desc 'Truncates the database'
  task :truncate => :environment do
    DatabaseCleaner.strategy = :truncation, {:except => ['schema_migrations']}
    DatabaseCleaner.clean
    [ Product, Category ].each(&:solr_remove_all_from_index!)
  end
  
  task 'Truncates the db then seeds it with data, solr must be running'
  task :prepare do
    Rake::Task["db:truncate"].invoke
    Rake::Task["db:seed"].invoke    
    [ Product, Category ].each(&:solr_reindex)    
  end
  
end