bulletMass = 115; %Grains
powderMass = 5; %Grains
muzzleVelocity = 1000 % ft-sec

bulletMass = 7.4*10^-3; % kg
powderEnergy = 971; % J
muzzleVelocity = 304; % m/s

% "gunpowder" has a chemical potential energy of 3MJ/kg

kineticEnergy = .5 * bulletMass * muzzleVelocity^2 % J
impulse = bulletMass*muzzleVelocity % N s
impulselbs = 0.74*impulse % lb s