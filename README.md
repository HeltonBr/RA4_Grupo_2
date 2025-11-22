# Compilador RPNL para Arduino (AVR Assembly) - Fase 4

## 🎓 Identificação
**Instituição:** Pontifícia Universidade Católica do Paraná (PUCPR)
**Disciplina:** Linguagens Formais e Compiladores
**Equipe:**
* Helton Brandão

---

## 🚀 Sobre o Projeto
Este projeto consiste na implementação completa da **Fase 4** do compilador para a linguagem RPNL (Reverse Polish Notation Language). O software lê o código fonte, realiza análise léxica, sintática e semântica, gera código intermediário (TAC), aplica otimizações e gera código **Assembly AVR** compatível com o Arduino Uno (ATmega328P).

## 🛠️ Funcionalidades Implementadas

### 1. Geração de Código Intermediário (TAC)
Converte a Árvore Sintática Abstrata (AST) em instruções de três endereços.
* **Variáveis Temporárias:** `t0`, `t1`, `t2`...
* **Instruções Suportadas:** Atribuição, operações binárias, saltos (`goto`, `ifFalse`), acesso à memória (`MEM`) e histórico (`LOAD_HISTORY`).

### 2. Otimização de Código
O módulo `TACOptimizer` implementa:
* **Constant Folding (Dobra de Constantes):** Expressões cujos operandos são conhecidos em tempo de compilação são calculadas imediatamente.
    * *Exemplo:* `2 3 +` gera `t0 = 5.0` (ao invés de gerar instrução de soma no Assembly).
* **Dead Code Elimination (Eliminação de Código Morto):** Variáveis temporárias que são calculadas mas nunca utilizadas (e não afetam o estado global ou histórico) são removidas do código final.

### 3. Geração de Assembly AVR
Gera código compatível com `avr-gcc` para ATmega328P.
* **Convenção de Registradores:**
    * `R22-R25`: Acumuladores principais e registradores de trabalho para operações de ponto flutuante (32 bits IEEE 754).
    * `R18-R21`: Registradores secundários para o segundo operando.
    * `R30-R31 (Z)`: Ponteiro para acesso indireto à memória RAM (`lds`/`sts` e `ld`/`st`).
* **Ponto Flutuante:** Utiliza as rotinas otimizadas da `libgcc` (`__addsf3`, `__mulsf3`, `__divsf3`, `__gtsf2`).
* **Memória:** Variáveis TAC são mapeadas para a seção `.comm` (SRAM) do Arduino.

## 📂 Estrutura do Repositório
* `compiler.py`: Código fonte principal (Python 3).
* `fatorial.txt`, `fibonacci.txt`, `taylor.txt`: Arquivos de teste.
* `tac_output.txt`: TAC gerado (bruto).
* `tac_optimized.txt`: TAC após otimização.
* `output.S`: Código Assembly gerado.
* `ArduinoSketch.ino`: Sketch gerado automaticamente para validação.

## ⚙️ Como Executar

### 1. Compilação (Geração de Código)
Execute o script Python passando o arquivo de teste desejado:

```bash
python compiler.py taylor.txt