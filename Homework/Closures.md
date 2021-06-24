# ДЗ

- [X] Описать разницу между Swift closure и Objective-C block   
- [X] Реализовать Multiset c базовыми операциями - add(element:), count(for element:), totalCount, remove(element:) – [Ссылка на результат](https://github.com/Lemonbrush/SberSchool/blob/master/Homework/Projects/MultiSet/MultiSet/main.swift) 

### Разница между Swift closure и Objective-C block

Основная разница Closure от Block заключается в том, что Closure может захватывать переменные и менять их значение из самой Closure, в то время как такого же эффекта от блока можно добиться, добавив ключевое слово **__block** перед переменной, которая должна будет измениться внутри блока. Для Closure такое поведение стало обычным, а при необходимости можно использовать capture list, чтобы не захватывать переменную. Такое поведение со стороны Closure обусловлено том, что они приравнены к обычным функциям. Исходя из примера на вложенных функциях можно легко увидеть логику по которой работает данный механизм:

``` Swift

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

```  

## Sources
- [Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID103)
- [Objective-C Blocks](https://www.tutorialspoint.com/objective_c/objective_c_blocks.htm)
- [Difference between block (Objective-C) and closure (Swift) in iOS](https://stackoverflow.com/questions/26374792/difference-between-block-objective-c-and-closure-swift-in-ios/38286689#38286689)