function gp(x0)
%灰色预测
    n=length(x0);
    lamda=x0(1:n-1)./x0(2:n);
    range=minmax(lamda);%同时求出最小值和最大值,用于判断是否能用灰度预测模型
    x1=cumsum(x0);
    for i=2:n
        z(i)=0.5*(x1(i)+x1(i-1));
    end
    B=[-z(2:n)',ones(n-1,1)];
    Y=x0(2:n)';
    u=B\Y;
    x=dsolve('Dx+a*x=b','x(0)=x0');
    x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
    yuce1=subs(x,'t',[0:n-1]);
    yy=double(yuce1);
    digits(6),y=vpa(x); %为提高预测精度，先计算预测值，再显示微分方程的解
    yuce=[x0(1),diff(yy)];
    epsilon=x0-yuce; %计算残差
    delta=abs(epsilon./x0); %计算相对误差
    rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda; %计算级比偏差值
end
