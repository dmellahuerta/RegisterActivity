# frozen_string_literal: true

RSpec.shared_examples 'drivers data example' do
  let(:drivers) do
    1.upto(5).each_with_object([]) do |i, arr|
      arr << { id: i, name: SecureRandom.uuid }
    end
  end

  let(:driver) do
    drivers.first
  end

  let(:driver_body_response) do
    {
      id: 1,
      name: 'ignotum'
    }
  end

  before do
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/drivers/1.json', { 'Accept' => 'application/json' }, driver.to_json
    end
    driver_request = ActiveResource::Request.new(
      :patch, '/drivers/1.json', {},
      'Content-Type' => 'application/json'
    )
    driver_response = ActiveResource::Response.new(
      driver_body_response.to_json, 200, {}
    )

    ActiveResource::HttpMock.respond_to(
      { driver_request => driver_response }, false
    )
  end
end
