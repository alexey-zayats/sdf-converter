-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

BEGIN
update LK.SC_SERVICE_CONFIG set GET_SMEV3_STATUS='N' where  eservice_code='100000102327';
commit;
end;
/