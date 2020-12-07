class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #當目前所在controller只要出現 ActiveRecord::RecordNotFound 的錯誤訊息，就使用後面的方法來解決
  # （大括號與小括號可省略）

  private
  def record_not_found   # rescue_from
    render file: 'public/404.html', 
           layout: false,  # 取消所有layout，套用404.html自己的css
           status: 404     # 另外將網頁狀態改為404
  end
end
