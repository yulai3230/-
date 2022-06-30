function Simulated_Annealing()
%Simulated Annealing 
% ���ɳ�ʼ�⣬����F(x) =5 sin(2x) + 3cos(3x)+sqrt(x)��[0,20]�ϵ����ֵ
solve1=1;
solve3=1;
x=linspace(0,20,5000);
plot(x,F(x));
title('f(x) =5 sin(2x) + 3cos(3x)+sqrt(x) ģ���˻��㷨�����ֵ')
hold on

% ��ʼ���¶�
T=1000;
CT=0.9999;

% [-20,20]���������,�ֲ��ԱȲ�����ȫ�����Ž�solve3���˻�ѭ��

while T>=eps
    for n=1:1000
        
        %�Գ�ʼ������Ŷ����õ�solve2
        solve2=solve1+40*rand-20;
        
        if(solve2>=0&&solve2<=20);
            if(F(solve2)>F(solve1))
                solve1=solve2;
                if(F(solve2)>F(solve3))
                    solve3=solve2;
                end
            else
                %Metropolis����׼��
                if(rand<exp(-(F(solve2)-F(solve1)/T))) 
                    solve1=solve2;
                    if(F(solve2)>F(solve3))
                        solve3=solve2
                    end
                end
            end
        end
        T=T*CT; %�˻�
    end
end
text(solve3,F(solve3),'\leftarrow �������ֵ')
disp(['�������ֵ�ĵ�: ',num2str(solve3),',',num2str(F(solve3))])
end

%���庯��F��x��
function F=F(x)
F=5*sin(2*x)+8*cos(3*x)+sqrt(x);
end

