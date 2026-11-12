# CanIOF405 — enquadramento para continuar o projeto

Placa de expansão de IO por CAN para ECU **epicEFI** (fork do rusEFI), feita pelo Antonio.
Uma **WeAct STM32F405RGT6** encaixa num shield próprio, dentro da caixa de alumínio de 48 pinos
(dois conectores Sicma de 24 vias, a mesma do Speeduino Dropbear). Configura-se no **TunerStudio** por USB.

Ler primeiro: `docs/PROJETO.md` (pinos, tramas CAN, decisões de hardware, pendentes).

## Como trabalhar com o Antonio
- Fala **português europeu**. Respostas curtas, com tabelas e listas.
- **Não gerar nada (código, ficheiros, esquemas) sem ele pedir.** Primeiro responder ou diagnosticar, propor, e esperar pelo "avança".
- Quando pede "só responde", responder só à pergunta.
- Ele testa na placa real e manda capturas (TunerStudio, sniffer CAN, registos). Diagnosticar a partir disso.
- Entregas: **commit + push para este repositório**. O GitHub Actions compila e ele vai buscar o `.bin` e o ini ao artefacto. Não anexar ficheiros na conversa, salvo pedido.
- Dizer sempre com franqueza o que não foi testado em hardware.

## Regras do código
- `src/canio_layout.h` e `src/canio_layout.c` são **gerados**. Nunca editar à mão.
  Para mudar configuração, canais ou o ini: editar `tools/gen_ini.py` e correr
  `python3 tools/gen_ini.py tunerstudio/canio-f405.ini src`.
- Qualquer alteração ao layout obriga a **mudar a assinatura** (`SIG` no gerador) e o `CFG_MAGIC` em `src/storage.c`.
- A assinatura **tem de começar por `rusEFI `**: o TunerStudio recusa prefixos que não conhece ("Unsupported Controller Firmware").
- A lista de eixos das tabelas (`AXIS` no gerador) só cresce no fim: as posições ficam gravadas nos tunes.
- Compilar antes de enviar: `make CHIBIOS=<pasta do ChibiOS stable_21.11.x>`. Zero avisos.
- Comentários do código em inglês; documentação e conversa em português.

## Estado (2026-11-12)
- Firmware **0.3**, assinatura `rusEFI canio.2026.11.12.f405.2`. Compila local e no GitHub Actions.
- Testado na WeAct sem shield: USB + TunerStudio, envio e receção CAN, leitura do broadcast da ECU, CAN Analog na ECU.
- Por testar: firmware 0.3 em placa, porta série/Bluetooth, tudo o que depende do shield (analógicas reais, EGT, saídas, ponte H).
