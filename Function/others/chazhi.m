function [y0_s,y0_la] = chazhi(x0,xi,yi)
%���̱�ȡ3����,�����㣨x0ҲΪ������
%��m��ֵ��thetaʱ��y0_s�ǽ�С�⣬y0_la�ǽϴ��
%xi���Ե��������Էǵ�����������������������ȼ���������yi��Ȼ�����������򵥼����ɣ�
xixiao=min(xi);%xi����Сֵ
xida=max(xi);%xi�����ֵ

y0_s=zeros(1,length(x0));%Ԥ�����ڴ�
y0_la=zeros(1,length(x0));


for j=1:1:length(x0)
if (x0(j)>=xixiao&&x0(j)<=xida)==0%x0������Ҫ��
    error('x0������ֵ����xi��Χ��');
end
end

%�ж�xi������,���漰x0
for i=2:1:(length(xi)-1)
    if ((xi(i-1)<xi(i))&&(xi(i)>xi(i+1))==1)||((xi(i-1)>xi(i))&&(xi(i)<xi(i+1))==1)%�������б仯����������
        break
    end
end
%i
if i~=(length(xi)-1)%xi�ǵ���,biaozhi=1
%     m=xi;
%     beta=yi;
    biaozhi=1;
else %xi����,biaozhi=2
%     beta=xi;
%     m=yi;
    biaozhi=2;
end
% m
% beta
%biaozhi
if biaozhi==1%xi�ǵ���
    if xi(1)>xi(2)%�ȼ�����
       mokuai=11;
    elseif xi(1)<xi(2)%�������
       mokuai=12;
    else %ǰ���㲻�����ж�
       error('ǰ�����жϲ���������');
    end
elseif biaozhi==2%xi����
    if xi(1)<xi(2) %����
        mokuai=21;
    elseif xi(1)>xi(2) %����
        mokuai=22;
    else
        error('ǰ�����жϲ���������');
    end
    
end%�ж�jinru��
% mokuai

for k=1:1:length(x0)%��xi��ÿ��Ԫ�ؽ������
    xc=x0(k);%ÿ��ѭ����xc�����浱ǰѭ���е�x0
%�����ǲ�ֵ��ⲿ��
% if biaozhi==1 %xi������yi����
%    if xi(1)>xi(2)%�ȼ�����
     if mokuai==11 %�ȼ�����
       chazhao=find(xi<=xc);%�����ж��м�������
     
       if length(chazhao)>1%����������
           %�ȴ���ǰ�Ľ���
           dingwei_1=chazhao(1);%dingwei_1�Ǵ���x0�ĵ�һ��xi��λ��
        
           if dingwei_1<=2
              y0_1=yi(1);%ǰ�����˵㴦�Ĳ�ֱֵ��ȡ��һ��ֵ
           else
           x_1=[xi(dingwei_1-2),xi(dingwei_1-1),xi(dingwei_1)];%���ֵ���Ա���
           y_1=[yi(dingwei_1-2),yi(dingwei_1-1),yi(dingwei_1)];%���ֵ�������
           y0_1=chashang(xc,x_1,y_1);
           end
           %�ٴ�����Ľ���
           dingwei_2=chazhao(end);%dingwei_2�Ǵ���x0�����һ��λ��
           if dingwei_2>=(length(xi)-1)
              y0_2=yi(end);%�������˵㴦�Ĳ�ֱֵ��ȡ���һ��ֵ
           else
           x_2=[xi(dingwei_2),xi(dingwei_2+1),xi(dingwei_2+2)];%���ֵ���Ա���
           y_2=[yi(dingwei_2),yi(dingwei_2+1),yi(dingwei_2+2)];%���ֵ�������
           y0_2=chashang(xc,x_2,y_2);
           end         
        elseif length(chazhao)==1%ֻ��һ������
           y0_1=yi(chazhao);%ԭ���е���
           y0_2=y0_1;
%         elseif length(chazhao)==0%û�н���
%            error('x0���ڷ�Χ��');
%            y0_1=nan;
%            y0_2=nan;
       end
   elseif mokuai==12%�������
       %jinlai=2
       chazhao=find(xi>=xc);%�����ж��м�������
       %chazhao
       if length(chazhao)>1%����������
           %�ȴ���ǰ�Ľ���
           dingwei_1=chazhao(1);%dingwei_1�Ǵ���x0�ĵ�һ��xi��λ��
           %dingwei_1
           if dingwei_1<=2
              y0_1=yi(1);%ǰ�����˵㴦�Ĳ�ֱֵ��ȡ��һ��ֵ
           else
           x_1=[xi(dingwei_1-2),xi(dingwei_1-1),xi(dingwei_1)];%���ֵ���Ա���
           y_1=[yi(dingwei_1-2),yi(dingwei_1-1),yi(dingwei_1)];%���ֵ�������
           y0_1=chashang(xc,x_1,y_1);
           end
           %�ٴ�����Ľ���
           dingwei_2=chazhao(end);%dingwei_2�Ǵ���x0�����һ��λ��
           %dingwei_2
           if dingwei_2>=(length(xi)-1)
              y0_2=yi(end);%�������˵㴦�Ĳ�ֱֵ��ȡ���һ��ֵ
           else
           x_2=[xi(dingwei_2),xi(dingwei_2+1),xi(dingwei_2+2)];%���ֵ���Ա���
           y_2=[yi(dingwei_2),yi(dingwei_2+1),yi(dingwei_2+2)];%���ֵ�������
           y0_2=chashang(xc,x_2,y_2);
           end         
        elseif length(chazhao)==1%ֻ��һ�����㣬�÷�ֵ����
           y0_1=yi(chazhao);
           y0_2=y0_1;
%         elseif length(chazhao)==0%û�н���
%            error('x0����x��Χ��');
% %            y0_1=nan;
% %            y0_2=nan;
       end
% if biaozhi==0 %xi���� ����->����  
%     xixiao=min(xi);
%     xida=max(xi);
%     if (x0>=xixiao&&x0<=xida)==0%x0������Ҫ��
%        error('x0����xi��Χ��');
%     else %x0����Ҫ��
     elseif mokuai==21 %����
          chazhao=find(xi>=xc);
          dingwei=chazhao(1);%dingwei�Ǵ���x0�ĵ�һ��λ��
          %dingwei
          if dingwei<=2 %��λ��ǰ���������õ�һ��ֵ����
             y0_1=yi(1);
             y0_2=y0_1;
          else %λ�ں���������������
             x=[xi(dingwei-2),xi(dingwei-1),xi(dingwei)];
          %x
             y=[yi(dingwei-2),yi(dingwei-1),yi(dingwei)];
          %y
             y0_1=chashang(xc,x,y);
             y0_2=y0_1;
          end
       
      elseif mokuai==22 %����
          chazhao=find(xi<=xc);
          dingwei=chazhao(1);%dingwei��С��x0�ĵ�һ��λ��
          %dingwei
          if dingwei<=2 %��λ��ǰ���������õ�һ��ֵ����
             y0_1=yi(1);
             y0_2=y0_1;
          else %λ�ں���������������
             x=[xi(dingwei-2),xi(dingwei-1),xi(dingwei)];
          %x
             y=[yi(dingwei-2),yi(dingwei-1),yi(dingwei)];
          %y
             y0_1=chashang(xc,x,y);
             y0_2=y0_1;
          end
     end
      
%     else %ԭ���е���
%        y0_1=yi(chazhao);
%        y0_2=y0_1;
if y0_1>y0_2 %ת����С
   y0_s(k)=y0_2;
   y0_la(k)=y0_1;
elseif y0_1<y0_2
   y0_s(k)=y0_1;
   y0_la(k)=y0_2;
else
   y0_s(k)=y0_1;
   y0_la(k)=y0_s(k);
end

end%forѭ����
   
end

