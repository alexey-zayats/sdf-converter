-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='rnd_name';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'rnd_name', q'@РнД_имя@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита@', q'@^[а-яА-ЯёЁйЙ]{2,50}$@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита@', null, null);
commit;
end;
/