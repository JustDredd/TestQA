﻿#language: ru

@tree

Функционал: Создание элементов номенклатуры при помощи циклов

Как Тестировщик я хочу
создать номенклатуру
чтобы корректность добавления номенклатуры   

Переменные:


Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 Создание элементов номенклатуры при помощи циклов
	И Я запоминаю значение выражения '0' в переменную "Шаг"
	Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	
	* Добавление номенклатуры
		И я делаю 10 раз
			И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
			И Я запоминаю значение выражения '"Номенклатура " + $Шаг$' в переменную "НаименованиеНоменклатуры"
			И я проверяю или создаю для справочника "Items" объекты:
				| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType' | 'Unit' | 'MainPricture' | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru'             | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
				| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | ''         | ''     | ''             | ''       | ''       | ''            | ''               | ''                 | '$НаименованиеНоменклатуры$' | ''               |          |          |          | 0.21     |         |


Сценарий: _0502 Заполнение поля Заказ покупателя
	
	* Создание документа Заказ покупателя
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"	
		Когда открылось окно "Заказы покупателей"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно "Заказ покупателя (создание)"
		И я нажимаю кнопку выбора у поля с именем 'Partner'
		Тогда открылось окно "Партнеры"
		И в таблице 'List' я перехожу к строке:
			| "Код" | "Наименование"       |
			| "5"   | "Клиент и поставщик" |
		И в таблице 'List' я активизирую поле с именем 'Description'
		И в таблице 'List' я выбираю текущую строку
		Тогда открылось окно "Заказ покупателя (создание) *"
		И в таблице 'ItemList' я активизирую поле с именем 'ItemListLineNumber'
		И я нажимаю на кнопку с именем 'FormWrite'
		Тогда открылось окно "Заказ покупателя * от *"
		И я нажимаю на кнопку с именем 'FormPost'		
	
	* Проверка и заполнение поля Организации
		Если поле с именем 'Agreement' заполнено Тогда
			Если поле с именем 'Company' заполнено Тогда
				И я вывожу сообщение в менеджер тестирования "Поля заполнены"
		ИначеЕсли поле с именем 'Agreement' заполнено Тогда
			Если поле с именем 'Company' не заполнено Тогда 
				И я нажимаю кнопку выбора у поля с именем 'Company'
				Тогда открылось окно "Организации"
				И в таблице 'List' я активизирую поле с именем 'Description'
				И в таблице 'List' я выбираю текущую строку
		Иначе 
			Тогда я вызываю исключение "У контрагента не заполнено Соглашение "
			
				