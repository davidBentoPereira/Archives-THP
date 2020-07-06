module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  # User can modify only if he owns the gossip
  def has_rights_user(gossip)
    puts current_user.id
    puts gossip.id

    if current_user.id != gossip.user.id
      redirect_to root_path
    end
  end
end
