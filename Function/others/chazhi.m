function [y0_s,y0_la] = chazhi(x0,xi,yi)
%差商表，取3个数,点运算（x0也为向量）
%给m插值出theta时，y0_s是较小解，y0_la是较大解
%xi可以单调，可以非单调（可以先增后减，可以先减后增）；yi必然单调（单增或单减均可）
xixiao=min(xi);%xi的最小值
xida=max(xi);%xi的最大值

y0_s=zeros(1,length(x0));%预分配内存
y0_la=zeros(1,length(x0));


for j=1:1:length(x0)
if (x0(j)>=xixiao&&x0(j)<=xida)==0%x0不符合要求
    error('x0中有数值不在xi范围内');
end
end

%判断xi单调性,不涉及x0
for i=2:1:(length(xi)-1)
    if ((xi(i-1)<xi(i))&&(xi(i)>xi(i+1))==1)||((xi(i-1)>xi(i))&&(xi(i)<xi(i+1))==1)%单调性有变化，即有增减
        break
    end
end
%i
if i~=(length(xi)-1)%xi非单调,biaozhi=1
%     m=xi;
%     beta=yi;
    biaozhi=1;
else %xi单调,biaozhi=2
%     beta=xi;
%     m=yi;
    biaozhi=2;
end
% m
% beta
%biaozhi
if biaozhi==1%xi非单调
    if xi(1)>xi(2)%先减后增
       mokuai=11;
    elseif xi(1)<xi(2)%先增后减
       mokuai=12;
    else %前两点不足以判断
       error('前两点判断不出增减性');
    end
elseif biaozhi==2%xi单调
    if xi(1)<xi(2) %单增
        mokuai=21;
    elseif xi(1)>xi(2) %单减
        mokuai=22;
    else
        error('前两处判断不出增减性');
    end
    
end%判断jinru的
% mokuai

for k=1:1:length(x0)%对xi中每个元素进行求解
    xc=x0(k);%每个循环里xc来代替当前循环中的x0
%以下是插值求解部分
% if biaozhi==1 %xi增减，yi单调
%    if xi(1)>xi(2)%先减后增
     if mokuai==11 %先减后增
       chazhao=find(xi<=xc);%用来判断有几个交点
     
       if length(chazhao)>1%有两个交点
           %先处理靠前的交点
           dingwei_1=chazhao(1);%dingwei_1是大于x0的第一个xi的位置
        
           if dingwei_1<=2
              y0_1=yi(1);%前两个端点处的插值直接取第一个值
           else
           x_1=[xi(dingwei_1-2),xi(dingwei_1-1),xi(dingwei_1)];%求差值的自变量
           y_1=[yi(dingwei_1-2),yi(dingwei_1-1),yi(dingwei_1)];%求差值的因变量
           y0_1=chashang(xc,x_1,y_1);
           end
           %再处理靠后的交点
           dingwei_2=chazhao(end);%dingwei_2是大于x0的最后一个位置
           if dingwei_2>=(length(xi)-1)
              y0_2=yi(end);%后两个端点处的插值直接取最后一个值
           else
           x_2=[xi(dingwei_2),xi(dingwei_2+1),xi(dingwei_2+2)];%求差值的自变量
           y_2=[yi(dingwei_2),yi(dingwei_2+1),yi(dingwei_2+2)];%求差值的因变量
           y0_2=chashang(xc,x_2,y_2);
           end         
        elseif length(chazhao)==1%只有一个交点
           y0_1=yi(chazhao);%原来有的数
           y0_2=y0_1;
%         elseif length(chazhao)==0%没有交点
%            error('x0不在范围内');
%            y0_1=nan;
%            y0_2=nan;
       end
   elseif mokuai==12%先增后减
       %jinlai=2
       chazhao=find(xi>=xc);%用来判断有几个交点
       %chazhao
       if length(chazhao)>1%有两个交点
           %先处理靠前的交点
           dingwei_1=chazhao(1);%dingwei_1是大于x0的第一个xi的位置
           %dingwei_1
           if dingwei_1<=2
              y0_1=yi(1);%前两个端点处的插值直接取第一个值
           else
           x_1=[xi(dingwei_1-2),xi(dingwei_1-1),xi(dingwei_1)];%求差值的自变量
           y_1=[yi(dingwei_1-2),yi(dingwei_1-1),yi(dingwei_1)];%求差值的因变量
           y0_1=chashang(xc,x_1,y_1);
           end
           %再处理靠后的交点
           dingwei_2=chazhao(end);%dingwei_2是大于x0的最后一个位置
           %dingwei_2
           if dingwei_2>=(length(xi)-1)
              y0_2=yi(end);%后两个端点处的插值直接取最后一个值
           else
           x_2=[xi(dingwei_2),xi(dingwei_2+1),xi(dingwei_2+2)];%求差值的自变量
           y_2=[yi(dingwei_2),yi(dingwei_2+1),yi(dingwei_2+2)];%求差值的因变量
           y0_2=chashang(xc,x_2,y_2);
           end         
        elseif length(chazhao)==1%只有一个交点，用峰值代替
           y0_1=yi(chazhao);
           y0_2=y0_1;
%         elseif length(chazhao)==0%没有交点
%            error('x0不在x范围内');
% %            y0_1=nan;
% %            y0_2=nan;
       end
% if biaozhi==0 %xi单调 单调->增减  
%     xixiao=min(xi);
%     xida=max(xi);
%     if (x0>=xixiao&&x0<=xida)==0%x0不符合要求
%        error('x0不在xi范围内');
%     else %x0符合要求
     elseif mokuai==21 %单增
          chazhao=find(xi>=xc);
          dingwei=chazhao(1);%dingwei是大于x0的第一个位置
          %dingwei
          if dingwei<=2 %若位于前两个，则用第一个值代替
             y0_1=yi(1);
             y0_2=y0_1;
          else %位于后两个，正常计算
             x=[xi(dingwei-2),xi(dingwei-1),xi(dingwei)];
          %x
             y=[yi(dingwei-2),yi(dingwei-1),yi(dingwei)];
          %y
             y0_1=chashang(xc,x,y);
             y0_2=y0_1;
          end
       
      elseif mokuai==22 %单减
          chazhao=find(xi<=xc);
          dingwei=chazhao(1);%dingwei是小于x0的第一个位置
          %dingwei
          if dingwei<=2 %若位于前两个，则用第一个值代替
             y0_1=yi(1);
             y0_2=y0_1;
          else %位于后两个，正常计算
             x=[xi(dingwei-2),xi(dingwei-1),xi(dingwei)];
          %x
             y=[yi(dingwei-2),yi(dingwei-1),yi(dingwei)];
          %y
             y0_1=chashang(xc,x,y);
             y0_2=y0_1;
          end
     end
      
%     else %原来有的数
%        y0_1=yi(chazhao);
%        y0_2=y0_1;
if y0_1>y0_2 %转换大小
   y0_s(k)=y0_2;
   y0_la(k)=y0_1;
elseif y0_1<y0_2
   y0_s(k)=y0_1;
   y0_la(k)=y0_2;
else
   y0_s(k)=y0_1;
   y0_la(k)=y0_s(k);
end

end%for循环的
   
end

