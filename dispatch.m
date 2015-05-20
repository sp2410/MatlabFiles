N=4;% Number of Machines (M = 5)
P=4;% Number of Parts (K = 5)
Mc=1000;% Monte Carlo Trials (N = 1000)
Minmac=5;% Min Machine Time (5 min)
Maxmac=40;% Max Machine Time (30 min)
OPT=1000;% Operation Time Minutes (1000)

for i=1:M
    for j=1:M
        a1=(Maxmac-Minmac)*rand(1,N)+Minmac;
        a2=rand(1,N);
        a3=rand(1,N);
        a4=zeros(1,N);
        
        for i=1:1:OPT
            
            
            
            
        end
    end
end