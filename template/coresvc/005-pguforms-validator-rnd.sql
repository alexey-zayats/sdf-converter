-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='rnd';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'rnd', q'@РнД_Фамилия@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и дефис@', q'@^[а-яА-ЯёЁйЙ-]{2,200}$@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и дефис@', null, null);
commit;
end;
/