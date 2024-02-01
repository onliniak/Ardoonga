# Archipelag
RPG WebGame Engine

Dawno, dawno temu - jeszcze przed Covidem - grałem sobie w klona Vallheru 1.6. Stwierdziliśmy z jednym graczem, że pora unowocześnić tę grę. 
A że oryginalny kod to czarna magia wpadłem na pomysł, by wyrzucić go i zacząć od nowa. Prac nigdy nie zacząłem w obawie przed późniejszym utrzymaniem 
serwerów i zerowej wiedzy o wydajności, czy bezpieczeństwie.

Dzięki sztucznej inteligencji wszystko stało się prostsze. Tak czysto teoretycznie wystarczy jeśli napiszę generator API oparty o [Smithy](https://smithy.io/2.0/index.html) i wyraźnie 
oddzielę część twórczą od technicznej. Jedynym wymaganiem jest Jinja jako język szablonów i [WASM](https://github.com/WebAssembly/wabt/blob/main/wasm2c/README.md). Chcę, by wtyczki napisane przez użytkowników działały wszędzie. Oni tworzą miasta, rasy, klasy i wzory matematyczne, a zdecentralizowane serwery zajmą się całym backendem. Prace nad paczką standardową (bardziej demo) prowadzone będą w innym repozytorium. W tym chcę napisać program, który napisze mi testy oraz kod serwera na podstawie próbek mojego kodu.

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
![Pierwsza wersja mapy świata](https://camo.githubusercontent.com/e0ddea796c36b5de02d0c6d8274a5837740f42fb2461b6fa8bde6696929cdfee/68747470733a2f2f692e696d6775722e636f6d2f465657487271332e706e67)
![Druga wersja mapy świata](https://i.imgur.com/H3atLXT.jpeg)
</details>
<details> <summary> Konwencja </summary>
  
* Metody nazywamy jak w [Rails](https://guides.rubyonrails.org/routing.html)ie.
* Niedozwolone jest używanie przedrostka Arch i Archipelag.
* Service to klasa, Operation to metoda ("definicja").
* Przedrostek My wymaga autoryzacji.
* Przyrostek HTML renderuje plik z dysku serwera.
* Przyrostek Base oznacza klasę przeznaczoną tylko i wyłącznie do dziedziczenia.
  * Żeby rozszerzyć klasę base skopiuj ostatni fragment namespace i usuń przyrostek Base.
  * Na przykład namespace io.archipelag.Xz zamień na namespace cośtam.Xz, a service XzBase na service Xz.
* Nigdzie nie widzę by było to zabronione, więc @required service oznacza interfejs (klasę abstrakcyjną).
* Ardoonga będzie nazwą organizacji oraz paczki standardowej. Archipelag to nazwa silnika.
  
</details>
