var firebase = require('firebase');
var app = firebase.initializeApp({
  databaseURL: 'https://terramapadventur-1549998665553.firebaseio.com/'
      });

firebase.database().ref('users').set(
 {a: 1, b: 2, c: 3});
