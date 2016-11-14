defmodule Webfinger.Router do
  defmacro __using__(options) do
    quote do
      get "/webfinger", Webfinger.Account, []
      scope "/.well-known" do
        get "/host-meta", Webfinger.HostMeta, []
      end
    end
  end
end
