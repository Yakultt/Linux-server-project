import time
import board
import usb_hid
from adafruit_hid.keyboard import Keyboard
from adafruit_hid.keycode import Keycode
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS

# Setup the keyboard
kbd = Keyboard(usb_hid.devices)
layout = KeyboardLayoutUS(kbd)

time.sleep(2)  # Give OS some time to detect device

# Open the terminal (im assuming im plugging this into a linux system)
kbd.send(Keycode.CONTROL, Keycode.ALT, Keycode.T)
time.sleep(1.5)

layout.write("figlet 'Welcome, Mr. Sookmeewiriya'\n")
