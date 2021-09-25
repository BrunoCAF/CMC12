function controlador = projetarControladorPosicaoAnalitico(requisitos, planta)
% controlador = projetarControladorPosicaoAnalitico(requisitos, planta)
% projeta o controlador de posicao atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.Kp: ganho proporcional do controlador de posicao.
% controlador.Kd: ganho derivativo do controlador de posicao.
% controlador.a: frequencia de corte do filtro do termo derivativo.
% controlador.T: periodo de amostragem do controlador de posicao.

controlador.T = 1.0 / requisitos.fs;

% Implementar

xireq = requisitos.PM/100;
wnreq = requisitos.wb/sqrt(1 - 2*xireq^2 + sqrt(4*xireq^4 - 4*xireq^2 + 2));

controlador.Kp = planta.Jeq* wnreq^2 / (planta.N * planta.eta * planta.Kt);

controlador.Kd = (planta.Jeq*2*xireq*wnreq - planta.Beq) / (planta.N * planta.eta * planta.Kt);

controlador.a = 10*requisitos.wb;

end