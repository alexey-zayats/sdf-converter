-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:


begin
delete LK.INVITATION_STATUSES_MAPPING where state_org_id = (select STATE_ORG_ID from LK.STATE_ORGANIZATION where EXT_ID = '-6140100010000000777')
and state_org_status in('100','201','301');
commit;
end;
/