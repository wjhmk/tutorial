module SessionsHelper

  #sessions_controller.rbのif文でtrueだったら、user.idをsessionに代入して一時的に情報を保持
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    # @current_user = @current_user || User.find_by(id: session[:user_id])　<=ほんとはこれ
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #before_action :correct_userでcurrent_user?メソッド使用
  def current_user?(user)
    user == current_user
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
   #フレンドリーフォワーディングのために、記憶したURL (もしくはデフォルト値) にリダイレクト＊デフォルト値はそのユーザーのページ
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # ユーザーがアクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url]  = request.original_url if request.get?
  end

end


