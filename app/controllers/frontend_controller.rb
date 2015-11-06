class FrontendController < ApplicationController
    def index
        @courses = Course.all
        render "mainpage"
    end
end
