class Admin::DashboardController < ApplicationController
    def index
        @courses = Course.all
    end
end
