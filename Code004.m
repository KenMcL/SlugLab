%edges=[-2,2];
edges=0:0.05:4;
H=zeros(1,length(edges)-1);
trials = 1000000;
nn=9;
parfor j=1:trials
m=randn(nn)+sqrt(-1)*randn(nn);
L=(m+m')/2;
ev=sort(eig(L));
spa=diff(ev);
H=H+histcounts(spa,edges);
end
subplot(1,1,1),plot(edges(1:end-1),H/trials,'*')
xlim([edges(1),edges(end)])