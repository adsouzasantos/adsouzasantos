// --- Dados experimentais ---
f_exp = [1.0,3,5,7,8,8.5,8.8,9,9.2,9.3,9.4,9.6,10,11,12,15,20];
phi_exp = [-68,-40,-20.34,1.53,12.03,18.59,22.70,22.57,23.72,25.75,26.35,28.03,32.15,39.41,42.35,59.70,70.35];
G_exp = [0.035,0.079,0.106,0.122,0.124,0.124,0.123,0.121,0.121,0.120,0.120,0.118,0.116,0.108,0.099,0.080,0.040];

// --- Parâmetros do circuito ---
R = 10000; C = 209e-9; L = 20e-3; RL = 10000;
f = linspace(1,20,200); 
w = 2*%pi*f*1e3;

// --- Defasagem simulada ---
Z1 = R + 1 ./ (1 ./ (%i*w*L) + 1./RL); // Ramo L+RL
Z = Z1 + 1 ./ (%i*w*C);
phi_sim = atan(imag(Z)./real(Z)) * 180 / %pi;

// --- Defasagem ideal (RL=0) ---
Z_ideal = R + %i*w*L + 1./(%i*w*C);
phi_ideal = atan(imag(Z_ideal)./real(Z_ideal)) * 180 / %pi;

// Ajuste para [-180,180]
phi_sim = phi_sim - 360*(phi_sim>180);
phi_ideal = phi_ideal - 360*(phi_ideal>180);

// --- Figura 1: Defasagem ---
scf(1); // abre janela 1
clf();
plot(f, phi_sim,'b-','LineWidth',2);
plot(f, phi_ideal,'r--','LineWidth',2);
plot(f_exp, phi_exp,'go','MarkerSize',5);
xlabel('Frequência (kHz)');
ylabel('Fase (°)');
title('Resposta em frequência (defasagem)');
legend('Simulação RL=10 kΩ','Ideal RL=0','Experimental','Location','best');
grid on;

// Destaques visuais
xstring(2, -80, 'Baixa freq: \phi ideal \approx -90°');
xpoly([1.5 2],[-70 -80],'lines',1);
xstring(9, 5, 'Transição mais acentuada sem RL');
xpoly([9 9],[-20 0],'lines',1);

// --- Figura 2: Módulo do ganho experimental ---
scf(2); // abre janela 2
clf();
plot(f_exp, G_exp,'ro-','LineWidth',2,'MarkerSize',5);
xlabel('Frequência (kHz)');
ylabel('|G(f)|');
title('Resposta em frequência (módulo do ganho)');
grid on;
