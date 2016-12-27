class OrderMailer < ActionMailer::Base
    default from: FROM_EMAIL

    def recall(data)
        @data = data
        mail(to: MANAGER_EMAIL,
             subject: 'Заказ обратного звонка или услуги',
             template_path: 'orders/mailer')
    end

    def shop(data)
        @data = data
        mail(to: MANAGER_EMAIL,
             subject: 'Заказ из интернет-магазина',
             template_path: 'orders/mailer')
    end

    def certificate(data)
        @data = data
        mail(to: MANAGER_EMAIL,
             subject: 'Заказ сертификата наличными курьеру',
             template_path: 'orders/mailer')
    end
end