class HardWorker
  include Sidekiq::Worker

  def perform(a)
    # Do something
    puts a
  end
end
