# Benfords-Law

"Benford's law, also known as the Newcomb–Benford law, the law of anomalous numbers, or the first-digit law, is an observation that in many real-life sets of numerical data,
the leading digit is likely to be small.In sets that obey the law, the number 1 appears as the leading significant digit about 30 % of the time, while 9 appears as the 
leading significant digit less than 5 % of the time. If the digits were distributed uniformly, they would each occur about 11.1 % of the time.Benford's law also makes 
predictions about the distribution of second digits, third digits, digit combinations, and so on." -Wikipedia (https://en.wikipedia.org/wiki/Benford%27s_law)

I created a Matlab code that creates random numbers from uniform distributions that follow Benford's law with two different techniques:
1)By taking uniform random numbers in a (1,max1) interval where max itself is a random number taken in another (1,max2) interval etc.
2)By multiplying uniform random numbers x1*x2*x3*.. 

I call the amount of randomly created max1,max2.. numbers 'layers'.(if x=uniformrand(1,max1) where max1 is constant has 1 layer but if x1=uniformrand(1,x2) where 
x2 constant we have 2 layers.)


After finding out that numbers created both ways conform to Benford's law I noticed that their first digit distribution curves became more "Benford-like" when increasing
the amount of 'layers' or variables in methods 1 and 2 respectively. After creating an error function calculating the distance between the created numbers first digit
distribution and the Benford distribution I also noticed that the error of two datasets created with the two methods mentioned above tend to be identical when the amount of
layers is equal to the amount of variables used.

A possible explanation for this is that x1*x2(where x1,x2 uniform random variables) is bound in a (1,x1max*x2max) interval and when x1 takes a specific value we get a new interval
which is (1,totalmax) with totalmax belonging in (x1*1,x1*x2max). This of course is not the same as taking a uniform random variable with two layers of max but regarding the 
distribution of the first  digits they follow the same pattern.


The 'equivalence tester' function takes as inputs the amount of layers and the amount of variables and creates random numbers with both methods. It returns the distribution
of first digits for both and the error regarding their difference from the Benford distribution.

The 'equivalence caller' script calls equivalence tester multiple times for up to a number of layers and variables equal to 'max'. Then it calculates how close the first digit
distributions are for different combinations of layers and variables. 

The result of 'equivalence caller' for max=8 and 200 repetitions(calls) of the tester for each step are shown in 'results'. The y axis represents the difference between the distributions create with the two methods and thex axis represents all the combinations. The red vartical lines represent combinations where the layers of the first method
are equal to the number of variables of the second method. We see that the difference is minimized there for small number of layers. Larger samples may be needed to show the
same for larger amounts of variables and layers.

