defmodule Webfinger.PlugRouter do
  use Plug.Router
  require Logger

  plug :match
  plug :dispatch

  get "/ping" do
    send_resp(conn, 200, "PONG")
  end

  get "/webfinger" do
    params = conn.params
    conn |> send_resp(200, inspect(params)) 
  end

  get "/.well-known/host-meta" do
    xml =
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <XRD xmlns="http://docs.oasis-open.org/ns/xri/xrd-1.0">
      <Link rel="lrdd" type="application/xrd+xml" template="#{conn.scheme}://#{conn.host}:#{conn.port}/webfinger?q={uri}"/>
      </XRD>
      """
    conn |> send_resp(200, xml)
  end
end
