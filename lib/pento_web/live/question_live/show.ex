defmodule PentoWeb.QuestionLive.Show do
  use PentoWeb, :live_view

  alias Pento.Help

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:question, Help.get_question!(id))}
  end

  @impl true
  def handle_event("upvote", %{"id" => id}, socket) do
    question = Help.get_question!(id)
    {:ok, question} = Help.update_question(question, %{upvotes: question.upvotes + 1})

    {:noreply, assign(socket, :question, question)}
  end

  defp page_title(:show), do: "Show Question"
  defp page_title(:edit), do: "Edit Question"
end
