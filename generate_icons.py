import os
from PIL import Image, ImageDraw

icons_dir = os.path.dirname(os.path.abspath(__file__))
ws = icons_dir
icons_folder = os.path.join(ws, "icons")
assets_folder = os.path.join(ws, "assets")

src_path = r"C:\Users\Bryan Alexis\.gemini\antigravity\brain\b5fba125-9f32-4350-b8d2-6f9b119cc19a\.user_uploaded\media_1793225421448_cd28a221.jpg"

if os.path.exists(src_path):
    img = Image.open(src_path).convert("RGBA")
    
    # 512, 192, 180, 32
    img.resize((512, 512), Image.Resampling.LANCZOS).save(os.path.join(icons_folder, "icon-512.png"))
    img.resize((192, 192), Image.Resampling.LANCZOS).save(os.path.join(icons_folder, "icon-192.png"))
    img.resize((180, 180), Image.Resampling.LANCZOS).save(os.path.join(icons_folder, "apple-touch-icon.png"))
    img.resize((32, 32), Image.Resampling.LANCZOS).save(os.path.join(icons_folder, "favicon.png"))
    
    # Maskable
    maskable = Image.new("RGBA", (512, 512), (255, 255, 255, 255))
    inner_size = int(512 * 0.82)
    offset = (512 - inner_size) // 2
    inner = img.resize((inner_size, inner_size), Image.Resampling.LANCZOS)
    maskable.paste(inner, (offset, offset), inner)
    maskable.save(os.path.join(icons_folder, "icon-maskable-512.png"))
    print("Tlahto icons refreshed successfully from base image.")
