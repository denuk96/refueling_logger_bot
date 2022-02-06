# -*- coding: utf-8 -*-

require 'erb'

class StatsCalculator
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    refuelings = user.refuelings.order(odometer: :asc)
    calculated_refuelings = calculate_data_for(refuelings)
    to_html(calculated_refuelings)
  end

  private
  def calculate_data_for(refuelings)
    prev_ref = nil
    refuelings.each do |ref|
      if prev_ref.blank?
        prev_ref = ref
        next
      end

      distance = ref.odometer - prev_ref.odometer
      consumption = ref.amount.to_f / distance * 100.0

      ref.consumption = consumption
      ref.distance = distance
      prev_ref = ref
    end
    refuelings
  end

  def to_html(refuelings)
    template = ERB.new <<-ERB
      <b> Stats </b>
      <% if refuelings.present? %>
        <% refuelings.each do |refueling| %>
          --------------------
          <b>Date</b>: <%= refueling.created_at.strftime("%d.%m.%y") %>
          <b>Odometer</b>: <%= refueling.odometer %> KM
          <b>Distance</b>: <%= refueling.distance || 'no data' %> KM
          <b>Consumption</b>: <%= refueling.consumption&.round(2) || 'no data' %> L
        <% end %>
      <% else %>
        No refuelings have been logged =(
      <% end %>
    ERB

    template.result(bindings_for_template(refuelings))
  end

  def bindings_for_template(refuelings)
    refuelings = refuelings.to_a
    binding
  end
end
