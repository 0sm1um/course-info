clear all
clc
load IntensityDataC
load wavelength
load samples

slitWidth = 0.15*10^-1; %in cm
IC = IC./(Ical1*slitWidth^2);
IS1 = Imeas1./(Ical1*slitWidth^2);
IS2 = Imeas2./(Ical2*slitWidth^2);
hc= 1239.5; %eVnm
PhotonEnergy=[];
for i=[1:length(lambdaC)]
    PhotonEnergy(i,:)=hc/(wavelength(i)); %in eV
end


%% Part 2
load rawdata
F6EB = [1,30;2,22;3,34;4,28;5,20;6,34;7,32;8,14;9,24;10,20;11,20;12,16;13,30;14,38;15,42;16,32;17,30;18,44;19,26;20,30;21,24;22,24;23,30;24,22;25,52;26,26;27,32;28,30;29,20;30,38;31,38;32,40;33,30;34,10;35,16;36,36;37,32;38,38;39,30;40,42;41,30;42,38;43,26;44,24;45,26;46,32;47,38;48,40;49,38;50,36;51,42;52,24;53,18;54,36;55,32;56,26;57,28;58,36;59,22;60,26;61,30;62,18;63,28;64,26;65,34;66,30;67,40;68,50;69,18;70,50;71,24;72,36;73,34;74,30;75,20;76,28;77,30;78,32;79,40;80,20;81,32;82,22;83,38;84,30;85,26;86,42;87,34;88,36;89,22;90,36;91,36;92,36;93,22;94,38;95,34;96,46;97,40;98,26;99,28;100,34;101,14;102,14;103,28;104,30;105,36;106,16;107,26;108,22;109,22;110,26;111,30;112,24;113,36;114,28;115,22;116,28;117,26;118,16;119,22;120,28];


BBError = []; EBError = [];
for i = [1:length(BroadBand)]
    BBError(i) = 100*percentError([BroadBand(i,1) BroadBand(i,2)]);
    EBError(i) = 100*percentError([ExcitonBand(i,1) ExcitonBand(i,2)]);
end
 

excitationPowerDensity = 0.2; %W/m
excitationPower = excitationPowerDensity*filterTransparency;


%% Plotting

figure
hold on
plot(F1EB(:,1),F1EB(:,2),'b')
plot(F1BB(:,1),F1BB(:,2),'r')
plot(F2EB(:,1),F2EB(:,2),'b')
plot(F2BB(:,1),F2BB(:,2),'r')
plot(F3EB(:,1),F3EB(:,2),'b')
plot(F3BB(:,1),F3BB(:,2),'r')
plot(F4EB(:,1),F4EB(:,2),'b')
plot(F4BB(:,1),F4BB(:,2),'r')
plot(F5EB(:,1),F5EB(:,2),'b')
plot(F5BB(:,1),F5BB(:,2),'r')
plot(F6EB(:,1),F6EB(:,2),'b')
plot(F6BB(:,1),F6BB(:,2),'r')
title('Raw Intensity Measurements')
ylabel('Intensity Ratio (Relative Units)')
xlabel('Time (0.4 s Increments)')
legend('Exciton Band','Broad Band')
hold off

figure
hold on
plot(lambdaS1,IS1)
plot(lambdaS2,IS2)
title('Wavelength vs PL Intensity')
xlabel('Wavelength (nm)')
ylabel('Intensity')
legend('Scan1','Scan2')
hold off

figure
hold on
plot(PhotonEnergyS1,IS1)
plot(PhotonEnergyS2,IS2)
plot(PhotonEnergy,IC)
title('Photon Energy vs PL Intensity')
xlabel('Photon Energy (eV)')
ylabel('Intensity')
legend('Scan1','Scan2','Calibration Scan')
hold off

figure
loglog(excitationPower,ExcitonBand(:,1),'.-')
hold on
loglog(excitationPower,BroadBand(:,1),'.-')
title('Excitation Intensity vs PL Intensity [Log Scale]')
xlabel('Excitation Intensity (W/cm^2)')
ylabel('Photoilluminescent Intensity')
legend('Exciton Band','Broad Band')
hold off

figure
scatter(excitationPower,EBError)
set(gca,'xscale','log')
hold on
scatter(excitationPower,BBError)
title('Excitation Intensity vs Measurement Error')
xlabel('LOG SCALE: Excitation Intensity (W/cm^2)')
ylabel('Percent Error')
legend('Exciton Band Measurements','Broad Band Measurements')
hold off