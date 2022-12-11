ПРАКТИЧЕСКАЯ РАБОТА №4
Создать проект с использованием Cubit.
Цель: реализовать счетчик при нажатии на кнопку + осуществляет увеличение счетчика, при нажатии на кнопку - осуществляться уменьшение счетчика.
Ход работы: 
Подключаем библиотеку bloc. Данная библиотека дает нам два основных инструмента: Cubit и BLoC. В данной работе будет рассматриваться использование Cubit.

![1](https://user-images.githubusercontent.com/91606054/206912150-e767dce4-8170-445c-94a6-9c97a54b53bc.png)
Рисунок 12 - Подключение библиотеки

Далее создаем файлы cubit и state. В state прописываются значения для хранения состояния, а в cubit – логика. 

![2](https://user-images.githubusercontent.com/91606054/206912294-3dbcc9a1-e0a2-4301-a56e-76d8dfc4b19b.png)
Рисунок 13 - Созданные файлы в иерархии

![3](https://user-images.githubusercontent.com/91606054/206912304-bae48db5-d405-478c-a68d-f547a495cb28.png)
Рисунок 14 - Код файла click_cubit

Далее в файле main прописываем отображение объектов.

 ![4](https://user-images.githubusercontent.com/91606054/206912320-a3ccb26b-3602-4785-8d28-25e603250095.png)
Рисунок 15 - Код файла main

![5](https://user-images.githubusercontent.com/91606054/206912324-74365dd9-4b5c-49af-8073-2cbdebf381b5.png)
Рисунок 16 - Результат работы приложения

 ![6](https://user-images.githubusercontent.com/91606054/206912337-53d5c58b-3d89-46ce-ad61-117720ad41e6.png)
Рисунок 17 - Результат работы приложения

Вывод: в ходе выполнения работы был освоен архитектурный паттерн BLoC, с помощью библиотеки flutter_bloc, реализовано приложение-счетчик.
