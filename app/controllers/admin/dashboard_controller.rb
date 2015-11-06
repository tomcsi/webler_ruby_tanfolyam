class Admin::DashboardController < Admin::AdminController
    def index
        @courses = Course.all
    end
end
