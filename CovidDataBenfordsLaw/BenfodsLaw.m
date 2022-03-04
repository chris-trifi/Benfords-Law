dataEU=readtable('ECDC-7Days-Testing.xlsx');
weekEU=table2array(dataEU(1:end,3));
level=table2array(dataEU(1:end,4)); 
countryEU=table2array(dataEU(1:end,1));
CountryNames=readtable('EuropeanCountriesBenford.xlsx');
countries=table2array(CountryNames(1:end,2));
casesEU=table2array(dataEU(1:end,7));
n=length(casesEU);
m=length(countries);
%I also filtered out some countries that had incomplete data at 'EuropeanCountriesBenford.xlsx'

B=zeros(9,1); %create the logs to plot benfords curve
for a = 1:9
    b=(a+1)/a;
    B(a)=log10(b);
end

k3=find(casesEU==0);%filter out zeros
errors=zeros(m,1);
TF2=(contains(level,'subnational'));%filter out subnational data
k2=find(TF2);
for j=1:m
    name=string(countries(j));
    TF1=(contains(countryEU,name));
    k1=find(TF1);
    k=setdiff(k1,k2);
    k=setdiff(k,k3);
    size=length(k);
    first=zeros(size,1);
    for i=1:size
         a=string(casesEU(k(i)));
         c=a{1};
         b=str2num(c(1));
         first(i)=b;
    end
    [N,~] = histcounts(first,9);
    [errors(j)]= fitness_function(first);
    figure(j)
    hist(first,9);
    axis([1 inf 1 inf]);
    hold on
    Bthis=B*size;
    plot(Bthis,'r')
    title(name)
end



    
    
    
    
    
    