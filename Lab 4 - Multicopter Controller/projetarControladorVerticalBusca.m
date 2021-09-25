function controlador = projetarControladorVerticalBusca(requisitos, planta)
% controlador = projetarControladorVerticalBusca(requisitos, planta) 
% projeta o controlador vertical com um refinamento atraves de busca em 
% grade para um melhor atendimento aos requisitos. As entradas da funcao 
% sao as structs requisitos e planta, que contem os requisitos e os 
% parametros da planta, respectivamente. Os requisitos sao:
% requisitos.tr: tempo de subidade de 0 a 100%.
% requisitos.Mp: sobressinal.
% A planta eh dada por:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida da funcao eh a struct controlador com:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.

% Numero de valores de cada parametro usados na grade
N = 20;

% Gerando os valores na grade
trs = linspace(0.8 * requisitosX.tr, 1.2 * requisitosX.tr, N);
Mps = linspace(0.8 * requisitosX.Mp, 1.2 * requisitosX.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

% controlador.Kp = ...;
% controlador.Ki = ...;
% controlador.Kd = ...;

end