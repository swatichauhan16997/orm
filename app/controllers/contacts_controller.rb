# contact controller
class ContactsController < ApplicationController
	def new
		authorize Contact, :new?
		@contact = Contact.new
	end

  def create
    authorize Contact, :create?
    @contact = current_user.contacts.create(contact_params)
      if @contact.save
        redirect_to root_path
      end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :description)
  end

end
