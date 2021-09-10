function grade=gradecalculator(HW,HWR,Classwork,CWR,Recitation,RR,Quiz,QR,Test,TR,Lab,LR)
%This function takes vectors and ratios, as inputs, and outputs your
%expected grade.
grade=mean(HW)*HR+mean(Classwork)*CR+mean(Recitation)*RR+mean(Quiz)*QR+mean(Test)*TR+mean(Lab)*LR
end