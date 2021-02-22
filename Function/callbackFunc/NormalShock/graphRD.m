%正激波 密度比随M1变化
m1=1:0.1:50;
RD=normalRD(m1);
plot(m1,RD);
title('ρ2/ρ1随M1变化规律');
xlabel('M1');
ylabel('ρ2/ρ1');