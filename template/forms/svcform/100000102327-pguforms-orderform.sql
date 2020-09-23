-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
declare
  v_Content clob;
  v_New_Trg integer;
  v_New_ID integer;
begin
v_Content := q'^{"className":"Form","name":"form","fullPath":"form","handlers":[],"needLoadDraft":false,"title":"Получение информации о порядке предоставления жилищно-коммунальных услуг населению","stepsOnTop":false,^' ||
q'^"showDescription":false,"engineVersion":"EnginePlayerPgu","showAllSteps":true,"submitEvents":{"submit":[{"eventType":"submit","serviceKey":"100000102327","soapAction":"","requestAppDataTransformer":""^' ||
q'^,"requestTransformer":"100000102327.ws","responseTransformer":"","submitType":"FINAL","xmlPayloadType":"PUBLIC_API_XML","_id":0}]},"items":[{"className":"FormStep","name":"FormStep0","fullPath":"form.^' ||
q'^FormStep0","visible":false,"label":"Служебные данные","title":"","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draf^' ||
q'^tId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"ClaimDetails","ful^' ||
q'^lPath":"form.FormStep0.ClaimDetails","title":"","submitEvents":{},"items":[{"className":"Panel","name":"service","fullPath":"form.FormStep0.ClaimDetails.service","visible":false,"title":"Служебная гру^' ||
q'^ппа полей","submitEvents":{},"items":[{"className":"FieldText","name":"userId","fullPath":"form.FormStep0.ClaimDetails.service.userId","value":"Идентификатор пользователя","strategy":"user_id","forceX^' ||
q'^ml":true,"submitEvents":{}},{"className":"FieldText","name":"TypeID","fullPath":"form.FormStep0.ClaimDetails.service.TypeID","value":"Тип пользователя","strategy":"user_type","forceXml":true,"theMaske^' ||
q'^dValue":"Номер заявления","submitEvents":{}},{"className":"FieldText","name":"CreateDate_order","fullPath":"form.FormStep0.ClaimDetails.service.CreateDate_order","readonly":true,"immutable":true,"labe^' ||
q'^l":"Дата подачи","strategy":"current_date","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"okato","fullPath":"form.FormStep0.ClaimDetails.service.okato","label":"ОКАТО местоположен^' ||
q'^ия","strategy":"location_code","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguDepartmentId","fullPath":"form.FormStep0.ClaimDetails.service.srguDepartmentId","handlers":[],"la^' ||
q'^bel":"Код ведомства (СРГУ)","strategy":"form_target_org_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguDepartmentName","fullPath":"form.FormStep0.ClaimDetails.service.srgu^' ||
q'^DepartmentName","handlers":[],"label":"Наименование ведомства (СРГУ)","strategy":"form_target_org_name","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguServiceId","fullPath":"f^' ||
q'^orm.FormStep0.ClaimDetails.service.srguServiceId","handlers":[],"label":"Код цели услуги (СРГУ)","strategy":"form_target_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"srguSer^' ||
q'^viceName","fullPath":"form.FormStep0.ClaimDetails.service.srguServiceName","handlers":[],"label":"Наименование цели услуги (СРГУ))","strategy":"form_target_name","forceXml":true,"submitEvents":{}},{"c^' ||
q'^lassName":"FieldText","name":"CaseNumber","fullPath":"form.FormStep0.ClaimDetails.service.CaseNumber","label":"Номер заявления","strategy":"order_id","forceXml":true,"theMaskedValue":"Идентификатор по^' ||
q'^льзователя","submitEvents":{}},{"className":"FieldText","name":"code","fullPath":"form.FormStep0.ClaimDetails.service.code","value":"100000102327","theMaskedValue":"100000102314","submitEvents":{}}],"^' ||
q'^rules":[]}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStep1","fullPath":"form.FormStep1","label":"1","title":"Сведения о заявителе","submitEvents":{"submit":[{"eventType":"submit","^' ||
q'^_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"proce^' ||
q'^ssor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"PanelAgent","fullPath":"form.FormStep1.PanelAgent","title":"","submitEvents":{},"items":[{"className":"Panel","name":"Panel465","ful^' ||
q'^lPath":"form.FormStep1.PanelAgent.Panel465","title":"","submitEvents":{},"items":[{"className":"FieldCheckbox","name":"represent","fullPath":"form.FormStep1.PanelAgent.Panel465.represent","label":"В к^' ||
q'^ачестве заявителя выступает его представитель","textValue":"","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trusteeData","fullPath":"form.FormStep1.trusteeData","title":"",^' ||
q'^"isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panelsurname","fullPath":"form.FormStep1.trusteeData.Panelsurname","title":"","isGridItem":true,"gridWidth":"one-third","submitEve^' ||
q'^nts":{},"items":[{"className":"FieldText","name":"trustee_surname","fullPath":"form.FormStep1.trusteeData.Panelsurname.trustee_surname","validators":[{"mnemonic":"rnd","message":"Пожалуйста, введите к^' ||
q'^орректное значение. Допускается ввод букв русского алфавита и дефис"},{"mnemonic":"required"}],"required":true,"label":"Фамилия","maxlength":60,"submitEvents":{}}],"rules":[]},{"className":"Panel","na^' ||
q'^me":"PanelfirstName","fullPath":"form.FormStep1.trusteeData.PanelfirstName","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"trustee_fir^' ||
q'^stName","fullPath":"form.FormStep1.trusteeData.PanelfirstName.trustee_firstName","validators":[{"mnemonic":"rnd_name","message":"Пожалуйста, введите корректное значение. Допускается ввод букв русского^' ||
q'^ алфавита"},{"mnemonic":"required"}],"required":true,"label":"Имя","maxlength":60,"theMaskedValue":"Лицензирование фармацевтической деятельности в сфере обращения лекарственных средств для ветеринарно^' ||
q'^го применения","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelmiddleName","fullPath":"form.FormStep1.trusteeData.PanelmiddleName","title":"","isGridItem":true,"gridWidth":"one-third^' ||
q'^","submitEvents":{},"items":[{"className":"FieldText","name":"trustee_middleName","fullPath":"form.FormStep1.trusteeData.PanelmiddleName.trustee_middleName","validators":[{"mnemonic":"rnd_otch","messa^' ||
q'^ge":"Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и пробел"}],"notRequiredText":"указывается при наличии","label":"Отчество","maxlength":60,"submitEvents":{}}],"rul^' ||
q'^es":[]},{"className":"Panel","name":"Panelpred_snils","fullPath":"form.FormStep1.trusteeData.Panelpred_snils","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"classNam^' ||
q'^e":"FieldText","name":"predSnils","fullPath":"form.FormStep1.trusteeData.Panelpred_snils.predSnils","required":true,"label":"СНИЛС","maxlength":4000,"forceXml":true,"theMaskValue":"000-000-000 00","sa^' ||
q'^veWithMask":true,"minlength":14,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelpred_innip","fullPath":"form.FormStep1.trusteeData.Panelpred_innip","title":"","isGridItem":true,"grid^' ||
q'^Width":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"innip_pred","fullPath":"form.FormStep1.trusteeData.Panelpred_innip.innip_pred","required":true,"label":"ИНН","maxlength":^' ||
q'^12,"theMaskValue":"000000000000","minlength":12,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelpred_ogrnip","fullPath":"form.FormStep1.trusteeData.Panelpred_ogrnip","title":"","isGr^' ||
q'^idItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"ogrnip_pred","fullPath":"form.FormStep1.trusteeData.Panelpred_ogrnip.ogrnip_pred","label":"ОГРНИП","max^' ||
q'^length":13,"theMaskValue":"0000000000000","minlength":13,"submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trustee_doc1","fullPath":"form.FormStep1.trustee_doc1","title":"Докум^' ||
q'^ент удостоверяющий личность заявителя","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"trustee_doc2","fullPath":"form.FormStep1.trustee_doc2","title":"","isGrid":true,"submitEven^' ||
q'^ts":{},"items":[{"className":"Panel","name":"Paneltitle","fullPath":"form.FormStep1.trustee_doc2.Paneltitle","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldDropdown","name"^' ||
q'^:"Name1","fullPath":"form.FormStep1.trustee_doc2.Paneltitle.Name1","required":true,"label":"Наименование документа","text_value":"","dictionary":{"type":"remote","code":"61_mintrud_dul","initRequest":^' ||
q'^false},"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelSerias","fullPath":"form.FormStep1.trustee_doc2.PanelSerias","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents^' ||
q'^":{},"items":[{"className":"FieldText","name":"Serial1","fullPath":"form.FormStep1.trustee_doc2.PanelSerias.Serial1","validators":[{"mnemonic":"required"}],"required":true,"label":"Серия документа","m^' ||
q'^axlength":10,"theMaskedValue":"Лицензирование фармацевтической деятельности в сфере обращения лекарственных средств для ветеринарного применения","submitEvents":{}}],"rules":[]},{"className":"Panel","^' ||
q'^name":"PanelNumber","fullPath":"form.FormStep1.trustee_doc2.PanelNumber","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Number1","full^' ||
q'^Path":"form.FormStep1.trustee_doc2.PanelNumber.Number1","validators":[{"mnemonic":"required"}],"required":true,"label":"Номер документа","maxlength":10,"theMaskedValue":"Лицензирование фармацевтическо^' ||
q'^й деятельности в сфере обращения лекарственных средств для ветеринарного применения","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelissueDate","fullPath":"form.FormStep1.trustee_doc^' ||
q'^2.PanelissueDate","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldTextDate","name":"fromDate1","fullPath":"form.FormStep1.trustee_doc2.PanelissueDate^' ||
q'^.fromDate1","required":true,"label":"Дата выдачи","limits":"|||past|","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelissuer","fullPath":"form.FormStep1.trustee_doc2.Panelissuer","ti^' ||
q'^tle":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"Org1","fullPath":"form.FormStep1.trustee_doc2.Panelissuer.Org1","validators":[{"mnemonic":"required"}],"required":^' ||
q'^true,"label":"Кем выдан документ","maxlength":500,"submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"trustee_doc3","fullPath":"form.FormStep1.trustee_doc3","title":"Сведения о п^' ||
q'^редставителе заявителя","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"userdata","fullPath":"form.FormStep1.userdata","title":"","isGrid":true,"submitEvents":{},"items":[{"class^' ||
q'^Name":"Panel","name":"Panelsurname","fullPath":"form.FormStep1.userdata.Panelsurname","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"s^' ||
q'^urname","fullPath":"form.FormStep1.userdata.Panelsurname.surname","required":true,"disabled":true,"label":"Фамилия","maxlength":250,"strategy":"lastname","submitEvents":{}}],"rules":[]},{"className":"^' ||
q'^Panel","name":"PanelfirstName","fullPath":"form.FormStep1.userdata.PanelfirstName","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"firs^' ||
q'^tName","fullPath":"form.FormStep1.userdata.PanelfirstName.firstName","required":true,"disabled":true,"label":"Имя","maxlength":250,"strategy":"firstname","theMaskedValue":"Лицензирование фармацевтичес^' ||
q'^кой деятельности в сфере обращения лекарственных средств для ветеринарного применения","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelmiddleName","fullPath":"form.FormStep1.userdata^' ||
q'^.PanelmiddleName","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"middleName","fullPath":"form.FormStep1.userdata.PanelmiddleName.middl^' ||
q'^eName","validators":[],"disabled":true,"label":"Отчество","maxlength":250,"strategy":"middlename","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelsnils","fullPath":"form.FormStep1.us^' ||
q'^erdata.Panelsnils","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Snils","fullPath":"form.FormStep1.userdata.Panelsnils.Snils","requir^' ||
q'^ed":true,"disabled":true,"label":"СНИЛС","maxlength":4000,"strategy":"snils","forceXml":true,"theMaskValue":"000-000-000 00","saveWithMask":true,"submitEvents":{}}],"rules":[]},{"className":"Panel","n^' ||
q'^ame":"Panelinnip","fullPath":"form.FormStep1.userdata.Panelinnip","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"innip","fullPath":"fo^' ||
q'^rm.FormStep1.userdata.Panelinnip.innip","required":true,"disabled":true,"label":"ИНН","strategy":"inn","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelogrnip","fullPath":"form.FormSt^' ||
q'^ep1.userdata.Panelogrnip","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"ogrnip","fullPath":"form.FormStep1.userdata.Panelogrnip.ogrni^' ||
q'^p","disabled":true,"label":"ОГРНИП","strategy":"businessmanbrief_ogrn","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"Panel361","fullPath":"form.FormStep1.Panel361","title":^' ||
q'^"Документ, удостоверяющий личность","submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"userdoc","fullPath":"form.FormStep1.userdoc","title":"","isGrid":true,"submitEvents":{},"items^' ||
q'^":[{"className":"Panel","name":"Paneltitle","fullPath":"form.FormStep1.userdoc.Paneltitle","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"title","fullPath":"f^' ||
q'^orm.FormStep1.userdoc.Paneltitle.title","required":true,"disabled":true,"label":"Наименование документа","maxlength":250,"strategy":"documenttypename","submitEvents":{}}],"rules":[]},{"className":"Pan^' ||
q'^el","name":"PanelSerias","fullPath":"form.FormStep1.userdoc.PanelSerias","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Serias","fullP^' ||
q'^ath":"form.FormStep1.userdoc.PanelSerias.Serias","required":true,"disabled":true,"label":"Серия","maxlength":250,"strategy":"docseries","theMaskedValue":"Лицензирование фармацевтической деятельности в^' ||
q'^ сфере обращения лекарственных средств для ветеринарного применения","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelNumber","fullPath":"form.FormStep1.userdoc.PanelNumber","title":"^' ||
q'^","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Number","fullPath":"form.FormStep1.userdoc.PanelNumber.Number","required":true,"disabled":true,"^' ||
q'^label":"Номер","maxlength":250,"strategy":"docnumber","theMaskedValue":"Лицензирование фармацевтической деятельности в сфере обращения лекарственных средств для ветеринарного применения","submitEvents^' ||
q'^":{}}],"rules":[]},{"className":"Panel","name":"PanelissueDate","fullPath":"form.FormStep1.userdoc.PanelissueDate","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"cla^' ||
q'^ssName":"FieldText","name":"issueDate","fullPath":"form.FormStep1.userdoc.PanelissueDate.issueDate","validators":[{"mnemonic":"required"}],"required":true,"disabled":true,"label":"Дата выдачи","maxlen^' ||
q'^gth":250,"strategy":"issuedate","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelissuer","fullPath":"form.FormStep1.userdoc.Panelissuer","title":"","isGridItem":true,"submitEvents":{}^' ||
q'^,"items":[{"className":"FieldText","name":"issuer","fullPath":"form.FormStep1.userdoc.Panelissuer.issuer","validators":[{"mnemonic":"required"}],"required":true,"disabled":true,"label":"Кем выдан","ma^' ||
q'^xlength":250,"strategy":"issueorg","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Panel","name":"Panel634","fullPath":"form.FormStep1.Panel634","title":"Контактная информация","submitEvent^' ||
q'^s":{},"items":[],"rules":[]},{"className":"Panel","name":"Contactinfo","fullPath":"form.FormStep1.Contactinfo","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panelpho^' ||
q'^ne","fullPath":"form.FormStep1.Contactinfo.Panelphone","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name":"MobilePhone","fullPath":"form.For^' ||
q'^mStep1.Contactinfo.Panelphone.MobilePhone","validators":[{"mnemonic":"mobile_19565","message":"Введите телефонный номер в формате:+7(XXX)XXXXXXX"},{"mnemonic":"required"}],"required":true,"label":"Ном^' ||
q'^ер контактного телефона","maxlength":14,"strategy":"person_mobile","theMaskValue":"+7(000)0000000","saveWithMask":true,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelemail","fullPat^' ||
q'^h":"form.FormStep1.Contactinfo.Panelemail","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name":"Email","fullPath":"form.FormStep1.Contactinfo^' ||
q'^.Panelemail.Email","validators":[{"mnemonic":"E-mail","message":"Введите корректный e-mail. Например, test@test.ru"},{"mnemonic":"required"}],"required":true,"label":"Адрес электронной почты","maxleng^' ||
q'^th":250,"strategy":"person_email","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelAddress","fullPath":"form.FormStep1.Contactinfo.PanelAddress","title":"","isGridItem":true,"submitEv^' ||
q'^ents":{},"items":[{"className":"Fias","name":"RegAddressFL","fullPath":"form.FormStep1.Contactinfo.PanelAddress.RegAddressFL","validators":[{"mnemonic":"required"}],"required":true,"label":"Сведения о^' ||
q'^б адресе регистрации по месту жительства","strategy":"address_reg_fias","submitEvents":{}},{"className":"FieldCheckbox","name":"adr_check","fullPath":"form.FormStep1.Contactinfo.PanelAddress.adr_check^' ||
q'^","label":"Адрес регистрации не совпадает с адресом фактического места жительства","textValue":"","submitEvents":{}},{"className":"Fias","name":"FactAddressFL","fullPath":"form.FormStep1.Contactinfo.P^' ||
q'^anelAddress.FactAddressFL","validators":[{"mnemonic":"required"}],"required":true,"label":"Сведения об адресе фактического места жительства","submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":[]},{^' ||
q'^"className":"FormStep","name":"FormStepUL","fullPath":"form.FormStepUL","handlers":[],"label":"1","title":"Сведения о заявителе - юридическом лице","submitEvents":{"submit":[{"eventType":"submit","_id^' ||
q'^":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processo^' ||
q'^r":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"PanelLegal","fullPath":"form.FormStepUL.PanelLegal","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Pa^' ||
q'^nelorgName","fullPath":"form.FormStepUL.PanelLegal.PanelorgName","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldTextArea","name":"orgName","fullPath":"form.FormStepUL.Panel^' ||
q'^Legal.PanelorgName.orgName","required":true,"disabled":true,"label":"Полное наименование организации","strategy":"organizationbrief_orgfullname","submitEvents":{}}],"rules":[]},{"className":"Panel","n^' ||
q'^ame":"PanelFullname","fullPath":"form.FormStepUL.PanelLegal.PanelFullname","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"FullName","fullPath":"form.FormStepU^' ||
q'^L.PanelLegal.PanelFullname.FullName","required":true,"disabled":true,"label":"Краткое наименование","strategy":"organizationBrief_orgShortName","submitEvents":{}}],"rules":[]},{"className":"Panel","na^' ||
q'^me":"Panelfirm_opf","fullPath":"form.FormStepUL.PanelLegal.Panelfirm_opf","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"firm_opf","fullPath":"form.FormStepUL^' ||
q'^.PanelLegal.Panelfirm_opf.firm_opf","required":true,"disabled":true,"label":"Организационно-правовая форма","maxlength":250,"strategy":"organizationbrief_legalform_value","submitEvents":{}}],"rules":[^' ||
q'^]},{"className":"Panel","name":"PanelINN","fullPath":"form.FormStepUL.PanelLegal.PanelINN","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","nam^' ||
q'^e":"INN","fullPath":"form.FormStepUL.PanelLegal.PanelINN.INN","required":true,"disabled":true,"readonly":true,"label":"ИНН","maxlength":250,"strategy":"organizationbrief_inn","submitEvents":{}}],"rule^' ||
q'^s":[]},{"className":"Panel","name":"PanelOGRN","fullPath":"form.FormStepUL.PanelLegal.PanelOGRN","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText^' ||
q'^","name":"OGRN","fullPath":"form.FormStepUL.PanelLegal.PanelOGRN.OGRN","required":true,"disabled":true,"readonly":true,"label":"ОГРН","maxlength":250,"strategy":"organizationbrief_ogrn","submitEvents"^' ||
q'^:{}}],"rules":[]},{"className":"Panel","name":"Panelkpp","fullPath":"form.FormStepUL.PanelLegal.Panelkpp","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"^' ||
q'^FieldText","name":"kpp","fullPath":"form.FormStepUL.PanelLegal.Panelkpp.kpp","validators":[],"disabled":true,"readonly":true,"label":"КПП","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"Pa^' ||
q'^nel","name":"Panel_cont_info","fullPath":"form.FormStepUL.Panel_cont_info","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panel76","fullPath":"form.FormStepUL.Panel_c^' ||
q'^ont_info.Panel76","title":"Контактное лицо","isGridItem":true,"submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"PanelLastNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelLa^' ||
q'^stNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"LastNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelLastNameUL.LastN^' ||
q'^ameUL","required":true,"disabled":true,"label":"Фамилия","strategy":"lastname","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelFirstNameUL","fullPath":"form.FormStepUL.Panel_cont_inf^' ||
q'^o.PanelFirstNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"FirstNameUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelFirst^' ||
q'^NameUL.FirstNameUL","required":true,"disabled":true,"label":"Имя","strategy":"firstname","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelMiddleNameUL","fullPath":"form.FormStepUL.Pan^' ||
q'^el_cont_info.PanelMiddleNameUL","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"MiddleNameUL","fullPath":"form.FormStepUL.Panel_cont_in^' ||
q'^fo.PanelMiddleNameUL.MiddleNameUL","validators":[],"disabled":true,"label":"Отчество","strategy":"middlename","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panelposition","fullPath":"fo^' ||
q'^rm.FormStepUL.Panel_cont_info.Panelposition","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldText","name":"position","fullPath":"form.FormStepUL.Panel_cont_info.Panelpositio^' ||
q'^n.position","required":true,"label":"Должность","maxlength":100,"strategy":"organizationbrief_orgposition","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel129","fullPath":"form.FormS^' ||
q'^tepUL.Panel_cont_info.Panel129","title":"Контактная информация","isGridItem":true,"submitEvents":{},"items":[],"rules":[]},{"className":"Panel","name":"PanelMobilePhoneUL","fullPath":"form.FormStepUL.^' ||
q'^Panel_cont_info.PanelMobilePhoneUL","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name":"MobilePhoneUL","fullPath":"form.FormStepUL.Panel_con^' ||
q'^t_info.PanelMobilePhoneUL.MobilePhoneUL","validators":[{"mnemonic":"mobile_19565","message":"Введите телефонный номер в формате:+7(XXX)XXXXXXX"},{"mnemonic":"required"}],"required":true,"label":"Телеф^' ||
q'^он","maxlength":14,"strategy":"org_phone","theMaskValue":"+7(000)0000000","saveWithMask":true,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"PanelEmailUL","fullPath":"form.FormStepUL.Pan^' ||
q'^el_cont_info.PanelEmailUL","title":"","isGridItem":true,"gridWidth":"one-half","submitEvents":{},"items":[{"className":"FieldText","name":"EmailUL","fullPath":"form.FormStepUL.Panel_cont_info.PanelEma^' ||
q'^ilUL.EmailUL","validators":[{"mnemonic":"E-mail","message":"Введите корректный e-mail. Например, test@test.ru"},{"mnemonic":"required"}],"required":true,"label":"Адрес электронной почты","maxlength":2^' ||
q'^50,"strategy":"org_email","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel196","fullPath":"form.FormStepUL.Panel_cont_info.Panel196","title":"","isGridItem":true,"submitEvents":{},"i^' ||
q'^tems":[{"className":"Fias","name":"PostalAddressUL","fullPath":"form.FormStepUL.Panel_cont_info.Panel196.PostalAddressUL","required":true,"label":"Юридический адрес","strategy":"address_legal_fias","s^' ||
q'^ubmitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel290","fullPath":"form.FormStepUL.Panel_cont_info.Panel290","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldCh^' ||
q'^eckbox","name":"Checkbox_adr_UL","fullPath":"form.FormStepUL.Panel_cont_info.Panel290.Checkbox_adr_UL","label":"Юридический адрес не совпадает с фактическим адресом","textValue":"","submitEvents":{}},^' ||
q'^{"className":"Fias","name":"FactAddressUL","fullPath":"form.FormStepUL.Panel_cont_info.Panel290.FactAddressUL","handlers":[],"required":true,"label":"Фактический адрес","submitEvents":{}}],"rules":[]}^' ||
q'^],"rules":[]}],"rules":["Panel_cont_info.Panel290.FactAddressUL@visible=Panel_cont_info.Panel290.Checkbox_adr_UL@checked"]},{"className":"FormStep","name":"FormStep1749","fullPath":"form.FormStep1749"^' ||
q'^,"label":"2","title":"Данные по услуге","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVe^' ||
q'^rsion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","name":"Panel2540","fullPath":"form.FormStep1749.Pa^' ||
q'^nel2540","title":"","submitEvents":{},"items":[{"className":"Label","name":"Label2541","fullPath":"form.FormStep1749.Panel2540.Label2541","text":"Прошу предоставить информацию о порядке предоставления^' ||
q'^ жилищно-коммунальных услуг","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel2676","fullPath":"form.FormStep1749.Panel2676","title":"","submitEvents":{},"items":[{"className":"FieldT^' ||
q'^extArea","name":"letter","fullPath":"form.FormStep1749.Panel2676.letter","required":true,"label":"Текст обращения","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStep^' ||
q'^3","fullPath":"form.FormStep3","html":"<br/>\n<br/><br/>","label":"3","title":"Документы, необходимые для предоставления услуги","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"r^' ||
q'^equestBinding":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProces^' ||
q'^sor"}]},"items":[{"className":"Panel","name":"Paneldoc_pred","fullPath":"form.FormStep3.Paneldoc_pred","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldUpload","name":"Doc_pr^' ||
q'^ed1","fullPath":"form.FormStep3.Paneldoc_pred.Doc_pred1","required":true,"label":"Документ, подтверждающий полномочия представителя заявителя","hint":"Документ заверенный в установленном порядке (усил^' ||
q'^енной ЭЦП лица, выдавшего документ или усиленной ЭЦП нотариуса)   1. Доверенность, оформленная в установленном законом порядке, на представление интересов заявителя  ","mimeType":"","fileType":".jpg, ^' ||
q'^.jpeg, .pdf, .rar","submitEvents":{}},{"className":"FieldUpload","name":"Doc_Pred2","fullPath":"form.FormStep3.Paneldoc_pred.Doc_Pred2","required":true,"label":"Открепленная усиленная квалифицированая^' ||
q'^ электронная подпись нотариуса ","hint":"Открепленная усиленная квалифицированая электронная подпись нотариуса  в формате PKCS#7 предварительно помещенная  в zip-архив","mimeType":"","fileType":".zip"^' ||
q'^,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel2208","fullPath":"form.FormStep3.Panel2208","title":"","isGridItem":true,"submitEvents":{},"items":[{"className":"FieldUpload","name"^' ||
q'^:"Doc1","fullPath":"form.FormStep3.Panel2208.Doc1","label":"Документы, материалы в подтверждение своих доводов ","mimeType":"","fileType":".jpg, .jpeg, .pdf, .rar, .zip","submitEvents":{}}],"rules":[]^' ||
q'^}],"rules":[]},{"className":"NavPanel","name":"NavPanel","fullPath":"form.NavPanel","visible":true,"handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel","events":["click"]}],"handler^' ||
q'^":"function navPanelDefaultHandler(evt) {\n        if (api.validate()) {\n\n            var finSubmit = {\n                // Сохранение черновика - вызов saveDraft с первого шага.\n                in^' ||
q'^it: function (evt) {\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraft, undefined, true);\n                },\n                callBackDraft: {\n                    do^' ||
q'^ne: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                            finSubmit.submitFinal(evt);\n                        } else {\n         ^' ||
q'^                   finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError();\n           ^' ||
q'^         },\n                    always: function (e) {\n                    }\n                },\n                submitFinal: function (evt) {\n                    // Отправка финального запроса. П^' ||
q'^о умолчанию берется нулевой сабмит.\n                    var systemData = api.env('systemData');\n                    if (systemData && systemData.signCnt && (+systemData.signCnt > 1) && systemData.is^' ||
q'^Owner && systemData.isOwner !== 'true') {\n                        api.signConfirm().done(function () {\n                            var rUrl = api.env('rURL');\n                            if (rUrl) ^' ||
q'^{\n                                api.link(rUrl + '/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results');\n                            }\n                            else {\n                      ^' ||
q'^          api.link(api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId'));\n                            }\n                        })\n                    } else {\n                  ^' ||
q'^      FormPlayer.generateServerPdf().done(function () {\n                            api.submit('submit', 0, finSubmit.callBackFinalSubmit);\n                        });\n                    }\n      ^' ||
q'^          },\n                callBackFinalSubmit: {\n                    done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                        ^' ||
q'^    var finalLink;\n                            var notifySMU = api.env('notifySMU');\n                            // добавлена проверка на callback для СМУ\n                            if (notifySMU)^' ||
q'^ {\n                                notifySMU({\n                                    \"eventType\": \"submitForm\",\n                                    \"eventParams\": [\n                           ^' ||
q'^             {\"key\": \"orderId\", \"value\": api.env('orderId')},\n                                        {\"key\": \"formMnemonic\", \"value\": api.env('formMnemonic')},\n                         ^' ||
q'^               {\"key\": \"targetId\", \"value\": api.env('targetId')}\n                                    ]\n                                })\n                            } else {\n               ^' ||
q'^                 // Переход в ЛК белый/синий\n\n                                if (api.env('rURL')) {\n                                    finalLink = api.env('rURL') + '/details^' ||
 '?'
 || q'^elementId=' + api.en^' ||
q'^v('orderId') + '#_results';\n                                } else {\n                                    finalLink = api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId');\n        ^' ||
q'^                        }\n                                api.link(finalLink);\n                            }\n\n                        } else {\n                            finSubmit.submitError({c^' ||
q'^ode: \"submitError\"});\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n                    },\n      ^' ||
q'^              always: function (e) {\n                    }\n                },\n                callBackDraftESEP: {\n                    done: function (data) {\n                        if (data && ^' ||
q'^data.error && data.error.code == '0') {\n                            api.shade(false);\n                            FormPlayer.generateHtml();\n                        } else {\n                      ^' ||
q'^      finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n                    },\^' ||
q'^n                    always: function (e) {\n                    }\n                },\n                submitError: function (data) {\n                    data = data || {};\n                    if (^' ||
q'^typeof data.code === 'undefined' || (data.code && (data.code < 1400 || data.code > 1403))) {\n                        data.code = 'submitError';\n                        data.hideForm = true;\n       ^' ||
q'^             } else {\n                        data.esepError = true;\n                    }\n                    FormPlayer.handleError(data);\n                    // Обработка ошибки при выполнении ^' ||
q'^сабмита\n                    api.shade(false);\n                }\n            };\n\n            var findResult = /result=(0)/;\n\n            if (findResult.test(window.location.href) && !api.env('ed^' ||
q'^itFormAfterEsep')) {\n                // Если вернулись из ЕСЭП, результат корректный, финальная отправка заявки\n                finSubmit.submitFinal(evt);\n            } else {\n                // ^' ||
q'^первичная отправка. Если с подписанием - то в ЕСЭП, если без - то финальный запрос.\n                if (FormPlayer.env.supportSignature) {\n                    // сохранение черновика с последующим п^' ||
q'^ереходом в ЕСЭП\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraftESEP, false);\n                } else {\n                    // обычная отправка без подписания\n     ^' ||
q'^               api.shade(true);\n                    finSubmit.init(evt);\n                }\n            }\n\n        }\n    }"}],"submitEvents":{},"items":[{"className":"FormButton","name":"__prevSt^' ||
q'^ep","fullPath":"form.NavPanel.__prevStep","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.__prevStep","events":["click"]}],"handler":"function (evt) {\n        //Сбор всех видим^' ||
q'^ых шагов\n        var steps = api.stepList();\n        //Возврат текущего шага заменить на step()\n        var cs = api.step();\n        var ns = cs - 1;\n        //Текущгий шаг\n        var crSt = st^' ||
q'^eps[cs];\n        //Шаг на который надо перейти\n        var toGoTo = steps[ns];\n        //Если мы находимся на реальных шагах\n        var onSteps = (ns >= 0);\n\n        if (onSteps) {\n           ^' ||
q'^ //Обчыный шаг\n            api.step(ns);\n        } else {\n            //Переход на карточку услуги\n            api.link(api.env('returnUrl') + '/service/' + api.env('targetId') + '_' + api.env('fo^' ||
q'^rmMnemonic') + '.html#_description');\n        }\n    }"}],"label":"Назад","action":"prev","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"FormButtonShowInfo","fullPath"^' ||
q'^:"form.NavPanel.FormButtonShowInfo","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.FormButtonShowInfo","events":["click"]}],"handler":"function (evt) {\n        FormPlayer.make^' ||
q'^Busy(true);\n        FormPlayer.showServiceInfo();\n    }"}],"label":"Описание услуги","action":"view-info","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"__nextStep","^' ||
q'^fullPath":"form.NavPanel.__nextStep","handlers":[{"listen":[{"component":"Form_3400000010001599880.NavPanel.__nextStep","events":["click"]}],"handler":"function (evt) {\n        //Сбор всех видимых ша^' ||
q'^гов\n        var steps = api.stepList();\n        //Длина шагов\n        var stepsLen = steps.length;\n        var cs = api.step();\n        var ns = cs + 1;\n        //Текущий шаг\n        var crSt =^' ||
q'^ steps[cs];\n        var finalLink = api.env('url') + '/orders/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results';\n        //Если мы находимся на реальных шагах\n        var onSteps = (ns <= step^' ||
q'^sLen);\n        if (onSteps) {\n            crSt.submit('submit');\n            //Response binding\n            var prevVis = (crSt.name() === 'preview');\n            var prevNeeded = (api.hidePrevie^' ||
q'^w() === \"false\");\n            if (ns < stepsLen) {\n                api.step(ns);\n            } else if ((ns === stepsLen) && ((prevNeeded && prevVis) || !prevNeeded)) {\n                //Финальн^' ||
q'^ый шаг\n                api.shade(true);\n                FormPlayer.generateServerPdf().done(function () {\n                    api.submit('submit');\n                    api.submit('final');\n      ^' ||
q'^              api.link(finalLink);\n                })\n            }\n        }\n    }"}],"label":"Далее","action":"next","balign":"right","floating":"PGU-BtnFloat","submitEvents":{}}],"rules":[]}],"^' ||
q'^rules":["form.FormStep1.trusteeData@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.Contactinfo.PanelAddress.FactAddressFL@visible=form.FormStep1.Contactinfo.PanelAddress^' ||
q'^.adr_check@checked","form.FormStep1.trustee_doc1@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.trustee_doc2@visible=form.FormStep1.PanelAgent.Panel465.represent@checked^' ||
q'^","form.FormStep1.trustee_doc3@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStepUL@visible=(form.FormStep0.ClaimDetails.service.TypeID@value==\"EMPLOYEE\")","form.FormStepUL^' ||
q'^.Panel_cont_info.Panel290.FactAddressUL@visible=form.FormStepUL.Panel_cont_info.Panel290.Checkbox_adr_UL@checked","form.FormStep1.userdata.Panelogrnip@visible=((form.FormStep0.ClaimDetails.service.Typ^' ||
q'^eID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@disabled)","form.FormStep1.trusteeData.Panelpred_ogrnip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value==\"BUSINESS^' ||
q'^MAN\")&&form.FormStep1.PanelAgent.Panel465.represent@checked)","form.FormStep1.userdata.Panelsnils@visible=(form.FormStep1.PanelAgent.Panel465.represent@value==\"false\")","form.FormStep1@visible=(for^' ||
q'^m.FormStep0.ClaimDetails.service.TypeID@value!=\"EMPLOYEE\")","form.FormStep3.Paneldoc_pred@visible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.trusteeData.Panelpred_innip@vi^' ||
q'^sible=form.FormStep1.PanelAgent.Panel465.represent@checked","form.FormStep1.userdata.Panelinnip@visible=(form.FormStep1.PanelAgent.Panel465.represent@value==\"false\")"]}^';

  merge into pguforms.form f
  using (select
              'Ростов 2020: Получение информации о порядке предоставления жилищно-коммунальных услуг населению' NAME,
              to_timestamp('23.06.2020 09:22:49', 'dd.mm.yyyy HH24:MI:SS') CREATE_DATE,
              to_timestamp('29.06.2020 16:27:20', 'dd.mm.yyyy HH24:MI:SS') UPDATE_DATE,
              v_Content CONTENT,
              'N' DELETED,
              1000413036 AUTHORID,
              null EDS_TYPE,
              null PRESENTATION_TYPE,
              null RECIPIENT,
              '100000102327' MNEMONIC,
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