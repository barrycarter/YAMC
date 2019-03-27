# :earth_africa: TERRA MAP ADVENTURE
*Currently a work in progress.*
**First text-adventure game played on a real world map.**

![text-adventure game played on a real world map](https://telegra.ph/file/263a4eae7e19223a10120.mp4)


:wrench: :hammer: Build with the following:

* Front End Development
HTML5, CSS3, JavaScript

* Back End Development
Pearl5

* Database
SQLite


:couple: :couple: **Are you interested to contribute directly in our distributed team?**
:tada: We’re excited to have you as part of our small team! 
:running: Join us in CodeBuddies server in Discord at [Terra Map Adventure channel #project-tma](https://discord.gg/R4vBfV8) 

:fork_and_knife: If you just want to use the codebase for learning purpose, feel free to create your own fork of the code and do the changes in your fork.


## :muscle: MOTIVATION
Developing a fun, entertaining and educating game. Terra Map Adventure’s purpose to raise the philanthropy mindset and spirit by prioritizing collaboration and barter mechanism for mutual prosperity. It is intended as a fun project in a study group to learn programming and collaborating remotely as a team.


## :computer: HOW TO PLAY?
* Each player decide which location s/he want to manage the resources among the 8 type of lands.
* Arriving at the designated land, the player start to look for collaboration or barter if there is any human(s).
* If the player(s) can find the human(s) to partner with, s/he will join with him/her/them to harvest vegetation (wood, food, leaves, grass, etc.) and/or collect existing natural resources (sand, soil, animals, minerals, oxygen, water, etc.).
* If the player(s) find no humans exist, s/he will seek energy and/or animal(s) to help him/her harvest vegetation (wood, food, leaves, grass, etc.) and/or collect existing natural resources (sand, soil, minerals, oxygen, water, etc.).
* The harvesting aim to provide the player a shelter to live, and food to eat.

 
## :sunrise_over_mountains: WHERE TO PLAY?
* Website http://terramapadventure.com/
* Demo site for testing http://terramapadventure.herokuapp.com/


## :camera: SCREENSHOTS
![text-adventure game played on a real world map](https://i.imgur.com/zvI4eew.png)



## :mag_right: FEATURES
The first game in the software development using real world map from Google Maps database.


## :floppy_disk: CODE EXAMPLE

```
while (1) {
  print "Command > ";
  my $cmd = <>;
  debug("CMD: $cmd");

  # parse the command, so that "a b c" becomes "command_a(b,c)"
  my(@cmd) = split(/\s+/, $cmd);
  my($cmd) = shift(@cmd);

  # allow command aliasing
  if ($aliases{$cmd}) {$cmd = $command_aliases{$cmd};}

  my($args) = join(", ",@cmd);
  my($eval) = "command_$cmd($args)";
```


## :busts_in_silhouette: TEAM
* Initiator & Project Manager: Barry Carter
* Front End Engineer: Anthony, Doha Helmy
* Back End Engineer: Barry Carter
* Researcher, Documentation, User Testing: Eri Hariono


## :bookmark_tabs: RESOURCES
* Google Maps: http://test.barrycarter.info/bc-image-overlay-nokml.pl?url=lcc.png
* NASA (and others) classify lands into 16 different categories: https://eoimages.gsfc.nasa.gov/images/imagerecords/61000/61004/lcc_key.jpg 
* Maps: https://visibleearth.nasa.gov/view.php?id=61004 
Lists of other types of map: https://visibleearth.nasa.gov/ 


## :bookmark: TECHNICAL REMARKS
* World map 43200x21600 image representing earth land types, cylindrical projection.
* Pixel to latitude/longitude translation:
x pixels go from 0 to 43199 (for 43200 pixels total)
y pixels go from 0 to 21599 (for 21600 pixels total)
each pixel is 1/120 degree wide and 1/120 degree high
x pixel to lon: (2x-43199)/240 [center of pixel]
lon to x pixel: (43199+240x)/2
y pixel to lat: (21599-2x)/240
lat to y pixel: (21599-240x)/2


## :relaxed: SUPPORT
Reach out to Barry Carter at one of the following places!
* Twitter at @BarryCarter2019
* Discord at @barrycarter#1894
* Email to yamc@barrycarter.info
* Repository at https://github.com/barrycarter/YAMC


## :gift_heart: ACKNOWLEDGMENTS
We are grateful to our previous team members who previously contributed to Terra Map Adventure project: Noragne & Pedro

*Inspiration*
https://www.facebook.com/FarmVille/
https://en.wikipedia.org/wiki/M.U.L.E.
https://civilization.com/
https://glitch.com/~dive-the-game


## :minidisc: LICENSE
MIT


## :pushpin: NOTES
* This README serve as a living document and being updated.
* The project is started on January 25th, 2019.
* Brainstorming and resume of team initial discussions can be found [here](https://github.com/barrycarter/YAMC/blob/master/BRAINSTORMING.notes).


