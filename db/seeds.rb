
10.times do
	contact = Contact.new(
		first_name: FFaker::Name.first_name, 
		last_name: FFaker::Name.last_name, 
		email: FFaker::Internet.free_email, 
		phone_number: FFaker::PhoneNumber.short_phone_number
	)
	contact.save
end
