function r = roleta(Aptidao, n)
    y = zeros(length(n),1);
    
    for i=1:length(Aptidao)
        if(i == 1)
            min(i) = 0;
            max(i) = Aptidao(i);
        else
            min(i) = max(i-1);
            max(i) = min(i)+Aptidao(i);
        end
    end
    
    rodada=(max(n)).*rand(1,n);
    for i= 1:length(rodada)
        for j=1:n
            if (rodada(i)>=min(j) && rodada(i)<=max(j))
                y(i) = j;
            end
        end
    end
    
    r = y;
end
