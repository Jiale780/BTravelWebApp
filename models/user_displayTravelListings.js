const db = require("./dbConfig.js");

var userDB = {};

userDB.displayTravelListings = function(callback) {
    var conn = db.getConnection();

    conn.connect((err)=> {
        if(err)
        {
            console.log(err);
            return callback(err,null);
        }
        else
        {
            console.log("Connected!");
            var sqlStmt = "SELECT Travel_ID, Title, Country FROM sp_travel.travel_listing ORDER BY Country asc";

            conn.query(sqlStmt, [], (err,result)=> {
                conn.end();
                if (err) {
                    console.log("Unable to run this sql query!");
                    return callback(err, null);
                }
                else {
                    console.log("Sql query is successful!");
                    return callback(null, result);
                }
            });
        }
    });
}

module.exports = userDB;