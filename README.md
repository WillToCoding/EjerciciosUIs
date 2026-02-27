# SwiftUI - 5 Ejercicios de Interfaces

Aplicación **iOS** con **5 ejercicios de interfaces** en SwiftUI, diseñada como práctica de componentes UI y patrones de diseño modernos.

<!--
<p align="center">
  <img src="Screenshots/overview.png" width="80%" alt="App Overview"/>
</p>
-->

## Descripción

Colección de ejercicios prácticos para dominar SwiftUI, desde reproductores de música hasta navegación maestro-detalle. Cada ejercicio implementa patrones reales de aplicaciones iOS.

## Ejercicios Incluidos

| # | Ejercicio | Descripción | Componentes Clave |
|---|-----------|-------------|-------------------|
| 1 | **MusicPlayer** | Reproductor de música con AVFoundation | ZStack, Slider, AVAudioPlayer |
| 2 | **Weather** | App del tiempo con previsiones | ScrollView, ProgressView, Picker |
| 3 | **TaskList** | Lista de tareas con filtros y CRUD | List, Toggle, Section, Sheet |
| 4 | **CardGallery** | Galería de tarjetas y componentes | LazyVGrid, clipShape, shadow |
| 5 | **Heroes** | Superhéroes (Maestro-Detalle) | NavigationStack, NavigationLink |

---

### Ejercicio 1: Reproductor de Música

Reproductor funcional con AVFoundation:
- Controles de reproducción (play, pause, anterior, siguiente)
- Barra de progreso interactiva
- Control de volumen
- Imagen de fondo con overlay

---

### Ejercicio 2: App del Tiempo

Aplicación meteorológica completa:
- Temperatura actual y condiciones
- Previsión por horas (ScrollView horizontal)
- Previsión por días con barras de temperatura
- Picker segmentado (Hoy, 24h, 10 días)

---

### Ejercicio 3: Lista de Tareas

Gestión de tareas con funcionalidades completas:
- Filtros por estado (Todas, Pendientes, Completadas)
- Filtros por categoría (Trabajo, Personal)
- Indicadores de prioridad
- Swipe to delete con confirmación
- Sheet para añadir nuevas tareas

---

### Ejercicio 4: Galería de Tarjetas

Colección de componentes reutilizables:
- Tarjetas de perfil con imagen circular
- Tarjetas de contacto
- Grid adaptable con LazyVGrid
- Efectos de sombra y bordes redondeados

---

### Ejercicio 5: Superhéroes (Maestro-Detalle)

Navegación con 20 superhéroes:
- Vista maestro con grid/lista de héroes
- Vista detalle con información completa
- Poderes mostrados como badges
- Imágenes personalizadas para cada héroe

---

## Tecnologías

| Tecnología | Versión |
|------------|---------|
| Swift | 6 |
| SwiftUI | iOS 17+ |
| Arquitectura | Clean Architecture + MVVM |
| Concurrencia | async/await, @MainActor |
| Observación | @Observable (iOS 17+) |
| Audio | AVFoundation |

## Requisitos

- Xcode 16+
- iOS 17.0+
- Swift 6

## Instalación

```bash
git clone https://github.com/tuusuario/EjerciciosUIs.git
cd EjerciciosUIs
open EjerciciosUIs.xcodeproj
```

Selecciona un simulador iOS y ejecuta con `⌘R`.

## Arquitectura

```
EjerciciosUIs/
├── System/
│   └── EjerciciosUIsApp.swift
├── Views/
│   ├── MainTabView.swift
│   ├── Ejercicio1_MusicPlayer/
│   │   ├── MusicPlayerView.swift
│   │   └── Components/
│   ├── Ejercicio2_Weather/
│   │   ├── WeatherView.swift
│   │   └── Components/
│   ├── Ejercicio3_TaskList/
│   │   ├── TaskListView.swift
│   │   ├── AddTaskView.swift
│   │   └── Components/
│   ├── Ejercicio4_CardGallery/
│   │   ├── CardGalleryView.swift
│   │   └── Components/
│   └── Ejercicio5_Heroes/
│       ├── HeroesListView.swift
│       ├── HeroDetailView.swift
│       └── Components/
├── ViewModels/
│   ├── MusicPlayerViewModel.swift
│   ├── WeatherViewModel.swift
│   ├── TaskListViewModel.swift
│   ├── CardGalleryViewModel.swift
│   └── HeroesViewModel.swift
├── Models/
│   ├── WeatherData.swift
│   ├── TaskData.swift
│   ├── CardData.swift
│   ├── SuperHeroesData.swift
│   └── Poderes.swift
└── Resources/
    └── the_mountain-opening-138168.mp3
```

## Patrones Implementados

### MVVM con @Observable

```swift
@MainActor
@Observable
final class TaskListViewModel {
    var tasks: [TaskItem] = []
    var selectedFilter: TaskFilter = .all

    var filteredTasks: [TaskItem] {
        tasks.filter { matchesFilter($0) }
    }
}
```

### Swift 6 Concurrency

```swift
// async/await en lugar de Timer con callbacks
func startProgressUpdates() async {
    while isPlaying {
        updateProgress()
        try? await Task.sleep(for: .milliseconds(100))
    }
}
```

### Computed Properties para Filtrado

```swift
var filteredTasks: [TaskItem] {
    tasks.filter { task in
        matchesFilter(task) && matchesCategory(task)
    }
}
```

## Características

- Navegación con TabView entre ejercicios
- Diseños adaptativos y responsivos
- Animaciones y transiciones nativas
- Código organizado por feature
- ViewModels con @MainActor para thread safety
- Sin dependencias externas (100% Apple frameworks)

## Datos de Ejemplo

### Superhéroes (20 personajes)
Cada héroe incluye: nombre real, apodo, descripción, edad, poderes e imagen.

### Poderes (31 tipos)
Enum completo con poderes como: Telekinesis, Vuelo, Superfuerza, Invisibilidad, Control del tiempo, etc.

## Autor

**Juan Carlos Morán Martín**

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
