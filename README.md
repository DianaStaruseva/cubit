ПРАКТИЧЕСКАЯ РАБОТА №4
Создать проект с использованием Cubit.
Цель: реализовать счетчик при нажатии на кнопку + осуществляет увеличение счетчика, при нажатии на кнопку - осуществляться уменьшение счетчика.
Ход работы: 
Подключаем библиотеку bloc. Данная библиотека дает нам два основных инструмента: Cubit и BLoC. В данной работе будет рассматриваться использование Cubit. 
 
Рисунок 12 - Подключение библиотеки
Далее создаем файлы cubit и state. В state прописываются значения для хранения состояния, а в cubit – логика. 
 
Рисунок 13 - Созданные файлы в иерархии

Рисунок 15 - Код файла click_cubit
Далее в файле main прописываем отображение объектов.
 
Рисунок 16 - Код файла main

Рисунок 17 - Результат работы приложения
 
Рисунок 18 - Результат работы приложения
Вывод: в ходе выполнения работы был освоен архитектурный паттерн BLoC, с помощью библиотеки flutter_bloc, реализовано приложение-счетчик.