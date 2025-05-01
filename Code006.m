trials = 1000000;
nn=100;
edges=[0:0.1:2*sqrt(nn)];
H=zeros(1,length(edges)-1);
data=zeros(trials,length(edges)-1);
t=cputime;
parfor ii = 1: trials
     m=randn(nn)+sqrt(-1)*randn(nn);
    %m=randn(nn);
    L=(m+m')/2;
    ev=eig(L);
    data(ii,:)=histcounts(ev,edges);
    H=H+data(ii,:);
%    bar(edges(1:end-1), H, 'histc'); 
end
cputime-t;
%%
A = triu(ones(length(edges)-1));
GIntdata = data*A;
evnum = floor((nn+2)/4)*2+8;
numstat=zeros(length(edges)-1,evnum);
ed2=-1/2:1:evnum;
figure(1)
k=1;
hold off
% hold on
 for k = 1 : size(GIntdata,2)
     plot(0:1:evnum-1,histcounts(GIntdata(:,k),ed2)/trials,'*')
     ylim([0,1]);
     xlim([0,evnum-1]);
     title(sprintf('window = (0,%.2f)',edges(k+1)));
     drawnow;
     pause(0.05);
 end