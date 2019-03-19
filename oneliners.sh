# this runs the test in sockettest1.txt
pkill game-engine ; ./game-engine-websocket-secure.pl --debug ; ./socketesting.pl < sockettest1.txt
