class Api::ContactsController < ApplicationController

  # before_action :authenticate_user #checking to see if a user is logged in before doing any of the actions in this controller

	def index
    # @contacts = Contact.all

    # search_term = params[:search]
    # if search_term
    #   @contacts = @contacts.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR middle_name ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    # end

    @contacts = current_user.contacts

    if params[:group]
      group = Group.find_by(name: params[:group])
      @contacts = group.contacts #how do we get current users contacts in a specific group?
    end

    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
    	first_name: params[:first_name],
    	last_name: params[:last_name],
    	email: params[:email],
    	phone_number: params[:phone_number],
      bio: params[:bio],
      user_id: current_user.id
    )

    if params[:middle_name]
      @contact.middle_name = params[:middle_name]
    end

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed!!"}
  end

end
