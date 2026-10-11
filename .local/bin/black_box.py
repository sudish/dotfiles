#!/usr/bin/python3
#
# Draw a black box over the area passed as argument. Click on box to exit.
#
# First arg is WxH+x+y (or -x-y to offset from right/bottom edge).
# Second arg is color, defaults to black.

import tkinter as tk
import sys

def main():
    geom = "100x100+100-100"
    if len(sys.argv) > 1:
        geom = sys.argv[1]

    color = 'black'
    if len(sys.argv) > 2:
        color = sys.argv[2]

    root = tk.Tk()
    root.configure(bg=color)

    # Remove window decorations (borders, title bar)
    root.overrideredirect(True)

    # Set position and size
    root.geometry(geom)

    # Force the window to stay on top of other windows
    root.attributes('-topmost', True)

    # Click anywhere on the black box to close it
    root.bind("<Button-1>", lambda e: root.destroy())

    root.mainloop()

if __name__ == "__main__":
    main()
