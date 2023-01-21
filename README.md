# Ardoonga
RPG Engine with plugins

5 lat temu grałem sobie w zapomnianego przez świat [klona](http://ojci3c.webd.pl/magan/) Vallheru. [Właściwie to wtedy zacząłem się uczyć PHP, by zrozumieć jak wygrać.] Z jednym z graczy zaczęliśmy się zastanawiać jakby tu odmienić losy świata, przywrócić kosmiczną równowagę i takie tam. Stwierdziłem wtedy, że najprościej zrobić nową grę. Ostatecznie nic z tego nie wyszło, po prostu wiem że nie da się spełnić wszystkich oczekiwań ludziów. Po za tym ciężko jest skupić się na kilkunastu mini projektach jednocześnie. Taki pracownik … ten to musi mieć dobrze, dostaje wycinek projektu i nic więcej go nie interesuje. Ale skoro już zmarnowałem tyle czasu na badania … oto najważniejsze zmiany, które mogę w tej chwili wprowadzić albo powinienem ale jeszcze nie wiem jak.

## Funkcjonalność

### Wtyczki

Najważniejsza zmiana, której nikt nie doceni. Gra nie jest już świadoma ile właściwie ma miast, ras i klas. Możesz je zmienić praktycznie w każdej chwili. Problem w tym, że zaraz pojawią się głosy "Mogę skopiować [D&D 3.5](https://archive.org/details/dnd35srd)/[D&D 5](https://media.wizards.com/2016/downloads/DND/SRD-OGL_V5.1.pdf) ?", "A opisy i zdjęcia z Vallheru/Orodlina ?" albo jeszcze lepiej "weźmy przenieśmy cały świat z Władcy Pierścieni". Z wyznawcami GPL (Vallheru, Orodlin) nie ma żadnego problemu, z D&D raczej nie będzie problemu o ile wykorzystamy Basic Rules, ze wszystkim innym będą już problemy prawne.

### Indywidualne statystyki

Każdy gracz powinien mieć swoje własne statystyki, a nie że połowa strony jest w zerach.

### Wsparcie dla generatorów lochów

Zamiast tworzyć nowy generator można użyć [Twine](https://twinery.org/). Tylko ryzykuję, że pewnego dnia przestanie to działać.

W ogóle raz próbowałem się bawić w gracza fabularnego. Myślałem, że Mistrz Gry ogranicza się do opisywania kolejnych lokacji i wymyślania jak świat reaguje na najgłupsze zachowania w stylu zbuduję se procę i zaatakuję zamek od skrzyni. Może gdyby gracze mogli opisywać lokacje i zostawiać w nich przedmioty i wskazówki dla innych poszukiwaczy ?

### Blockchain

Teoretycznie można by wykorzystać darmowy serwer [WebSocket](https://www.piesocket.com/blog/free-websocket-server) oraz [Ethereum](https://api.blockcypher.com/v1/eth/main) jako podstawę uproszczonego blockchaina. W ten sposób gracze mogli by zamieniać energię w statystyki na swoich przeglądarkach. By wykluczyć oszustwa wybrani uczestnicy mieliby prawo do odrzucenia dowolnej transakcji. Co byłoby sprzeczne z zasadami Blockchaina.

### Walka

Cały czas się zastanawiam, czy przy pomocy wzorów fizycznych nie dałoby się zrobić automatycznego systemu walki. Wystarczyłoby dynamiczne przebijanie zbroi. Zamiast obrażeń i siły miecza, podawałoby się jego długość, materiał i wagę. Tyle że ostatnio powstało już parę gier o walce na miecze (Mount&Blade, Kingdom Deliverance, Hellish Quart) i parodia nie jest tu nikomu potrzebna.

### <s>Niemożliwa</s> Atmosfera ?

*Tutaj najważniejsza jest atmosfera, nie nabijanie statystyk. To gra tekstowa, więc jako gracz będziesz musiał wykazać się wyobraźnią i ciekawymi pomysłami.*

Wszystko ładnie, tyle że **ta gra to nic innego jak nabijanie statystyk**. Co z tego, że otworzyłem firmę budowlaną ? Że stałem się najlepszym rzemieślnikiem znanego świata ? Że zbudowałem klan na wyspie, który jako jedyny wiedział jak wygrać grę ? 99% czasu spędza się na klikaniu w miniaturowe linki i podnoszeniu statystyk do absurdalnych wielkości. Tak właściwie to autentyczne światy są bardzo rzadkie. Najbliżej jest Red Dead Redemption 2. Mi najprawdopodobniej nie uda się stworzyć niczego takiego.

### Rozmowy globalne

Obecnie mamy 2 standardy W3C (ActivityPub i MicroPub) oraz jeden prywatny standard Diaspory. I kilka mniejszych, których nikt nie używa. Wszystkie próbują odpowiedzieć na to samo pytanie - jak wysyłać wiadomości, eventy i polubienia między różnymi aplikacjami. Nawet Konfederacja włączyła się do [walki o wolność](https://twitter.com/krzysztofbosak/status/1348952744137285632). Problem w tym, że ActivityPub jest napisany ogólnie. Istnieje kilka wersji niekompatybilnych między sobą. I jeśli wprowadzę coś takiego to zaraz posypią się skargi "Dlaczego to nie działa jak Facebook ?", "dlaczego nie mogę wysłać wiadomości do Twittera ?", "X to otwarta sieć społecznościowa ale nie działa !!!". Z drugiej strony … jeśli tworzę grę opartą o wysyłanie wiadomości między sobą, możliwość rozmiawiania z całym światem byłaby cenna. Od strony kosztów mogę mieć jakieś 6.5 miliona wiadomości za darmo. Potem $0.015/GB.

Wewnętrznie użyłbym Diaspory API.

## Co dalej ?

Pewnie zamiast to wszystko opisywać powinienem zaprezentować przynajmniej jakiś demko. Teraz się tym zajmie.
