class OpportunitiesController < ApplicationController

	def new
		@opportunity 						= current_user.account.opportunities.new
		@opportunity_owner  	  = current_user.account.users.map(&:email)
    @opportunity_type		   	= Opportunity.types
    @opportunity_stage  		= Opportunity.stages
    @opportunity_contact		= current_user.account.contacts.map(&:full_name)
	end

	def create
    @opportunity = current_user.account.opportunities.new(opportunities_params)
    if @opportunity.save
      redirect_to opportunity_path @opportunity, flash[:notice] = 'New Opportunity Created'
    else
      render :new
    end
  end

  def index
    @opportunities = current_user.account.opportunities
  end

  def show
		@opportunity 						= current_user.account.opportunities.find params['id']
		@opportunity_owner  	  = current_user.account.users.map(&:email)
    @opportunity_type		   	= Opportunity.types
    @opportunity_stage  		= Opportunity.stages
    @opportunity_contact		= current_user.account.contacts.map(&:full_name)
	end

	def update
    @opportunity = current_user.account.opportunities.find params[:id]
    if @opportunity.update_attributes(opportunities_params)
      redirect_to opportunity_path @opportunity, flash[:notice] = 'Opportunity Successfully Updated'
    else
      flash[:error] = 'Opportunity could not be updated'
      redirect_to :back
    end
  end


  def destroy
    @opportunity = current_user.account.opportunities.find params[:id]

    if @opportunity.destroy
      flash[:notice] = 'Opportunity Deleted'
      redirect_to :back
    else
      flash[:error] = 'Opportunity could not be deleted'
      redirect_to :back
    end
  end

  def opportunities_params
    params.require(:opportunity).permit! if params[:opportunity]
  end

end
