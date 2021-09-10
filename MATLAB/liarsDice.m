%Liar's Dice
clc
clear all

diceFaces = [1:6];
%{
x1 = LD(20,1);
x2 = LD(20,2);
x3 = LD(20,3);
x4 = LD(20,4);
x5 = LD(20,5);
x6 = LD(20,6);
%}

seq = genSeq(20,10000);
[M,F] = mode(seq,2);
rollFrequencies=freq(F);
size(F)
min(F)
max(F)

function[probability] = LD(N,n)
%Calculates probability of n of a number apearing in N sample
totalOutcomes = 6 ^ N;
multiplicty = (6) * 6^(N-n);
probability = multiplicty / totalOutcomes;
end

function[outcome] = rollDice()
maxValue = 6;
minValue = 1;
outcome = round((maxValue-minValue).*rand + 1);
end

function[sequenceArray] = genSeq(N,numSequences)
    sequenceArray = zeros(numSequences, N);
        for i = [1:N]
            for j = [1:numSequences]
                sequenceArray(j,i) = rollDice();
            end
        end
end

function[frequencyNums] = freq(data)
    frequencyNums = zeros(1,max(data));
    for j = [1:size(data)]
        for i = [min(data):max(data)]
            if data(j,1) == i
                frequencyNums(i) == frequencyNums(i) + 1;
                break
            end
        end
    end
end

%{ 
function[sequenceArray] = genSeq(N)
diceRange = [1:6];
totalSequences = 6^N;
sequenceArray = zeros(N,6)
for j = [1:N]
    for i = [1:6]
        for k=[1:6]
            sequenceArray[j,i] = k
        end
    end
end
%}         