class Admin::AdminController < ApplicationController
    before_action :authenticate_teacher!, except: [:index]

    def tesztemail
        Mailer.tesztemail.deliver_later(wait: 5)
        redirect_to admin_path
    end
end
