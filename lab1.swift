import Foundation

enum CalculationError: Error {
    case divisionByZero
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func subtract(num1: Int, num2: Int) -> Int {
    return num1 - num2
}

func divide(num1: Int, num2: Int) throws -> Int {
    guard num2 != 0 else {
        throw CalculationError.divisionByZero
    }
    return num1 / num2
}

func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

func calculate(_ sign: String?, _ num1: Int?, _ num2: Int?) {
  guard let sign = sign, let num1 = num1, let num2 = num2 else {
    print("Nil error!")
    return
  }

  switch sign {
  case "+":
  print(add(num1: num1, num2: num2))

  case "-":
  print(subtract(num1: num1, num2: num2))

  case "/":
        do {
            let result = try divide(num1: num1, num2: num2)
            print(result)
        } catch CalculationError.divisionByZero {
            print("Can't divide by zero!")
        } catch {
            print("An error occurred during division!")
        }

  case "*":
  print(multiply(num1: num1, num2: num2))

  default:
  print ("Error")
  }
}

func main() {

  let sign: String? = "/"
  let num1: Int? = 2
  let num2: Int? = 1

  calculate(sign, num1, num2)
}

main()
