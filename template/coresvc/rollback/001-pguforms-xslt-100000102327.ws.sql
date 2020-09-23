-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
delete pguforms.xslt where MNEMONIC='100000102327.ws';
commit;
end;
/