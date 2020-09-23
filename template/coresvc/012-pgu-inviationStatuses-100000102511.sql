-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

declare
statList PGU.PKG_SERVICE2.T$LISTINVITATIONMAPPING := PGU.PKG_SERVICE2.T$LISTINVITATIONMAPPING(
PGU.PKG_SERVICE2.T$RECINVSTATUS('100','ERROR'),
PGU.PKG_SERVICE2.T$RECINVSTATUS('201','CONFIRMED'),
PGU.PKG_SERVICE2.T$RECINVSTATUS('301','CANCELLED'));
begin
PGU.PKG_SERVICE2.UPDATE_INVITATION_STATUS(
state_structure_extid => '-6140100010000000777', -- код ведомства для "Записи на прием"
can_cancel => 'N',
can_change_time=> 'N',
can_change_org=> 'N',
mapping_status_list => statList
);
COMMIT;
end;
/