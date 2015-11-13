class BackendJob < ActiveJob::Base
  queue_as :default

  def perform(default)
    # Do something later
  end
end
