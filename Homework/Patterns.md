# Design Patterns Homework

**Реализовать:**

- [X] [Mediator](https://refactoring.guru/design-patterns/mediator/swift/example)
- [X] [Memento](https://refactoring.guru/design-patterns/memento/swift/example)
- [X] [Facade](https://refactoring.guru/design-patterns/facade/swift/example)
- [X] [Singleton](https://refactoring.guru/design-patterns/singleton/swift/example)

[Ссылка на проект](https://github.com/Lemonbrush/SberSchool/blob/master/Homework/Projects/FourDesignPatterns)

В данном проекте реализованы 4 паттерна проектирования на примере 3-х юнитов, состоящих из лейбла с сообщением, кнопки для подписки на юнит и кнопки undo. Подписываясь на юниты и отправляя им сообщения, мы используем паттерн Фасад, который рассылает всем юнитам, на которые мы подписаны, сообщение. Так же, Медиатор является и Синглтоном. Для реализации кнопки Undo был использован паттерн Memento. В декомпозиции и делегировании помогает Паттерн Фасад.