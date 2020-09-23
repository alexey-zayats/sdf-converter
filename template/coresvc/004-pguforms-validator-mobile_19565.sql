-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='mobile_19565';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'mobile_19565', q'@Номер телефона +7(XXX)XXXXXXX@', q'@Номер телефона +7(XXX)XXXXXXX@', q'@(^(\+7\(\d{3}\)\d{7})$)|(^$)@', q'@Введите телефонный номер в формате:+7(XXX)XXXXXXX@', null, null);
commit;
end;
/