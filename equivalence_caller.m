%equivalence caller
k=0;
max=4; %max number of variables and layers tried
reps=10; %use multiple reps so we can fit distributions and draw histograms
error1=zeros(max-1,reps);
error2=zeros(max-1,reps);
N1m=zeros(max-1,9);
N2m=zeros(max-1,9);
for p=2:max
     N1d=zeros(9,reps);
     N2d=zeros(9,reps);
     for i=1:reps
         [nrmse1,nrmse2,N1,N2]=equivalence_tester(p,p);
         error1(p-1,i)=nrmse1;
         error2(p-1,i)=nrmse2;
         N1d(:,i)=N1; %each row has 100 samples of frequency of the equivalent digit
         N2d(:,i)=N2; 
     end
     %hist(N1d(p-1,:));
     N1m(p-1,:)=mean(N1d,2); %each row has 9 columns, each one containing the mean frequency for the digit 
     N2m(p-1,:)=mean(N2d,2); %over the [reps] samples. the rows corespond to number of variables and layers 
end

error1m=mean(error1,2);
error2m=mean(error2,2);
%the x axis represents number of layers and variables tested(starting from 2) and y axis shows the
%error from the hypothesized Benford distribution
plot(error1m)
hold on
plot(error2m)
legend("layers","variables")
%we see that after 5  vars/layers the error starts fluctuating  as we
%increase the them
between=zeros(max-1,max-1);
for i= 1:max-1
    for j= 1:max-1
        error3=N1m(i,:)-(N2m(j,:)); %error between i variables and j samples (over all digits)
        between(i,j)=sqrt((1/9)*sum(error3.^2));
    end
end





%{
CI=zeros(49,2);
normal=zeros(49,1);
meann=zeros(49,1);
for y= 1:49
    normal(y)=chi2gof(dif(y,:));
    CI(y,1)=prctile(dif(y,:),2.5);
    CI(y,2)=prctile(dif(y,:),97.6);
    hist(dif(y,:));
    figure(y);
    meann(y)=mean(dif(y,:));
end  

figure(26)
boxplot(dif')
xline(1,'r')
xline(9,'r')
xline(17,'r')
xline(25,'r')
xline(33,'r')
xline(41,'r')
xline(49,'r')
hold on
plot(mean(dif'))
%}
