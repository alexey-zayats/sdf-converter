-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
begin
delete NSI.REFATTR where REF_NAME = '61_mintrud_dul';
delete NSI.REFREGISTRY where REF_NAME = '61_mintrud_dul';
delete NSI.DICITEMHIERARCHY where DIC_CODE = '61_mintrud_dul';
delete NSI.DICITEM where DIC_CODE = '61_mintrud_dul';
delete NSI.DIC where DIC_CODE = '61_mintrud_dul';
INSERT INTO NSI.REFREGISTRY  (REF_NAME, REF_TITLE, REF_DESCRIPTION, REF_KIND, REF_TABLENAME, REF_VALUECOLUMNNAME, REF_TITLECOLUMNNAME, REF_PARENTCOLUMNNAME, REF_ADAPTER, REF_MEMCACHELIFETIME, REF_WS_CONFIG_CODE, REF_FED)
VALUES ('61_mintrud_dul', 'РнД_Минтруд_ДУЛ', null, 'P', null, 'dicitem_code', 'dicitem_name', 'dicitem_code', 'pgu_refs_v1', 60, null, 'N');



INSERT INTO NSI.DIC (DIC_CODE, DIC_NAME, DIC_KIND, DIC_SOURCE, RECORDSTATUS)
VALUES ('61_mintrud_dul', 'РнД_Минтруд_ДУЛ', 'P', 'external', 'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','1',q'@Удостоверение личности гражданина РФ@',null,1,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','2',q'@Паспорт гражданина РФ@',null,2,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','3',q'@Заграничный паспорт гражданина РФ@',null,3,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','4',q'@Дипломатический паспорт РФ@',null,4,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','5',q'@Служебный паспорт РФ@',null,5,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','6',q'@Свидетельство на возвращение@',null,6,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','7',q'@Свидетельство о рождении@',null,7,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','8',q'@Временное удостоверение личности гражданина@',null,8,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','9',q'@Удостоверение личности военнослужащего РФ@',null,9,'A');
INSERT INTO NSI.DICITEM (DIC_CODE,DICITEM_CODE,DICITEM_NAME,DICITEM_EXTCODE,ORDERNUMBER,RECORDSTATUS) values ('61_mintrud_dul','0',q'@Не задан@',null,100,'A');
commit;
end;
/
