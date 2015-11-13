class Mailer < ApplicationMailer
    default from: 'noreply@tomcsi.hu',
            reply_to: 'noreply@tomcsi.hu'
    def tesztemail
        attachments.inline['funny.jpg'] = File.read(Rails.root.to_s + '/public/funny.jpg')
        mail(to: 'tomcsi@tomcsi.hu', subject: 'Teszt email', template_name: 'test')
    end
end
