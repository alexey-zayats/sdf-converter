-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
DELETE PGUFORMS.VALIDATOR WHERE MNEMONIC='rnd_name';
commit;
end;
/