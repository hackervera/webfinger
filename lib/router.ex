defmodule Webfinger.Router do
  defmacro __using__(options) do
    quote do
      scope "/.well-known" do
        get "/host-meta", Webfinger.HostMeta, []
      end
    end
  end
end
