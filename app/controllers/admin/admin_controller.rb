class Admin::AdminController < ApplicationController
    before_action :authenticate_teacher!, except: [:index]

end
