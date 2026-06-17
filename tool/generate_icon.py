"""
Generates the Nomly launcher icon assets with Pillow.

Concept: rounded-square, warm-orange (#E0531F) background with a centered white
takeout bag and a fork silhouette cut into the bag (negative space reveals the
orange behind it). Legible and high-contrast at small sizes.

Outputs (1024x1024):
  assets/icon/icon.png            opaque master (orange bg, white bag, orange fork) — iOS/web/all
  assets/icon/icon_foreground.png transparent, padded white bag w/ cut-out fork — Android adaptive fg
  assets/icon/icon_background.png solid #E0531F — Android adaptive bg

Run: python tool/generate_icon.py
"""
import os
from PIL import Image, ImageDraw, ImageChops

ORANGE = (224, 83, 31, 255)          # #E0531F
WHITE = (255, 255, 255, 255)
SIZE = 1024
R = 46                                # corner radius for bag body


def build_mark():
    """Returns an RGBA 1024 image: white bag with fork + handle slot punched out
    (transparent). Background is transparent."""
    mark = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    d = ImageDraw.Draw(mark)

    # Bag body (rounded rectangle)
    d.rounded_rectangle([312, 430, 712, 806], radius=R, fill=WHITE)
    # Folded top flap (slight trapezoid) drawn as polygon, white
    d.polygon([(300, 352), (724, 352), (700, 432), (324, 432)], fill=WHITE)

    # --- holes to punch (transparent) -------------------------------------
    holes = Image.new("L", (SIZE, SIZE), 0)
    hd = ImageDraw.Draw(holes)
    # fold separation line
    hd.rounded_rectangle([322, 424, 702, 436], radius=6, fill=255)
    # handle slot on the flap
    hd.rounded_rectangle([462, 372, 562, 402], radius=15, fill=255)

    # fork, centered at x=512
    # three tines
    hd.rounded_rectangle([461, 470, 483, 560], radius=10, fill=255)
    hd.rounded_rectangle([501, 470, 523, 560], radius=10, fill=255)
    hd.rounded_rectangle([541, 470, 563, 560], radius=10, fill=255)
    # shoulder joining the tines
    hd.rounded_rectangle([461, 548, 563, 588], radius=18, fill=255)
    # handle
    hd.rounded_rectangle([495, 568, 529, 726], radius=17, fill=255)

    # punch: new_alpha = bag_alpha - holes
    alpha = mark.getchannel("A")
    alpha = ImageChops.subtract(alpha, holes)
    mark.putalpha(alpha)
    return mark


def main():
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out_dir = os.path.join(here, "assets", "icon")
    os.makedirs(out_dir, exist_ok=True)

    mark = build_mark()

    # Master opaque icon: orange canvas + mark (fork holes reveal orange)
    master = Image.new("RGBA", (SIZE, SIZE), ORANGE)
    master.alpha_composite(mark)
    master.convert("RGB").save(os.path.join(out_dir, "icon.png"))

    # Adaptive foreground: transparent, mark scaled to ~64% safe zone, centered
    fg = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    scale = 0.66
    sm = mark.resize((int(SIZE * scale), int(SIZE * scale)), Image.LANCZOS)
    off = (SIZE - sm.width) // 2
    fg.alpha_composite(sm, (off, off))
    fg.save(os.path.join(out_dir, "icon_foreground.png"))

    # Adaptive background: solid orange
    bg = Image.new("RGB", (SIZE, SIZE), ORANGE[:3])
    bg.save(os.path.join(out_dir, "icon_background.png"))

    print("Wrote icon.png, icon_foreground.png, icon_background.png to", out_dir)


if __name__ == "__main__":
    main()
