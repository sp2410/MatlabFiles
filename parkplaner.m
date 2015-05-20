M=100000; %Number of rides
K=10; % Number of people
%Lf scaling factor if needed.
Openhour=100; % Time of operation
std=14.*rand()+1; %random 
tlag=1; % time unit
X=1:tlag:Openhour;
Y=zeros(M,((Openhour-1)/tlag)+1);
N=20*(ones(M,((Openhour-1)/tlag)+1));

for r=1:M
Y(r,:) = 1000*normpdf(X,round(Openhour*rand()),std);
end


for z=1:M
    for q=1:((Openhour-1)/tlag)+1
    if (Y(z,q)<=20)
        Y(z,q)=20;
    end
    end
end

arrive=zeros(1,K);
for people=1:K
    arrive(people)=round(20.*rand()+1);
end

for f=1:M

   
        
        for ss=1:K
            N(f,arrive(ss))=Y(f,arrive(ss));
        end
        
%         for l=1:1:(((Openhour-1)/tlag)+1)
%              if((N(f,l))<20)
%                 N(f,l)=20;
%              end
%          end

    
end

% The model is N


%plot(N);
%hold on;
A=['g','r','b'];

for zz=1:M
    
plot(N(zz,:));
hold on ;
end



for j=1:M
    
%plot(Y(j,:),A(j));
%hold on ;
end

hold off;

title('Wait time model for three rides');
xlabel('Park open time') ;
ylabel('wait time') ;


runs=10;
mc=10;
NextdayNumber=1;
%Now Working the algo
Prob=zeros(1,runs);


for bh=1:runs
    
  
    countsuc=zeros(1,mc);
    for bg=1:mc
        
        arrivee=zeros(1,NextdayNumber); 
        
        for puil=1:NextdayNumber
            arrivee(puil)=round(ceil((20*rand(1)+1)));
        end
        
        
        
            countsuccess=zeros(1,NextdayNumber);
        for ll=1:NextdayNumber
            
            flag=zeros(M);
            ridecount=zeros(1,NextdayNumber);
            %count=0;
           
            %time=0;
            
                for qp=1:1:Openhour
                    
                    if (arrivee(ll)<=Openhour)
                        [choose,fla]=min(N(:,round(arrivee(ll))));
                        if(flag(fla)==0)

                            flag(fla)=1;
                            %count=count+1;
                            %time=time+choose;
                            arrivee(ll)=arrivee(ll)+choose;
                            ridecount(ll)=ridecount(ll)+1;
                        end
                    end
           
                end
                
            if(sum(ridecount)==(M*NextdayNumber))
                countsuccess(ll)=countsuccess(ll)+1;
            end
        
        end
        countsuc(bg)=mean(countsuccess);
        
    end
%Probability of success 
Prob(bh)=(sum(countsuc)/mc);
end

