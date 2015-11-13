class BackendJob < ActiveJob::Base
  queue_as :default

  def perform
    # Do something later
    Course.all.each do |course|
        course.datum += 7.days
        course.save
    end
  end
end
