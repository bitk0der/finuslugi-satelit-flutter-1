const String translationsJson = '''
[
    {
        "value": "mastercard",
        "label": "MasterCard"
    },
    {
        "value": "visa",
        "label": "VISA"
    },
    {
        "value": "mir",
        "label": "МИР"
    },
    {
        "value": "chinaUnionPay",
        "label": "China UnionPay"
    },
    {
        "value": "mirUnionPay",
        "label": "МИР + UnionPay"
    },
    {
        "value": "mirJCB",
        "label": "МИР + JCB"
    },
    {
        "value": "payJCB",
        "label": "JCB"
    },
    {
        "value": "freeNotifications",
        "label": "Бесплатные уведомления"
    },
    {
        "value": "freeService",
        "label": "Бесплатное обслуживание"
    },
    {
        "value": "graceCash",
        "label": "Льготный период на снятие"
    },
    {
        "value": "noCertificates",
        "label": "Без справок о доходах"
    },
    {
        "value": "forTravelling",
        "label": "Для путешествий"
    },
    {
        "value": "freeCash",
        "label": "Наличные бесплатно"
    },
    {
        "value": "selfEmployed",
        "label": "Для самозанятых"
    },
    {
        "value": "gasolineBonuses",
        "label": "Бонусы на АЗС"
    },
    {
        "value": "supermarketBonuses",
        "label": "Бонусы в супермаркетах"
    },
    {
        "value": "taxiBonuses",
        "label": "Бонусы на такси"
    },
    {
        "value": "entertainmentBonuses",
        "label": "Бонусы за развлечения"
    },
    {
        "value": "restaurantBonuses",
        "label": "Бонусы в ресторанах"
    },
    {
        "value": "bonusAutoService",
        "label": "Бонусы за автоуслуги"
    },
    {
        "value": "drugstoreBonuses",
        "label": "Бонусы за медицинские услуги"
    },
    {
        "value": "purchaseBonuses",
        "label": "Бонусы за покупки"
    },
    {
        "value": "freeWithdrawalInAnyCashpoint",
        "label": "Наличные без комиссии в любых банкоматах"
    },
    {
        "value": "freeCash",
        "label": "Наличные бесплатно"
    },
    {
        "value": "installment",
        "label": "Рассрочка"
    },
    {
        "value": "ATMOwn",
        "label": "в банкомате своего банка"
    },
    {
        "value": "ATMOther",
        "label": "в банкомате стороннего банка"
    },
    {
        "value": "ATMPartner",
        "label": "в банкомате банка-партнера"
    },
    {
        "value": "officeOwn",
        "label": "в офисах своего банка"
    },
    {
        "value": "officeOther",
        "label": "в офисах стороннего банка"
    },
    {
        "value": "officePartner",
        "label": "в офисах банка-партнера"
    },
    {
        "value": "electron",
        "label": "Электронная"
    },
    {
        "value": "classic",
        "label": "Классическая"
    },
    {
        "value": "gold",
        "label": "Золотая"
    },
    {
        "value": "premium",
        "label": "Премиальная"
    },
    {
        "value": "virtual",
        "label": "Виртуальная"
    },
    {
        "value": "smartphone",
        "label": "Оплата смартфоном"
    },
    {
        "value": "cobranding",
        "label": "Кобрендинг"
    },
    {
        "value": "contactlessPayment",
        "label": "Бесконтактная оплата"
    },
    {
        "value": "courier",
        "label": "Доставка курьером"
    },
    {
        "value": "businessLounge",
        "label": "Доступ в бизнес-залы"
    },
    {
        "value": "conciergeService",
        "label": "Консьерж-сервис"
    },
    {
        "value": "freeTcdInsurance",
        "label": "Бесплатный полис ВЗР"
    },
    {
        "value": "mirAccept",
        "label": "MirAccept"
    },
    {
        "value": "3dSecure",
        "label": "3D Secure"
    },
    {
        "value": "social",
        "label": "Социальная"
    },
    {
        "value": "rf-citizenship",
        "label": "Гражданство РФ"
    },
    {
        "value": "rf-resident",
        "label": "Для иностранных граждан"
    },
    {
        "value": "fixed-income",
        "label": "Постоянный доход"
    },
    {
        "value": "permanent-registration",
        "label": "Постоянная регистрация"
    },
    {
        "value": "temporary-registration",
        "label": "Временная регистрация"
    },
    {
        "value": "city-phone",
        "label": "Городской телефон"
    },
    {
        "value": "mobile-phone",
        "label": "Мобильный телефон"
    },
    {
        "value": "work-phone",
        "label": "Рабочий телефон"
    },
    {
        "value": "positive-credit-history",
        "label": "Отсутствие негативной кредитной истории"
    },
    {
        "value": "job-in-banks-area",
        "label": "Работа в регионе присутствия банка"
    },
    {
        "value": "0",
        "label": "Паспорт"
    },
    {
        "value": "2",
        "label": "Заверенная копия трудовой книжки или трудовой договор"
    },
    {
        "value": "3",
        "label": "СНИЛС"
    },
    {
        "value": "4",
        "label": "ИНН"
    },
    {
        "value": "10",
        "label": "Заграничный паспорт"
    },
    {
        "value": "11",
        "label": "Водительское удостоверение"
    },
    {
        "value": "5",
        "label": "Пенсионное удостоверение"
    },
    {
        "value": "6",
        "label": "Удостоверение военнослужащего"
    },
    {
        "value": "7",
        "label": "Военный билет"
    },
    {
        "value": "20",
        "label": "Свидетельство участника НИС"
    },
    {
        "value": "13",
        "label": "Документы из банка по рефинансируемому кредиту"
    },
    {
        "value": "9",
        "label": "Паспорта совершеннолетних членов семьи"
    },
    {
        "value": "12",
        "label": "Диплом об образовании"
    },
    {
        "value": "14",
        "label": "Сертификат государственного образца на материнский капитал"
    },
    {
        "value": "15",
        "label": "Свидетельства о рождении/паспорта несовершеннолетних детей"
    },
    {
        "value": "16",
        "label": "Свидетельства о браке (разводе, смерти супруга) или брачный контракт"
    },
    {
        "value": "27",
        "label": "Копия свидетельства о временной регистрации"
    },
    {
        "value": "29",
        "label": "Справка из наркологического диспансера"
    },
    {
        "value": "28",
        "label": "Справка из психоневрологического диспансера"
    },
    {
        "value": "17",
        "label": "Свидетельство о государственной регистрации ИП"
    },
    {
        "value": "19",
        "label": "Выписка по расчетному счету"
    },
    {
        "value": "25",
        "label": "Лицензия на право осуществлять деятельность"
    },
    {
        "value": "26",
        "label": "Бухгалтерский баланс и отчет о прибылях и убытках"
    },
    {
        "value": "24",
        "label": "ИНН организации"
    },
    {
        "value": "32",
        "label": "Копии основных форм бухгалтерской отчетности с отметками налоговой инспекции"
    },
    {
        "value": "33",
        "label": "Копии учредительных документов юридического лица"
    },
    {
        "value": "34",
        "label": "Выписка из ЕГРИП"
    },
    {
        "value": "21",
        "label": "Водительское удостоверение/Заграничный паспорт (на выбор)"
    },
    {
        "value": "22",
        "label": "Водительское удостоверение/Заграничный паспорт/СНИЛС (на выбор)"
    },
    {
        "value": "23",
        "label": "Водительское удостоверение/Заграничный паспорт/СНИЛС/ИНН (на выбор)"
    },
    {
        "value": "30",
        "label": "Документ, подтверждающий доход/водительское удостоверение/заграничный паспорт/СНИЛС/ИНН (на выбор)"
    },
    {
        "value": "31",
        "label": "Документ, подтверждающий доход/ дополнительный документ, подтверждающий личность кроме паспорта (на выбор)"
    },
    {
        "value": "other",
        "label": "Любые покупки"
    },
    {
        "value": "flights",
        "label": "Авиабилеты"
    },
    {
        "value": "train",
        "label": "Ж/д билеты"
    },
    {
        "value": "hotels",
        "label": "Бронирование отелей"
    },
    {
        "value": "gas",
        "label": "АЗС"
    },
    {
        "value": "entertainment",
        "label": "Развлечения"
    },
    {
        "value": "restaurants",
        "label": "Кафе, бары, рестораны"
    },
    {
        "value": "autoRent",
        "label": "Аренда автомобилей"
    },
    {
        "value": "travel",
        "label": "Путешествия"
    },
    {
        "value": "tours",
        "label": "Турпутевки"
    },
    {
        "value": "autoServices",
        "label": "Автоуслуги"
    },
    {
        "value": "transport",
        "label": "Транспорт"
    },
    {
        "value": "supermarket",
        "label": "Супермаркеты"
    },
    {
        "value": "medicine",
        "label": "Здоровье и красота"
    },
    {
        "value": "pharmacy",
        "label": "Аптеки"
    },
    {
        "value": "repair",
        "label": "Дом и ремонт"
    },
    {
        "value": "electronics",
        "label": "Электроника и бытовая техника"
    },
    {
        "value": "sport",
        "label": "Спорттовары, одежда и обувь"
    },
    {
        "value": "education",
        "label": "Обучение"
    },
    {
        "value": "partners",
        "label": "Покупки у партнеров"
    },
    {
        "value": "cashcertificates",
        "label": "Денежная компенсация"
    },
    {
        "value": "partnercertificates",
        "label": "Сертификаты партнеров"
    },
    {
        "value": "another",
        "label": "Прочие"
    },
    {
        "value": "all",
        "label": "На любые цели"
    },
    {
        "value": "refinancing",
        "label": "Рефинансирование"
    },
    {
        "value": "education",
        "label": "Обучение"
    },
    {
        "value": "renovation",
        "label": "Благоустройство жилья"
    },
    {
        "value": "farm-development",
        "label": "Развитие личного подсобного хозяйства"
    },
    {
        "value": "P3M",
        "label": "3 месяца"
    },
    {
        "value": "P6M",
        "label": "6 месяцев"
    },
    {
        "value": "P9M",
        "label": "9 месяцев"
    },
    {
        "value": "P1Y",
        "label": "1 год"
    },
    {
        "value": "P15M",
        "label": "15 месяцев"
    },
    {
        "value": "P18M",
        "label": "18 месяцев"
    },
    {
        "value": "P2Y",
        "label": "2 года"
    },
    {
        "value": "P3Y",
        "label": "3 года"
    },
    {
        "value": "P4Y",
        "label": "4 года"
    },
    {
        "value": "P5Y",
        "label": "5 лет"
    },
    {
        "value": "P6Y",
        "label": "6 лет"
    },
    {
        "value": "P7Y",
        "label": "7 лет"
    },
    {
        "value": "P8Y",
        "label": "8 лет"
    },
    {
        "value": "P9Y",
        "label": "9 лет"
    },
    {
        "value": "P10Y",
        "label": "10 лет"
    },
    {
        "value": "P15Y",
        "label": "15 лет"
    },
    {
        "value": "P20Y",
        "label": "20 лет"
    },
    {
        "value": "default",
        "label": "Стандартные"
    },
    {
        "value": "budget",
        "label": "Бюджетники"
    },
    {
        "value": "military",
        "label": "Военнослужащие"
    },
    {
        "value": "business",
        "label": "Предприниматели"
    },
    {
        "value": "salary",
        "label": "Зарплатные клиенты"
    },
    {
        "value": "bank-customers",
        "label": "Клиенты банка"
    },
    {
        "value": "pensioner",
        "label": "Пенсионеры"
    },
    {
        "value": "special",
        "label": "Особый"
    },
    {
        "value": "self-employed",
        "label": "Самозанятый"
    },
    {
        "value": "cash",
        "label": "Наличными"
    },
    {
        "value": "card",
        "label": "На карту"
    },
    {
        "value": "account",
        "label": "На счет"
    },
    {
        "value": "without-bail",
        "label": "Без залога"
    },
    {
        "value": "existing-property",
        "label": "Залог имеющейся недвижимости"
    },
    {
        "value": "existing-estate",
        "label": "Залог имеющегося имущества"
    },
    {
        "value": "acquired-estate",
        "label": "Залог приобретаемого имущества"
    },
    {
        "value": "auto",
        "label": "Залог имеющегося TC"
    },
    {
        "value": "zalogveksel",
        "label": "Залог ценных бумаг"
    },
    {
        "value": "garantofdepozit",
        "label": "Гарантийный депозит"
    },
    {
        "value": "P14D",
        "label": "Раз в две недели"
    },
    {
        "value": "P1M",
        "label": "Ежемесячно"
    },
    {
        "value": "P7D",
        "label": "Еженедельно"
    },
    {
        "value": "END",
        "label": "В конце срока"
    },
    {
        "value": "annuityPayments",
        "label": "Аннуитетные платежи"
    },
    {
        "value": "differentiatedPayments",
        "label": "Дифференцированные платежи"
    },
    {
        "value": "needGuarantor",
        "label": "С поручителем"
    },
    {
        "value": "noGuarantor",
        "label": "Без поручителей"
    },
    {
        "value": "promo",
        "label": "Промо условия"
    },
    {
        "value": "typical",
        "label": "Обычный вклад"
    },
    {
        "value": "online",
        "label": "С онлайн открытием"
    },
    {
        "value": "pension",
        "label": "Пенсионный"
    },
    {
        "value": "client",
        "label": "Для клиентов банка"
    },
    {
        "value": "salary",
        "label": "Для зарплатных клиентов"
    },
    {
        "value": "child",
        "label": "Детский"
    },
    {
        "value": "mortgage",
        "label": "Ипотечный"
    },
    {
        "value": "charity",
        "label": "Благотворительный"
    },
    {
        "value": "another",
        "label": "Другой"
    },
     {
        "value": "deposit",
        "label": "Вклад"
    },
    {
        "value": "accumulativedeposit",
        "label": "Накопительный счет"
    },
        {
        "value": "refinancing",
        "label": "Рефинансирование"
    },
    {
        "value": "newFlat",
        "label": "Квартира в новостройке"
    },
    {
        "value": "secondaryFlat",
        "label": "Квартира на вторичном рынке"
    },
    {
        "value": "countryHouse",
        "label": "Загородный дом/участок"
    },
    {
        "value": "constructionHouse",
        "label": "Строительство дома"
    },
    {
        "value": "newApartment",
        "label": "Апартаменты в новостройке"
    },
    {
        "value": "secondaryApartment",
        "label": "Апартаменты на вторичном рынке"
    },
    {
        "value": "partFlat",
        "label": "Доля в квартире на вторичном рынке"
    },
    {
        "value": "garage",
        "label": "Машиноместо/гараж"
    },
    {
        "value": "townhouse",
        "label": "Таунхаус"
    },
    {
        "value": "room",
        "label": "Комната"
    },
    {
        "value": "commercial",
        "label": "Коммерческая недвижимость"
    },
    {
        "value": "apartmentRenovation",
        "label": "Ремонт/отделка"
    },
    {
        "value": "realty",
        "label": "Нецелевой ипотечный кредит под залог имеющейся недвижимости"
    },
     {
        "value": "maternityCapital",
        "label": "Материнский капитал"
    },
    {
        "value": "familiesChildren",
        "label": "Господдержка семей с детьми"
    },
    {
        "value": "youngFamily",
        "label": "Молодая семья"
    },
    {
        "value": "military",
        "label": "Военная ипотека"
    },
    {
        "value": "social",
        "label": "Социальная ипотека"
    },
    {
        "value": "rural",
        "label": "Сельская"
    },
    {
        "value": "forIt",
        "label": "Для IT специалистов"
    },
    {
        "value": "min",
        "label": "Минут"
    },
    {
        "value": "hour",
        "label": "Часов"
    },
    {
        "value": "day",
        "label": "Дней"
    },
    {
        "value": "months",
        "label": "Месяцев"
    }
]
''';
