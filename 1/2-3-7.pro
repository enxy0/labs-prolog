% ---------------------------------------------
% ������������ ������ �1                       
% ������� �2_3(7)                      
% �����: ������ ����� ���������     
% ����: 09.02.2021           
% ---------------------------------------------


% 3. (�� [��������,���������,2008,�.22])
% �������� ��������� ���� ������ ��� ���������  �  �����  ��  ����
% �������������� ��������� ���������� �������,  � �������� ���������,
% ����������:
%    (�) �� ����� 10 ������,  ����������� ��������� � ������� ������-
% ���;
%    (�) ����-��� ������, ���������� �������� ������� �������������;
%    (�) �� ����� ��� ������� �����������, ������ �� ������� ������-
% ���� �������� � ������������.
% 
% �������� ���������� �������.
% 
% (7) "���������� ���������".
% ���������-�����:
% 
% <���������>(<�����>,<�����>,<�����>,<�������>,
%                                         <�������_���_��������>).
% <�������>(<�����_��������>,<��������>,<�������_���������>,
%                       <����������_�������_�_�������_���������>).
% <����������>(<�����_����������>,<�����_��������>,<����������>,
%                                         <����>,<����_��������>). 

 
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
    supplier(1, "������ GO", "������� ��., 35, ������", "+7 (495) 940-77-51", "������ ������ ����������").
    supplier(2, "������", "������������� �������, 1, �����-���������", "+7 (800) 555 55 55", "�������� ������� ��������").
    supplier(3, "delivery Club", "��������� �����., 6, ����. 2, �����-���������" , "+7 (812) 448-53-28", "��������� �������� �������").
    
    product(666, "�������", "����", 227).
    product(777, "���", "���", 116000).
    product(888, "������", "����", 510).
    product(999, "���������", "����", 300).
    
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
    % ��������� ��������� ������� ����������� � ���� �������:
    %
    % �� ������ �������� �� ����� ������:
    % a) ���������� �� ��� ��������� (����, ����, ����������)
    % �) ��� ��������
    % �) ���������� � �������� - ��� ������������ � ���������
    % �) ��������� ����������� (�������� � ��� ����������)
    nl,
    delivery(ProductNum, Date, ProvidePrice, ProvideTotal), 
    productNameByNum(ProductNum, Name), 
    productCaloriesByNum(ProductNum, ProductUnit, ProductCalories),
    supplierByDelievery(ProductNum, SupplierNum, SupplierCompany, SupplierFullName, ProvideTotal), 
    nl,

    % ������� �������:
    write("������� ", Name, " �������� � ", Date, ". � ����������: ", ProvideTotal, ", �� ����: ", ProvidePrice), nl,
    write("� �������� ����������: ", ProductCalories, ProductUnit), nl,
    write("�������� ���������: ", SupplierCompany, " � ����: ", SupplierFullName), nl.