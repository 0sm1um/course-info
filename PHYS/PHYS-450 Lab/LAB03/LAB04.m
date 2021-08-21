clear all
clc
load IntensityDataC
load wavelength
load samples

slitWidth = 0.15*10^-1; %in cm
IntensityDataS1 = IC./(S1*slitWidth^2);
IntensityDataS1ND = IC./(S1NoDiaphragm*slitWidth^2);

IntensityDataS2 = IC./(S2*slitWidth^2);
IntensityDataS2ND = IC./(S2NoDiaphragm*slitWidth^2);


hc= 1239.5; %eVnm
PhotonEnergy=[];
for i=[1:length(wavelength)]
    PhotonEnergy(i,:)=hc/(wavelength(i)); %in eV
end


%% Part 2
 


%% Plotting

figure
hold on
plot(wavelength,IntensityDataS1,'r')
plot(wavelength,IntensityDataS1ND,'g')
plot(wavelength,IntensityDataS2,'b')
plot(wavelength,IntensityDataS2ND)

title('Intensity vs Wavelength')
ylabel('Intensity Ratio (Relative Units)')
xlabel('Wavelength (nm)')
legend('Sample 1','Sample 1 (No Diaphragm)','Sample 2','Sample 2 (No Diaphragm)')
hold off


figure
hold on
plot(PhotonEnergy,IntensityDataS1,'r')
plot(PhotonEnergy,IntensityDataS1ND,'g')
plot(PhotonEnergy,IntensityDataS2,'b')
plot(PhotonEnergy,IntensityDataS2ND)
title('Intensity vs Photon Energy')
ylabel('Intensity Ratio (Relative Units)')
xlabel('Photon Energy (eV)')
legend('Sample 1','Sample 1 (No Diaphragm)','Sample 2','Sample 2 (No Diaphragm)')
hold off

figure
hold on
plot(PhotonEnergy,abs(fft(IntensityDataS1)))
title('Frequency Domain Plot of Sample 1')
xlabel('Photon Energy (eV)')
ylabel('Frequency (Hz)')
legend('Sample 1 Frequency')
hold off

percentError([2.66 .47])
percentError([2.45 .28])
percentError([2.57 .49])
percentError([2.48 .77])
