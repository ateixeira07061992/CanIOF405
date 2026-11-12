# CanIOF405 — notas do projeto

## 1. O que é
Expansor de entradas e saídas por CAN para a ECU epicEFI. A ECU lê as entradas da placa como "CAN Analog Inputs"
e comanda as saídas por tramas CAN; a placa também pode decidir sozinha, com tabelas 8×8 que usam os seus sensores
ou os valores que a ECU difunde (RPM, MAP, CLT...).

| Recurso | Quantidade | Notas |
|---|---|---|
| Analógicas 0–5 V | 8 | linear, termístor, curva, interruptor, tensão bruta |
| EGT termopar K | 6 no firmware, **4 montadas** | AD8497, sem SPI nem multiplexador |
| Frequência / sensores digitais | 5 | Hz, velocidade, RPM, flex, duty, contador, Hella nível de óleo, Hella P+T, SENT |
| Entradas digitais | 4 | |
| Saídas PWM lado baixo | 6 | NCV8402 |
| Saídas on/off lado alto | 4 | BTS428L2 |
| Ponte H | 1 | TLE9201SG: wastegate eletrónica **ou** bypass do compressor |
| CAN | 1 | TJA1051T/3 |
| USB | 1 | TunerStudio |
| Série | 1 | módulo Bluetooth (ainda sem header no esquema) |

## 2. Pinos do MCU

| Função | Pinos | Periférico |
|---|---|---|
| EGT1–6 | PA0–PA5 | ADC1 IN0–5 |
| AN1, AN2 | PA6, PA7 | ADC1 IN6, IN7 |
| AN3–AN8 | PC0–PC5 | ADC1 IN10–15 |
| Monitor 5 V sensores | PB0 | ADC1 IN8 |
| Monitor bateria | PB1 | ADC1 IN9 |
| FREQ1–4 | PA15, PB3, PB10, PB11 | TIM2 CH1–4 (AF1), captura a 4 MHz |
| FREQ5 | PA8 | TIM1 CH1 |
| DI1–4 | PC13, PD2, PB12, PB4 | GPIO |
| PWM1–4 | PC6–PC9 | TIM3 (AF2) |
| PWM5, PWM6 | PB6, PB7 | TIM4 (AF2) |
| OUT7–10 | PB5, PA9, PA10, PC12 | GPIO |
| Ponte H: PWM, DIR, DIS | PB14, PB15, PB13 | TIM12 CH1 (AF9); DIS alto = ponte desligada |
| CAN RX, TX | PB8, PB9 | CAN1 (AF9) |
| Série TX, RX | PC10, PC11 | UART4 (AF8) |
| USB | PA11, PA12 | OTG FS, sem deteção de VBUS |
| SWD | PA13, PA14 | |
| LED | PB2 | devagar = a correr; depressa = falha ou erro de configuração |

Não há pinos livres. O ADC usa os 16 canais regulares, por isso a temperatura do MCU não é medida (mostra 0).
Cristal de 8 MHz, PLL a 168 MHz, tick do sistema no TIM5.

## 3. Conectores (caixa tipo Dropbear, 2 × Sicma 24 vias)

**J1 preto — potência**

| Pino | Sinal | Pino | Sinal | Pino | Sinal |
|---|---|---|---|---|---|
| A1 | VBAT | B1 | GND | C1 | MOTOR A |
| A2–A7 | LS1–LS6 (PWM lado baixo) | B2–B5 | HS7–HS10 (lado alto) | C2–C6 | FREQ1–FREQ5 |
| A8 | VBAT | B6 | CAN_H | C7 | GND |
| | | B7 | CAN_L | C8 | MOTOR B |
| | | B8 | GND | | |

**J2 cinzento — sensores**

| Pino | Sinal | Pino | Sinal | Pino | Sinal |
|---|---|---|---|---|---|
| A1 | 5V_SENS | B1 | GND | C1 | DI1 |
| A2–A7 | AN1–AN6 | B2, B3 | AN7, AN8 | C2 / C3 | EGT1 + / − |
| A8 | 5V_SENS | B4, B5 | DI3, DI4 | C4 / C5 | EGT2 + / − |
| | | B6 / B7 | EGT4 + / − | C6 / C7 | EGT3 + / − |
| | | B8 | GND | C8 | DI2 |

## 4. Hardware

| Bloco | Componentes | Notas |
|---|---|---|
| Alimentação | LM2596S-5.0, MBRA340T3, SMBJ24A | 5 V; o 3,3 V vem da WeAct |
| Analógicas | pull-up 2k49 por jumper de solda, divisor 100k/180k (×1,556), BAV99, TLV9004 a 5 V, 1k + 100n | BAV99 e não BAT54S, por causa da fuga com o divisor de 100k |
| EGT | AD8497 ×4, divisor 10k/18k | |
| Frequência / DI | pull-up 4k7 por jumper, 2k2/10k série, BAT54S, 47p/100n | |
| Saídas baixas | NCV8402 ×6 | |
| Saídas altas | BTS428L2 ×4 | |
| Ponte H | TLE9201SG (PG-DSO-12-11), alimentada por P-FET de proteção contra inversão | |
| CAN | TJA1051T/3, NUP2105L, terminação dividida | pino S a GND; VIO a 3,3 V |
| 5 V sensores | PTC | sem proteção contra curto à bateria |

Ficheiros em `hardware/`:
- `canio-f405-dropbear.sch` — esquema Eagle 9.6.2 (bibliotecas originais, passivos 0603, WeAct como headers).
- `canio-f405-dropbear-place.txt` — script de colocação da placa (116,08 × 98 mm); o Antonio faz o roteamento.
- `gen_sch.py` — gerador dos dois. Precisa das bibliotecas `.lbr` de origem do Eagle e de footprints KiCad
  (TLE9201, Sicma), que **não** estão no repositório.

Por verificar no hardware:
- O esquema nunca foi aberto no Eagle por quem o gerou; houve um erro de carregamento (U3) que foi corrigido às cegas.
- Orientação dos headers da WeAct (deduzida da serigrafia).
- Pinos de 2,8 mm dos conectores Sicma (assumidos nas posições 1 e 8).
- **NCV8402 e BTS428L2 comandados a 3,3 V podem não comutar bem.** Proposta em aberto: buffers 74HCT a 5 V. O Antonio ainda não decidiu.
- Falta o header de 4 pinos (5 V, GND, TX, RX) para o módulo Bluetooth. A caixa de alumínio bloqueia o rádio: pôr o módulo junto aos conectores.

## 5. Firmware

ChibiOS 21.11 (RT + HAL). Um ficheiro por função em `src/`:

| Ficheiro | Função |
|---|---|
| `main.c` | arranque, ciclo de 1 kHz (entradas digitais) e 100 Hz (resto), watchdog de 5 s, reinício e salto para DFU |
| `ts.c` | protocolo TunerStudio em duas portas (USB e UART4), fila de valores de calibração |
| `storage.c` | configuração no sector 11 da flash, com CRC |
| `analog.c` | ADC contínuo com DMA, conversões, EGT |
| `freq.c` | captura de flancos e descodificadores |
| `dio.c` | entradas digitais com debounce |
| `outputs.c` | lógica das 10 saídas e fontes dos eixos das tabelas |
| `actuator.c` | ponte H: PID, redundância de sensores, calibração automática, autotune |
| `cancom.c` | CAN: fila de envio, tramas da placa, comandos, broadcast da ECU |
| `status.c` | bits de falha, verificação da configuração, bloco de canais para o TunerStudio |
| `util.c` | CRC32, interpolação, tabelas |
| `canio_layout.*` | **gerados** pelo `tools/gen_ini.py` |

Limitações conhecidas:
- O Burn congela o MCU 1 a 2 s (apagar o sector da flash). A ponte H é desligada, os PWM mantêm o valor, o CAN pára. Fazer Burn com o motor parado.
- Falha do atuador fica memorizada até a ECU retirar o comando ou ao botão Stop.
- A 115200 baud, a porta série dá no máximo 20 a 25 leituras por segundo (bloco de 452 bytes).

## 6. Tramas CAN

500 kbit/s, 11 bits, little endian por defeito. Frequência de cada grupo configurável; 0 Hz = não envia.

**Enviadas (base 0x6A0 = 1696)**

| ID | Conteúdo | Por defeito |
|---|---|---|
| +0 | u32 falhas, u8 entradas digitais, u8 analógicas em modo interruptor, u16 estado das saídas | 20 Hz |
| +1, +2 | AN1–4, AN5–8: valor calibrado, s16 × escala do canal | desligado |
| +3, +4 | AN1–4, AN5–8: milivolts, u16 | 50 Hz |
| +5 | EGT1–4, s16 0,1 °C | 10 Hz |
| +6 | EGT5, EGT6, máxima, diferença | 10 Hz |
| +7 | FREQ1–4, u16 × escala | 50 Hz |
| +8 | FREQ5, bateria mV, 5 V mV, temperatura MCU | 50 Hz |
| +9 | atuador: posição, alvo, duty (s16 0,01 %), u8 estado | 50 Hz, só com atuador ativo |
| +10 | FREQ1–4 segundo valor, s16 | desligado |
| +11 | FREQ5 segundo valor, posição sensor 2, diferença, u8 falhas 2 | desligado |

**Aceites (base 0x6B0 = 1712)**

| ID | Conteúdo |
|---|---|
| +0 | u16: um bit por saída |
| +1 | PWM1–6, u8 cada, 0,5 % por unidade |
| +2 | alvo do atuador s16 0,01 %, u8 ativar |
| +3, +4 | valores de utilizador 1–4, float |

Sem comandos durante `canCmdTimeoutMs`, cada saída aplica o seu failsafe.

**Na ECU epicEFI (janela CAN Analog Inputs):** ID 1699 para AN1–4 e 1700 para AN5–8; byte 0, 2, 4, 6;
multiplier 13107, divider 1000; 16 bits; little endian. Confirmado a funcionar.

**Broadcast da ECU (base 0x200):** lê as tramas +0 a +11 conforme o `can_verbose.cpp` do epicEFI
(a +4 traz o limite de rotação ativo nos bytes 0–1; a +11 é o pedal de travão). A lista completa está em `ECU` no gerador.
Escalas por confirmar em carro: avanço (÷50), tempo de injeção (÷300), caudal de combustível (÷200), massa de ar (÷1000).

## 7. TunerStudio
- Protocolo binário do rusEFI com envelope CRC32. Comandos: `S`/`Q` assinatura, `F` versão do protocolo, `O` canais,
  `R` ler, `C`/`W` escrever, `k` CRC, `B` burn, `e` erro de configuração, `V` versão, `Z` comandos.
- Comandos `Z` (subsistema, índice): 0x10 saída ligada, 0x11 desligada, 0x12 libertar; 0x20 atuador
  (0 calibrar, 1 parar, 2 autotune, 3 parar autotune); 0x30 valores por defeito; 0xBB reiniciar; 0xBA DFU.
- Calibração e autotune devolvem valores pelo mecanismo `calibrationMode` / `calibrationValue` + `maintainConstantValue`.

## 8. Histórico de problemas resolvidos
| Sintoma | Causa | Solução |
|---|---|---|
| "Unsupported Controller Firmware" | assinatura não começava por um nome que o TunerStudio conhece | prefixo `rusEFI ` |
| Tramas `6A4` em diante nunca saíam | 12 tramas de uma vez para 3 caixas de envio | fila de envio com thread própria |
| Saída de falha acesa sem razão | perda de comandos contava mesmo sem nada comandado por CAN | só conta se houver saída ou atuador em modo CAN |
| Erro "PowerCycle Monitor ... seconds" | faltava o canal `seconds` | canal renomeado |

## 9. Pendentes
1. Testar o firmware 0.3 na placa (tramas opcionais, valores novos da ECU, ritmos, porta série).
2. Decidir os buffers 74HCT das saídas.
3. Header do Bluetooth no esquema.
4. Abrir o esquema no Eagle e confirmar que carrega; roteamento.
5. Validar com sensores reais: Hella P+T (descodificação experimental), SENT GM (envia valores brutos, falta a escala).
6. Testar o atuador: PID, calibração automática, autotune, redundância.
7. Proteção do 5 V dos sensores contra curto à bateria.
8. Ideias não feitas: TunerStudio por CAN, bootloader OpenBLT.
