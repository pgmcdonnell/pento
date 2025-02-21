defmodule PentoWeb.SurveyLive do
  use PentoWeb, :live_view
  alias PentoWeb.SurveyLive.Component
  alias Pento.Survey
  alias PentoWeb.DemographicLive

  @impl true
  def mount(_params, _session, socket) do
    socket = socket |> assign_demographic()
    {:ok, socket}
  end

  defp assign_demographic(%{assigns: %{current_user: user}} = socket) do
    assign(socket, :demographic, Survey.get_demographic_by_user(user))
  end
end
