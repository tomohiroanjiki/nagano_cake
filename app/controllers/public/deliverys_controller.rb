class Public::DeliverysController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all

  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to deliverys_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to deliverys_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to deliverys_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :addresses, :name)
  end
end
