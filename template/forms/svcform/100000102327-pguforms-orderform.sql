-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
declare
  v_Content clob;
  v_New_Trg integer;
  v_New_ID integer;
begin
v_Content := {{.FormJSON}};

  merge into pguforms.form f
  using (select
              '{{.ServiceTargetName}}' NAME,
              to_timestamp('23.06.2020 09:22:49', 'dd.mm.yyyy HH24:MI:SS') CREATE_DATE,
              to_timestamp('29.06.2020 16:27:20', 'dd.mm.yyyy HH24:MI:SS') UPDATE_DATE,
              v_Content CONTENT,
              'N' DELETED,
              1000413036 AUTHORID,
              null EDS_TYPE,
              null PRESENTATION_TYPE,
              null RECIPIENT,
              '{{.ServiceFormCode}}' MNEMONIC,
              null XSLT,
              'OID.1000413036'LOGIN,
              'Ибрагимович З.П.' FIO,
              'PUBLIC_API_XML' XML_PAYLOAD_TYPE,
              null APP_DATA_TRANSFORMER
          from dual) u
 on (f.MNEMONIC = u.MNEMONIC)
  when matched then update set NAME = u.NAME,
                             CREATE_DATE = u.CREATE_DATE,
                             UPDATE_DATE = systimestamp,
                             CONTENT = u.CONTENT,
                             DELETED = u.DELETED,
                             AUTHORID = u.AUTHORID,
                             EDS_TYPE = u.EDS_TYPE,
                             PRESENTATION_TYPE = u.PRESENTATION_TYPE,
                             RECIPIENT = u.RECIPIENT,
                             XSLT = u.XSLT,
                             LOGIN = u.LOGIN,
                             FIO = u.FIO,
                             XML_PAYLOAD_TYPE = u.XML_PAYLOAD_TYPE,
                             APP_DATA_TRANSFORMER = u.APP_DATA_TRANSFORMER
  when not matched then insert (ID,NAME,CREATE_DATE,UPDATE_DATE,CONTENT,DELETED,AUTHORID,EDS_TYPE,PRESENTATION_TYPE,
                     RECIPIENT,MNEMONIC,XSLT,LOGIN,FIO,XML_PAYLOAD_TYPE,APP_DATA_TRANSFORMER)
                      values (pguforms.form_seq.nextval,u.NAME,u.CREATE_DATE,systimestamp,u.CONTENT,u.DELETED,u.AUTHORID,u.EDS_TYPE,u.PRESENTATION_TYPE,
                              u.RECIPIENT,u.MNEMONIC,u.XSLT,u.LOGIN,u.FIO,u.XML_PAYLOAD_TYPE,u.APP_DATA_TRANSFORMER);

commit;
end;
/
