edges=[-2,2];
edges=[-6:0.05:6]
H=zeros(1,length(edges)-1);
trials = 1000000;
for j=1:trials
m=randn(2)+sqrt(-1)*randn(2);
L=(m+m')/2;
ev=eig(L);
H=H+histcounts(ev,edges);
end
H/trials
plot(edges(1:end-1),H/trials,'*')