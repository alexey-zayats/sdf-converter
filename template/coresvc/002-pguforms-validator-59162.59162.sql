-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='59162.59162';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, '59162.59162', q'@����� �������� +X(XXX)XXXXXXX@', q'@������� � ������� +X(XXX)XXXXXXX@', q'@(^(\+\d\(\d{3}\)\d{7})$)|(^$)@', q'@������� ���������� ����� � �������:+X(XXX)XXXXXXX@', null, null);
commit;
end;
/