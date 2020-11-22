var mysql = require("mysql");

var dbConnect = {};

dbConnect.getConnection = function() {
	var conn = mysql.createConnection(
		{
			"host": "localhost",
			"user": "root",
			"password": "web1Dev#",
			"database": "sp_travel"
		}
	);
	return conn;
}

module.exports = dbConnect;