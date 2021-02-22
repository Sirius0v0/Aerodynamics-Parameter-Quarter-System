%正激波 压力比随M1变化
m1=1:0.1:50;
RP=normalRP(m1);
plot(m1,RP);
title('P2/P1随M1变化规律');
xlabel('M1');
ylabel('P2/P1');