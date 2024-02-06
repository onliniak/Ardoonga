# Archipelag
RPG WebGame Engine

Dawno, dawno temu - jeszcze przed Covidem - grałem sobie w klona Vallheru 1.6. Stwierdziliśmy z jednym graczem, że pora unowocześnić tę grę. 
A że oryginalny kod to czarna magia wpadłem na pomysł, by wyrzucić go i zacząć od nowa. Prac nigdy nie zacząłem w obawie przed późniejszym utrzymaniem 
serwerów i zerowej wiedzy o wydajności, czy bezpieczeństwie.

Dzięki sztucznej inteligencji wszystko stało się prostsze. Tak czysto teoretycznie wystarczy jeśli napiszę generator API oparty o [Smithy](https://smithy.io/2.0/index.html) i wyraźnie 
oddzielę część twórczą od technicznej. Jedynym wymaganiem jest Jinja jako język szablonów i [WASM](https://github.com/bytecodealliance/wasm-micro-runtime/blob/main/doc/embed_wamr.md). Chcę, by wtyczki napisane przez użytkowników działały wszędzie. Oni tworzą miasta, rasy, klasy i wzory matematyczne, a zdecentralizowane serwery zajmą się całym backendem. Prace nad paczką standardową (bardziej demo) prowadzone będą w innym repozytorium. W tym chcę napisać program, który napisze mi testy oraz kod serwera na podstawie próbek mojego kodu.

<details> <summary>Dawniej miałem w README notatki z wstępnymi szkicami całego systemu. Zachowałem sobie jedynie wzór na rzemiosło i mapę świata.</summary>

```ruby
trait     = 10 # Kowalstwo
skill     = 5  # Siła
playerlvl = 1
energy    = 1
itemlvl   = 1

  score = Math.hypot(playerlvl, itemlvl)          # Im więcej tym gorzej, drugi wyraz jest silniejszy
  power = Math.log(skill**trait, score)/10*energy # Pierwszy wyraz w log zwiększa szansę, a drugi ogranicza
  difficulty = power/itemlvl
  puts difficulty.to_i

# Niskie poziomy użytkownika zużywają mniej energii
# Kowalstwo (Atrybut) jest ważniejsze od siły (Umiejętności)
# Wysoka siła zapewnia boost na niższych poziomach kowalstwa
# Energia wciąż jest kluczem do wszystkiego
```

<math xmlns="http://www.w3.org/1998/Math/MathML"><mtable class="tml-jot tml-abut" style="width:100%;" displaystyle="true" columnalign="left center right"><mtr><mtd style="padding:0;width:50%;"><mo>&#xA0;</mo></mtd><mtd><mi>&#x3c3;</mi><mo>=</mo><msqrt><mrow><mi>p</mi><mi>l</mi><mi>a</mi><mi>y</mi><mi>e</mi><mi>r</mi><mi>l</mi><mi>v</mi><msup><mi>l</mi><mn>2</mn></msup><mo>+</mo><mi>i</mi><mi>t</mi><mi>e</mi><mi>m</mi><mi>l</mi><mi>v</mi><msup><mi>l</mi><mn>2</mn></msup></mrow></msqrt></mtd><mtd style="padding:0;width:50%;text-align:-webkit-right;"><mo>&#xA0;</mo></mtd></mtr><mtr><mtd style="padding:0;width:50%;"><mo>&#xA0;</mo></mtd><mtd><mi>p</mi><mi>o</mi><mi>w</mi><mi>e</mi><mi>r</mi><mo>=</mo><msub><mi>log</mi><mi>&#x3c3;</mi></msub><mo>&#x2061;</mo><mspace width="0.1667em"/><mi>s</mi><mi>k</mi><mi>i</mi><mi>l</mi><msup><mi>l</mi><mrow><mi>t</mi><mi>r</mi><mi>a</mi><mi>i</mi><mi>t</mi></mrow></msup><mo lspace="0em" rspace="0em">&#x2044;</mo><mn>10</mn><mo>*</mo><mi>e</mi><mi>n</mi><mi>e</mi><mi>r</mi><mi>g</mi><mi>y</mi></mtd><mtd style="padding:0;width:50%;text-align:-webkit-right;"><mo>&#xA0;</mo></mtd></mtr><mtr><mtd style="padding:0;width:50%;"><mo>&#xA0;</mo></mtd><mtd><mo movablelimits="false">&#x2211;</mo><mo>=</mo><mi>p</mi><mi>o</mi><mi>w</mi><mi>e</mi><mi>r</mi><mo lspace="0em" rspace="0em">&#x2044;</mo><mi>i</mi><mi>t</mi><mi>e</mi><mi>m</mi><mi>l</mi><mi>v</mi><mi>l</mi></mtd><mtd style="padding:0;width:50%;text-align:-webkit-right;"><mo>&#xA0;</mo></mtd></mtr></mtable></math>

<p><span class="math display">
$$\sigma = \sqrt{playerlvl^{2} + itemlvl^{2}}  \newline
power = \log_\sigma{skill^{trait}} / 10*energy \newline
\sum = power/itemlvl$$</span></p>

![Pierwsza wersja mapy świata](https://camo.githubusercontent.com/e0ddea796c36b5de02d0c6d8274a5837740f42fb2461b6fa8bde6696929cdfee/68747470733a2f2f692e696d6775722e636f6d2f465657487271332e706e67)
![Druga wersja mapy świata](https://i.imgur.com/H3atLXT.jpeg)
</details>
<details> <summary> Konwencja </summary>
  
* Metody nazywamy jak w [Rails](https://guides.rubyonrails.org/routing.html)ie.
* Niedozwolone jest używanie przedrostka Arch i Archipelag.
* Service to klasa, Operation to metoda ("definicja").
* Operacje zapisujemy jako HTTPmetodaKlasaFunkcja np. GetHarvestIndex.
* I/O kończymy przyrostkiem Input/Output.
* Przedrostek My wymaga autoryzacji.
* Przyrostek HTML renderuje plik z dysku serwera.
* Przyrostek Base oznacza klasę przeznaczoną tylko i wyłącznie do dziedziczenia.
  * Żeby rozszerzyć klasę base skopiuj ostatni fragment namespace i usuń przyrostek Base.
  * Na przykład namespace io.archipelag.Xz zamień na namespace cośtam.Xz, a service XzBase na service Xz.
* Nigdzie nie widzę by było to zabronione, więc @required service oznacza interfejs (klasę abstrakcyjną).
* Ardoonga będzie nazwą organizacji oraz paczki standardowej. Archipelag to nazwa silnika.
* Komentarze w stylu Haskell Guards zostawiłem sobie na sytuacje w stylu jeśli jestem zalogowany wyświetl A, a jeśli nie wyświetl B.
  
</details>
<!-- <details> <summary> Bezpieczeństwo </summary>
  
  * HTML nie jest większym problemem. Wystarczy przejściówka Jinja → Sanitizer → ECR + OWASP.
  * Wzory matematyczne będzie można podać generatorowi w postaci LaTex.
    * Myślałem też nad WASM, czy nawet seccomp ale coś takiego wymagałoby już wiedzy.
    * Nawet gdyby było to opcjonalne maksymalny czas wykonywania = 5 µs.
      * W przybliżeniu odpowiada to 1 µs kodu realnego.
    * W sumie … o ile nie ma błędu dostęp do kodu w innym namespace będzie utrudniony.
  
</details> -->
<-- <details> <summary> Bitcoin-like | PHP | i takie tam </summary>
  Prędzej czy później serwery padną. Dlatego świetnym pomysłem będzie uzależnienie się od serwisu, nad którym nie mam kontroli. 
  Wystarczy, że będzie tam działała bieda kopia blockchaina. Jakiś czas temu trafiłem na [darmowy serwer WebSockets](https://piehost.com/blog/free-websocket-server). 
  Przypominam, że zarówno serwery jak i przeglądarki mogą łączyć się z WebSocketami bez większego problemu. 
  Mamy też praktycznie gotowy szkic protokołu rzekomo automatycznie-się-naprawiającego. Tym bardziej, że u mnie nie ma żadnego kopania. 

  Serwery wysyłają wiadomości w stylu JSON-RPC w świat. Każda taka wiadomość to transakcja. 
  Raz na godzinę serwer przywódca publikuje ID ostatniej transakcji w bloku. 
  Serwery sprawdzają, czy wszystkie bloki mają taki sam hash jak przywódcy. 
  Jeśli nie dopisujemy karę +1, jeśli mają +1 punkt. Jeśli przywódca będzie offline 
  serwer z największą ilością punktów zostaje nowym. Jeśli 2 mają identyczną liczbę to wygrywa starszy. 
  
  Wszystkie bloki będą do przejrzenia na GitHubie. 
  Transakcje zawierają informacje potrzebne do wywołania funkcji, bez jej wyniku. 
  Z tego powodu zamiast losowych generatorów liczb będziemy używać [obecnego](https://www.blockcypher.com/dev/ethereum/#introduction) hasza bloku Ethereum. 
  Nowe hasze będziemy pobierać co 36 sekund. Ewentualnie https://blockchain.info/latestblock. W obu przypadkach interesuje mnie lista numerów transakcji. 
  Jeśli każdy serwer będzie miał identyczny PRNG, a seed będzie losowo generowany z listy transakcji to powstanie skończona liczba wartości liczbowych. 
  Już widzę te poradniki w której sekundzie kliknąć, by wygrać.

  ---

  Z tego co wiem PHP nie da się obecnie użyć w WebAssembly. Jakiś czas temu trafiłem na [PH7](https://github.com/symisc/PH7). Może się przydać. 
  Zakładając, że zanim przestanie działać ktoś opracuje metodę zamiany PHP na WASM. Możliwości naprawy PH7 oceniam na zerowe.
</details>
