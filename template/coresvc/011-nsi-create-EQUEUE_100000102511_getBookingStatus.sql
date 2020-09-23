-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
declare
request_tpl VARCHAR(4000) := q'@<#ftl ns_prefixes={
"eq":"http://epgu.rtlabs.ru/equeue/ws/",
"rev":"http://smev.gosuslugi.ru/rev120315",
"typ":"http://epgu.rtlabs.ru/equeue/ws/types/",
"inc":"http://www.w3.org/2004/08/xop/include"}/>
<#assign req = xml["//eq:getBookingStatusRequest"]/>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:eq="http://epgu.rtlabs.ru/equeue/ws/" 
xmlns:rev="http://smev.gosuslugi.ru/rev120315" 
xmlns:inc="http://www.w3.org/2004/08/xop/include">
   <soap:Header/>
   <soap:Body>
${req[ "@@markup" ]}
 </soap:Body>
</soap:Envelope>@';
response_tpl VARCHAR(4000) :=q'@<#ftl ns_prefixes={
"ap":"http://epgu.rtlabs.ru/equeue/ws/",
"smev":"http://smev.gosuslugi.ru/rev120315",
"typ":"http://epgu.rtlabs.ru/equeue/ws/types/",
"wsu":"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"}/>
<#assign resp = appData />
<#assign msg = xml["//smev:Message"]/>
<ap:getBookingStatusResponse xmlns:ap="http://epgu.rtlabs.ru/equeue/ws/"
                 xmlns:smev="http://smev.gosuslugi.ru/rev120315"
                 xmlns:typ="http://epgu.rtlabs.ru/equeue/ws/types/"
                 xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
    <smev:Message>
    ${msg[ "@@markup" ]}
    </smev:Message>
    <smev:MessageData>
    ${resp[ "@@markup" ]}
    </smev:MessageData>
</ap:getBookingStatusResponse>@';

BEGIN
DELETE FROM nsi.ws_template WHERE ws_template_code = 'EQUEUE_100000102511_getBookingStatus_getBookingStatus';
INSERT INTO nsi.ws_template(ws_template_code, ws_request_template, ws_response_template)
VALUES('EQUEUE_100000102511_getBookingStatus_getBookingStatus', request_tpl, response_tpl);
NSI.PKG_REFREGISTRY.MODIFY_WSCONFIG(
ws_conf_code => 'EQUEUE_100000102511_getBookingStatus', -- nsi.ws_config.WS_CONFIG_CODE
uddi_key  => 'equeue_100000102511',  -- Ключ юди: equeue_мнемоникаСервисаЭО
ws_protocol => 'MR_2_5',
soap_action => 'getBookingStatus',
ws_sign_reg =>  'Y'
);
commit;
end;
/