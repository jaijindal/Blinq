import pyttsx3
with open('test.txt') as f:
    contents = f.read()
from gtts import gTTS
import os
from playsound import playsound
mytext = contents
language = 'en'
myobj = gTTS(text=mytext, lang=language, slow=False)
myobj.save("speak.mp3")
playsound('speak.mp3')