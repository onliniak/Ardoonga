# Ardoonga
RPG Engine with plugins

Tak właściwie nie jest to kompletna gra (jak Vallheru 1.6), a raczej platforma dla moderów. I nie mam najmniejszego pojęcia jak stworzyć wciągający, klimatyczny świat w stylu średniowiecznym.

---

Zasada działania Ardoongi:

- https://json-editor.github.io/json-editor/ umożliwia generowanie skryptów według schematu.
- Ardoonga Team tworzy, aktualizuje i usuwa przestarzałe schematy (JSON Schema 7).
- Generator SSG przetwarza skrypty konfiguracyjne.
- Treść ukryta jest wysyłana do serwera.
- Program nie jest świadomy istnienia miast, ras, klas.
- Z tego powodu można używać publicznego serwera. Nie trzeba nic konfigurować.
- Ze względu na balans kluczowe statystyki (jak zmęczenie) określa Ardoonga Team.
- Konto króla odpowiednio ograniczone.
- Serwer używa zdalnie pobieranych plików [WebAssembly](https://wapm.io/) do obliczeń (FaaS).
- Co umożliwia moderom zmianę mechaniki wedle swego życzenia.
- Wiadomości i strony profilowe są zapisywane w Amazon's S3.
- Dla rzemieślników możliwość zatrudnienia pracowników NPC i łatwiejsze zawieranie umów handlowych z graczami.
- Indywidualne statystyki i umiejętności (NoSQL lub JSON).

Jeśli chodzi o konta administratorów [RelMe](https://microformats.org/wiki/rel-me) wydaje się jedynym rozwiązaniem. <br />
Zarządzanie użytkownikami lepiej powierzyć Auth0. Z dodatkową możliwością zalogowania się z Ethereum. <br />

Fazy:

1. JSON Schema'sy.
2. SSG.
3. Interfejs mechaniczny.
4. Logowanie.
5. Serwer.

---

Od strony samych graczy … <br />
Myślałem nad prostym silnikiem fizycznym do walki mieczem. Coś na zasadzie mam 70 cm miecz w prawej ręce, wybieram sobie atak z boku, od góry lub po skosie. Atak mogę poprzedzić krokiem do przodu, czy półobrotem. Silnik oblicza w które miejsce i z jaką siłą uderzę. Wtedy oblicza jakość pancerza przeciwnika i jego zdolność do odbicia mojego ciosu. Bardziej realistyczna walka bronią, niszczenie zbroi i obrażenia. Ale jak wtedy wytłumaczyć walkę z wilkami i szczurami ?

Albo miksturki lecznicze. Coś takiego musiałoby dostarczyć energii + natychmiast zapobiec krwawieniu i zakażeniu ran. Jakaś mieszanka energetyków z lekami zagęszczającymi krew. Picie hektolitrów nieznanych eliksirów musiało skończyć się śmiercią.

Zrobię klona Orodlina będzie źle, zrobię coś nowego też będzie źle.
