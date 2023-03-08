using Distributions, StatsPlots
# 2-1 példa

mu = 10;
sigma2 = 0.25;
n = 5;
p = 0.95;
p_f = 1 - (1 - 0.95) / 2;
p_a = (1 - 0.95) / 2;

mu_atlag = mu;
sigma2_atlag = sigma2 / n;

dist_atlag = Normal(mu_atlag, sqrt(sigma2_atlag))
also_hatar = quantile(dist_atlag, p_a)
felso_hatar = quantile(dist_atlag, p_f)


plot(dist_atlag,label="Átlag")
scatter!([felso_hatar, also_hatar], [pdf(dist_atlag, felso_hatar), pdf(dist_atlag, also_hatar)])

dist_meres = Normal(mu, sqrt(sigma2))
also_hatar_meres = quantile(dist_meres, p_a)
felso_hatar_meres = quantile(dist_meres, p_f)

plot!(dist_meres,label="Mérés")
scatter!([felso_hatar_meres, also_hatar_meres], [pdf(dist_meres, felso_hatar_meres), pdf(dist_meres, also_hatar_meres)])

# 2-2 példa