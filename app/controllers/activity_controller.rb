class ActivityController < ApplicationController
  def create
    post = RecruitPost.find_by(id: params[:post_id])

    # 企業IDが存在しなければ404エラー
    render_404 and return if post.nil?

    entry = Entry.find_by(student_id: @current_user.id, post_id: post.id)
    if entry
      flash[:notice] = "既に登録済みです。"
      redirect_to("/activity/#{entry.id}")
      return
    end

    entry = Entry.new(student_id: @current_user.id, post_id: post.id, status: 1)

    if entry.save
      redirect_to("/activity/#{entry.id}")
    else
      flash[:notice] = "登録することができませんでした。"
      redirect_to("/post/#{post.id}")
    end
  end
end
