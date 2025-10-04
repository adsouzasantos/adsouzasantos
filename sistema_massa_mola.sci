clc();              // Limpa a área de trabalho
clear();            // Limpa variáveis da memória
close(winsid());    // Fecha todas as janelas de gráficos

s = poly(0, "s");   // Define a variável de Laplace corretamente
M = 5;
fv = 4;
K = 5;              // Constante
num = K;
den = K * (M * s^2 + fv * s + K) - K^2;  // Denominador ajustado

G1 = num / den;
G = syslin("c", G1);  // Sistema contínuo

G2=s*G

t_inicial = 0;
t_final = 20;
t_incremento = 1e-3;
t = t_inicial:t_incremento:t_final;

x1 = csim("step", t, G);  // Simulação da resposta ao degrau
v=csim("step", t, G2)
scf(1)
subplot(2, 1, 1);
plot(t, x1);
xtitle("Deslocamento do corpo")
xgrid();   

subplot(2, 1, 2);
plot(t, v, 'r');
xtitle("Velocidade do corpo")
xgrid();                 
              
