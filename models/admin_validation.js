const db = require('./dbConfig.js');

var AdminDB = {};

AdminDB.getValidUser = function(email, password, callback) {
    var conn = db.getConnection();

    conn.connect((err)=> {
        if(err)
        {
            return callback(err,null);
        }
        else
        {
            console.log("Connected!");
            var sqlStmt = "SELECT * FROM sp_travel.admin where Email = ? and Password = ?";

            conn.query(sqlStmt, [email, password], (err,result)=> {
                conn.end();
                if (err) 
                {
                    console.log("Unable to run this sql query!");
                    return callback(err, null);
                }
                else 
                {
                    console.log("Sql query is successful!");
                    return callback(null, result);
                }
            });
        }
    });
}

module.exports = AdminDB;