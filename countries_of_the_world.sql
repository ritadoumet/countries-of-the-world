/*creation of tables */
CREATE TABLE CONTINENT
(
ContinentName VARCHAR2(20) PRIMARY KEY,
AREA NUMBER (12, 0)
);
CREATE TABLE COUNTRY
(
CountryName VARCHAR2(50) PRIMARY KEY,
ContinentName VARCHAR2(20) REFERENCES CONTINENT(ContinentName) NOT NULL,
Population NUMBER(10,0),
Area NUMBER(10,0),
President VARCHAR2(50) UNIQUE,
Regime VARCHAR2(50),
Currency VARCHAR(3)
);

CREATE TABLE LANGUAGE
(
LanguageName VARCHAR2 (30) PRIMARY KEY,
CountryOfOrigin VARCHAR2(50) REFERENCES COUNTRY(CountryName) ON DELETE SET NULL 
);

CREATE TABLE NOTABLEFIGURES
( 
FirstName VARCHAR2(20),
LastName VARCHAR2(30),
BornIn VARCHAR2(50) REFERENCES COUNTRY(CountryName),
Age NUMBER(3,0),
Sex VARCHAR2(10),
PRIMARY KEY (FirstName, LastName, BornIn)
);


CREATE TABLE UnionOfCountries
(
UnionName VARCHAR2(35) PRIMARY KEY,
DateOfFoundation Date
);

CREATE TABLE inConflict
(
CountryName1 VARCHAR2(50) REFERENCES COUNTRY(CountryName),
CountryName2 VARCHAR2(50) REFERENCES COUNTRY(CountryName),
StartDate DATE,
PRIMARY KEY (CountryName1, CountryName2)
);

CREATE TABLE ISSPOKENIN
(
CountryName VARCHAR2(50) REFERENCES COUNTRY(CountryName),
LanguageName VARCHAR2(30) REFERENCES LANGUAGE(LanguageName),
PRIMARY KEY (CountryName, LanguageName)
);

CREATE TABLE ISIN
(
UnionName VARCHAR2(35) REFERENCES UNIONOFCOUNTRIES(UnionName),
CountryName VARCHAR2(50) REFERENCES COUNTRY(CountryName),
PRIMARY KEY (UnionName, CountryName)
);

CREATE TABLE PROFESSION_NOTABLE_FIGURE(
FirstName VARCHAR2(20),
LastName VARCHAR2(30),
Profession VARCHAR2(30),
BornIn VARCHAR(50) references country(countryname),
Foreign Key (FirstName, LastName, BornIn) references notablefigures(firstname, lastname, bornin),
PRIMARY KEY (FirstName, LastName, Profession, BornIn)
);


/*filling the tables with data*/

INSERT INTO CONTINENT VALUES ('Asia', 44579000);
INSERT INTO CONTINENT VALUES ('Africa', 30065000); 
INSERT INTO CONTINENT VALUES ('North America', 24256000);
INSERT INTO CONTINENT VALUES ('South America', 17819000);
INSERT INTO CONTINENT VALUES ('Antarctica', 13209000);
INSERT INTO CONTINENT VALUES ('Europe', 9938000);
INSERT INTO CONTINENT VALUES ('Oceania', 7687000);

INSERT INTO COUNTRY VALUES ('Afghanistan', 'Asia', 38928346, 652860, 'Ashraf Ghani', 'Republic', 'AFN');
INSERT INTO COUNTRY VALUES ('Albania', 'Europe', 2877797, 27405, 'Ilir Meta', 'Republic', 'ALL');
INSERT INTO COUNTRY VALUES ('Algeria', 'Africa', 43851044, 2381740, 'Abdelmadjid Tebboune', 'Republic', 'DZD');
INSERT INTO COUNTRY VALUES ('Andorra', 'Europe', 77265, 470, 'Xavier Espot Zamora', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Angola', 'Africa', 32866272, 1246700, 'João Lourenço', 'Republic', 'AOA');
INSERT INTO COUNTRY VALUES ('Antigua and Barbuda', 'North America', 97929, 440, 'Gaston Browne', 'Constitutional monarchy', 'XCD');
INSERT INTO COUNTRY VALUES ('Argentina', 'South America', 45195774, 2736690, ' Alberto Fernández', 'Republic', 'ARS');
INSERT INTO COUNTRY VALUES ('Armenia', 'Asia', 2963243, 28470, 'Armen Sarksyan', 'Republic', 'AMD'); 
INSERT INTO COUNTRY VALUES ('Australia', 'Oceania', 25499884, 7682300, 'Scott Morrison', 'Constitutional monarchy', 'AUD');
INSERT INTO COUNTRY VALUES ('Austria', 'Europe', 9006398, 82409, 'Alexander Van der Bellen', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Azerbaijan', 'Asia', 10139177, 82658, 'Ilham Aliyev', 'Republic', 'AZN');
INSERT INTO COUNTRY VALUES ('Bahamas', 'North America', 393244, 10010, 'Hubert Minnis', 'Constitutional monarchy', 'BSD');
INSERT INTO COUNTRY VALUES ('Bahrain', 'Asia', 1701575, 760, 'Salman bin Hamad Al Khalifa', 'Constitutional monarchy', 'BHD');
INSERT INTO COUNTRY VALUES ('Bangladesh', 'Asia', 164689383, 1301170, 'Abdul Hamid', 'Republic', 'BDT');
INSERT INTO COUNTRY VALUES ('Barbados', 'North America', 287375, 430, 'Mia Mottley', 'Constitutional monarchy', 'BBD');
INSERT INTO COUNTRY VALUES ('Belarus', 'Europe', 9449323, 202910, 'Alexander Lukashenko', Republic, 'BYN');
INSERT INTO COUNTRY VALUES ('Belgium', 'Europe', 11589623, 30280, 'Alexander De Croo', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Belize', 'North America', 397628, 22810, 'Juan Briceño', 'Constitutional monarchy', 'BZD');
INSERT INTO COUNTRY VALUES ('Benin', 'Africa', 12123200, 112760, 'Patrice Talon', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Bhutan', 'Asia', 711608, 38117, 'Lotay Tshering', 'Constitutional monarchy', 'BTN');
INSERT INTO COUNTRY VALUES ('Bolivia', 'Europe', 11673021, 1083300, 'Luis Arce', 'Republic', 'BOB');
INSERT INTO COUNTRY VALUES ('Bosnia and Herzegovina', 'Europe', 3280819, 51000, 'Milorad Dodik', 'Republic', 'BAM');
INSERT INTO COUNTRY VALUES ('Bostwana', 'Africa', 2351627, 566730, 'Mokgweetsi Masisi', 'Republic', 'BWP');
INSERT INTO COUNTRY VALUES ('Brazil', 'South America', 212559417, 8358140, 'Jair Bolsonaro', 'Republic', 'BRL');
INSERT INTO COUNTRY VALUES ('Brunei', 'Asia', 437479, 5270, 'Hassanal Bolkiah', 'Absolute monarchy', 'BND');
INSERT INTO COUNTRY VALUES ('Bulgaria', 'Europe', 6948445, 108560, 'Rumen Radev', 'Republic', 'BGN');
INSERT INTO COUNTRY VALUES ('Burkina Faso', 'Africa', 20903273, 273600, 'Roch Marc Christian Kaboré', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Burundi', 'Africa', 11890784, 25680, 'Évariste Ndayishimiye', 'Republic', 'BIF');
INSERT INTO COUNTRY VALUES ('Côte d Ivoire', 'Africa', 26378274, 318000, 'Alassane Ouattara', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Cabo Verde', 'Africa', 555987, 4030, 'Jorge Carlos Fonseca', 'Republic', 'CVE');
INSERT INTO COUNTRY VALUES ('Cambodia', 'Asia', 16718965, 176520, 'Hun Sen', 'Constitutional monarchy', 'KHR');
INSERT INTO COUNTRY VALUES ('Cameroon', 'Africa', 26545863, 472710, 'Paul Biya', 'Republic', 'XAF');
INSERT INTO COUNTRY VALUES ('Canada', 'North America', 37742154, 9093510, 'Justin Trudeau', 'Constitutional monarchy', 'CAD');
INSERT INTO COUNTRY VALUES ('Central African Republic', 'Africa', 4829767, 622980, 'Faustin-Archange Touadéra', 'Republic', 'XAF');
INSERT INTO COUNTRY VALUES ('Chad', 'Africa', 16425864, 1259200, 'Mahamat Déby', 'Provisional', 'XAF');
INSERT INTO COUNTRY VALUES ('Chile', 'South America', 19116201, 743532, 'Sebastián Piñera', 'Republic', 'CLP');
INSERT INTO COUNTRY VALUES ('China', 'Asia', 1439323776, 9388211, 'Xi Jinping', 'Republic', 'CNY');
INSERT INTO COUNTRY VALUES ('Colombia', 'South America', 50882891, 1109500, 'Iván Duque', 'Republic', 'COP');
INSERT INTO COUNTRY VALUES ('Comoros', 'Africa', 869601, 1861, 'Azali Assoumani', 'Republic', 'KMF');
INSERT INTO COUNTRY VALUES ('Congo', 'Africa', 5518087, 341500, 'Denis Sassou Nguesso', 'Republic', 'XAF');
INSERT INTO COUNTRY VALUES ('Costa Rica', 'North America', 5094118, 51060, 'Carlos Alvarado Quesada', 'Republic', 'CRC');
INSERT INTO COUNTRY VALUES ('Croatia', 'Europe', 4105267, 55960, 'Zoran Milanovi?', 'Republic', 'HRK');
INSERT INTO COUNTRY VALUES ('Cuba', 'North America', 11326616, 106440, 'Miguel Díaz-Canel', 'Republic', 'CUP');
INSERT INTO COUNTRY VALUES ('Cyprus', 'Asia', 1207359, 9240, 'Nicos Anastasiades', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Czechia ', 'Europe', 10708981, 77240, 'Miloš Zeman', 'Republic', 'CZK');
INSERT INTO COUNTRY VALUES ('Democratic Republic of the Congo', 'Africa', 89561403, 2267050, 'Félix Tshisekedi', 'Republic', 'CDF');
INSERT INTO COUNTRY VALUES ('Denmark', 'Europe', 5792202, 42430, 'Mette Frederiksen', 'Constitutional monarchy', 'DKK');
INSERT INTO COUNTRY VALUES ('Djibouti', 'Africa', 988000, 23180, 'Ismaïl Omar Guelleh', 'Republic', 'DJF');
INSERT INTO COUNTRY VALUES ('Dominica', 'North America', 71986, 750, 'Charles Savarin', 'Republic', 'XCD');
INSERT INTO COUNTRY VALUES ('Dominican Republic', 'North America', 10847910, 48320, 'Luis Abinader', 'Republic', 'DOP');
INSERT INTO COUNTRY VALUES ('Ecuador', 'South America', 10847910, 48320, 'Guillermo Lasso', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Egypt', 'Africa', 17643054, 248360, 'Abdel Fattah el-Sisi', 'Republic', 'EFP');
INSERT INTO COUNTRY VALUES ('El Salvador', 'North America', 6486205, 20720, 'Nayib Bukele', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Equatorial Guinea', 'Africa', 1402985, 28205, 'Teodoro Obiang Nguema Mbasogo', 'Republic', 'XAF');
INSERT INTO COUNTRY VALUES ('Eritrea', 'Africa', 3546421, 101000, 'Isaias Afwerki', 'Republic', 'ERN');
INSERT INTO COUNTRY VALUES ('Estonia', 'Europe', 1326535, 42390, 'Kersti Kaljulaid', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Eswatini (fmr. "Swaziland")', 'Africa', 1160164, 17200, 'Mswati III', 'Absolute monarchy', 'SZL');
INSERT INTO COUNTRY VALUES ('Ethiopia', 'Africa', 114963588, 1000000, 'Sahle-Work Zewde', 'Republic', 'ETB');
INSERT INTO COUNTRY VALUES ('Fiji', 'Oceania', 896445, 12270, 'Jioji Konrote', 'Republic', 'FJD');
INSERT INTO COUNTRY VALUES ('Finland', 'Europe', 5540720, 303890, 'Sauli Niinistö', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('France', 'Europe', 65 273 511, 547 557, 'Emmanuel' 'Macron', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Gabon', 'Africa', 2225734, 257670, 'Ali Bongo Ondimba', 'Republic', 'XAF');
INSERT INTO COUNTRY VALUES ('Gambia', 'Africa', 2416668, 10120, 'Adama Barrow', 'Republic', 'GMD');
INSERT INTO COUNTRY VALUES ('Georgia', 'Asia', 3989167, 69490, 'Salome Zourabichvili', 'Republic', 'GEL');
INSERT INTO COUNTRY VALUES ('Germany', 'Europe', 83783942, 348560, 'Frank-Walter Steinmeier', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Ghana', 'Asia', 31072940, 227540, 'Nana Akufo-Addo', 'Republic', 'GHS');
INSERT INTO COUNTRY VALUES ('Greece', 'Europe', 10423054, 128900, 'Katerina Sakellaropoulou', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Grenada', 'Europe', 112523, 340, 'Keith Mitchell', 'Constitutional monarchy', 'XCD');
INSERT INTO COUNTRY VALUES ('Guinea', 'Africa', 13132795, 245720, 'Alpha Condé', 'Republic', 'GNF');
INSERT INTO COUNTRY VALUES ('Guinea Bissau', 'Africa', 1968001, 28120, 'Umaro Sissoco Embaló', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Guyana', 'South America', 786552, 196850, 'Irfaan Ali', 'Republic', 'GYD');
INSERT INTO COUNTRY VALUES ('Haiti', 'North America', 11402528, 27560, 'Jovenel Moïse', 'Republic', 'HTG');
INSERT INTO COUNTRY VALUES ('Holy See', 'Europe', 801, 0, 'Pope Francis', 'Absolute monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Honduras', 'South America', 9904607, 111980, 'Juan Orlando Hernández', 'Republic', 'HNL');
INSERT INTO COUNTRY VALUES ('Hungary', 'Europe', 9660351, 90530, 'János Áder', 'Republic', 'HKD');
INSERT INTO COUNTRY VALUES ('Iceland', 'Europe', 341243, 100250, 'Guðni Th. Jóhannesson', 'Republic', 'ISK');
INSERT INTO COUNTRY VALUES ('India', 'Asia', 1380004385, 2973190, 'Ram Nath Kovind', 'Republic' , 'INR');
INSERT INTO COUNTRY VALUES ('Indonesia', 'Asia', 273523615, 1811570, 'Joko Widodo', 'Republic', 'IDR');
INSERT INTO COUNTRY VALUES ('Iran', 'Asia', 83992949, 1628550, 'Ali Khamenei', 'Republic', 'IRR');
INSERT INTO COUNTRY VALUES ('Iraq', 'Asia', 40222493, 434320, 'Barham' 'Salih', 'Republic', 'IQD');
INSERT INTO COUNTRY VALUES ('Israel', 'Asia', 8655535, 21640, 'Reuven' 'Rivlin', 'Republic', 'ILS');
INSERT INTO COUNTRY VALUES ('Italy', 'Europe', 60461826, 294140, 'Sergio Mattarella', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Jamaica', 'North America', 2961167, 10830, 'Andrew Holness', 'Constitutional monarchy', 'JMD');
INSERT INTO COUNTRY VALUES ('Japan', 'Asia', 126476461, 364555, 'Yoshihide Suga', 'Constitutional monarchy', 'JPY');
INSERT INTO COUNTRY VALUES ('Jordan', 'Asia', 10203134, 88780, 'Bisher Al-Khasawneh', 'Constitutional monarchy', 'JOD');
INSERT INTO COUNTRY VALUES ('Kazakhstan', 'Africa', 18776707, 2699700, 'Qasym-Zhomart Toqaev', 'Republic', 'KZT');
INSERT INTO COUNTRY VALUES ('Kenya', 'Africa', 119449, 810, 'Uhuru Kenyatta', 'Republic', 'KES');
INSERT INTO COUNTRY VALUES ('Kiribati', 'Oceania', 4270571, 17820, 'Taneti Maamau', 'Republic', 'AUD');
INSERT INTO COUNTRY VALUES ('Kuwait', 'Asia', 4270571, 17820, 'Sabah Al-Khalid Al-Sabah', 'Constitutional monarchy', 'KWD');
INSERT INTO COUNTRY VALUES ('Kyrgyzstan', 'Asia', 6524195, 191800, 'Sadyr Japarov', 'Republic', 'KGS');
INSERT INTO COUNTRY VALUES ('Laos', 'Asia', 7275560, 230800, 'Thongloun Sisoulith', 'Republic', 'LAK');
INSERT INTO COUNTRY VALUES ('Latvia', 'Europe', 1886198, 62200, 'Egils Levits', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Lebanon', 'Asia', 10230, 6825445, 'Michel Aoun', 'Republic', 'LBP');
INSERT INTO COUNTRY VALUES ('Lesotho', 'Africa', 2142249, 30360, 'Moeketsi Majoro', 'Constitutional monarchy', 'LSL');
INSERT INTO COUNTRY VALUES ('Liberia', 'Africa', 5057681, 96320, 'George Weah', 'Republic', 'LRD');
INSERT INTO COUNTRY VALUES ('Libya', 'Africa', 6871292, 1759540, 'Mohamed al-Menfi', 'Provisional', 'LYD');
INSERT INTO COUNTRY VALUES ('Liechtenstein', 'Europe', 38128, 160, 'Daniel Risch', 'Constitutional monarchy', 'CHF');
INSERT INTO COUNTRY VALUES ('Lithuania', 'Europe', 2722289, 62674, 'Gitanas Nauseda', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Luxembourg', 'Europe', 625978, 2590, 'Xavier Bettel', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Madagascar', 'Africa', 27691018, 581785, 'Andry Rajoelina', 'Republic', 'MGA');
INSERT INTO COUNTRY VALUES ('Malawi', 'Africa', 19129952, 94280, 'Lazarus Chakwera', 'Republic', 'MWK');
INSERT INTO COUNTRY VALUES ('Malaysia', 'Asia', 32365999, 328550, 'Muhyiddin Yassin', 'Constitutional monarchy', 'MYR');
INSERT INTO COUNTRY VALUES ('Maldives', 'Asia', 540544, 300, 'Ibrahim Mohamed Solih', 'Republic', 'MVR');
INSERT INTO COUNTRY VALUES ('Mali', 'Africa', 20250833, 1220190, 'Assimi Goita', 'Provisional', 'XOF');
INSERT INTO COUNTRY VALUES ('Malta', 'Europe', 441543, 320, 'George Vella', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Marshall Islands', 'Oceania', 59190, 180, 'David Kabua', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Mauritania', 'Africa', 4649658, 1030700, 'Mohamed Ould Ghazouani', 'Republic', 'MRU');
INSERT INTO COUNTRY VALUES ('Mauritius', 'Africa', 1271768, 2030, 'Prithvirajsing Roopun', 'Republic', 'MUR');
INSERT INTO COUNTRY VALUES ('Mexico', 'North America', 128932753, 1943950, 'Andres Manuel López Obrador', 'Republic', 'MXN');
INSERT INTO COUNTRY VALUES ('Micronesia', 'Oceania', 548914, 700, 'David W Panuelo', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Moldova', 'Europe', 4033963, 32850, 'Maia Sandu', 'Republic', 'MDL');
INSERT INTO COUNTRY VALUES ('Monaco', 'Europe', 39242, 1, 'Pierre Dartout', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Mongolia', 'Asia', 3278290, 1553560, 'Khaltmaagiin Battulga', 'Republic', 'MNT');
INSERT INTO COUNTRY VALUES ('Montenegro', 'Europe', 628066, 13450, 'Milo ?ukanovi?', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Morocco', 'Africa', 36910560, 446300, 'Saadeddine Othmani', 'Constitutional monarchy', 'MAD');
INSERT INTO COUNTRY VALUES ('Mozambique', 'Africa', 31255435, 786380, 'Filipe Nyusi', 'Republic', 'MZN');
INSERT INTO COUNTRY VALUES ('Myanmar', 'Asia', 54409800, 653290, 'Min Aung Hlaing', 'Provisional', 'MMK');
INSERT INTO COUNTRY VALUES ('Namibia', 'Africa', 2540905, 823290, 'Hage Geingob', 'Republic', 'NAD');
INSERT INTO COUNTRY VALUES ('Nauru', 'Oceania', 10824, 20, 'Lionel Aingimea', 'Republic', 'AUD');
INSERT INTO COUNTRY VALUES ('Nepal', 'Asia', 29136808, 143350, 'Bidhya Devi Bhandari', 'Republic', 'NPR');
INSERT INTO COUNTRY VALUES ('Netherlands', 'Europe', 17134872, 33720, 'Mark Rutte', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('New Zealand', 'Oceania', 4822233, 263310, 'Jacinda Ardern', 'Constitutional monarchy', 'NZD');
INSERT INTO COUNTRY VALUES ('Nicaragua', 'North America', 6624554, 120340, 'Daniel Ortega', 'Republic', 'NIO');
INSERT INTO COUNTRY VALUES ('Niger', 'Africa', 24206644, 1266700, 'Mohamed Bazoum', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Nigeria', 'Africa', 206139589, 910770, 'Muhammadu Buhari', 'Republic', 'NGN');
INSERT INTO COUNTRY VALUES ('North Korea', 'Asia', 25778816, 120410, 'Kim Jong-un', 'Republic', 'KPW');
INSERT INTO COUNTRY VALUES ('North Macedonia', 'Europe', 2083374, 25220, 'Stevo Pendarovski', 'Republic', 'MKD');
INSERT INTO COUNTRY VALUES ('Norway', 'Europe', 5421241, 365268, 'Erna Solberg', 'Constitutional monarchy', 'NOK');
INSERT INTO COUNTRY VALUES ('Oman', 'Asia', 5106626, 309500, 'Haitham bin Tariq', 'Absolute monarchy', 'OMR');
INSERT INTO COUNTRY VALUES ('Pakistan', 'Asia', 220892340, 770880, 'Arif Alvi', 'Republic', 'PKR');
INSERT INTO COUNTRY VALUES ('Palau', 'Oceania', 18094, 460, 'Surangel Whipps Jr', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Palestine State', 'Asia', 5101414, 6020, 'Mahmoud Abbas', 'Republic', 'ILS');
INSERT INTO COUNTRY VALUES ('Panama', 'North America', 4314767, 74340, 'Laurentino Cortizo', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Papua New Guinea', 'Oceania', 8947024, 452860, 'James Marape', 'Constitutional monarchy', 'PGK');
INSERT INTO COUNTRY VALUES ('Paraguay', 'South America', 7132538, 397300, 'Mario Abdo Benítez', 'Republic', 'PYG');
INSERT INTO COUNTRY VALUES ('Peru', 'South America', 32971854, 1280000, 'Francisco Sagasti', 'Republic', 'PEN');
INSERT INTO COUNTRY VALUES ('Philippines', 'Asia', 109581078, 298170, 'Rodrigo Duterte', 'Republic', 'PHP');
INSERT INTO COUNTRY VALUES ('Poland', 'Europe', 37846611, 306230, 'Andrzej Duda', 'Republic', 'PLN');
INSERT INTO COUNTRY VALUES ('Portugal', 'Europe', 10196709, 91590, 'Marcelo Rebelo de Sousa', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Qatar', 'Asia', 2881053, 11610, 'Khalid bin Khalifa bin Abdul Aziz Al Thani', 'Constitutional monarchy', 'QAR'); 
INSERT INTO COUNTRY VALUES ('Romania', 'Europe', 19237691, 230170, 'Klaus Iohannis', 'Republic', 'RON');
INSERT INTO COUNTRY VALUES ('Russia', 'Europe', 145934462, 16376870, 'Vladimir Putin', 'Republic', 'RUB');
INSERT INTO COUNTRY VALUES ('Rwanda', 'Africa', 12952218, 24670, 'Paul Kagame', 'Republic', 'RWF');
INSERT INTO COUNTRY VALUES ('Saint Kitts and Nevis', 'North America', 53199, 260, 'Timothy Harris', 'Constitutional monarchy', 'XCD');
INSERT INTO COUNTRY VALUES ('Saint Lucia', 'North America', 53199, 260, 'Allen Chastanet', 'Constitutional monarchy', 'XCD');
INSERT INTO COUNTRY VALUES ('Saint Vincent and the Grenadines', 'North America', 183627, 610, 'Ralph Gonsalves', 'Constitutional monarchy', 'XCD');
INSERT INTO COUNTRY VALUES ('Samoa', 'Oceania', 198414, 2830, 'Tuimalealiifano Vaaletoa Sualauvi II', 'Republic', 'WST');
INSERT INTO COUNTRY VALUES ('San Marino', 'Europe', 33931, 60,  'Gian Carlo Venturini', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Sao Tome and Principe', 'North America', 219159, 960, 'Evaristo Carvalho', 'Republic', 'STN');
INSERT INTO COUNTRY VALUES ('Saudi Arabia', 'Asia', 34813871, 2149690, 'Salman', 'Absolute monarchy', 'SAR');
INSERT INTO COUNTRY VALUES ('Senegal', 'Africa', 16743927, 192530, 'Macky Sall', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Serbia', 'Europe', 8737371, 87460, 'Aleksandar Vu?i?', 'Republic', 'RSD');
INSERT INTO COUNTRY VALUES ('Seychelles', 'Africa', 98347, 460, 'Wavel Ramkalawan', 'Republic', 'SCR');
INSERT INTO COUNTRY VALUES ('Sierra Leone', 'Africa', 7976983, 72180, 'Julius Maada Bio', 'Republic', 'SLL');
INSERT INTO COUNTRY VALUES ('Singapore', 'Asia', 5850342, 700, 'Halimah Yacob', 'Republic', 'SGD');
INSERT INTO COUNTRY VALUES ('Slovakia', 'Europe', 5459642, 48088, 'Zuzana ?aputová', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Slovenia', 'Europe', 2078938, 20140, 'Borut Pahor', 'Republic', 'EUR');
INSERT INTO COUNTRY VALUES ('Solomon Islands', 'Africa', 686884, 27990, 'Manasseh Sogavare', 'Constitutional monarchy', 'SBD');
INSERT INTO COUNTRY VALUES ('Somalia', 'Africa', 15893222, 627340, 'Mohamed Abdullahi Mohamed', 'Republic', 'SOS');
INSERT INTO COUNTRY VALUES ('South Africa', 'Africa', 59308690, 1213090, 'Cyril Ramaphosa', 'Republic', 'ZAR');
INSERT INTO COUNTRY VALUES ('South Korea', 'Asia', 51269185, 97230, 'Moon Jaein', 'Republic', 'KRW');
INSERT INTO COUNTRY VALUES ('South Sudan', 'Africa', 11193725, 610952, 'Salva Kiir Mayardit', 'Republic', 'SSP');
INSERT INTO COUNTRY VALUES ('Spain', 'Europe', 46754778, 498800, 'Pedro Sánchez', 'Constitutional monarchy', 'EUR');
INSERT INTO COUNTRY VALUES ('Sri Lanka', 'Africa', 21413249, 62710, 'Gotabaya Rajapaksa', 'Republic', 'LKR');
INSERT INTO COUNTRY VALUES ('Sudan', 'Africa', 43849260, 1765048, 'Abdel Fattah alBurhan', 'Provisional', 'SDG');
INSERT INTO COUNTRY VALUES ('Suriname', 'Africa', 586632, 156000, 'Chan Santokhi', 'Republic', 'SRD');
INSERT INTO COUNTRY VALUES ('Sweden', 'Europe', 10099265, 410340, 'Stefan Löfven', 'Constitutional monarchy', 'SEK');
INSERT INTO COUNTRY VALUES ('Switzerland', 'Europe', 8654622, 39516, 'Guy Parmelin', 'Republic', 'CHF');
INSERT INTO COUNTRY VALUES ('Tajikistan', 'Asia', 9537645, 139960, 'Emomali Rahmon', 'Republic', 'TJS');
INSERT INTO COUNTRY VALUES ('Tanzania', 'Africa', 59734218, 885800, 'Samia Suluhu Hassan', 'Republic', 'TZS');
INSERT INTO COUNTRY VALUES ('Thailand', 'Asia', 69799978, 510890, 'Prayut Chanocha', 'Constitutional monarchy', 'THB');
INSERT INTO COUNTRY VALUES ('Timor Leste', 'Asia', 1318445, 14870, 'Francisco Guterres', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Togo', 'Africa', 8278724, 54390, 'Faure Gnassingbé', 'Republic', 'XOF');
INSERT INTO COUNTRY VALUES ('Tonga', 'Oceania', 105695, 720, 'P?hiva Tuionetoa', 'Constitutional monarchy', 'TOP');
INSERT INTO COUNTRY VALUES ('Trinidad and Tobago', 'North America', 1399488, 5130, 'Paula Mae Weekes', 'Republic', 'TTD');
INSERT INTO COUNTRY VALUES ('Tunisia', 'Africa', 11818619, 155360, 'Kaïs Saïed', 'Republic', 'TND');
INSERT INTO COUNTRY VALUES ('Turkey', 'Asia', 84339067, 769630, 'Recep Tayyip Erdo?an', 'Republic', 'TRY');
INSERT INTO COUNTRY VALUES ('Turkmenistan', 'Asia', 6031200, 469930, 'Gurbanguly Berdimuhamedow', 'Republic', 'TMT');
INSERT INTO COUNTRY VALUES ('Tuvalu', 'Oceania', 11792, 30, 'Kausea Natano', 'Constitutional monarchy', 'AUD');
INSERT INTO COUNTRY VALUES ('Uganda', 'Africa', 45741007, 199810, 'Yoweri Museveni', 'Republic', 'UGX');
INSERT INTO COUNTRY VALUES ('Ukraine', 'Europe', 43733762, 579320, 'Volodymyr Zelensky', 'Republic', 'UAH');
INSERT INTO COUNTRY VALUES ('United Arab Emirates', 'Asia', 9890402, 83600, 'Khalifa bin Zayed Al Nahyan', 'Constitutional monarchy', 'AED');
INSERT INTO COUNTRY VALUES ('United Kingdom', 'Europe', 67886011, 241930, 'Boris Johnson', 'Constitutional monarchy', 'GBP');
INSERT INTO COUNTRY VALUES ('United States of America', 'North America',331002651, 9147420, 'Joe Biden', 'Republic', 'USD');
INSERT INTO COUNTRY VALUES ('Uruguay', 'South America', 3473730, 175020, 'Luis Lacalle Pou', 'Republic', 'UYU');
INSERT INTO COUNTRY VALUES ('Uzbekistan', 'Asia', 33469203, 425400, 'Shavkat Mirziyoyev', 'Republic', 'UZS');
INSERT INTO COUNTRY VALUES ('Vanuatu', 'Oceania', 307145, 12190, 'Tallis Obed Moses', 'Republic', 'VUV');
INSERT INTO COUNTRY VALUES ('Venezuela', 'South America', 28435940, 882050, 'Nicolás Maduro', 'Republic', 'VES');
INSERT INTO COUNTRY VALUES ('Vietnam', 'Asia', 97338579, 310070, 'Nguy?n Phú Tr?ng', 'Republic', 'VND');
INSERT INTO COUNTRY VALUES ('Yemen', 'Asia', 29825964, 527970, 'Abdrabbuh Mansur Hadi', 'Provisional', 'YER');
INSERT INTO COUNTRY VALUES ('Zambia', 'Africa', 18383955, 743390, 'Edgar Lungu', 'Republic', 'ZMW');
INSERT INTO COUNTRY VALUES ('Zimbabwe', 'Africa', 14862924, 386850, 'Emmerson Mnangagwa', 'Republic', 'USD');

insert into isspokenin values ('Australia', 'English');
insert into isspokenin values ('Bahamas', 'English');
insert into isspokenin values ('Barbados', 'English');
insert into isspokenin values ('Belize', 'English');
insert into isspokenin values ('Botswana', 'English');
insert into isspokenin values ('Brunei', 'English');
insert into isspokenin values ('Burundi', 'English');
insert into isspokenin values ('Cameroon', 'English');
insert into isspokenin values ('Canada', 'English');
insert into isspokenin values ('Dominica', 'English');
insert into isspokenin values ('Ethiopia', 'English');
insert into isspokenin values ('Fiji', 'English');
insert into isspokenin values ('Gambia', 'English');
insert into isspokenin values ('Ghana', 'English');
insert into isspokenin values ('Grenada', 'English');
insert into isspokenin values ('Guyana', 'English');
insert into isspokenin values ('India', 'English');
insert into isspokenin values ('Ireland', 'English');
insert into isspokenin values ('Jamaica', 'English');
insert into isspokenin values ('Kenya', 'English');
insert into isspokenin values ('Kiribati', 'English');
insert into isspokenin values ('Lesotho', 'English');
insert into isspokenin values ('Liberia', 'English');
insert into isspokenin values ('Malawi', 'English');
insert into isspokenin values ('Malaysia', 'English');
insert into isspokenin values ('Malta', 'English');
insert into isspokenin values ('Marshall Islands', 'English');
insert into isspokenin values ('Mauritius', 'English');
insert into isspokenin values ('Namibia', 'English');
insert into isspokenin values ('Nauru', 'English');
insert into isspokenin values ('New Zealand', 'English');
insert into isspokenin values ('Nigeria', 'English');
insert into isspokenin values ('Niue', 'English');
insert into isspokenin values ('Norfolk Island', 'English');
insert into isspokenin values ('Pakistan', 'English');
insert into isspokenin values ('Palau', 'English');
insert into isspokenin values (i, 'English');
insert into isspokenin values ('Philippines', 'English');
insert into isspokenin values ('Rwanda', 'English');
insert into isspokenin values ('Saint Kitts and Nevis', 'English');
insert into isspokenin values ('Saint Lucia', 'English');
insert into isspokenin values ('Saint Vincent and the Grenadines', 'English');
insert into isspokenin values ('Samoa', 'English');
insert into isspokenin values ('Seychelles', 'English');
insert into isspokenin values ('Sierra Leone', 'English');
insert into isspokenin values ('Singapore', 'English');
insert into isspokenin values ('Solomon Islands', 'English');
insert into isspokenin values ('South Sudan', 'English');
insert into isspokenin values ('Sudan', 'English');
insert into isspokenin values ('Tanzania', 'English');
insert into isspokenin values ('Tonga', 'English');
insert into isspokenin values ('Trinidad and Tobago', 'English');
insert into isspokenin values ('Tuvalu', 'English');
insert into isspokenin values ('Uganda', 'English');
insert into isspokenin values ('United Kingdom', 'English');
insert into isspokenin values ('United States', 'English');
insert into isspokenin values ('Vanuatu', 'English');
insert into isspokenin values ('Zambia', 'English');
insert into isspokenin values ('Andorra', 'French');
insert into isspokenin values ('Belgium', 'French');
insert into isspokenin values ('Benin', 'French');
insert into isspokenin values ('Burkina Faso', 'French');
insert into isspokenin values ('Burundi', 'French');
insert into isspokenin values ('Cameroon', 'French');
insert into isspokenin values ('Canada', 'French');
insert into isspokenin values ('Central African Republic', 'French');
insert into isspokenin values ('Chad', 'French');
insert into isspokenin values ('Comoros', 'French');
insert into isspokenin values ('Republic of the Congo', 'French');
insert into isspokenin values ('Democratic Republic of the Congo', 'French');
insert into isspokenin values ('Djibouti', 'French');
insert into isspokenin values ('Equatorial Guinea', 'French');
insert into isspokenin values ('France', 'French');
insert into isspokenin values ('Gabon', 'French');
insert into isspokenin values ('Guinea', 'French');
insert into isspokenin values ('Haiti', 'French');
insert into isspokenin values ('Ivory Coast', 'French');
insert into isspokenin values ('Madagascar', 'French');
insert into isspokenin values ('Mali', 'French');
insert into isspokenin values ('Monaco', 'French');
insert into isspokenin values ('Niger', 'French');
insert into isspokenin values ('Rwanda', 'French');
insert into isspokenin values ('Senegal', 'French');
insert into isspokenin values ('Seychelles', 'French');
insert into isspokenin values ('Switzerland', 'French');
insert into isspokenin values ('Togo', 'French');
insert into isspokenin values ('Tunisia', 'French');
insert into isspokenin values ('Vanuatu', 'French');
insert into isspokenin values ('Bahrain','Arabic');
insert into isspokenin values ('Chad','Arabic');
insert into isspokenin values ('Comoros','Arabic');
insert into isspokenin values ('Djibouti','Arabic');
insert into isspokenin values ('Egypt','Arabic');
insert into isspokenin values ('Iraq','Arabic');
insert into isspokenin values ('Jordan','Arabic');
insert into isspokenin values ('Kuwait','Arabic');
insert into isspokenin values ('Lebanon','Arabic');
insert into isspokenin values ('Libya','Arabic');
insert into isspokenin values ('Morocco','Arabic');
insert into isspokenin values ('Mauritania','Arabic');
insert into isspokenin values ('Yemen','Arabic');
insert into isspokenin values ('United Arab Emirates','Arabic');
insert into isspokenin values ('Tunis','Arabic');
insert into isspokenin values ('Syria','Arabic');
insert into isspokenin values ('Sudan','Arabic');
insert into isspokenin values ('Somalia','Arabic');
insert into isspokenin values ('Saudi Arabia','Arabic');
insert into isspokenin values ('Qatar','Arabic');
insert into isspokenin values ('Palestine','Arabic');
insert into isspokenin values ('Oman','Arabic');
insert into isspokenin values ('Argentina', 'Spanish');
insert into isspokenin values ('Chile', 'Spanish');
insert into isspokenin values ('Columbia', 'Spanish');
insert into isspokenin values ('Spain', 'Spanish');
insert into isspokenin values ('Costa Rica', 'Spanish');
insert into isspokenin values ('Cuba', 'Spanish');
insert into isspokenin values ('Dominican Republic', 'Spanish');
insert into isspokenin values ('Ecuador', 'Spanish');
insert into isspokenin values ('El Salvador', 'Spanish');
insert into isspokenin values ('Equatorial Guinea', 'Spanish');
insert into isspokenin values ('Guatemala', 'Spanish');
insert into isspokenin values ('Honduras', 'Spanish');
insert into isspokenin values ('Mexico', 'Spanish');
insert into isspokenin values ('Nicaragua', 'Spanish');
insert into isspokenin values ('Panama', 'Spanish');
insert into isspokenin values ('Paraguay', 'Spanish');
insert into isspokenin values ('Venezuela', 'Spanish');

insert into unionofcountries values('European Union', '01-NOV-93');

insert into isin values('European Union', 'Austria');
insert into isin values('European Union', 'Belgium');
insert into isin values('European Union', 'Bulgaria');
insert into isin values('European Union', 'Croatia');
insert into isin values('European Union', 'Cyprus');
insert into isin values('European Union', 'Czech Republic');
insert into isin values('European Union', 'Denmark');
insert into isin values('European Union', 'Estonia');
insert into isin values('European Union', 'Finland');
insert into isin values('European Union', 'Germany');
insert into isin values('European Union', 'Greece');
insert into isin values('European Union', 'Hungary');
insert into isin values('European Union', 'Ireland');
insert into isin values('European Union', 'Italy');
insert into isin values('European Union', 'Latvia');
insert into isin values('European Union', 'Lithuania')
insert into isin values('European Union', 'Malta');
insert into isin values('European Union', 'Luxembourg');
insert into isin values('European Union', 'Netherlands');
insert into isin values('European Union', 'Poland');
insert into isin values('European Union', 'Portugal');
insert into isin values('European Union', 'Romania');
insert into isin values('European Union', 'Slovakia');
insert into isin values('European Union', 'Slovenia');
insert into isin values('European Union', 'Spain');
insert into isin values('European Union', 'Sweden');

insert into inconflict values ('Serbia', 'Croatia', '06-FEB-1991')
insert into inconflict values ('India', 'Pakistan', '10-Oct-1965')
insert into inconflict values (‘Japan’, ‘China’, ’05-Nov-1937’)
insert into inconflict values ('Turkey', 'Armenia', '24-Sep-1920'); 
insert into inconflict values ('Turkey', 'Greece', '30-Jun-1919');
 
insert into inconflict(countryname1, countryname2) values ('Ireland', 'United Kingdom');
insert into inconflict(countryname1, countryname2) values ('Ghana', 'Nigeria');
insert into inconflict values ('Iran', 'Saudi Arabia', '11-feb-1979');

insert into notablefigures (firstname,lastname,bornin,sex) values ('Gibran','Khalil', 'Lebanon', 'Male');
insert into notablefigures(firstname,lastname,bornin,sex) values ('Edith','Piaf', 'France', 'Female');
insert into notablefigures(firstname,lastname,bornin,sex) values ('Charles','Aznavour', 'France', 'Male');
insert into notablefigures(firstname,lastname,bornin,sex) values ('Stephen','Hawking', 'United Kingdom', 'Male');
insert into notablefigures(firstname,lastname,bornin,sex) values ('Frida','Kahlo', 'Mexico', 'Female');
insert into notablefigures(firstname,lastname,bornin,sex) values ('Najwa','Karam', 'Lebanon', 'Female');
insert into notablefigures values ('Nassim','Taleb', 'Lebanon','61', 'Male');
insert into notablefigures values ('Elon','Musk', 'South Africa','49', 'Male');

insert into profession_notable_figure values ('Gibran','Khalil','Philosopher', 'Lebanon');
insert into profession_notable_figure values ('Gibran','Khalil','Writer', 'Lebanon');
insert into profession_notable_figure values ('Gibran','Khalil','Poet', 'Lebanon');
insert into profession_notable_figure values ('Elon','Musk','Engineer', 'South Africa');
insert into profession_notable_figure values ('Elon','Musk','Businessman', 'South Africa');
insert into profession_notable_figure values ('Edith','Piaf', 'France','Singer'); 
insert into profession_notable_figure values ('Stephen','Hawking','Physicist', 'United Kingdom');
insert into profession_notable_figure values ('Charles','Aznavour', 'Singer', 'France');
insert into profession_notable_figure values ('Frida','Kahlo','Painter', 'Mexico');
insert into profession_notable_figure values ('Najwa','Karam','Singer' ,'Lebanon');
insert into profession_notable_figure values ('Nassim','Taleb','Writer', 'Lebanon');
insert into profession_notable_figure values ('Nassim','Taleb','Statistician', 'Lebanon');
insert into profession_notable_figure values ('Charles', 'Aznavour', 'Singer', 'France');

/* QUERIES */

/*query 1: finding the number of people who speak each language in each continent*/
SELECT  sum(c.population) NbOfSpeakers, c.continentname Continent, s.languagename Language
FROM country c, isspokenin s
WHERE c.countryname = s.countryname
GROUP BY c.continentname, s.languagename;

/*query 2: finding the name of countries in conflict with many countries, and their respective opponents*/

select i.countryname1, i.countryname2
from inconflict i
where (select count(*) from inconflict i1 where i1.countryname1=i.countryname1 or i1.countryname2 = i.countryname2 or i1.countryname1 = i.countryname2 or i1.countryname2 = i.countryname1)>1

/*query 3: finding population density*/

select population/area PopulationDensity, countryname
from country

/*query 4: finding countries that have notable figures*/

select c.countryname
from country c
where exists (select * from notablefigures n where n.bornin = c.countryname);

/*query 5: finding the names, countries of origin and professions of notable figures that have more than 1 profession*/

select firstname, lastname, bornin, profession
from profession_notable_figures p
where (select count(*) from profession_notable_figures p1 where p.firstname=p1.firstname, p1.lastname=p.lastname, p.bornin=p1.bornin)>1

/*query 6: finding the name, president and currency of countries that belong to a union and whose president's name starts with E*/

select c.countryname, c.president, c.currency
from country c
where c.president like 'E%' and (c.countryname in (select countryname from isin i1 where c.countryname=i1.countryname ));

/*query 7: finding countries in civil war (war with themselves)*/

select countryname1, i.startdate
from inconflict i
where countryname1=countryname2;
