module ApplicationHelper

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def current_admin
    if session[:admin_id]
      Admin.find(session[:admin_id])
    else
      nil
    end
  end

end
