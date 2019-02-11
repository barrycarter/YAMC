// mongo db testing
var mongodb = require('mongodb');
var MongoClient = mongodb.MongoClient;
var url = process.env.MONGODB_URI;

MongoClient.connect(url, function (err, db) {
    if (err) {
      console.log('Unable to connect to the mongoDB server. Error:', err);
    } else {
      console.log('Connection established to mongodb');

      //      console.log(db);

      var dbo = db.db("heroku_0k4fvcm4");
      var query = {};

      dbo.collection("users").find(query).toArray(function(err, result) {
	  if (err) throw err;
	  console.log(result);
	});

      // do some work here with the database.

      //Close connection
      db.close();
    }
  });


