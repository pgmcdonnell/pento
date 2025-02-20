defmodule PentoWeb.PromoLive do
  use PentoWeb, :live_view

  alias Pento.Promo
  alias Pento.Promo.Recipient

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign_recipient()
      |> clear_form()

    {:ok, socket}
  end

  def assign_recipient(socket), do: assign(socket, :recipient, %Recipient{})

  def clear_form(socket) do
    changeset =
      socket.assigns.recipient
      |> Promo.change_recipient()

    socket |> assign_form(changeset)
  end

  def assign_form(socket, changeset) do
    assign(socket, :form, to_form(changeset))
  end

  def handle_event(
        "validate",
        %{"recipient" => recipient_params},
        %{assigns: %{recipient: recipient}} = socket
      ) do
    changeset =
      recipient
      |> Promo.change_recipient(recipient_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end
end
