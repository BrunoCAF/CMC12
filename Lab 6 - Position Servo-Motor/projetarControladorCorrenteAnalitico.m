function controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% projeta o controlador de corrente atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.

controlador.T = 1.0 / requisitos.fs;

% Implementar

K = sqrt(planta.R^2 + 2 * planta.L^2 * requisitos.wb^2);
K = K - planta.L * requisitos.wb;
K = requisitos.wb * K; 
controlador.K = K;

wcp = sqrt((sqrt(K^2 + (planta.R^2/(2 * planta.L))^2) - planta.R^2/(2 * planta.L))/(planta.L));
phimax = requisitos.PM + atand(planta.L * wcp / planta.R) - 90;

controlador.alpha = (1 - sind(phimax))/(1 + sind(phimax));
controlador.Tl = 1/(wcp * sqrt(controlador.alpha));


end