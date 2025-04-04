m=randn(3)+sqrt(-1)*randn(3);
L=(m+m')/2;
ev=eig(L);
subplot(2,1,2),plot(real(ev),imag(ev),'*')
xlim([edges(1),edges(end)])
