% ---------------------------------------------
% Лабораторная работа №1                       
% Задание №2_3(7)                      
% Автор: Бушуев Никта Федорович     
% Дата: 09.02.2021           
% ---------------------------------------------


% 3. (По [Цуканова,Дмитриева,2008,с.22])
% Создайте небольшую базу данных для указанной  в  одном  из  ниже
% представленных вариантов предметной области,  и напишите программу,
% содержащую:
%    (а) не менее 10 фактов,  описывающих указанные в задании отноше-
% ния;
%    (б) двух-трёх правил, выражающих типичные запросы пользователей;
%    (в) не менее трёх целевых утверждений, ответы на которые необхо-
% димо отразить в комментариях.
% 
% Варианты предметной области.
% 
% (7) "Поставщики продуктов".
% Отношения-факты:
% 
% <поставщик>(<номер>,<фирма>,<адрес>,<телефон>,
%                                         <фамилия_имя_отчество>).
% <продукт>(<номер_продукта>,<название>,<единица_измерения>,
%                       <количество_калорий_в_единице_измерения>).
% <поставляет>(<номер_поставщика>,<номер_продукта>,<количество>,
%                                         <цена>,<дата_поставки>). 

 
domains
   % supplier
   supplierNum = integer
   supplierCompany, supplierAddress, supplierPhone, supplierFullName = symbol

   % product
   productNum, productCalories = integer
   productName, productUnit = symbol

   % provide
   provideTotal, providePrice = integer
   provideDate = symbol

predicates
   nondeterm supplier(supplierNum, supplierCompany, supplierAddress, supplierPhone, supplierFullName).
   nondeterm product(productNum, productName, productUnit, productCalories).
   nondeterm provide(supplierNum, productNum, provideTotal, providePrice, provideDate).

   nondeterm delivery(productNum, provideDate, providePrice, provideTotal).
   nondeterm productNameByNum(productNum, productName).
   nondeterm productCaloriesByNum(productNum, productUnit, productCalories).
   nondeterm supplierByDelievery(productNum, supplierNum, supplierCompany, supplierFullName, provideTotal).

clauses
    supplier(1, "Яндекс GO", "Валовая ул., 35, Москва", "+7 (495) 940-77-51", "Козарь Галина Несторовна").
    supplier(2, "Готово", "Комендантская площадь, 1, Санкт-Петербург", "+7 (800) 555 55 55", "Торсунов Евдоким Эмилевич").
    supplier(3, "delivery Club", "Лиговский просп., 6, корп. 2, Санкт-Петербург" , "+7 (812) 448-53-28", "Мещеряков Прокофий Юриевич").
    
    product(666, "Котлета", "ккал", 227).
    product(777, "Рис", "кал", 116000).
    product(888, "Бигмак", "ккал", 510).
    product(999, "Чизбургер", "ккал", 300).
    
    provide(3, 666, 5, 20, "09.02.2021").
    provide(2, 888, 10, 135, "10.02.2021").
    provide(1, 777, 1, 77, "11.02.2021").
    provide(2, 999, 2, 55, "11.02.2021").
    provide(3, 999, 5, 60, "10.02.2021").

    delivery(ProductNum, ProvideDate, ProvidePrice, ProvideTotal):-  
        provide(_, ProductNum, ProvideTotal, ProvidePrice, ProvideDate).

    productNameByNum(ProductNum, ProductName):-
        product(ProductNum, ProductName, _, _).

    productCaloriesByNum(ProductNum, ProductUnit, ProductCalories):- 
        product(ProductNum, _, ProductUnit, ProductCalories).

    supplierByDelievery(ProductNum, SupplierNum, SupplierCompany, SupplierFullName, ProvideTotal):- 
        provide(SupplierNum, ProductNum, ProvideTotal, _, _), 
        supplier(SupplierNum, SupplierCompany, _, _, SupplierFullName).
goal
    % Объединил несколько целевых утверждений в одно большое:
    %
    % По номеру продукта мы можем узнать:
    % a) информацию по его поставкам (дату, цену, количество)
    % б) имя продукта
    % в) информацию о продукте - его калорийность с единицами
    % г) возможных поставщиков (компанию и фио поставщика)
    nl,
    delivery(ProductNum, Date, ProvidePrice, ProvideTotal), 
    productNameByNum(ProductNum, Name), 
    productCaloriesByNum(ProductNum, ProductUnit, ProductCalories),
    supplierByDelievery(ProductNum, SupplierNum, SupplierCompany, SupplierFullName, ProvideTotal), 
    nl,

    % Красиво выводим:
    write("Продукт ", Name, " поставят к ", Date, ". в количестве: ", ProvideTotal, ", по цене: ", ProvidePrice), nl,
    write("В продукте содержится: ", ProductCalories, ProductUnit), nl,
    write("Компания поставщик: ", SupplierCompany, " в лице: ", SupplierFullName), nl.