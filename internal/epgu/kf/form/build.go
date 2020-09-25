package form

import (
	"fmt"
	"github.com/sirupsen/logrus"
	"sdf-converter/internal/epgu/kf"
	"sdf-converter/internal/epgu/kf/field"
	"sdf-converter/internal/epgu/kf/panel"
	"sdf-converter/internal/epgu/kf/step"
	"sdf-converter/internal/sdf"
	"sdf-converter/internal/util"
)

// Builder ...
type Builder struct {
}

// NewBuilder ...
func NewBuilder() *Builder {
	return &Builder{}
}

func (b *Builder) rules() []string {
	return []string{
		"form.FormStep1.trusteeData@visible=form.FormStep1.PanelAgent.Panel465.represent@checked",
		"form.FormStep1.Contactinfo.PanelAddress.FactAddressFL@visible=form.FormStep1.Contactinfo.PanelAddress.adr_check@checked",
		"form.FormStep1.trustee_doc1@visible=form.FormStep1.PanelAgent.Panel465.represent@checked",
		"form.FormStep1.trustee_doc2@visible=form.FormStep1.PanelAgent.Panel465.represent@checked",
		"form.FormStep1.trustee_doc3@visible=form.FormStep1.PanelAgent.Panel465.represent@checked",
		"form.FormStepUL@visible=(form.FormStep0.ClaimDetails.service.TypeID@value==\"EMPLOYEE\")",
		"form.FormStepUL.Panel_cont_info.Panel290.FactAddressUL@visible=form.FormStepUL.Panel_cont_info.Panel290.Checkbox_adr_UL@checked",
		"form.FormStep1.userdata.Panelinnip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@disabled)",
		"form.FormStep1.userdata.Panelogrnip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@disabled)",
		"form.FormStep1.trusteeData.Panelpred_innip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@checked)",
		"form.FormStep1.trusteeData.Panelpred_ogrnip@visible=((form.FormStep0.ClaimDetails.service.TypeID@value==\"BUSINESSMAN\")&&form.FormStep1.PanelAgent.Panel465.represent@checked)",
		"form.FormStep1.userdata.Panelsnils@visible=(form.FormStep1.PanelAgent.Panel465.represent@value==\"false\")",
		"form.FormStep1@visible=(form.FormStep0.ClaimDetails.service.TypeID@value!=\"EMPLOYEE\")",
		"form.FormStep3.Paneldoc_pred@visible=form.FormStep1.PanelAgent.Panel465.represent@checked",
	}
}

// Build ...
func (b *Builder) Build(serviceKey string, record *sdf.Service) string {
	component := fmt.Sprintf("Form_61000000%s.NavPanel", serviceKey)

	form1 := NewForm(
		[]string{"form"}, serviceKey,
		WithTitle(record.FullName),
		WithRules(b.rules()),
	)

	step1 := step.NewStep(
		[]string{"form", "FormStep0"}, "FormStep",
		step.WithTitle("Служебные данные"),
		step.WithLabel("0"),
		step.WithVisible(false),
		step.WithEvents(kf.Events()),
	).AddItem(
		panel.NewPanel(
			[]string{"form", "FormStep0", "ClaimDetails"}, "Panel",
			panel.WithTitle(""),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep0", "service"}, "Panel",
				panel.WithTitle("Служебная группа полей"),
				panel.WithVisible(false),
			).AddItem(
				field.NewField([]string{"form", "FormStep0", "service", "userId"}, "FieldText",
					field.WithValue("Идентификатор пользователя"),
					field.WithStrategy("user_id"),
					field.WithForceXML(true)),
				field.NewField([]string{"form", "FormStep0", "service", "TypeID"}, "FieldText",
					field.WithValue("Тип пользователя"),
					field.WithStrategy("user_type"),
					field.WithForceXML(true),
					field.WithMaskValue("Номер заявления")), // TODO: why?
				field.NewField([]string{"form", "FormStep0", "service", "CreateDate_order"}, "FieldText",
					field.WithLabel("Дата подачи"),
					field.WithStrategy("current_date"),
					field.WithForceXML(true),
					field.WithReadonly(true),
					field.WithImmutable(true)),
				field.NewField([]string{"form", "FormStep0", "service", "okato"}, "FieldText",
					field.WithLabel("ОКАТО местоположения"),
					field.WithStrategy("location_code"),
					field.WithForceXML(true)),
				field.NewField([]string{"form", "FormStep0", "service", "srguDepartmentId"}, "FieldText",
					field.WithLabel("Код ведомства (СРГУ)"),
					field.WithStrategy("form_target_org_id"),
					field.WithForceXML(true)),
				field.NewField([]string{"form", "FormStep0", "service", "srguServiceId"}, "FieldText",
					field.WithLabel("Код цели услуги (СРГУ)"),
					field.WithStrategy("form_target_id"),
					field.WithForceXML(true)),
				field.NewField([]string{"form", "FormStep0", "service", "srguServiceName"}, "FieldText",
					field.WithLabel("Наименование цели услуги (СРГУ)"),
					field.WithStrategy("form_target_name"),
					field.WithForceXML(true)),
				field.NewField([]string{"form", "FormStep0", "service", "CaseNumber"}, "FieldText",
					field.WithLabel("Номер заявления"),
					field.WithStrategy("order_id"),
					field.WithForceXML(true),
					field.WithMaskValue("Идентификатор пользователя")), // TODO: why?
				field.NewField([]string{"form", "FormStep0", "service", "code"}, "FieldText",
					field.WithValue(serviceKey),
					field.WithMaskValue(serviceKey)),
			),
		),
	)

	step2 := step.NewStep([]string{"form", "FormStep1"}, "FormStep",
		step.WithTitle("Сведения о заявителе"),
		step.WithLabel("1"),
		step.WithEvents(kf.Events()),
	).AddItem(
		panel.NewPanel(
			[]string{"form", "FormStep1", "PanelAgent"}, "Panel",
			panel.WithTitle(""),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep1", "PanelAgent", "Panel465"}, "Panel",
				panel.WithTitle(""),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "PanelAgent", "Panel465", "represent"}, "FieldCheckbox",
					field.WithTextValue(""),
					field.WithLabel("В качестве заявителя выступает его представитель"),
					field.WithForceXML(true)),
			),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "trusteeData"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "Panelsurname"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "Panelsurname", "trustee_surname"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Фамилия"),
					field.WithMaxlength(60),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "rnd",
						Message:  "Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и дефис",
					}, {
						Mnemonic: "required",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "PanelfirstName"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "PanelfirstName", "trustee_firstName"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Имя"),
					field.WithMaxlength(60),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "rnd",
						Message:  "Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и дефис",
					}, {
						Mnemonic: "required",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "PanelmiddleName"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "PanelmiddleName", "trustee_middleName"}, "FieldText",
					field.WithLabel("Отчество"),
					field.WithMaxlength(60),
					field.WithNotRequiredText("указывается при наличии"),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "rnd_otch",
						Message:  "Пожалуйста, введите корректное значение. Допускается ввод букв русского алфавита и пробел",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "Panelpred_snils"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "Panelpred_snils", "predSnils"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("СНИЛС"),
					field.WithMaxlength(4000), // TODO: why?
					field.WithForceXML(true),
					field.WithMaskValue("000-000-000 00"),
					field.WithMinlength(14),
					field.WithSaveWithMask(true),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "Panelpred_innip"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "Panelpred_innip", "innip_pred"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("ИНН ИП"),
					field.WithMaxlength(12),
					field.WithMaskValue("000000000000"),
					field.WithMinlength(14),
					field.WithSaveWithMask(true),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trusteeData", "Panelpred_ogrnip"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trusteeData", "Panelpred_ogrnip", "ogrnip_pred"}, "FieldText",
					field.WithLabel("ОГРНИП"),
					field.WithMaxlength(13),
					field.WithMaskValue("0000000000000"),
					field.WithMinlength(12),
					field.WithSaveWithMask(true),
				),
			),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "trustee_doc1"}, "Panel",
			panel.WithTitle("Документ удостоверяющий личность заявителя"),
			panel.WithIsGrid(true),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "trustee_doc2"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep1", "trustee_doc2", "Paneltitle"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trustee_doc2", "Paneltitle", "Name1"}, "FieldDropdown",
					field.WithRequired(true),
					field.WithLabel("Наименование документа"),
					field.WithTextValue(""),
					field.WithDictionary(kf.Dictionary{
						"type":        "remote",
						"code":        "61_mintrud_dul",
						"initRequest": false,
					}),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trustee_doc2", "PanelSerias"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trustee_doc2", "PanelSerias", "Serial1"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Серия документа"),
					field.WithMaxlength(10),
					field.WithTextValue(""),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trustee_doc2", "PanelNumber"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trustee_doc2", "PanelNumber", "Number1"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Номер документа"),
					field.WithMaxlength(10),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trustee_doc2", "PanelissueDate"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trustee_doc2", "PanelissueDate", "fromDate1"}, "FieldTextDate",
					field.WithRequired(true),
					field.WithLabel("Дата выдачи"),
					field.WithLimits("|||past|"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "trustee_doc2", "Panelissuer"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "trustee_doc2", "Panelissuer", "Org1"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Кем выдан документ"),
					field.WithMaxlength(500),
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
				),
			),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "trustee_doc3"}, "Panel",
			panel.WithTitle("Сведения о представителе заявителя"),
			panel.WithIsGrid(true),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "userdata"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "Panelsurname"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "Panelsurname", "surname"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Фамилия"),
					field.WithMaxlength(250),
					field.WithStrategy("Фамилия"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "PanelfirstName"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "PanelfirstName", "firstName"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Имя"),
					field.WithMaxlength(250),
					field.WithStrategy("firstname"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "PanelmiddleName"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "PanelmiddleName", "middleName"}, "FieldText",
					field.WithDisabled(true),
					field.WithLabel("Отчество"),
					field.WithMaxlength(250),
					field.WithStrategy("middlename"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "Panelsnils"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "Panelsnils", "Snils"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("СНИЛС"),
					field.WithMaxlength(4000), // TODO: why?
					field.WithForceXML(true),
					field.WithMaskValue("000-000-000 00"),
					field.WithSaveWithMask(true),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "Panelinnip"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "Panelinnip", "innip"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("ИНН ИП"),
					field.WithStrategy("inn"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdata", "Panelogrnip"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdata", "Panelogrnip", "ogrnip"}, "FieldText",
					field.WithDisabled(true),
					field.WithLabel("ОГРНИП"),
					field.WithStrategy("businessmanbrief_ogrn"),
				),
			),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "Panel361"}, "Panel",
			panel.WithTitle("Документ, удостоверяющий личность"),
			panel.WithIsGrid(true),
		),
		panel.NewPanel(
			[]string{"form", "FormStep1", "userdoc"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdoc", "Paneltitle"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdoc", "Paneltitle", "title"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Наименование документа"),
					field.WithStrategy("documenttypename"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdoc", "PanelSerias"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdoc", "PanelSerias", "Serias"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Серия"),
					field.WithStrategy("docseries"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStep1", "userdoc", "PanelNumber"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdoc", "PanelNumber", "Number"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Номер"),
					field.WithStrategy("docnumber"),
				),
			),
			panel.NewPanel([]string{"form", "FormStep1", "userdoc", "PanelissueDate"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdoc", "PanelissueDate", "issueDate"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Дата выдачи"),
					field.WithStrategy("issuedate"),
				),
			),
			panel.NewPanel([]string{"form", "FormStep1", "userdoc", "Panelissuer"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "userdoc", "Panelissuer", "issuer"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Кем выдан"),
					field.WithStrategy("issueorg"),
				),
			),
		),
		panel.NewPanel([]string{"form", "FormStep1", "Panel634"}, "Panel",
			panel.WithTitle("Контактная информация"),
			panel.WithIsGrid(true),
		),
		panel.NewPanel([]string{"form", "FormStep1", "Contactinfo"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel([]string{"form", "FormStep1", "Contactinfo", "Panelphone"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-half"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "Contactinfo", "Panelphone", "MobilePhone"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "mobile_19565",
						Message:  "Введите телефонный номер в формате:+7(XXX)XXXXXXX",
					}, {
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithMaxlength(14),
					field.WithLabel("Номер контактного телефона"),
					field.WithStrategy("person_mobile"),
					field.WithMaskValue("+7(000)0000000"),
					field.WithSaveWithMask(true),
				),
			),
			panel.NewPanel([]string{"form", "FormStep1", "Contactinfo", "Panelemail"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-half"),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "Contactinfo", "Panelemail", "Email"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "E-mail",
						Message:  "Введите корректный e-mail. Например, test@test.ru",
					}, {
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithMaxlength(250),
					field.WithLabel("Адрес электронной почты"),
					field.WithStrategy("person_email"),
				),
			),
			panel.NewPanel([]string{"form", "FormStep1", "Contactinfo", "PanelAddress"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStep1", "Contactinfo", "PanelAddress", "RegAddressFL"}, "Fias",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithLabel("Сведения об адресе регистрации по месту жительства"),
					field.WithStrategy("address_reg_fias"),
				),
				field.NewField([]string{"form", "FormStep1", "Contactinfo", "PanelAddress", "adr_check"}, "FieldCheckbox",
					field.WithLabel("Адрес регистрации не совпадает с адресом фактического места жительства"),
					field.WithTextValue(""),
				),
				field.NewField([]string{"form", "FormStep1", "Contactinfo", "PanelAddress", "FactAddressFL"}, "Fias",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithLabel("Сведения об адресе фактического места жительства"),
					field.WithStrategy("address_reg_fias"),
				),
			),
		),
	)

	step3 := step.NewStep([]string{"form", "FormStepUL"}, "FormStep",
		step.WithTitle("Сведения о заявителе - юридическом лице"),
		step.WithLabel("1"),
		step.WithEvents(kf.Events()),
		step.WithRules([]string{
			"Panel_cont_info.Panel290.FactAddressUL@visible=Panel_cont_info.Panel290.Checkbox_adr_UL@checked",
		}),
	).AddItem(
		panel.NewPanel(
			[]string{"form", "FormStepUL", "PanelLegal"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "PanelorgName"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "PanelorgName", "FullName"}, "FieldTextArea",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Полное наименование организации"),
					field.WithStrategy("organizationbrief_orgfullname"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "PanelFullname"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "PanelFullname", "orgName"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Краткое наименование"),
					field.WithStrategy("organizationbrief_orgfullname"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "Panelfirm_opf"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "Panelfirm_opf", "firm_opf"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithMaxlength(250),
					field.WithLabel("Организационно-правовая форма"),
					field.WithStrategy("organizationBrief_orgShortName"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "PanelINN"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "PanelINN", "INN"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithReadonly(true),
					field.WithMaxlength(250),
					field.WithLabel("ИНН"),
					field.WithStrategy("organizationbrief_inn"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "PanelOGRN"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "PanelOGRN", "OGRN"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithReadonly(true),
					field.WithMaxlength(250),
					field.WithLabel("ОГРН"),
					field.WithStrategy("organizationbrief_ogrn"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "PanelLegal", "Panelkpp"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "PanelLegal", "Panelkpp", "kpp"}, "FieldText",
					field.WithDisabled(true),
					field.WithReadonly(true),
					field.WithLabel("КПП"),
					field.WithStrategy("organizationbrief_ogrn"),
				),
			),
		),
		panel.NewPanel(
			[]string{"form", "FormStepUL", "Panel_cont_info"}, "Panel",
			panel.WithTitle(""),
			panel.WithIsGrid(true),
		).AddItem(
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "Panel76"}, "Panel",
				panel.WithTitle("Контактное лицо"),
				panel.WithIsGridItem(true),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "PanelLastNameUL"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "PanelLastNameUL", "LastNameUL"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Фамилия"),
					field.WithStrategy("lastname"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "PanelFirstNameUL"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "PanelFirstNameUL", "FirstNameUL"}, "FieldText",
					field.WithRequired(true),
					field.WithDisabled(true),
					field.WithLabel("Имя"),
					field.WithStrategy("firstname"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "PanelMiddleNameUL"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "PanelMiddleNameUL", "MiddleNameUL"}, "FieldText",
					field.WithDisabled(true),
					field.WithLabel("Отчество"),
					field.WithStrategy("middlename"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "Panelposition"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-third"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "Panelposition", "position"}, "FieldText",
					field.WithRequired(true),
					field.WithLabel("Должность"),
					field.WithMaxlength(100),
					field.WithStrategy("organizationbrief_orgposition"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "Panel129"}, "Panel",
				panel.WithTitle("Контактная информация"),
				panel.WithIsGridItem(true),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "PanelMobilePhoneUL"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-half"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "PanelMobilePhoneUL", "MobilePhoneUL"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "mobile_19565",
						Message:  "Введите телефонный номер в формате:+7(XXX)XXXXXXX",
					}, {
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithMaxlength(14),
					field.WithLabel("Телефон"),
					field.WithStrategy("org_phone"),
					field.WithMaskValue("+7(000)0000000"),
					field.WithSaveWithMask(true),
				),
			),
			panel.NewPanel([]string{"form", "FormStepUL", "Panel_cont_info", "PanelEmailUL"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
				panel.WithGridWidth("one-half"),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "PanelEmailUL", "EmailUL"}, "FieldText",
					field.WithValidators([]kf.Validator{{
						Mnemonic: "E-mail",
						Message:  "Введите корректный e-mail. Например, test@test.ru",
					}, {
						Mnemonic: "required",
					}}),
					field.WithRequired(true),
					field.WithMaxlength(250),
					field.WithLabel("Адрес электронной почты"),
					field.WithStrategy("org_email"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "Panel196"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "Panel196", "PostalAddressUL"}, "Fias",
					field.WithRequired(true),
					field.WithLabel("Юридический адрес"),
					field.WithStrategy("address_legal_fias"),
				),
			),
			panel.NewPanel(
				[]string{"form", "FormStepUL", "Panel_cont_info", "Panel290"}, "Panel",
				panel.WithTitle(""),
				panel.WithIsGridItem(true),
			).AddItem(
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "Panel290", "Checkbox_adr_UL"}, "FieldCheckbox",
					field.WithTextValue(""),
					field.WithLabel("Юридический адрес не совпадает с фактическим адресом"),
				),
				field.NewField([]string{"form", "FormStepUL", "Panel_cont_info", "Panel290", "FactAddressUL"}, "Fias",
					field.WithRequired(true),
					field.WithLabel("Фактический адрес"),
				),
			),
		),
	)

	step4 := step.NewStep([]string{"form", "FormStep2"}, "FormStep",
		step.WithTitle("Данные по услуге"),
		step.WithLabel("2"),
		step.WithEvents(kf.Events()),
	)

	step5 := step.NewStep([]string{"form", "FormStep3"}, "FormStep",
		step.WithTitle("Документы, необходимые для предоставления услуги"),
		step.WithLabel("3"),
		step.WithEvents(kf.Events()),
	)

	step6 := step.NewStep([]string{"form", "NavPanel"}, "NavPanel",
		step.WithVisible(false),
		step.WithHandlers([]kf.Handler{{
			"listen": []map[string]interface{}{{
				"component": component,
				"events":    []string{"click"},
			}},
			"handler": "function navPanelDefaultHandler(evt) {\n        if (api.validate()) {\n\n            var finSubmit = {\n                // Сохранение черновика - вызов saveDraft с первого шага.\n                init: function (evt) {\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraft, undefined, true);\n                },\n                callBackDraft: {\n                    done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                            finSubmit.submitFinal(evt);\n                        } else {\n                            finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError();\n                    },\n                    always: function (e) {\n                    }\n                },\n                submitFinal: function (evt) {\n                    // Отправка финального запроса. По умолчанию берется нулевой сабмит.\n                    var systemData = api.env('systemData');\n                    if (systemData && systemData.signCnt && (+systemData.signCnt > 1) && systemData.isOwner && systemData.isOwner !== 'true') {\n                        api.signConfirm().done(function () {\n                            var rUrl = api.env('rURL');\n                            if (rUrl) {\n                                api.link(rUrl + '/details?elementId=' + api.env('orderId') + '#_results');\n                            }\n                            else {\n                                api.link(api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId'));\n                            }\n                        })\n                    } else {\n                        FormPlayer.generateServerPdf().done(function () {\n                            api.submit('submit', 0, finSubmit.callBackFinalSubmit);\n                        });\n                    }\n                },\n                callBackFinalSubmit: {\n                    done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                            var finalLink;\n                            var notifySMU = api.env('notifySMU');\n                            // добавлена проверка на callback для СМУ\n                            if (notifySMU) {\n                                notifySMU({\n                                    \"eventType\": \"submitForm\",\n                                    \"eventParams\": [\n                                        {\"key\": \"orderId\", \"value\": api.env('orderId')},\n                                        {\"key\": \"formMnemonic\", \"value\": api.env('formMnemonic')},\n                                        {\"key\": \"targetId\", \"value\": api.env('targetId')}\n                                    ]\n                                })\n                            } else {\n                                // Переход в ЛК белый/синий\n\n                                if (api.env('rURL')) {\n                                    finalLink = api.env('rURL') + '/details?elementId=' + api.env('orderId') + '#_results';\n                                } else {\n                                    finalLink = api.env('lkUrl') + 'notifications/details/ORDER/' + api.env('orderId');\n                                }\n                                api.link(finalLink);\n                            }\n\n                        } else {\n                            finSubmit.submitError({code: \"submitError\"});\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n                    },\n                    always: function (e) {\n                    }\n                },\n                callBackDraftESEP: {\n                    done: function (data) {\n                        if (data && data.error && data.error.code == '0') {\n                            api.shade(false);\n                            FormPlayer.generateHtml();\n                        } else {\n                            finSubmit.submitError();\n                        }\n                    },\n                    error: function (e) {\n                        finSubmit.submitError(e);\n                    },\n                    always: function (e) {\n                    }\n                },\n                submitError: function (data) {\n                    data = data || {};\n                    if (typeof data.code === 'undefined' || (data.code && (data.code < 1400 || data.code > 1403))) {\n                        data.code = 'submitError';\n                        data.hideForm = true;\n                    } else {\n                        data.esepError = true;\n                    }\n                    FormPlayer.handleError(data);\n                    // Обработка ошибки при выполнении сабмита\n                    api.shade(false);\n                }\n            };\n\n            var findResult = /result=(0)/;\n\n            if (findResult.test(window.location.href) && !api.env('editFormAfterEsep')) {\n                // Если вернулись из ЕСЭП, результат корректный, финальная отправка заявки\n                finSubmit.submitFinal(evt);\n            } else {\n                // первичная отправка. Если с подписанием - то в ЕСЭП, если без - то финальный запрос.\n                if (FormPlayer.env.supportSignature) {\n                    // сохранение черновика с последующим переходом в ЕСЭП\n                    api.stepList()[0].submit('submit', 0, finSubmit.callBackDraftESEP, false);\n                } else {\n                    // обычная отправка без подписания\n                    api.shade(true);\n                    finSubmit.init(evt);\n                }\n            }\n\n        }\n    }",
		}}),
	).AddItem(
		panel.NewPanel(
			[]string{"form", "NavPanel", "__prevStep"}, "FormButton",
			panel.WithLabel("Назад"),
			panel.WithAction("prev"),
			panel.WithFloating("PGU-BtnFloat"),
			panel.WithHandlers([]kf.Handler{{
				"listen": []map[string]interface{}{{
					"component": fmt.Sprintf("%s.__prevStep", component),
					"events":    []string{"click"},
				}},
				"handler": "function (evt) {\n        //Сбор всех видимых шагов\n        var steps = api.stepList();\n        //Возврат текущего шага заменить на step()\n        var cs = api.step();\n        var ns = cs - 1;\n        //Текущгий шаг\n        var crSt = steps[cs];\n        //Шаг на который надо перейти\n        var toGoTo = steps[ns];\n        //Если мы находимся на реальных шагах\n        var onSteps = (ns >= 0);\n\n        if (onSteps) {\n            //Обчыный шаг\n            api.step(ns);\n        } else {\n            //Переход на карточку услуги\n            api.link(api.env('returnUrl') + '/service/' + api.env('targetId') + '_' + api.env('formMnemonic') + '.html#_description');\n        }\n    }",
			}}),
		),
		panel.NewPanel(
			[]string{"form", "NavPanel", "FormButtonShowInfo"}, "FormButton",
			panel.WithLabel("Описание услуги"),
			panel.WithAction("view-info"),
			panel.WithFloating("PGU-BtnFloat"),
			panel.WithHandlers([]kf.Handler{{
				"listen": []map[string]interface{}{{
					"component": fmt.Sprintf("%s.FormButtonShowInfo", component),
					"events":    []string{"click"},
				}},
				"handler": "function (evt) {\n        FormPlayer.makeBusy(true);\n        FormPlayer.showServiceInfo();\n    }",
			}}),
		),
		panel.NewPanel(
			[]string{"form", "NavPanel", "__nextStep"}, "FormButton",
			panel.WithLabel("Далее"),
			panel.WithAction("next"),
			panel.WithFloating("right"),
			panel.WithBalign("PGU-BtnFloat"),
			panel.WithHandlers([]kf.Handler{{
				"listen": []map[string]interface{}{{
					"component": fmt.Sprintf("%s.__nextStep", component),
					"events":    []string{"click"},
				}},
				"handler": "function (evt) {\n        //Сбор всех видимых шагов\n        var steps = api.stepList();\n        //Длина шагов\n        var stepsLen = steps.length;\n        var cs = api.step();\n        var ns = cs + 1;\n        //Текущий шаг\n        var crSt = steps[cs];\n        var finalLink = api.env('url') + '/orders/details?elementId=' + api.env('orderId') + '#_results';\n        //Если мы находимся на реальных шагах\n        var onSteps = (ns <= stepsLen);\n        if (onSteps) {\n            crSt.submit('submit');\n            //Response binding\n            var prevVis = (crSt.name() === 'preview');\n            var prevNeeded = (api.hidePreview() === \"false\");\n            if (ns < stepsLen) {\n                api.step(ns);\n            } else if ((ns === stepsLen) && ((prevNeeded && prevVis) || !prevNeeded)) {\n                //Финальный шаг\n                api.shade(true);\n                FormPlayer.generateServerPdf().done(function () {\n                    api.submit('submit');\n                    api.submit('final');\n                    api.link(finalLink);\n                })\n            }\n        }\n    }",
			}}),
		),
	)

	form1.AddItem(
		step1,
		step2,
		step3,
		step4,
		step5,
		step6,
	)

	fieldsMap := map[string]string{
		"TEXT_AREA":   "FieldTextArea",
		"TEXT_FIELD":  "FieldText",
		"RADIO_GROUP": "FieldRadio",
		"CHECKBOX":    "FieldCheckbox",
		"DATE_PICKER": "FieldTextDate",
		"TEXT_LABEL":  "Label",
		"ADDRESS":     "Fias",
		// "COMBO": "",
	}

	logrus.WithFields(logrus.Fields{
		"ServiceIDSrgu": record.ServiceIDSrgu,
		"FullName":      record.FullName,
	}).Info("Услуга")

	skip := map[string]bool{
		"Данные заявителя": true,
		"Контакт зая":      true,
		"Свед зая":         true,
		"Свед ФЛ":          true,
		"Свед ИП":          true,
		"Свед ЮЛ":          true,
		"Свед о представлении интересов": true,
		"Информ о доверенном лице":       true,
		"ELLINE": true,
	}

	stepSvcPath := step4.GetPath()

	for z, fg := range record.FieldGroups {
		if len(fg.Name) == 0 {
			continue
		}

		if skip[fg.Name] {
			continue
		}

		panelPath := append(stepSvcPath, fmt.Sprintf("Panel%d", z))

		p := panel.NewPanel(panelPath, "Panel",
			panel.WithTitle(fg.Name),
			panel.WithIsGrid(true))

		for x, f := range fg.Fields {

			fieldType, ok := fieldsMap[f.Type]
			if ok == false {
				/*
					logrus.WithFields(logrus.Fields{
						"FieldID":       f.FieldID,
						"Type":          f.Type,
						"ServiceIDSrgu": record.ServiceIDSrgu,
						"FieldGroup":    fg.Name,
					}).Error("unknown field type")
				*/
				continue
			}

			p0 := append(panelPath, fmt.Sprintf("Panel%d%d", z, x))
			p1 := append(p0, f.FieldID)

			fieldItem := field.NewField(p1, fieldType,
				field.WithLabel(f.DisplayName),
				field.WithRequired(f.IsRequired),
				field.WithDisabled(f.IsDisabled))

			panelItem := panel.NewPanel(p0, "Panel",
				panel.WithVisible(!fg.IsHidden),
			).AddItem(fieldItem)

			p.AddItem(panelItem)
		}
		step4.AddItem(p)
	}

	for x, f := range record.CustomFields {

		fieldType, ok := fieldsMap[f.Type]
		if ok == false {
			/*
				logrus.WithFields(logrus.Fields{
					"FieldID":       f.FieldID,
					"Type":          f.Type,
					"ServiceIDSrgu": record.ServiceIDSrgu,
					"FieldGroup":    "CustomFields",
				}).Error("unknown field type")
			*/
			continue
		}

		p0 := append(stepSvcPath, fmt.Sprintf("Panel%d", x))
		p1 := append(p0, f.FieldID)

		fieldItem := field.NewField(p1, fieldType,
			field.WithLabel(f.DisplayName),
			field.WithRequired(f.IsRequired))

		panelItem := panel.NewPanel(p0, "Panel").AddItem(fieldItem)

		step4.AddItem(panelItem)
	}

	stepDocsPath := form1.GetItem(4).GetPath()

	for x, d := range record.ServiceDocs {
		switch d.Requirement {
		case "INCOMING":

			p0 := append(stepDocsPath, fmt.Sprintf("Panel%d", x))
			p1 := append(p0, fmt.Sprintf("Doc%d", x))

			d.Name = util.ToCP1251(d.Name)
			d.Name = util.FromCP1251(d.Name)

			fieldItem := field.NewField(p1, "FieldUpload",
				field.WithLabel(d.Name),
				field.WithHint(d.Description),
				field.WithMimeType(""),
				field.WithFileType(".jpg, .jpeg, .pdf, .rar"),
			)
			panelItem := panel.NewPanel(p0, "Panel").AddItem(fieldItem)

			step5.AddItem(panelItem)
		}
	}

	return form1.String()
}
