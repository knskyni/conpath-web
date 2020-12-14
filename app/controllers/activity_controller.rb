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

  def show
    @entry = Entry.find_by(id: params[:id])
    @actions = Action.joins(:entry).where(entries: {student_id: @current_user.id}).order(date: :asc).order(id: :asc)
    @new_action = Action.new(date: Time.now.to_date)

    # エントリーIDが存在しなければ404エラー
    render_404 and return if @entry.nil?

    # サブヘッダー
    set_sub_header_title("活動状況: #{@entry.post.company.name}")
    add_sub_header_path("就職活動", nil)
    add_sub_header_path("状況", nil)
  end

  def create_action
    @action = Action.new(
      entry_id: params[:id],
      title: params[:title],
      date: params[:date],
      comment: params[:comment]
    )

    if @action.save
      flash[:notice] = "選考を新規登録しました。"
      redirect_to("/activity/#{@action.entry_id}")
    else
      flash[:notice] = "登録することができませんでした。"
      redirect_to("/activity/#{@action.entry_id}")
    end
  end
end
