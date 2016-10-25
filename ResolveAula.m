%código exemplo
clearvars
clc

%% Prepara ambiente
load mapa20;
cidades = max(mapa(:,1));
local=mapa(:,2:3);



%define paramentros do GA
Pop_size = 10;
%TODO --> outros parametros


%calcula a distancia entre as cidades
distances = zeros(cidades);
for i=1:cidades,
    for j=1:i,
        x1 = local(i,1);
        y1 = local(i,2);
        x2 = local(j,1);
        y2 = local(j,2);
        distances(i,j)=sqrt((x1-x2)^2+(y1-y2)^2);
        distances(j,i)=distances(i,j);
    end;
end;

FitnessFcn = @(x) traveling_salesman_fitness(x,distances);

%% IMPLEMENTACAO GA

%gera populacao inicial aleatoria
for i=1:Pop_size
    Populacao{i} = randperm(cidades)';
end

%calcula aptidao da populacao
FitnessFcn(Populacao');

%seleciona os melhores individuos
%TO DO - usar selecao por roleta

%exemplo de como gerar crossover de dois individuos
[filho1,filho2] = crossoverTSP(Populacao{randi(Pop_size)},Populacao{randi(Pop_size)});

%exemplo de como fazer a mutacao em um individuo
mutado = mutacaoTSP(Populacao{randi(Pop_size)});




