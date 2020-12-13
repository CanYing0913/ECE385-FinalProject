# Project001
Project 001: simplified plant vs. zombie written in Systemverilog  
Dec. 12, 2020 as FALL 2020 ECE student @ UIUC, from ECE 385.  
If you find format distortion in Github review, please cocy the code into Intel Quatus software text editor.  
In this Project, I managed to do all of the following features:  
On game scheme side, it can do full game logistics: plantation, interaction between plants and zombies, and game terminator when one or more zombies get into the house.  
On VGA display side, it resolves the priority of different parts: zombies, peas, pea-shooters, coordinate, and background.  

Some new features I created:  
Since it is made for Intel DE10-Lite FPGA together with chip MAX3421E working for a keyboard, the way users manage to choose where to plant is achieved by navigating a special part called "Coordinate" by pressing W, A, S, and D. You can see a yellow rectangle indicating the current position. It is made such that the coordinate will never get out of the yard to lead some serious bugs.  
