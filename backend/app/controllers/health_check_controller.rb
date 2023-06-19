module Api
    module V1
      class HealthCheckController < ApplicationController
        def index
          render :text => "I am alive",  :status => 200
        end
      end
    end
  end