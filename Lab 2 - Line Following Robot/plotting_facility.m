% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outpcf.x.time, outpcf.x.signals.values, 'b', 'LineWidth', 2);
% plot(outpcf.x.time, xr*(1 - exp(-Kx*outpcf.x.time)), 'r--', 'LineWidth', 2);
% xline(tau, 'k--');
% xlabel('Tempo (s)'); ylabel('Posição Horizontal (m)');
% legend('Curva Simulada', 'Curva Teórica', '\tau', 'Interpreter', 'tex', 'Location', 'south');
% title({'Simulação do Controlador Frontal'});
% axis fill;
% 
% print -depsc frontal.eps;