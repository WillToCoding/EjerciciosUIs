# EjerciciosUIs

<p align="center">
  <img src="EjerciciosUIs/snapshots/App.png" width="120" alt="EjerciciosUIs App Icon">
</p>

<h3 align="center">5 SwiftUI interface exercises — from music player to superhero gallery</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
  <img src="https://img.shields.io/badge/SwiftUI-iOS_26.2+-007AFF?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI">
  <img src="https://img.shields.io/badge/Exercises-5-9B59B6?style=for-the-badge" alt="Exercises">
  <img src="https://img.shields.io/badge/License-MIT-2ECC71?style=for-the-badge" alt="License">
</p>

<p align="center">
  <b>Swift Developer Program 2026 — Apple Coding Academy</b><br>
  <i>Master SwiftUI components through hands-on practice</i>
</p>

---

<img src="https://img.shields.io/badge/FEATURES-2ECC71?style=for-the-badge" alt="Features">

| | Feature | Description |
|:--:|---------|-------------|
| 🎵 | **Audio Player** | AVFoundation integration with controls |
| 🌤️ | **Weather App** | Forecasts with charts and pickers |
| ✅ | **Task Manager** | CRUD operations with filters |
| 🃏 | **Card Gallery** | LazyVGrid layouts and shadows |
| 🦸 | **Heroes Catalog** | Master-detail navigation |

---

<img src="https://img.shields.io/badge/🎵_EXERCISE_1:_MUSIC_PLAYER-FF2D55?style=for-the-badge" alt="Music Player">

<p align="center">
  <img src="EjerciciosUIs/snapshots/MusicPlayer.png" width="280" alt="Music Player">
</p>

**Reproductor de música con AVFoundation** — Imagen de fondo que cubre la parte superior con icono de música centrado. Barra de reproducción interactiva con Slider y controles de volumen. Tres botones redondos con etiquetas para navegación.

| Component | Implementation | Pattern |
|-----------|---------------|---------|
| **Play/Pause** | AVAudioPlayer control | @Observable ViewModel |
| **Progress** | Interactive Slider | State binding |
| **Volume** | System volume binding | ZStack overlay |
| **Background** | Full-screen image | ignoresSafeArea() |

---

<img src="https://img.shields.io/badge/🌤️_EXERCISE_2:_WEATHER-00D4FF?style=for-the-badge" alt="Weather">

<p align="center">
  <img src="EjerciciosUIs/snapshots/Weather.png" width="280" alt="Weather App">
</p>

**App del tiempo completa** — Sol con nubes en la parte superior, temperatura con sombra sobre imagen decorativa. Tres secciones con previsión horaria en ScrollView horizontal y diaria con barras de temperatura usando ProgressView.

| Component | Implementation | Pattern |
|-----------|---------------|---------|
| **Current** | Temperature + conditions | Segmented Picker |
| **Hourly** | Horizontal ScrollView | LazyHStack |
| **Daily** | Temperature bar charts | ProgressView |
| **Picker** | Today / 24h / 10 días | pickerStyle(.segmented) |

---

<img src="https://img.shields.io/badge/✅_EXERCISE_3:_TASK_LIST-34C759?style=for-the-badge" alt="Task List">

<p align="center">
  <img src="EjerciciosUIs/snapshots/TaskList.png" width="220" align="middle" alt="Task List">
  &nbsp;&nbsp;&nbsp;
  <img src="EjerciciosUIs/snapshots/TaskList_NuevaTarea.png" width="220" align="middle" alt="New Task">
</p>

**Gestión de tareas con CRUD completo** — Lista con 3 botones de filtro en la parte superior y 2 de categoría debajo. Listado de elementos con diferentes configuraciones visuales según estado y prioridad. Modal sheet para añadir nuevas tareas.

| Feature | Implementation | Pattern |
|---------|---------------|---------|
| **Filters** | All / Pending / Completed | Computed properties |
| **Categories** | Work / Personal badges | Swipe actions |
| **Priority** | Color-coded indicators | Sheet modals |
| **Delete** | Swipe with confirmation | onDelete modifier |
| **Add** | Sheet modal form | @Environment dismiss |

---

<img src="https://img.shields.io/badge/🃏_EXERCISE_4:_CARD_GALLERY-AF52DE?style=for-the-badge" alt="Card Gallery">

<p align="center">
  <img src="EjerciciosUIs/snapshots/CardGallery.png" width="280" alt="Card Gallery">
</p>

**Galería de tarjetas con componentes reutilizables** — Distintas propuestas de tarjetas y construcciones. Componentes individuales dentro de vistas únicas que luego se combinan en vistas más grandes. Imágenes circulares con información de perfil y contacto.

| Component | Implementation | Pattern |
|-----------|---------------|---------|
| **Profile Cards** | Circular images + info | LazyVGrid adaptive |
| **Contact Cards** | Icons + details | GridItem(.adaptive) |
| **Grid Layout** | Adaptive columns | Reusable components |
| **Effects** | Shadows + rounded corners | ViewModifier |

---

<img src="https://img.shields.io/badge/🦸_EXERCISE_5:_HEROES-FF9500?style=for-the-badge" alt="Heroes">

<p align="center">
  <img src="EjerciciosUIs/snapshots/Heroes.png" width="220" align="middle" alt="Heroes List">
  &nbsp;&nbsp;&nbsp;
  <img src="EjerciciosUIs/snapshots/Heroes_Detail.png" width="220" align="middle" alt="Hero Detail">
</p>

**Catálogo de 20 superhéroes con navegación maestro-detalle** — Pantalla master con grid/list de héroes seleccionables. Pantalla de detalle con datos completos: nombreReal, apodo, descripción, edad, poderes e imagen. 31 tipos de poderes disponibles mediante enumeración.

| Feature | Implementation | Pattern |
|---------|---------------|---------|
| **Master** | Grid/List of heroes | NavigationStack |
| **Detail** | Full hero info + powers | navigationDestination |
| **Powers** | Badge collection (31 types) | ForEach + Chip |
| **Images** | Custom hero artwork | Assets catalog |
| **Data** | SuperHeroesData.swift | Global test data |

---

<img src="https://img.shields.io/badge/TECH_STACK-E74C3C?style=for-the-badge" alt="Tech Stack">

| Category | Technologies |
|:--------:|-------------|
| **Language** | Swift 6 |
| **UI** | SwiftUI |
| **Architecture** | Clean Architecture + MVVM |
| **Concurrency** | async/await, @MainActor |
| **Observation** | @Observable |
| **Audio** | AVFoundation |

---

<img src="https://img.shields.io/badge/REQUIREMENTS-7F8C8D?style=for-the-badge" alt="Requirements">

| Requirement | Version |
|:-----------:|:-------:|
| iOS | 26.2+ |
| Xcode | 26.2+ |
| Swift | 6 |

---

<img src="https://img.shields.io/badge/PROJECT_STRUCTURE-95A5A6?style=for-the-badge" alt="Structure">

```
EjerciciosUIs/
├── EjerciciosUIs.icon/
├── Views/
│   ├── Ejercicio1_MusicPlayer/
│   ├── Ejercicio2_Weather/
│   ├── Ejercicio3_TaskList/
│   ├── Ejercicio4_CardGallery/
│   └── Ejercicio5_Heroes/
├── ViewModels/
├── Models/
├── Resources/
├── System/
└── Assets.xcassets/
```

---

<img src="https://img.shields.io/badge/INSTALLATION-2ECC71?style=for-the-badge" alt="Installation">

```bash
git clone https://github.com/WillToCoding/EjerciciosUIs.git
cd EjerciciosUIs
open EjerciciosUIs.xcodeproj
```

Select an iOS simulator and run with `⌘R`.

---

<img src="https://img.shields.io/badge/RELATED_PROJECTS-F1C40F?style=for-the-badge" alt="Related">

| Project | Description |
|:-------:|-------------|
| [**Ejercicios**](https://github.com/WillToCoding/Ejercicios) | 150+ Swift algorithm exercises |
| [**MisMangas**](https://github.com/WillToCoding/MisMangas) | Multi-platform manga collection manager |
| [**NetworkAPI**](https://github.com/WillToCoding/NetworkAPI) | Async/await networking layer |

---

<p align="center">
  <b>MIT License</b> · Made with ❤️ by <b>Juan Carlos</b>
</p>

<p align="center">
  <i>Swift Developer Program 2026 — Apple Coding Academy</i>
</p>
