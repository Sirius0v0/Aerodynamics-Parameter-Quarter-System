%正激波 温度比随M1变化
m1=1:0.1:50;
RT=normalRT(m1);
plot(m1,RT);
title('T2/T1随M1变化规律');
xlabel('M1');
ylabel('T2/T1');