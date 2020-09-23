-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
begin
    delete GOVSRVREG.ESERVICEATTR where ESERVICE_ID=(select eservice_id from GOVSRVREG.eservice where eservice_extid='{{.ServiceFormCode}}') and ESERVICEATTR_NAME <> 'new_fs';

    INSERT INTO GOVSRVREG.ESERVICEATTR (ESERVICE_ID, ESERVICEATTR_NAME, ESERVICEATTR_TYPE, ESERVICEATTR_BOOLVALUE, ESERVICEATTR_STRVALUE, ESERVICEATTR_LONGVALUE, ESERVICEATTR_DATEVALUE)
    VALUES ((select eservice_id from GOVSRVREG.eservice where eservice_extid='{{.ServiceFormCode}}'), 'INFOMAT_NOT_SUPPORTED', 'BOOL', 'Y', null, null, null) ;

    INSERT INTO GOVSRVREG.ESERVICEATTR (ESERVICE_ID, ESERVICEATTR_NAME, ESERVICEATTR_TYPE, ESERVICEATTR_BOOLVALUE, ESERVICEATTR_STRVALUE, ESERVICEATTR_LONGVALUE, ESERVICEATTR_DATEVALUE)
    VALUES ((select eservice_id from GOVSRVREG.eservice where eservice_extid='{{.ServiceFormCode}}'), 'frguCardForMpULDisabled', 'BOOL', 'Y', null, null, null) ;

commit;
end;
/
