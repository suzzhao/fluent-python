import threading
import itertools
import  time
import sys

class Signal:
    go = True

def spin(msg, Signal):
    write, flush = sys.stdout.write, sys.stdout.flush
    for char in itertools.cycle('|/-\\'):
        status = char + ' ' + msg
        write(status)
        flush()
        write('\x08' * len(status))
        time.sleep(.1)
        if not Signal.go:
            break
    write(' ' * len(status) + '\x08' * len(status))

def slow_function():
    # 假装等待I/O一段时间
    time.sleep(3)
    return 42

def supervisor():
    signal = Signal()
    spinner = threading.Thread(target=spin, args=('thinking!', signal))
    result = slow_function()
    signal.go = False
    spinner.join()
    return result

def main():
    result = supervisor()
    print("Answer:", result)

if __name__ == "__main__":
    main()

