function [Ga, Gf] = obterMalhaCorrente(controlador, planta)
% [Ga, Gf] = obterMalhaCorrente(controlador, planta) obtem as funcoes de 
% transferencia de malha aberta Ga e fechada Gf da malha de corrente.
% A struct controlador eh dada por:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().

s = tf('s');

K = controlador.K;
alpha = controlador.alpha;
Tl = controlador.Tl;
T = controlador.T;

R = planta.R;
L = planta.L;

% Implementar

C_c = K * (Tl*s + 1)/(s*(alpha*Tl*s + 1));
G_c = 1/(L*s + R);
[num, den] = pade(T/2, 2);
A_c = tf(num, den);

Ga = minreal(G_c * A_c * C_c);
Gf = minreal(feedback(Ga, 1));

end