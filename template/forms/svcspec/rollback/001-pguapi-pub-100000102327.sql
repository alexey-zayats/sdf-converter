-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

begin

   pgu.pkg_service2.UnLink_eservice2target(
    i_eservice => 100000102327,
    i_target => 6140100010000021790);
commit;
end;
/