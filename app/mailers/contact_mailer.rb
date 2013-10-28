class ContactMailer < ActionMailer::Base
  default from: "brad@bradmilne.ca"
  default to: ["barbara@rogers.com", "brad@bradmilne.ca"]

  def notify_sales(name, company, email, phone)
  	@name = name
  	@company = company
  	@email = email
  	@phone = phone
  	mail(subject: "New Contact")
  end
end
