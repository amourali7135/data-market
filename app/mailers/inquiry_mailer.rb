class InquiryMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.invite.subject
  #
  def invite(seller)
    # @greeting = "Hi"
    @buyer = current_user.buyer
    @inquiries = @buyer.inquiries
    @seller =  seller

    
    mail(to: @seller.email, subject: 'You have been invited to sell your data!')
    
  end
end
