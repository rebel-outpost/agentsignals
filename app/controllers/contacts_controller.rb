class ContactsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @contacts = current_user.account.contacts
  end

  def new
    @contact = current_user.account.contacts.new
  end

  def show
    @contact = current_user.account.contacts.find params[:id]
  end

  def create
    @contact = current_user.account.contacts.new(contacts_params)
    if @contact.save
      redirect_to contacts_path, flash: { notice: 'New Contact Created'}
    else
      render :new
    end
  end

  def update
    @contact = current_user.account.contacts.find params[:id]

    if @contact.update_attributes(contacts_params)
      redirect_to contact_path @contact, flash[:notice] = 'Contact Updated'
    else
      render :edit
    end
  end


  def destroy
    @contact = current_user.account.contacts.find params[:id]
    if @contact == @current_user
      flash[:notice] = 'Cannot delete yourself'
      redirect_to :back
    elsif @contact.destroy
      flash[:notice] = 'Contact Deleted'
      redirect_to :back
    else
      flash[:error] = 'Contact could not be deleted'
      redirect_to :back
    end
  end

  def contacts_params
    params.require(:contact).permit! if params[:contact]
  end


end
