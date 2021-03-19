
import os,sys

def pause(): #pause function
    if sys.platform.startswith('linux'):
        input(f"Press enter key to continue . . . ")
    else:
        os.system('pause')

def clear(): #clear function
    if sys.platform.startswith('linux'):
        os.system('clear')
    elif sys.platform.startswith('freebsd'):
        os.system('clear')
    else:
        os.system('cls')

def change_mac():
    try:
        if sys.platform.startswith("win"):
            print('OS doesn\'t support')
            pause()
        else:
            clear()
            os.system(f'bash mac_changer.sh')
            pause()
    except:
        print('error')
        pause()

def flush_mac():
    try:
        if sys.platform.startswith("win"):
            print('OS doesn\'t support')
            pause()
        else:
            clear()
            os.system(f'bash flush_mac.sh')
            pause()
    except:
        print('error')
        pause()

if __name__ == '__main__':
    while True:
        clear()
        print('1. change mac')
        print('2. flush mac')
        print('3. quit')
        x = input(': ')
        if x == '1':
            change_mac()
        elif x == '2':
            flush_mac()
        elif x == '3':
            break
        else:
            pass
    