-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:

begin
  PGU.PKG_SRVFUTILS.create_service(
    extid                  => '6140100010000021765',
    categories             => 'PERSON,LEGAL',
    es_id                  => 100000102327,
    targets                => PGU.PKG_SRVFUTILS.T$TARGETS(6140100010000021790),
    fnames                 => PGU.PKG_SRVFUTILS.T$NAMES('Получение информации о порядке предоставления жилищно-коммунальных услуг населению'),
    fshortnames            => PGU.PKG_SRVFUTILS.T$NAMES('Получение информации о порядке предоставления жилищно-коммунальных услуг населению'),
    fp                     => 'pguformsbeta',
    edsstatus_code         => 'EDS_NOT_SUPPORTED',
    eservice_online        => '0',
    active                 => 'Y',
    OKATO                  => '60000000000', --просьба проверить корректность кода ОКАТО
    published              => 1,
    edstype                => 'V_3_0',
    spec_code              => 'MR',
    spec_type              => 'CALL',
    soap_action            => null,
    ftl_template           => null,
    ftl_response           => null,
    transport              => 'SOAP_11',
    uddikey                => '100000102327',
    bundle_code            => 'top10',
    uddikey_region_search  => 'N',
    asynch_response        => 'N',
    status_notchange       => 'N',
    log_status             => 'Y',
    icon_name              => null,
    org_status_list        => null,
    protocol               => 'V_3_0'
  );

commit;
end;
/