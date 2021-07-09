# ErrorHandling /HW

Есть массив строк. Строки – примеры по типу "32 + 16 = 48". Примеры состоят из 2-х числе слева от равно и одно число справа от равно. Операции: сложение и вычитание  

**Реализовать:**  
- [X] Функция **checkHomework** принимает массив примеров и возвращает:
  - [X] Если больше 75% ошибок в примерах – функция возвращает список всех примеров с ошибками и подпи Если пример решен верно – возвращает строку "молодец"
  - [X] Если нет примеров – возвращает строку "нет примеров"
  - [X] Если ей на вход дать хотя бы один невалидный пример – выводит "переделывай" и не оценивает другие примеры
- [X] Функция **checkTask** принимает пример
  - [X] Если это не пример – кидает исключение
  - [X] Если пример ришен правильно – возвращает строку с похвалой
  - [X] Если нет – возвращает ошибку с правильным ответом

[Ссылка на результат](https://github.com/Lemonbrush/SberSchool/blob/master/Homework/Projects/ErrorHandling/ErrorHandling/main.swift)