clear all; close all; clc;
tic

table1 = importdata("corruption_partial.csv");
table2 =importdata("unemployment_partial.csv");
table3 = importdata("gdp_partial.csv");

a1 = table1.textdata;
b1 = table1.data;
a2 = table2.textdata;
b2 = table2.data;
a3 = table3.textdata;
b3 = table3.data;

% a1 = ["china", "aus", "india", "brazil"]';
% b1 = [9 3 5 6]';
% a2 = ["india", "aus", "brazil"]';
% b2 = [7 2 5]';
% a3 = ["brazil", "aus"]';
% b3 = [7, 1]';

outputNum = zeros(length(a1),4);
%outputTxt

counter = 0;

for i = 1:length(a1)
    for j = 1:length(a2)
        match1 = strcmp(a1(i),a2(j));       
        for k = 1:length(a3)
            match2 = strcmp(a1(i),a3(k));
            if match1 == true && match2 == true
                counter = counter + 1;
                outputTxt{counter,1} = a1{i};
                outputNum(counter, 2) = b1(i);
                outputNum(counter,3) = b2(j);
                outputNum(counter,4) = b3(k);
            end
        end
    end

end

t = cell2table(outputTxt(2:end,:),'variableNames',outputTxt(1,:));
writetable(t,'countries.csv');
csvwrite('numbers.csv',outputNum);

toc