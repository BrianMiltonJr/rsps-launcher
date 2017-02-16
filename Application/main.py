import Tkinter as tkinter
import os
from installer import *
from utility import *
status = [0, 0, 0]
clients = ["MbScape", "Alora"]
installed_button_text = "Click to Uninstall/Repair "
not_installed_button_text = "Click to Download "
window = tkinter.Tk()
window.title("RsPs Launcher")
window.geometry("800x600")
#window.wm_iconbitmap('rs.ico')

def check_status(cl):
  check = (os.path.isdir("./cache/" + cl))
  if check == True:
    status[0] = installed_button_text
    status[1] = 1
  elif check == False:
    status[0] = not_installed_button_text
    status[1] = 0
  return status
  
simplicity_status = check_status("Simplicity")
simplicity_status[2] = "Simplicity"
mbscape_status = check_status("MbScape")
mbscape_status[2] = "MbScape"
alora_status = check_status("Alora")
alora_status[2] = "Alora"

def button_logic(cl):
  if cl[1] == 1:
    utility(cl)
  elif cl[1] == 0:
    install(cl)
    
simplicity_button = tkinter.Button (window, text=simplicity_status[0] + simplicity_status[2], command=lambda:button_logic(simplicity_status))

while True:
  simplicity_status = check_status("Simplicity")
  simplicity_status[2] = "Simplicity"
  mbscape_status = check_status("MbScape")
  mbscape_status[2] = "MbScape"
  alora_status = check_status("Alora")
  alora_status[2] = "Alora"
  
  simplicity_button.pack_forget()
  simplicity_button.pack()
  window.mainloop()
    