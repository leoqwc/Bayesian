data {
  // Data:
  int<lower=1> n; // number of observations
  real x[n];
  real y[n];
    
  // Input hyperparameters as data:
  real lambda;
  real k; 
  real a;
  real b;
}
parameters {
  
  // Observation expected value:
  real theta;
  
  // Observation standard deviation:
    
  real<lower=0> tau;
  
}

model {
  
  // Likelihood:
  for(i in 1:n)
  y[i] ~ normal(theta * x[i], sqrt(tau^(-1)));
  
  // Priors: 
  theta ~ beta(a, b); 
  tau ~ weibull(lambda, k); 
  

}

