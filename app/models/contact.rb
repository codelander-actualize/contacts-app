class Contact < ApplicationRecord

	has_many :contact_groups
	has_many :groups, through: :contact_groups
	belongs_to :user

	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def friendly_updated_at
		updated_at.strftime("%B %e, %Y")
	end

	def full_name
		"#{first_name} #{middle_name} #{last_name}"
	end

	def japan_phone_number
		"+81 #{phone_number}"
	end

	def group_names
		groups.map { |group| group.name }
	end

end
