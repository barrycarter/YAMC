# :earth_africa: TERRA MAP ADVENTURE

*Currently a work in progress.*

**First text-adventure game played on a real world map.**


[![text-adventure game played on a real world map](https://i.imgflip.com/2x1nda.gif)]()



:wrench: :hammer: Build with the following:

Front End Development | Back End Development | Database | Misc
------------ | ------------- | ------------- | -------------
HTML5, CSS3, JavaScript | Pearl5 / Node.js | SQLite3 | Websocket


:couple: :couple: **Are you interested to contribute directly in our distributed team?**

:tada: We’re excited to have you as part of our small team! 

:running: Join us in CodeBuddies server in Discord at [Terra Map Adventure channel #project-tma](https://discord.gg/R4vBfV8) 


:fork_and_knife: If you just want to use the codebase for learning purpose, feel free to create your own fork of the code and do the changes in your fork.



## :muscle: MOTIVATION
Developing a fun, entertaining and educating game. Terra Map Adventure’s purpose to raise the philanthropy mindset and spirit by prioritizing collaboration and barter mechanism for mutual prosperity. It is intended as a fun project in a study group to learn programming and collaborating remotely as a team.



## :computer: HOW TO PLAY?
1. The players travel on the world map to find different kinds of resources.
2. The players themselves don't need food or energy, but they can use it to obtain resources.
3. They can use resources to build roads or housing, ultimately to benefit the people who live on the world.
4. The people that the player finds are homeless and not working. By assigning them work, the players gives them a job, a home, and a sense of purpose in improving their world.
5. For each tile the player gets, the player can have the assistance of one people. If the player wants more people to help, then the player needs to go to an urban area to get some people.

 
 
## :sunrise_over_mountains: WHERE TO PLAY?
* Website http://terramapadventure.com/
* Demo site for testing http://terramapadventure.herokuapp.com/



## :camera: SCREENSHOT
[![text-adventure game played on a real world map](https://i.postimg.cc/023yDrFT/screencapture-terramaptools-6-barrycarter1-repl-co-2019-03-26-02.png)](https://postimg.cc/nC4xtVH2)



## :mag_right: FEATURE
The first text-based game in the software development using real world map from Google Maps database.



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
* Initiator & Project Manager: [Barry Carter](https://github.com/barrycarter)
* Front End Engineer: [Anthony](https://github.com/47analogy), [Doha Helmy](https://github.com/dohahelmy)
* Back End Engineer: [Barry Carter](https://github.com/barrycarter), [Smill Vásquez](https://github.com/svasquez)
* Researcher, Documentation, User Testing: [Eri Hariono](https://github.com/hanacaraka)



## :bookmark_tabs: RESOURCES
* Google Maps: http://test.barrycarter.info/bc-image-overlay-nokml.pl?url=lcc.png
* NASA (and others) classify lands into 16 different categories: https://eoimages.gsfc.nasa.gov/images/imagerecords/61000/61004/lcc_key.jpg 
* Maps: https://visibleearth.nasa.gov/view.php?id=61004 
* Lists of other types of map: https://visibleearth.nasa.gov/ 



## :bookmark: TECHNICAL REMARKS
* World map 43200x21600 image representing earth land types, cylindrical projection.
* Pixel to latitude/longitude translation:
  - x pixels go from 0 to 43199 (for 43200 pixels total)
  - y pixels go from 0 to 21599 (for 21600 pixels total)
  - each pixel is 1/120 degree wide and 1/120 degree high
  - x pixel to lon: (2x-43199)/240 [center of pixel]
  - lon to x pixel: (43199+240x)/2
  - y pixel to lat: (21599-2x)/240
  - lat to y pixel: (21599-240x)/2



## :relaxed: SUPPORT
Reach out to Barry Carter at one of the following places!
* Twitter at @BarryCarter2019
* Discord at @barrycarter#1894
* GitHub at @BarryCarter 
* Email to yamc@barrycarter.info
* Repository at https://github.com/barrycarter/YAMC



## :gift_heart: ACKNOWLEDGMENTS
* We are grateful to our team members who previously contributed to Terra Map Adventure project: [Noragne](https://github.com/noragne) & Pedro

* *Inspiration*
1. https://www.facebook.com/FarmVille/
1. https://en.wikipedia.org/wiki/M.U.L.E.
1. https://civilization.com/
1. https://glitch.com/~dive-the-game


## :minidisc: LICENSE
MIT


## :pushpin: NOTES
* This README serve as a living document and being updated.
* The project is started on January 25th, 2019.
* Brainstorming and resume of team initial discussions can be found [here](https://github.com/barrycarter/YAMC/blob/master/BRAINSTORMING.notes).


