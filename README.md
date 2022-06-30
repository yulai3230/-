# 模拟退火算法

------
Simulated Annealing

###代码

```matlab
function Simulated_Annealing()
%Simulated Annealing 
% 生成初始解，求函数F(x) =5 sin(2x) + 3cos(3x)+sqrt(x)在[0,20]上的最大值
solve1=1;
solve3=1;
x=linspace(0,20,5000);
plot(x,F(x));
title('f(x) =5 sin(2x) + 3cos(3x)+sqrt(x) 模拟退火算法求最大值')
hold on

% 初始化温度
T=1000;
CT=0.9999;

% [-20,20]的随机干扰,局部对比并保存全局最优解solve3，退火循环

while T>=eps
    for n=1:1000
        
        %对初始解进行扰动，得到solve2
        solve2=solve1+40*rand-20;
        
        if(solve2>=0&&solve2<=20);
            if(F(solve2)>F(solve1))
                solve1=solve2;
                if(F(solve2)>F(solve3))
                    solve3=solve2;
                end
            else
                %Metropolis接收准则
                if(rand<exp(-(F(solve2)-F(solve1)/T))) 
                    solve1=solve2;
                    if(F(solve2)>F(solve3))
                        solve3=solve2
                    end
                end
            end
        end
        T=T*CT; %退火
    end
end
text(solve3,F(solve3),'\leftarrow 函数最大值')
disp(['函数最大值的点: ',num2str(solve3),',',num2str(F(solve3))])
end

%定义函数F（x）
function F=F(x)
F=5*sin(2*x)+8*cos(3*x)+sqrt(x);
end
```



![SA](https://raw.githubusercontent.com/yulai3230/-/main/images/SA.jpg)

