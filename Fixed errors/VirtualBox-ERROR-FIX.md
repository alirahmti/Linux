# Fix Virtual Box Error in Linux Ubuntu 22.04 
## Error output ❗


```bash
root@Milan:/home/ali/Downloads# VirtualBox
Qt FATAL: This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: xcb.

Aborted (core dumped)```
```

## Solved ✅
you have to run this commands:
```bash
sudo apt-get remove libqt5core5a
sudo apt-get install libqt5core5a
sudo apt-get remove libdouble-conversion1
sudo apt-get install libdouble-conversion1
sudo apt-get install virtualbox-qt
```
