#!/usr/bin/env python3
# Script para obtener los mensajes no leidos de telegram
# Creado por Keyvin Duque <thkeyduq@gmail.com>
from pytg.sender import Sender
import re, subprocess

port = 4458

def findProcess(process):
    ps= subprocess.Popen('ps -ef | grep ' + process + ' | grep -v grep', shell=True, stdout=subprocess.PIPE)
    output = ps.stdout.read()
    ps.stdout.close()
    ps.wait()
    return str(output)

def isProcessRunning(process):
    output = findProcess(process)
    return re.search(process, output) is not None

if not isProcessRunning('telegram-cli'):
    subprocess.Popen(['telegram-cli', '-d', '-P', str(port)])

sender = Sender(host='localhost', port=port)

dialog_list = sender.raw('dialog_list')

pattern = r'(?<=\:\s)(?:|[^unread\\])*(?=\s)'

list_unread = re.findall(pattern, dialog_list)

unread = 0

for u in list_unread:
    unread = unread + int(u)

print("(T) %s msgs sin leer" % unread)
