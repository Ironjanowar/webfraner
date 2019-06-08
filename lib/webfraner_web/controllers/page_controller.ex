defmodule WebfranerWeb.PageController do
  use WebfranerWeb, :controller

  require Logger

  def index(conn, _params) do
    case Webfraner.Refraner.get_refranes(count: 1, language: "ES") do
      {:ok, [refran | _]} ->
        render(conn, "index.html", refran: refran)

      _ ->
        Logger.error("Refran not found")
        render(conn, "index.html", refran: %{})
    end
  end
end
