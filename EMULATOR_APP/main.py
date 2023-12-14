import tkinter as tk
import tkinter.font as tkfnt
import time

# Seven-segment display font
offsets = (
    (0, 0, 1, 0),  # top
    (1, 0, 1, 1),  # upper right
    (1, 1, 1, 2),  # lower right
    (0, 2, 1, 2),  # bottom
    (0, 1, 0, 2),  # lower left
    (0, 0, 0, 1),  # upper left
    (0, 1, 1, 1),  # middle
)

# Segments used for each digit; 0, 1 = off, on.
digits = (
    (1, 1, 1, 1, 1, 1, 0),  # 0
    (0, 1, 1, 0, 0, 0, 0),  # 1
    (1, 1, 0, 1, 1, 0, 1),  # 2
    (1, 1, 1, 1, 0, 0, 1),  # 3
    (0, 1, 1, 0, 0, 1, 1),  # 4
    (1, 0, 1, 1, 0, 1, 1),  # 5
    (1, 0, 1, 1, 1, 1, 1),  # 6
    (1, 1, 1, 0, 0, 0, 0),  # 7
    (1, 1, 1, 1, 1, 1, 1),  # 8
    (1, 1, 1, 1, 0, 1, 1),  # 9
    (0, 0, 0, 0, 0, 0, 0),  # colon
)

class CasioWatchEmulator:
    def __init__(self, root):
        self.root = root
        self.root.title("Casio Watch Emulator")

        self.watch_frame = tk.Frame(root, bg="black", width=400, height=100)
        self.watch_frame.pack()

        self.canvas = tk.Canvas(self.watch_frame, bg="black", width=400, height=100)
        self.canvas.pack()

        self.digits = [
            self.create_digit(10, 30),    # Hours 1/ min1
            self.create_digit(40, 30),    # Hours 2/ min2
            self.create_colon(90, 30),    # Colon
            self.create_digit(140, 30),   # Minutes 1/sec1
            self.create_digit(170, 30),   # Minutes 2/sec2
        ]

        self.mode = 0
        self.timer_state = 0
        self.current_time = 0

        # Buttons
        self.button_mode = tk.Button(self.watch_frame, text="Mode", command=self.button_mode_clicked)
        self.button_mode.place(x=20, y=70)

        self.button_set = tk.Button(self.watch_frame, text="Set", command=self.button_set_clicked)
        self.button_set.place(x=80, y=70)

        self.button_light = tk.Button(self.watch_frame, text="Light", command=self.toggle_light)
        self.button_light.place(x=125, y=70)

        self.button_increment = tk.Button(self.watch_frame, text="Increment", command=self.button_increment)
        self.button_increment.place(x=180, y=70)

        self.button_start = tk.Button(self.watch_frame, text="Start", command=self.toggle_start)
        self.button_start.place(x=260, y=70)

        self.is_light_on = False  # Flag to track light state

        self.update_time()

    def create_digit(self, x, y):
        digit = []
        for x0, y0, x1, y1 in offsets:
            digit.append(
                self.canvas.create_line(
                    x + x0 * 10, y + y0 * 10, x + x1 * 10, y + y1 * 10,
                    width=2, fill='red'
                )
            )
        return digit

    def create_colon(self, x, y):
        colon = []
        for x0, y0, x1, y1 in offsets:
            colon.append(
                self.canvas.create_line(
                    x + x0 * 10, y + y0 * 10, x + x1 * 10, y + y1 * 10,
                    width=2, fill='green'
                )
            )
        return colon

    def show_time(self, hm, ms):
        self.show_digit(self.digits[0], hm // 10)
        self.show_digit(self.digits[1], hm % 10)
        self.show_digit(self.digits[2], 10)  # Show the colon
        self.show_digit(self.digits[3], ms // 10)
        self.show_digit(self.digits[4], ms % 10)

    def show_digit(self, segments, num):
        for iid, is_on in zip(segments, digits[num]):
            self.canvas.itemconfigure(iid, state='normal' if is_on else 'hidden')

    def update_time(self):
        if self.mode == 1 and self.timer_state == 1:
            current_time = list((self.current_time // 60, self.current_time % 60))
            self.show_time(*current_time)
            current_time[1] += 1  # Increment the minutes
            if current_time[1] == 60:
                current_time[1] = 0
                current_time[0] += 1  # Increment the hours
            self.current_time = current_time[0] * 60 + current_time[1]  # Convert back to minutes
            self.root.after(1000, self.update_time)
        elif self.mode == 1:
            current_time = list((self.current_time // 60, self.current_time % 60))
            self.show_time(*current_time)
            self.root.after(10, self.update_time)
        else:
            current_time = self.display()
            self.show_time(*current_time)
            self.root.after(1000, self.update_time)

    def display(self):
        if self.mode == 0:  #count
            current_time = time.localtime(time.time())  #getting the current time
            return current_time.tm_hour, current_time.tm_min  #returning the current
        if self.mode == 1:
            return 0, 0
        if self.mode == 2:
            return 0, 0
        if self.mode == 3:
            return 0, 0
        if self.mode == 4:
            return 0, 0

    def button_mode_clicked(self):
        self.mode = (self.mode + 1) % 5
        print(self.mode)
        if self.mode == 0:  #count
            ()
        if self.mode == 1:  #timer
            ()
        if self.mode == 2:  #increment1
            ()  #will develop
        if self.mode == 3:  #increment2
            ()  #will develop
        if self.mode == 4:  #start
            ()  #will develop

    def button_set_clicked(self):
        print("Set button clicked")

    def button_increment(self):
        print("Increment button clicked")

    def toggle_light(self, event=None):
        if self.is_light_on:
            self.canvas.configure(bg="black")
        else:
            self.canvas.configure(bg="green")
        self.is_light_on = not self.is_light_on

    def toggle_start(self):
        print(self.timer_state)
        if self.mode == 1 and self.timer_state == 0:
            self.timer_state = 1
            self.current_time = 0
        elif self.mode == 1:
            self.timer_state = 0





if __name__ == "__main__":
    root = tk.Tk()
    casio_watch_emulator = CasioWatchEmulator(root)
    root.mainloop()
