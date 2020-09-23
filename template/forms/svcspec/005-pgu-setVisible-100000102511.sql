-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

update GOVSRVREG.commonservice set visible = '0' where eservice_id=(select eservice_id from GOVSRVREG.eservice where eservice_extid='100000102511');
commit;