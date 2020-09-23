-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;


BEGIN
DELETE FROM nsi.ws_template WHERE ws_template_code = 'EQUEUE_100000102511_getSlots_getSlots';
commit;
end;
/