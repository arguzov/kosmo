class OrderMailer < ActionMailer::Base
    default from: 'noreply@kosmetologiya-kazan.ru'

    def recall(data)
        @data = data
        mail(to: MANAGER_EMAIL,
             subject: 'Заказ обратного звонка или услуги',
             template_path: 'orders/mailer')
    end
end