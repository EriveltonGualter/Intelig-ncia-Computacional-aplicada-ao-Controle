clearvars
clc

% Carrega mapa
load('mapa100.mat')
cidades = max(mapa(:,1));
local   = mapa(:,2:3);

% Parametros
Pop_size    = 10;
taxa_cross  = .5;
taxa_mutacao= .03;

% Distancia entre cidades 
distances = zeros(cidades);
for i=1:cidades
    for j=1:i
        x1 = local(i,1);
        y1 = local(i,2);
        x2 = local(j,1);
        y2 = local(j,2);
        
        distances(i,j)=sqrt((x1-x2)^2+(y1-y2)^2);
        distances(j,i)=distances(i,j);
    end;
end;

FitnessFcn = @(x) traveling_salesman_fitness(x,distances);

%% GA
for i=1:Pop_size
    Populacao{i} = randperm(cidades)';
end

Geracao=0
while(Geracao <= 20000)
    %calcula aptidão
    Aptidao=FitnessFcn(Populacao');
   
    %seleciona os melhores individuos
    index=roleta(1./(Aptidao/sum(Aptidao)),Pop_size);
    selecao=Populacao(index);

    %Elitismo
    [e,index2]= min(Aptidao);
    elite=Populacao{index2};
    
    %crossover
    for i=1:2:Pop_size-1
        chance_cross= rand(1,1);
        if(chance_cross<=taxa_cross)
        [filho1,filho2] = crossoverTSP(selecao{i},selecao{i+1});

        %mutação
        chance_mutacao1= rand(1,1);
        chance_mutacao2= rand(1,1);

            if(chance_mutacao1<=taxa_mutacao)
                filho1=mutacaoTSP(filho1);
            end

            if(chance_mutacao2<=taxa_mutacao)
                filho2=mutacaoTSP(filho2);
            end
            
        filhos{i}=filho1;
        filhos{i+1}=filho2;
        
        else
            filhos{i}=selecao{i};
            filhos{i+1}=selecao{i+1};
        end
    end

    Populacao=filhos;
    Populacao{Pop_size}=elite;
    Geracao=Geracao+1;
    melhor(Geracao)=min(Aptidao);
end

plot(melhor)
AF = FitnessFcn(Populacao');
disp('Melhor Indivíduo')

[m, index4] = min(AF);
melhor_ind  = Populacao{index4}
menor_dist  = AF(index4)

