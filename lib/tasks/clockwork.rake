task :clockwork => :environment do
  require 'httparty'

  Task.all.each do |task|
    Clockwork.every task.seconds, task.title do
      task.perform!
    end
  end

  Clockwork.run
end