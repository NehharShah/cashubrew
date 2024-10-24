defmodule Cashubrew.Nuts.Nut06.Info do
  @moduledoc """
  Implementation and structs of the NUT-06
  """
  alias Cashubrew.Nuts.Nut00
  alias Cashubrew.Nuts.Nut01
  alias Cashubrew.Nuts.Nut02
  alias Cashubrew.Nuts.Nut03
  alias Cashubrew.Nuts.Nut04

  @derive [Jason.Encoder]
  defstruct [
    :name,
    :pubkey,
    :version,
    :description,
    :description_long,
    :contact,
    :motd,
    :icon_url,
    :time,
    :nuts
  ]

  defmodule Contact do
    @moduledoc """
    A Contact info
    """
    @enforce_keys [:method, :info]
    @derive [Jason.Encoder]
    defstruct [:method, :info]
  end

  def info do
    info = %__MODULE__{
      name: "Cashubrew Cashu Mint",
      pubkey: Base.encode16(<<00, 01, 02, 03>>, case: :lower),
      version: "Cashubrew/0.1.0",
      description: "An Elixir implementation of Cashu Mint",
      description_long: nil,
      contact: [
        %Contact{
          method: "twitter",
          info: "@dimahledba"
        },
        %Contact{
          method: "nostr",
          info: "npub1hr6v96g0phtxwys4x0tm3khawuuykz6s28uzwtj5j0zc7lunu99snw2e29"
        }
      ],
      time: System.os_time(:second),
      nuts: %{
        "0": Nut00.Info.info(),
        "1": Nut01.Info.info(),
        "2": Nut02.Info.info(),
        "3": Nut03.Info.info(),
        "4": Nut04.Info.info()
      },
      motd: nil
    }

    info
  end
end
