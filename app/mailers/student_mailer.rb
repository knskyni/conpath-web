class StudentMailer < ApplicationMailer
  def verify(student_temp)
    @student_temp = student_temp
    mail(from: 'info@conpath.jp', to: "#{@student_temp.student_id}@s.asojuku.ac.jp", subject: '[conpath] 仮登録のお知らせ')
  end
end
