defmodule ExliveryTest.Orders.ReportTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  import Exlivery.Factory

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "123456789,pizza,2,33.00japonesa,2,20.50,107.00\n" <>
          "123456789,pizza,2,33.00japonesa,2,20.50,107.00\n"

      assert response == expected_response
    end
  end
end
