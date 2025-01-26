Перем КешИнстансИсходногоОбъекта; // Кеш инстансов исходных объектов по именам типов
Перем КешЗначениеПоляПоУмолчанию; // Кеш значений по умолчанию для полей типов

Функция ИнстансИсходногоОбъекта(ИмяТипа) Экспорт

	ИнстансИсходногоОбъекта = Неопределено;

	ОписаниеИсходногоОбъекта = КешИнстансИсходногоОбъекта.Получить(ИмяТипа);

	Если ОписаниеИсходногоОбъекта = Неопределено Тогда
		
		Возврат ИнстансИсходногоОбъекта;
		
	КонецЕсли;

	Если ОписаниеИсходногоОбъекта.РежимСозданияИзТипа Тогда
		
		ИнстансИсходногоОбъекта = Новый(
			ОписаниеИсходногоОбъекта.ИсходныйОбъект,
			ОписаниеИсходногоОбъекта.ЗначенияПараметровКонструктораПоТипу
		);

	Иначе
		ИнстансИсходногоОбъекта = ОписаниеИсходногоОбъекта.ИсходныйОбъект;
	КонецЕсли;

	Возврат ИнстансИсходногоОбъекта;

КонецФункции

Функция ЗначениеПоляПоУмолчанию(ИмяТипа, ИмяПоля) Экспорт
	
	КешПолейПоТипу = КешЗначениеПоляПоУмолчанию.Получить(ИмяТипа);

	Если КешПолейПоТипу = Неопределено Тогда
		Возврат Неопределено;
	Иначе
		Возврат КешПолейПоТипу.Получить(ИмяПоля);
	КонецЕсли;

КонецФункции

Процедура УстановитьЗначениеПоляПоУмолчанию(ИмяТипа, ИмяПоля, Значение) Экспорт
	
	КешПолейПоТипу = КешЗначениеПоляПоУмолчанию.Получить(ИмяТипа);

	Если КешПолейПоТипу = Неопределено Тогда
		КешПолейПоТипу = Новый Соответствие;
		КешЗначениеПоляПоУмолчанию.Вставить(ИмяТипа, КешПолейПоТипу);
	КонецЕсли;

	КешПолейПоТипу.Вставить(ИмяПоля, Значение);

КонецПроцедуры

Процедура УстановитьИнстансИсходногоОбъекта(
	ИмяТипа,
	РежимСозданияИзТипа,
	ИсходныйОбъект,
	ЗначенияПараметровКонструктораПоТипу = Неопределено) Экспорт

	КешИнстансИсходногоОбъекта.Вставить(
		ИмяТипа,
		Новый Структура(
			"РежимСозданияИзТипа, ИсходныйОбъект, ЗначенияПараметровКонструктораПоТипу",
			РежимСозданияИзТипа, ИсходныйОбъект, ЗначенияПараметровКонструктораПоТипу		
		)
	);

КонецПроцедуры

КешИнстансИсходногоОбъекта = Новый Соответствие();
КешЗначениеПоляПоУмолчанию = Новый Соответствие();
