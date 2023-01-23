%%estimate the integral of an arbitrary function f(x) using different
%%numerical methods leaned for an increasing sequence of interval
%%partitions...
clear
clc
format long
syms y x
%% TO USE THE PROGRAM:
%% Define function to integrate locally (easy, check at the bottom of this script)
%% Define function symbolically (check under this text block)
%% Define bounds of the integral, namely:  a,b (make sure that b>a!)
%% Set the upper bound for the number of intervals to used on the approx methods
y = sin(x)*cos(x); %<-write your function symbolically
a = 0; %<-write the lower bound
b = 3;%<-write the upper bound
%% *Now, scroll down till you reach the bottom and define the function locally
%___________________________________________________________________________________

N = [1:20]; %set the maximum order of partitions of [a,b] to use here (we will always start by 1)...
for i=1:size(N,2)
    H(i) = (b-a)/(N(i)); %store the step h which is the constant distance between nodes for each partition order 
end
index = 1; 
for i=1:size(N,2)
    X = [a:H(i):b]; %store the nodes used for the current order of [a,b] partition
    %----TRAPEZOIDAL RULE------%
    T(i) = (f(a)+f(b))/(2); 
    for j=2:(N(i)-1)
        T(i) = T(i)+f(X(j)); %store the estimated value using the trap rule for the ith partition order too
    end
    T(i) = T(i)*H(i);
    %-----SIMPSONS RULE && RECTANGLE RULES--------%
    if mod(N(i),2) == 0
        Neven(index) = N(i);
        S(index) = f(a)+f(b);
        s1 = 0;
        s2 = 0;
        for j=1:(N(i)/2)
            s1 = s1 + f(X(2*j));
        end
        s1 = 4*s1;
        for j=2:(N(i)/2)
           s2 = s2 + f(X(2*j+1));
        end
       s2 = 2*s2;
       S(index) = ((H(i))/(3))*(S(index)+s1+s2);
       %----- RECTANGLE RULE--------%
       M(index) = 0;
       for k=1:(N(i)/2)
           M(index) = M(index) + f(X(2*k));
       end
       M(index) = M(index) * 2*H(i);
       index = index +1;
    end
end
scatter(N,T,'filled');
title("INTEGRAL OF F : NUMERICAL CONCLUSIONS");
xlabel("N (subintervals used) ");
ylabel("Integral estimate");
hold on;
scatter(Neven,S,"filled");
hold on;
scatter(Neven,M,"filled");
hold on;
I = int(y,a,b);
plot([1 N(size(N,2))],[I I]);
legend('Trapezoidal rule','Simpson`s rule','Midpoint Rule','g(x) = exact integral')
figure
title("GRAPH OF f(x)");
xlabel("x value");
ylabel("y value");
fplot(y,[a b]);
%finally, display the results in screen as a table indicating: N,h,value
%uncomment this if you want to see plot data in command window too
% fprintf("N  | h |Estimated value for I \n");
% for i=1:size(N,2)
%     fprintf("%d  | %f | %f ",N(i),H(i),T(i));
%     fprintf("\n");
% end
% fprintf("N  | h |Estimated value for I \n");
% for i=2:2:size(N,2)
%     fprintf("%d  | %f | %f ",N(i),H(i),S(i/2));
%     fprintf("\n");
% end
% 

%Note for Simpson`s rule:
%we use the same vector N of intervals amount, however, since Simpsons
%Rule relies on interpolating three nodes with a quadratic ploynomial, the
%number of nodes for each partition of order N must be odd and therefore, N
%must be even. 
%_______________________________________________________

%% *Define the function locally below:
function y = f(x)
y = sin(x)*cos(x);
end
