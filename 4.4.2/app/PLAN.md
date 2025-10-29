# Projektplan: DigDog App

Dieses Dokument beschreibt den strategischen Plan und den Fortschritt bei der Entwicklung der DigDog Flutter-Anwendung.

## 1. Ziel

Entwicklung einer Flutter-App, die mit der öffentlichen Dog CEO API interagiert, um zufällige Hundebilder anzuzeigen und nach Rasse zu filtern.

## 2. Umsetzungsphasen

### Phase 1: Projekteinrichtung und UI-Struktur
- [x] **Abhängigkeit hinzufügen:** Das `http`-Package wurde zur `pubspec.yaml`-Datei hinzugefügt.
- [x] **UI-Grundgerüst erstellen:** `lib/main.dart` wurde in ein `StatefulWidget` umgewandelt und das grundlegende Layout mit Platzhaltern erstellt.

### Phase 2: Entwicklung der API-Serviceschicht
- [x] **Service-Klasse erstellen:** Die Datei `lib/dog_service.dart` wurde erstellt, um die API-Logik zu kapseln.
- [x] **API-Methoden implementieren:** Methoden für die API-Aufrufe (`fetchRandomDogImage`, `fetchAllBreeds`, `fetchDogImageByBreed`) wurden implementiert.

### Phase 3: Integration von Logik und Zustand
- [x] **Zustandsverwaltung:** Zustandsvariablen für Bild-URL, Ladezustand und Rassenliste wurden definiert und mit `setState` verwaltet.
- [x] **Initialer Datenabruf:** Die App ruft beim Start die Rassenliste und ein erstes zufälliges Bild ab.
- [x] **UI-Events verknüpfen:** Die UI-Events (Button-Klick, Dropdown-Änderung) sind mit den entsprechenden Service-Methoden verbunden.

### Phase 4: Fehlerbehandlung und UI-Optimierung
- [x] **Ladeanzeige:** Eine `CircularProgressIndicator` wird während der Datenabrufe angezeigt.
- [x] **Fehlerbehandlung:** `try-catch`-Blöcke wurden implementiert, um Fehler abzufangen und dem Benutzer anzuzeigen.
- [x] **Layout-Verbesserungen:** Das Layout wurde für eine ansprechendere Darstellung optimiert.

### Zusätzliche UI-Anpassungen (auf Anfrage)
- [x] **Titel geändert:** Der App-Titel wurde in "DigDog" geändert.
- [x] **CTA angepasst:** Der Text des "Neu laden"-Buttons wurde auf "Zufälligen Hund laden" geändert.
- [x] **Logo erstellt:** Ein App-Logo wurde generiert und im Verzeichnis `assets/images` gespeichert.
- [x] **Assets deklariert:** Das Assets-Verzeichnis wurde in der `pubspec.yaml` deklariert.
- [x] **Logo integriert:** Das Logo wurde in die `AppBar` der Anwendung eingefügt.
