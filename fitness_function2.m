function [percerror,meanError] = fitness_function2(first)
B=zeros(9,1); %create the logs to plot benfords curve
%dist=zeros(9,1);
for a = 1:9
    b=(a+1)/a;
    B(a)=log10(b);
end
[N] = histcounts(first, 'Normalization','pdf');
errors=N-(B');
per=zeros(9,1);
for e=1:9
    per(e)=abs(N(e)-B(e))/B(e);
end
percerror=mean(per);
meanError=mean(errors);
end


%{
for i=1:9
    dist(i)=1000*abs(N(i)-B(i));
end
error=mean(dist);
%}