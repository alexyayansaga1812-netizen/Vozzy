# Vozzy - Tu voz, en un toque

**Vozzy** es una herramienta de Comunicación Aumentativa y Alternativa (CAA / AAC) diseñada como Progressive Web App (PWA) rápida, accesible y moderna para personas mudas o con dificultades del habla.

---

## ✨ Características principales

- 🗣️ **Síntesis de voz instantánea (TTS):** Reproduce frases organizadas por categorías cotidianas (Casa, Escuela, Doctor, Comida, Emociones, Saludos, Transporte, etc.) con selección de voz, velocidad y tono personalizables.
- ✍️ **Redactor de mensajes libres:** Área de texto con frases rápidas ("Sí", "No", "Gracias", etc.) y lectura en voz alta.
- 🚨 **Módulo de Emergencia SOS:**
  - Acceso directo a llamadas al 911 y a contactos de emergencia.
  - Envío de SMS de socorro con geolocalización GPS integrada.
  - **Ficha médica digital:** Almacenamiento seguro en el dispositivo de tipo de sangre, alergias, condiciones y medicamentos.
  - **Subida de historial médico:** Soporte para adjuntar imágenes y documentos PDF de recetas y diagnósticos con visor a pantalla completa.
- 🎨 **Diseño adaptativo y temas vibrantes:**
  - Selector de temas de color (Morado, Azul, Rojo, Verde, Naranja, Rosa, etc.).
  - Modo claro y modo oscuro de alto contraste.
  - Animaciones fluidas optimizadas para dispositivos móviles y de escritorio.
- 📱 **PWA instalable y funcionamiento offline:**
  - Service Worker con caché de recursos esenciales.
  - Instalable en Android, iOS, Windows y macOS.

---

## 🚀 Despliegue en Vercel

Vozzy es una aplicación web estática (HTML, CSS y JavaScript Vanilla). Para desplegarla en Vercel:
1. Conecta tu repositorio de GitHub en Vercel.
2. En **Framework Preset**, selecciona **Other** (o déjalo en blanco / static).
3. En **Build Command**, déjalo vacío o introduce `echo "Static build ready"`.
4. En **Output Directory**, déjalo en `./` o raíz.

---

## 🛠️ Tecnologías

- **Frontend:** HTML5 semántico, CSS3 moderno (Custom Properties, CSS Grid, Flexbox), JavaScript (ES6+).
- **APIs Web:** Web Speech API (`SpeechSynthesis`), Geolocation API, Service Worker API, Cache API, LocalStorage.
- **PWA:** Web App Manifest v3.
