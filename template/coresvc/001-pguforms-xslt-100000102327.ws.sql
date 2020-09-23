-- Author: RTL
-- Change: KRDDEVARMV-3737
-- Description:
set define off;
declare
  cn clob;
begin
  cn := q'@<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pgufg="http://idecs.atc.ru/pgufg/ws/fgapc/"
                xmlns:ns2="http://smev.gosuslugi.ru/request/rev111111"
				exclude-result-prefixes="xsl pgufg ns2">

	<xsl:template match="/">
		<tns:RequestMessage xmlns:tns="urn://rtlabs/armv60/startRequest/1.0.2">

			<tns:OKTMO>60000000</tns:OKTMO>

			<tns:CaseNumber><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='CaseNumber']/pgufg:value"/></tns:CaseNumber>

			<tns:Date><xsl:apply-templates select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='CreateDate_order']" mode="date"/></tns:Date>
			<tns:ServiceCode><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='srguServiceId']/pgufg:value"/></tns:ServiceCode>
			<tns:processKey><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='code']/pgufg:value"/></tns:processKey>
			<tns:templateID>TPReqRes</tns:templateID>



	<tns:Params>



			<tns:Param>
			<tns:name>sir_attachments_process</tns:name>
			<tns:value>true</tns:value>
			</tns:Param>



<!-- служебное не в служебном, потом может уберу, пока пусть будет -->




		<!-- Для Михаила, тип заявителя по-русски -->
			<xsl:if test="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'PERSON_RF'">
					<tns:Param desc = "Тип заявителя"><tns:name>TypeID</tns:name>
					<tns:value>Физическое лицо</tns:value></tns:Param>
			</xsl:if>
			<xsl:if test="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'BUSINESSMAN'">
					<tns:Param desc = "Тип заявителя"><tns:name>TypeID</tns:name>
					<tns:value>Индивидуальный предприниматель</tns:value></tns:Param>
			</xsl:if>
			<xsl:if test="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'EMPLOYEE'">
					<tns:Param desc = "Тип заявителя"><tns:name>TypeID</tns:name>
					<tns:value>Юридическое лицо</tns:value></tns:Param>
			</xsl:if>




			<tns:Param desc = "Дата подачи"><tns:name>DateApplication</tns:name>
					<tns:value><xsl:apply-templates select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='CreateDate_order']" mode="date"/></tns:value></tns:Param>
			<tns:Param desc = "Номер заявки"><tns:name>CaseNumber</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='CaseNumber']/pgufg:value"/></tns:value></tns:Param>
			<tns:Param desc = "Наименование цели услуги (СРГУ))"><tns:name>srguServiceName</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='srguServiceName']/pgufg:value"/></tns:value></tns:Param>
			<tns:Param desc = "Код цели услуги (СРГУ)"><tns:name>ServiceCode</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='srguServiceId']/pgufg:value"/></tns:value></tns:Param>
			<tns:Param desc = "Мнемоника формы"><tns:name>mnemonic</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='code']/pgufg:value"/></tns:value></tns:Param>
			<tns:Param desc = "Код ведомства (СРГУ)"><tns:name>srguDepartmentId</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='srguDepartmentId']/pgufg:value"/></tns:value></tns:Param>
			<tns:Param desc = "Наименование ведомства (СРГУ)"><tns:name>srguDepartmentName</tns:name>
					<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='srguDepartmentName']/pgufg:value"/></tns:value></tns:Param>


<!-- Информация о заявителе ФЛ, отображается если заявитель ФЛ или ИП -->

<xsl:if test="//pgufg:object[pgufg:code='ClaimDetails']/pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value != 'EMPLOYEE'">

				<tns:Param desc="В качестве заявителя выступает его представитель">
						<tns:name>represent</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='PanelAgent']/pgufg:object[pgufg:code='Panel465']/pgufg:object[pgufg:code='represent']/pgufg:value"/>
						</tns:value>
				</tns:Param>

				<!-- Информация о заявителе если выбран чекбокс представителя (данные которые заполняются вручную -->
				<xsl:if test="//pgufg:object[pgufg:code='PanelAgent']/pgufg:object[pgufg:code='Panel465']/pgufg:object[pgufg:code='represent']/pgufg:value = 'true'">



				<tns:Param desc="Фамилия заявителя">
						<tns:name>surname</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='Panelsurname']/pgufg:object[pgufg:code='trustee_surname']/pgufg:value"/>
						</tns:value>
				</tns:Param>
				<tns:Param desc="Имя заявителя">
						<tns:name>firstName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='PanelfirstName']/pgufg:object[pgufg:code='trustee_firstName']/pgufg:value"/>
						</tns:value>
					</tns:Param>

				<xsl:if test="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='trustee_middleName']/pgufg:value != ''">
				<tns:Param desc="Отчество заявителя">
						<tns:name>middleName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='trustee_middleName']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				</xsl:if>

				<tns:Param desc="СНИЛС">
						<tns:name>snils</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='Panelpred_snils']/pgufg:object[pgufg:code='predSnils']/pgufg:value"/>
						</tns:value>
				</tns:Param>
				<tns:Param desc="ИНН (если представитель)">
						<tns:name>inn</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='Panelpred_innip']/pgufg:object[pgufg:code='innip_pred']/pgufg:value"/>
						</tns:value>
					</tns:Param>



			<!-- тут кусок по реквизитам ИП, если тип заявителя ИП и чекбокс представителя включен -->



		<xsl:if test="//pgufg:object[pgufg:code='ClaimDetails']/pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'BUSINESSMAN'">
				<xsl:if test="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='Panelpred_ogrnip']/pgufg:object[pgufg:code='ogrnip_pred']/pgufg:value != ''">
				<tns:Param desc="ОГРНИП (если представитель)">
						<tns:name>ogrnip_pred</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trusteeData']/pgufg:object[pgufg:code='Panelpred_ogrnip']/pgufg:object[pgufg:code='ogrnip_pred']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				</xsl:if>

		</xsl:if>
			<!-- дальше продолжаем по докам -->

				<tns:Param desc="Тип документа удостоверяющего личность заявителя">
					<tns:name>Title</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trustee_doc2']/pgufg:object[pgufg:code='Paneltitle']/pgufg:object[pgufg:code='Name1']/pgufg:attrs/pgufg:entry[pgufg:key='text_value']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<tns:Param desc="Серия документа удостоверяющего личность заявителя">
						<tns:name>Serial</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trustee_doc2']/pgufg:object[pgufg:code='PanelSerias']/pgufg:object[pgufg:code='Serial1']/pgufg:value"/>@';
  cn := cn || q'@</tns:value>
					</tns:Param>
					<tns:Param desc="Номер документа удостоверяющего личность заявителя">
						<tns:name>Number</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trustee_doc2']/pgufg:object[pgufg:code='PanelNumber']/pgufg:object[pgufg:code='Number1']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Дата выдачи документа удостоверяющего личность заявителя">
						<tns:name>IssueDate</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trustee_doc2']/pgufg:object[pgufg:code='PanelissueDate']/pgufg:object[pgufg:code='fromDate1']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Кем выдан документ удостоверяющий личность заявителя">
						<tns:name>Issuer</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='trustee_doc2']/pgufg:object[pgufg:code='Panelissuer']/pgufg:object[pgufg:code='Org1']/pgufg:value"/>
						</tns:value>
					</tns:Param>

			<!-- Информация о представителе (хозяине ЛК) -->
				<tns:Param desc="Фамилия представителя">
						<tns:name>trustee_surname</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelsurname']/pgufg:object[pgufg:code='surname']/pgufg:value"/>
						</tns:value>
				</tns:Param>
				<tns:Param desc="Имя представителя">
						<tns:name>trustee_firstName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelfirstName']/pgufg:object[pgufg:code='firstName']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<xsl:if test="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='middleName']/pgufg:value != ''">
				<tns:Param desc="Отчество представителя">
						<tns:name>trustee_middleName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='middleName']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				</xsl:if>



					<tns:Param desc="Тип документа удостоверяющего личность представителя">
					<tns:name>trustee_Title</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='Paneltitle']/pgufg:object[pgufg:code='title']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<tns:Param desc="Серия документа удостоверяющего личность представителя">
						<tns:name>trustee_Serial</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelSerias']/pgufg:object[pgufg:code='Serias']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Номер документа удостоверяющего личность представителя">
						<tns:name>trustee_Number</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelNumber']/pgufg:object[pgufg:code='Number']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Дата выдачи документа удостоверяющего личность представителя">
						<tns:name>trustee_IssueDate</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelissueDate']/pgufg:object[pgufg:code='issueDate']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Кем выдан документ удостоверяющий личность представителя">
						<tns:name>trustee_Issuer</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='Panelissuer']/pgufg:object[pgufg:code='issuer']/pgufg:value"/>
						</tns:value>
					</tns:Param>

				</xsl:if>

			<!-- Информация о заявителе если чекбокс представителя НЕ ВЫБРАН (Обычная подача без представителя)-->
			<xsl:if test="//pgufg:object[pgufg:code='PanelAgent']/pgufg:object[pgufg:code='Panel465']/pgufg:object[pgufg:code='represent']/pgufg:value = 'false'">
			<tns:Param desc="Фамилия заявителя">
						<tns:name>surname</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelsurname']/pgufg:object[pgufg:code='surname']/pgufg:value"/>
						</tns:value>
				</tns:Param>
				<tns:Param desc="Имя заявителя">
						<tns:name>firstName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelfirstName']/pgufg:object[pgufg:code='firstName']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<xsl:if test="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='middleName']/pgufg:value != ''">
				<tns:Param desc="Отчество заявителя">
						<tns:name>middleName</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='PanelmiddleName']/pgufg:object[pgufg:code='middleName']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				</xsl:if>

				<tns:Param desc="СНИЛС заявителя">
						<tns:name>snils</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelsnils']/pgufg:object[pgufg:code='Snils']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				<tns:Param desc="ИНН ИП">
						<tns:name>inn</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelinnip']/pgufg:object[pgufg:code='innip']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				<!-- тут кусок по реквизитам ИП, если тип заявителя ИП и чекбокс представителя включен -->



			<xsl:if test="//pgufg:object[pgufg:code='ClaimDetails']/pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'BUSINESSMAN'">
				<xsl:if test="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelogrnip']/pgufg:object[pgufg:code='ogrnip']/pgufg:value != ''">
				<tns:Param desc="ОГРНИП">
						<tns:name>ogrnip</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdata']/pgufg:object[pgufg:code='Panelogrnip']/pgufg:object[pgufg:code='ogrnip']/pgufg:value"/>
						</tns:value>
					</tns:Param>
				</xsl:if>

		</xsl:if>
			<!-- дальше продолжаем по докам -->


					<tns:Param desc="Тип документа удостоверяющего личность заявителя">
					<tns:name>Title</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='Paneltitle']/pgufg:object[pgufg:code='title']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<tns:Param desc="Серия документа удостоверяющего личность заявителя">
						<tns:name>Serial</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelSerias']/pgufg:object[pgufg:code='Serias']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Номер документа удостоверяющего личность заявителя">
						<tns:name>Number</tns:name>
						<tns:value>@';
  cn := cn || q'@<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelNumber']/pgufg:object[pgufg:code='Number']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Дата выдачи документа удостоверяющего личность заявителя">
						<tns:name>IssueDate</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='PanelissueDate']/pgufg:object[pgufg:code='issueDate']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					<tns:Param desc="Кем выдан документ удостоверяющий личность заявителя">
						<tns:name>Issuer</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='userdoc']/pgufg:object[pgufg:code='Panelissuer']/pgufg:object[pgufg:code='issuer']/pgufg:value"/>
						</tns:value>
					</tns:Param>
			</xsl:if>



				<!-- Контактная информация -->


					<tns:Param desc="Мобильынй телефон">
						<tns:name>Phone</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='Panelphone']/pgufg:object[pgufg:code='MobilePhone']/pgufg:value"/>
						</tns:value>
					</tns:Param>


					<tns:Param desc="Адрес электронной почты">
						<tns:name>Email</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='Panelemail']/pgufg:object[pgufg:code='Email']/pgufg:value"/>
						</tns:value>
					</tns:Param>

				<!-- Адреса, передача факт адреса в зависимости от значения чекбокса, сам чекбокс не передаем -->

					<tns:Param desc="Сведения об адресе регистрации по месту жительства">
						<tns:name>PersonAddress</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='PanelAddress']/pgufg:object[pgufg:code='RegAddressFL']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<xsl:if test="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='PanelAddress']/pgufg:object[pgufg:code='adr_check']/pgufg:value = 'false'">
					<tns:Param desc="Сведения об адресе фактического места жительства">
						<tns:name>FactAddress</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='PanelAddress']/pgufg:object[pgufg:code='RegAddressFL']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					</xsl:if>
					<xsl:if test="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='PanelAddress']/pgufg:object[pgufg:code='adr_check']/pgufg:value = 'true'">
					<tns:Param desc="Сведения об адресе фактического места жительства">
						<tns:name>FactAddress</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Contactinfo']/pgufg:object[pgufg:code='PanelAddress']/pgufg:object[pgufg:code='FactAddressFL']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					</xsl:if>
			</xsl:if>
	<!-- Информация о заявителе ЮЛ, передается если заявитель ЮЛ -->

<xsl:if test="//pgufg:object[pgufg:code='ClaimDetails']/pgufg:object[pgufg:code='service']/pgufg:object[pgufg:code='TypeID']/pgufg:value = 'EMPLOYEE'">


		<tns:Param desc="Полное наименование организации">
				<tns:name>FullName</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='PanelorgName']/pgufg:object[pgufg:code='orgName']/pgufg:value"/></tns:value>
		</tns:Param>

		<tns:Param desc="Краткое наименование организации">
				<tns:name>ShortName</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='PanelFullname']/pgufg:object[pgufg:code='FullName']/pgufg:value"/></tns:value>
		</tns:Param>

		<tns:Param desc="ОПФ">
				<tns:name>OrgForm</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='Panelfirm_opf']/pgufg:object[pgufg:code='firm_opf']/pgufg:value"/></tns:value>
		</tns:Param>

		<tns:Param desc="ИНН ЮЛ">
				<tns:name>inn_ul</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='PanelINN']/pgufg:object[pgufg:code='INN']/pgufg:value"/></tns:value>
		</tns:Param>

		<tns:Param desc="ОГРН ЮЛ">
				<tns:name>ogrn_ul</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='PanelOGRN']/pgufg:object[pgufg:code='OGRN']/pgufg:value"/></tns:value>
		</tns:Param>


		<xsl:if test="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='Panelkpp']/pgufg:object[pgufg:code='kpp']/pgufg:value != ''">
		<tns:Param desc="КПП ЮЛ">
				<tns:name>kpp_ul</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='PanelLegal']/pgufg:object[pgufg:code='Panelkpp']/pgufg:object[pgufg:code='kpp']/pgufg:value"/></tns:value>
		</tns:Param>
		</xsl:if>

	<!--Сведения о представителе ЮЛ-->

		<tns:Param desc="Фамилия представителя ЮЛ">
				<tns:name>LastNameUL</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='PanelLastNameUL']/pgufg:object[pgufg:code='LastNameUL']/pgufg:value"/></tns:value>
		</tns:Param>
		<tns:Param desc="Имя представителя ЮЛ">
				<tns:name>FirstNameUL</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='PanelFirstNameUL']/pgufg:object[pgufg:code='FirstNameUL']/pgufg:value"/></tns:value>
		</tns:Param>
		<xsl:if test="//pgufg:object[pgufg:code='MiddleNameUL']/pgufg:value != ''">
		<tns:Param desc="Отчество представителя ЮЛ">
				<tns:name>MiddleNameUL</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='PanelMiddleNameUL']/pgufg:object[pgufg:code='MiddleNameUL']/pgufg:value"/></tns:value>
		</tns:Param>
		</xsl:if>
		<tns:Param desc="Должность представителя ЮЛ">
				<tns:name>position</tns:name>
				<tns:value><xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panelposition']/pgufg:object[pgufg:code='position']/pgufg:value"/></tns:value>
		</tns:Param>

		<!--Контактные данные ЮЛ-->

	<tns:Param desc="Телефон ЮЛ">
						<tns:name>MobilePhoneUL</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='PanelMobilePhoneUL']/pgufg:object[pgufg:code='MobilePhoneUL']/pgufg:value"/>
						</tns:value>
					</tns:Param>


					<tns:Param desc="Адрес электронной почты ЮЛ">
						<tns:name>EmailUL</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='PanelEmailUL']/pgufg:object[pgufg:code='EmailUL']/pgufg:value"/>
						</tns:value>
					</tns:Param>

				<!-- Адреса, передача факт адреса в зависимости от значения чекбокса, сам чекбокс не передаем -->

					<tns:Param desc="Юридический адрес">
						<tns:name>PostalAddressUL</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panel196']/pgufg:object[pgufg:code='PostalAddressUL']/pgufg:value"/>
						</tns:value>
					</tns:Param>

					<xsl:if test="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panel290']/pgufg:object[pgufg:code='Checkbox_adr_UL']/pgufg:value = 'false'">
					<tns:Param desc="Фактический адрес ЮЛ">@';
  cn := cn || q'@<tns:name>PostalAddressUL</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panel196']/pgufg:object[pgufg:code='PostalAddressUL']/pgufg:value"/>
						</tns:value>
					</tns:Param>
					</xsl:if>
					<xsl:if test="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panel290']/pgufg:object[pgufg:code='Checkbox_adr_UL']/pgufg:value = 'true'">
					<tns:Param desc="Фактический адрес ЮЛ">
						<tns:name>FactAddressUL</tns:name>
						<tns:value>
							<xsl:value-of select="//pgufg:object[pgufg:code='Panel_cont_info']/pgufg:object[pgufg:code='Panel290']/pgufg:object[pgufg:code='FactAddressUL']/pgufg:value"/>
						</tns:value>
					</tns:Param>
		</xsl:if>





	</xsl:if>

								<!-- ПРАВИМ ОТСЮДА -->
				<!-- Данные по услуге -->




						<tns:Param desc="Текст обращения">
						<tns:name>letter</tns:name>
						<tns:value>
							<xsl:value-of select = "//pgufg:object[pgufg:code = 'Panel2676']/pgufg:object[pgufg:code = 'letter']/pgufg:value"/>
						</tns:value>
							</tns:Param>



					<!-- ПРАВИМ ДОСЮДА -->

			</tns:Params>
		    <tns:AppliedDocuments>
                <xsl:for-each select="//ns2:AppliedDocument">
                    <tns:AppliedDocument>
                        <xsl:attribute name="ID"><xsl:value-of select="concat('ID',position())"/></xsl:attribute>
                        <tns:CodeDocument><xsl:value-of select="./ns2:CodeDocument"/></tns:CodeDocument>
                        <tns:Name><xsl:value-of select="./ns2:Name"/></tns:Name>
                        <tns:Number><xsl:value-of select="./ns2:Number"/></tns:Number>
                        <tns:URL><xsl:value-of select="./ns2:URL"/></tns:URL>
                        <tns:Type><xsl:value-of select="./ns2:Type"/></tns:Type>
                        <tns:DigestValue><xsl:value-of select="./ns2:DigestValue"/></tns:DigestValue>
                    </tns:AppliedDocument>
                </xsl:for-each>
            </tns:AppliedDocuments>
		</tns:RequestMessage>
	</xsl:template>

	<xsl:template match="//pgufg:object" mode="date">
		<xsl:if test="./pgufg:value != ''">
			<xsl:variable name="date" select="substring(./pgufg:value,1,2)"/>
			<xsl:variable name="month" select="substring(./pgufg:value,4,2)"/>
			<xsl:variable name="year" select="substring(./pgufg:value,7,4)"/>
			<xsl:value-of select="concat($year, '-',$month, '-',$date, 'T00:00:00+04:00')"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>@';

merge into pguforms.xslt xs
using (select '{{.ServiceFormCode}}.ws' as mnem, cn as content from dual ) d
on (d.mnem = xs.mnemonic)
when matched then update set xs.CONTENT = d.content, xs.updated = sysdate
when not matched then
insert (MNEMONIC, CONTENT, AUTHORID) values ('{{.ServiceFormCode}}.ws', cn, 1000413036);
commit;
end;
/
