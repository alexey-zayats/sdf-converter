-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;

BEGIN
DELETE FROM nsi.ws_template WHERE ws_template_code = 'EQUEUE_100000102511_getBookingStatus_getBookingStatus';
commit;
end;
/