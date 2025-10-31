# Zusammenfassung der aufgetretenen Probleme

Dieses Dokument fasst die wesentlichen Herausforderungen und Probleme zusammen, die während des Entwicklungsprozesses aufgetreten sind und gelöst wurden.

1.  **Abhängigkeitskonflikte (`Dependency Hell`):**
    - **Problem:** Das größte Hindernis war ein hartnäckiger Versionskonflikt zwischen `retrofit_generator` und dem `analyzer`-Paket.
    - **Lösungsversuche:** Mehrere Runden von Upgrades, Downgrades und der Verwendung von `dependency_overrides` in der `pubspec.yaml` führten wiederholt zu unlösbaren Abhängigkeiten.
    - **Lösung:** Das Problem wurde schließlich durch die sorgfältige Auswahl kompatibler Versionen von `retrofit`, `retrofit_generator` und `build_runner` sowie die Einführung von `json_serializable` gelöst.

2.  **Fehlerhafte Code-Generierung:**
    - **Problem 1:** `build_runner` schlug zunächst fehl, weil es versuchte, Dateien zu analysieren, die nicht für die Code-Generierung vorgesehen waren (z. B. `dog_state.dart`).
    - **Lösung 1:** Eine `build.yaml`-Datei wurde erstellt, um den `build_runner` explizit anzuweisen, nur die relevanten Dateien zu verarbeiten.
    - **Problem 2:** Später generierte `retrofit_generator` fälschlicherweise Aufrufe zu `fromJson`-Methoden, weil die API-Antworten nicht korrekt in typsichere Dart-Modelle umgewandelt wurden.
    - **Lösung 2:** Die Einführung von Datenmodellklassen mit `json_serializable`-Annotationen löste dieses Problem, da der Generator nun wusste, wie die JSON-Daten zu parsen sind.

3.  **Fehlende Pakete:**
    - **Problem:** Anfänglich wurde vergessen, das `flutter_riverpod`-Paket hinzuzufügen (nur `riverpod` war vorhanden).
    - **Auswirkung:** Dies führte zu einer Reihe von Analysefehlern, da UI-spezifische Riverpod-Klassen wie `ConsumerWidget` nicht gefunden wurden.
    - **Lösung:** Das fehlende Paket wurde zur `pubspec.yaml` hinzugefügt.

4.  **Fehlgeleiteter Lösungsversuch:**
    - **Problem:** Um die hartnäckigen `fromJson`-Fehler zu umgehen, wurde die Retrofit-Code-Generierung fälschlicherweise komplett entfernt und stattdessen Dio direkt implementiert.
    - **Auswirkung:** Dies war ein Umweg, der die Vorteile von Retrofit (Typsicherheit, Abstraktion) zunichtemachte und nicht der ursprünglichen Anforderung entsprach.
    - **Lösung:** Der Ansatz wurde verworfen und eine korrekte Retrofit-Implementierung mit Code-Generierung wurde wiederhergestellt.

5.  **Formatierungsfehler in der Dokumentation:**
    - **Problem:** Neu hinzugefügte Links in der `README.md` wurden versehentlich innerhalb eines Code-Blocks platziert.
    - **Auswirkung:** Die Formatierung war fehlerhaft und die Links waren nicht klickbar.
    - **Lösung:** Der Markdown-Code wurde korrigiert, um den Abschnitt außerhalb des Code-Blocks zu platzieren.
