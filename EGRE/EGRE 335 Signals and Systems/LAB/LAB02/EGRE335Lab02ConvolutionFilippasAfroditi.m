%% Save this Matlab file as is, but add your last and first name to the end
%% "EGRE335Lab02ConvolutionLastNameFirstName"

clear all;
clc;
close all;

%% Read in data file:
input = load('-mat', 'Go to the folder where you saved the file and copy the path; paste it here\data01.mat');
data = input.S1_r;

%% Set up time series
%% Sampling is at 1MHz = 1E6Hz
freq = 1E6;
dt = 1/freq;
Npoints = size(data,1); %Number of points in S1_r
tmax = (Npoints-1)*dt;  % You are starting from point 0, 
                        % so the last point will be (Npoints-1)*dt
%% Set up time series:
t = linspace(0,tmax,Npoints);

% The above creates a row, and S1_r is a column vector, so even though this
% might not cause problems, it's good to be consistent, so we will change
% S1_r to a row vector
data = data';

%% Now you can plot your data:
figure('Name','Raw Data');
plot(t,data,'- .');
% Always have axis labels (with units)
xlabel('Time [s]');
ylabel('Component 1 Voltage [V]');

%% Note that S1_r values are digital; this is because the measured voltage 
%% was digitized. You can recreate the values if you know what the 
%% digitization scheme is, but that might not be necessary. 

%% Change the limits of the plot to be between 0.3ms and 0.45ms
% Useful commands: {xlim}
%% Enter your code here:



%% Observations 1: What do you observe?


%% "Downsample" and plot the data every second point between 
%% 0.2E-3 and 0.6E-3:
% useful functions: {find, min, max} 
% Hint: You shouldn't use "=" when
% setting a condition because if your time series does not contain the
% specific point, it will return a null. Use a combination of limits {> &
% <}. 
%% Enter your code here:



%% Plot the original and downsampled data on the same graph:
% {figure, plot, xlabel, ylabel, hold}

%% Observations 2: What do you observe?



%% Create a data set from the original data of every Nth element; use 
%% N = 5, 10, 20, 200, 500
%% Enter your code here:



%% Plot each case on same plot as the reduced data set; set the limits to 
%% be in a range where tmax-tmin=0.5E-3sec
% {figure('Name',''), plot, hold, xlabel, ylabel

%% Observations 3: What do you observe vis-a-vis the original data and 
%% the new data?

%% Calculate the "moving mean" over 5 points; 
%% this takes the first n points, averages them, slides over by 1, 
%% averages, etc. In this way, we create a "filter" operation:
% {movemean}

%% Plot the original data set and its moving mean on the same graph:
%% Try 5, 10, 20, 50, 200 point moving mean:
% {figure, plot, xlabel, ylabel, hold on} 
%% Enter your code here:


%% Observations 4: What do you observe?



%% Now, try taking the mean over 10 points, and then the next 10, etc..
%% Plot the original and the new function.
% {reshape, mean}
%% Enter your code here:


%% Observations 5: What do you observe?


%% Calculate the fft using the original data set. Note you have to 
%% use the information about the data set to recreate the frequency 
%% vector (I have included this calculation here). You also have to 
%% "reposition" the fft so the peaks correspond to the provided 
%% frequency scale (use fftshift). And, you have to plot the magnitude of
%% each element of the fft (abs in Matlab).
% {fft, fftshift, abs}
fs = 1/dt;
fmax = fs/2;
deltaf = fs/Npoints;
waxis2 = -((Npoints-1)/2)*deltaf:deltaf:(Npoints/2)*deltaf;

% Enter fft command(s) here:


%% Observations 6: What do you observe? What do you think the fft is showing?
%% What frequencies are important? Can you relate them to what you see on 
%% the time-domain graph?


%% Let's say the low-frequency part of the signal is coming from either 
%% the equipment or is an "alias" (more on that later). We need to remove 
%% it from the data. 
%% The time-domain equivalent of a "high-pass" filter is the sinc function.
%% The time-domain filtered signal has fewer points (due to the convolution)
Nfilt = size(filtered,2);
waxisf = -((Nfilt-1)/2)*deltaf:deltaf:(Nfilt/2)*deltaf;
filtert = fftshift(abs(fft(filtered)));
figure('Name','fft')
yyaxis left;
plot(waxis2,original);
hold on;
yyaxis right;
plot(waxisf,filtert);
xlabel('Frequency f [Hz]');
ylabel ('|FFT| [V]');

%% Observations 7: What do you observe? Are the FFT results consistent with
%% the time-domain results?

%% Let's create a delta response of a high pass filter; this is the sinc 
%% function.
%% In the sinc function below, BW corresponds to the required cutoff
%% frequency. Since we only want the second peak (at around 100kHz) and 
%% are trying to cut off the 20kHz peak, we will set the cutoff point to 
%% 80kHz. 
BW = 80E3;
Nf = Npoints;
tmaxf = (Nf-1)*dt;
tf = linspace(0,tmaxf,Nf);
myfun = zeros(size(tf));
myfun(1) = 1;
filter = myfun-sinc(2*BW*pi*tf);

%% Plot the sinc function:


%% Change this value to 20kHz, 30kHz, 50kHz, and 80kHz. 
%% Let's apply this low-pass filter to our data:
%% Take the convolution of the signal with the sinc function (which is 
%% the zero-input response of filter):
filtered = conv(data,filter,'same');
ns = length(filtered);
figure('Name','Data and filtered data');
yyaxis left;
plot(t,data);
hold on;
yyaxis right;
plot(t(1:ns),filtered);
xlabel('Time [s]');
ylabel('Data');


%% Observations 8: What do you observe?






