# EjerciciosUIs

<h3 align="center">5 SwiftUI interface exercises — from music player to superhero gallery</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
  <img src="https://img.shields.io/badge/SwiftUI-iOS_17+-007AFF?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI">
  <img src="https://img.shields.io/badge/Exercises-5-9B59B6?style=for-the-badge" alt="Exercises">
  <img src="https://img.shields.io/badge/License-MIT-2ECC71?style=for-the-badge" alt="License">
</p>

<p align="center">
  <b>Swift Developer Program 2025 — Apple Coding Academy</b><br>
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

**Reproductor de música con AVFoundation**

| Component | Implementation |
|-----------|---------------|
| **Play/Pause** | AVAudioPlayer control |
| **Progress** | Interactive Slider |
| **Volume** | System volume binding |
| **Background** | ZStack with overlay |

```swift
// Key pattern: AVAudioPlayer integration
@Observable class MusicPlayerViewModel {
    var isPlaying = false
    var progress: Double = 0
    private var player: AVAudioPlayer?
}
```

---

<img src="https://img.shields.io/badge/🌤️_EXERCISE_2:_WEATHER-00D4FF?style=for-the-badge" alt="Weather">

<p align="center">
  <img src="EjerciciosUIs/snapshots/Weather.png" width="280" alt="Weather App">
</p>

**App del tiempo completa**

| Component | Implementation |
|-----------|---------------|
| **Current** | Temperature + conditions |
| **Hourly** | Horizontal ScrollView |
| **Daily** | Temperature bar charts |
| **Picker** | Segmented control (Today/24h/10d) |

```swift
// Key pattern: Segmented picker
Picker("Forecast", selection: $selectedPeriod) {
    Text("Today").tag(Period.today)
    Text("24h").tag(Period.hourly)
    Text("10 Days").tag(Period.daily)
}
.pickerStyle(.segmented)
```

---

<img src="https://img.shields.io/badge/✅_EXERCISE_3:_TASK_LIST-34C759?style=for-the-badge" alt="Task List">

<p align="center">
  <img src="EjerciciosUIs/snapshots/TaskList.png" width="220" alt="Task List">
  &nbsp;&nbsp;&nbsp;
  <img src="EjerciciosUIs/snapshots/TaskList_NuevaTarea.png" width="220" alt="New Task">
</p>

**Gestión de tareas con CRUD completo**

| Feature | Implementation |
|---------|---------------|
| **Filters** | All / Pending / Completed |
| **Categories** | Work / Personal badges |
| **Priority** | Color-coded indicators |
| **Delete** | Swipe with confirmation |
| **Add** | Sheet modal form |

```swift
// Key pattern: Computed property filtering
var filteredTasks: [TaskItem] {
    tasks.filter { task in
        matchesStatus(task) && matchesCategory(task)
    }
}
```

---

<img src="https://img.shields.io/badge/🃏_EXERCISE_4:_CARD_GALLERY-AF52DE?style=for-the-badge" alt="Card Gallery">

<p align="center">
  <img src="EjerciciosUIs/snapshots/CardGallery.png" width="280" alt="Card Gallery">
</p>

**Galería de tarjetas con componentes reutilizables**

| Component | Implementation |
|-----------|---------------|
| **Profile Cards** | Circular images + info |
| **Contact Cards** | Icons + details |
| **Grid Layout** | Adaptive LazyVGrid |
| **Effects** | Shadows + rounded corners |

```swift
// Key pattern: Adaptive grid
LazyVGrid(columns: [
    GridItem(.adaptive(minimum: 150))
], spacing: 16) {
    ForEach(cards) { card in
        CardView(card: card)
    }
}
```

---

<img src="https://img.shields.io/badge/🦸_EXERCISE_5:_HEROES-FF9500?style=for-the-badge" alt="Heroes">

<p align="center">
  <img src="EjerciciosUIs/snapshots/Heroes.png" width="220" alt="Heroes List">
  &nbsp;&nbsp;&nbsp;
  <img src="EjerciciosUIs/snapshots/Heroes_Detail.png" width="220" alt="Hero Detail">
</p>

**Catálogo de 20 superhéroes con navegación maestro-detalle**

| Feature | Implementation |
|---------|---------------|
| **Master** | Grid/List of heroes |
| **Detail** | Full hero info + powers |
| **Powers** | Badge collection (31 types) |
| **Images** | Custom hero artwork |

```swift
// Key pattern: Master-detail navigation
NavigationStack {
    List(heroes) { hero in
        NavigationLink(value: hero) {
            HeroRow(hero: hero)
        }
    }
    .navigationDestination(for: Hero.self) { hero in
        HeroDetailView(hero: hero)
    }
}
```

---

<img src="https://img.shields.io/badge/TECH_STACK-E74C3C?style=for-the-badge" alt="Tech Stack">

| Category | Technologies |
|:--------:|-------------|
| **Language** | Swift 6 |
| **UI** | SwiftUI (iOS 17+) |
| **Architecture** | Clean Architecture + MVVM |
| **Concurrency** | async/await, @MainActor |
| **Observation** | @Observable |
| **Audio** | AVFoundation |

---

<img src="https://img.shields.io/badge/PATTERNS_LEARNED-9B59B6?style=for-the-badge" alt="Patterns">

| Pattern | Exercises |
|---------|-----------|
| **@Observable ViewModel** | All 5 exercises |
| **Computed Properties** | TaskList, Heroes |
| **NavigationStack** | Heroes |
| **Sheet Modals** | TaskList |
| **Picker Styles** | Weather |
| **LazyVGrid** | CardGallery, Heroes |
| **AVFoundation** | MusicPlayer |
| **Swipe Actions** | TaskList |

---

<img src="https://img.shields.io/badge/REQUIREMENTS-7F8C8D?style=for-the-badge" alt="Requirements">

| Requirement | Version |
|:-----------:|:-------:|
| iOS | 17.0+ |
| Xcode | 16+ |
| Swift | 6 |

---

<img src="https://img.shields.io/badge/INSTALLATION-2ECC71?style=for-the-badge" alt="Installation">

```bash
git clone https://github.com/WillToCoding/EjerciciosUIs.git
cd EjerciciosUIs
open EjerciciosUIs.xcodeproj
```

Select an iOS simulator and run with `⌘R`.

---

<img src="https://img.shields.io/badge/PROJECT_STRUCTURE-95A5A6?style=for-the-badge" alt="Structure">

```
EjerciciosUIs/
├── 📱 System/
│   └── EjerciciosUIsApp.swift
├── 🎨 Views/
│   ├── MainTabView.swift
│   ├── Ejercicio1_MusicPlayer/
│   ├── Ejercicio2_Weather/
│   ├── Ejercicio3_TaskList/
│   ├── Ejercicio4_CardGallery/
│   └── Ejercicio5_Heroes/
├── 🧠 ViewModels/
│   ├── MusicPlayerViewModel.swift
│   ├── WeatherViewModel.swift
│   ├── TaskListViewModel.swift
│   ├── CardGalleryViewModel.swift
│   └── HeroesViewModel.swift
├── 📦 Models/
│   ├── WeatherData.swift
│   ├── TaskData.swift
│   ├── CardData.swift
│   └── SuperHeroesData.swift
├── 🖼️ snapshots/
└── 🎵 Resources/
```

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
  <i>Swift Developer Program 2025 — Apple Coding Academy</i>
</p>
