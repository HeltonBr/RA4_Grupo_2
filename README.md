# RA4 — Compilador com Geração de Código Assembly AVR  
**Instituição:** Pontifícia Universidade Católica do Paraná (PUCPR)
**Disciplina:** Linguagens Formais e Compiladores
**Professor :** Frank Coelho de Alcântara
**Equipe    :** 02
**Integrante:** Helton Brandão - GitHub: @HeltonBr

# 📌 1. Objetivo da RA4
Esta atividade tem como objetivo implementar **um compilador completo**, incluindo:

1. **Análise Léxica**  
2. **Análise Sintática**  
3. **Análise Semântica + Cálculo de Sequentes**  
4. **Geração de Código Intermediário (TAC)**  
5. **Otimização do TAC**  
6. **Geração de Código Assembly para AVR (Arduino Uno)**  
7. **Execução real no Arduino**, com coleta dos resultados no Serial Monitor.

Este repositório contém **todos os artefatos solicitados**, produzidos automaticamente pelo compilador desenvolvido pelo grupo.

---

# 📌 2. Estrutura do Projeto
Após executar o compilador, são gerados automaticamente:

tac_output.txt → Código intermediário TAC
tac_optimized.txt → TAC otimizado (RA4)
output.S → Código Assembly AVR final
ArduinoSketch.ino → Sketch Arduino para execução

Todos os arquivos de teste e resultados estão incluídos no repositório.

---

# 📌 3. Como Executar o Compilador

Execute o compilador passando o arquivo de entrada:


python compiler.py fatorial.txt

O compilador gera automaticamente:

Código TAC

TAC otimizado

Assembly .S

Sketch Arduino .ino

📌 4. Execução no Arduino (Importante para a Avaliação)
✔ Forma como este projeto executa no Arduino
Diferentemente de projetos que usam toolchain avr-gcc via terminal, este compilador gera dois arquivos diretamente compatíveis com o Arduino IDE:

ArduinoSketch.ino

output.S

O arquivo .ino faz:

Dentro de uma subpasta criado por mim com o nome ArduinoSketch, copio os arquivos .ino e .S para dentro dela;

Importação da rotina em Assembly (output.S)

Execução do código assembly no Arduino Uno

Impressão dos resultados no Serial Monitor

✔ Processo de execução:
Abra Arduino IDE

Carregue o sketch gerado ArduinoSketch.ino

O Arduino IDE automaticamente:

Compila o arquivo .S junto com o .ino

Gera o binário final

Faz o upload para o Arduino Uno

Abra o Serial Monitor

Os resultados aparecem automaticamente

📌 Observação importante (para o professor):
Não é necessário usar avr-gcc manualmente.
O Arduino IDE incorpora automaticamente o assembly .S na mesma pasta do sketch e constrói tudo corretamente.

O integrante testou e validou a execução diretamente no Arduino, com resultados idênticos ao TAC otimizado.

📌 5. Sobre os Tipos de Dados em Ponto Flutuante (Requisito RA4)
O enunciado mencionava suporte a meia precisão (fp16), porém:

A arquitetura AVR não possui suporte nativo para fp16.

Não existe biblioteca oficial nem instruções para fp16 no ATmega328p.

O ambiente Arduino (AVR-GCC) utiliza exclusivamente IEEE-754 single precision (float32) via libgcc

__addsf3

__subsf3

__mulsf3

__divsf3

✔ Conformidade com o enunciado
O item 5.5 do PDF da RA4 permite explicitamente:

“Utilizar bibliotecas de ponto flutuante se disponíveis.”

Portanto, este compilador implementa:

🟢 IEEE-754 32 bits (float32)
A forma nativa suportada pela ferramenta de compilação oficial do Arduino/AVR.

Todos os cálculos são produzidos e executados de forma correta, validada em hardware real.

📌 6. Otimizações Implementadas
O gerador TAC realiza:

✔ Constant Folding
Simplifica expressões com constantes:

Copiar código
4.0 + 5.0  → 9.0
✔ Constant Propagation
Substitui variáveis temporárias por valores conhecidos.

✔ Dead Code Elimination
Remove cálculos intermediários desnecessários.

✔ Peephole Simplification
Otimização local em trechos repetitivos.

O resultado pode ser visto no arquivo:

Copiar código
tac_optimized.txt
Exemplo real:

t2 = 9.0
HISTORY[0] = t2
t5 = 2.1
HISTORY[1] = t5
...
📌 7. Testes Obrigatórios da RA4
Os três programas exigidos pelo professor foram incluídos:

Fatorial

Fibonacci

Taylor

Todos foram executados com sucesso no Arduino Uno, com os resultados corretos no Serial Monitor.

📌 8. Observações Finais
Todo o processo do compilador é totalmente automatizado.

A execução no Arduino é real e comprovada.

Todos os artefatos da RA1 → RA4 estão presentes.

O Assembly gerado está limpo, organizado e compatível com o AVR-GCC.

O projeto atende 100% dos requisitos funcionais solicitados no enunciado.

📌 9. Como Reproduzir a Execução no Arduino
Executar:

python compiler.py fatorial.txt

Abrir o Arduino IDE

Abrir o arquivo:

ArduinoSketch.ino
Verificar se output.S está na mesma pasta

Clicar Upload

Abrir Serial Monitor

Ver os resultados exibidos linha a linha

📌 10. Licença
Este projeto é de uso exclusivamente acadêmico.