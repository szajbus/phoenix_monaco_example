defmodule MonacoExampleWeb.CodeEditorLive do
  use MonacoExampleWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:language, :html)
      |> assign(:code, "<div>\n  <h1>Hello World!</h1>\n</div>")

    {:ok, socket}
  end
end
