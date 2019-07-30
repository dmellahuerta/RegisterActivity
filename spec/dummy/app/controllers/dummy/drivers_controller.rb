# frozen_string_literal: true

module Dummy
  class DriversController < ApplicationController
    before_action :set_driver

    # PUT dummy/drivers/:id
    def update
      if @driver.update_attributes(driver_params)
        render json: @driver
      else
        render json: @driver.errors, status: :bad_request
      end
    end

    private

    def set_driver
      @driver = Driver.find(params[:id])
    end

    def driver_params
      params.require(:driver).permit(:name)
    end
  end
end
