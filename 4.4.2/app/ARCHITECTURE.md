## 1. Übergreifende Architektur-Philosophie

Das Projekt folgt zwei modernen Architekturprinzipien:

1.  **Feature-First-Architektur:** Anstatt den Code nach technischen Schichten zu organisieren (z. B. Ordner für `widgets`, `models`, `services`), wird der Code nach Funktionalität (Features) gruppiert. In unserem Fall befindet sich alles, was mit der Anzeige von Hunden zu tun hat, im Ordner `lib/features/dog`.
2.  **Clean Architecture (saubere Architektur):** Innerhalb jedes Features wird eine klare Trennung der Verantwortlichkeiten durchgesetzt. Dies geschieht durch die Aufteilung in drei Hauptschichten: **Presentation**, **Domain** und **Data**.

Diese Kombination schafft eine Struktur, die sehr gut wartbar, testbar und skalierbar ist.

---

### 2. Der Aufbau: Ordner- und Dateistruktur (`lib`)

Schauen wir uns an, wie die `lib`-Struktur diese Prinzipien widerspiegelt:

```
lib/
├── features/
│   └── dog/
│       ├── data/
│       │   ├── models/
│       │   │   ├── all_breeds_response.dart
│       │   │   └── dog_response.dart
│       │   ├── dog_api_service.dart
│       │   └── dog_repository.dart
│       ├── domain/
│       │   └── dog_usecase.dart
│       └── presentation/
│           ├── dog_provider.dart
│           ├── dog_screen.dart
│           └── dog_state.dart
├── main.dart
└── providers.dart
```

#### Die Schichten im Detail:

**a) Data-Schicht (`data/`)**
*   **Zweck:** Diese Schicht ist ausschließlich für den Datenzugriff zuständig. Sie weiß, *woher* die Daten kommen (in diesem Fall eine Web-API), aber nicht, *was* mit ihnen geschieht.
*   **`models/`**: Enthält die Dart-Klassen (`DogImageResponse`, `AllBreedsResponse`), die exakt die Struktur der JSON-Antworten der API abbilden. `json_serializable` generiert den Code, um zwischen JSON und diesen Dart-Objekten zu konvertieren.
*   **`dog_api_service.dart`**: Dies ist die **Retrofit**-Definition. Sie ist eine abstrakte Klasse, die die API-Endpunkte (`@GET(...)`) und die erwarteten Rückgabetypen (unsere Modellklassen) deklariert. Retrofit generiert daraus den gesamten Netzwerk-Code. **Feinheit:** Wir definieren hier nur das "Was" (welche Endpunkte), nicht das "Wie" (die Implementierung).
*   **`dog_repository.dart`**: Dient als Vermittler (Fassade) zur Datenquelle. Es verwendet den `DogApiService`, um die Rohdaten von der API zu holen, und extrahiert nur die relevanten Informationen (z. B. die Bild-URL aus dem `DogImageResponse`-Objekt). Die UI kennt nur das Repository, nicht den API-Service selbst.

**b) Domain-Schicht (`domain/`)**
*   **Zweck:** Diese Schicht enthält die Geschäftslogik der Anwendung. Sie ist das Herzstück und sollte völlig unabhängig von UI und Datenquellen sein.
*   **`dog_usecase.dart`**: Ein "Use Case" (Anwendungsfall) repräsentiert eine einzelne Aktion, die ein Benutzer ausführen kann, z. B. "ein zufälliges Hundebild laden". Er orchestriert den Datenfluss, indem er Methoden des `DogRepository` aufruft. **Feinheit:** Diese Datei enthält reinen Dart-Code und importiert keinerlei Flutter-Bibliotheken. Dadurch kann die Geschäftslogik ohne UI getestet werden.

**c) Presentation-Schicht (`presentation/`)**
*   **Zweck:** Diese Schicht ist für alles verantwortlich, was der Benutzer sieht und womit er interagiert.
*   **`dog_screen.dart`**: Das ist das Flutter-Widget (die UI). Es ist ein `ConsumerWidget`, das auf Zustandsänderungen von Riverpod-Providern lauscht und sich entsprechend neu aufbaut. Es enthält keine Geschäftslogik, sondern delegiert alle Aktionen an den `dog_provider`.
*   **`dog_state.dart`**: Definiert die verschiedenen Zustände, in denen sich die UI befinden kann. Durch die Verwendung einer `sealed class` (`DogLoading`, `DogData`, `DogError`) zwingen wir die UI, jeden möglichen Zustand zu behandeln. Das verhindert Fehler wie das Anzeigen einer leeren Seite, wenn ein Fehler auftritt.
*   **`dog_provider.dart`**: Dies ist der **Riverpod StateNotifier**. Er verbindet die UI mit der Geschäftslogik. Er ruft den `DogUsecase` auf, verarbeitet das Ergebnis und aktualisiert seinen Zustand (`state`). Die UI wird über diese Zustandsänderung automatisch benachrichtigt.

#### Globale Dateien:

*   **`main.dart`**: Der Einstiegspunkt der App. Seine Hauptaufgabe ist es, den `ProviderScope` von Riverpod zu initialisieren, der den Providern einen Ort zum Speichern ihres Zustands gibt.
*   **`providers.dart`**: Eine zentrale Datei, um alle Riverpod-Provider zu definieren. Dies dient als eine Form der **Dependency Injection**. Anstatt Objekte manuell zu erstellen (z. B. `DogRepository()`), "fragen" wir Riverpod nach einer Instanz (`ref.watch(dogRepositoryProvider)`). **Feinheit:** Dies entkoppelt die Klassen voneinander und macht das Austauschen von Implementierungen (z. B. für Tests) sehr einfach.

---

### 3. Der Ablauf: Ein typischer Anwendungsfall (Rasse auswählen)

1.  **Start:** Die App startet, `DogScreen` wird aufgebaut.
2.  **Datenabruf (Rassen):** `DogScreen` lauscht auf `allBreedsProvider`. Dieser `FutureProvider` wird automatisch ausgeführt, ruft `dogUsecase.fetchAllBreeds()` auf, was wiederum über das Repository die API abfragt. Während des Ladevorgangs zeigt die UI einen Ladeindikator. Sobald die Daten da sind, wird das Dropdown-Menü mit den Rassen gefüllt.
3.  **User-Interaktion:** Der Benutzer wählt eine Rasse aus dem `DropdownButton` in `dog_screen.dart`.
4.  **Aktion auslösen:** Die `onChanged`-Methode des Dropdowns wird aufgerufen. Sie führt zwei Aktionen aus:
    a. Sie aktualisiert den `selectedBreedProvider` mit der neuen Auswahl.
    b. Sie ruft `ref.read(dogProvider.notifier).fetchDogImageByBreed(neueRasse)` auf.
5.  **State Management:** Der `DogNotifier` in `dog_provider.dart` empfängt diesen Aufruf.
    a. Er setzt seinen Zustand sofort auf `state = DogLoading()`. Die UI reagiert darauf und zeigt einen Ladeindikator an.
    b. Er ruft die Methode `_dogUsecase.fetchDogImageByBreed(neueRasse)` auf.
6.  **Datenfluss durch die Schichten:**
    a. Der **Use Case** leitet den Aufruf einfach an das **Repository** weiter.
    b. Das **Repository** ruft die entsprechende Methode im **API Service** auf.
    c. **Retrofit** sendet die HTTP-Anfrage, empfängt die JSON-Antwort und parst sie automatisch in ein `DogImageResponse`-Objekt.
7.  **Rückfluss der Daten:**
    a. Das `DogImageResponse`-Objekt wird vom Repository an den Use Case und von dort an den `DogNotifier` zurückgegeben.
8.  **Zustand aktualisieren:** Der `DogNotifier` empfängt das Objekt, extrahiert die Bild-URL und aktualisiert seinen Zustand: `state = DogData(imageUrl)`.
9.  **UI-Aktualisierung:** Da `DogScreen` auf `dogProvider` lauscht (`ref.watch(dogProvider)`), wird es von Riverpod automatisch über die Zustandsänderung informiert. Die `build`-Methode wird erneut ausgeführt, erkennt den neuen `DogData`-Zustand und zeigt das neue Bild an.

Dieser klar definierte, unidirektionale Datenfluss macht die Anwendung vorhersehbar und leicht zu debuggen.