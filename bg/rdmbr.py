import os
import random
wp = [f for f in os.listdir("/home/bob/bg") if os.path.splitext(f)[1] != ".py"]
random.shuffle(wp)
cmd = f"feh --bg-fill /home/bob/bg/{wp[1]} /home/bob/bg/{wp[2]}"
os.system(cmd)
