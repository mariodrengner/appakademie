# DigDog App

Eine einfache Flutter-Anwendung, die die [Dog CEO API](https://dog.ceo/dog-api/) verwendet, um Bilder von Hunden anzuzeigen.

## Funktionen

- **Zufällige Hundebilder:** Zeigt auf Knopfdruck ein zufälliges Hundebild an.
- **Rassenauswahl:** Ermöglicht die Auswahl einer bestimmten Hunderasse oder Unterrasse aus einer Dropdown-Liste, um ein passendes Bild zu laden.
- **Benutzerfreundliche Oberfläche:** Eine saubere und einfache Benutzeroberfläche mit Lade- und Fehleranzeigen.

## Technologie

- **Framework:** Flutter
- **Sprache:** Dart
- **Abhängigkeiten:**
  - `dio`: Für robuste HTTP-Anfragen.
  - `retrofit`: Für typsichere REST-API-Clients mit Code-Generierung.

## Starten der App

Um die App lokal auszuführen, stellen Sie sicher, dass Sie das Flutter SDK installiert haben, und führen Sie die folgenden Befehle aus:

```bash
# Abhängigkeiten installieren
flutter pub get

# Die App starten
flutter run

## Projektdokumentation

Für ein tieferes Verständnis des Projekts beachten Sie bitte die folgenden Dokumente:

- **[ARCHITECTURE.md](ARCHITECTURE.md):** Bietet eine detaillierte Erklärung der Projektarchitektur, einschließlich des Feature-First-Ansatzes, der Prinzipien der Clean Architecture und des Datenflusses.
- **[PLAN.md](PLAN.md):** Beschreibt den Projektplan, die Entwicklungsphasen und den Fortschritt der Implementierung.
- **[GEMINI.md](GEMINI.md):** Enthält Kontext für den Gemini Code Assistant, detailliert Projektkonventionen, Dateistruktur und wichtige Befehle.
```