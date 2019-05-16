/** 
May 16th, 2019
Create layers for GeoServer: 
get maps from GeoServer using 'tiled' mode → this is faster for both the client and the server.

Constructor takes:
  - GeoServerRoot: like "http://ws.terramapadventure.com:8080/geoserver/"
  - layerName: the name of the layer

Methods:

- getFeature: returns a feature given a property and a latitude longitude as ffollows
  - lat
  - lng
  - featureName

*/

class GeoServerLayer {
	constructor(hash) {
		this.hash = hash;
	}

	getFeature(hash) {
		let bbox = [
			hash.lng - 1 / 7200,
			hash.lat - 1 / 7200,
			hash.lng + 1 / 7200,
			hash.lat + 1 / 7200,
		].join(',');

		let url = `${
			this.hash.GeoServerRoot
		}/wms?request=GetFeatureInfo&service=WMS&version=1.1.1&layers=${
			this.hash.layerName
		}&styles=&srs=EPSG%3A4326&format=image%2Fpng&bbox=${bbox}&width=1&height=1&query_layers=${
			this.hash.layerName
		}&info_format=application/json&propertyName=${
			hash.featureName
		}&feature_count=1&x=1&y=1`;

		console.log(url);

		let featureName = hash.featureName;

		return axios
			.get(url)
			.then(res => {
				return res.data.features[0].properties[hash.featureName];
			})
			.catch(err => {
				console.log('nope');
			});
	}
}

// const layer = new GeoServerLayer({
// 	GeoServerRoot: 'http://ws.terramapadventure.com:8080/geoserver',
// 	layerName: 'TMA-YAMC:ne_10m_admin_0_countries',
// });

// layer.getFeature({ lat: 35, lng: -106.5, featureName: 'NAME_EN' });

// console.log(layer);

/*


http://ws.terramapadventure.com:8080/geoserver//wms?request=GetFeatureInfo&service=WMS&version=1.1.1&layers=TMA-YAMC:ESACCI-LC-L4-LCCS-Map-300m-P1Y-2015-v2.0.7&styles=&srs=EPSG%3A4326&format=image%2Fpng&bbox=-106,35,-105.999722222222,35.0002777777778&width=1&height=1&query_layers=TMA-YAMC:ESACCI-LC-L4-LCCS-Map-300m-P1Y-2015-v2.0.7&info_format=application/json&propertyName=GRAY_INDEX&feature_count=1&x=1&y=1

*/
