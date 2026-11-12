# canio-f405

Firmware da placa de expansão de IO por CAN (WeAct STM32F405RGT6 + shield), configurável no TunerStudio por USB.
Baseado na estrutura e nos protocolos do rusEFI (GPL v3). Sistema operativo: ChibiOS 21.11.

## Compilar no GitHub

1. Cria um repositório novo no GitHub e carrega **todo** o conteúdo desta pasta (incluindo a pasta escondida `.github`).
2. Abre o separador **Actions**. A compilação arranca sozinha a cada alteração (ou carrega em *Run workflow*).
3. Quando ficar verde, abre a execução e descarrega o artefacto `canio-f405-firmware`: traz o `.bin`, o `.hex` e o `.ini`.

Se ficar vermelho, copia o texto do erro do passo *Build*.

## Gravar na WeAct (DFU, por USB)

1. Segura o botão **BOOT0**, carrega e larga **NRST**, larga o BOOT0.
2. No STM32CubeProgrammer: ligação **USB**, *Connect*, abre o `canio-f405.bin`, endereço `0x08000000`, *Download*.
   (ou `dfu-util -a 0 -s 0x08000000:leave -D canio-f405.bin`)
3. Carrega em NRST. O LED azul pisca devagar = a correr; pisca depressa = há uma falha ou erro de configuração.

Depois da primeira gravação, o TunerStudio tem um botão para reiniciar em modo DFU sem tocar nos botões.

## TunerStudio

Projeto novo com o `tunerstudio/canio-f405.ini`, porta série (USB CDC), qualquer baud rate.
O ini e o firmware têm de ter a mesma assinatura (`rusEFI canio.2026.11.12.f405.2`).

## Organização

| Ficheiro | Função |
|---|---|
| `src/main.c` | arranque e ciclo principal (1 kHz / 100 Hz) |
| `src/ts.c` | protocolo TunerStudio (igual ao rusEFI) |
| `src/storage.c` | configuração na flash (sector 11) |
| `src/analog.c` | 8 analógicas, EGT, tensões |
| `src/freq.c` | 5 entradas de frequência, flex, Hella, SENT |
| `src/dio.c` | entradas digitais |
| `src/outputs.c` | 6 PWM + 4 on/off, tabelas 8x8 |
| `src/actuator.c` | ponte H: PID, redundância, calibração, autotune |
| `src/cancom.c` | CAN: tramas da placa, comandos, valores da ECU |
| `src/status.c` | falhas e canais para o TunerStudio |
| `src/canio_layout.*` | gerado por `tools/gen_ini.py` juntamente com o ini — não editar à mão |

Para mudar o ini: `python3 tools/gen_ini.py tunerstudio/canio-f405.ini src`.

## Por validar em hardware

- Nada disto correu ainda numa placa: compila, mas falta testar.
- Hella pressão + temperatura (PWM): descodificação feita a partir da descrição pública da trama, sem sensor real.
- SENT GM pressão de combustível: envia os valores em bruto (falta a escala).
- Temperatura do MCU: não é medida (os 16 canais do ADC estão ocupados), mostra 0.
