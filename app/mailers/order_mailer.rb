class OrderMailer < ActionMailer::Base
    default from: 'axxilius@gmail.com'

    def recall(data)
        @data = data
        mail(to: MANAGER_EMAIL,
             subject: 'Заказ обратного звонка или услуги',
             template_path: 'orders/mailer')
    end
end