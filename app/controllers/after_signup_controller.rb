class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :choose_account_type

  def show
    @user = current_user
    case step 
    when :choose_account_type

    end
    render_wizard
  end

  def update
    @user = current_user
    case step 
    when :choose_account_type

    end
    render_wizard
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
