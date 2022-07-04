defmodule ExliveryTest.Orders.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Item, Order}

  describe "save/1" do
    test "saves the user" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the oder is found, returns the oder" do
      {:ok, uuid} =
        :order
        |> build()
        |> OrderAgent.save()

      response = OrderAgent.get(uuid)

      assert response ==
               {:ok,
                %Order{
                  delivery_address: "Rua das Bananeiras, 25",
                  items: [
                    %Item{
                      category: :pizza,
                      description: "Pizza de Peperoni",
                      quantity: 2,
                      unity_price: Decimal.new("33.00")
                    },
                    %Item{
                      category: :japonesa,
                      description: "Temaki de atum",
                      quantity: 2,
                      unity_price: Decimal.new("20.50")
                    }
                  ],
                  total_price: Decimal.new("107.00"),
                  user_cpf: "123456789"
                }}
    end

    test "when the oder is not found, returns an error" do
      response = OrderAgent.get("0000000000")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
