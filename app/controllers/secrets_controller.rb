class SecretsController < ApplicationController
  def index
    @secret = Secret.all
  end
end
