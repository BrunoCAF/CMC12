function [Ga, Gf] = obterMalhaPosicao(controladorPosicao, controladorCorrente, planta)
% [Ga, Gf] = obterMalhaPosicao(controladorPosicao, controladorCorrente,
% planta) obtem as malhas aberta Ga e fechada Gf do servomotor de posicao.
% A struct controladorPosicao eh dada por:
% controladorPosicao.Kp: ganho proporcional do controlador de posicao.
% controladorPosicao.Kd: ganho derivativo do controlador de posicao.
% controladorPosicao.a: frequencia de corte do filtro do termo derivativo.
% controladorPosicao.T: periodo de amostragem do controlador de posicao.
% A struct controladorCorrente eh dada por:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: tempo de amostragem do controlador de corrente.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().

s = tf('s');

Kp = controladorPosicao.Kp;
Kd = controladorPosicao.Kd;
a = controladorPosicao.a;
Tp = controladorPosicao.T;

K = controladorCorrente.K;
alpha = controladorCorrente.alpha;
Tl = controladorCorrente.Tl;
Tc = controladorCorrente.T;

Kt = planta.Kt;
Jeq = planta.Jeq;
Beq = planta.Beq;
L = planta.L;
R = planta.R;
N = planta.N;
eta = planta.eta;

% Implementar

Cc = (K/s) * (Tl*s + 1)/(alpha*Tl*s + 1);
[N_c, D_c] = pade(Tc/2, 2);
Nc = tf(N_c, 1); Dc = tf(D_c, 1);
Gc = 1/(L*s + R);

Cp = Kp + Kd*s*a/(s+a);
[Np, Dp] = pade(Tp/2, 2);
Ap = tf(Np, Dp);
Gp = 1/(Jeq*s + Beq);

Ga = (N*eta*Kt*Gc*Nc*Cc*Gp*Ap*Cp)/(s*Dc + N^2*eta*Kt^2*Gp*Gc*s*Dc + Gc*Nc*Cc*s);
Ga = minreal(Ga);
Gf = minreal(feedback(Ga, 1));

end