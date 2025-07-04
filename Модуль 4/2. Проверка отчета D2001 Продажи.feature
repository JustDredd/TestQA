﻿#language: ru

@tree

Функционал: Проверка возвратов в отчете D2001 Продажи

Как Тестирощик я хочу
проверить отображение возвратов
чтобы корректно выводились расчеты

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0201 Проверка отчета D2001 Продажи

	* Открытие отчета и его формирование
		И В командном интерфейсе я выбираю "Отчеты" "D2001 Продажи"
		Тогда открылось окно "D2001 Продажи"
		И я нажимаю на кнопку с именем 'FormGenerate'
		
	* Сравнение отчета с макетом
		Дано Табличный документ "Result" равен макету "Макет отчета D2001" по шаблону
		И в табличном документе "Result" ячейка с адресом "R9C1" равна "Товар с характеристиками" по шаблону
		И в табличном документе "Result" ячейка с адресом "R9C2" равна "3,*" по шаблону
		И в табличном документе "Result" ячейка с адресом "R10C1" равна "Товар с характеристиками" по шаблону
		И в табличном документе "Result" ячейка с адресом "R10C2" равна "3,*" по шаблону
		И в табличном документе "Result" ячейка с адресом "R11C1" равна "Итого" по шаблону
		И в табличном документе "Result" ячейка с адресом "R11C2" равна "3,*" по шаблону
		И в табличном документе "Result" ячейка с адресом "R11C3" равна "2 700,*" по шаблону
		И в табличном документе "Result" ячейка с адресом "R11C3" равна "2 700,*" по шаблону
		
