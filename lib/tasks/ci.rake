unless Rails.env.production?
  require 'rspec/core/rake_task'
  require 'cucumber/rake/task'
  # require 'coveralls/rake/task'

  # Coveralls::RakeTask.new

  def database_exists?
    # ActiveRecord::Base.connection
    Rake::Task['db:create'].invoke
  rescue ActiveRecord::NoDatabaseError
    false
  else
    true
  end

  def invoke_tasks(tasks_array)
    tasks_array.each do |task|
      Rake::Task[task].invoke
    end
  end

  namespace :ci do
    desc 'Run all tests'
    task :tests do
      if database_exists?
        invoke_tasks ['spec', 'cucumber']
      else
        invoke_tasks ['db:create', 'spec', 'cucumber']
      end
    end
  end
end
