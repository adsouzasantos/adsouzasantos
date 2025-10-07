// ============================================================================
// Instituto Federal da Paraíba – Campus Cajazeiras
// Coordenação do Bacharelado em Engenharia de Controle e Automação
// Disciplina: Máquinas Elétricas
// Professor: Gerônimo Barbosa Alexandre
// Alunos: Anderson de Souza Santos
// ============================================================================

// Dados de entrada (tempo em horas, demanda em kW e kVar)
tempo = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];
demanda_ativa = [8.2, 8.2, 8.2, 1447.8, 1815.2, 1815.2, 1815.2, 1502.6, 1815.2, 1686.7, 328.8, 320.8, 320.8];
demanda_reativa = [1.7, 1.7, 1.7, 1028.4, 1281.3, 1281.3, 1281.3, 1096.3, 1281.3, 1193.6, 187.2, 187.2, 187.2];

// Criar vetores para plot estilo "step"
tempo_degrau = [];
demanda_ativa_degrau = [];
demanda_reativa_degrau = [];

for i = 1:length(tempo)-1
    tempo_degrau = [tempo_degrau, tempo(i), tempo(i+1)];
    demanda_ativa_degrau = [demanda_ativa_degrau, demanda_ativa(i), demanda_ativa(i)];
    demanda_reativa_degrau = [demanda_reativa_degrau, demanda_reativa(i), demanda_reativa(i)];
end

// Plotar curvas separadamente para habilitar título e labels corretamente
scf(0);
plot(tempo_degrau, demanda_ativa_degrau, "r-", "LineWidth", 2);
plot(tempo_degrau, demanda_reativa_degrau, "g-", "LineWidth", 2);

// Adicionar legenda no canto superior esquerdo
legend(["Demanda Ativa (kW)", "Demanda Reativa (kVar)"], "in_upper_left");

// Configurar título e rótulos dos eixos
xlabel("Tempo (horas)");
ylabel("Demanda (kW / kVar)");
title("Curvas de Demanda Ativa e Reativa");

// Ajustar limites do gráfico
xlim([0, 24]);
ylim([0, 2000]);

// Ativar grade nos dois eixos
xgrid();
ygrid();
