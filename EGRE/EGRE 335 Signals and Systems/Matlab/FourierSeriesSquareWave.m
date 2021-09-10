%% Fourier series expansion
close all;

% Signal frequency:
f0 = 1;
om0 = 2*pi*f0;

% Plot just the sine wave (k=1):

t = linspace(0,10,1000);
w1 = sin(om0*t)/pi;

figure('Name','One sinusoid');
plot(t,w1);
xlabel('time');
ylabel('signal value')

N=10;

figure('Name','Square wave approximation');

for k = 1:N
    clf
    w1 = w1+sin(k*om0*t)/(k*pi);

    plot(t,w1);
    xlabel('time');
    ylabel('signal value')
    hold on; 
    pause(1)
end

w2=square(2*pi*t);

plot(abs(fft(w1)))

plot(abs(fft(w2)))