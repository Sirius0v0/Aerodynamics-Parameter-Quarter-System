function [y0_s,y0_l] = chazhi(x0,xi,yi)
%���̱�ȡ3����
%beta����������m�ȼ�С������
%��m��ֵ��thetaʱ��y0_s�ǽ�С�⣬y0_l�ǽϴ�⣻��theta��ֵ��mʱ��������ȡ�
for i=1:1:(length(xi)-1)
    if xi(i)>xi(i+1) 
        break
    end
end
if i~=(length(xi)-1)%xi�ȼ�����
    m=xi;
    beta=yi;
    biaozhi=1;%��xi��m����x0��m��biaozhi=1
else %xi����
    beta=xi;
    m=yi;
    biaozhi=0;%����xi��theta����x0��theta��biaozhi=0
end
% m
% beta
% biaozhi

%�����ǲ�ֵ��ⲿ��
if biaozhi==1 %x0��m����m��ֵ��beta��������
   chazhao=find(m<=x0);%�����ж��м�������
   if length(chazhao)>1%����������
       dingwei_1=chazhao(1);%dingwei_1�Ǵ���x0�ĵ�һ��m��λ��,Сbeta
       x_1=[m(dingwei_1-2),m(dingwei_1-1),m(dingwei_1)];%���ֵ���Ա���
       y_1=[beta(dingwei_1-2),beta(dingwei_1-1),beta(dingwei_1)];%���ֵ�������
       y0_s=chashang(x0,x_1,y_1);
       
       dingwei_2=chazhao(end);%dingwei_2�Ǵ���x0�����һ��m��λ�ã���beta
       x_2=[m(dingwei_2),m(dingwei_2+1),m(dingwei_2+2)];%���ֵ���Ա���
       y_2=[beta(dingwei_2),beta(dingwei_2+1),beta(dingwei_2+2)];%���ֵ�������
       y0_l=chashang(x0,x_2,y_2);
    elseif length(chazhao)==1%ֻ��һ������
       y0_s=beta(chazhao);%ԭ���е���
       y0_l=y0_s;
    elseif length(chazhao)==0%û�н���
       disp('x0(m)̫С');
       y0_s=nan;
       y0_l=nan;
    end
end

if biaozhi==0 %��beta��ֵ��m������
    chazhao=find(beta==x0);%�ж����������ǲ���ԭ�����е�
    %chazhao
    if length(chazhao)==0%ԭ��û�е���
       %jinlai=1
       dingwei=find(beta>x0,1);%dingwei�Ǵ���x0�ĵ�һ��beta��λ��
       x=[beta(dingwei-2),beta(dingwei-1),beta(dingwei)];%���ֵ���Ա���
       y=[m(dingwei-2),m(dingwei-1),m(dingwei)];%���ֵ�������
       y0_s=chashang(x0,x,y);
       y0_l=y0_s;
    else
       %jinlai=2
       y0_s=m(chazhao);%ԭ���е���
       y0_l=y0_s;
    end
end


   
end

