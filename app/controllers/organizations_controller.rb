class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create(organization_params)
    if @organization.save
      @organization.users << current_user
      flash[:notice] = 'Organization successfully created'
      redirect_to :dashboard
    else
      flash[:error] = 'Unable to create organization'
      redirect_to :back
    end
  end

  def organization_params
    params.require(:organization).permit! if params[:organization]
  end

end
