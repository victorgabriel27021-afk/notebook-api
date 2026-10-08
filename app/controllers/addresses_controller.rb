class AddressesController < ApplicationController
	before_action :set_contact

	def update
		if @contact.address.update(address_params)
			render json: @contact.address
		else
			render json: @contact.errors, status: :unprocessable_content
		end
	end

	def show
	  render json : @contact.address
	end

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      if params[:contact_id]
        @contact = Contact.find(params[:contact_id])
    end

    def address_params
    	 ActiveModelSerializers::Deserializations.jsonapi_parse(params)
    end
end