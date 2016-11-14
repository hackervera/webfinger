defmodule Webfinger.Router do
  defmacro __using__(options) do
    quote do
      Application.start(:ibrowse)
      get "/webfinger", Webfinger.PlugRouter, []
      get "/.well-known/host-meta", Webfinger.PlugRouter, []
    end
  end
end
