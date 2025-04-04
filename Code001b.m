%edges=[-2,2];
edges=-6:0.05:6;
H=zeros(1,length(edges)-1);
trials = 1000000;
nn=3;
parfor j=1:trials
m=randn(nn)+sqrt(-1)*randn(nn);
L=(m+m')/2;
ev=eig(L);
H=H+histcounts(ev,edges);
end
subplot(2,1,1),plot(edges(1:end-1),H/trials,'*')