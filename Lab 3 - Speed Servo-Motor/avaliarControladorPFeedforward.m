% Avalia o controlador P + feedforward.

%% Configurando parametros da simulacao

tempoSimulacao = 0.2;
requisitos.tau = 0.01;
referencia.amplitude = 50;
referencia.instante = 0;
disturbio.amplitude = 0.2;
disturbio.instante = 0.1;
planta = obterPlantaServo();
controlador = projetarControladorPFeedforward(planta, requisitos);

%% Realizando a simulacao

out = sim('servomotor_p_feedforward');

%% Tracando graficos

% figure;
% plot(out.wMotor.time, out.wMotor.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 w_motor_pfeedforward.png % para usuarios de Word
% print -depsc2 w_motor_pfeedforward.eps; % para usuarios de LaTeX

% figure;
% plot(out.wRoda.time, out.wRoda.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Velocidade da Roda (rad/s)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 w_roda_pfeedforward.png % para usuarios de Word
% print -depsc2 w_roda_pfeedforward.eps; % para usuarios de LaTeX

% figure;
% plot(out.V.time, out.V.signals.values, 'LineWidth', 2);
% xlabel('Tempo (s)', 'FontSize', 14);
% ylabel('Comando (V)', 'FontSize', 14);
% set(gca, 'FontSize', 14);
% grid on;
% % print -dpng -r400 comando_pfeedforward.png % para usuarios de Word
% print -depsc2 comando_pfeedforward.eps; % para usuarios de LaTeX

%% Análises
erroDisturbio = disturbio.amplitude*(planta.R/((planta.Beq*planta.R + planta.Kt*controlador.Kp + planta.Kt^2)*(planta.eta*planta.N^2)));

figure('Renderer', 'opengl'); hold on;
title('Velocidades de saída do sistema (roda e motor)');
yyaxis left; ylim([0 80]);
plot(out.wRoda.time, out.wRoda.signals.values, 'LineWidth', 2);
yline(referencia.amplitude, 'k-');
yline(referencia.amplitude + erroDisturbio, 'k--');
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Velocidade da Roda (rad/s)', 'FontSize', 14);
yyaxis right; ylim([0 240]);
plot(out.wMotor.time, out.wMotor.signals.values, '--', 'LineWidth', 2);
ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
legend('\omega_l', 'r_l - e_R', 'r_l - e_R - e_D', '\omega_m', 'Location', 'southeast');
grid minor;
set(gca, 'FontSize', 14);
print -depsc2 analisewpff.eps;

figure('Renderer', 'opengl'); hold on;
title('Comando de controle (V) do sistema');
yyaxis left;
plot(out.V.time, out.V.signals.values, 'LineWidth', 2);
yline((controlador.Kp + controlador.Kf)*planta.N*referencia.amplitude, 'k--');
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Comando (V)', 'FontSize', 14);
yyaxis right;
plot(out.wMotor.time, out.wMotor.signals.values, 'LineWidth', 2);
ylabel('Velocidade do Motor (rad/s)', 'FontSize', 14);
legend('V', '(K_p + K_f) r_m', '\omega_m', 'Location', 'east');
grid minor;
set(gca, 'FontSize', 14);
% print -depsc2 analiseVpff.eps;