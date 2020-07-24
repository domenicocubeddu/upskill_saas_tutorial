class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default devise gem behavioyr so that
  # users signing up with the Pro account (plan ID 2)
  # save with a specialist Stripe subscription function.
  # Otherwise Devise signs up user as usual.
  def creat
    super do |resource|
      if params[:plan] 
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else 
          resource.save
        end
      end
    end
  end
end    