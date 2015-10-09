class FrontendController < ApplicationController
    def index
        @courses = Course.all
    end
end
