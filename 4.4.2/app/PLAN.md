# Projektplan: DigDog App

Dieses Dokument beschreibt den strategischen Plan und den Fortschritt bei der Entwicklung der DigDog Flutter-Anwendung.

## 1. Ziel

Entwicklung einer Flutter-App, die mit der öffentlichen Dog CEO API interagiert, um zufällige Hundebilder anzuzeigen und nach Rasse zu filtern.

## 2. Umsetzungsphasen

### Phase 1: Projekteinrichtung und UI-Struktur
- [x] **Abhängigkeit hinzufügen:** Notwendige Packages (`dio`, `retrofit`, `riverpod`, `flutter_riverpod`, `json_annotation`, `build_runner`, `retrofit_generator`, `json_serializable`) wurden zur `pubspec.yaml`-Datei hinzugefügt.
- [x] **UI-Grundgerüst erstellen:** `lib/main.dart` wurde in ein `StatelessWidget` umgewandelt und das grundlegende Layout mit `DogScreen` als Einstiegspunkt erstellt.

### Phase 2: Entwicklung der API-Serviceschicht
- [x] **Service-Klasse erstellen:** Die Datei `lib/features/dog/data/dog_api_service.dart` wurde mit Retrofit-Annotationen erstellt, um die API-Logik zu kapseln.
- [x] **Datenmodellklassen erstellen:** Modellklassen (`DogImageResponse`, `AllBreedsResponse`) wurden in `lib/features/dog/data/models/` für die API-Antworten erstellt.
- [x] **Code-Generierung konfigurieren:** `build.yaml` wurde erstellt und `build_runner` ausgeführt, um die Retrofit-Service-Implementierung und JSON-Serialisierungs-Code zu generieren.
- [x] **Repository-Klasse implementieren:** `lib/features/dog/data/dog_repository.dart` wurde erstellt (aus `dog_service.dart` umbenannt) und implementiert, um den `DogApiService` zu nutzen.

### Phase 3: Integration von Logik und Zustand
- [x] **Zustandsverwaltung mit Riverpod:** Die Zustandsverwaltung wurde auf Riverpod umgestellt, mit `dogProvider` als `StateNotifierProvider` und `allBreedsProvider` sowie `selectedBreedProvider`.
- [x] **Initialer Datenabruf:** Die App ruft beim Start die Rassenliste und ein erstes zufälliges Bild über Riverpod ab.
- [x] **UI-Events verknüpfen:** Die UI-Events (Button-Klick, Dropdown-Änderung) sind mit den entsprechenden Riverpod-Providern verbunden.

### Phase 5: Umstellung der Architektur

- [x] **Architektur-Refactoring:** Die Anwendungsstruktur wurde auf eine **Feature-First-Architektur** umgestellt, die den Prinzipien der **Clean Architecture** folgt. Dies trennt die App in die Schichten Präsentation (UI), Domäne (Geschäftslogik) und Daten (Repository), was die Wartbarkeit und Skalierbarkeit verbessert.
- [x] **State Management mit Riverpod:** Die Zustandsverwaltung wurde von `StatefulWidget` und `setState` auf **Riverpod** umgestellt. Dies ermöglicht eine reaktive, testbare und zentralisierte Verwaltung des Anwendungszustands.
- [x] **API-Schicht mit Retrofit und Code-Generierung:** Die API-Kommunikation wurde vom `http`-Package auf **Retrofit** mit **Code-Generierung** umgestellt, um eine robuste, typsichere und flexible Lösung für Netzwerkanfragen zu schaffen.

**Vorteile der neuen Architektur:**
- **Bessere Organisation:** Code ist nach Features gruppiert, was die Navigation und das Verständnis erleichtert.
- **Entkopplung:** Die klare Trennung der Schichten reduziert Abhängigkeiten und ermöglicht es, Teile der App (z. B. die UI) zu ändern, ohne die Geschäftslogik zu beeinträchtigen.
- **Testbarkeit:** Jede Schicht kann isoliert getestet werden, was die Codequalität und Zuverlässigkeit erhöht.
- **Skalierbarkeit:** Die Struktur ist darauf ausgelegt, mit der Anwendung zu wachsen, ohne unübersichtlich zu werden.
