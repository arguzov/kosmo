class History < ActiveRecord::Base
    TYPES = {1=>'Сервис',2=>'Медикамент',3=>'Доктор',4=>'Акция',5=>'Новость',6=>'Секция'}
    TYPES_URLS = {'services'=>1,'medicaments'=>2,'experts'=>3,'promos'=>4,'posts'=>5,'section'=>6}
end
