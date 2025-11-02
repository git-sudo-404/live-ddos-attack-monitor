-- WARNING: Do NOT execute this file in PRODUCTION Environment as it may lead to data loss or corruption.
--This file is meant to be executed only in the DEVELOPMENT Environment for creating and ingesting sample data for testing purposes.

CREATE EXTENSION IF NOT EXISTS postgis;

--NOTE: Create a seperate table for country info and Foreign key reference the ddods_attack_logs rows here .


CREATE SEQUENCE IF NOT EXISTS country_seq START 1;

CREATE TABLE IF NOT EXISTS country (
        id int NOT NULL DEFAULT NEXTVAL ('country_seq'),
        iso char(2) NOT NULL,
        name varchar(80) NOT NULL,
        nicename varchar(80) NOT NULL,
        iso3 char(3) DEFAULT NULL,
        numcode smallint DEFAULT NULL,
        phonecode int NOT NULL,
        PRIMARY KEY (id)
)  ;
--
-- Dumping data for table `country`
--
INSERT INTO country (id, iso, name, nicename, iso3, numcode, phonecode) VALUES
        (0,'NO','NO COUNTRY','NO COUNTRY','NOC',0,0), -- Default used when no country info available 
        (1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
        (2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
        (3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
        (4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
        (5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
        (6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
        (7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
        (8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', 10, 0),
        (9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
        (10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
        (11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
        (12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
        (13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
        (14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
        (15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
        (16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
        (17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
        (18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
        (19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
        (20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
        (21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
        (22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
        (23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
        (24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
        (25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
        (26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
        (27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
        (28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
        (29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 'BVT', 74, 0),
        (30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
        (31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', 86, 246),
        (32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
        (33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
        (34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
        (35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
        (36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
        (37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
        (38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
        (39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
        (40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
        (41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
        (42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
        (43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
        (44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
        (45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', 162, 61),
        (46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
        (47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
        (48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
        (49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
        (50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243),
        (51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
        (52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
        (53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
        (54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
        (55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
        (56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
        (57, 'CZ', 'CZECHIA', 'Czech Republic', 'CZE', 203, 420),
        (58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
        (59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
        (60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
        (61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1),
        (62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
        (63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
        (64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
        (65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
        (66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
        (67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
        (68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
        (69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
        (70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
        (71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
        (72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
        (73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
        (74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
        (75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
        (76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'ATF', 260, 0),
        (77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
        (78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
        (79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
        (80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
        (81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
        (82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
        (83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
        (84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
        (85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
        (86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
        (87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
        (88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
        (89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
        (90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
        (91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
        (92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
        (93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'HMD', 334, 0),
        (94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
        (95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
        (96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
        (97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
        (98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
        (99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
        (100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
        (101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
        (102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
        (103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
        (104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
        (105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
        (106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
        (107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
        (108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
        (109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
        (110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
        (111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
        (112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
        (113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
        (114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
        (115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
        (116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
        (117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
        (118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
        (119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
        (120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
        (121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
        (122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
        (123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
        (124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
        (125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
        (126, 'MK', 'NORTH MACEDONIA', 'North Macedonia', 'MKD', 807, 389),
        (127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
        (128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
        (129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
        (130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
        (131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
        (132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
        (133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
        (134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
        (135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
        (136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
        (137, 'YT', 'MAYOTTE', 'Mayotte', 'MYT', 175, 269),
        (138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
        (139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
        (140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
        (141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
        (142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
        (143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
        (144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
        (145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
        (146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
        (147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
        (148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
        (149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
        (150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
        (151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
        (152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
        (153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
        (154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
        (155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
        (156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
        (157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
        (158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
        (159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
        (160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
        (161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
        (162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
        (163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
        (164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
        (165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
        (166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
        (167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
        (168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
        (169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
        (170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
        (171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
        (172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
        (173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
        (174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
        (175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
        (176, 'RO', 'ROMANIA', 'Romania', 'ROU', 642, 40),
        (177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
        (178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
        (179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
        (180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
        (181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
        (182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
        (183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
        (184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
        (185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
        (186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
        (187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
        (188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
        (189, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
        (190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
        (191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
        (192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
        (193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
        (194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
        (195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
        (196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
        (197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
        (198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 0),
        (199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
        (200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
        (201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
        (202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
        (203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
        (204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
        (205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
        (206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
        (207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
        (208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
        (209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
        (210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
        (211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
        (212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 'TLS', 626, 670),
        (213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
        (214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
        (215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
        (216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
        (217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
        (218, 'TR', 'TÜRKIYE', 'Türkiye, The Republic of', 'TUR', 792, 90),
        (219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 993),
        (220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
        (221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
        (222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
        (223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
        (224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
        (225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
        (226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
        (227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'UMI', 581, 1),
        (228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
        (229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
        (230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
        (231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
        (232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
        (233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
        (234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
        (235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
        (236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
        (237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
        (238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
        (239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
        (240, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
        (241, 'XK', 'KOSOVO', 'Kosovo', 'XKX', 0, 383),
        (242, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', '248', '358'),
        (243, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', '535', '599'),
        (244, 'CW', 'CURACAO', 'Curacao', 'CUW', '531', '599'),
        (245, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', '831', '44'),
        (246, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', '833', '44'),
        (247, 'JE', 'JERSEY', 'Jersey', 'JEY', '832', '44'),
        (248, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', '652', '590'),
        (249, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', '663', '590'),
        (250, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', '534', '1'),
        (251, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', '728', '211');





CREATE TABLE ddos_attack_logs(

        event_id BIGSERIAL PRIMARY KEY  ,

        -- SOURCE INFO 

        source_ip CIDR, -- address/y
        has_source_ip BOOLEAN DEFAULT FALSE,
        source_mac MACADDR,
        has_source_mac BOOLEAN DEFAULT FALSE ,
        source_location GEOGRAPHY(Point,4326), -- POSTGIS point type , SRID format of geo point location
has_source_location BOOLEAN DEFAULT FALSE,
source_country_iso INT REFERENCES COUNTRY(ISO), -- ISO is used as the foreign key reference to COUNTRY(iso)
source_city VARCHAR(100), 
source_asn INT  , -- autonomous system number 
source_isp VARCHAR(100),
is_source_vpn BOOLEAN,
is_source_proxy BOOLEAN,


-- TARGET INFO 

target_ip CIDR,
has_target_ip BOOLEAN DEFAULT FALSE,
target_mac MACADDR,
has_target_mac BOOLEAN DEFAULT FALSE,
target_location geography(Point,4326),
has_target_location BOOLEAN DEFAULT FALSE,
target_country_iso INT REFERENCES COUNTRY(ISO), -- ISO is used as foreign key reference to COUNTRY(iso)
target_city VARCHAR(100),
target_asp INT ,
target_isp VARCHAR(100),
is_target_vpn BOOLEAN DEFAULT FALSE,
is_target_proxy BOOLEAN DEFAULT FALSE,


target_service VARCHAR(50), -- HTTP / DNS / SSH , etc.,
target_port INT CHECK (target_port > 0 AND target_port <= 65535), 

-- ATTACK INFO 

time_of_attack TIMESTAMPTZ,
has_time_of_attack BOOLEAN DEFAULT FALSE,
attack_type VARCHAR(50), -- SYN FLood / UDP Flood / HTTP Flood / DNS Amplification / NTP Amplification / ICMP Flood / Unknown
attack_layer VARCHAR(50), -- Application Layer / Transport Layer / Network Layer / Uknown 

severity_level VARCHAR(20) CHECK (severity_level IN ('Crititcal','High','Medium','Low')), -- Crititcal / High / Medium / Low 
confidence_score INT CHECK (confidence_score >=0 AND confidence_score<=100), -- (0 - 100)

packet_count BIGINT DEFAULT 0, -- number of packer involved in attack / 0 for Unknown
bytes_transferred BIGINT DEFAULT 0 , -- 0 for Unknown
packets_per_second BIGINT DEFAULT 0 , --  0 for unknown
bandwidth_consumed_mbps BIGINT DEFAULT 0  , -- in MBPS / 0 for unknown
duration_seconds INT DEFAULT 0, -- 0 for unknown 

previous_attack_count INT DEFAULT 0,
threat_category VARCHAR(50) , -- botnet, c2server, scanner 
malware_category VARCHAR(50) , -- viruses, trojans, worms ,ransomeware ,spyware, bots/botnet 

-- DETECTION 

detection_method VARCHAR(50) , -- Firewall / IDS / ML Model 
mitigation_action_taken VARCHAR(100), -- IP blocked, rate-limited , monitored 
is_ip_blocked BOOLEAN DEFAULT FALSE ,
detection_source VARCHAR(100) , -- abuseIPDB / cloudfare / custom 


-- TIME of Logging INFO 

created_at TIMESTAMP DEFAULT NOW() , 
updated_at TIMESTAMP  DEFAULT NOW(), 



);

-- CREATE indexes for better query performances 

-- Possible Query Types : 
--
--         i) Attacks in last x hours / days / weeks .     --> (time_of_attack)
-- 
--         ii) All attack from country x .                 --> (source_country_iso)
--         iii) All attack targeted on country x .         --> (target_country_iso)
--
--         iv) All attacks of x severity .                 --> (severity_level)
--         v) All attacks of x type .                      --> (attack_type)
--         vi) All attcks on x layer .                     --> (attack_layer)
--
--         vi) All attacks from x to y IP range .          --> (source_ip)
--         vii) All attack targeted on x to y IP range.    --> (target_ip)
--         -- Queries based on specific MAC very rare . 
--
--         vii) All attack from x distance
--                 around geospatial location .            --> (source_location)
--         viii) All attack target on 
--                 around x distanc geospatial location .  --> (target_location)

CREATE INDEX idx_time_of_attack ON ddos_attack_logs(time_of_attack DESC);
CREATE INDEX idx_source_country_iso ON ddos_attack_logs(source_country_iso);
CREATE INDEX idx_target_country_iso ON ddos_attack_logs(target_country_iso);
CREATE INDEX idx_severity_level ON ddos_attack_logs(severity_level);
CREATE INDEX idx_attack_type ON ddos_attack_logs(attack_type);
CREATE INDEX idx_attack_layer ON ddos_attack_logs(attack_layer);
CREATE INDEX idx_source_ip ON ddos_attack_logs(source_ip);
CREATE INDEX idx_target_ip ON ddos_attack_logs(target_ip);
CREATE INDEX idx_source_location ON ddos_attack_logs USING GIST(source location);
CREATE INDEX idx_target_location ON ddos_attack_logs USING GIST(target_location);




-- Sample / Seed data for development purposes  (100 rows)

INSERT INTO ddos_attack_logs (
        source_ip, has_source_ip, source_location, has_source_location,
        source_country_iso, source_city, source_asn, source_isp,
        target_ip, has_target_ip, target_location, has_target_location,
        target_country_iso, target_city, target_asn,
        target_service, target_port,
        time_of_attack, has_time_of_attack,
        attack_type, attack_layer, severity_level, confidence_score,
        packet_count, bytes_transferred, packets_per_second, bandwidth_consumed_mbps,
        detection_method, mitigation_action_taken, is_ip_blocked, detection_source
        ) VALUES

        ('203.0.113.10'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(120.1551, 30.2875), 4326)::GEOGRAPHY, TRUE, 44, 'Hangzhou', 9808, 'China Telecom', '198.51.100.1'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-74.0060, 40.7128), 4326)::GEOGRAPHY, TRUE, 226, 'New York', 15169, 'HTTP', 80, NOW() - INTERVAL '2 hours', TRUE, 'SYN Flood', 'Transport Layer', 'Critical', 95, 5000000, 2500000000, 8000, 2000, 'Firewall', 'IP blocked', TRUE, 'cloudflare'),
        ('185.10.45.50'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(37.6173, 55.7558), 4326)::GEOGRAPHY, TRUE, 177, 'Moscow', 12389, 'Rostelecom', '192.0.2.100'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-0.1278, 51.5074), 4326)::GEOGRAPHY, TRUE, 225, 'London', 2856, 'DNS', 53, NOW() - INTERVAL '1.5 hours', TRUE, 'UDP Flood', 'Network Layer', 'High', 88, 3000000, 1500000000, 5000, 1500, 'IDS', 'Rate limited', FALSE, 'abuseIPDB'),
        ('210.212.45.30'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(77.2090, 28.6139), 4326)::GEOGRAPHY, TRUE, 99, 'New Delhi', 9829, 'BSNL', '203.0.113.200'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(139.6503, 35.6762), 4326)::GEOGRAPHY, TRUE, 107, 'Tokyo', 2516, 'HTTPS', 443, NOW() - INTERVAL '45 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'High', 82, 2500000, 1200000000, 6500, 1800, 'WAF', 'IP blocked', TRUE, 'cloudflare'),
        ('187.56.78.40'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-51.9253, -14.2350), 4326)::GEOGRAPHY, TRUE, 30, 'Brasília', 27699, 'Vivo', '192.0.2.50'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(13.4050, 52.5200), 4326)::GEOGRAPHY, TRUE, 80, 'Berlin', 3320, 'DNS', 53, NOW() - INTERVAL '30 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Medium', 75, 1500000, 800000000, 4000, 1000, 'IDS', 'Rate limited', FALSE, 'custom'),
        ('203.123.45.67'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(74.3587, 31.5204), 4326)::GEOGRAPHY, TRUE, 162, 'Lahore', 17974, 'PTCL', '198.51.100.150'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(151.2093, -33.8688), 4326)::GEOGRAPHY, TRUE, 13, 'Sydney', 1221, 'ICMP', 0, NOW() - INTERVAL '20 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Medium', 70, 1200000, 600000000, 3500, 800, 'Firewall', 'Monitored', FALSE, 'abuseIPDB'),
        ('89.163.145.25'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(30.5238, 50.4501), 4326)::GEOGRAPHY, TRUE, 223, 'Kyiv', 13110, 'Kyivstar', '192.0.2.200'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-79.3957, 43.6629), 4326)::GEOGRAPHY, TRUE, 38, 'Toronto', 6939, 'HTTP', 80, NOW() - INTERVAL '15 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'High', 85, 4000000, 2000000000, 7000, 1700, 'Firewall', 'Rate limited', TRUE, 'cloudflare'),
        ('139.192.45.88'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(113.9213, -6.1256), 4326)::GEOGRAPHY, TRUE, 100, 'Jakarta', 7713, 'Telkom', '203.0.113.75'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(2.3522, 48.8566), 4326)::GEOGRAPHY, TRUE, 73, 'Paris', 3352, 'HTTPS', 443, NOW() - INTERVAL '10 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'Critical', 92, 6000000, 3000000000, 9000, 2500, 'WAF', 'IP blocked', TRUE, 'cloudflare'),
        ('115.84.178.23'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(105.8342, 21.0285), 4326)::GEOGRAPHY, TRUE, 232, 'Hanoi', 45839, 'Viettel', '192.0.2.120'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-3.7038, 40.4168), 4326)::GEOGRAPHY, TRUE, 199, 'Madrid', 3333, 'DNS', 53, NOW() - INTERVAL '25 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Medium', 72, 1800000, 900000000, 4500, 1200, 'IDS', 'Monitored', FALSE, 'abuseIPDB'),
        ('203.151.47.10'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(100.5018, 13.7563), 4326)::GEOGRAPHY, TRUE, 211, 'Bangkok', 23969, 'True Internet', '198.51.100.80'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(5.2913, 52.1326), 4326)::GEOGRAPHY, TRUE, 150, 'Amsterdam', 1136, 'DNS', 53, NOW() - INTERVAL '5 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 55, 500000, 250000000, 1500, 400, 'IDS', 'Rate limited', FALSE, 'custom'),
        ('203.79.45.120'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(101.6869, 3.1390), 4326)::GEOGRAPHY, TRUE, 129, 'Kuala Lumpur', 17909, 'Maxis', '192.0.2.99'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(103.8198, 1.3521), 4326)::GEOGRAPHY, TRUE, 192, 'Singapore', 38040, 'HTTP', 80, NOW() - INTERVAL '35 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'High', 80, 3500000, 1750000000, 6000, 1500, 'Firewall', 'IP blocked', TRUE, 'cloudflare'),
        ('196.218.73.45'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(30.0444, 31.2357), 4326)::GEOGRAPHY, TRUE, 63, 'Cairo', 8452, 'Etisalat Egypt', '203.0.113.55'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(46.6753, 24.7136), 4326)::GEOGRAPHY, TRUE, 187, 'Riyadh', 49605, 'HTTPS', 443, NOW() - INTERVAL '8 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'High', 84, 2800000, 1400000000, 5500, 1600, 'WAF', 'IP blocked', TRUE, 'abuseIPDB'),
        ('187.163.12.89'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-87.3382, 19.4326), 4326)::GEOGRAPHY, TRUE, 138, 'Cancun', 28403, 'Telcel', '198.51.100.200'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-58.3816, -34.6037), 4326)::GEOGRAPHY, TRUE, 10, 'Buenos Aires', 22652, 'ICMP', 0, NOW() - INTERVAL '18 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Low', 60, 700000, 350000000, 2000, 500, 'Firewall', 'Monitored', FALSE, 'custom'),
        ('212.156.78.34'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(28.9784, 41.0082), 4326)::GEOGRAPHY, TRUE, 218, 'Istanbul', 12400, 'Turk Telekom', '192.0.2.77'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(23.7275, 37.9838), 4326)::GEOGRAPHY, TRUE, 83, 'Athens', 6799, 'DNS', 53, NOW() - INTERVAL '12 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Medium', 68, 1400000, 700000000, 3800, 950, 'IDS', 'Rate limited', FALSE, 'abuseIPDB'),
        ('210.89.45.67'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(126.9780, 37.5665), 4326)::GEOGRAPHY, TRUE, 113, 'Seoul', 3786, 'KT Corporation', '203.0.113.111'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(121.0437, 14.5995), 4326)::GEOGRAPHY, TRUE, 169, 'Manila', 9299, 'HTTP', 80, NOW() - INTERVAL '22 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'Critical', 90, 4500000, 2250000000, 7500, 1900, 'Firewall', 'IP blocked', TRUE, 'cloudflare'),
        ('178.45.123.56'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(21.0122, 52.2297), 4326)::GEOGRAPHY, TRUE, 171, 'Warsaw', 12830, 'Play', '198.51.100.160'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(12.4964, 41.9028), 4326)::GEOGRAPHY, TRUE, 105, 'Rome', 6762, 'HTTPS', 443, NOW() - INTERVAL '7 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'High', 83, 3200000, 1600000000, 6200, 1700, 'WAF', 'IP blocked', TRUE, 'cloudflare'),
        ('197.210.78.45'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(25.7461, -28.0473), 4326)::GEOGRAPHY, TRUE, 197, 'Johannesburg', 36987, 'Vodacom', '192.0.2.88'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(36.8219, -1.2921), 4326)::GEOGRAPHY, TRUE, 110, 'Nairobi', 37154, 'DNS', 53, NOW() - INTERVAL '3 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 50, 400000, 200000000, 1200, 300, 'IDS', 'Monitored', FALSE, 'custom'),
        ('190.56.34.78'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-74.0721, 4.7110), 4326)::GEOGRAPHY, TRUE, 47, 'Bogota', 8452, 'Claro', '203.0.113.222'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-70.6693, -33.4489), 4326)::GEOGRAPHY, TRUE, 43, 'Santiago', 16626, 'ICMP', 0, NOW() - INTERVAL '28 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Medium', 65, 1100000, 550000000, 3000, 700, 'Firewall', 'Rate limited', FALSE, 'abuseIPDB'),
        ('212.81.45.90'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(18.0686, 59.3293), 4326)::GEOGRAPHY, TRUE, 205, 'Stockholm', 1257, 'Telia', '198.51.100.44'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(24.9354, 60.1695), 4326)::GEOGRAPHY, TRUE, 72, 'Helsinki', 3352, 'DNS', 53, NOW() - INTERVAL '40 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Low', 58, 900000, 450000000, 2500, 600, 'IDS', 'Monitored', FALSE, 'custom'),
        ('158.39.78.12'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(10.7522, 59.9139), 4326)::GEOGRAPHY, TRUE, 160, 'Oslo', 2116, 'Telenor', '192.0.2.66'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(12.5683, 55.6761), 4326)::GEOGRAPHY, TRUE, 58, 'Copenhagen', 16509, 'HTTPS', 443, NOW() - INTERVAL '11 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'Medium', 71, 2100000, 1050000000, 4200, 1100, 'WAF', 'Rate limited', TRUE, 'cloudflare'),
        ('203.89.34.56'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(114.1095, 22.3193), 4326)::GEOGRAPHY, TRUE, 96, 'Hong Kong', 9269, 'HKBN', '203.0.113.99'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(121.5090, 25.0443), 4326)::GEOGRAPHY, TRUE, 208, 'Taipei', 3462, 'HTTP', 80, NOW() - INTERVAL '33 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'High', 79, 3300000, 1650000000, 5500, 1400, 'Firewall', 'IP blocked', TRUE, 'abuseIPDB'),
        ('160.5.163.77'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-94.7522, -78.4304), 4326)::GEOGRAPHY, TRUE, 205, 'City C', 53489, 'ISP3', '208.149.231.106'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(101.6198, 47.3273), 4326)::GEOGRAPHY, TRUE, 3, 'Target City C', 61852, 'FTP', 21, NOW() - INTERVAL '5 days 12 hours 16 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'Medium', 94, 1244056, 1989245544, 12763, 3596, 'IDS', 'Monitored', true, 'custom'),
        ('70.202.47.196'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(154.6251, -58.6963), 4326)::GEOGRAPHY, TRUE, 211, 'City B', 42915, 'ISP1', '255.86.74.3'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-12.586, 74.9836), 4326)::GEOGRAPHY, TRUE, 78, 'Target City B', 38469, 'HTTPS', 443, NOW() - INTERVAL '6 days 3 hours 16 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'Medium', 68, 1217955, 1153403385, 49086, 1982, 'Firewall', 'Rate limited', false, 'shodan'),
        ('168.7.178.38'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(49.5164, 84.8164), 4326)::GEOGRAPHY, TRUE, 78, 'City E', 8385, 'ISP1', '193.249.255.191'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(2.9638, -7.6116), 4326)::GEOGRAPHY, TRUE, 72, 'Target City B', 21303, 'SNMP', 161, NOW() - INTERVAL '0 days 10 hours 36 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'Critical', 83, 3366394, 3679468642, 25209, 1034, 'IDS', 'Traffic filtered', false, 'shodan'),
        ('11.135.101.201'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-30.5102, 26.0273), 4326)::GEOGRAPHY, TRUE, 1, 'City D', 52444, 'ISP2', '48.231.197.217'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(61.7788, -32.6595), 4326)::GEOGRAPHY, TRUE, 192, 'Target City A', 30109, 'SNMP', 161, NOW() - INTERVAL '5 days 4 hours 19 minutes', TRUE, 'NTP Amplification', 'Network Layer', 'High', 78, 528558, 276964392, 3436, 4265, 'WAF', 'Monitored', false, 'custom'),
        ('163.142.166.51'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-89.0641, -1.6175), 4326)::GEOGRAPHY, TRUE, 105, 'City C', 33483, 'ISP1', '75.37.166.174'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-84.3897, -55.36), 4326)::GEOGRAPHY, TRUE, 177, 'Target City A', 12343, 'HTTPS', 443, NOW() - INTERVAL '2 days 13 hours 24 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'High', 75, 4869993, 8293598079, 6563, 4409, 'IDS', 'Traffic filtered', true, 'shodan'),
        ('11.27.198.179'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-26.6191, -53.6186), 4326)::GEOGRAPHY, TRUE, 160, 'City D', 50330, 'ISP3', '101.171.72.181'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-94.3755, 66.1031), 4326)::GEOGRAPHY, TRUE, 162, 'Target City A', 29698, 'SSH', 22, NOW() - INTERVAL '2 days 19 hours 57 minutes', TRUE, 'ICMP Flood', 'Application Layer', 'High', 64, 5264021, 3447933755, 13392, 3768, 'Firewall', 'Traffic filtered', true, 'abuseIPDB'),
        ('76.152.58.193'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-156.683, -36.2404), 4326)::GEOGRAPHY, TRUE, 2, 'City B', 11889, 'ISP2', '61.56.27.192'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(73.9267, -59.8898), 4326)::GEOGRAPHY, TRUE, 113, 'Target City B', 54768, 'SSH', 22, NOW() - INTERVAL '6 days 15 hours 3 minutes', TRUE, 'ICMP Flood', 'Transport Layer', 'Medium', 88, 3442483, 6334168720, 15498, 3690, 'WAF', 'Traffic filtered', true, 'custom'),
        ('167.45.39.122'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(15.3899, 72.1114), 4326)::GEOGRAPHY, TRUE, 72, 'City C', 14685, 'ISP4', '219.152.112.222'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(41.8332, -8.3104), 4326)::GEOGRAPHY, TRUE, 162, 'Target City A', 13485, 'NTP', 123, NOW() - INTERVAL '0 days 2 hours 34 minutes', TRUE, 'SYN Flood', 'Application Layer', 'High', 87, 9234727, 18109299647, 9635, 797, 'Firewall', 'IP blocked', false, 'custom'),
        ('150.176.184.101'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(107.397, -86.6503), 4326)::GEOGRAPHY, TRUE, 215, 'City A', 57389, 'ISP1', '53.82.240.182'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(75.8216, -21.9711), 4326)::GEOGRAPHY, TRUE, 205, 'Target City A', 62515, 'NTP', 123, NOW() - INTERVAL '6 days 0 hours 56 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Medium', 94, 611505, 489815505, 6219, 231, 'IDS', 'Rate limited', false, 'shodan'),
        ('2.251.207.187'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(71.7093, -4.2435), 4326)::GEOGRAPHY, TRUE, 30, 'City C', 54254, 'ISP1', '169.215.241.34'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(146.8787, 84.2114), 4326)::GEOGRAPHY, TRUE, 171, 'Target City B', 51188, 'FTP', 21, NOW() - INTERVAL '3 days 18 hours 52 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 72, 4839140, 5598884980, 30394, 2487, 'ML Model', 'Rate limited', true, 'cloudflare'),
        ('210.164.6.96'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-59.4754, -57.7833), 4326)::GEOGRAPHY, TRUE, 10, 'City A', 31894, 'ISP4', '241.242.161.182'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-67.339, -87.6348), 4326)::GEOGRAPHY, TRUE, 197, 'Target City B', 16048, 'SMTP', 25, NOW() - INTERVAL '7 days 23 hours 7 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'High', 81, 8610067, 5613763684, 25649, 1158, 'ML Model', 'Rate limited', false, 'cloudflare'),
        ('232.42.206.245'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(172.6562, 40.6538), 4326)::GEOGRAPHY, TRUE, 1, 'City D', 33951, 'ISP4', '173.171.133.30'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-61.4606, -27.6901), 4326)::GEOGRAPHY, TRUE, 211, 'Target City C', 10701, 'NTP', 123, NOW() - INTERVAL '5 days 21 hours 7 minutes', TRUE, 'SYN Flood', 'Application Layer', 'Low', 59, 7430471, 14036159719, 26331, 656, 'IDS', 'Traffic filtered', false, 'custom'),
        ('19.81.135.196'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-27.7412, 57.7989), 4326)::GEOGRAPHY, TRUE, 105, 'City B', 47396, 'ISP2', '207.218.208.228'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(49.508, -30.5245), 4326)::GEOGRAPHY, TRUE, 96, 'Target City C', 14213, 'NTP', 123, NOW() - INTERVAL '4 days 1 hours 35 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'High', 75, 2999646, 5093398908, 7837, 637, 'ML Model', 'Monitored', true, 'shodan'),
        ('82.124.175.150'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-89.7631, -38.408), 4326)::GEOGRAPHY, TRUE, 100, 'City D', 57726, 'ISP2', '248.39.38.195'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-152.3706, -57.01), 4326)::GEOGRAPHY, TRUE, 177, 'Target City B', 18690, 'FTP', 21, NOW() - INTERVAL '3 days 10 hours 10 minutes', TRUE, 'NTP Amplification', 'Application Layer', 'Medium', 65, 6481211, 5774759001, 45276, 4592, 'ML Model', 'Rate limited', true, 'shodan'),
        ('189.66.213.250'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-154.0547, -72.4977), 4326)::GEOGRAPHY, TRUE, 1, 'City A', 39693, 'ISP1', '13.33.120.68'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-66.4835, 8.4012), 4326)::GEOGRAPHY, TRUE, 218, 'Target City B', 32948, 'SSH', 22, NOW() - INTERVAL '4 days 5 hours 16 minutes', TRUE, 'NTP Amplification', 'Network Layer', 'High', 90, 7251140, 9049422720, 48533, 1163, 'ML Model', 'IP blocked', true, 'cloudflare'),
        ('228.177.82.189'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(120.407, 29.5018), 4326)::GEOGRAPHY, TRUE, 99, 'City B', 26996, 'ISP3', '129.36.119.106'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(100.4592, -71.4407), 4326)::GEOGRAPHY, TRUE, 100, 'Target City C', 22980, 'FTP', 21, NOW() - INTERVAL '5 days 7 hours 25 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 73, 7694659, 5409345277, 11981, 1252, 'ML Model', 'Monitored', false, 'cloudflare'),
        ('138.129.50.189'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-177.2019, 35.1737), 4326)::GEOGRAPHY, TRUE, 225, 'City E', 36697, 'ISP3', '115.21.94.56'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-59.5432, 46.3366), 4326)::GEOGRAPHY, TRUE, 99, 'Target City C', 15971, 'FTP', 21, NOW() - INTERVAL '0 days 9 hours 25 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'Medium', 62, 9948355, 13569556220, 12506, 4789, 'ML Model', 'IP blocked', false, 'shodan'),
        ('100.16.139.221'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-104.0784, 82.0795), 4326)::GEOGRAPHY, TRUE, 138, 'City A', 6522, 'ISP1', '190.12.172.98'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(109.9306, -75.7455), 4326)::GEOGRAPHY, TRUE, 80, 'Target City C', 57700, 'SMTP', 25, NOW() - INTERVAL '0 days 20 hours 23 minutes', TRUE, 'NTP Amplification', 'Network Layer', 'Medium', 82, 2204030, 2091624470, 1671, 4467, 'Firewall', 'Rate limited', true, 'custom'),
        ('13.164.18.180'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(32.975, 80.0703), 4326)::GEOGRAPHY, TRUE, 193, 'City D', 61232, 'ISP2', '4.136.22.201'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-119.3288, 61.482), 4326)::GEOGRAPHY, TRUE, 47, 'Target City B', 19020, 'SNMP', 161, NOW() - INTERVAL '5 days 10 hours 33 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'Medium', 50, 1413936, 1344653136, 5436, 1437, 'IDS', 'Rate limited', false, 'shodan'),
        ('14.218.71.207'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-24.8221, 63.9884), 4326)::GEOGRAPHY, TRUE, 193, 'City A', 39108, 'ISP1', '214.237.229.190'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-12.0645, 34.7814), 4326)::GEOGRAPHY, TRUE, 110, 'Target City A', 24560, 'SSH', 22, NOW() - INTERVAL '7 days 1 hours 25 minutes', TRUE, 'HTTP Flood', 'Network Layer', 'Critical', 80, 4077250, 3612443500, 23885, 171, 'IDS', 'IP blocked', false, 'custom'),
        ('92.247.29.174'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-82.6214, 55.0457), 4326)::GEOGRAPHY, TRUE, 107, 'City E', 58323, 'ISP3', '205.66.103.242'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(44.5018, 64.7168), 4326)::GEOGRAPHY, TRUE, 3, 'Target City C', 37720, 'SMTP', 25, NOW() - INTERVAL '7 days 0 hours 44 minutes', TRUE, 'UDP Flood', 'Application Layer', 'Medium', 67, 3061521, 2363494212, 27972, 4158, 'Firewall', 'Rate limited', false, 'abuseIPDB'),
        ('81.241.123.243'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-91.2149, 35.3485), 4326)::GEOGRAPHY, TRUE, 110, 'City D', 13267, 'ISP1', '78.135.21.197'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(14.3856, -34.9541), 4326)::GEOGRAPHY, TRUE, 189, 'Target City A', 15190, 'SNMP', 161, NOW() - INTERVAL '5 days 6 hours 51 minutes', TRUE, 'SYN Flood', 'Application Layer', 'Low', 78, 6273726, 3613666176, 34727, 4214, 'Firewall', 'Traffic filtered', true, 'abuseIPDB'),
        ('221.64.126.33'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-159.697, -63.0909), 4326)::GEOGRAPHY, TRUE, 171, 'City A', 62448, 'ISP3', '166.122.110.246'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(89.4634, 67.1124), 4326)::GEOGRAPHY, TRUE, 232, 'Target City B', 62936, 'HTTPS', 443, NOW() - INTERVAL '0 days 5 hours 23 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'Critical', 66, 4375791, 6878743452, 5159, 656, 'IDS', 'Monitored', true, 'cloudflare'),
        ('201.69.22.74'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(35.4154, -31.147), 4326)::GEOGRAPHY, TRUE, 194, 'City B', 12723, 'ISP4', '224.147.145.41'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-63.3524, 83.636), 4326)::GEOGRAPHY, TRUE, 96, 'Target City B', 18887, 'SNMP', 161, NOW() - INTERVAL '3 days 23 hours 59 minutes', TRUE, 'UDP Flood', 'Transport Layer', 'Medium', 90, 9211124, 11255993528, 10712, 2152, 'Firewall', 'Rate limited', false, 'cloudflare'),
        ('202.231.210.32'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-127.9407, 38.1646), 4326)::GEOGRAPHY, TRUE, 215, 'City D', 35701, 'ISP1', '138.68.14.108'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-168.1812, 88.149), 4326)::GEOGRAPHY, TRUE, 177, 'Target City B', 27371, 'SNMP', 161, NOW() - INTERVAL '6 days 9 hours 54 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 73, 4126963, 3710139737, 20792, 1488, 'ML Model', 'IP blocked', true, 'abuseIPDB'),
        ('245.50.227.66'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-110.4126, -15.6523), 4326)::GEOGRAPHY, TRUE, 218, 'City A', 8664, 'ISP1', '247.92.255.192'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(76.1156, 77.8129), 4326)::GEOGRAPHY, TRUE, 189, 'Target City A', 31002, 'DNS', 53, NOW() - INTERVAL '3 days 17 hours 52 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'Medium', 55, 6773268, 13045314168, 17649, 3233, 'IDS', 'Rate limited', true, 'shodan'),
        ('255.136.172.196'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(49.8797, -13.2705), 4326)::GEOGRAPHY, TRUE, 72, 'City E', 10118, 'ISP3', '6.227.170.235'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(161.3523, 30.942), 4326)::GEOGRAPHY, TRUE, 193, 'Target City A', 48047, 'NTP', 123, NOW() - INTERVAL '5 days 6 hours 9 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'High', 72, 3177183, 3031032582, 44299, 1140, 'Firewall', 'Traffic filtered', true, 'abuseIPDB'),
        ('190.55.45.82'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-90.1695, -45.2725), 4326)::GEOGRAPHY, TRUE, 38, 'City C', 42997, 'ISP3', '234.238.147.147'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-62.676, 20.0941), 4326)::GEOGRAPHY, TRUE, 194, 'Target City C', 17467, 'SSH', 22, NOW() - INTERVAL '6 days 4 hours 3 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'Low', 89, 3364021, 2045324768, 28540, 4279, 'WAF', 'Rate limited', false, 'shodan'),
        ('191.185.67.215'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-111.2315, 22.4594), 4326)::GEOGRAPHY, TRUE, 2, 'City E', 6078, 'ISP1', '34.73.175.198'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(86.7508, -57.5961), 4326)::GEOGRAPHY, TRUE, 194, 'Target City A', 50634, 'NTP', 123, NOW() - INTERVAL '5 days 16 hours 34 minutes', TRUE, 'NTP Amplification', 'Network Layer', 'Critical', 61, 8349789, 11380762407, 12173, 2049, 'Firewall', 'IP blocked', true, 'shodan'),
        ('4.186.111.140'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-39.9829, -59.2167), 4326)::GEOGRAPHY, TRUE, 79, 'City B', 50896, 'ISP4', '5.200.159.33'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-58.3771, 14.3326), 4326)::GEOGRAPHY, TRUE, 44, 'Target City C', 58874, 'HTTPS', 443, NOW() - INTERVAL '6 days 19 hours 14 minutes', TRUE, 'ICMP Flood', 'Application Layer', 'Medium', 51, 891032, 1263483376, 46418, 3142, 'ML Model', 'Traffic filtered', true, 'cloudflare'),
        ('131.150.172.122'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-93.7311, -66.0746), 4326)::GEOGRAPHY, TRUE, 38, 'City C', 64792, 'ISP1', '106.219.40.254'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(42.1367, 72.8899), 4326)::GEOGRAPHY, TRUE, 96, 'Target City A', 36515, 'SMTP', 25, NOW() - INTERVAL '4 days 6 hours 31 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Critical', 53, 5480190, 5332224870, 47719, 992, 'IDS', 'Monitored', false, 'abuseIPDB'),
        ('188.147.148.163'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(156.3995, 50.3299), 4326)::GEOGRAPHY, TRUE, 110, 'City A', 9647, 'ISP2', '200.96.154.24'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-58.6371, 50.2456), 4326)::GEOGRAPHY, TRUE, 215, 'Target City C', 25807, 'FTP', 21, NOW() - INTERVAL '7 days 13 hours 54 minutes', TRUE, 'UDP Flood', 'Application Layer', 'High', 68, 7659430, 5805847940, 11768, 4005, 'ML Model', 'Monitored', false, 'shodan'),
        ('67.131.80.253'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-71.5819, -80.6804), 4326)::GEOGRAPHY, TRUE, 2, 'City D', 12482, 'ISP4', '133.219.221.87'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(107.818, 66.1173), 4326)::GEOGRAPHY, TRUE, 78, 'Target City A', 34859, 'NTP', 123, NOW() - INTERVAL '1 days 10 hours 12 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'Critical', 77, 5992330, 9869367510, 46475, 1757, 'WAF', 'IP blocked', false, 'shodan'),
        ('119.43.245.97'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(9.5275, 10.0826), 4326)::GEOGRAPHY, TRUE, 63, 'City B', 52889, 'ISP4', '105.98.61.118'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-45.0567, -73.3505), 4326)::GEOGRAPHY, TRUE, 225, 'Target City B', 27653, 'FTP', 21, NOW() - INTERVAL '5 days 0 hours 33 minutes', TRUE, 'HTTP Flood', 'Transport Layer', 'High', 74, 9294359, 6710527198, 20206, 952, 'WAF', 'Monitored', true, 'shodan'),
        ('157.158.220.233'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(54.409, -20.3538), 4326)::GEOGRAPHY, TRUE, 79, 'City C', 59011, 'ISP3', '95.215.242.233'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(15.4992, -71.5766), 4326)::GEOGRAPHY, TRUE, 107, 'Target City A', 44601, 'HTTP', 80, NOW() - INTERVAL '7 days 0 hours 15 minutes', TRUE, 'SYN Flood', 'Network Layer', 'High', 69, 7252516, 12648387904, 8060, 4330, 'Firewall', 'Traffic filtered', true, 'custom'),
        ('35.223.241.222'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(142.1999, 9.116), 4326)::GEOGRAPHY, TRUE, 160, 'City B', 58669, 'ISP1', '129.21.244.178'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(154.7833, 63.1354), 4326)::GEOGRAPHY, TRUE, 107, 'Target City B', 60892, 'SMTP', 25, NOW() - INTERVAL '0 days 22 hours 7 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'High', 86, 3287511, 5450693238, 24138, 4790, 'ML Model', 'Traffic filtered', false, 'abuseIPDB'),
        ('175.7.67.98'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(117.5023, -44.971), 4326)::GEOGRAPHY, TRUE, 232, 'City E', 46667, 'ISP3', '208.91.24.74'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(167.7528, -80.009), 4326)::GEOGRAPHY, TRUE, 113, 'Target City C', 10910, 'NTP', 123, NOW() - INTERVAL '1 days 0 hours 16 minutes', TRUE, 'HTTP Flood', 'Network Layer', 'High', 86, 3766086, 4658648382, 7962, 675, 'Firewall', 'Traffic filtered', true, 'cloudflare'),
        ('221.208.21.129'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-16.4374, 44.164), 4326)::GEOGRAPHY, TRUE, 110, 'City C', 8016, 'ISP1', '36.175.93.186'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-91.7916, 54.1556), 4326)::GEOGRAPHY, TRUE, 171, 'Target City C', 50944, 'SMTP', 25, NOW() - INTERVAL '6 days 4 hours 38 minutes', TRUE, 'HTTP Flood', 'Transport Layer', 'Medium', 75, 5874271, 4934387640, 9437, 2914, 'WAF', 'Monitored', true, 'cloudflare'),
        ('230.184.175.194'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(32.3994, 39.5519), 4326)::GEOGRAPHY, TRUE, 73, 'City A', 19171, 'ISP2', '51.6.84.167'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-137.919, -27.3579), 4326)::GEOGRAPHY, TRUE, 10, 'Target City C', 64864, 'FTP', 21, NOW() - INTERVAL '5 days 18 hours 53 minutes', TRUE, 'SYN Flood', 'Application Layer', 'Low', 55, 5873162, 8140202532, 4814, 4382, 'ML Model', 'Traffic filtered', false, 'shodan'),
        ('134.89.172.32'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-5.7258, 67.5356), 4326)::GEOGRAPHY, TRUE, 189, 'City C', 26338, 'ISP3', '225.20.8.145'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-145.8761, 15.8454), 4326)::GEOGRAPHY, TRUE, 162, 'Target City A', 38458, 'HTTPS', 443, NOW() - INTERVAL '1 days 12 hours 45 minutes', TRUE, 'ICMP Flood', 'Application Layer', 'Critical', 65, 2306416, 4419093056, 35646, 3678, 'IDS', 'Monitored', false, 'cloudflare'),
        ('48.85.107.107'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-172.0138, 42.867), 4326)::GEOGRAPHY, TRUE, 113, 'City C', 33027, 'ISP4', '189.103.135.95'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(174.1827, 51.3809), 4326)::GEOGRAPHY, TRUE, 38, 'Target City B', 25063, 'HTTPS', 443, NOW() - INTERVAL '2 days 13 hours 44 minutes', TRUE, 'UDP Flood', 'Transport Layer', 'High', 65, 2150899, 2221878667, 37220, 306, 'Firewall', 'Monitored', true, 'cloudflare'),
        ('201.24.125.53'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(29.1777, -80.9428), 4326)::GEOGRAPHY, TRUE, 63, 'City C', 12213, 'ISP1', '172.44.212.130'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(92.791, -12.9118), 4326)::GEOGRAPHY, TRUE, 79, 'Target City C', 48147, 'SSH', 22, NOW() - INTERVAL '5 days 1 hours 40 minutes', TRUE, 'SYN Flood', 'Transport Layer', 'High', 87, 7811906, 13295864012, 15501, 2942, 'Firewall', 'Monitored', true, 'cloudflare'),
        ('52.179.104.142'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-6.2804, 81.2929), 4326)::GEOGRAPHY, TRUE, 138, 'City E', 53326, 'ISP4', '130.24.5.170'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(141.1219, 61.9442), 4326)::GEOGRAPHY, TRUE, 232, 'Target City B', 56081, 'DNS', 53, NOW() - INTERVAL '5 days 10 hours 55 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'High', 83, 2342081, 4154851694, 2972, 2215, 'IDS', 'IP blocked', true, 'custom'),
        ('250.189.92.229'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(98.6078, 10.1675), 4326)::GEOGRAPHY, TRUE, 79, 'City C', 21436, 'ISP3', '147.204.69.208'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-14.3318, -43.5693), 4326)::GEOGRAPHY, TRUE, 194, 'Target City C', 23192, 'SNMP', 161, NOW() - INTERVAL '6 days 2 hours 10 minutes', TRUE, 'HTTP Flood', 'Transport Layer', 'Critical', 89, 9389176, 18731406120, 21040, 2563, 'Firewall', 'Monitored', true, 'abuseIPDB'),
        ('1.91.139.247'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-50.8393, -37.3678), 4326)::GEOGRAPHY, TRUE, 197, 'City E', 56459, 'ISP3', '159.174.38.204'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(39.739, 61.7259), 4326)::GEOGRAPHY, TRUE, 110, 'Target City A', 14138, 'HTTPS', 443, NOW() - INTERVAL '3 days 0 hours 23 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 92, 4565207, 2638689646, 43993, 766, 'ML Model', 'Rate limited', false, 'shodan'),
        ('145.146.130.239'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-39.3838, -37.8457), 4326)::GEOGRAPHY, TRUE, 162, 'City D', 21749, 'ISP4', '110.56.100.164'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(19.0566, 12.1759), 4326)::GEOGRAPHY, TRUE, 99, 'Target City B', 50379, 'FTP', 21, NOW() - INTERVAL '3 days 23 hours 58 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'Critical', 91, 5604514, 3861510146, 47527, 1558, 'ML Model', 'IP blocked', false, 'shodan'),
        ('52.42.23.8'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-146.3545, -34.0581), 4326)::GEOGRAPHY, TRUE, 38, 'City E', 52559, 'ISP1', '68.248.199.76'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-4.5071, -51.2618), 4326)::GEOGRAPHY, TRUE, 72, 'Target City A', 28776, 'SNMP', 161, NOW() - INTERVAL '2 days 1 hours 31 minutes', TRUE, 'ICMP Flood', 'Transport Layer', 'High', 59, 7475286, 4574875032, 31434, 3226, 'WAF', 'Rate limited', false, 'custom'),
        ('212.128.82.125'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(114.3225, 77.9095), 4326)::GEOGRAPHY, TRUE, 47, 'City E', 34576, 'ISP1', '105.66.23.188'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(105.0225, -38.0579), 4326)::GEOGRAPHY, TRUE, 226, 'Target City A', 38426, 'SSH', 22, NOW() - INTERVAL '7 days 14 hours 28 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'Critical', 70, 2590743, 2722870893, 22354, 4332, 'WAF', 'Traffic filtered', true, 'shodan'),
        ('65.195.120.154'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-114.4933, 53.6506), 4326)::GEOGRAPHY, TRUE, 205, 'City A', 54184, 'ISP4', '19.7.35.40'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-33.4068, -62.3334), 4326)::GEOGRAPHY, TRUE, 193, 'Target City B', 63051, 'HTTPS', 443, NOW() - INTERVAL '4 days 6 hours 13 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'High', 97, 9762927, 14517472449, 42216, 4785, 'Firewall', 'Rate limited', true, 'cloudflare'),
        ('150.182.58.193'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(59.1399, 14.6013), 4326)::GEOGRAPHY, TRUE, 2, 'City A', 38819, 'ISP3', '31.209.106.176'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(84.759, 36.2033), 4326)::GEOGRAPHY, TRUE, 10, 'Target City A', 38413, 'SNMP', 161, NOW() - INTERVAL '5 days 2 hours 34 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 96, 962196, 1237384056, 25756, 337, 'WAF', 'Monitored', false, 'custom'),
        ('229.5.163.77'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(52.8772, -84.3679), 4326)::GEOGRAPHY, TRUE, 100, 'City A', 26316, 'ISP3', '208.149.231.106'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(3.2978, 18.1988), 4326)::GEOGRAPHY, TRUE, 58, 'Target City C', 61852, 'SMTP', 25, NOW() - INTERVAL '23 days 17 hours 22 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 53, 4774733, 2817092470, 36171, 1570, 'IDS', 'Monitored', false, 'custom'),
        ('70.202.47.196'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(154.6251, -58.6963), 4326)::GEOGRAPHY, TRUE, 100, 'City B', 22443, 'ISP2', '255.86.74.3'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-12.586, 74.9836), 4326)::GEOGRAPHY, TRUE, 225, 'Target City C', 44162, 'SMTP', 25, NOW() - INTERVAL '23 days 20 hours 27 minutes', TRUE, 'SYN Flood', 'Network Layer', 'High', 97, 5470545, 9064693065, 6608, 450, 'Firewall', 'Monitored', true, 'shodan'),
        ('164.16.234.113'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(21.9697, -48.9049), 4326)::GEOGRAPHY, TRUE, 3, 'City B', 24991, 'ISP3', '168.7.178.38'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(169.6327, 31.0698), 4326)::GEOGRAPHY, TRUE, 63, 'Target City C', 13472, 'HTTP', 80, NOW() - INTERVAL '24 days 17 hours 31 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Medium', 87, 6160178, 10287497260, 20969, 834, 'WAF', 'IP blocked', false, 'cloudflare'),
        ('130.212.244.163'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-20.8343, -53.5706), 4326)::GEOGRAPHY, TRUE, 192, 'City D', 6111, 'ISP1', '254.204.21.135'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-92.4395, -87.4833), 4326)::GEOGRAPHY, TRUE, 99, 'Target City A', 39320, 'DNS', 53, NOW() - INTERVAL '6 days 12 hours 11 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 71, 5593348, 10895841904, 29110, 2049, 'ML Model', 'Traffic filtered', false, 'abuseIPDB'),
        ('214.129.98.120'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-85.8674, -19.2854), 4326)::GEOGRAPHY, TRUE, 3, 'City D', 12149, 'ISP3', '68.4.142.166'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-99.356, -14.7219), 4326)::GEOGRAPHY, TRUE, 129, 'Target City C', 11563, 'SMTP', 25, NOW() - INTERVAL '3 days 9 hours 4 minutes', TRUE, 'NTP Amplification', 'Application Layer', 'Medium', 97, 3378468, 4506876312, 25882, 3527, 'IDS', 'Monitored', true, 'shodan'),
        ('110.154.32.121'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-30.9296, -72.5782), 4326)::GEOGRAPHY, TRUE, 30, 'City C', 10968, 'ISP2', '91.20.27.198'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-107.2373, -6.9052), 4326)::GEOGRAPHY, TRUE, 38, 'Target City B', 42239, 'DNS', 53, NOW() - INTERVAL '28 days 11 hours 25 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'High', 72, 9422850, 18817431450, 17165, 1989, 'Firewall', 'Traffic filtered', true, 'custom'),
        ('203.80.152.143'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-179.1558, 5.9117), 4326)::GEOGRAPHY, TRUE, 38, 'City A', 58580, 'ISP2', '17.85.151.152'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-90.4528, 53.2466), 4326)::GEOGRAPHY, TRUE, 129, 'Target City C', 63027, 'HTTPS', 443, NOW() - INTERVAL '27 days 23 hours 53 minutes', TRUE, 'SYN Flood', 'Application Layer', 'Low', 65, 1400480, 2226763200, 25607, 3657, 'ML Model', 'Rate limited', false, 'abuseIPDB'),
        ('191.213.222.156'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(69.6456, -11.0966), 4326)::GEOGRAPHY, TRUE, 226, 'City A', 41155, 'ISP1', '241.53.232.48'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-90.0215, -73.8236), 4326)::GEOGRAPHY, TRUE, 99, 'Target City C', 16801, 'FTP', 21, NOW() - INTERVAL '19 days 2 hours 41 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'Critical', 65, 9332170, 8865561500, 29499, 4636, 'WAF', 'Rate limited', true, 'cloudflare'),
        ('30.24.39.172'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(16.2199, -36.4193), 4326)::GEOGRAPHY, TRUE, 171, 'City D', 6042, 'ISP2', '192.148.131.9'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-42.9714, 4.4707), 4326)::GEOGRAPHY, TRUE, 47, 'Target City B', 30477, 'SSH', 22, NOW() - INTERVAL '3 days 12 hours 38 minutes', TRUE, 'NTP Amplification', 'Application Layer', 'Medium', 73, 3964782, 6252461214, 11522, 3954, 'WAF', 'IP blocked', false, 'abuseIPDB'),
        ('61.121.234.31'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-41.6702, -87.1098), 4326)::GEOGRAPHY, TRUE, 3, 'City E', 59362, 'ISP4', '54.243.227.198'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-174.3892, 51.1442), 4326)::GEOGRAPHY, TRUE, 73, 'Target City B', 10704, 'SMTP', 25, NOW() - INTERVAL '30 days 16 hours 58 minutes', TRUE, 'UDP Flood', 'Transport Layer', 'Low', 75, 7576805, 11115172935, 5415, 4907, 'ML Model', 'Monitored', true, 'custom'),
        ('177.167.109.21'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-102.1726, -37.5365), 4326)::GEOGRAPHY, TRUE, 113, 'City C', 29345, 'ISP4', '223.253.91.18'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-146.2116, -29.2698), 4326)::GEOGRAPHY, TRUE, 177, 'Target City C', 13827, 'SMTP', 25, NOW() - INTERVAL '10 days 9 hours 0 minutes', TRUE, 'HTTP Flood', 'Network Layer', 'Critical', 90, 9662731, 5063271044, 43299, 1642, 'WAF', 'Rate limited', false, 'shodan'),
        ('226.66.238.57'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-153.1492, -2.9884), 4326)::GEOGRAPHY, TRUE, 73, 'City D', 37454, 'ISP3', '251.202.212.254'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(98.4255, -22.2979), 4326)::GEOGRAPHY, TRUE, 129, 'Target City B', 9894, 'DNS', 53, NOW() - INTERVAL '4 days 10 hours 9 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'Critical', 67, 1735798, 2096843984, 22579, 1215, 'ML Model', 'IP blocked', true, 'cloudflare'),
        ('18.209.241.218'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-38.6021, -5.0655), 4326)::GEOGRAPHY, TRUE, 215, 'City E', 32662, 'ISP4', '101.36.73.251'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(44.0822, 32.0885), 4326)::GEOGRAPHY, TRUE, 226, 'Target City C', 54584, 'HTTPS', 443, NOW() - INTERVAL '8 days 13 hours 39 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Critical', 71, 3182782, 3316458844, 48603, 3250, 'ML Model', 'IP blocked', false, 'cloudflare'),
        ('27.33.49.69'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(119.8548, 21.2015), 4326)::GEOGRAPHY, TRUE, 44, 'City B', 55227, 'ISP3', '162.94.64.131'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-126.3634, -19.0258), 4326)::GEOGRAPHY, TRUE, 138, 'Target City B', 11089, 'FTP', 21, NOW() - INTERVAL '29 days 10 hours 25 minutes', TRUE, 'UDP Flood', 'Transport Layer', 'Medium', 76, 3574893, 1816045644, 6029, 1587, 'Firewall', 'Traffic filtered', false, 'abuseIPDB'),
        ('92.97.41.225'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(66.3341, 71.1301), 4326)::GEOGRAPHY, TRUE, 113, 'City A', 54184, 'ISP2', '203.67.128.99'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-81.3573, -27.5135), 4326)::GEOGRAPHY, TRUE, 44, 'Target City C', 60078, 'HTTPS', 443, NOW() - INTERVAL '11 days 19 hours 54 minutes', TRUE, 'UDP Flood', 'Network Layer', 'Critical', 69, 4645931, 3005917357, 36826, 4608, 'WAF', 'Traffic filtered', false, 'cloudflare'),
        ('87.73.118.206'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-70.9622, -65.9359), 4326)::GEOGRAPHY, TRUE, 3, 'City E', 64149, 'ISP3', '94.66.85.42'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(115.5005, -42.8662), 4326)::GEOGRAPHY, TRUE, 99, 'Target City C', 56479, 'HTTP', 80, NOW() - INTERVAL '16 days 2 hours 19 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Critical', 92, 2372827, 1843686579, 44509, 660, 'IDS', 'Monitored', true, 'cloudflare'),
        ('173.26.187.157'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-93.6463, 81.9471), 4326)::GEOGRAPHY, TRUE, 99, 'City C', 6605, 'ISP3', '110.50.85.72'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-89.4684, -6.9977), 4326)::GEOGRAPHY, TRUE, 80, 'Target City A', 55152, 'SMTP', 25, NOW() - INTERVAL '10 days 6 hours 20 minutes', TRUE, 'HTTP Flood', 'Application Layer', 'Medium', 68, 2435608, 2903244736, 9097, 4597, 'ML Model', 'Traffic filtered', true, 'cloudflare'),
        ('6.183.103.137'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(139.4784, -70.1311), 4326)::GEOGRAPHY, TRUE, 226, 'City D', 19821, 'ISP3', '145.216.89.175'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-170.9303, 83.5904), 4326)::GEOGRAPHY, TRUE, 44, 'Target City A', 7761, 'DNS', 53, NOW() - INTERVAL '18 days 14 hours 57 minutes', TRUE, 'ICMP Flood', 'Application Layer', 'Medium', 85, 5843606, 3681471780, 28265, 1662, 'ML Model', 'Traffic filtered', true, 'cloudflare'),
        ('93.167.138.175'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-170.9229, -12.0515), 4326)::GEOGRAPHY, TRUE, 100, 'City C', 9225, 'ISP3', '27.112.5.36'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-160.3751, -55.237), 4326)::GEOGRAPHY, TRUE, 226, 'Target City C', 8423, 'SMTP', 25, NOW() - INTERVAL '1 days 0 hours 7 minutes', TRUE, 'NTP Amplification', 'Transport Layer', 'High', 73, 6091267, 10422157837, 35072, 1428, 'ML Model', 'IP blocked', true, 'custom'),
        ('118.130.4.248'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(172.6236, 54.967), 4326)::GEOGRAPHY, TRUE, 205, 'City E', 62065, 'ISP4', '14.112.34.83'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-59.3367, 69.5833), 4326)::GEOGRAPHY, TRUE, 2, 'Target City C', 26820, 'SSH', 22, NOW() - INTERVAL '17 days 23 hours 20 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'High', 74, 9766508, 7764373860, 44346, 1131, 'WAF', 'IP blocked', false, 'cloudflare'),
        ('136.229.190.242'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-34.1669, 34.1493), 4326)::GEOGRAPHY, TRUE, 171, 'City C', 48006, 'ISP2', '12.201.167.174'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(17.7117, -6.4365), 4326)::GEOGRAPHY, TRUE, 38, 'Target City A', 26088, 'HTTP', 80, NOW() - INTERVAL '3 days 15 hours 13 minutes', TRUE, 'ICMP Flood', 'Transport Layer', 'High', 72, 6755652, 3465649476, 34108, 221, 'IDS', 'IP blocked', true, 'custom'),
        ('177.174.66.103'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(44.5018, 64.7168), 4326)::GEOGRAPHY, TRUE, 100, 'City A', 60264, 'ISP2', '122.252.5.108'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-159.205, -26.0153), 4326)::GEOGRAPHY, TRUE, 73, 'Target City A', 39666, 'NTP', 123, NOW() - INTERVAL '27 days 17 hours 19 minutes', TRUE, 'HTTP Flood', 'Network Layer', 'High', 58, 8812663, 13421685749, 35917, 3093, 'IDS', 'IP blocked', false, 'custom'),
        ('173.123.243.154'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-10.111, -62.1808), 4326)::GEOGRAPHY, TRUE, 215, 'City A', 45141, 'ISP1', '68.21.197.178'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(63.8438, 1.23), 4326)::GEOGRAPHY, TRUE, 211, 'Target City A', 15190, 'HTTP', 80, NOW() - INTERVAL '6 days 3 hours 33 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 72, 9134162, 13956999536, 46328, 690, 'Firewall', 'Traffic filtered', false, 'abuseIPDB'),
        ('221.64.126.33'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-159.697, -63.0909), 4326)::GEOGRAPHY, TRUE, 80, 'City A', 62448, 'ISP3', '166.122.110.246'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(89.4634, 67.1124), 4326)::GEOGRAPHY, TRUE, 129, 'Target City B', 62936, 'HTTPS', 443, NOW() - INTERVAL '1 days 5 hours 23 minutes', TRUE, 'DNS Amplification', 'Application Layer', 'Critical', 66, 4375791, 6878743452, 5159, 656, 'IDS', 'Monitored', true, 'cloudflare'),
        ('201.69.22.74'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(35.4154, -31.147), 4326)::GEOGRAPHY, TRUE, 225, 'City B', 12723, 'ISP4', '224.147.145.41'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-63.3524, 83.636), 4326)::GEOGRAPHY, TRUE, 218, 'Target City B', 18887, 'SNMP', 161, NOW() - INTERVAL '7 days 23 hours 59 minutes', TRUE, 'UDP Flood', 'Transport Layer', 'Medium', 90, 9211124, 11255993528, 10712, 2152, 'Firewall', 'Rate limited', false, 'cloudflare'),
        ('64.231.210.32'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(123.8004, -49.7665), 4326)::GEOGRAPHY, TRUE, 107, 'City D', 35701, 'ISP1', '138.68.14.108'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(4.1779, 35.3991), 4326)::GEOGRAPHY, TRUE, 47, 'Target City B', 27371, 'SNMP', 161, NOW() - INTERVAL '12 days 9 hours 54 minutes', TRUE, 'DNS Amplification', 'Network Layer', 'Low', 73, 4126963, 3710139737, 20792, 1488, 'ML Model', 'IP blocked', true, 'abuseIPDB'),
        ('63.50.227.66'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-137.4919, 24.123), 4326)::GEOGRAPHY, TRUE, 58, 'City A', 8664, 'ISP1', '247.92.255.192'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(25.1732, 35.6371), 4326)::GEOGRAPHY, TRUE, 107, 'Target City A', 31002, 'DNS', 53, NOW() - INTERVAL '25 days 18 hours 15 minutes', TRUE, 'ICMP Flood', 'Network Layer', 'Medium', 55, 6773268, 13045314168, 17649, 3233, 'IDS', 'Rate limited', true, 'shodan'),
        ('13.136.172.196'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-87.8424, 27.298), 4326)::GEOGRAPHY, TRUE, 215, 'City A', 46170, 'ISP1', '6.227.170.235'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-101.3427, -34.1153), 4326)::GEOGRAPHY, TRUE, 58, 'Target City B', 7535, 'SSH', 22, NOW() - INTERVAL '24 days 10 hours 13 minutes', TRUE, 'UDP Flood', 'Application Layer', 'Medium', 92, 6517837, 9007650734, 11457, 1918, 'Firewall', 'Traffic filtered', true, 'abuseIPDB'),
        ('190.55.45.82'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-90.1695, -45.2725), 4326)::GEOGRAPHY, TRUE, 3, 'City C', 42997, 'ISP3', '234.238.147.147'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-62.676, 20.0941), 4326)::GEOGRAPHY, TRUE, 225, 'Target City C', 17467, 'SSH', 22, NOW() - INTERVAL '20 days 13 hours 9 minutes', TRUE, 'SYN Flood', 'Network Layer', 'Low', 89, 3364021, 2045324768, 28540, 4279, 'WAF', 'Rate limited', false, 'shodan'),
        ('191.185.67.215'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(-111.2315, 22.4594), 4326)::GEOGRAPHY, TRUE, 1, 'City E', 6078, 'ISP1', '34.73.175.198'::CIDR, TRUE, ST_SetSRID(ST_MakePoint(86.7508, -57.5961), 4326)::GEOGRAPHY, TRUE, 225, 'Target City A', 50634, 'NTP', 123, NOW() - INTERVAL '10 days 16 hours 34 minutes', TRUE, 'NTP Amplification', 'Network Layer', 'Critical', 61, 8349789, 11380762407, 12173, 2049, 'Firewall', 'IP blocked', true, 'shodan')
;

