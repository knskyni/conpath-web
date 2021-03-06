class ActivityController < ApplicationController
  def index
    @entries = Entry.where(student_id: @current_user.id)

    # サブヘッダー
    set_sub_header_title("就職活動一覧")
    add_sub_header_path("就職活動", nil)
  end
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
      flash[:notice] = "登録が完了しました。"
      redirect_to("/activity/#{entry.id}")
    else
      flash[:notice] = "登録することができませんでした。"
      redirect_to("/post/#{post.id}")
    end
  end

  def show
    @entry = Entry.find_by(id: params[:id])
    @actions = Action.joins(:entry).where(actions: {entry_id: @entry.id}, entries: {student_id: @entry.student_id}).order(date: :asc).order(id: :asc)
    @new_action = Action.new(date: Time.now.to_date)

    # エントリーIDが存在しなければ404エラー
    render_404 and return if @entry.nil?

    # サブヘッダー
    set_sub_header_title("活動状況: #{@entry.post.company.name}")
    add_sub_header_path("就職活動", "/activity")
    add_sub_header_path("詳細", nil)
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

  def edit_action
    @action = Action.joins(:entry).find_by(entries: {id: params[:entry_id]}, actions: {id: params[:action_id]})

    # URLのIDが存在しなければ404エラー
    render_404 and return if @action.nil?

    # サブヘッダー
    set_sub_header_title("活動報告修正")
    add_sub_header_path("就職活動", "/activity")
    add_sub_header_path("詳細", "/activity/#{@action.entry.id}")
  end

  def update_action
    @action = Action.joins(:entry).find_by(entries: {id: params[:entry_id]}, actions: {id: params[:action_id]})

    # URLのIDが存在しなければ404エラー
    render_404 and return if @action.nil?

    @action.title = params[:title]
    @action.date = params[:date]
    @action.comment = params[:comment]

    if @action.save
      flash[:notice] = "選考活動を更新しました。"
      redirect_to("/activity/#{@action.entry.id}")
    else
      # サブヘッダー
      set_sub_header_title("活動報告修正")
      add_sub_header_path("就職活動", "/activity")
      add_sub_header_path("詳細", "/activity/#{@action.entry.id}")

      render("activity/edit_action")
    end
  end

  def destroy_action
    @action = Action.joins(:entry).find_by(entries: {id: params[:entry_id]}, actions: {id: params[:action_id]})

    # URLのIDが存在しなければ404エラー
    render_404 and return if @action.nil?

    @action.destroy
    redirect_to("/activity/#{@action.entry.id}")
  end

  def new_success
    entry = Entry.find_by(id: params[:entry_id])

    # URLのIDが存在しなければ404エラー
    render_404 and return if entry.nil?

    @action = Action.new(entry_id: entry.id, date: Time.now.to_date)

    # サブヘッダー
    set_sub_header_title("内定報告")
    add_sub_header_path("就職活動", "/activity")
    add_sub_header_path("詳細", "/activity/#{@action.entry.id}")
    add_sub_header_path("内定報告", nil)
  end

  def create_success
    entry = Entry.find_by(id: params[:entry_id])

    # URLのIDが存在しなければ404エラー
    render_404 and return if entry.nil?

    @action = Action.new(
      entry_id: entry.id,
      title: "内定",
      date: params[:date],
      comment: params[:comment]
    )

    if @action.save
      entry.status = 2
      entry.save

      flash[:notice] = "内定処理を行いました。"
      redirect_to("/activity/#{entry.id}")
    else
      # サブヘッダー
      set_sub_header_title("内定報告")
      add_sub_header_path("就職活動", "/activity")
      add_sub_header_path("詳細", "/activity/#{@action.entry.id}")
      add_sub_header_path("内定報告", nil)

      render("activity/new_success")
    end
  end

  def new_retire
    entry = Entry.find_by(id: params[:entry_id])

    # URLのIDが存在しなければ404エラー
    render_404 and return if entry.nil?

    @action = Action.new(entry_id: entry.id, date: Time.now.to_date)

    # サブヘッダー
    set_sub_header_title("辞退報告")
    add_sub_header_path("就職活動", "/activity")
    add_sub_header_path("詳細", "/activity/#{@action.entry.id}")
    add_sub_header_path("辞退報告", nil)
  end

  def create_retire
    entry = Entry.find_by(id: params[:entry_id])

    # URLのIDが存在しなければ404エラー
    render_404 and return if entry.nil?

    @action = Action.new(
      entry_id: entry.id,
      title: "辞退",
      date: params[:date],
      comment: params[:comment]
    )

    if @action.save
      entry.status = 3
      entry.save

      flash[:notice] = "辞退処理を行いました。"
      redirect_to("/activity/#{entry.id}")
    else
      # サブヘッダー
      set_sub_header_title("辞退報告")
      add_sub_header_path("就職活動", "/activity")
      add_sub_header_path("詳細", "/activity/#{@action.entry.id}")
      add_sub_header_path("辞退報告", nil)
      
      render("activity/new_retire")
    end
  end
end
