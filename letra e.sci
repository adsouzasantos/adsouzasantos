// ============================================================================
// Instituto Federal da Paraíba – Campus Cajazeiras
// Coordenação do Bacharelado em Engenharia de Controle e Automação
// Disciplina: Máquinas Elétricas
// Professor: Gerônimo Barbosa Alexandre
// Alunos: Anderson de Souza Santos, Hiarley Alves Rodrigues
// ============================================================================

// Dados experimentais da Tabela 3
f = [1.0, 3, 5, 7, 8, 8.5, 8.8, 9, 9.2, 9.3, 9.4, 9.6, 10, 11, 12, 15, 20] * 1000; // Frequência em Hz
Ve = [7, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1]; // Ve (CH1) em VRMS
Vs = [0.25, 0.563, 0.7575, 0.8723, 0.8865, 0.8814, 0.8743, 0.8683, 0.8616, 0.8586, 0.8537, 0.8443, 0.8258, 0.7683, 0.7061, 0.5731, 0.3523]; // Vs (CH2) em VRMS
phase = [-68, -40, -20.34, 1.53, 12.03, 18.59, 22.70, 22.57, 23.72, 25.75, 26.35, 28.03, 32.15, 39.41, 42.35, 59.70, 70.35]; // Fase em graus

// Cálculo do ganho |G(f)|
G = Vs ./ Ve;

// Plot do ganho |G(f)| em função da frequência
scf(1);
plot(f/1000, G, '-o');
xlabel('Frequência (kHz)');
ylabel('Ganho |G(f)|');
//title('Ganho |G(f)| em função da frequência');
xgrid();

// Plot da fase em função da frequência
scf(2);
plot(f/1000, phase, '-o');
xlabel('Frequência (kHz)');
ylabel('Fase (graus)');
//title('Fase em função da frequência');
xgrid();
