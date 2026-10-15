const fs = require('fs');
const path = require('path');

const srcDir = path.resolve(__dirname, '..');
const destDir = path.resolve(__dirname, 'www');

// Asegurar que www exista
if (!fs.existsSync(destDir)) {
  fs.mkdirSync(destDir, { recursive: true });
}

// Archivos individuales a copiar
const filesToCopy = [
  'index.html',
  'app.js',
  'emergency.js',
  'style.css',
  'manifest.json',
  'sw.js'
];

filesToCopy.forEach(file => {
  const src = path.join(srcDir, file);
  const dest = path.join(destDir, file);
  if (fs.existsSync(src)) {
    fs.copyFileSync(src, dest);
    console.log(`[OK] Copiado: ${file}`);
  } else {
    console.warn(`[WARN] No existe: ${file}`);
  }
});

// Directorios a copiar recursivamente
const dirsToCopy = ['fonts', 'icons', 'assets'];

dirsToCopy.forEach(dir => {
  const src = path.join(srcDir, dir);
  const dest = path.join(destDir, dir);
  if (fs.existsSync(src)) {
    fs.cpSync(src, dest, { recursive: true });
    console.log(`[OK] Copiado directorio: ${dir}`);
  }
});

console.log('Sincronizacion de www completada con exito.');
