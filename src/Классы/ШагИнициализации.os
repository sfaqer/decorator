#Область ОписаниеПеременных

Перем Тело; // Текст шага инициализации

#КонецОбласти

// Конструктор
//
// Параметры:
//   ТелоШага - Строка - тело шага инициализации
//
Процедура ПриСозданииОбъекта(ТелоШага)
	
	Тело = ТелоШага;

КонецПроцедуры

#Область СлужебныйПрограммныйИнтерфейс

// Строковое представление шага инициализации
//
//  Возвращаемое значение:
//   Строка - Строковое представление шага инициализации
//
Функция Описание() Экспорт
	Возврат Тело;
КонецФункции

#КонецОбласти
