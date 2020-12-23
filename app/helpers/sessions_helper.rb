module SessionsHelper
  def current_user
    if session[:user9527].present?
      @user ||= User.find_by(email: session[:user9527])
      # or= 沒有前面的@user的話就找後面User...，找到後指定給前面的@user，以減少瀏覽器多次撈取使用者資料的次數
      # 但是每一次換頁面，還是會重新撈取一次資料，因為http是沒有狀態的
    else
      nil
    end
  end
end




# turbolinks

# ujs? 非侵入式javascript => 很重要

# 優點：頁面變動時用AJAX方式抓頁面進來，CSS跟JS如果沒有變動的話不會重抓
# 在body以外的css跟js會被catch
# 缺點：如果像是與金流刷卡相關的，因為沒有變動的CSS跟JS被抓住，反而會讓前端的一些JS進不來使得程式不會執行（因為被認為執行過了），因此很多人會選擇把turbolinks關閉