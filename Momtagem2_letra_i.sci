// ============================================================================
// Instituto Federal da Paraíba – Campus Cajazeiras
// Coordenação do Bacharelado em Engenharia de Controle e Automação
// Disciplina: Máquinas Elétricas
// Professor: Gerônimo Barbosa Alexandre
// Alunos: Anderson de Souza Santos, Hiarley Alves Rodrigues
// ============================================================================

// --- Dados experimentais ---
f_exp = [1.0,3,5,7,8,8.5,8.8,9,9.2,9.3,9.4,9.6,10,11,12,15,20]; // kHz
phi_exp = [-68,-40,-20.34,1.53,12.03,18.59,22.70,22.57,23.72,25.75,26.35,28.03,32.15,39.41,42.35,59.70,70.35];
G_exp = [0.035,0.079,0.106,0.122,0.124,0.124,0.123,0.121,0.121,0.120,0.120,0.118,0.116,0.108,0.099,0.080,0.040];

// --- Parâmetros do circuito ---
R = 10000; 
C = 209e-9; 
L = 20e-3; 
RL = 10000;
f_sim = linspace(1,20,200); 
w = 2*%pi*f_sim*1e3;

// --- Defasagem simulada ---
Z1 = R + 1 ./ (1 ./ (%i*w*L) + 1./RL);
Z = Z1 + 1 ./ (%i*w*C);
phi_sim = atan(imag(Z)./real(Z)) * 180 / %pi;

// --- Defasagem ideal (RL=0) ---
Z_ideal = R + %i*w*L + 1./(%i*w*C);
phi_ideal = atan(imag(Z_ideal)./real(Z_ideal)) * 180 / %pi;

// Ajuste [-180,180]
phi_sim = phi_sim - 360*(phi_sim>180);
phi_ideal = phi_ideal - 360*(phi_ideal>180);

// --- FIGURA 1: Defasagem (Simulação RL=10 kΩ) ---
scf(1); // janela 1
clf();
plot(f_sim, phi_sim, '-ob');
xlabel('Frequência (kHz)');
ylabel('Fase (°)');
title('Resposta em frequência (defasagem) - Simulação RL=10 kΩ');
xgrid();

// --- FIGURA 2: Defasagem ideal (RL=0) e experimental ---
scf(2); // janela 2
clf();
plot(f_sim, phi_ideal, '-ob');   // Curva ideal (azul)
plot(f_exp, phi_exp, 'ro');      // Pontos experimentais (vermelho)
xlabel('Frequência (kHz)');
ylabel('Fase (°)');
title('Resposta em frequência (defasagem) - Ideal RL=0 vs Experimental');
legend(["Ideal (RL=0)", "Experimental"], "in_upper_left");
xgrid();

// --- FIGURA 3: Módulo do ganho experimental ---
scf(3); // janela 3
clf();
plot(f_exp, G_exp, '-o');
xlabel('Frequência (kHz)');
ylabel('|G(f)|');
title('Resposta em frequência (módulo do ganho experimental)');
xgrid();
