defmodule ExliveryTest.Orders.ItemTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Item

  describe "build/4" do
    test "when all parameters are valid, returns the item" do
      response =
        Item.build(
          "Pizza de Peperoni",
          :pizza,
          "33.00",
          2
        )

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response =
        Item.build(
          "Pizza de Peperoni",
          :banana,
          "33.00",
          2
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response =
        Item.build(
          "Pizza de Peperoni",
          :pizza,
          "banana_price",
          2
        )

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response =
        Item.build(
          "Pizza de Peperoni",
          :pizza,
          "33.00",
          0
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
