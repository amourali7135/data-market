class InquiryMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.invite.subject
  #
  def invite
    # @greeting = "Hi"
    @buyer = current_user.buyer
    @inquiries = @buyer.inquiries
    @seller =  if params["search"]
      @filter = params["search"]["types"].reject { |type| type == '' }.concat([params["search"]['age']]).concat([params["search"]['min_age']]).concat([params["search"]["country"]]).concat([params["search"]["sex"]]).concat([params["search"]["occupation"]]).concat([params["search"]["city"]]).concat([params["search"]["income"]]).concat([params["search"]["ethnicity"]]).concat([params["search"]["race"]]).concat([params["search"]["religion"]]).concat([params["search"]["sexuality"]]).concat([params["search"]["politics"]]).concat([params["search"]["relationship_status"]]).concat([params["search"]["children"]]).concat([params["search"]["verified"]]).concat([params["search"]["birth_country"]]).concat([params["search"]["smoker"]]).concat([params["search"]["education_level"]]).flatten.reject(&:blank?)
      # @filter = params["search"]#["search"]
      @sellers = Seller.global_search(@filter)
      @inquiries = current_user.inquiries #is this right to get buyer inquiries?
    else
      @sellers = Seller.all
      @inquiries = current_user.inquiries #is this right to get buyer inquiries?
    end
    
    mail(to: @seller.email, subject: 'You have been invited to sell your data!')
    
  end
end
