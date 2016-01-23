var restify = require('restify');

function respond(req, res, next) {
	//res.send('hello ' + req.params.name);

	var orm = require("orm"); 

	orm.connect("mysql://root:root@localhost:3306/mynews", function(err, db) {
		if (err) throw err;

		var Manager = db.define("manager", {
			id: { type: 'serial', key: true },
			username: String,
			password: String,
			name: String
		});

		Manager.find({username:req.params.name}, function(err, people) {
			// SQL: "SELECT * FROM person WHERE surname = 'Doe'" 
			if (err) throw err;
			res.Charset('utf-8');
			res.send(people);
		});

	});

}

var server = restify.createServer();
server.get('/hello/:name', respond);
server.head('/hello/:name', respond);

server.listen(3900, function() {
	console.log('%s listening at %s', server.name, server.url);
});