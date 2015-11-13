class Admin::AdminController < ApplicationController
    before_action :authenticate_teacher!, except: [:index]

    def tesztemail
        Mailer.tesztemail.deliver_later(wait: 10)
        redirect_to admin_path
    end

    def incrementdate
        BackendJob.set(wait: 30).perform_later
    end

    def pdf
        pdf = Prawn::Document.new
        pdf.stroke_axis
        Course.all.each do |c|
        pdf.text c.name
        pdf.move_down 10
        end
        headers["Content-Type"] = "application/pdf"
        send_data pdf.render
    end
end
