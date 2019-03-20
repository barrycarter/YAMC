// TODO: why can't I do this
// var ol = require('ol');


function make_map() {

console.log(ol);

 var center = ol.proj.fromLonLat([-106.5, 35.05]);
 var view = new ol.View({center: center, zoom: 4});
 var layers = [new ol.layer.Tile({source: new ol.source.OSM()})];
 var map = new ol.Map({target: 'map', view: view, layers: layers});
 var bounds = new OpenLayers.Bounds(45, 135, 90, 180);

 var graphic = new OpenLayers.ImageLayer({source: 'MapTiles/lcc-reduced-19.png'});

 map.addLayers([graphic]);

}
