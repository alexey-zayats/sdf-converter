-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

begin

   pgu.pkg_service2.UnLink_eservice2target(
    i_eservice => 100000102511,
    i_target => -6140100010000000777);
commit;
end;
/