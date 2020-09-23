-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
begin
pgu.PKG_SERVICE2.UNLINK_EQUEUE2COMMON(
i_equeueService => 100000102511,
i_target => {{.ServiceTargetID}},
i_eservice => {{.ServiceFormCode}},
i_okato => '60000000000',
i_ext_type => 'EQUEUE_INVITE'
);

commit;
end;
/
