#Использовать ".."
#Использовать "./fixtures"
#Использовать asserts

&Тест
Процедура ПроксиСоздается() Экспорт
	Прокси = Новый КонструкторПрокси(Новый МойКласс).Построить();

	Ожидаем.Что(ОбработкаПроксиОбъекта.ИсходныйТип(Прокси)).Равно(Тип("МойКласс"));
КонецПроцедуры

&Тест
Процедура ФункцииОбъектаНаследуются() Экспорт
	Прокси = Новый КонструкторПрокси(Новый МойКласс).Построить();

	Ожидаем.Что(Прокси.ТестоваяФункция()).Равно(1);
КонецПроцедуры

&Тест
Процедура ПоляОбъектаНаследуются() Экспорт

	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Прокси = Новый КонструкторПрокси(МойКласс).Построить();

	Ожидаем.Что(Прокси.Поле).Равно(123);
КонецПроцедуры

&Тест
Процедура ПоляОбъектаСинхронизируютсяЯвно() Экспорт
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Прокси = Новый КонструкторПрокси(МойКласс).Построить();
	
	Ожидаем.Что(Прокси.Поле).Равно(МойКласс.Поле);
КонецПроцедуры

&Тест
Процедура ПоляОбъектаСинхронизируютсяОбратно() Экспорт
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Прокси = Новый КонструкторПрокси(МойКласс).Построить();
	Прокси.ИзменитьЗначениеПоля(100);

	Ожидаем.Что(Прокси.Поле).Равно(100);
КонецПроцедуры

&Тест
Процедура ФункцияДобавляется() Экспорт
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	ИмяМетода = "ДобавленнаяФункция";
	ТекстМетода = "Возврат Истина;";

	Прокси = Новый КонструкторПрокси(МойКласс)
		.ДобавитьМетод(ИмяМетода, ТекстМетода)
		.Построить();

	Результат = Прокси.ДобавленнаяФункция();

	Ожидаем.Что(Результат).ЭтоИстина();
КонецПроцедуры

&Тест
Процедура ПерехватчикиДобавленныхФункцийРаботаютКорректно() Экспорт
	
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	ИмяМетода = "ЗначениеПоля";
	ТекстМетода = "Поле = Поле + 1;";

	Прокси = Новый КонструкторПрокси(МойКласс)
		.ДобавитьПубличноеПоле("КэшПоля")
		.ДобавитьПередВызовомМетода(ИмяМетода, "КэшПоля = Поле;")
		.ДобавитьМетод(ИмяМетода, ТекстМетода)
		.ДобавитьПослеВызоваМетода(ИмяМетода, "КэшПоля = КэшПоля - 1;")
		.Построить();

	Прокси.ЗначениеПоля();

	Ожидаем.Что(Прокси.Поле).Равно(124);
	Ожидаем.Что(Прокси.КэшПоля).Равно(122);

КонецПроцедуры

&Тест
Процедура ПерехватчикиПроксируемыхФункцийРаботаютКорректно() Экспорт
	
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Прокси = Новый КонструкторПрокси(МойКласс)
		.ДобавитьПубличноеПоле("КэшПоля")
		.ДобавитьПередВызовомМетода("ИзменитьЗначениеПоля", "КэшПоля = Поле;")
		.ДобавитьПослеВызоваМетода("ИзменитьЗначениеПоля", "КэшПоля = КэшПоля - Поле;")
		.Построить();

	Прокси.ИзменитьЗначениеПоля(20);

	Ожидаем.Что(Прокси.Поле).Равно(20);
	Ожидаем.Что(Прокси.КэшПоля).Равно(103);

КонецПроцедуры

&Тест
Процедура ПриватноеПолеДобавляется() Экспорт

	Прокси = Новый КонструкторПрокси(Новый МойКласс)
		.ДобавитьПриватноеПоле("ПриватноеПоле1", "ффф")
		.ДобавитьПриватноеПоле("ПриватноеПоле2")
		.Построить();

	Рефлектор = Новый Рефлектор();

	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Прокси, "ПриватноеПоле1")).Равно("ффф");
	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Прокси, "ПриватноеПоле2")).ЭтоНеопределено();

	ИсключениеВозникло = Ложь;
	Попытка
		А = Прокси.ПриватноеПоле1;
	Исключение
		ИсключениеВозникло = Истина;
	КонецПопытки;

	Ожидаем.Что(ИсключениеВозникло, "Получилось обратиться к приватному полю").ЭтоИстина();
КонецПроцедуры

&Тест
Процедура ПубличноеПолеДобавляется() Экспорт

	Прокси = Новый КонструкторПрокси(Новый МойКласс)
		.ДобавитьПубличноеПоле("ПриватноеПоле1", "ффф")
		.ДобавитьПубличноеПоле("ПриватноеПоле2")
		.Построить();

	Рефлектор = Новый Рефлектор();

	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Прокси, "ПриватноеПоле1")).Равно("ффф");
	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Прокси, "ПриватноеПоле2")).ЭтоНеопределено();

	ИсключениеВозникло = Ложь;
	Попытка
		А = Прокси.ПриватноеПоле1;
	Исключение
		ИсключениеВозникло = Истина;
	КонецПопытки;

	Ожидаем.Что(ИсключениеВозникло, "Не получилось обратиться к публичному полю").ЭтоЛожь();
КонецПроцедуры

&Тест
Процедура ИмпортДобавляется() Экспорт

	ТекстСценарияПрокси = Новый КонструкторПрокси(Новый МойКласс)
		.ДобавитьИмпортПоИмени("asserts")
		.ДобавитьИмпортПоПути(".")
		.ТекстСценария();

	Ожидаем.Что(ТекстСценарияПрокси)
		.Содержит("#Использовать asserts")
		.Содержит("#Использовать "".""")
		;

КонецПроцедуры

&Тест
Процедура ПользовательскийШагДобавляется() Экспорт

	ТекстСценарияПрокси = Новый КонструкторПрокси(Новый МойКласс)
		.ДобавитьШагИнициализации("А = 0;")
		.ДобавитьШагИнициализации("Сообщить(А);")
		.ТекстСценария();

	Ожидаем.Что(ТекстСценарияПрокси)
		.Содержит("А = 0;
				  |Сообщить(А);")
		;

КонецПроцедуры

&Тест
Процедура ИсходныйТипОпределяетсяРекурсивно() Экспорт

	Прокси = Новый КонструкторПрокси(Новый МойКласс()).Построить();
	ПроксиОтПрокси = Новый КонструкторПрокси(Прокси).Построить();

	Ожидаем.Что(ОбработкаПроксиОбъекта.ИсходныйТип(ПроксиОтПрокси)).Равно(Тип("МойКласс"));

КонецПроцедуры
