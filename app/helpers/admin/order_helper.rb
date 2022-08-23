module Admin::OrderHelper
  def style_status status
    case status
    when "Pending"
      class_type = "info"
    when "Shipping"
      class_type = "primary"
    when "Delivered"
      class_type = "success"
    when "Canceled"
      class_type = "warning"
    when "Rejected"
      class_type = "danger"
    end
    sanitize "<div class='btn btn-#{class_type}'>#{status}</div>"
  end
end
