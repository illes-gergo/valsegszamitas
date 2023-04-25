using Distributions, Plots

x_atlag_hatar = 1.54

sigma = 3e-2

ndist = Normal(0,sigma)

q1 = quantile(ndist,0.99)
q2 = quantile(ndist,0.02)

println(q1/sigma)
println(q2/sigma)