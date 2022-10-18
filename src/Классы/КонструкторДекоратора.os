#Использовать logos
#Использовать tempfiles
#Использовать "../internal"

// Инстанс логгера
Перем Лог;

// Ссылка на исходный объект
Перем ИсходныйОбъект;

// Ссылка на конструируемый декоратор
Перем Декоратор;

// Таблица добавленных пользователем методов
Перем ПользовательскиеМетоды;

// Таблица добавленных пользователем полей
Перем ПользовательскиеПоля;

// Таблица добавленных польвователем импортов библиотек
Перем ПользовательскиеИмпорты;

// Таблица добавленнных пользователем шагов инициализации
Перем ПользовательскиеШагиИнициализации;

// Таблица добавленных пользователем перехватичков вызовов методов
Перем ПерехватчикиМетодов;

// Флаг поддержки аннотаций в рефлекторе
Перем АннотацииПоддерживаются;

// Флаг поддержки возможности отладки добавленных методов
Перем Отладка;

#Область ПрограммныйИнтерфейс

// Включает возможность отладки. Достигается сохранением текста модуля во временный файл.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция Отладка(Включена = Истина) Экспорт
	
	Отладка = Включена;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор новое приватное поле.
//
// Параметры:
//   ИмяПоля - Строка - Имя добавляемого поля
//   ЗначениеПоля - Произвольный - Значение, которым необходимо проинициализировать добавляемое поле.
//                                 Если не задано, поле не инициализируется и содержит Неопределено.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПриватноеПоле(ИмяПоля, ЗначениеПоля = Неопределено) Экспорт
	
	НовоеПоле = ПользовательскиеПоля.Добавить();
	НовоеПоле.ИмяПоля = ИмяПоля;
	НовоеПоле.Экспорт = Ложь;
	НовоеПоле.ЗначениеПоля = ЗначениеПоля;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор новое публичное (экспортное) поле.
//
// Параметры:
//   ИмяПоля - Строка - Имя добавляемого поля
//   ЗначениеПоля - Произвольный - Значение, которым необходимо проинициализировать добавляемое поле.
//                                 Если не задано, поле не инициализируется и содержит Неопределено.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПубличноеПоле(ИмяПоля, ЗначениеПоля = Неопределено) Экспорт
	
	НовоеПоле = ПользовательскиеПоля.Добавить();
	НовоеПоле.ИмяПоля = ИмяПоля;
	НовоеПоле.Экспорт = Истина;
	НовоеПоле.ЗначениеПоля = ЗначениеПоля;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор новый публичный (экспортный) метод.
//
// Параметры:
//   ИмяМетода - Строка - Имя добавляемого метода.
//   ТекстМетода - Строка - Текст добавляемого метода. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьМетод(ИмяМетода, ТекстМетода) Экспорт
	
	НовыйМетод = ПользовательскиеМетоды.Добавить();
	НовыйМетод.ИмяМетода = ИмяМетода;
	НовыйМетод.ПараметрыМетода = Новый Массив;
	НовыйМетод.ТекстМетода = ТекстМетода;
	
	Возврат ЭтотОбъект;
КонецФункции

// Добавляет в декоратор перехватчик, срабатывающий перед вызовом указанного метода.
//
// Параметры:
//   ИмяМетода - Строка - Имя перехватываемого метода.
//   ТекстПерехватчика - Текст - Текст добавляемого перехватчика. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПередВызовомМетода(ИмяМетода, ТекстПерехватчика) Экспорт
	
	НовыйПерехватчикМетода = ПерехватчикиМетодов.Добавить();
	НовыйПерехватчикМетода.ИмяМетода = ИмяМетода;
	НовыйПерехватчикМетода.ТипПерехватчика = ТипыПерехватчиковМетода.Перед;
	НовыйПерехватчикМетода.ТекстПерехватчика = ТекстПерехватчика;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор перехватчик, срабатывающий после вызова указанного метода.
//
// Параметры:
//   ИмяМетода - Строка - Имя перехватываемого метода.
//   ТекстПерехватчика - Текст - Текст добавляемого перехватчика. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПослеВызоваМетода(ИмяМетода, ТекстПерехватчика) Экспорт
	
	НовыйПерехватчикМетода = ПерехватчикиМетодов.Добавить();
	НовыйПерехватчикМетода.ИмяМетода = ИмяМетода;
	НовыйПерехватчикМетода.ТипПерехватчика = ТипыПерехватчиковМетода.После;
	НовыйПерехватчикМетода.ТекстПерехватчика = ТекстПерехватчика;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор импорт библиотеки (#Использовать) по имени библиотеки.
//
// Параметры:
//   ИмяБиблиотеки - Строка - Имя библиотеки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьИмпортПоИмени(ИмяБиблиотеки) Экспорт
	
	НовыйИмпорт = ПользовательскиеИмпорты.Добавить();
	НовыйИмпорт.ПодключениеПоИмени = Истина;
	НовыйИмпорт.Библиотека = ИмяБиблиотеки;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор импорт библиотеки (#Использовать) по пути к библиотеке.
//
// Параметры:
//   ПутьКБиблиотеке - Строка - Путь к библиотеке. Можно использовать как абсолютный, так и относительный путь.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьИмпортПоПути(ПутьКБиблиотеке) Экспорт
	
	НовыйИмпорт = ПользовательскиеИмпорты.Добавить();
	НовыйИмпорт.ПодключениеПоИмени = Ложь;
	НовыйИмпорт.Библиотека = ПутьКБиблиотеке;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор шаг инициализации в тело модуля.
//
// Параметры:
//   ТекстШага - Строка - Выполняемый код.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьШагИнициализации(ТекстШага) Экспорт
	
	НовыйШагИнициализации = ПользовательскиеШагиИнициализации.Добавить();
	НовыйШагИнициализации.Шаг = ТекстШага;
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Получить сконструированный текст сценария будущего декоратора
//
//  Возвращаемое значение:
//   Строка - Текст сценария декоратора
//
Функция ТекстСценария() Экспорт
	
	Лог.Отладка("Тип исходного объекта: %1", ТипЗнч(ИсходныйОбъект));
	Лог.Отладка("Представление исходного объекта: %1", ИсходныйОбъект);
	
	ТекстСценарияДекоратора = КэшируемыеДанные.ТекстШаблонаОбъектаДекоратора();
	
	ТекстСценарияДекоратора = СтрЗаменить(ТекстСценарияДекоратора, "// {Область импортов}", ОбластьИмпортов());
	ТекстСценарияДекоратора = СтрЗаменить(ТекстСценарияДекоратора, "// {Область переменных}", ОбластьПеременных());
	ТекстСценарияДекоратора = СтрЗаменить(ТекстСценарияДекоратора, "// {Область методов}", ОбластьМетодов());
	ТекстСценарияДекоратора = СтрЗаменить(ТекстСценарияДекоратора, "// {Инициализация}", ОбластьИнициализации());
	
	Возврат ТекстСценарияДекоратора;
	
КонецФункции

// Сконструировать готовый декоратор по настройкам конструктора Декоратор.
//
// Параметры:
//   ТекстСценария - Строка - Текст сценария декоратора. Если не задан, формируется автоматически.
//
//  Возвращаемое значение:
//   Произвольный - Декоратор над объектом, переданным в конструктор Декоратор
//
Функция Построить(ТекстСценария = Неопределено) Экспорт
	Если ТекстСценария = Неопределено Тогда
		ТекстСценария = ТекстСценария();
	КонецЕсли;
	Декоратор = СоздатьДекоратор(ТекстСценария);
	Возврат Декоратор;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Конструктор
//
// Параметры:
//   Объект - Произвольный - Инстанс объекта, над которым нужно создать декоратор.
//
Процедура ПриСозданииОбъекта(Объект)
	ИсходныйОбъект = Объект;
	Лог = Логирование.ПолучитьЛог("oscript.lib.decorator");

	Отладка = ЗначениеЗаполнено(ПолучитьПеременнуюСреды("OSCRIPT_DECORATOR_DEBUG"));
	
	ПользовательскиеМетоды = Новый ТаблицаЗначений();
	ПользовательскиеМетоды.Колонки.Добавить("ИмяМетода");
	ПользовательскиеМетоды.Колонки.Добавить("ПараметрыМетода");
	ПользовательскиеМетоды.Колонки.Добавить("ТекстМетода");
	
	ПользовательскиеПоля = Новый ТаблицаЗначений();
	ПользовательскиеПоля.Колонки.Добавить("ИмяПоля");
	ПользовательскиеПоля.Колонки.Добавить("Экспорт", Новый ОписаниеТипов("Булево"));
	ПользовательскиеПоля.Колонки.Добавить("ЗначениеПоля");
	
	ПользовательскиеИмпорты = Новый ТаблицаЗначений();
	ПользовательскиеИмпорты.Колонки.Добавить("Библиотека");
	ПользовательскиеИмпорты.Колонки.Добавить("ПодключениеПоИмени", Новый ОписаниеТипов("Булево"));
	
	ПользовательскиеШагиИнициализации = Новый ТаблицаЗначений();
	ПользовательскиеШагиИнициализации.Колонки.Добавить("Шаг");
	
	ПерехватчикиМетодов = Новый ТаблицаЗначений();
	ПерехватчикиМетодов.Колонки.Добавить("ИмяМетода");
	ПерехватчикиМетодов.Колонки.Добавить("ТипПерехватчика");
	ПерехватчикиМетодов.Колонки.Добавить("ТекстПерехватчика");
	
	Рефлектор = Новый Рефлектор;
	Методы = Рефлектор.ПолучитьТаблицуМетодов(ИсходныйОбъект);
	
	АннотацииПоддерживаются = Истина;
	Если Методы.Колонки.Найти("Аннотации") = Неопределено Тогда
		АннотацииПоддерживаются = Ложь;
	КонецЕсли;
КонецПроцедуры

Функция ОбластьИмпортов()
	
	ОбластьИмпортов = "";
	
	ШаблонИмпорта = "#Использовать %2%1%2" + Символы.ПС;
	Для Каждого Импорт Из ПользовательскиеИмпорты Цикл
		Кавычки = ?(Импорт.ПодключениеПоИмени, "", """");
		ОбластьИмпортов = ОбластьИмпортов + СтрШаблон(ШаблонИмпорта, Импорт.Библиотека, Кавычки);
	КонецЦикла;
	
	Возврат ОбластьИмпортов;
	
КонецФункции

Функция ОбластьПеременных()
	
	ОбластьПеременных = "";
	
	ДобавитьДекорируемыеПоля(ОбластьПеременных);
	ДобавитьПользовательскиеПоля(ОбластьПеременных);
	
	Возврат ОбластьПеременных;
	
КонецФункции

Процедура ДобавитьДекорируемыеПоля(ОбластьПеременных)
	
	Рефлектор = Новый Рефлектор;
	Свойства = Рефлектор.ПолучитьТаблицуСвойств(ИсходныйОбъект);
	Лог.Отладка("Количество свойств: %1", Свойства.Количество());
	
	ШаблонПеременной = "Перем %1 Экспорт;" + Символы.ПС;
	Для Каждого Свойство Из Свойства Цикл
		ОбластьПеременных = ОбластьПеременных + СтрШаблон(ШаблонПеременной, Свойство.Имя);
	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьПользовательскиеПоля(ОбластьПеременных)
	
	ШаблонПеременной = "Перем %1%2;" + Символы.ПС;
	Для Каждого ПользовательскоеПоле Из ПользовательскиеПоля Цикл
		СимволЭкспорт = ?(ПользовательскоеПоле.Экспорт, " Экспорт", "");
		ОбластьПеременных = ОбластьПеременных + СтрШаблон(
			ШаблонПеременной,
			ПользовательскоеПоле.ИмяПоля,
			СимволЭкспорт
		);
	КонецЦикла;
	
КонецПроцедуры

Функция ОбластьМетодов()
	
	ОбластьМетодов = "";
	
	ДобавитьДекорируемыеМетоды(ОбластьМетодов);
	ДобавитьПользовательскиеМетоды(ОбластьМетодов);
	
	Возврат ОбластьМетодов;
	
КонецФункции

Функция ОбластьИнициализации()
	
	ОбластьИнициализации = "";
	
	ШаблонШагаИнициализации = "%1" + Символы.ПС;
	Для Каждого ПользовательскийШаг Из ПользовательскиеШагиИнициализации Цикл
		ОбластьИнициализации = ОбластьИнициализации + СтрШаблон(ШаблонШагаИнициализации, ПользовательскийШаг.Шаг);
	КонецЦикла;
	
	Возврат ОбластьИнициализации;
	
КонецФункции

Процедура ДобавитьДекорируемыеМетоды(ОбластьМетодов)
	
	Рефлектор = Новый Рефлектор;
	Методы = Рефлектор.ПолучитьТаблицуМетодов(ИсходныйОбъект);
	Лог.Отладка("Количество методов: %1", Методы.Количество());
	
	ШаблонМетода = КэшируемыеДанные.ТекстШаблонаМетодаДекоратора();
	
	ШаблонИмениПараметра = "Парам%1";
	ШаблонОписанияПараметра = "%1 %2 = Неопределено";
	ШаблонВыполняемаяСтрока = "Декоратор_ВыполняемаяСтрока = ""Декоратор_ИсходныйОбъект.%1(%2)"";";
	
	Для Каждого Метод Из Методы Цикл
		
		Если Не Метод.Экспорт Тогда
			Продолжить;
		КонецЕсли;
		
		МассивИменаПараметров = Новый Массив;
		МассивСтрокаПараметров = Новый Массив;
		сч = 1;
		Для Каждого ПараметрМетода Из Метод.Параметры Цикл
			сч = сч + 1;
			
			ИмяПараметра = СтрШаблон(ШаблонИмениПараметра, сч);
			МассивИменаПараметров.Добавить(ИмяПараметра);
			
			СтрокаАннотацийПараметров = ПолучитьСтрокуАннотаций(ПараметрМетода);
			МассивСтрокаПараметров.Добавить(СтрШаблон(ШаблонОписанияПараметра, СтрокаАннотацийПараметров, ИмяПараметра));
		КонецЦикла;
		
		ИмяМетода = ПолучитьИмяМетода(Метод.Имя);
		ОписаниеПараметровМетода = СтрСоединить(МассивСтрокаПараметров, ", ");
		ПараметрыВызоваМетода = СтрСоединить(МассивИменаПараметров, ", ");
		
		ВыполняемаяСтрока = СтрШаблон(ШаблонВыполняемаяСтрока, ИмяМетода, ПараметрыВызоваМетода);
		
		СтрокаАннотацийМетода = ПолучитьСтрокуАннотаций(Метод);
		
		ТипМетода = "Декоратор_ТипМетода = " + Формат(Метод.ЭтоФункция, "БЛ=Ложь; БИ=Истина") + ";";
		ВозвращаемоеЗначение = "Возврат Декоратор_ВозвращаемоеИзМетодаЗначение;";
		
		НовыйМетод = ШаблонМетода;
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {АннотацияМетода}", СтрокаАннотацийМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "Декоратор_ИмяМетода", ИмяМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "Декоратор_ОписаниеПараметровМетода", ОписаниеПараметровМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Декоратор_ВыполняемаяСтрока}", ВыполняемаяСтрока);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Декоратор_ТипМетода}", ТипМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Декоратор_ВозвращаемоеЗначение}", ВозвращаемоеЗначение);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Экспорт}", "Экспорт");
			
		ДобавитьПерехватчикиМетода(ИмяМетода, НовыйМетод, Истина);
		
		НовыйМетод = НовыйМетод + Символы.ПС;
		
		ОбластьМетодов = ОбластьМетодов + НовыйМетод;
	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьПользовательскиеМетоды(ОбластьМетодов)
	
	ШаблонМетода = КэшируемыеДанные.ТекстШаблонаПользовательскогоМетода();
	
	Для Каждого Метод Из ПользовательскиеМетоды Цикл
		
		СтрокаАннотацийМетода = "";
		ИмяМетода = Метод.ИмяМетода;
		ОписаниеПараметровМетода = "";
		
		НовыйМетод = ШаблонМетода;
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {АннотацияМетода}", СтрокаАннотацийМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "Декоратор_ИмяМетода", ИмяМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "Декоратор_ОписаниеПараметровМетода", ОписаниеПараметровМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Декоратор_ТекстМетода}", Метод.ТекстМетода);
		НовыйМетод = СтрЗаменить(НовыйМетод, "// {Экспорт}", "Экспорт");
		
		ДобавитьПерехватчикиМетода(ИмяМетода, НовыйМетод);
		
		ОбластьМетодов = ОбластьМетодов + НовыйМетод;
	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьПерехватчикиМетода(ИмяМетода, ТекстМетода, ЭтоДекорируемыйМетод = Ложь)
	
	ПередВызовомМетода = ПолучитьТекстПерехватчика(ИмяМетода, ТипыПерехватчиковМетода.Перед);
	ПослеВызоваМетода = ПолучитьТекстПерехватчика(ИмяМетода, ТипыПерехватчиковМетода.После);
	
	ЗаменяемаяСтрокаПеред = "// {Декоратор_ПередВызовомМетода}";
	ЗаменяемаяСтрокаПосле = "// {Декоратор_ПослеВызоваМетода}";

	Если ЭтоДекорируемыйМетод Тогда
		ЗаменяемаяСтрокаПеред = "// {Декоратор_ПередВызовомДекорируемогоМетода}";
		ЗаменяемаяСтрокаПосле = "// {Декоратор_ПослеВызоваДекорируемогоМетода}";
	КонецЕсли;

	ТекстМетода = СтрЗаменить(ТекстМетода, ЗаменяемаяСтрокаПеред, ПередВызовомМетода);
	ТекстМетода = СтрЗаменить(ТекстМетода, ЗаменяемаяСтрокаПосле, ПослеВызоваМетода);
	
КонецПроцедуры

Функция ПолучитьТекстПерехватчика(ИмяМетода, ТипПерехватчика)
	
	Фильтры = Новый Структура("ИмяМетода,ТипПерехватчика", ИмяМетода, ТипПерехватчика);
	ПерехватчикиМетода = ПерехватчикиМетодов.НайтиСтроки(Фильтры);
	
	ТекстПерехватчика = "";
	Для Каждого ПерехватчикМетода Из ПерехватчикиМетода Цикл
		ТекстПерехватчика = ТекстПерехватчика + ПерехватчикМетода.ТекстПерехватчика + Символы.ПС;
	КонецЦикла;
	
	Возврат ТекстПерехватчика;
	
КонецФункции

Функция ПолучитьСтрокуАннотаций(ВладелецАннотации)
	
	Если НЕ АннотацииПоддерживаются Тогда
		Возврат "";
	КонецЕсли;
	
	ШаблонАннотации = "&%1%2";
	СтрокаАннотаций = "";
	
	Если ВладелецАннотации.Аннотации = Неопределено Тогда
		Возврат СтрокаАннотаций;
	КонецЕсли;
	
	КоллекцияАннотаций = Новый Соответствие;
	АннотацииСАмперсандом = Новый Массив;
	Для Каждого Аннотация Из ВладелецАннотации.Аннотации Цикл
		СтрокаПараметры = ПолучитьСтрокуПараметровАннотаций(Аннотация);
		АннотацииСАмперсандом.Добавить(СтрШаблон(ШаблонАннотации, Аннотация.Имя, СтрокаПараметры));
	КонецЦикла;
	
	СтрокаАннотаций = СтрСоединить(АннотацииСАмперсандом, Символы.ПС);
	
	Возврат СтрокаАннотаций;
КонецФункции

Функция ПолучитьСтрокуПараметровАннотаций(Аннотация)
	СтрокаМетодов = "";
	Если Аннотация.Параметры = Неопределено Тогда
		Возврат СтрокаМетодов;
	КонецЕсли;
	
	ШаблонПараметров = "%1 %2 %3";
	ПараметрыДляСтроки = Новый Массив;
	
	Для Каждого Параметр Из Аннотация.Параметры Цикл
		СтрокаРавно = "";
		
		Если ЗначениеЗаполнено(Параметр.Имя) И ЗначениеЗаполнено(Параметр.Значение) Тогда
			СтрокаРавно = "=";
		КонецЕсли;
		
		ЗначенияПараметраСтрокой = ПолучитьЗначениеПараметраВСтроку(Параметр.Значение);
		СтрокаПараметров = СтрШаблон(ШаблонПараметров, Параметр.Имя, СтрокаРавно, ЗначенияПараметраСтрокой);
		ПараметрыДляСтроки.Добавить(СтрокаПараметров);
	КонецЦикла;
	
	ШаблонСтроки = "(%1)";
	СтрокаМетодов = СтрСоединить(ПараметрыДляСтроки, ",");
	
	Возврат СтрШаблон(ШаблонСтроки, СтрокаМетодов);
КонецФункции

Функция ПолучитьЗначениеПараметраВСтроку(Знач ЗначениеПараметра)
	
	ВозвращаемоеЗначение = Неопределено;
	
	Если ТипЗнч(ЗначениеПараметра) = Тип("Строка") Тогда
		ВозвращаемоеЗначение = Символ(34) + ЗначениеПараметра + Символ(34);
	ИначеЕсли ТипЗнч(ЗначениеПараметра) = Тип("Число") Тогда
		ВозвращаемоеЗначение = ЗначениеПараметра;
	ИначеЕсли ТипЗнч(ЗначениеПараметра) = Тип("Булево") Тогда
		ВозвращаемоеЗначение = Формат(ЗначениеПараметра, "БЛ=Ложь; БИ=Истина");
	Иначе
		ВозвращаемоеЗначение = "";
	КонецЕсли;
	
	Возврат ВозвращаемоеЗначение;
КонецФункции

Функция ПолучитьИмяМетода(Знач ИмяМетода)
	ВозвращаемоеЗначение = ИмяМетода;
	ШаблонНовогоИмени = "_%1";
	
	НедопустимыеИмена = Новый Массив;
	НедопустимыеИмена.Добавить("найти");
	
	Если НЕ НедопустимыеИмена.Найти(Нрег(ИмяМетода)) = Неопределено Тогда
		ВозвращаемоеЗначение = СтрШаблон(ШаблонНовогоИмени, ИмяМетода);
	КонецЕсли;
	
	Возврат ВозвращаемоеЗначение;
КонецФункции

Функция СоздатьДекоратор(ТекстСценария)
	
	ИменаМетодов = Новый Соответствие;
	
	РежимСозданияИзТипа = ТипЗнч(ИсходныйОбъект) = Тип("Тип");
	
	Лог.Отладка(ТекстСценария);
	
	Если Отладка = Истина Тогда
		ИмяВременногоФайла = ВременныеФайлы.НовоеИмяФайла("os");
		ЗаписьТекста = Новый ЗаписьТекста();
		ЗаписьТекста.Открыть(ИмяВременногоФайла);
		ЗаписьТекста.Записать(ТекстСценария);
		ЗаписьТекста.Закрыть();
		Декоратор = ЗагрузитьСценарий(ИмяВременногоФайла);
	Иначе
		Декоратор = ЗагрузитьСценарийИзСтроки(ТекстСценария);
	КонецЕсли;
	
	ИнстансИсходногоОбъекта = Неопределено;
	Если РежимСозданияИзТипа Тогда
		Попытка
			// TODO: Параметры конструктора
			ИнстансИсходногоОбъекта = Новый(ИсходныйОбъект);
		Исключение
			ВызватьИсключение СтрШаблон("Невозможно создать объект из данного типа объекта <%1>", ИсходныйОбъект);
		КонецПопытки;
	Иначе
		ИнстансИсходногоОбъекта = ИсходныйОбъект;
	КонецЕсли;
	
	Рефлектор = Новый Рефлектор();
	Рефлектор.УстановитьСвойство(Декоратор, Константы_Декоратор.Поле_ИнстансОбъекта, ИнстансИсходногоОбъекта);
	
	Для Каждого ПользовательскоеПоле Из ПользовательскиеПоля Цикл
		Если ПользовательскоеПоле.ЗначениеПоля = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		Рефлектор.УстановитьСвойство(Декоратор, ПользовательскоеПоле.ИмяПоля, ПользовательскоеПОле.ЗначениеПоля);
	КонецЦикла;
	
	Если ИнстансИсходногоОбъекта <> Неопределено Тогда
		ОбработкаДекоратора.СинхронизироватьПоля(ИнстансИсходногоОбъекта, Декоратор);
	КонецЕсли;
	
	Возврат Декоратор;
	
КонецФункции

#КонецОбласти