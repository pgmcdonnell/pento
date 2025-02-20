defmodule PentoWeb.QuestionLive.Index do
  use PentoWeb, :live_view

  alias Pento.Help
  alias Pento.Help.Question

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :questions, Help.list_questions())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Question")
    |> assign(:question, Help.get_question!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Question")
    |> assign(:question, %Question{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Questions")
    |> assign(:question, nil)
  end

  @impl true
  def handle_info({PentoWeb.QuestionLive.FormComponent, {:saved, question}}, socket) do
    {:noreply, stream_insert(socket, :questions, question)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    question = Help.get_question!(id)
    {:ok, _} = Help.delete_question(question)

    {:noreply, stream_delete(socket, :questions, question)}
  end
end
