-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
delete pguforms.xslt where MNEMONIC='{{.ServiceFormCode}}.ws';
commit;
end;
/
