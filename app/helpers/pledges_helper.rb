module PledgesHelper
	def pledge_radio_button(reward)
		text  = " $#{reward.value}"
		text += "<p>#{reward.description}</p>" 
		text += "<p><strong>Estimated Delivery: </strong>#{reward.estimated_delivery}</p>" 
		text.html_safe
	end
end

