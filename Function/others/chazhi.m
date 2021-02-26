function [y0_s,y0_l] = chazhi(x0,xi,yi)
%差商表，取3个数
%beta单调递增，m先减小后增加
%给m插值出theta时，y0_s是较小解，y0_l是较大解；给theta插值出m时，两者相等。
for i=1:1:(length(xi)-1)
    if xi(i)>xi(i+1) 
        break
    end
end
if i~=(length(xi)-1)%xi先减后增
    m=xi;
    beta=yi;
    biaozhi=1;%若xi是m，即x0是m，biaozhi=1
else %xi递增
    beta=xi;
    m=yi;
    biaozhi=0;%若即xi是theta，即x0是theta，biaozhi=0
end
% m
% beta
% biaozhi

%以下是插值求解部分
if biaozhi==1 %x0是m，给m插值出beta，不单调
   chazhao=find(m<=x0);%用来判断有几个交点
   if length(chazhao)>1%有两个交点
       dingwei_1=chazhao(1);%dingwei_1是大于x0的第一个m的位置,小beta
       x_1=[m(dingwei_1-2),m(dingwei_1-1),m(dingwei_1)];%求差值的自变量
       y_1=[beta(dingwei_1-2),beta(dingwei_1-1),beta(dingwei_1)];%求差值的因变量
       y0_s=chashang(x0,x_1,y_1);
       
       dingwei_2=chazhao(end);%dingwei_2是大于x0的最后一个m的位置，大beta
       x_2=[m(dingwei_2),m(dingwei_2+1),m(dingwei_2+2)];%求差值的自变量
       y_2=[beta(dingwei_2),beta(dingwei_2+1),beta(dingwei_2+2)];%求差值的因变量
       y0_l=chashang(x0,x_2,y_2);
    elseif length(chazhao)==1%只有一个交点
       y0_s=beta(chazhao);%原来有的数
       y0_l=y0_s;
    elseif length(chazhao)==0%没有交点
       disp('x0(m)太小');
       y0_s=nan;
       y0_l=nan;
    end
end

if biaozhi==0 %给beta插值出m，单调
    chazhao=find(beta==x0);%判断所给的数是不是原本就有的
    %chazhao
    if length(chazhao)==0%原来没有的数
       %jinlai=1
       dingwei=find(beta>x0,1);%dingwei是大于x0的第一个beta的位置
       x=[beta(dingwei-2),beta(dingwei-1),beta(dingwei)];%求差值的自变量
       y=[m(dingwei-2),m(dingwei-1),m(dingwei)];%求差值的因变量
       y0_s=chashang(x0,x,y);
       y0_l=y0_s;
    else
       %jinlai=2
       y0_s=m(chazhao);%原来有的数
       y0_l=y0_s;
    end
end


   
end

