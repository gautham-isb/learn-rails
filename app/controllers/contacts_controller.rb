class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(secure_params)
		if @contact.valid? 
			@contact.update_spreadsheet
			flash[:notice] = "Thank you for your message." 
			redirect_to new_contact_path
		else
			render :new
		end
	end

	private

	def secure_params
		params.require(:contact).permit(:name, :email, :content)
	end

end
