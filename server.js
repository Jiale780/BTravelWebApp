var app = require("./controller/app.js");
var port = 5000

var server = app.listen(port, function () {

    console.log('Web App Hosted at http://localhost:%s',port);

});