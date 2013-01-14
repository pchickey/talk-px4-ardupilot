% Getting Started with ArduPilot for PX4
% Pat Hickey
% 17 January, 2013

# What is ArduPilot

* Autopilot system for fixed wing, helicopters, ground vehicles
* Upwards of 20k users
* 3 year history of ArduPilot Mega hardware, based on Atmel AVR

\includegraphics[height=1in]{images/apm1.jpg}
\includegraphics[height=1in]{images/apm2.jpg}
\includegraphics[height=1in]{images/apm25.jpg}

# What is PX4

\includegraphics[height=0.8in]{images/px4logo.png}
\includegraphics[height=0.8in]{images/fmutop.jpg}
\includegraphics[height=0.8in]{images/fmubot.jpg}

* New open hardware & software system
* Pixhawk team at ETH Zurich: Lorenz Meier, creator of Mavlink
* Collaboration with 3D Robotics

# Why use PX4?

* Processor is 10x better than an Arduino Mega in every way. ArduPilot Mega is
  bursting its platform at the seams: 100s of bytes of RAM free, scheduler
  difficult to manage, IO ports limited, etc.
* Excellent hardware geared towards the advanced user
  * Modular system encourages custom add-ons
  * High pitch connectors - build your own wiring harness
* More user friendly improvments coming soon! (If soldering and command line
  scares you, wait a few months.)

# PX4IOAR

\includegraphics[height=2.5in]{images/px4ioar.jpg}

Gut your AR Drone, or build one from replacment parts.


# PX4 on an ArduCopter 3DR

\includegraphics[height=2.25in]{images/arducopter3dr-1.jpg}

Build your own wiring harness for quadcopters.

Blue tape holds on foam rubber baffle for the barometer.

Board should be component side down.

# PX4IO expansion board

\includegraphics[height=1.5in]{images/px4io.png}

* Attaches via expansion connector
* Failsafe coprocessor
* 8 servo outputs
* More serial ports
* Analog input, high current output
* Volage regulator


# PX4 Software

PX4 is the most advanced open autopilot software stack yet.

It is based on NuttX, a RTOS (real time operating system) with POSIX interfaces.

* Real Time: Programs can be scheduled fast enough to keep your quad from
  falling out of the sky.
* You can write programs with familiar thread, file, pipe, network socket
  primitives.
* Comes with filesystem (SD card), shell scripting language, interactive mode

# TODO unfinished beyond this pt

# Demonstrate a PX4 application

The "Hello World" of PX4 will take an hour or two if you know your way
around the command line

If you're an eclipse user, there are online tutorials for that, too!

* Hello world app:
    * Show the source code
    * Run the app from the command line

* Go off and build a fizz-buzz app:
    * ORB subscribe to altitude:
       * if above 1m, "put me down I'm scared of heights"
       * if below 0.2m "down on the ground where I belong"

# But what about flight software?

* The PX4 team has done some work on basic flight software to support
  multirotors and airplanes
* ETH has demonstrated adding computer vision systems for guidance
* Here's where I get all salesy: ArduCopter and ArduPlane have solved all
  lots of the hard problems to fly a copter & drone, with a great user
  interface.
* So, let's run ArduCopter!

# Build ArduCopter against 

Assume you've already grabbed the PX4 repo and done your hello world. (Follow the great online guide at px4 wiki!)
* XXX Do we need to use tridge's fork?

Grab the ardupilot repo. Its on Github!

```
$ git clone git://github.com/diydrones/ardupilot.git
$ cd ardupilot/ArduCopter && make configure
```

Set your px4 repo location in ardupilot/config.mk

```
$ make px4 && make px4-upload
```

Detailed instructions on the web. (XXX actually do this)

# What's next?

* Hack on ArduCopter with us
  * Better control techniques enabled by PX4
* Build more apps for PX4
  * Lots of new sensors and outputs are possible, and its never been
    easier to extend
* Was this intimidating? We're working on a user friendly release
  * Click and go from the mission planner, just like with your APM.
