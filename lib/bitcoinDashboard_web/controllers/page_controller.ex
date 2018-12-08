defmodule BitcoinDashboardWeb.PageController do
  use BitcoinDashboardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
