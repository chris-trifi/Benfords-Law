function[error1,error2,N1,N2] = equivalence_tester(layers,variables)
%test the equivalence of benfords explanation and lognormal
first1=zeros(3000,1);
first2=zeros(3000,1);
x1=zeros(layers,1);
x2=zeros(variables,1);
for i=1:3000 %create random numbers that conform to benfords law
    
    x1(1)=randi(10^10); %initialize layers of maximums
    for f=2:layers
        x1(f)=randi(x1(f-1));
    end
    total1=x1(layers);
    
    for g=1:variables %create 
        x2(g)=randi(100);
    end
    total2=prod(x2);
    
    a1=string(total1);
    c1=a1{1};
    b1=str2num(c1(1));
    
    a2=string(total2);
    c2=a2{1};
    b2=str2num(c2(1));
    
    first1(i)=b1;
    first2(i)=b2;
end

[N1,~] = histcounts(first1, 'Normalization','pdf'); %N(i)=the portion of i's as first digits
[N2,~] = histcounts(first2, 'Normalization','pdf');
%{
edges1 = edges1(2:end) - (edges1(2)-edges1(1))/2; 
edges2 = edges2(2:end) - (edges2(2)-edges2(1))/2; 
plot(edges1, N1,'-o'); %plot as line
hold on
plot(edges2, N2,'-o');
hold on
for a = 1:9
    b=(a+1)/a;
    B(a)=log10(b);
end
plot(B,'-o')

legend("layers","lognormal","Benford")

per=zeros(9,1);
for e=1:9
    per(e)=abs(N1(e)-N2(e))/N2(e);
end
percerror=mean(per);
[percerror1,meanError1] = fitness_function2(first1);
[percerror2,meanError2] = fitness_function2(first2);
meanError=mean(N1-N2);
%}
[error1] = fitness_function(first1);
[error2] = fitness_function(first2);
end