-- Author: Abakin
-- Change: 1
-- Description:
set define off;
declare
  v_Content clob;
  v_New_Trg integer;
  v_New_ID integer;
begin
v_Content := q'^{"className":"Form","name":"form","fullPath":"form","handlers":[],"needLoadDraft":false,"title":"�������������� �������������� ��������� (�� ����������� ��������� ��������) � ������ ��� ���������� ���^' ||
q'^���","stepsOnTop":false,"showDescription":false,"engineVersion":"EnginePlayerPgu","showAllSteps":true,"submitEvents":{"submit":[{"eventType":"submit","serviceKey":"100000103390","soapAction":"","reque^' ||
q'^stAppDataTransformer":"","requestTransformer":"100000103390.ws","responseTransformer":"","submitType":"FINAL","xmlPayloadType":"PUBLIC_API_XML","_id":0}]},"items":[{"className":"FormStep","name":"Form^' ||
q'^Step0","fullPath":"form.FormStep0","visible":false,"label":"��������� ������","title":"","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId^' ||
q'^"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","n^' ||
q'^ame":"ClaimDetails","fullPath":"form.FormStep0.ClaimDetails","title":"","submitEvents":{},"items":[{"className":"Panel","name":"service","fullPath":"form.FormStep0.ClaimDetails.service","visible":fals^' ||
q'^e,"title":"��������� ������ �����","submitEvents":{},"items":[{"className":"FieldText","name":"userId","fullPath":"form.FormStep0.ClaimDetails.service.userId","value":"������������� ������������","str^' ||
q'^ategy":"user_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"TypeID","fullPath":"form.FormStep0.ClaimDetails.service.TypeID","value":"��� ������������","strategy":"user_type","^' ||
q'^forceXml":true,"theMaskedValue":"����� ���������","submitEvents":{}},{"className":"FieldText","name":"CreateDate_order","fullPath":"form.FormStep0.ClaimDetails.service.CreateDate_order","readonly":tru^' ||
q'^e,"immutable":true,"label":"���� ������","strategy":"current_date","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"okato","fullPath":"form.FormStep0.ClaimDetails.service.okato","la^' ||
q'^bel":"����� ��������������","strategy":"location_code","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguDepartmentId","fullPath":"form.FormStep0.ClaimDetails.service.srguDepartm^' ||
q'^entId","handlers":[],"label":"��� ��������� (����)","strategy":"form_target_org_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguDepartmentName","fullPath":"form.FormStep0.C^' ||
q'^laimDetails.service.srguDepartmentName","handlers":[],"label":"������������ ��������� (����)","strategy":"form_target_org_name","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srgu^' ||
q'^ServiceId","fullPath":"form.FormStep0.ClaimDetails.service.srguServiceId","handlers":[],"label":"��� ���� ������ (����)","strategy":"form_target_id","forceXml":true,"submitEvents":{}},{"className":"Fi^' ||
q'^eldText","name":"srguServiceName","fullPath":"form.FormStep0.ClaimDetails.service.srguServiceName","handlers":[],"label":"������������ ���� ������ (����))","strategy":"form_target_name","forceXml":tru^' ||
q'^e,"submitEvents":{}},{"className":"FieldText","name":"CaseNumber","fullPath":"form.FormStep0.ClaimDetails.service.CaseNumber","label":"����� ���������","strategy":"order_id","forceXml":true,"theMasked^' ||
q'^Value":"������������� ������������","submitEvents":{}},{"className":"FieldText","name":"code","fullPath":"form.FormStep0.ClaimDetails.service.code","value":"100000103390","theMaskedValue":"10000010338^' ||
q'^8","submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStep1","fullPath":"form.FormStep1","label":"1","title":"�������� � ���������","submitEvents":{"submit":^' ||
q'^[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"^' ||
q'^__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"PanelAgent","fullPath":"form.FormStep1.PanelAgent","title":"","submitEvents":{},"items":[{"className":"Panel^' ||
q'^","name":"Panel465","fullPath":"form.FormStep1.PanelAgent.Panel465","title":"","submitEvents":{},"items":[{"className":"FieldCheckbox","name":"represent","fullPath":"form.FormStep1.PanelAgent.Panel465^' ||
q'^.represent","label":"� �������� ��������� ��������� ��� �������������","textValue":"","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trusteeData","fullPath":"form.FormStep1.^' ||
q'^trusteeData","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panelsurname","fullPath":"form.FormStep1.trusteeData.Panelsurname","title":"","isGridItem":true,"gridWidth^' ||
q'^":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"trustee_surname","fullPath":"form.FormStep1.trusteeData.Panelsurname.trustee_surname","validators":[{"mnemonic":"rnd","message^' ||
q'^":"����������, ������� ���������� ��������. ����������� ���� ���� �������� �������� � �����"},{"mnemonic":"required"}],"required":true,"label":"�������","maxlength":60,"submitEvents":{}}],"rules":[]},^' ||
q'^{"className":"Panel","name":"PanelfirstName","fullPath":"form.FormStep1.trusteeData.PanelfirstName","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldT^' ||
q'^ext","name":"trustee_firstName","fullPath":"form.FormStep1.trusteeData.PanelfirstName.trustee_firstName","validators":[{"mnemonic":"rnd_name","message":"����������, ������� ���������� ��������. ������^' ||
q'^����� ���� ���� �������� ��������"},{"mnemonic":"required"}],"required":true,"label":"���","maxlength":60,"theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� �������������^' ||
q'^ ������� ��� ������������� ����������","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelmiddleName","fullPath":"form.FormStep1.trusteeData.PanelmiddleName","title":"","isGridItem":tru^' ||
q'^e,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"trustee_middleName","fullPath":"form.FormStep1.trusteeData.PanelmiddleName.trustee_middleName","validators":[{"mne^' ||
q'^monic":"rnd_otch","message":"����������, ������� ���������� ��������. ����������� ���� ���� �������� �������� � ������"}],"notRequiredText":"����������� ��� �������","label":"��������","maxlength":60,^' ||
q'^"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelpred_snils","fullPath":"form.FormStep1.trusteeData.Panelpred_snils","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents^' ||
q'^":{},"items":[{"className":"FieldText","name":"predSnils","fullPath":"form.FormStep1.trusteeData.Panelpred_snils.predSnils","required":true,"label":"�����","maxlength":4000,"forceXml":true,"theMaskVal^' ||
q'^ue":"000-000-000 00","saveWithMask":true,"minlength":14,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelpred_innip","fullPath":"form.FormStep1.trusteeData.Panelpred_innip","title":""^' ||
q'^,"isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"innip_pred","fullPath":"form.FormStep1.trusteeData.Panelpred_innip.innip_pred","required":true,"l^' ||
q'^abel":"���","maxlength":12,"theMaskValue":"000000000000","minlength":12,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelpred_ogrnip","fullPath":"form.FormStep1.trusteeData.Panelpred_^' ||
q'^ogrnip","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"ogrnip_pred","fullPath":"form.FormStep1.trusteeData.Panelpred_ogrnip.ogrnip_pre^' ||
q'^d","label":"������","maxlength":13,"theMaskValue":"0000000000000","minlength":13,"submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trustee_doc1","fullPath":"form.FormStep1.trus^' ||
q'^tee_doc1","title":"�������� �������������� �������� ���������","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"trustee_doc2","fullPath":"form.FormStep1.trustee_doc2","title":"","^' ||
q'^isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Paneltitle","fullPath":"form.FormStep1.trustee_doc2.Paneltitle","title":"","isGridItem":true,"submitEvents":{},"items":[{"className^' ||
q'^":"FieldDropdown","name":"Name1","fullPath":"form.FormStep1.trustee_doc2.Paneltitle.Name1","validators":[{"mnemonic":"required"}],"required":true,"label":"������������ ���������","text_value":"","dict^' ||
q'^ionary":{"type":"remote","code":"61_mintrud_dul","initRequest":false},"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelSerias","fullPath":"form.FormStep1.trustee_doc2.PanelSerias","ti^' ||
q'^tle":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Serial1","fullPath":"form.FormStep1.trustee_doc2.PanelSerias.Serial1","validators":[{"mnem^' ||
q'^onic":"required"}],"required":true,"label":"����� ���������","maxlength":10,"theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� ������������� ������� ��� ������������� ���^' ||
q'^�������","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelNumber","fullPath":"form.FormStep1.trustee_doc2.PanelNumber","title":"","isGridItem":true,"gridWidth":"one-third","submitEven^' ||
q'^ts":{},"items":[{"className":"FieldText","name":"Number1","fullPath":"form.FormStep1.trustee_doc2.PanelNumber.Number1","validators":[{"mnemonic":"required"}],"required":true,"label":"����� ���������",^' ||
q'^"maxlength":10,"theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� ������������� ������� ��� ������������� ����������","submitEvents":{}}],"rules":[]},{"className":"Panel"^' ||
q'^,"name":"PanelissueDate","fullPath":"form.FormStep1.trustee_doc2.PanelissueDate","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldTextDate","name":"fr^' ||
q'^omDate1","fullPath":"form.FormStep1.trustee_doc2.PanelissueDate.fromDate1","required":true,"label":"���� ������","limits":"|||past|","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Paneli^' ||
q'^ssuer","fullPath":"form.FormStep1.trustee_doc2.Panelissuer","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"Org1","fullPath":"form.FormStep1.trustee_doc2.Panel^' ||
q'^issuer.Org1","validators":[{"mnemonic":"required"}],"required":true,"label":"��� ����� ��������","maxlength":500,"submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trustee_doc3"^' ||
q'^,"fullPath":"form.FormStep1.trustee_doc3","title":"�������� � ������������� ���������","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"userdata","fullPath":"form.FormStep1.userda^' ||
q'^ta","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panelsurname","fullPath":"form.FormStep1.userdata.Panelsurname","title":"","isGridItem":true,"gridWidth":"one-third^' ||
q'^","submitEvents":{},"items":[{"className":"FieldText","name":"surname","fullPath":"form.FormStep1.userdata.Panelsurname.surname","required":true,"disabled":true,"label":"�������","maxlength":250,"stra^' ||
q'^tegy":"lastname","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelfirstName","fullPath":"form.FormStep1.userdata.PanelfirstName","title":"","isGridItem":true,"gridWidth":"one-third","^' ||
q'^submitEvents":{},"items":[{"className":"FieldText","name":"firstName","fullPath":"form.FormStep1.userdata.PanelfirstName.firstName","required":true,"disabled":true,"label":"���","maxlength":250,"strat^' ||
q'^egy":"firstname","theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� ������������� ������� ��� ������������� ����������","submitEvents":{}}],"rules":[]},{"className":"Pane^' ||
q'^l","name":"PanelmiddleName","fullPath":"form.FormStep1.userdata.PanelmiddleName","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"middle^' ||
q'^Name","fullPath":"form.FormStep1.userdata.PanelmiddleName.middleName","validators":[],"disabled":true,"label":"��������","maxlength":250,"strategy":"middlename","submitEvents":{}}],"rules":[]},{"class^' ||
q'^Name":"Panel","name":"Panelsnils","fullPath":"form.FormStep1.userdata.Panelsnils","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Snils^' ||
q'^","fullPath":"form.FormStep1.userdata.Panelsnils.Snils","required":true,"disabled":true,"label":"�����","maxlength":4000,"strategy":"snils","forceXml":true,"theMaskValue":"000-000-000 00","saveWithMas^' ||
q'^k":true,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelinnip","fullPath":"form.FormStep1.userdata.Panelinnip","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},^' ||
q'^"items":[{"className":"FieldText","name":"innip","fullPath":"form.FormStep1.userdata.Panelinnip.innip","required":true,"disabled":true,"label":"���","strategy":"inn","submitEvents":{}}],"rules":[]},{"^' ||
q'^className":"Panel","name":"Panelogrnip","fullPath":"form.FormStep1.userdata.Panelogrnip","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name"^' ||
q'^:"ogrnip","fullPath":"form.FormStep1.userdata.Panelogrnip.ogrnip","disabled":true,"label":"������","strategy":"businessmanbrief_ogrn","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel",^' ||
q'^"name":"Panel361","fullPath":"form.FormStep1.Panel361","title":"��������, �������������� ��������","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"userdoc","fullPath":"form.FormS^' ||
q'^tep1.userdoc","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Paneltitle","fullPath":"form.FormStep1.userdoc.Paneltitle","title":"","isGridItem":true,"submitEvents":{}^' ||
q'^,"items":[{"className":"FieldText","name":"title","fullPath":"form.FormStep1.userdoc.Paneltitle.title","required":true,"disabled":true,"label":"������������ ���������","maxlength":250,"strategy":"docu^' ||
q'^menttypename","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelSerias","fullPath":"form.FormStep1.userdoc.PanelSerias","title":"","isGridItem":true,"gridWidth":"one-third","submitEven^' ||
q'^ts":{},"items":[{"className":"FieldText","name":"Serias","fullPath":"form.FormStep1.userdoc.PanelSerias.Serias","required":true,"disabled":true,"label":"�����","maxlength":250,"strategy":"docseries","^' ||
q'^theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� ������������� ������� ��� ������������� ����������","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelNu^' ||
q'^mber","fullPath":"form.FormStep1.userdoc.PanelNumber","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Number","fullPath":"form.FormStep^' ||
q'^1.userdoc.PanelNumber.Number","required":true,"disabled":true,"label":"�����","maxlength":250,"strategy":"docnumber","theMaskedValue":"�������������� ���������������� ������������ � ����� ��������� ��^' ||
q'^����������� ������� ��� ������������� ����������","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelissueDate","fullPath":"form.FormStep1.userdoc.PanelissueDate","title":"","isGridItem^' ||
q'^":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"issueDate","fullPath":"form.FormStep1.userdoc.PanelissueDate.issueDate","validators":[{"mnemonic":"required"}^' ||
q'^],"required":true,"disabled":true,"label":"���� ������","maxlength":250,"strategy":"issuedate","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelissuer","fullPath":"form.FormStep1.user^' ||
q'^doc.Panelissuer","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"issuer","fullPath":"form.FormStep1.userdoc.Panelissuer.issuer","validators":[{"mnemonic":"requ^' ||
q'^ired"}],"required":true,"disabled":true,"label":"��� �����","maxlength":250,"strategy":"issueorg","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"Panel634","fullPath":"form.F^' ||
q'^ormStep1.Panel634","title":"���������� ����������","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"Contactinfo","fullPath":"form.FormStep1.Contactinfo","title":"","isGrid":true,"^' ||
q'^submitEvents":{},"items":[{"className":"Panel","name":"Panelphone","fullPath":"form.FormStep1.Contactinfo.Panelphone","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"c^' ||
q'^lassName":"FieldText","name":"MobilePhone","fullPath":"form.FormStep1.Contactinfo.Panelphone.MobilePhone","validators":[{"mnemonic":"mobile_19565","message":"������� ���������� ����� � �������:+7(XXX)^' ||
q'^XXXXXXX"},{"mnemonic":"required"}],"required":true,"label":"����� ����������� ��������","maxlength":14,"strategy":"person_mobile","theMaskValue":"+7(000)0000000","saveWithMask":true,"submitEvents":{}}^' ||
q'^],"rules":[]},{"className":"Panel","name":"Panelemail","fullPath":"form.FormStep1.Contactinfo.Panelemail","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"F^' ||
q'^ieldText","name":"Email","fullPath":"form.FormStep1.Contactinfo.Panelemail.Email","validators":[{"mnemonic":"E-mail","message":"������� ���������� e-mail. ��������, test@test.ru"},{"mnemonic":"require^' ||
q'^d"}],"required":true,"label":"����� ����������� �����","maxlength":250,"strategy":"person_email","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelAddress","fullPath":"form.FormStep1.C^' ||
q'^ontactinfo.PanelAddress","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"Fias","name":"RegAddressFL","fullPath":"form.FormStep1.Contactinfo.PanelAddress.RegAddressFL","validators^' ||
q'^":[{"mnemonic":"required"}],"required":true,"label":"�������� �� ������ ����������� �� ����� ����������","strategy":"address_reg_fias","submitEvents":{}},{"className":"FieldCheckbox","name":"adr_check^' ||
q'^","fullPath":"form.FormStep1.Contactinfo.PanelAddress.adr_check","label":"����� ����������� �� ��������� � ������� ������������ ����� ����������","textValue":"","submitEvents":{}},{"className":"Fias",^' ||
q'^"name":"FactAddressFL","fullPath":"form.FormStep1.Contactinfo.PanelAddress.FactAddressFL","validators":[{"mnemonic":"required"}],"required":true,"label":"�������� �� ������ ������������ ����� ��������^' ||
q'^��","submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStepUL","fullPath":"form.FormStepUL","handlers":[],"label":"1","title":"�������� � ��������� - �������^' ||
q'^���� ����","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"^' ||
q'^draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"PanelLegal","fullPath":"form.FormStepUL.PanelLegal","title":"","isGrid":^' ||
q'^true,"submitEvents":{},"items":[{"className":"Panel","name":"PanelorgName","fullPath":"form.FormStepUL.PanelLegal.PanelorgName","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"Fi^' ||
q'^eldTextArea","name":"orgName","fullPath":"form.FormStepUL.PanelLegal.PanelorgName.orgName","required":true,"disabled":true,"label":"������ ������������ �����������","strategy":"organizationbrief_orgfu^' ||
q'^llname","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelFullname","fullPath":"form.FormStepUL.PanelLegal.PanelFullname","title":"","isGridItem":true,"submitEvents":{},"items":[{"clas^' ||
q'^sName":"FieldText","name":"FullName","fullPath":"form.FormStepUL.PanelLegal.PanelFullname.FullName","required":true,"disabled":true,"label":"������� ������������","strategy":"organizationBrief_orgShor^' ||
q'^tName","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelfirm_opf","fullPath":"form.FormStepUL.PanelLegal.Panelfirm_opf","title":"","isGridItem":true,"submitEvents":{},"items":[{"class^' ||
q'^Name":"FieldText","name":"firm_opf","fullPath":"form.FormStepUL.PanelLegal.Panelfirm_opf.firm_opf","required":true,"disabled":true,"label":"��������������-�������� �����","maxlength":250,"strategy":"o^' ||
q'^rganizationbrief_legalform_value","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelINN","fullPath":"form.FormStepUL.PanelLegal.PanelINN","title":"","isGridItem":true,"gridWidth":"one-^' ||
q'^third","submitEvents":{},"items":[{"className":"FieldText","name":"INN","fullPath":"form.FormStepUL.PanelLegal.PanelINN.INN","required":true,"disabled":true,"readonly":true,"label":"���","maxlength":2^' ||
q'^50,"strategy":"organizationbrief_inn","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelOGRN","fullPath":"form.FormStepUL.PanelLegal.PanelOGRN","title":"","isGridItem":true,"gridWidth"^' ||
q'^:"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"OGRN","fullPath":"form.FormStepUL.PanelLegal.PanelOGRN.OGRN","required":true,"disabled":true,"readonly":true,"label":"����","ma^' ||
q'^xlength":250,"strategy":"organizationbrief_ogrn","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelkpp","fullPath":"form.FormStepUL.PanelLegal.Panelkpp","title":"","isGridItem":true,"g^' ||
q'^ridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"kpp","fullPath":"form.FormStepUL.PanelLegal.Panelkpp.kpp","validators":[],"disabled":true,"readonly":true,"label":"���^' ||
q'^","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"Panel_cont_info","fullPath":"form.FormStepUL.Panel_cont_info","title":"","isGrid":true,"submitEvents":{},"items":[{"classNam^' ||
q'^e":"Panel","name":"Panel76","fullPath":"form.FormStepUL.Panel_cont_info.Panel76","title":"���������� ����","isGridItem":true,"submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"Panel^' ||
q'^LastNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelLastNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"LastNameUL","f^' ||
q'^ullPath":"form.FormStepUL.Panel_cont_info.PanelLastNameUL.LastNameUL","required":true,"disabled":true,"label":"�������","strategy":"lastname","submitEvents":{}}],"rules":[]},{"className":"Panel","name^' ||
q'^":"PanelFirstNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelFirstNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Firs^' ||
q'^tNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelFirstNameUL.FirstNameUL","required":true,"disabled":true,"label":"���","strategy":"firstname","submitEvents":{}}],"rules":[]},{"className":"Pa^' ||
q'^nel","name":"PanelMiddleNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelMiddleNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText",^' ||
q'^"name":"MiddleNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelMiddleNameUL.MiddleNameUL","validators":[],"disabled":true,"label":"��������","strategy":"middlename","submitEvents":{}}],"rules"^' ||
q'^:[]},{"className":"Panel","name":"Panelposition","fullPath":"form.FormStepUL.Panel_cont_info.Panelposition","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"pos^' ||
q'^ition","fullPath":"form.FormStepUL.Panel_cont_info.Panelposition.position","required":true,"label":"���������","maxlength":100,"strategy":"organizationbrief_orgposition","submitEvents":{}}],"rules":[]^' ||
q'^},{"className":"Panel","name":"Panel129","fullPath":"form.FormStepUL.Panel_cont_info.Panel129","title":"���������� ����������","isGridItem":true,"submitEvents":{},"items":[],"rules":[]},{"className":"^' ||
q'^Panel","name":"PanelMobilePhoneUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelMobilePhoneUL","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldTex^' ||
q'^t","name":"MobilePhoneUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelMobilePhoneUL.MobilePhoneUL","validators":[{"mnemonic":"mobile_19565","message":"������� ���������� ����� � �������:+7(XXX)XX^' ||
q'^XXXXX"},{"mnemonic":"required"}],"required":true,"label":"�������","maxlength":14,"strategy":"org_phone","theMaskValue":"+7(000)0000000","saveWithMask":true,"submitEvents":{}}],"rules":[]},{"className^' ||
q'^":"Panel","name":"PanelEmailUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelEmailUL","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name"^' ||
q'^:"EmailUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelEmailUL.EmailUL","validators":[{"mnemonic":"E-mail","message":"������� ���������� e-mail. ��������, test@test.ru"},{"mnemonic":"required"}],^' ||
q'^"required":true,"label":"����� ����������� �����","maxlength":250,"strategy":"org_email","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel196","fullPath":"form.FormStepUL.Panel_cont_i^' ||
q'^nfo.Panel196","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"Fias","name":"PostalAddressUL","fullPath":"form.FormStepUL.Panel_cont_info.Panel196.PostalAddressUL","required":true^' ||
q'^,"label":"����������� �����","strategy":"address_legal_fias","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel290","fullPath":"form.FormStepUL.Panel_cont_info.Panel290","title":"","is^' ||
q'^GridItem":true,"submitEvents":{},"items":[{"className":"FieldCheckbox","name":"Checkbox_adr_UL","fullPath":"form.FormStepUL.Panel_cont_info.Panel290.Checkbox_adr_UL","label":"����������� ����� �� ����^' ||
q'^����� � ����������� �������","textValue":"","submitEvents":{}},{"className":"Fias","name":"FactAddressUL","fullPath":"form.FormStepUL.Panel_cont_info.Panel290.FactAddressUL","handlers":[],"required":t^' ||
q'^rue,"label":"����������� �����","submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":["Panel_cont_info.Panel290.FactAddressUL@visible=Panel_cont_info.Panel290.Checkbox_adr_UL@checked"]},{"className":^' ||
q'^"FormStep","name":"FormStep1749","fullPath":"form.FormStep1749","label":"2","title":"������ �� ������","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"^' ||
q'^id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"classNa^' ||
q'^me":"Panel","name":"Panel577","fullPath":"form.FormStep1749.Panel577","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"Label","name":"Label578","fullPath":"form.FormStep1749.Panel^' ||
q'^577.Label578","text":"����� ������������ � ������ ������ �������������� ��������� (�� ����������� ��������� ��������) ��� ���������� ������","submitEvents":{}}],"rules":[]},{"className":"Panel","name"^' ||
q'^:"Panel857","fullPath":"form.FormStep1749.Panel857","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"Fias","name":"Fias858","fullPath":"form.FormStep1749.Panel857.Fias858","requir^' ||
q'^ed":true,"label":"����� �������","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel645","fullPath":"form.FormStep1749.Panel645","title":"","isGridItem":true,"gridWidth":"one-half","sub^' ||
q'^mitEvents":{},"items":[{"className":"FieldText","name":"plo","fullPath":"form.FormStep1749.Panel645.plo","required":true,"label":"������� �������","submitEvents":{}}],"rules":[]},{"className":"Panel",^' ||
q'^"name":"Panel650","fullPath":"form.FormStep1749.Panel650","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name":"srok","fullPath":"form.FormSte^' ||
q'^p1749.Panel650.srok","required":true,"label":"������ ��","hint":"������� ������, ����������� ������ �� ��� � ����� �������� ��������������� �����������","submitEvents":{}}],"rules":[]},{"className":"P^' ||
q'^anel","name":"Panel647","fullPath":"form.FormStep1749.Panel647","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldTextArea","name":"target","fullPath":"form.FormStep1749.Panel^' ||
q'^647.target","required":true,"label":"������� ���������� �������","submitEvents":{}},{"className":"FieldTextArea","name":"etc","fullPath":"form.FormStep1749.Panel647.etc","label":"���� ��������","submi^' ||
q'^tEvents":{}}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStep3","fullPath":"form.FormStep3","html":"<br/>\n<br/><br/>","label":"3","title":"���������, ����������� ��� �������������� ^' ||
q'^������","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"dra^' ||
q'^ft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"Paneldoc_pred","fullPath":"form.FormStep3.Paneldoc_pred","title":"","submit^' ||
q'^Events":{},"items":[{"className":"FieldUpload","name":"Doc_pred1","fullPath":"form.FormStep3.Paneldoc_pred.Doc_pred1","required":true,"label":"��������, �������������� ���������� ������������� �������^' ||
q'^��","hint":"�������� ���������� � ������������� ������� (��������� ��� ����, ��������� �������� ��� ��������� ��� ���������)   1. ������������, ����������� � ������������� ������� �������, �� ��������^' ||
q'^����� ��������� ���������  ","mimeType":"","fileType":".jpg, .jpeg, .pdf, .rar","submitEvents":{}},{"className":"FieldUpload","name":"Doc_Pred2","fullPath":"form.FormStep3.Paneldoc_pred.Doc_Pred2","re^' ||
q'^quired":true,"label":"������������ ��������� ���������������� ����������� ������� ��������� ","hint":"������������ ��������� ���������������� ����������� ������� ���������  � ������� PKCS#7 ����������^' ||
q'^���� ����������  � zip-�����","mimeType":"","fileType":".zip","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel931","fullPath":"form.FormStep3.Panel931","title":"","submitEvents":{},"^' ||
q'^items":[{"className":"FieldUpload","name":"Doc1","fullPath":"form.FormStep3.Panel931.Doc1","label":"��������, �������������� �������������� ����� �� �������� ����� �� ������������� �������� ����������^' ||
q'^� ���������   \t","hint":" ��������, �������������� �������������� �������� ������������ ��������� � ���� �������������� ����������� �� ���� ������� ������������, ����������, �������� �������� ��� ���^' ||
q'^������������ ������������ ������. �������� ���������� � ������������� ������� (� ��������� ���, ���� ��������� ��������, ��������� ��� ���������)","mimeType":"","fileType":".jpg, .jpeg, .pdf, .rar, .z^' ||
q'^ip","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel1201","fullPath":"form.FormStep3.Panel1201","title":"","submitEvents":{},"items":[{"className":"FieldUpload","name":"Doc2","fullPa^' ||
q'^th":"form.FormStep3.Panel1201.Doc2","label":"������� �� �����  ","hint":" �� ������������, ��������������� �� ����������� ���������� ���������. �������� ���������� � ������������� ������� (� ���������^' ||
q'^ ���, ���� ��������� ��������, ��������� ��� ���������)","mimeType":"","fileType":".jpg, .jpeg, .pdf, .rar, .zip","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel1340","fullPath":"fo^' ||
q'^rm.FormStep3.Panel1340","title":"","submitEvents":{},"items":[{"className":"FieldUpload","name":"Doc3","fullPath":"form.FormStep3.Panel1340.Doc3","label":"���������, �������������� ����� �� ��������� ^' ||
q'^�������������� ��������� � ������ ��� ���������� ������","hint":"�������� ���������� � ������������� ������� (� ��������� ���, ���� ��������� ��������, ��������� ��� ���������) ��� ����������� �������^' ||
q'^����: - �������� �� ������������� ����������� ������������. ��� ��������������� �����������: - �������� �� ������������� ��������������� ������������. ��� ���, ���������� ������� �������� � (���) ����^' ||
q'^������� ����� ���������-������������ �����������: - ���������, �������������� ����� �������� � (���) ����������� ����� ���������-������������ �����������: ��� ���, ���������� ������� �������� � (���) ^' ||
q'^����������� ����� ���������-������������ �����������: - ������ ������ �������� ��������������, �������������� �� ������� �����, �������������� ��������������� ����� ������������� � ������ ��������� � ^' ||
q'^��������������� ����� ���������-������������ �����������. ������������� ������� ���������� ��������� (� ��� ����� �������������������� ����������) (� ������������ � �.1. ��.17.1 ������������ ������ ��^' ||
q'^ 26.07.2006 � 135-��). ��������������� ��� ������������� �������� (� ������������ � �.1. ��.17.1 ������������ ������ �� 26.07.2006 � 135-��). ������� ���������������� ������ � �������� �� ������������^' ||
q'^�� ��������������� ��� ������������� ����������� (� ������������ � �.1. ��.17.1 ������������ ������ �� 26.07.2006 � 135-��)","mimeType":"","fileType":".jpg, .jpeg, .pdf, .rar, .zip","submitEvents":{}}^' ||
q'^],"rules":[]}],"rules":[]},{"className":"NavPanel","name":"NavPanel","fullPath":"form.NavPanel","visible":true,"handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel","events":["click"^' ||
q'^]}],"handler":"function navPanelDefaultHandler(evt) {\n        if (api.validate()) {\n\n            var finSubmit = {\n                // ���������� ��������� - ����� saveDraft � ������� ����.\n      ^' ||
q'^          init: function (evt) {\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraft, undefined, true);\n                },\n                callBackDraft: {\n          ^' ||
q'^          done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                            finSubmit.submitFinal(evt);\n                        } else ^' ||
q'^{\n                            finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError();\^' ||
q'^n                    },\n                    always: function (e) {\n                    }\n                },\n                submitFinal: function (evt) {\n                    // �������� ���������^' ||
q'^� �������. �� ��������� ������� ������� ������.\n                    var systemData = api.env('systemData');\n                    if (systemData && systemData.signCnt && (+systemData.signCnt > 1) && s^' ||
q'^ystemData.isOwner && systemData.isOwner !== 'true') {\n                        api.signConfirm().done(function () {\n                            var rUrl = api.env('rURL');\n                          ^' ||
q'^  if (rUrl) {\n                                api.link(rUrl + '/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results');\n                            }\n                            else {\n          ^' ||
q'^                      api.link(api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId'));\n                            }\n                        })\n                    } else {\n      ^' ||
q'^                  FormPlayer.generateServerPdf().done(function () {\n                            api.submit('submit', 0, finSubmit.callBackFinalSubmit);\n                        });\n                 ^' ||
q'^   }\n                },\n                callBackFinalSubmit: {\n                    done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n            ^' ||
q'^                var finalLink;\n                            var notifySMU = api.env('notifySMU');\n                            // ��������� �������� �� callback ��� ���\n                            if^' ||
q'^ (notifySMU) {\n                                notifySMU({\n                                    \"eventType\": \"submitForm\",\n                                    \"eventParams\": [\n               ^' ||
q'^                         {\"key\": \"orderId\", \"value\": api.env('orderId')},\n                                        {\"key\": \"formMnemonic\", \"value\": api.env('formMnemonic')},\n             ^' ||
q'^                           {\"key\": \"targetId\", \"value\": api.env('targetId')}\n                                    ]\n                                })\n                            } else {\n   ^' ||
q'^                             // ������� � �� �����/�����\n\n                                if (api.env('rURL')) {\n                                    finalLink = api.env('rURL') + '/details^' ||
 '?'
 || q'^elementI^' ||
q'^d=' + api.env('orderId') + '#_results';\n                                } else {\n                                    finalLink = api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId'^' ||
q'^);\n                                }\n                                api.link(finalLink);\n                            }\n\n                        } else {\n                            finSubmit.su^' ||
q'^bmitError({code: \"submitError\"});\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n                  ^' ||
q'^  },\n                    always: function (e) {\n                    }\n                },\n                callBackDraftESEP: {\n                    done: function (data) {\n                        ^' ||
q'^if (data && data.error && data.error.code == '0') {\n                            api.shade(false);\n                            FormPlayer.generateHtml();\n                        } else {\n          ^' ||
q'^                  finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n           ^' ||
q'^         },\n                    always: function (e) {\n                    }\n                },\n                submitError: function (data) {\n                    data = data || {};\n            ^' ||
q'^        if (typeof data.code === 'undefined' || (data.code && (data.code < 1400 || data.code > 1403))) {\n                        data.code = 'submitError';\n                        data.hideForm = tr^' ||
q'^ue;\n                    } else {\n                        data.esepError = true;\n                    }\n                    FormPlayer.handleError(data);\n                    // ��������� ������ ���^' ||
q'^ ���������� �������\n                    api.shade(false);\n                }\n            };\n\n            var findResult = /result=(0)/;\n\n            if (findResult.test(window.location.href) && ^' ||
q'^!api.env('editFormAfterEsep')) {\n                // ���� ��������� �� ����, ��������� ����������, ��������� �������� ������\n                finSubmit.submitFinal(evt);\n            } else {\n       ^' ||
q'^         // ��������� ��������. ���� � ����������� - �� � ����, ���� ��� - �� ��������� ������.\n                if (FormPlayer.env.supportSignature) {\n                    // ���������� ��������� � �^' ||
q'^���������� ��������� � ����\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraftESEP, false);\n                } else {\n                    // ������� �������� ��� �����^' ||
q'^�����\n                    api.shade(true);\n                    finSubmit.init(evt);\n                }\n            }\n\n        }\n    }"}],"submitEvents":{},"items":[{"className":"FormButton","nam^' ||
q'^e":"__prevStep","fullPath":"form.NavPanel.__prevStep","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.__prevStep","events":["click"]}],"handler":"function (evt) {\n        //���^' ||
q'^� ���� ������� �����\n        var steps = api.stepList();\n        //������� �������� ���� �������� �� step()\n        var cs = api.step();\n        var ns = cs - 1;\n        //�������� ���\n        v^' ||
q'^ar crSt = steps[cs];\n        //��� �� ������� ���� �������\n        var toGoTo = steps[ns];\n        //���� �� ��������� �� �������� �����\n        var onSteps = (ns >= 0);\n\n        if (onSteps) {\^' ||
q'^n            //������� ���\n            api.step(ns);\n        } else {\n            //������� �� �������� ������\n            api.link(api.env('returnUrl') + '/service/' + api.env('targetId') + '_' +^' ||
q'^ api.env('formMnemonic') + '.html#_description');\n        }\n    }"}],"label":"�����","action":"prev","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"FormButtonShowInfo^' ||
q'^","fullPath":"form.NavPanel.FormButtonShowInfo","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.FormButtonShowInfo","events":["click"]}],"handler":"function (evt) {\n        For^' ||
q'^mPlayer.makeBusy(true);\n        FormPlayer.showServiceInfo();\n    }"}],"label":"�������� ������","action":"view-info","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"_^' ||
q'^_nextStep","fullPath":"form.NavPanel.__nextStep","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.__nextStep","events":["click"]}],"handler":"function (evt) {\n        //���� ���^' ||
q'^� ������� �����\n        var steps = api.stepList();\n        //����� �����\n        var stepsLen = steps.length;\n        var cs = api.step();\n        var ns = cs + 1;\n        //������� ���\n      ^' ||
q'^  var crSt = steps[cs];\n        var finalLink = api.env('url') + '/orders/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results';\n        //���� �� ��������� �� �������� �����\n        var onSteps =^' ||
q'^ (ns <= stepsLen);\n        if (onSteps) {\n            crSt.submit('submit');\n            //Response binding\n            var prevVis = (crSt.name() === 'preview');\n            var prevNeeded = (ap^' ||
q'^i.hidePreview() === \"false\");\n            if (ns < stepsLen) {\n                api.step(ns);\n            } else if ((ns === stepsLen) && ((prevNeeded && prevVis) || !prevNeeded)) {\n             ^' ||
q'^   //��������� ���\n                api.shade(true);\n                FormPlayer.generateServerPdf().done(function () {\n                    api.submit('submit');\n                    api.submit('fina^' ||
q'^l');\n                    api.link(finalLink);\n                })\n            }\n        }\n    }"}],"label":"�����","action":"next","balign":"right","floating":"PGU-BtnFloat","submitEvents":{}}],"r^' ||
q'^ules":[]}],"rules":["form.FormStep1.trusteeData@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.Contactinfo.PanelAddress.FactAddressFL@visible=form.FormStep1.Contactinfo.^' ||
q'^PanelAddress.adr_check@checked","form.FormStep1.trustee_doc1@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.trustee_doc2@visible=form.FormStep1.PanelAgent.Panel465.repre^' ||
q'^sent@checked","form.FormStep1.trustee_doc3@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStepUL@visible=(form.FormStep0.ClaimDetails.service.TypeID@value==\"EMPLOYEE\")","for^' ||
q'^m.FormStepUL.Panel_cont_info.Panel290.FactAddressUL@visible=form.FormStepUL.Panel_cont_info.Panel290.Checkbox_adr_UL@checked","form.FormStep1.userdata.Panelogrnip@visible=((form.FormStep0.ClaimDetails^' ||
q'^.service.TypeID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@disabled)","form.FormStep1.trusteeData.Panelpred_ogrnip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value^' ||
q'^==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@checked)","form.FormStep1.userdata.Panelsnils@visible=(form.FormStep1.PanelAgent.Panel465.represent@value==\"false\")","form.FormStep1@^' ||
q'^visible=(form.FormStep0.ClaimDetails.service.TypeID@value!=\"EMPLOYEE\")","form.FormStep3.Paneldoc_pred@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.trusteeData.Panelp^' ||
q'^red_innip@visible=form.FormStep1.PanelAgent.Panel465.represent@checked"]}^';

  merge into pguforms.form f
  using (select
              '������ �� 2020: �������������� �������������� ��������� (�� ����������� ��������� ��������) � ������ ��� ���������� ������' NAME,
              to_timestamp('17.09.2020 09:06:52', 'dd.mm.yyyy HH24:MI:SS') CREATE_DATE,
              to_timestamp('17.09.2020 10:00:31', 'dd.mm.yyyy HH24:MI:SS') UPDATE_DATE,
              v_Content CONTENT,
              'N' DELETED,
              1000413036 AUTHORID,
              null EDS_TYPE,
              null PRESENTATION_TYPE,
              null RECIPIENT,
              '100000103390' MNEMONIC,
              null XSLT,
              'OID.1000413036'LOGIN,
              '����������� �.�.' FIO,
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