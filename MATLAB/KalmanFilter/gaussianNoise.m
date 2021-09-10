function noise = gaussianNoise(Q);
[m, n] = size(Q);
noise = zeros(m,n);
mean = 0;
for i = 1:m
for j = 1:n
    noise(i,j) = (sqrt(Q(i,j))* randn(1)) + mean;
end
end
end