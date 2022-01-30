clc
clear

Nc = 5;         % Number of components
avec = 1:(2^Nc-1);
Amat = de2bi(avec,Nc,'left-msb'); % Binary representation 
F = zeros(2^Nc-1,Nc);
for i = 1:2^Nc-1
    F(i,Amat(i,:) == 0) = 5;
    F(i,Amat(i,:) == 1) = ( 100 - 5*(Nc-sum(Amat(i,:))) )/sum(Amat(i,:));
end

bvec = 0:(2^(Nc-1)-1);
Bmat = de2bi(bvec,Nc-1,'left-msb'); % Binary representation
Bmat = 1.1*(1-Bmat) + 2.5*Bmat;
alpha = ones(2^(Nc-1),Nc);
for i = 1:2^(Nc-1)
    for p = 1:Nc-1
        alpha(i,p) = prod(Bmat(i,p:Nc-1));
    end
end

% The flowrate and relative volatility information for the test cases are
% stored in 'feedcases' and 'alphacases' matrices, respectively.
feedcases = zeros((2^Nc-1)*2^(Nc-1), Nc);
alphacases = zeros((2^Nc-1)*2^(Nc-1), Nc);
for i = 1:(2^Nc-1)
    for j = 1:2^(Nc-1)
        feedcases((i-1)*(2^(Nc-1))+j,:) = F(i,:);
        alphacases((i-1)*(2^(Nc-1))+j,:) = alpha(j,:);
    end
end

% For generating data files
% feedtab = array2table([[1:(2^Nc-1)*2^(Nc-1)]' feedcases],...
%     'VariableNames',{'Case','F_1','F_2','F_3','F_4','F_5'});
% alphatab = array2table([[1:(2^Nc-1)*2^(Nc-1)]' alphacases],...
%     'VariableNames',{'Case','alpha_1','alpha_2','alpha_3','alpha_4','alpha_5'});
% writetable(feedtab,'feedcases.dat')
% writetable(alphatab,'alphacases.dat')