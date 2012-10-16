require 'payr/controllers/payr_helpers'
require 'payr/controllers/payr_filters'
require 'payr/rails/routes'
require 'payr/engine'


module Payr
	autoload :Client, 'payr/client'
	
	# merchant site id
	mattr_accessor :site_id
	@@site_id = nil

	# merchant account secret ID
	mattr_accessor :secret_key
	@@secret_key = nil

	# merchant rang number
	mattr_accessor :rang
	@@rang = nil

	# merchant paybox identifier
	mattr_accessor :paybox_id
	@@paybox_id = nil	

	# currency
	mattr_accessor :currency
	@@currency = :euro

	mattr_accessor :hash
	@@hash = :sha512	

	mattr_accessor :paybox_url
	@@paybox_url = nil

	mattr_accessor :paybox_url_back_one
	@@paybox_url_back_one = nil

	mattr_accessor :paybox_url_back_two 
	@@paybox_url_back_two = nil



	# Need to improve that by working on the rails/routes.rb file and adding a special mapping?
	mattr_accessor :callback_route
	@@callback_route = "#{Rails.root}/bills/paid"
	mattr_accessor :callback_refused_route
	@@callback_refused_route = "#{Rails.root}/bills/refused"
	mattr_accessor :callback_cancelled_route
	@@callback_cancelled_route = "#{Rails.root}/bills/cancelled"

	mattr_accessor :ipn_route
	@@callback_cancelled_route = "#{Rails.root}/bills/ipn"

	mattr_accessor :callback_values
	@@callback_values = { amount:"m", ref:"r", auto:"a", error:"e", signature:"k" }


	mattr_accessor :typepaiement
	@@typepaiement = nil	

	mattr_accessor :typecard
	@@typecard = nil	

	mattr_accessor :hash
	@@hash = :sha512	

	def self.setup
		yield self
	end

	def self.set_callbacks_by_default
		callback_route = bills_paid_url
		callback_refused_route = bills_refused_url
		callback_cancelled_route = bills_cancelled_url
	end

	def self.include_helpers(scope)
		# add methods to action_controller
    ActiveSupport.on_load(:action_controller) do
      include scope::PayrFilters
    end

    # add view helpers
    ActiveSupport.on_load(:action_view) do
      include scope::PayrHelpers
    end
  end
end
