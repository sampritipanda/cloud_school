module ApplicationHelper
  def paper_bg
    (params[:controller] == "sites" && (params[:action] == "join" || params[:action] == "new" || params[:action] == "create")) || (/^(devise)/.match(params[:controller]))
  end
end
