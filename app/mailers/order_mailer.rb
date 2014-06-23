class OrderMailer < ActionMailer::Base
    default from: 'noreply@kosmetologiya-kazan.ru'

    def recall(data)
        @data = data
        mail(to: 'epi-center-kazan@ya.ru',
             subject: 'Заказ обратного звонка или услуги',
             template_path: 'orders/mailer')
    end
end