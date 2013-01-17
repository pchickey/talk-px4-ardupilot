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
* Comes with filesystem (SD card), shell scripting language, interactive shell

# Setup your PX4 repo

You'll want to follow the [instructions on the PX4 wiki][1] to setup your
development environment. 

Just for your notes later, as of this writing (14 Jan 2013) you need some
extra patches on top of the regular PX4 firmware.

[1]: https://pixhawk.ethz.ch/px4/dev/px4_quickstart


```
$ git remote add tridge \
    git://github.com/tridge/Firmware.git
$ git fetch tridge
$ git checkout -b ardupilot-support tridge/master

```

# Demonstrate a PX4 application

Installing and coding up the [Hello World][2] of PX4 will take you two
hours or so.

Lets do a quick sample.

[2]:https://pixhawk.ethz.ch/px4/dev/hello_sky

If you get stuck, there's a [stack overflow style Q&A] site.

[3]:http://answers.px4.ethz.ch/questions/

# But what about flight software?

ETH and others have written flight control software for PX4 suitable for 
researchers or developers.

ArduCopter and ArduPlane have solved lots of the hard problems for flying
with a great user interface.

Luckily - ArduCopter and ArduPlane both run on the PX4.

So, let's run ArduCopter!

# Build ArduCopter against 

Assume you've already grabbed the PX4 repo and done your hello world.

1. Grab the ardupilot repo. Its on Github!

```
$ git clone git://github.com/diydrones/ardupilot.git
```

2. Configure: create config.mk automatically and add the path to your
   PX4 directory.

```
$ cd ardupilot/ArduCopter && make configure
```

3. Build ArduCopter for PX4:

```
$ make px4 && make px4-upload
```

4. Put the right [/etc/rc][3] file on SD card for boot (next slide)


# ArduCopter /etc/rc

```
# start the ORB service
uorb start

# start reqrd services for arducopter
mpu6000 start
ms5611 start
hmc5883 start
fmu start mode_pwm

# finally, start arducopter
ArduCopter start

# relinqish control of tty port
exit
```

# What's next?

Hack on ArduCopter with us: better control techniques enabled by extra RAM and
processor power.

Build more apps for PX4. Lots of new sensors and outputs are possible, and its
never been easier to extend the software.

Was this intimidating? We're working on a user friendly release. It'll be click
and go from the mission planner, just like with your APM.

# Thank You

`http://github.com/diydrones/ardupilot`

`pat@moreproductive.org`
