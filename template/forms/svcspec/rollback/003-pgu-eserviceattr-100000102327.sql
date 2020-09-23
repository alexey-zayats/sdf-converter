-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
begin
    delete GOVSRVREG.ESERVICEATTR where ESERVICE_ID=(select eservice_id from GOVSRVREG.eservice where eservice_extid='{{.ServiceFormCode}}') and ESERVICEATTR_NAME <> 'new_fs';

commit;
end;
/
