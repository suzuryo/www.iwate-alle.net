module TitledHelpers
  def titled
    title = '岩手県内の各地域のアレルギー患者の親の会「いわてアレルギーの会」'
    if current_page.data.title.blank?
      title
    else
      title = "#{current_page.data.title} #{title}"
    end
    title
  end
end
