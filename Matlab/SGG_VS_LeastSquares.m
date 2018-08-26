clc
clear all
%Carregando os dados
dataset=load('Matlab/ex1data2.txt')
%Carregando a variável dependente
x=dataset(:,1:2);
%Carregando a variável independente
y=dataset(:,3);
%Scattper plot

[l c]=size(x)

%%Concatenando com o intercpet
x=[ones(l,1) x]

alfa= 0.01;
epocas=100;
w=rand(3,1)

eqm=zeros(1,epocas);

for i=1:epocas,
    idx = randperm(l);
	x = x(idx,:);
	y = y(idx);
    sum_eqm=0;
    for j=1:l,
        y_h = x(j,:)*w;
		erro = y(j) - y_h;
        sum_eqm=sum_eqm+(y(j) - y_h)^2;
        w = w + alfa*erro*x(j,:)';
    end
    eqm(i)=sum_eqm/l;
end
w
figure
plot(1:epocas,eqm)
title('Erro quadratico médio por epocas')


%Mínimos quadrados
w_m=pinv(x'*x)*x'*y

