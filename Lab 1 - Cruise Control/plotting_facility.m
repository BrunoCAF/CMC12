% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMAa1.v.time, outMAa1.v.signals.values, 'b');
% plot(outMAa2.v.time, outMAa2.v.signals.values, 'r');
% plot(outMAa3.v.time, outMAa3.v.signals.values, 'g');
% 
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend('$v_r = 10$ m/s', '$v_r = 20$ m/s', '$v_r = 30$ m/s', 'Interpreter', 'latex');
% title({'Simulação do Cruise Control em Malha Aberta';'u = b_c\cdot v_r, d = 0'});
% axis fill;
% 
% print -depsc malhaaberta_a.eps;
 
% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMAb.v.time, outMAb.v.signals.values);
% 
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% xline(ts, 'r--');
% legend('$u(t) = \left\{\begin{array}{cl} f_{max} ,& t\le t_s \\ f_r ,& t  > t_s \end{array}\right.$', sprintf('$t_s = $ %.2f s',ts), 'Interpreter', 'latex');
% title({'Simulação do Cruise Control em Malha Aberta';'Estratégia de Tempo Mínimo (f_{max} = 2000 N, v_r = 10 m/s)'});
% 
% axis fill;ylim([0 12.5]);
% 
% print -depsc malhaaberta_b.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMAc1.v.time, outMAc1.v.signals.values, 'b');
% plot(outMAc2.v.time, outMAc2.v.signals.values, 'r');
% plot(outMAc3.v.time, outMAc3.v.signals.values, 'g');
% yline(vr, '--');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend('$d = 100$ N', '$d = 200$ N', '$d = 300$ N', '$v_r$', 'Interpreter', 'latex', 'Location', 'best');
% title({'Simulação do Cruise Control em Malha Aberta';'Com Perturbação (u = b_{c}\cdot v_r, v_r = 10 m/s)'}, 'Interpreter', 'tex');
% axis fill;
% 
% print -depsc malhaaberta_c.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMAd1.v.time, outMAd1.v.signals.values, 'b--');
% plot(outMAd2.v.time, outMAd2.v.signals.values, 'r');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend(sprintf('Sem passageiro ($m = %.2f$ kg)', m-100), sprintf('Com passageiro ($m = %.2f$ kg)', m), 'Interpreter', 'latex', 'Location', 'best');
% title({'Simulação do Cruise Control em Malha Aberta';'Alteração de massa (u = b_{c}\cdot v_r, v_r = 10 m/s, \Delta m = 100 kg)'}, 'Interpreter', 'tex');
% axis fill;
% 
% print -depsc malhaaberta_d.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMAe1.v.time, outMAe1.v.signals.values, 'b--');
% plot(outMAe2.v.time, outMAe2.v.signals.values, 'r');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend(sprintf('Sem desvio ($b = b_c$)'), 'Com desvio ($\Delta b = 10$ N$\cdot$s$/$m)', 'Interpreter', 'latex', 'Location', 'southeast');
% title({'Simulação do Cruise Control em Malha Aberta';'Erro de modelo (u = b_{c}\cdot v_r, v_r = 10 m/s, b-b_{c} = 10 Ns/m)'}, 'Interpreter', 'tex');
% axis fill;
% 
% print -depsc malhaaberta_e.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMFa1.v.time, outMFa1.v.signals.values, 'b');
% plot(outMFa2.v.time, outMFa2.v.signals.values, 'r');
% plot(outMFa3.v.time, outMFa3.v.signals.values, 'g');
% 
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend('$v_r = 10$ m/s', '$v_r = 20$ m/s', '$v_r = 30$ m/s', 'Interpreter', 'latex');
% title({'Simulação do Cruise Control em Malha Fechada';sprintf('u(t) = b_c v_r + K_p e(t), K_p = %.2f Ns/m',Kp)});
% axis fill;
% 
% print -depsc malhafechada_a.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMFb.v.time, outMFb.v.signals.values, 'b');
% plot(outMFa1.v.time, outMFa1.v.signals.values, 'r--');
% yline(vr, 'k-.');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend('$v(t)$ sem feedforward', '$v(t)$ com feedforward', '$v_r$', 'Interpreter', 'latex');
% title({'Simulação do Cruise Control em Malha Fechada';sprintf('Papel do feedforward (u(t) = K_p e(t), K_p = %.2f Ns/m)',Kp)});
% axis fill; ylim([0 12.5]);
% 
% print -depsc malhafechada_b.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMFc1.v.time, outMFc1.v.signals.values, 'b');
% plot(outMFc2.v.time, outMFc2.v.signals.values, 'r');
% plot(outMFc3.v.time, outMFc3.v.signals.values, 'g');
% yline(vr, 'k--');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend('$d = 100$ N', '$d = 200$ N', '$d = 300$ N', '$v_r$', 'Interpreter', 'latex', 'Location', 'southeast');
% title({'Simulação do Cruise Control em Malha Fechada';sprintf('Com Perturbação (u(t) = b_c v_r + K_p e(t), K_p = %.2f Ns/m)',Kp)}, 'Interpreter', 'tex');
% axis fill;
% 
% print -depsc malhafechada_c.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% plot(outMFd1.v.time, outMFd1.v.signals.values, 'b--');
% plot(outMFd2.v.time, outMFd2.v.signals.values, 'r');
% xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
% legend(sprintf('Sem desvio ($b = b_c$)'), 'Com desvio ($\Delta b = 10$ N$\cdot$s$/$m)', 'Interpreter', 'latex', 'Location', 'southeast');
% title({'Simulação do Cruise Control em Malha Fechada';sprintf('Erro de Modelo (u(t) = b_c v_r + K_p e(t), K_p = %.2f Ns/m)',Kp)}, 'Interpreter', 'tex');
% axis fill;
% 
% print -depsc malhafechada_d.eps;

% figure('Renderer', 'opengl');
% hold on;
% grid on; grid minor;
% xlabel('Tempo (s)');
% yyaxis left; ylabel('Velocidade - v(t) (m/s)'); ylim([0 12.5]);
% yyaxis right; ylabel('Esforço de Controle - u(t) (N)'); ylim([0 2500]);
% yyaxis left; plot(outMFe.v.time, outMFe.v.signals.values, 'b-');
% yyaxis right;plot(outMFe.u.time, outMFe.u.signals.values, 'r-');
% yyaxis left; plot(outMAb.v.time, outMAb.v.signals.values, 'b--');
% yyaxis right;plot(       u.time,        u.signals.values, 'r--');
% xline(ts, 'k-.'); 
% leguMF = strcat(sprintf('$u(t) = b_c v_r + K_p e(t)$, $K_p =$ %.2f N ', Kp), '$\cdot$s/m');
% leguMA = strcat('$u(t) = \left\{\begin{array}{cl} f_{max} ,& t\le t_s \\ f_r ,& t  > t_s \end{array}\right.,~ f_{max} =$', sprintf(' %.f N', fmax));
% legend('Saida Malha Fechada', leguMF, 'Saida Malha Aberta', leguMA, sprintf('$t_s = $%.2f s', ts), 'Interpreter', 'latex', 'Location', 'east');
% title({'Simulação do Cruise Control e Comparação do Esforço de Controle';'Estratégia de Tempo Mínimo em Malha Aberta x Malha Fechada feedforward+P'}, 'Interpreter', 'tex', 'FontSize', 9);
% axis fill;
% 
% print -depsc malhafechada_e.eps;