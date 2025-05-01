edges=12:0.1:20;
H=zeros(1,length(edges)-1);
trials = 100000;
nn=64;
parfor j=1:trials
m=randn(nn)+sqrt(-1)*randn(nn);
L=(m+m')/2;
% ev=eig(L);
lm=eigs(L,1,'largestreal');
H=H+histcounts(lm,edges);
end
subplot(2,1,2),plot(edges(1:end-1),H/trials,'*')
xlim([edges(1),edges(end)])