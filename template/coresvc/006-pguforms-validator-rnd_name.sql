-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='rnd_name';
INSERT INTO PGUFORMS.VALIDATOR(ID, MNEMONIC, NAME, SHORT_DESCRIPTION, REGEXP, MESSAGE, JS, AUTHORID) VALUES (PGUFORMS.VALIDATOR_SEQ.nextval, 'rnd_name', q'@���_���@', q'@����������, ������� ���������� ��������. ����������� ���� ���� �������� ��������@', q'@^[�-��-߸���]{2,50}$@', q'@����������, ������� ���������� ��������. ����������� ���� ���� �������� ��������@', null, null);
commit;
end;
/