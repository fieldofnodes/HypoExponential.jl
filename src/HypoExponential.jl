module HypoExponential


export
	get_hypoexponential_coefficients,
	get_exponential_distribution_pdf,
	get_hypoexponential,
	get_hypoexponential_mean


	function get_hypoexponential_coefficients(transition_rates,specific_iteration)
		num_rates = length(transition_rates)
		filtered_range = filter(x -> x != specific_iteration,Base.OneTo(num_rates))
		coeff = [transition_rates[i]/(transition_rates[i] - transition_rates[specific_iteration]) for i in filtered_range]
		prod(coeff)
	end



	function get_exponential_distribution_pdf(λ,t)
		λ*exp.((-1) .* λ .* t)
	end

	function get_hypoexponential(t,transition_rates)
		dist_per_rate = []
		for i in eachindex(transition_rates)
			coef = get_hypoexponential_coefficients(transition_rates,i)
			expo = get_exponential_distribution_pdf(transition_rates[i],t)
			push!(dist_per_rate,coef .* expo)
		end
		sum(dist_per_rate)
		end

	function get_hypoexponential_mean(transition_rates)
		sum(1 ./ transition_rates)
	end

end
