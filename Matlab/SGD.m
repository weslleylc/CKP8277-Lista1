clc
clear all
%Carregando os dados
dataset=load('ex1data1.txt')
%Carregando a vari�vel dependente
x=dataset(:,1);
%Carregando a vari�vel independente
y=dataset(:,2);
%Scattper plot
figure
plot(x,y,'*')
title('Gr�fico de dispers�o y contra x')

[l c]=size(x)

%%Concatenando com o intercpet
x=[ones(l,1) x]

alfa= 0.001;
epocas=1000;
w=rand(2,1)

eqm=zeros(1,epocas)

for i=1:epocas,
    idx = randperm(l);
	x = x(idx,:);
	y = y(idx);
    sum_eqm=0;
    for j=1:l,
        y_h = x(j,:)*w;
		erro = y(j) - y_h;
        sum_eqm=sum_eqm+erro*erro;
		w(1) = w(1) + alfa*erro;
        w(2) = w(2) + alfa*erro*x(j,2);
    end
    eqm(i)=sum_eqm/l;
end

figure
plot(x(:,2),y,'*')
hold on
plot(x(:,2),x*w,'-')
hold off
title('Reta de regress�o ajustada')

figure
plot(1:epocas,eqm)
title('Erro quadratico m�dio por epocas')

figure
plot(y,x*w,'*')
hold on
plot(y,y,'r-')
title('Rela��o de y com y_hat')

figure
plot(x(:,2),y-x*w,'*')
title('Rela��o dos erros contra x')



