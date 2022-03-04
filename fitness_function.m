function [rmse] = fitness_function(first)
B=zeros(9,1); %create the logs to plot benfords curve
for a = 1:9
    b=(a+1)/a;
    B(a)=log10(b);
end
[N] = histcounts(first, 'Normalization','pdf');
errors=N-(B');
rmse=sqrt((1/9)*sum(errors.^2));
end