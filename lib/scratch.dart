//Functions as first order

void main() {
  int result = calculator(55, 12, subtraction);
  print(result);
}

Function calculator = (int firstNumber, int secondNumber, Function calculate) {
  return calculate(firstNumber, secondNumber);
};

int addition(int num1, int num2) {
  return num1 + num2;
}

int subtraction(int num1, int num2) {
  return num1 - num2;
}

int multiplication(int num1, int num2) {
  return num1 * num2;
}

int division(int num1, int num2) {
  return num2 != 0 ? num1 / num2 : 0;
}

// This just for practice purpose
