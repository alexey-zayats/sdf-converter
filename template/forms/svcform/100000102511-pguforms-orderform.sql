-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
declare
  v_Content clob;
  v_New_Trg integer;
  v_New_ID integer;
begin
v_Content := q'^{"className":"Form","name":"form","fullPath":"form","handlers":[{"listen":[{"component":"","events":["formRendered"]}],"handler":"function(evt){\n var callBack = {\n done: function(){},\n error: funct^' ||
q'^ion(){},\n always: function(){}\n };\n  api.find('form.FormStep7.Panel247.Map').visible(true);\n api.find('form.FormStep7.Panel247.Map').fetch(0, callBack);\n}"}],"needLoadDraft":false,"titleNew":"Эле^' ||
q'^ктронная запись на прием","stepsOnTop":false,"engineVersion":"EnginePlayerPgu","showAllSteps":true,"submitEvents":{"submit":[{"eventType":"submit","serviceKey":"100000102511","soapAction":"","requestA^' ||
q'^ppDataTransformer":"","requestTransformer":"","responseTransformer":"","submitType":"FINAL","xmlPayloadType":"PUBLIC_API_XML","_id":0}]},"items":[{"className":"FormStep","name":"ServiceInfo","fullPath^' ||
q'^":"form.ServiceInfo","visible":false,"handlers":[],"label":"","title":"Служебная информация","inlineCSS":"","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"orde^' ||
q'^r":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"cl^' ||
q'^assName":"Panel","name":"Panel18","fullPath":"form.ServiceInfo.Panel18","visible":false,"title":"","inlineCSS":"","submitEvents":{},"items":[{"className":"Panel","name":"Panel19","fullPath":"form.Serv^' ||
q'^iceInfo.Panel18.Panel19","title":"","submitEvents":{},"items":[{"className":"FieldText","name":"code","fullPath":"form.ServiceInfo.Panel18.Panel19.code","value":"102511","label":"Код формы","theMasked^' ||
q'^Value":"85732","submitEvents":{}},{"className":"FieldText","name":"nameForm","fullPath":"form.ServiceInfo.Panel18.Panel19.nameForm","value":"Электронная запись на прием","readonly":true,"immutable":tr^' ||
q'^ue,"label":"Наименование формы","theMaskedValue":"Выдача архивных справок, копий и выписок по тематике обращения","submitEvents":{}},{"className":"FieldText","name":"okato","fullPath":"form.ServiceInf^' ||
q'^o.Panel18.Panel19.okato","label":"ОКАТО местоположения","strategy":"location_code","submitEvents":{}},{"className":"FieldText","name":"srguDepartmentId","fullPath":"form.ServiceInfo.Panel18.Panel19.sr^' ||
q'^guDepartmentId","label":"Код ведомства","strategy":"form_target_org_id","theMaskedValue":"6100000000160600496","submitEvents":{}},{"className":"FieldText","name":"srguDepartmentName","fullPath":"form.^' ||
q'^ServiceInfo.Panel18.Panel19.srguDepartmentName","readonly":true,"immutable":true,"label":"Наименование ведомства (СРГУ)","strategy":"form_target_org_name","submitEvents":{}},{"className":"FieldText","^' ||
q'^name":"srguServiceId","fullPath":"form.ServiceInfo.Panel18.Panel19.srguServiceId","readonly":true,"immutable":true,"label":"Код цели услуги (СРГУ)","strategy":"form_target_id","submitEvents":{}},{"cla^' ||
q'^ssName":"FieldText","name":"srguServiceName","fullPath":"form.ServiceInfo.Panel18.Panel19.srguServiceName","readonly":true,"immutable":true,"label":"Наименование цели услуги (СРГУ)","strategy":"form_t^' ||
q'^arget_name","submitEvents":{}},{"className":"FieldText","name":"srguServicePassportId","fullPath":"form.ServiceInfo.Panel18.Panel19.srguServicePassportId","label":"Код паспорта услуги (СРГУ)","forceXm^' ||
q'^l":true,"theMaskedValue":"700000000162549074","submitEvents":{}},{"className":"FieldText","name":"srguServicePassportName","fullPath":"form.ServiceInfo.Panel18.Panel19.srguServicePassportName","label"^' ||
q'^:"Наименование паспорта услуги (СРГУ)","strategy":"form_target_name","theMaskedValue":"Выдача архивных документов, копий и выписок по тематике обращений","submitEvents":{}},{"className":"FieldTextDate^' ||
q'^","name":"CurrentDate","fullPath":"form.ServiceInfo.Panel18.Panel19.CurrentDate","label":"Текущая дата ","strategy":"current_date","submitEvents":{}},{"className":"FieldText","name":"typeApplicant","f^' ||
q'^ullPath":"form.ServiceInfo.Panel18.Panel19.typeApplicant","handlers":[],"readonly":true,"immutable":true,"label":"Тип заявителя","strategy":"user_type","forceXml":true,"submitEvents":{}},{"className":^' ||
q'^"FieldText","name":"CaseNumber","fullPath":"form.ServiceInfo.Panel18.Panel19.CaseNumber","readonly":true,"immutable":true,"label":"Номер заявки","strategy":"order_id","forceXml":true,"submitEvents":{}^' ||
q'^},{"className":"FieldText","name":"OKTMO","fullPath":"form.ServiceInfo.Panel18.Panel19.OKTMO","label":"OKTMO","theMaskedValue":"83000001","submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":[]},{"cl^' ||
q'^assName":"FormStep","name":"FormStep125","fullPath":"form.FormStep125","label":"1","title":"Ваши персональные данные","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBindi^' ||
q'^ng":{"order":{"id":"__orderId"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"it^' ||
q'^ems":[{"className":"Panel","name":"PanelPersonData","fullPath":"form.FormStep125.PanelPersonData","title":"","isGrid":true,"submitEvents":{},"items":[{"className":"Panel","name":"Panel1","fullPath":"f^' ||
q'^orm.FormStep125.PanelPersonData.Panel1","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"LName","fullPath":"form.FormStep125.PanelPerson^' ||
q'^Data.Panel1.LName","validators":[{"mnemonic":"required"}],"required":true,"disabled":true,"readonly":true,"immutable":true,"label":"Фамилия","maxlength":255,"strategy":"lastname","submitEvents":{}}],"^' ||
q'^rules":[]},{"className":"Panel","name":"Panel2","fullPath":"form.FormStep125.PanelPersonData.Panel2","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"Field^' ||
q'^Text","name":"FName","fullPath":"form.FormStep125.PanelPersonData.Panel2.FName","validators":[{"mnemonic":"required"}],"required":true,"disabled":true,"readonly":true,"immutable":true,"label":"Имя","m^' ||
q'^axlength":255,"strategy":"firstname","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel3","fullPath":"form.FormStep125.PanelPersonData.Panel3","title":"","isGridItem":true,"gridWidth":^' ||
q'^"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"MName","fullPath":"form.FormStep125.PanelPersonData.Panel3.MName","disabled":true,"readonly":true,"immutable":true,"label":"Отче^' ||
q'^ство","inlineCSS":"","maxlength":255,"strategy":"middlename","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel4","fullPath":"form.FormStep125.PanelPersonData.Panel4","title":"","isGri^' ||
q'^dItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"userSnils","fullPath":"form.FormStep125.PanelPersonData.Panel4.userSnils","required":true,"disabled":tru^' ||
q'^e,"readonly":true,"immutable":true,"label":"СНИЛС","maxlength":14,"strategy":"snils","submitEvents":{}}],"rules":[]},{"className":"Panel","name":"Panel7","fullPath":"form.FormStep125.PanelPersonData.P^' ||
q'^anel7","title":"","isGridItem":true,"gridWidth":"one-third","submitEvents":{},"items":[{"className":"FieldText","name":"Phone","fullPath":"form.FormStep125.PanelPersonData.Panel7.Phone","handlers":[],^' ||
q'^"validators":[{"mnemonic":"59162.59162","message":"Введите телефонный номер в формате:+X(XXX)XXXXXXX"}],"disabled":true,"readonly":true,"immutable":true,"label":"Номер мобильного телефона","inlineCSS"^' ||
q'^:"","maxlength":14,"strategy":"person_mobile","theMaskValue":"+0(000)0000000","saveWithMask":true,"submitEvents":{}}],"rules":[]}],"rules":[]}],"rules":[]},{"className":"FormStep","name":"FormStep7","^' ||
q'^fullPath":"form.FormStep7","label":"","title":"Выбор подразделения для записи на прием ","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{},"requestBinding":{"order":{"id":"__orderId^' ||
q'^"},"draft":{"id":"__draftId","version":"__draftVersion"}},"responseBinding":{"draft":{"id":"__draftId","version":"__draftVersion"}},"processor":"saveDraftProcessor"}]},"items":[{"className":"Panel","n^' ||
q'^ame":"Panel247","fullPath":"form.FormStep7.Panel247","handlers":[],"title":"","submitEvents":{},"items":[{"className":"Label","name":"Label938","fullPath":"form.FormStep7.Panel247.Label938","visible":^' ||
q'^false,"text":"","submitEvents":{}},{"className":"FieldMapWithList","name":"Map","fullPath":"form.FormStep7.Panel247.Map","handlers":[],"validators":[{"mnemonic":"required"}],"required":true,"label":""^' ||
q'^,"dictionary":{"type":"remote","code":"rnd_org","requestBinding":[{"name":"TARGET_ID","condition":"equals","attrType":"asString","value":"form.FormStep7.Panel247.serviceId","attr":"value","notInclude"^' ||
q'^:false}],"__complexData":true,"responseBindings":[{"name":"STRUCTURE_ID","field":"form.FormStep7.Panel247.orgId","attr":"value","priority":"0","notInclude":false},{"name":"STRUCTURE_NAME","field":"for^' ||
q'^m.FormStep7.Panel247.orgName","attr":"value","priority":"0","notInclude":false},{"name":"STRUCTURE_ADDRESS","field":"form.FormStep7.Panel247.address","attr":"value","priority":"0","notInclude":false}]^' ||
q'^,"mappingAttributes":{"mappedConfig":{"btnName":"Выбрать время записи на прием","attrs":[],"details":[{"name":"title","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":^' ||
q'^false,"underMap":false,"baloonContent":true},{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":false,"baloonContent":tr^' ||
q'^ue}],"baloonContent":[{"name":"title","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false,"baloonContent":true},{"name":"STRUCTURE_ADDRESS","isMain^' ||
q'^":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":false,"baloonContent":true}],"coords":[{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMa^' ||
q'^p":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":false,"baloonContent":true}],"underMap":[]},"list":[{"name":"value","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"la^' ||
q'^bel":"","coords":false,"underMap":false},{"name":"title","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false,"baloonContent":true},{"name":"TARGET_^' ||
q'^ID","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false},{"name":"STRUCTURE_ID","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"la^' ||
q'^bel":"","coords":false,"underMap":false,"baloonContent":false},{"name":"STRUCTURE_NAME","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false},{"nam^' ||
q'^e":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":false,"baloonContent":true}]},"initRequest":false},"text_value":"","textVa^' ||
q'^lue":"","uncorrectedRegionText":"","withGeoCoderSearch":"","withSingleMandate":"","withFilterCodes":true,"submitEvents":{}},{"className":"Panel","name":"Panel277","fullPath":"form.FormStep7.Panel247.P^' ||
q'^anel277","visible":false,"handlers":[{"listen":[{"component":"form.FormStep7.Panel247.orgId","events":["changedata"]}],"handler":"function(evt){\n  if(api.find('form.FormStep7.Panel247.orgId').value()^' ||
q'^ != ''){\n  api.find('form.FormStep7.Panel247.Panel277').visible(true);\n api.find('form.FormStep7.Panel247.Panel277.TimeSlotExt').fetch();\n }\n}"}],"title":"","submitEvents":{},"items":[{"className"^' ||
q'^:"TimeSlotExt","name":"TimeSlotExt","fullPath":"form.FormStep7.Panel247.Panel277.TimeSlotExt","handlers":[{"listen":[{"component":"form.FormStep7.Panel247.orgName","events":["change"]},{"component":"f^' ||
q'^orm.FormStep7.Panel247.DepartmentId","events":["change"]},{"component":"form.FormStep7.Panel247.address","events":["change"]}],"handler":"function(evt){\n//debugger;\n if(this.orgName()!=api.find('for^' ||
q'^m.FormStep7.Panel247.orgName').value() &&\n     api.find('form.FormStep7.Panel247.orgName').value() !=='' &&\n     api.find('form.FormStep7.Panel247.address').value() !=='' ){\n     this.visible(true)^' ||
q'^;\n     this.fetch();\n     this.scrollTo();\n     this.orgName(api.find('form.FormStep7.Panel247.orgName').value());\n     this.orgAddress(api.find('form.FormStep7.Panel247.address').value());\n   }\^' ||
q'^n}"}],"title":"","dictionary":{"type":"remote","code":"rnd_org","requestBinding":[{"name":"TARGET_ID","condition":"equals","attrType":"asString","value":"form.FormStep7.Panel247.serviceId","attr":"val^' ||
q'^ue","notInclude":false}],"__complexData":true,"responseBindings":[{"name":"STRUCTURE_ID","field":"form.FormStep7.Panel247.DepartmentId","attr":"value","priority":"0","notInclude":false}],"mappingAttri^' ||
q'^butes":{"mappedConfig":{"btnName":"Выбрать время записи на прием","attrs":[],"details":[{"name":"title","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMa^' ||
q'^p":false,"baloonContent":true},{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":true,"baloonContent":true}],"baloonCon^' ||
q'^tent":[{"name":"title","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false,"baloonContent":true},{"name":"STRUCTURE_ADDRESS","isMain":false,"isDeta^' ||
q'^ils":true,"inMap":false,"indexNumber":0,"label":"Адрес","coords":true,"underMap":true,"baloonContent":true}],"coords":[{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexN^' ||
q'^umber":0,"label":"Адрес","coords":true,"underMap":true,"baloonContent":true}],"underMap":[{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"Адрес","coo^' ||
q'^rds":true,"underMap":true,"baloonContent":true}]},"list":[{"name":"value","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false},{"name":"title","is^' ||
q'^Main":false,"isDetails":true,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false,"baloonContent":true},{"name":"TARGET_ID","isMain":false,"isDetails":false,"inMap":false,"indexNum^' ||
q'^ber":0,"label":"","coords":false,"underMap":false},{"name":"STRUCTURE_ID","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false},{"name":"STRUCTURE_^' ||
q'^NAME","isMain":false,"isDetails":false,"inMap":false,"indexNumber":0,"label":"","coords":false,"underMap":false},{"name":"STRUCTURE_ADDRESS","isMain":false,"isDetails":true,"inMap":false,"indexNumber"^' ||
q'^:0,"label":"Адрес","coords":true,"underMap":true,"baloonContent":true}]},"initRequest":false},"responseBinding":[{"name":"areaId","attr":"value","field":"form.FormStep7.Panel247.areaId"},{"name":"slot^' ||
q'^Id","attr":"value","field":"form.FormStep7.Panel247.slotId"}],"aggSlotsParams":[{"name":"organizationId","attr":"value","field":"form.FormStep7.Panel247.orgId"},{"name":"serviceId","attr":"value","fie^' ||
q'^ld":"form.FormStep7.Panel247.serviceId"},{"name":"eserviceId","attr":"value","field":"form.FormStep7.Panel247.eserviceId"},{"name":"caseNumber","attr":"value","field":"form.FormStep7.Panel247.parentOr^' ||
q'^derId"}],"aggSlotAttributes":[{"name":"Startdate","attr":"value","field":"form.FormStep7.Panel247.Startdate1"}],"slotParams":[{"name":"organizationId","attr":"value","field":"form.FormStep7.Panel247.o^' ||
q'^rgId"},{"name":"serviceId","attr":"value","field":"form.FormStep7.Panel247.serviceId"},{"name":"areaId","attr":"value","field":"form.FormStep7.Panel247.areaId"},{"name":"preliminaryReservation","attr"^' ||
q'^:"value","field":"form.FormStep7.Panel247.preliminaryReservation"},{"name":"eserviceId","attr":"value","field":"form.FormStep7.Panel247.eserviceId"},{"name":"address","attr":"value","field":"form.Form^' ||
q'^Step7.Panel247.address"},{"name":"orgName","attr":"value","field":"form.FormStep7.Panel247.orgName"},{"name":"subject","attr":"value","field":"form.FormStep7.Panel247.subject"},{"name":"serviceCode","^' ||
q'^attr":"value","field":"form.FormStep7.Panel247.serviceId"},{"name":"calendarName","attr":"value","field":"form.FormStep7.Panel247.calendarName"},{"name":"parentOrderId","attr":"value","field":"form.Fo^' ||
q'^rmStep7.Panel247.parentOrderId"}],"error":false,"pathToRegionField":"form.FormStep7.Map","pathToOrgField":"form.FormStep7.Map","required":true,"eqServiceId":"100000102511","filterByHall":true,"submitE^' ||
q'^vents":{"submit":[{"eventType":"submit","_id":0,"context":{"invitation":{"invitationType":"EQUEUE"}},"requestBinding":{"invitation":{"code":"form.FormStep7.Panel247.Panel277.TimeSlotExt"}},"responseBi^' ||
q'^nding":{"invitation":{"orderId":"form.FormStep7.EditBookPanel.parentOrderId","equeueOrderId":"form.FormStep7.EditBookPanel.EqueueOrderId","invitationStatus":"form.FormStep7.EditBookPanel.bookStatus","^' ||
q'^orgName":"form.FormStep7.EditBookPanel.orgName","address":"form.FormStep7.EditBookPanel.orgAddress","startDate":"form.FormStep7.EditBookPanel.visitTime"}},"processor":"loadInvitationProcessor"}]}}],"r^' ||
q'^ules":[]},{"className":"FieldText","name":"areaId","fullPath":"form.FormStep7.Panel247.areaId","visible":false,"label":"areaId","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"eser^' ||
q'^viceId","fullPath":"form.FormStep7.Panel247.eserviceId","visible":false,"value":"100000102511","readonly":true,"immutable":true,"label":"eserviceId","forceXml":true,"theMaskedValue":"100000102512","su^' ||
q'^bmitEvents":{}},{"className":"FieldText","name":"preliminaryReservation","fullPath":"form.FormStep7.Panel247.preliminaryReservation","visible":false,"value":"false","label":"preliminaryReservation","f^' ||
q'^orceXml":true,"theMaskedValue":"true","submitEvents":{}},{"className":"FieldText","name":"address","fullPath":"form.FormStep7.Panel247.address","visible":false,"label":"address","forceXml":true,"theMa^' ||
q'^skedValue":"Проверочное значение","submitEvents":{}},{"className":"FieldText","name":"orgName","fullPath":"form.FormStep7.Panel247.orgName","visible":false,"label":"orgName","forceXml":true,"submitEve^' ||
q'^nts":{}},{"className":"FieldText","name":"subject","fullPath":"form.FormStep7.Panel247.subject","visible":false,"value":"Электронная запись на прием","label":"subject","forceXml":true,"theMaskedValue"^' ||
q'^:"1 Ростов. Запись на прием","submitEvents":{}},{"className":"FieldText","name":"parentOrderId","fullPath":"form.FormStep7.Panel247.parentOrderId","visible":false,"label":"parentOrderId","strategy":"o^' ||
q'^rder_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"calendarName","fullPath":"form.FormStep7.Panel247.calendarName","visible":false,"label":"calendarName","strategy":"form_tar^' ||
q'^get_name","forceXml":true,"theMaskedValue":"Выдача архивных справок, копий и выписок по тематике обращения","submitEvents":{}},{"className":"FieldText","name":"DepartmentId","fullPath":"form.FormStep7^' ||
q'^.Panel247.DepartmentId","visible":false,"readonly":true,"immutable":true,"label":"DepartmentId","strategy":"form_target_org_id","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"serv^' ||
q'^iceId","fullPath":"form.FormStep7.Panel247.serviceId","visible":false,"handlers":[{"listen":[{"component":"","events":["formRendered"]}],"handler":"function(evt){\n    this.value(api.env('parentTarget^' ||
q'^'));\n    api.find('form.FormStep7.Panel247.Map').fetch();\n}\n"}],"readonly":true,"immutable":true,"label":"serviceId","strategy":"form_target_id","forceXml":true,"theMaskedValue":"890000000016010838^' ||
q'^5","submitEvents":{}},{"className":"FieldText","name":"slotId","fullPath":"form.FormStep7.Panel247.slotId","visible":false,"label":"slotId","forceXml":true,"submitEvents":{}},{"className":"FieldText",^' ||
q'^"name":"orgId","fullPath":"form.FormStep7.Panel247.orgId","visible":false,"label":"orgId","forceXml":true,"submitEvents":{}},{"className":"FieldTextDate","name":"Startdate","fullPath":"form.FormStep7.^' ||
q'^Panel247.Startdate","visible":false,"handlers":[{"listen":[{"component":"form.FormStep7.Panel247.Startdate","events":["change"]}],"handler":"function (evt)\n{\n  var currentDate = api.find('form.FormS^' ||
q'^tep7.Panel247.Startdate').value();\n  var currentDateParseDay = currentDate.substring(0,2); \n  var currentDateParseMonth = currentDate.substring(3,5); \n  var currentDateParseYear = currentDate.subst^' ||
q'^ring(6,10);\nthis.find('form.FormStep7.Panel247.Startdate1').value(currentDateParseYear+'-'+currentDateParseMonth+'-'+currentDateParseDay);  \n}"}],"label":"Startdate","strategy":"current_date","submi^' ||
q'^tEvents":{}},{"className":"FieldText","name":"Startdate1","fullPath":"form.FormStep7.Panel247.Startdate1","visible":false,"label":"Startdate1","forceXml":true,"theMaskedValue":"2018-10-22","submitEven^' ||
q'^ts":{}},{"className":"FieldText","name":"epguCode","fullPath":"form.FormStep7.Panel247.epguCode","visible":false,"label":"epguCode","forceXml":true,"theMaskedValue":"36741/9","submitEvents":{}},{"clas^' ||
q'^sName":"FieldText","name":"comment","fullPath":"form.FormStep7.Panel247.comment","visible":false,"label":"comment","forceXml":true,"submitEvents":{}}],"rules":[]},{"className":"Panel","name":"EditBook^' ||
q'^Panel","fullPath":"form.FormStep7.EditBookPanel","visible":false,"handlers":[],"title":"EditBookPanel","inlineCSS":"","submitEvents":{"submit":[{"eventType":"submit","_id":0,"context":{"invitation":{"^' ||
q'^invitationType":"EQUEUE"}},"requestBinding":{"invitation":{"code":"form.FormStep7.EditBookPanel.bookCode"}},"responseBinding":{"invitation":{"equeueOrderId":"form.FormStep7.EditBookPanel.EqueueOrderId^' ||
q'^","orderId":"form.FormStep7.EditBookPanel.parentOrderId","invitationStatus":"form.FormStep7.EditBookPanel.bookStatus","orgName":"form.FormStep7.EditBookPanel.orgName","address":"form.FormStep7.EditBoo^' ||
q'^kPanel.orgAddress","startDate":"form.FormStep7.EditBookPanel.visitTime"}},"processor":"loadInvitationProcessor"}]},"items":[{"className":"FieldText","name":"orgId","fullPath":"form.FormStep7.EditBookP^' ||
q'^anel.orgId","label":"Код подразделения","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"parentOrderId","fullPath":"form.FormStep7.EditBookPanel.parentOrderId","label":"Код заявки",^' ||
q'^"forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"EqueueOrderId","fullPath":"form.FormStep7.EditBookPanel.EqueueOrderId","label":"Код заявки ЭО","forceXml":true,"submitEvents":{}},{"^' ||
q'^className":"FieldText","name":"bookStatus","fullPath":"form.FormStep7.EditBookPanel.bookStatus","label":"Статус записи","forceXml":true,"submitEvents":{}},{"className":"FieldText","name":"bookCode","f^' ||
q'^ullPath":"form.FormStep7.EditBookPanel.bookCode","handlers":[{"listen":[{"component":"form.FormStep7.Panel247.Panel277.TimeSlotExt","events":["change"]}],"handler":"function(evt){this.value(api.find('^' ||
q'^form.FormStep7.Panel247.Panel277.TimeSlotExt').value())}"}],"label":"Тип резервирования","submitEvents":{}},{"className":"FieldText","name":"orgAddress","fullPath":"form.FormStep7.EditBookPanel.orgAdd^' ||
q'^ress","value":"Проверочное значение","submitEvents":{}},{"className":"FieldText","name":"visitTime","fullPath":"form.FormStep7.EditBookPanel.visitTime","handlers":[],"inlineCSS":"","forceXml":true,"su^' ||
q'^bmitEvents":{}},{"className":"FieldText","name":"orgName","fullPath":"form.FormStep7.EditBookPanel.orgName","submitEvents":{}}],"rules":[]}],"rules":[]},{"className":"NavPanel","name":"NavPanel","full^' ||
q'^Path":"form.NavPanel","visible":false,"handlers":[{"listen":[{"component":"NavPanel","events":["click"]}],"handler":"function navPanelDefaultHandler(evt) {\r\n\r\n        if (api.validate()) {\r\n\r\n^' ||
q'^            var finSubmit = {\r\n                // Сохранение черновика - вызов saveDraft с первого шага.\r\n                init: function (evt) {\r\n                    api.stepList()[0].submit('su^' ||
q'^bmit', 0, finSubmit.callBackDraft, undefined, true);\r\n                },\r\n                callBackDraft: {\r\n                    done: function (data) {\r\n                        if (data && dat^' ||
q'^a.error && data.error.code == '0') {\r\n                            finSubmit.submitFinal(evt);\r\n                        } else {\r\n                            finSubmit.submitError();\r\n         ^' ||
q'^               }\r\n                    },\r\n                    error: function (e) {\r\n                        finSubmit.submitError();\r\n                    },\r\n                    always: fun^' ||
q'^ction (e) {\r\n                    }\r\n                },\r\n                submitFinal: function (evt) {\r\n                    // Отправка финального запроса. По умолчанию берется нулевой сабмит.\^' ||
q'^r\n                    var systemData = api.env('systemData');\r\n                    if (systemData && systemData.signCnt && (+systemData.signCnt > 1) && systemData.isOwner && systemData.isOwner !== ^' ||
q'^'true') {\r\n                        api.signConfirm().done(function () {\r\n                            var rUrl = api.env('rURL');\r\n                            if (rUrl) {\r\n                     ^' ||
q'^           api.link(rUrl + '/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results');\r\n                            }\r\n                            else {\r\n                                api.link^' ||
q'^(api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId'));\r\n                            }\r\n                        })\r\n                    } else {\r\n                        Form^' ||
q'^Player.generateServerPdf().done(function () {\r\n                            api.submit('submit', 0, finSubmit.callBackFinalSubmit);\r\n                        });\r\n                    }\r\n        ^' ||
q'^        },\r\n                callBackFinalSubmit: {\r\n                    done: function (data) {\r\n                        if (data && data.error && data.error.code == '0') {\r\n                  ^' ||
q'^          var finalLink;\r\n                            var notifySMU = api.env('notifySMU');\r\n                            // добавлена проверка на callback для СМУ\r\n                            if^' ||
q'^ (notifySMU) {\r\n                                notifySMU({\r\n                                    \"eventType\": \"submitForm\",\r\n                                    \"eventParams\": [\r\n       ^' ||
q'^                                 {\"key\": \"orderId\", \"value\": api.env('orderId')},\r\n                                        {\"key\": \"formMnemonic\", \"value\": api.env('formMnemonic')},\r\n ^' ||
q'^                                       {\"key\": \"targetId\", \"value\": api.env('targetId')}\r\n                                    ]\r\n                                })\r\n                       ^' ||
q'^     } else {\r\n                                // Переход в ЛК белый/синий\r\n\r\n                                if (api.env('rURL')) {\r\n                                    finalLink = api.env('r^' ||
q'^URL') + '/details^' ||
 '?'
 || q'^elementId=' + api.env('orderId') + '#_results';\r\n                                } else {\r\n                                    finalLink = api.env('lkUrl') + 'notifications/detai^' ||
q'^ls/ORDER/' + api.env('orderId');\r\n                                }\r\n                                api.link(finalLink);\r\n                            }\r\n\r\n                        } else {\r^' ||
q'^\n                            finSubmit.submitError({code: \"submitError\"});\r\n                        }\r\n                    },\r\n                    error: function (e) {\r\n                   ^' ||
q'^     finSubmit.submitError(e);\r\n                    },\r\n                    always: function (e) {\r\n                    }\r\n                },\r\n                callBackDraftESEP: {\r\n       ^' ||
q'^             done: function (data) {\r\n                        if (data && data.error && data.error.code == '0') {\r\n                            api.shade(false);\r\n                            Form^' ||
q'^Player.generateHtml();\r\n                        } else {\r\n                            finSubmit.submitError();\r\n                        }\r\n                    },\r\n                    error: ^' ||
q'^function (e) {\r\n                        finSubmit.submitError(e);\r\n                    },\r\n                    always: function (e) {\r\n                    }\r\n                },\r\n          ^' ||
q'^      submitError: function (data) {\r\n                    data = data || {};\r\n                    if (typeof data.code === 'undefined' || (data.code && (data.code < 1400 || data.code > 1403))) {\r^' ||
q'^\n                        data.code = 'submitError';\r\n                        data.hideForm = true;\r\n                    } else {\r\n                        data.esepError = true;\r\n             ^' ||
q'^       }\r\n                    FormPlayer.handleError(data);\r\n                    // Обработка ошибки при выполнении сабмита\r\n                    api.shade(false);\r\n                }\r\n       ^' ||
q'^     };\r\n\r\n            var findResult = /result=(0)/;\r\n\r\n            if (findResult.test(window.location.href)) {\r\n                // Если вернулись из ЕСЭП, результат корректный, финальная ^' ||
q'^отправка заявки\r\n                finSubmit.submitFinal(evt);\r\n            } else {\r\n                // первичная отправка. Если с подписанием - то в ЕСЭП, если без - то финальный запрос.\r\n    ^' ||
q'^            if (FormPlayer.env.supportSignature) {\r\n                    // сохранение черновика с последующим переходом в ЕСЭП\r\n                    api.stepList()[0].submit('submit', 0, finSubmit.^' ||
q'^callBackDraftESEP, false);\r\n                } else {\r\n                    // обычная отправка без подписания\r\n                    finSubmit.init(evt);\r\n                }\r\n            }\r\n\r^' ||
q'^\n        }\r\n    }"}],"submitEvents":{},"items":[{"className":"FormButton","name":"__prevStep","fullPath":"form.NavPanel.__prevStep","visible":false,"handlers":[{"listen":[{"component":"__prevStep",^' ||
q'^"events":["click"]}],"handler":"function (evt) {\r\n        //Сбор всех видимых шагов\r\n        var steps = api.stepList();\r\n        //Возврат текущего шага заменить на step()\r\n        var cs = a^' ||
q'^pi.step();\r\n        var ns = cs - 1;\r\n        //Текущгий шаг\r\n        var crSt = steps[cs];\r\n        //Шаг на который надо перейти\r\n        var toGoTo = steps[ns];\r\n        //Если мы наход^' ||
q'^имся на реальных шагах\r\n        var onSteps = (ns >= 0);\r\n\r\n        if (onSteps) {\r\n            //Обчыный шаг\r\n            api.step(ns);\r\n        } else {\r\n            //Переход на карто^' ||
q'^чку услуги\r\n            api.link(api.env('returnUrl') + '/service/' + api.env('targetId') + '_' + api.env('formMnemonic') + '.html#_description');\r\n        }\r\n    }"}],"label":"Назад","action":"^' ||
q'^prev","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"FormButtonShowInfo","fullPath":"form.NavPanel.FormButtonShowInfo","visible":false,"handlers":[{"listen":[{"componen^' ||
q'^t":"FormButtonShowInfo","events":["click"]}],"handler":"function (evt) {\r\n        FormPlayer.makeBusy(true);\r\n        FormPlayer.showServiceInfo();\r\n    }"}],"label":"Описание услуги","action":"^' ||
q'^view-info","floating":"PGU-BtnFloat","submitEvents":{}},{"className":"FormButton","name":"__nextStep","fullPath":"form.NavPanel.__nextStep","visible":false,"handlers":[{"listen":[{"component":"FormBut^' ||
q'^tonNext","events":["click"]}],"handler":"function (evt) {\r\n        //Сбор всех видимых шагов\r\n        var steps = api.stepList();\r\n        //Длина шагов\r\n        var stepsLen = steps.length;\r^' ||
q'^\n        var cs = api.step();\r\n        var ns = cs + 1;\r\n        //Текущий шаг\r\n        var crSt = steps[cs];\r\n        var finalLink = api.env('url') + '/orders/details^' ||
 '?'
 || q'^elementId=' + api.env(^' ||
q'^'orderId') + '#_results';\r\n        //Если мы находимся на реальных шагах\r\n        var onSteps = (ns <= stepsLen);\r\n        if (onSteps) {\r\n            crSt.submit('submit');\r\n            //R^' ||
q'^esponse binding\r\n            var prevVis = (crSt.name() === 'preview');\r\n            var prevNeeded = (api.hidePreview() === \"false\");\r\n            if (ns < stepsLen) {\r\n                api.^' ||
q'^step(ns);\r\n            } else if ((ns === stepsLen) && ((prevNeeded && prevVis) || !prevNeeded)) {\r\n                //Финальный шаг\r\n                api.shade(true);\r\n                FormPlaye^' ||
q'^r.generateServerPdf().done(function () {\r\n                    api.submit('submit');\r\n                    api.submit('final');\r\n                    api.link(finalLink);\r\n                })\r\n ^' ||
q'^           }\r\n        }\r\n    }"}],"label":"Далее","action":"next","balign":"right","floating":"PGU-BtnFloat","submitEvents":{}}],"rules":[]}],"rules":[]}^';

  merge into pguforms.form f
  using (select
              'Ростов. Электронная запись на прием' NAME,
              to_timestamp('15.07.2020 00:01:17', 'dd.mm.yyyy HH24:MI:SS') CREATE_DATE,
              to_timestamp('21.08.2020 10:14:40', 'dd.mm.yyyy HH24:MI:SS') UPDATE_DATE,
              v_Content CONTENT,
              'N' DELETED,
              1000413036 AUTHORID,
              null EDS_TYPE,
              null PRESENTATION_TYPE,
              null RECIPIENT,
              '100000102511' MNEMONIC,
              null XSLT,
              'OID.1000365232'LOGIN,
              'КлименокТест М.С....' FIO,
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