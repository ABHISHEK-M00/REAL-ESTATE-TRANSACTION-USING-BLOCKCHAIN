import tkinter as tk
import pyttsx3
import threading
import time

class TalkingCharacter:
    def __init__(self, root):
        self.root = root
        self.root.title("AI Character with Voice")
        
        # Initialize text-to-speech engine
        self.engine = pyttsx3.init()
        self.engine.setProperty('rate', 150)  # Set speed of speech
        self.engine.setProperty('volume', 1.0)  # Set volume (0.0 to 1.0)
        
        # Canvas setup
        self.canvas = tk.Canvas(self.root, width=400, height=400, bg="white")
        self.canvas.pack()
        
        # Draw face
        self.head = self.canvas.create_oval(100, 50, 300, 300, fill="lightblue", outline="black")
        self.left_eye = self.canvas.create_oval(150, 120, 180, 150, fill="white", outline="black")
        self.right_eye = self.canvas.create_oval(220, 120, 250, 150, fill="white", outline="black")
        self.left_pupil = self.canvas.create_oval(165, 130, 175, 140, fill="black", outline="black")
        self.right_pupil = self.canvas.create_oval(235, 130, 245, 140, fill="black", outline="black")
        self.nose = self.canvas.create_oval(190, 160, 210, 180, fill="pink", outline="black")
        
        # Draw lips (initially closed)
        self.upper_lip = self.canvas.create_line(150, 240, 250, 240, smooth=True, width=3, fill="red")
        self.lower_lip = self.canvas.create_line(150, 240, 250, 240, smooth=True, width=3, fill="red")
        
        # Input field and button
        self.entry = tk.Entry(self.root, font=("Arial", 14))
        self.entry.pack(pady=10)
        
        self.speak_button = tk.Button(self.root, text="Speak", font=("Arial", 14), command=self.start_speaking)
        self.speak_button.pack(pady=10)
    
    def animate_lips(self, speaking_time):
        start_time = time.time()
        while time.time() - start_time < speaking_time:
            self.open_lips()
            time.sleep(0.2)
            self.close_lips()
            time.sleep(0.2)
        self.close_lips()  # Ensure lips are closed at the end
    
    def open_lips(self):
        self.canvas.coords(self.lower_lip, 150, 240, 200, 260, 250, 240)
        self.canvas.update()

    def close_lips(self):
        self.canvas.coords(self.lower_lip, 150, 240, 250, 240)
        self.canvas.update()

    def speak(self, text):
        # Estimate speaking duration based on text length
        speaking_time = len(text) / 10  # Approximation: 10 characters per second
        threading.Thread(target=self.animate_lips, args=(speaking_time,)).start()
        
        # Perform text-to-speech
        self.engine.say(text)
        self.engine.runAndWait()
    
    def start_speaking(self):
        text = self.entry.get()
        if text.strip():
            threading.Thread(target=self.speak, args=(text,)).start()

# Main execution
if __name__ == "__main__":
    root = tk.Tk()
    app = TalkingCharacter(root)
    root.mainloop()
