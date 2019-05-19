class ServersController < ApplicationController

  before_action :set_address
  before_action :set_address_server, only: [:show, :destroy]

  # GET /addresses/:address_id/servers
  def index
    json_response(@address.servers)
  end

  # GET /addresses/:address_id/iservers/:id
  def show
    json_response(@server)
  end

  # POST /addresses/:address_id/servers
  def create
    @address.servers.create!(server_params)
    json_response(@address, :created)
  end

  # DELETE /addresses/:address_id/servers/:id
  def destroy
    @server.destroy
    head :no_content
  end

  private

  def server_params
    params.permit(:server_name)
  end

  def set_address
    @address = Address.find(params[:address_id])
  end

  def set_address_server
    @server = @address.servers.find_by!(id: params[:id]) if @address
  end

end
