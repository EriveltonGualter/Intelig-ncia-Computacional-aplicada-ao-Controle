function [filho1,filho2] = crossoverTSP(Individuo1,Individuo2)
    
tamanho = length(Individuo1);
filho1=zeros(tamanho,1);
filho2=zeros(tamanho,1);

padrao = rand(tamanho,1)>.5;

filho1(padrao)=Individuo1(padrao);
filho2(~padrao)=Individuo2(~padrao);

el1=Individuo1(~padrao);
el2=Individuo2(padrao);

filho1(~padrao)=el1(randperm(length(el1)));
filho2(padrao)=el2(randperm(length(el2)));


end