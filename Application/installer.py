import os
import shutil
import urllib

links = ["", "", ""]

def download_jar(cl):
  a = 0
  if cl == 0:
    a = 0
  elif cl == 1:
    a = 1
  elif cl == 2:
    a = 2
  urllib.urlretrieve(links[0], "./cache/" + cl[a] + ".jar")
    

def install(cl):
  cldir = os.path.dir("./cache/" + cl[2])
  exists = (os.path.isdir(cldir))
  if exists == True:
    shutil.rmtree(cldir)
    os.makedirs(cldir)
  elif exists == False:
    os.makedirs(cldir)
  download_jar(cl)
  