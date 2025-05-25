# Ardoonga

1. Zakładam, że format plików low code zrozumiały dla ChataGPT będzie zrozumiały dla ludzi (wątpię).
2. Mam już dość marnowania kilkunastu godzin na konfigurację Hackintosha AMD XCode.
   - A przy okazji nie chce mi się marnować setek GB na maszyny wirtualne i symulatory.
   - Wpadłem, więc na pomysł że znajdę język uniwersalny, na który przetłumaczę kod:
     - SolidJS + SASS + HTML5
     - Android Jetpack Kotlin Compose
     - iOS SwiftUI
     - i innych platform
   - Ostatecznie zdecydowałem się na WebAssembly32 + Canvas 2D + SmithyLang
3. A że kolejny emulator aplikacji mobilnych nie jest nikomu potrzebny, pomyślałem że zrobię silnik gier RPG.
4. Właściwie początkowo chciałem zrobić port Vallheru na Ruby, więc uznajmy to za wolną interpretację na mój język.
   - Przede wszystkim zależało mi na zwiększeniu możliwości modowania i wydajności.
   - Zawsze wybierałem rzemieślnika, więc dodam kilka usprawnień.
5. Jak na Polaka przystało nie zasługuję na płacenie za serwery, więc stworzyłem eksperymentalny program wzorowany na Blockchain.
   - Przeglądarka, czy inny client wysyła informacje do licznych pośredników.
   - Na razie eksperymentuję z sieciami społecznościowymi BlueSky i Mastodon.
   - Ci pośrednicy mają zaimplementowany niestandardowy protokół.
   - Akcja/Serwer GitHub wstaje raz na godzinę i synchronizuje wszystkie dane.
   - Przeglądarka ma dwie bazy danych: Stałą (ta z GitHuba) i Tymczasową.
   - Jeśli w bazie stałej mam 10 monet, a w tymczasowej 2 to UI pokazuje mi 12 monet.
   - Serwer to zweryfikuje sobie w wolnej chwili i albo zatwierdzi dodatkowe monety albo po restarcie znów masz ich 10.

```
:room 1:
:passageDirection: east
:passageTo: room2

:layer-1:
:object: kwiecisty_dywan

:layer0:
:object: skrzynia
```

```
:room2:
:passageDirection: west
:passageTo: room 1

:background: kamienne ściany
```

```
:object: skrzynia

:roll: 2d4

:max: 2
:action: fight 1100

:min: 3
:max: 6
:action:

:min: 7
:max: 8
:action: loot 2342
```

Chat GPT poradzi z tym sobie bez problemu:

> It looks like you're working with a text-based adventure game or a role-playing game setup. Here's a breakdown of the elements you've provided:
>
> ### Room Descriptions
> 1. **Room 1**
>   - **Passage**: Leads east to Room 2.
>   - **Objects**:
>     - **Kwiecisty dywan** (floral carpet)
>     - **Skrzynia** (chest)
>
> 2. **Room 2**
>   - **Passage**: Leads west back to Room 1.
>   - **Background**: Stone walls (kamienne ściany).
>
> ### Object Actions
> - **Skrzynia (Chest)**:
>  - **Roll**: 2d4 (two four-sided dice).
>  - **Actions based on roll results**:
>    - **Roll 2**: Fight (action value: 1100).
>    - **Roll 3-6**: No action specified.
>    - **Roll 7-8**: Loot (action value: 2342).
>
> ### Gameplay Mechanics
> - Players can move between Room 1 and Room 2 through the passages.
> - The chest in Room 1 can trigger different actions based on the result of rolling two four-sided dice.
> - The actions include fighting or looting, depending on the roll outcome.
>
> If you need help with specific mechanics, story development, or further details, feel free to ask!

To akurat pochodzi z innego dema:

```smithy

    $version: "2.0"
    namespace my.test

    use core.traits.canvas#Layer
    use core.traits.canvas#PassageTo
    use core.traits.canvas#Size
    use core.traits.color#hex
    use core.traits.input#Disabled
    use core.traits.icon#FromUnicode
    use core.traits.canvas#Shape

    @mixin
    service Canvas {
        version: "0.1.0"
        resources: [PodstawowyKwadrat]
    }

    @Layer(-1)
    @hex(000080)
    @readonly
    resource NiebieskieTlo {
        identifiers: { canvasId: String }
    }

    @Layer(0)
    @Size(25)
    @Shape("ROUNDED_RECT")
    @readonly
    resource PodstawowyKwadrat {
        identifiers: { canvasId: String }
        resources: [PierwszyKwadrat, DrugiKwadrat,
                    TrzeciKwadrat, CzwartyKwadrat]
    }

    @PassageTo({DrugiKwadrat: "NORTH"})
    resource PierwszyKwadrat {
        identifiers: { canvasId: String }
    }

    @PassageTo({TrzeciKwadrat: "EAST"})
    @Disabled(true)
    @FromUnicode("1F4B5")
    resource DrugiKwadrat {
        identifiers: { canvasId: String }
    }

    @PassageTo({CzwartyKwadrat: "SOUTH"})
    resource TrzeciKwadrat {
        identifiers: { canvasId: String }
    }

    @PassageTo({PierwszyKwadrat: "WEST"})
    resource CzwartyKwadrat {
        identifiers: { canvasId: String }
    }
```
