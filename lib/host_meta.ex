defmodule Webfinger.HostMeta do
  import Plug.Conn
  require Logger

  def init(opts) do
    opts
  end

  def call(conn, _params) do
    Logger.debug inspect conn
    xml =
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <XRD xmlns="http://docs.oasis-open.org/ns/xri/xrd-1.0">
        <Link rel="lrdd" type="application/xrd+xml" template="#{conn.scheme}//#{conn.host}:#{conn.port}/webfinger?q={uri}"/>
      </XRD>
      """
    conn |> send_resp(200, xml)
  end
end
