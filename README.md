# Ardoonga
RPG Engine with plugins

Oto silnik RPG jako usługa. Twórcy gier będą dostarczać opisy, zdjęcia i statystyki. A ja zamienię je na działającą grę w stylu Vallheru. Samemu korzystając z usług firm zarządzających serwerami i bazami danych. 

---

<details>
  <summary>Zasada działania Ardoongi:</summary>

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
- Labirynty = [Twine](https://twinery.org/) + wtyczki w Web Components.

Jeśli chodzi o konta administratorów [RelMe](https://microformats.org/wiki/rel-me) wydaje się jedynym rozwiązaniem. <br />
Zarządzanie użytkownikami lepiej powierzyć Auth0. Z dodatkową możliwością zalogowania się z Ethereum. <br />
</details>

<details>
  <summary>Faza1: Static Site Generator + Postman Mockup</summary>
  
  https://replit.com/@onliniak/ArchipelagGenerator#main.cr
  https://www.postman.com/onliniak/workspace/archipelag/overview
  
  Archipelag to poprzednia nazwa.
</details>

<details>
  <summary>Faza0: JSON Schema as configuration files</summary>
  Jeszcze nic nie ma.
</details>
