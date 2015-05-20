% Ntrack = Number of Tracks
% Tread = How long it takes to find and read data from the sector once the head gets to the right track (about 4 ms)
% Vhead = Speed at which the disk reader head can move, measured in tracks/second
l=zeros(1,50);
for cx=1:50
    
M=100;
mc=100;
N=100;
Ntrack=cx;

Tread=4;
Kq=10; %number of request which can be in queue
T=10;

%-----------------------------------------------------

%vec=1:Ntrack; %vector for track number

throughputwa=zeros(1,M);
timea=zeros(1,M);

for d=1:M
   
vhead=1;
timev=0;
count=0;
throughput=zeros(1,mc);
%-----------------------------------------------------
%Random Scheduling 

for f=1:mc
    b=0; 
    if(timev<=T)
        
        be=zeros(1,Kq);
    
         if(count==N)
            break;
         end

        %a=randperm(Ntrack);

        for i=1:Kq
            a=randperm(Ntrack);
            be(i)=a(1); %vector for the queue
        end


        b=be(round((Kq-1)*rand(1)+1));
        timev=timev+(sqrt((vhead-b)*(vhead-b))+Tread);
        count=count+1;
        vhead=b;

    end
    throughput(f)=(count/timev)*1000;
end

   throughputwa(d)=mean(throughput);
  
end
l(cx)=mean(throughputwa);
end
% plot(l);
% title('Throughput for Random Scheduling ')
% xlabel('Number of track') % x-axis label
% ylabel('Throughput values') % y-axis label
%FIFO Scheduling 




%SSFT Scheduling 





%Scan Scheduling





%C-Scan Scheduling 


