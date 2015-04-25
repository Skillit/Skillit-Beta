class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  def new
    @user = User.new
    
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @skill = Skill.all

    #@talents = Talent.where("user_id = ?", current_user.id)

    @talents = Skill.joins('LEFT OUTER JOIN talents ON talents.skill_id = skills.id').where("user_id = ?", current_user.id)

    #@talents = Skill.joins (:talents)

  end

  # PUT /resource
  def update
    
    if @user.update(configure_account_update_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
   private
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) << :attribute
     params.require(:user).permit(:first_name, :last_name, :about, :email, :password, :password_confirmation) 
   end



  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
end
