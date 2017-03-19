defmodule Burrito.Web.PageController do
  use Burrito.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
