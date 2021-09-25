function [m, b] = identificarCruiseControl(f, t, v)
% [m, b] = identificaCruiseControl(f, t, v) utiliza identificacao de
% sistemas para determinar parametros da planta do cruise control. Assume
% que foi realizado um experimento com forca constante f com o carro
% comecando em repouso. Nesse experimento, a velocidade do carro foi
% medida nos tempos t (t eh um vetor) e os resultados foram armazenados no
% vetor v. As saidas da funcao sao os parametros da planta: a massa m e o
% fator de amortecimento b.

e = exp(1);
% Implementar identificacao do cruise control

% v(end) ~= f/b, isola b:
b = f/v(end);
% v(tau = m/b) = f/b * (1-1/e), 
% Determina tau comparando a velocidade com v(end)*(1-1/e)
i = sum(v/v(end) <= (1 - 1/e));
% Faz uma interpolação linear bem mais ou menos
tau = (t(i+1)*(v(end)*(1-1/e)-v(i)) + t(i)*(v(i+1)-v(end)*(1-1/e)))/(v(i+1)-v(i));
m = b*tau;

end