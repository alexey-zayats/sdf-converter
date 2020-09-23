-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='E-mail';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'E-mail', q'@E-mail@', null, q'@(^s*[a-zA-Z0-9!#"$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\s*$)|(^$)@', q'@Введите корректный e-mail. Например, test@test.ru@', null, 243190474);
commit;
end;
/