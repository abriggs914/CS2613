#!/usr/bin/python3

import sys

stack = []

def process(line):
    if line == "clear":
        stack.clear()
        return
    elif line == "pop":
        stack.pop()
        return
    elif line == "dup":
        val = stack.pop()
        stack.append(val)
        stack.append(val)
        return
    elif line == "print":
        return int(stack[-1])
    try:
        val = int(line)
        stack.append(val)
    except:
        op1 = stack.pop()
        op2 = stack.pop()
    if line == "swap":
        stack.append(op1)
        stack.append(op2)
        return
    elif line == "+":
        stack.append(op1+op2)
    elif line == "*":
        stack.append(op1*op2)
    elif line == "/":
        stack.append(op2//op1)
    elif line == "-":
        stack.append(op2-op1)
    elif line == "^":
        stack.append(op1**op2)

def process_list(lines):
    out = []
    for line in lines:
        if line == "quit":
            return
        returned = process(line)
        if returned:
            out.append(returned)
    return out

# ops ='clear 3 4 * print 2 + print'.split()
# print(ops)
# print(ops[0])
# print(ops[1])
# out1 = []
# for op in ops:
#     out1.append(process(op))
# print(op)
# process("clear")
# process("3")
# process("4")
# retv=process("print")
# otherv=process("+")
# print(process("print"))
# print(stack)
if __name__ == "__main__":
    ops = []
    for line in sys.stdin:
        line = line.strip()
        ops.append(line)
        out = process_list(ops)
        for line in out:
            print(line)