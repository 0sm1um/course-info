mu = 5; sigma = 2;
nonStandardVector = normrnd(mu,sigma,1,5000000);

standardVector = (nonStandardVector - mu) / sigma;
mean(standardVector) %print sample mean
std(standardVector) %print std dev