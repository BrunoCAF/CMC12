% Avalia o controlador PI com pre-filtro.

%% Configurando parametros da simulacao

tempoSimulacao = 0.2;
requisitos.tr = 0.02;
requisitos.Mp = 0.046;
referencia.amplitude = 50;
referencia.instante = 0;
disturbio.amplitude = 0.2;
disturbio.instante = 0.1;
planta = obterPlantaServo();
controlador = projetarControladorPI(planta, requisitos);

%% Realizando a simulacao

out = sim('servomotor_pi');

%% Tracando graficos

% figure;
% plot(out.wMotor.time, out.wMotor.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 w_motor_pi.png % para usuarios de Word
% print -depsc2 w_motor_pi.eps % para usuarios de LaTeX
% figure;
% plot(out.wRoda.time, out.wRoda.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Velocidade da Roda (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 w_roda_pi.png % para usuarios de Word
% print -depsc2 w_roda_pi.eps % para usuarios de LaTeX

% figure;
% plot(out.V.time, out.V.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Comando (V)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 comando_pi.png % para usuarios de Word
% print -depsc2 comando_pi.eps % para usuarios de LaTeX

%% Análises

% figure('Renderer', 'opengl'); hold on;
% title('Velocidades de saída do sistema (roda e motor)');
% yyaxis left; 
% plot(out.wRoda.time, out.wRoda.signals.values, 'LineWidth', 2);
% yline(referencia.amplitude, 'k--', 'LineWidth', 1.5);
% yline(referencia.amplitude*(1 + requisitos.Mp), 'g--', 'LineWidth', 1.5);
% xline(requisitos.tr, 'b--', 'LineWidth', 1.5);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Velocidade da Roda (rad/s)', 'FontSize', 14);
% yyaxis right; ylim([0 180]);
% plot(out.wMotor.time, out.wMotor.signals.values, '--', 'LineWidth', 2);
% ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14); legend('\omega_l', 'r_{l,\infty}', '(1+M_p) r_{l,\infty}', 't_r', '\omega_m', 'Location', 'south');
% grid minor;
% print -depsc2 analisewpi.eps % para usuarios de LaTeX

% figure('Renderer', 'opengl'); hold on;
% title('Análise do Comando de controle (V)');
% yyaxis left;
% plot(out.V.time, out.V.signals.values, 'LineWidth', 2);
% comandoP = -controlador.Kp*out.wMotor.signals.values;
% comandoI = out.V.signals.values - comandoP;
% plot(out.V.time, comandoP, 'y--', 'LineWidth', 2);
% plot(out.V.time, comandoI, 'g--', 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Comando (V)', 'FontSize', 14);
% yyaxis right;
% plot(out.wMotor.time, out.wMotor.signals.values, 'LineWidth', 2);
% ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14); legend('V', 'Termo P', 'Termo I', '\omega_m', 'Location', 'southwest');
% grid on;
% print -depsc2 analiseVpi.eps % para usuarios de LaTeX