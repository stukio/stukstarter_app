module ProjectsHelper

	def funding_status_message(project)
		case project.status
			when "pending"
				"This project will only be funded if at least #{number_to_currency(project.goal, unit: '$')} is pledged by #{project.expiration_date}."
			when "funded"
				"This project will be funded on #{project.expiration_date}."
			when "expired"
				"This project failed to meet the goal."
			when "canceled"
				"This project was canceled"
		end
	end


end


