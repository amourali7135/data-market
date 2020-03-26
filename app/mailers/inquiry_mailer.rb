class InquiryMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.invite.subject
  #
  def invite(buyer, seller, inquiry)
    @buyer = buyer
    @inquiry = inquiry
    @seller = seller

    mail(to: @seller.user.email, subject: 'You have been invited to sell your data!')
  end
end
