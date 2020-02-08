function fi = real_angle_degree(motor_angle_degree)

% ��� ������� ��������� �� ���� OLO1 = sdvig
% ����� ��������� ����� LO

%����
%���� �������� ������ ���������
fi1 = motor_angle_degree;
%������ ����� ��������� ������������
H = 181;
%������ ��� ���������
h = 58.6;
%���������� �� �������� ��� �������� ����� �� �������� ��� ������
dX = 375;
L0 = ( (H - h)^2 + (dX)^2)^(1/2);

%����� ������������
L3 = 424;
%����� ������ ��������
L2 = 122;
%����� ������ �� ���� ���������
L1 = 42;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% from OABL:
% L0 + L1 * cos(fi1) + L2 * cos(fi2) = L3 * cos(fi3);
% L1 * sin(fi1) + L2 * sin(fi2) = L3 * sin(fi3);

%from OAL:
% L0 + L1 * cos(fi1) + S * cos(fiS) = 0;
% L1 * sin(fi1) + S * sin(fiS) = 0;

fiS = atand( (L1 * sind(fi1))/(L0 + L1 * cosd(fi1)) );
S = (L1 * sind(fi1))/(sind(fiS));
%from ABL:
fi2s = acosd((L2^2 + S^2 - L3^2)/(2 * S * L2));
fi3s = acosd((L3^2 + S^2 - L2^2)/(2 * S * L3));

fi2 = 180 - (fi2s - fiS);
fi3 = fiS + fi3s;

sdvig = atand((H-h)/dX);
%�����
% ���� ������� ������������
real_fi3 = fi3 - sdvig;
fi = real_fi3
%�������
end
