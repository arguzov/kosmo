class SubscribeMailer < ActionMailer::Base
    default from: FROM_EMAIL

    def letter(data)
        @data = MailTemplate::find(data[:template_id])
        @user_name = data[:user_name]
        @user_email = data[:user_email]
        mail(to: @user_email,
             subject: @data.name,
             content_type: "text/html",
             template_path: 'subscriptions/mailer')
    end
end