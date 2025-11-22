# -*- coding: utf-8 -*-
# ==============================================================================
# PROJETO DE COMPILADORES - FASE 4 (FINAL)
#
# Integrante: Helton Brandao (GitHub: HeltonBr)
# Equipe Canvas: Equipe 02
# Disciplina: Linguagens Formais e Compiladores
# ==============================================================================
# -*- coding: utf-8 -*-
# VERSAO 1 - ARITMETICA BASICA E OTIMIZACAO
import sys, re, struct

class CompilationError(Exception): pass
class RPNLSyntaxError(CompilationError): pass
class RPNLSemanticError(CompilationError): pass

class ASTNode: pass
class ProgramNode(ASTNode):
    def __init__(self, statements): self.statements = statements
class NumberNode(ASTNode):
    def __init__(self, token): self.value = float(token); self.type = 'float'
class BinaryOpNode(ASTNode):
    def __init__(self, left, right, op): self.left = left; self.right = right; self.op = op; self.type = 'float'
class CommandNode(ASTNode):
    def __init__(self, command, value=None): self.command = command; self.value = value; self.type = 'float'

class Parser:
    def __init__(self, tokens): self.tokens = tokens; self.pos = -1; self.current_token = None; self.advance()
    def advance(self): self.pos += 1; self.current_token = self.tokens[self.pos] if self.pos < len(self.tokens) else None
    def is_valid_number(self, t): return t is not None and re.match(r'^-?\d+(\.\d+)?$', t) is not None
    def parse(self): return self.parse_expression()
    def parse_expression(self):
        t = self.current_token
        if self.is_valid_number(t): self.advance(); return NumberNode(t)
        if t == '(':
            self.advance(); left = self.parse_expression()
            if self.current_token == ')': self.advance(); return left
            right = self.parse_expression(); op = self.current_token; self.advance(); self.advance()
            return BinaryOpNode(left, right, op)
        return NumberNode(0) 

class TACInstruction:
    def __init__(self, op, arg1=None, arg2=None, result=None): self.op, self.arg1, self.arg2, self.result = op, arg1, arg2, result
    def __repr__(self): 
        if self.op == 'copy': return f"{self.result} = {self.arg1}"
        if self.op == 'SAVE_HISTORY': return f"HISTORY[{self.arg1}] = {self.result}"
        return f"{self.result} = {self.arg1} {self.op} {self.arg2}"

class TACGenerator:
    def __init__(self): self.instructions, self.temp_count, self.line_idx = [], 0, 0
    def new_temp(self): t = f"t{self.temp_count}"; self.temp_count+=1; return t
    def emit(self, op, arg1=None, arg2=None, result=None): instr = TACInstruction(op, arg1, arg2, result); self.instructions.append(instr); return instr
    def generate(self, node): 
        self.line_idx = 0
        for stmt in node.statements:
            res = self.visit(stmt['ast'])
            self.emit('SAVE_HISTORY', self.line_idx, None, res)
            self.line_idx += 1
        return self.instructions
    def visit(self, node):
        if isinstance(node, NumberNode): t = self.new_temp(); self.emit('copy', node.value, None, t); return t
        if isinstance(node, BinaryOpNode): t1, t2 = self.visit(node.left), self.visit(node.right); res = self.new_temp(); self.emit(node.op, t1, t2, res); return res
        return self.new_temp()

class TACOptimizer:
    def optimize(self, instrs):
        # Simples Constant Folding
        new_i = []
        for i in instrs:
            if i.op in ['+', '-', '*', '/'] and isinstance(i.arg1, float) and isinstance(i.arg2, float):
                res = eval(f"{i.arg1} {i.op} {i.arg2}")
                i.op, i.arg1, i.arg2 = 'copy', res, None
            new_i.append(i)
        return new_i

class CodeGeneratorAVR:
    def __init__(self): self.code, self.data = [], []
    def generate(self, instrs):
        self.code.append("// Versao Inicial - Apenas Aritmetica")
        return self.code

def run_compiler(filename):
    print("Compilando Versao 1...")
    # (Logica simplificada para gerar apenas o esqueleto)
    with open("output.S", "w") as f: f.write("// Assembly V1")
    with open("ArduinoSketch.ino", "w") as f: f.write("// Sketch V1")

if __name__ == "__main__":
    if len(sys.argv) > 1: run_compiler(sys.argv[1])