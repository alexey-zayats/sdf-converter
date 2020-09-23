-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='rnd_otch';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'rnd_otch', q'@РнД_Отчество@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и пробел@', q'@(^([А-Яа-яёЁ \s]+)$)|(^$)@', q'@Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и пробел@', null, null);
commit;
end;
/