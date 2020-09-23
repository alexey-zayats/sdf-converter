-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
begin
delete PGUFORMS.FORM where MNEMONIC='100000102511';
commit;
end;
/