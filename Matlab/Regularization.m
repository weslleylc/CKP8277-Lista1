clc
clear all
close all
%Carregando os dados
dataset=load('ex1data3.txt')
%Carregando a variável dependente
x=dataset(:,1:5);
%Carregando a variável independente
y=dataset(:,6);


[linhas colunas]=size(x);

%Concatenando com o intercpet
x=[ones(linhas,1) x];

x_treino=x(1:30,:)
y_treino=y(1:30,:)

x_teste=x(31:end,:)
y_teste=y(31:end,:)

eqm_treino=zeros(1,colunas+1);
eqm_treste=zeros(1,colunas+1);

lambda=[0 1 2 3 4 5]

for i=1:6,
    reg=eye(colunas+1);
    reg(1,1)=0;
    w{i}=pinv(x_treino'*x_treino+lambda(i)*reg)*x_treino'*y_treino;
    eqm_treino(i)=sum((y_treino'-w{i}'*x_treino').^2)/30;
    eqm_teste(i)=sum((y_teste'-w{i}'*x_teste').^2)/17;
end
norm_w=zeros(1,6);
for i=1:6,
    norm_w(i)=norm(w{i})
end


figure
plot(1:6,norm_w)
title('Norma do vetor de pesos')

figure
plot(1:6,eqm_treino)
title('Erro quadratico médio por epocas para o treino')

figure
plot(1:6,eqm_teste)
title('Erro quadratico médio por epocas para o teste')





