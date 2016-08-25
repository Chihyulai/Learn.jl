
for pkg in ("Transformations", "ObjectiveFunctions", "Losses", "StochasticOptimization", "MLMetrics")
	try
		avail = Pkg.available(pkg)
		if !isempty(avail)
			# this is a registered package!
			warn("$pkg is registered in METADATA... it shouldn't be in $(@__FILE__)")
		end
	catch
		# install it
		Pkg.clone("https://github.com/JuliaML/$pkg.jl")
		Pkg.build(pkg)
	end
end