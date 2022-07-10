#Использовать logos
#Использовать "../internal"

#Область ОписаниеПеременных

// Инстанс логгера
Перем Лог;

// Ссылка на исходный объект
Перем ИсходныйОбъект;

// Ссылка на конструируемый декоратор
Перем Декоратор;

// Массив добавленных пользователем методов
Перем ПользовательскиеМетоды;

// Массив добавленных пользователем полей
Перем ПользовательскиеПоля;

// Массив добавленных польвователем импортов библиотек
Перем ПользовательскиеИмпорты;

// Массив добавленнных пользователем шагов инициализации
Перем ПользовательскиеШагиИнициализации;

// Массив добавленных пользователем перехватичков вызовов методов
Перем ПерехватчикиМетодов;

// Массив значения параметров инициализатора объекта по типу
Перем ЗначенияПараметровКонструктораПоТипу;

// Декоратор создаётся из типа
Перем РежимСозданияИзТипа;

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Добавляет в декоратор новое поле
//
// Параметры:
//   Поле - Поле - Добавляемое поле
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьПоле(Поле) Экспорт
	
	ПользовательскиеПоля.Добавить(Поле);
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор новый метод.
//
// Параметры:
//   Метод - Метод - Добавляемый метод.
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьМетод(Метод) Экспорт
	
	ПользовательскиеМетоды.Добавить(Метод);
	
	Возврат ЭтотОбъект;

КонецФункции

// Добавляет в декоратор перехватчик
//
// Параметры:
//   Перехватчик - Перехватчик - Добавляемый перехватчик
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьПерехватчик(Перехватчик) Экспорт
	
	ПерехватчикиМетодов.Добавить(Перехватчик);
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор импорт библиотеки (#Использовать).
//
// Параметры:
//   Импорт - Импорт - Импорт бибилотеки
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьИмпорт(Импорт) Экспорт
	
	ПользовательскиеИмпорты.Добавить(Импорт);
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет в декоратор шаг инициализации в тело модуля.
//
// Параметры:
//   ШагИнициализации - ШагИнициализации - Выполняемый шаг инициализации
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьШагИнициализации(ШагИнициализации) Экспорт
	
	ПользовательскиеШагиИнициализации.Добавить(ШагИнициализации);
	
	Возврат ЭтотОбъект;
	
КонецФункции

// Добавляет значение параметра для инициалзации объекта, в случае создания декоратора из типа
//
// Параметры:
//   ЗначениеПараметра - Произвольный - Значение параметра конструктора по типу
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ДобавитьЗначениеПараметраКонструктораПоТипу(ЗначениеПараметра) Экспорт

	Если Не РежимСозданияИзТипа Тогда
		ВызватьИсключение "Значения параметров конструктора по типу задаются только для декораторов типа";
	КонецЕсли;

	ЗначенияПараметровКонструктораПоТипу.Добавить(ЗначениеПараметра);
	
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
//   Объект - Произвольный - Инстанс объекта, над которым нужно создать декоратор
//          - Тип          - Тип объекта, инстанс которого нужно создатьи задекорировать
//          - Неопределено - Декоратор создаётся с нуля
//
Процедура ПриСозданииОбъекта(Объект = Неопределено)
	
	ИсходныйОбъект = Объект;

	РежимСозданияИзТипа = ТипЗнч(ИсходныйОбъект) = Тип("Тип");

	Лог = Логирование.ПолучитьЛог("oscript.lib.decorator");
	
	ПользовательскиеМетоды               = Новый Массив;
	ПользовательскиеПоля                 = Новый Массив;
	ПользовательскиеИмпорты              = Новый Массив;
	ПользовательскиеШагиИнициализации    = Новый Массив;
	ПерехватчикиМетодов                  = Новый Массив;
	ЗначенияПараметровКонструктораПоТипу = Новый Массив;

КонецПроцедуры

Функция ОбластьИмпортов()
	
	ОбластьИмпортов = Новый Массив;
	
	Для Каждого Импорт Из ПользовательскиеИмпорты Цикл
		ОбластьИмпортов.Добавить(Импорт.Описание());
	КонецЦикла;
	
	Возврат СтрСоединить(ОбластьИмпортов, Символы.ПС);
	
КонецФункции

Функция ОбластьПеременных()
	
	ОбластьПеременных = Новый Массив();
	
	ДобавитьДекорируемыеПоля(ОбластьПеременных);
	ДобавитьПользовательскиеПоля(ОбластьПеременных);
	
	Возврат СтрСоединить(ОбластьПеременных, Символы.ПС);
	
КонецФункции

Процедура ДобавитьДекорируемыеПоля(ОбластьПеременных)
	
	Если ИсходныйОбъект = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Рефлектор = Новый Рефлектор;
	Свойства = Рефлектор.ПолучитьТаблицуСвойств(ИсходныйОбъект);
	
	Лог.Отладка("Количество свойств: %1", Свойства.Количество());

	Для Каждого Свойство Из Свойства Цикл

		Поле = Новый Поле(Свойство.Имя)
			.Публичное();

		Для каждого АннотацияСвойства Из Свойство.Аннотации Цикл

			Аннотация = Новый Аннотация(АннотацияСвойства.Имя);

			Если АннотацияСвойства.Параметры = Неопределено Тогда

				Поле.ДобавитьАннотацию(Аннотация);

				Продолжить;

			КонецЕсли;

			Для каждого ПараметрАннотации Из АннотацияСвойства.Параметры Цикл
				
				Аннотация.ДобавитьПараметр(ПараметрАннотации.Значение, ПараметрАннотации.Имя);

			КонецЦикла;

			Поле.ДобавитьАннотацию(Аннотация);

		КонецЦикла;

		ОбластьПеременных.Добавить(Поле.Описание());

	КонецЦикла;

КонецПроцедуры

Процедура ДобавитьПользовательскиеПоля(ОбластьПеременных)

	Для Каждого ПользовательскоеПоле Из ПользовательскиеПоля Цикл

		ОбластьПеременных.Добавить(ПользовательскоеПоле.Описание());

	КонецЦикла;
	
КонецПроцедуры

Функция ОбластьМетодов()
	
	ОбластьМетодов = Новый Массив;
	
	ДобавитьДекорируемыеМетоды(ОбластьМетодов);
	ДобавитьПользовательскиеМетоды(ОбластьМетодов);
	
	Возврат СтрСоединить(ОбластьМетодов, Символы.ПС);
	
КонецФункции

Функция ОбластьИнициализации()
	
	ОбластьИнициализации = Новый Массив;
	
	Для Каждого ПользовательскийШаг Из ПользовательскиеШагиИнициализации Цикл
		ОбластьИнициализации.Добавить(ПользовательскийШаг.Описание());
	КонецЦикла;
	
	Возврат СтрСоединить(ОбластьИнициализации, Символы.ПС);
	
КонецФункции

Процедура ДобавитьДекорируемыеМетоды(ОбластьМетодов)
	
	Если ИсходныйОбъект = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Рефлектор = Новый Рефлектор;
	МетодыИсходногоОбъекта = Рефлектор.ПолучитьТаблицуМетодов(ИсходныйОбъект);
	Лог.Отладка("Количество методов: %1", МетодыИсходногоОбъекта.Количество());
	
	Для Каждого МетодИсходногоОбъекта Из МетодыИсходногоОбъекта Цикл
		
		Если Не МетодИсходногоОбъекта.Экспорт Тогда
			Продолжить;
		КонецЕсли;
		
		ИмяМетода = ПолучитьИмяМетода(МетодИсходногоОбъекта.Имя);

		Метод = Новый Метод(ИмяМетода)
			.Публичный();
		
		Для каждого АннотацияИсходногоОбъекта Из МетодИсходногоОбъекта.Аннотации Цикл

			Аннотация = Новый Аннотация(АннотацияИсходногоОбъекта.Имя);

			Если АннотацияИсходногоОбъекта.Параметры = Неопределено Тогда
				
				Метод.ДобавитьАннотацию(Аннотация);

				Продолжить;
			
			КонецЕсли;

			Для каждого ПараметрАннотации Из АннотацияИсходногоОбъекта.Параметры Цикл
				
				Аннотация.ДобавитьПараметр(ПараметрАннотации.Значение, ПараметрАннотации.Имя);

			КонецЦикла;

			Метод.ДобавитьАннотацию(Аннотация);

		КонецЦикла;

		ИменаПараметров = Новый Массив();

		Для Каждого ПараметрМетода Из МетодИсходногоОбъекта.Параметры Цикл

			ИменаПараметров.Добавить(ПараметрМетода.Имя);

			Параметр = Новый ПараметрМетода(ПараметрМетода.Имя);

			Если ПараметрМетода.ПоЗначению Тогда
				 Параметр.ПоЗначению();
			КонецЕсли;

			Если ПараметрМетода.ЕстьЗначениеПоУмолчанию Тогда
				Параметр.ЗначениеПоУмолчанию(Неопределено);
			КонецЕсли;

			Для каждого АннотацияПараметрМетода Из ПараметрМетода.Аннотации Цикл

				Аннотация = Новый Аннотация(АннотацияПараметрМетода.Имя);
	
				Если АннотацияПараметрМетода.Параметры = Неопределено Тогда
				
					Параметр.ДобавитьАннотацию(Аннотация);
	
					Продолжить;
				
				КонецЕсли;

				Для каждого ПараметрАннотации Из АннотацияПараметрМетода.Параметры Цикл
					
					Аннотация.ДобавитьПараметр(ПараметрАннотации.Значение, ПараметрАннотации.Имя);
	
				КонецЦикла;
	
				Параметр.ДобавитьАннотацию(Аннотация);
	
			КонецЦикла;

			Метод.ДобавитьПараметр(Параметр);

		КонецЦикла;
		
		ТелоМетода = КэшируемыеДанные.ТекстШаблонаТелоМетодаДекоратора(); 
		ТипМетода = СтрШаблон(
			"Декоратор_ТипМетода = %1;",
			ПараметрыМенеджер.ОписаниеЗначения(МетодИсходногоОбъекта.ЭтоФункция)
		);
		
		ШаблонВыполняемаяСтрока = "Декоратор_ВыполняемаяСтрока = ""Декоратор_ИсходныйОбъект.%1(%2)"";";
		ВыполняемаяСтрока = СтрШаблон(ШаблонВыполняемаяСтрока, ИмяМетода, СтрСоединить(ИменаПараметров, ", "));
		ВозвращаемоеЗначение = "Возврат Декоратор_ВозвращаемоеИзМетодаЗначение;";

		ТелоМетода = СтрЗаменить(ТелоМетода, "// {Декоратор_ВыполняемаяСтрока}", ВыполняемаяСтрока);
		ТелоМетода = СтрЗаменить(ТелоМетода, "// {Декоратор_ТипМетода}", ТипМетода);
		ТелоМетода = СтрЗаменить(ТелоМетода, "// {Декоратор_ВозвращаемоеЗначение}", ВозвращаемоеЗначение);

		Метод.ТелоМетода(ТелоМетода);

		НовыйМетод = Метод.Описание();
		
		ДобавитьПерехватчикиМетода(ИмяМетода, НовыйМетод);

		ОбластьМетодов.Добавить(НовыйМетод);

	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьПользовательскиеМетоды(ОбластьМетодов)
	
	Для Каждого Метод Из ПользовательскиеМетоды Цикл
		
		НовыйМетод = Метод.Описание();
		
		ДобавитьПерехватчикиМетода(Метод.ИмяМетода(), НовыйМетод);
		
		ОбластьМетодов.Добавить(НовыйМетод);

	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьПерехватчикиМетода(ИмяМетода, ТекстМетода)
	
	ТекстыПерехватчиков = ТекстыПерехватчиков(ИмяМетода);

	ТекстМетода = СтрЗаменить(
		ТекстМетода,
		"// {Декоратор_ПередВызовомМетода}",
		СтрСоединить(ТекстыПерехватчиков.Получить(ТипыПерехватчиковМетода.Перед), Символы.ПС)
	);
	
	ТекстМетода = СтрЗаменить(
		ТекстМетода,
		"// {Декоратор_ПослеВызоваМетода}",
		СтрСоединить(ТекстыПерехватчиков.Получить(ТипыПерехватчиковМетода.После), Символы.ПС)
	);
	
КонецПроцедуры

Функция ТекстыПерехватчиков(ИмяМетода)
	
	Результат = Новый Соответствие;

	Результат.Вставить(ТипыПерехватчиковМетода.Перед, Новый Массив);
	Результат.Вставить(ТипыПерехватчиковМетода.После, Новый Массив);

	Для каждого Перехватчик Из ПерехватчикиМетодов Цикл
		
		Перехватчик = Перехватчик.Описание();

		Если Перехватчик.ИмяМетода <> ИмяМетода Тогда
			Продолжить;
		КонецЕсли;

		Результат.Получить(Перехватчик.ТипПерехватчика).Добавить(Перехватчик.ТелоПерехватчика);

	КонецЦикла;

	Возврат Результат;

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
	
	Лог.Отладка(ТекстСценария);
	
	Декоратор = ЗагрузитьСценарийИзСтроки(ТекстСценария);
	
	ИнстансИсходногоОбъекта = Неопределено;
	Если РежимСозданияИзТипа Тогда
		ИнстансИсходногоОбъекта = Новый(ИсходныйОбъект, ЗначенияПараметровКонструктораПоТипу);
	Иначе
		ИнстансИсходногоОбъекта = ИсходныйОбъект;
	КонецЕсли;
	
	Рефлектор = Новый Рефлектор();
	Рефлектор.УстановитьСвойство(Декоратор, Константы_Декоратор.Поле_ИнстансОбъекта, ИнстансИсходногоОбъекта);
	
	Для Каждого ПользовательскоеПоле Из ПользовательскиеПоля Цикл
		
		ОписаниеЗначения = ПользовательскоеПоле.ОписаниеЗначенияПоУмолчанию();

		Если ОписаниеЗначения.ЕстьЗначениеПоУмолчанию Тогда
			Рефлектор.УстановитьСвойство(Декоратор, ОписаниеЗначения.ИмяПоля, ОписаниеЗначения.ЗначениеПоУмолчанию);
		КонецЕсли;
		
	КонецЦикла;
	
	Если ИнстансИсходногоОбъекта <> Неопределено Тогда
		ОбработкаДекоратора.СинхронизироватьПоля(ИнстансИсходногоОбъекта, Декоратор);
	КонецЕсли;
	
	Возврат Декоратор;
	
КонецФункции

#КонецОбласти