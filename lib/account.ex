defmodule Webfinger.Account do
  import Plug.Conn
  require Logger
  def init(opts) do
    opts
  end
  def call(conn, _params) do
    params = conn.params
    Logger.debug inspect conn
   conn |> send_resp(200, inspect(params)) 
  end
end
