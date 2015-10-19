class Pledge < ActiveRecord::Base
	extend FriendlyId
	friendly_id :uuid
	
	belongs_to :user
	belongs_to :reward

	before_validation :generate_uuid!, :on => :create
	validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id
	after_create :check_if_funded

	def project
		reward.project
	end

	def charge!
		return false if self.charged? || !self.project.funded?
		id = user.customer_id
		if id.present? && @customer = Braintree::Customer.find(id)
			result = Braintree::Transaction.sale(
				:customer_id => @customer.id,
				:amount => self.amount
			)
			if result.success?
				self.charged!
			else	
				self.void!
			end
		end
	end


	def charged?
		status == "charged"
	end

	def failed?
		status == "failed"
	end

	def pending?
		status == "pending"
	end

	def charged!
		update(status: "charged")
	end

	def void!
		update(status: "void")
	end



	private

	def generate_uuid!
		begin
			self.uuid = SecureRandom.hex(16)
		end while Pledge.find_by(:uuid => self.uuid).present?
	end

	def check_if_funded
		project.funded! if project.total_backed_amount >= project.goal
	end


end


