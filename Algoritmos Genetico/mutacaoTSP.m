function mutado = mutacaoTSP(Individuo)
    
tamanho = length(Individuo);

posicao=randi(tamanho,2,1);

mutado = Individuo;

mutado(posicao(1)) = Individuo(posicao(2));
mutado(posicao(2)) = Individuo(posicao(1));

end