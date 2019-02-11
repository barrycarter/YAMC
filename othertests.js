var jimp = require('jimp');

console.log("alpha");

// jimp.read('lcc_east_1km.tif', (err, lenna) => {

jimp.read('MapTiles/lcc_east_04.png', (err, lenna) => {
    if (err) throw err;
    console.log("image loaded");
    console.log(jimp.intToRGBA(lenna.getPixelColor(10,10)));
  }
);

jimp.read('MapTiles/lcc_east_01.png', (err, lenna) => {
    if (err) throw err;
    console.log("image loaded");
    console.log(jimp.intToRGBA(lenna.getPixelColor(10,10)));
  }
);

jimp.read('MapTiles/lcc_east_02.png', (err, lenna) => {
    if (err) throw err;
    console.log("image loaded");
    console.log(jimp.intToRGBA(lenna.getPixelColor(10,10)));
  }
);

jimp.read('MapTiles/lcc_east_03.png', (err, lenna) => {
    if (err) throw err;
    console.log("image loaded");
    console.log(jimp.intToRGBA(lenna.getPixelColor(10,10)));
  }
);

jimp.read('MapTiles/lcc_east_05.png', (err, lenna) => {
    if (err) throw err;
    console.log("image loaded");
    console.log(jimp.intToRGBA(lenna.getPixelColor(10,10)));
  }
);

/* failed code

var fs = require('fs'), PNG = require('pngjs').PNG;

fs.createReadStream('lcc.png')
    .pipe(new PNG({
        filterType: 4
    }))
    .on('parsed', function() {

for (var y = 0; y < this.height; y++) {
 for (var x = 0; x < this.width; x++) {
   var idx = (this.width * y + x) << 2;
   console.log(x,y,this.data[idx]);
 }
 }
      });

*/

/* sample code

fs.createReadStream('in.png')
    .pipe(new PNG({
        filterType: 4
    }))
    .on('parsed', function() {
 
        for (var y = 0; y < this.height; y++) {
            for (var x = 0; x < this.width; x++) {
                var idx = (this.width * y + x) << 2;
 
                // invert color
                this.data[idx] = 255 - this.data[idx];
                this.data[idx+1] = 255 - this.data[idx+1];
                this.data[idx+2] = 255 - this.data[idx+2];
 
                // and reduce opacity
                this.data[idx+3] = this.data[idx+3] >> 1;
            }
        }
 
        this.pack().pipe(fs.createWriteStream('out.png'));
    });

*/
