# Vozzy - Tu voz, en un toque

**Vozzy** es una herramienta de Comunicación Aumentativa y Alternativa (CAA / AAC) diseñada como Progressive Web App (PWA) rápida, accesible y moderna para personas mudas o con dificultades del habla.

---

## ✨ Características principales

- 🗣️ **Síntesis de voz instantánea (TTS):** Reproduce frases organizadas por categorías cotidianas con selección de voz, velocidad y tono personalizables.
- ✍️ **Redactor de mensajes libres:** Área de texto con frases rápidas y lectura en voz alta.
- 🚨 **Módulo de Emergencia SOS:** Llamadas al 911, SMS con GPS, ficha médica digital.
- 🎨 **Diseño adaptativo:** Temas de color, modo oscuro, animaciones fluidas.
- 📴 **100% Offline:** Funciona sin internet una vez instalada.

---

## 📴 Funcionamiento Offline (PWA)

La app usa un **Service Worker v5** con estrategia **Cache-First + Stale-While-Revalidate**:

- Todos los assets (HTML, CSS, JS, fuentes, íconos) se cachean en la primera visita.
- A partir de entonces, la app carga instantáneamente aunque no haya red.
- Si hay conexión, los archivos se actualizan en segundo plano automáticamente.
- Las fuentes Inter se cargan **localmente** desde `/fonts/` (sin Google Fonts).

---

## 📱 Cómo instalar Vozzy (sin conexión permanente)

### Android — Instalar como PWA (recomendado)
1. Abre Chrome y visita la URL de Vozzy.
2. Toca el menú ⋮ → **"Agregar a pantalla de inicio"** o **"Instalar app"**.
3. La app aparece en tu lanzador como una app nativa.

### Android — Instalar como APK nativo
Ver sección **"Generar APK Android"** más abajo.

### iOS / iPhone / iPad — Instalar como PWA
1. Abre **Safari** (obligatorio — Chrome no soporta instalación PWA en iOS).
2. Toca el botón **Compartir ⬆️** en la barra inferior.
3. Selecciona **"Agregar a pantalla de inicio"**.
4. Toca **"Agregar"** en la esquina superior derecha.
5. Vozzy aparece en tu pantalla de inicio como app nativa.

### Windows / macOS — Instalar como PWA
1. Abre Chrome/Edge y visita la URL de Vozzy.
2. Haz clic en el ícono de instalación en la barra de dirección.
3. La app se instala como aplicación de escritorio con ícono propio.

---

## 📲 Atajos de pantalla de inicio (Android)

Al mantener presionado el ícono de Vozzy en Android, aparecen atajos rápidos:
- **🚨 Emergencia SOS** — Abre directamente el panel de emergencias
- **✍️ Escribir mensaje** — Abre el redactor libre de texto

---

## 🔨 Generar APK Android (Capacitor)

### Requisitos previos
- [Node.js](https://nodejs.org) v18+
- [Android Studio](https://developer.android.com/studio) con SDK Android 14+
- JDK 17+

### Pasos rápidos (script automático)
```
Doble clic en Build_Android_APK.bat
```

### Pasos manuales
```bash
cd capacitor-app
npm install
npx cap add android        # primera vez
npx cap sync android       # sincroniza assets web
npx cap open android       # abre Android Studio
# En Android Studio: Build → Build APK(s)
```

El APK de debug estará en:
`capacitor-app/android/app/build/outputs/apk/debug/app-debug.apk`

### APK firmado (para publicar en Play Store)
En Android Studio: **Build → Generate Signed Bundle / APK**

---

## 🍎 Generar IPA iOS (Capacitor)

> Requiere una Mac con Xcode 15+ y una cuenta de desarrollador Apple.

```bash
cd capacitor-app
npm install
npx cap add ios            # primera vez
npx cap sync ios           # sincroniza assets web
npx cap open ios           # abre Xcode
# En Xcode: Product → Archive → Distribute App
```

---

## 🚀 Despliegue en Vercel (PWA web)

1. Conecta tu repositorio de GitHub en Vercel.
2. **Framework Preset**: `Other` (sin framework).
3. **Build Command**: dejar vacío.
4. **Output Directory**: `./` (raíz).

---

## 🛠️ Tecnologías

| Capa | Tecnología |
|------|-----------|
| Frontend | HTML5, CSS3, JavaScript ES6+ (Vanilla) |
| Offline | Service Worker v5, Cache API (Cache-First) |
| Instalable | Web App Manifest v3 + Capacitor 6 |
| APIs | Web Speech API, Geolocation API, LocalStorage |
| Fuentes | Inter (local, sin CDN, 100% offline) |
| APK nativo | Capacitor 6 (Android + iOS) |
