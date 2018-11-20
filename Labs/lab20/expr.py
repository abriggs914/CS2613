class Expr:
    def __init__(self, op, a, b):  
        self.op = op
        self.a = a
        self.b = b

    def __eq__(self, obj):
        # if isinstance(self, obj.__class__):
        #     return vars(self) == vars(obj)
        # else:
        #     return NotImplemented
        # or
        if self.__dict__ == obj.__dict__:
            return True
        return False

    def eval(self):
        if type(self.a) == Expr:
            self.a = self.a.eval()
        if type(self.b) == Expr:
            self.b = self.b.eval()
        if self.op == '+':
            return self.a+self.b
        if self.op == '*':
            return self.a*self.b
        if self.op == '-':
            return self.a-self.b
        if self.op == '/' and self.b != 0:
            return self.a/self.b

six_plus_nine = Expr('+', 6, 9)
six_times_nine = Expr('*', 6, 9)
compound1 =  Expr('+', six_times_nine, six_plus_nine)
compound2 =  Expr('*', six_times_nine, compound1)
compound3 =  Expr('+', compound2, 3)
print(six_plus_nine)
print(six_times_nine)
print(compound1)
print(compound2)
print(compound3)