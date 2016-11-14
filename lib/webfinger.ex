defmodule Webfinger do
  require Logger
  import SweetXml
  @xml "<?xml version='1.0' encoding='UTF-8'?>\n<!-- NOTE: this host-meta end-point is a pre-alpha work in progress.   Don't rely on it. -->\n<!-- Please follow the list at http://groups.google.com/group/webfinger -->\n<XRD xmlns='http://docs.oasis-open.org/ns/xri/xrd-1.0' \n     xmlns:hm='http://host-meta.net/xrd/1.0'>\n  <hm:Host xmlns='http://host-meta.net/xrd/1.0'>gmail.com</hm:Host>\n  <Link rel='lrdd' \n        template='https://profiles.google.com/_/webfinger/?q={uri}'>\n    <Title>Resource Descriptor</Title>\n  </Link>\n</XRD>\n"
  def lookup(email) do
    [user, host] = String.split(email, "@")
    resp = HTTPotion.get(host <> "/.well-known/host-meta", [follow_redirects: true]).body
    # resp = @xml
    Logger.debug inspect resp
    template =
      resp
      |> xpath(~x"//XRD/Link/@template"s)
      |> String.replace("{uri}", email)
    resp = HTTPotion.get(template).body
    Logger.debug(inspect(resp))
  end
end
