-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
update LK.SC_SERVICE_CONFIG set GET_SMEV3_STATUS='Y' where eservice_code='100000102327' and SC_SPEC_ID = (select SC_SPEC_ID from LK.SC_SPEC where SC_SPEC_CODE = 'MR' AND SC_SPEC_TYPE = 'CALL');

commit;