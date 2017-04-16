module PostsHelper
  def admin_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def mod_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.moderator?)
  end
end
