class AddressesController < ApplicationController
  
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    @addresses = Address.all
    json_response(@addresses)
  end

  # POST /addresses
  def create
    @address = Address.create!(address_params)
    json_response(@address, :created)
  end

  # GET /addresses/:id
  def show
    json_response(@address)
  end

  # PUT /addresses/:id
  def update
    @address.update(address_params)
    head :no_content
  end

  # DELETE /addresses/:id
  def destroy
    @address.destroy
    head :no_content
  end

  private

  def address_params
    # whitelist params
    params.permit(:ip_address)
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
