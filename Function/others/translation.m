function array_after = translation(array,direction)
%  �����������������λһ����λ
%  @ array: ��������
%  @ direction: ������λ����
%           - 'right'<defult>: ���ƣ�ȱʡֵ��
%           - 'left': ����

if nargin == 1
    direction = 'right';
end

switch direction
    case 'right'
        array_after = [array(end),array(1:end-1)];
    case 'left'
        array_after = [array(2:end),array(1)];
end
end

