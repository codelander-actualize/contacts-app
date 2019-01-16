class Api::ContactsController < ApplicationController

	def one_contact_method
		@contact = Contact.first #single contact hash
		render 'one_contact.json.jbuilder'
	end

	def all_contacts_method
		@contacts = Contact.all #array of contact hashes
		render 'all_contacts.json.jbuilder'
	end

end
