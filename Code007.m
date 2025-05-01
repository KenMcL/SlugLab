trials = 1000000;
nn=40;
edges=[0:0.1:2*sqrt(nn)];
H=zeros(1,length(edges)-1);
data=zeros(trials,length(edges)-1);
t=cputime;
parfor ii = 1: trials
     m=randn(nn)+sqrt(-1)*randn(nn);
    L=(m+m')/2;
    ev=eig(L);
    data(ii,:)=histcounts(ev,edges);
    H=H+data(ii,:);
%    bar(edges(1:end-1), H, 'histc'); 
end
% cputime-t;
% H/trials
% var(data)
%%
ed2=[-1/2: 1: 45/2];
Intervalcounts=zeros(length(edges)-1,length(ed2)-1);
% for k =1:length(edges)-1
%     Intervalcounts(k,:)=histcounts(data(:,k),ed2);
% end
A = triu(ones(length(edges)-1));
GrownIntervalsdata = data * A;