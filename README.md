# Processing Planet Generator

Simple planet surface generator made with Processing.

## How to..

### ..use Processing

* Download Processing at https://processing.org/download/
* Install and Run the executable in the installation folder
* Open *planetgen/planetgen.pde*
* Run

### ..use the planet generator

#### Hotkeys

* 'h' - show/hide help
* 'z' - enable/disable random planet sizes
* 'q' - scale up
* 'a' - scale down
* 'e' - raise max size
* 'd' - lower max size
* SPACEBAR - reconstruct
* 'g' - enable/disable spotlight mode
* 'w' - double star count
* 's' - halve star count

#### Good to know

* Planet size calculation: (**size** * 16) - 1
* When **random planet size** is enabled, planets are given a random **size** variable between 1 and **max size** (this number will be the input in the calculation above)
  * When disabled, all planets are given **max size** as their **size**
* **spotlight mode** generates a starry background and only one planet in the middle of the screen
  * Each star's brightness is a random value between (0-255)
* Note that scaling down too much might affect performance

## Examples
![Example 1](https://raw.githubusercontent.com/atka66/processing-planetgen/master/img/pl6.PNG)
![Example 2](https://raw.githubusercontent.com/atka66/processing-planetgen/master/img/pl2.PNG)
![Example 3](https://raw.githubusercontent.com/atka66/processing-planetgen/master/img/pl3.PNG)
![Example 4](https://raw.githubusercontent.com/atka66/processing-planetgen/master/img/pl4.PNG)
![Example 5](https://raw.githubusercontent.com/atka66/processing-planetgen/master/img/pl5.PNG)

## Contribution

Feel free to leave improvement ideas and report bugs!

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/G2G31H1IJ)
