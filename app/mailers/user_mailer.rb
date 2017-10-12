class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_conf(user, order)
        @order = order
        @user = user
        mail(to: @user.email, subject: 'Confirmation for order id #{@user.id}')
      end
end
