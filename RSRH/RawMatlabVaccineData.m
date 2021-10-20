%clear all; clc
load('RawVaccineData')
load('PrunedVaccineData')
PrunedData = [Vaccinated20211014(:,2),Vaccinated20211014(:,3),Vaccinated20211014(:,4),Vaccinated20211014(:,5),Vaccinated20211014(:,6),Vaccinated20211014(:,7),Vaccinated20211014(:,8)];
save('PrunedVaccineData')

i = strfind(Vaccinated20211014(:,2), 'USA');
i2 = find([i{:}] == 1)
i3 = find(~cellfun(@isempty,i))
iLen = length(i(~cellfun(@isempty, i)));

%i2=find(i)

function [FilteredData] = FilterByCountry(data,country)
%Accepts pruned data as one argument. Accepts country code.
%Returns only data with that country code.
i = strfind(Vaccinated20211014(:,2), country);
i = find(~cellfun(@isempty,i))

filteredData = data()
end