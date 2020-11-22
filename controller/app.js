const express = require("express");
var app = express();
/* By using express-session library*/
session = require("express-session");

var Admin1 = require("../models/admin_validation.js");
var User1 = require("../models/user_getTravelListings.js");
var User2 = require("../models/user_getTravelListsDescription.js");
var User3 = require("../models/user_getItineraryByTravelID.js");
var User4 = require("../models/user_displayTravelListings.js");
var Admin2 = require("../models/admin_addTravelDetail.js");
var Admin3 = require("../models/admin_addItineraryDetail.js");

app.use(express.json());

/* Created a session */
app.use(session({
    secret: "2FA1-I92I-VZXA25",
    resave: true,
    saveUninitialized: true
}));

/* Authentication and Authorization of Middleware */
var authentication = (req, res, next) => {
    if (req.session && req.session.user === req.params.user && req.session.admin) {
        return next();
    }
    else {
        return res.sendStatus(401);
    }
};

/* Login Endpoint
http://localhost:5000/login_validation/CalebYeoh50@hotmail.com&Jiale578
method: GET
return: Ensure that one admin record if email and password are entered correctly
*/
app.get("/login_validation/:email&:password", (req, res) => {
    var email = req.params.email;
    var password = req.params.password;

    Admin1.getValidUser(email, password, (err, result) => {
        if (result.length > 0) {
            req.session.admin = true;
            res.send("Admin successfully login...");
        } else {
            res.send("Invalid Login Error - Please try login again!");
        }
    });
});

/* Logout Endpoint
http://localhost:5000/logout_validation */
app.get("/logout_validation", (req, res) => {
    req.session.destroy();
    res.status(500).send("Admin succesfully logout...");
});

/* API Endpoint for Admin Validation
http://localhost:5000/api/user/CalebYeoh50@hotmail.com&Jiale578
method: GET
return: Ensure that one admin record if email and password are entered correctly. */
app.get("/api/user/:email&:password", authentication, (req, res) => {
    var email = req.params.email;
    var password = req.params.password;

    Admin1.getValidUser(email, password, (err, result) => {
        if (!err) {
            res.status(200);
            res.send(result);
        }
        else {
            console.log(err);
            res.status(500).send("Invalid Error");
        }
    });
});

/* API Endpoint by getting all travel listings
http://localhost:5000/api/travel_listings
method: GET
return: To retrieve all the travel listings. */
app.get("/api/travel_listings", (req, res) => {
    User1.getTravelListings((err, result) => {
        if (err) {
            res.status(500).json(err);
        }
        else {
            res.status(200).json(result);
        }
    });
});

/* API Endpoint by getting travel listings based on substring of description & sorted in ascending in price
http://localhost:5000/api/travel_listing/Virtual_Tourism_in_Japan
method: GET
return: To retrieve all the travel listings based on substring of description & sorted in ascending in price. */
app.get("/api/travel_listing/:description", (req, res) => {
    var id = req.params.description;

    User2.getTravelListsDescription(id, (err, result) => {
        if (!err) {
            res.status(200);
            res.send(result);
        }
        else {
            console.log(err);
            res.status(500).send("Invalid Error");
        }
    });
});

/* API Endpoint by getting itineraries for a particular travel listing which based on travel listing id
http://localhost:5000/api/travel_listing/2/itinerary
method: GET
return: To retrieve all the itineraries for a particular travel listing which based on travel listing id. */
app.get("/api/travel_listing/:Travel_ID/itinerary", (req, res) => {
    var id = req.params.Travel_ID;

    User3.getItineraryByTravelID(id, (err, result) => {
        if (!err) {
            res.status(200);
            res.send(result);
        }
        else {
            console.log(err);
            res.status(500).send("Invalid Error");
        }
    });
});

/* API Endpoint by adding new travel details
http://localhost:5000/api/addtraveldetail
method: POST
return: To insert the new travel details. 
notice: The Travel_Period format need to be in 02-2030 and Date_Inserted need to be in timestamp format (2030-01-01 11:25:00)*/
var bodyParser = require("body-parser");
// Run body parser module
var urlencodedParser = bodyParser.urlencoded({ extended: false });

// Run body parser middleware
app.use(urlencodedParser); // attach body-parser middleware
app.use(bodyParser.json()); // parse json data

app.post("/api/addtraveldetail", authentication, (req, res) => {

    var title = req.body.Title;
    var description = req.body.Description;
    var price = req.body.Price;
    var country = req.body.Country;
    var travel_period = req.body.Travel_Period;
    var image_URL = req.body.Image_URL;
    var date_inserted = req.body.Date_Inserted;

    Admin2.addTravelDetail(title, description, price, country, travel_period, image_URL, date_inserted, (err, result) => {
        if (err) {
            res.status(500).json({ "message": err });
        }
        else {
            res.status(201).json({ "1 travel details has been inserted": result });
        }
    });
});

/* API End point by adding new travel itinerary
http://localhost:5000/api/additinerarydetail
method: POST
return: To insert the new travel itineraries. 
notice: The Day and Travel_ID need to be in number digits. */
var bodyParser = require("body-parser");
// Run body parser module
var urlencodedParser = bodyParser.urlencoded({ extended: false });

// Run body parser middleware
app.use(urlencodedParser); // attach body-parser middleware
app.use(bodyParser.json()); // parse json data

app.post("/api/additinerarydetail", authentication, (req, res) => {

    var Day = req.body.Day;
    var Activity = req.body.Activity;
    var Travel_ID = req.body.Travel_ID;

    Admin3.addItineraryDetail(Day, Activity, Travel_ID, (err, result) => {
        if (err) {
            res.status(500).json({ "message": err });
        }
        else {
            res.status(201).json({ "1 travel itinerary has been inserted": result });
        }
    });
});

/* API End point by displayed of the Travel ID, Title and Country in the travel listings 
sorted by the country in the ascending order. 
http://localhost:5000/api/travel_listings
method: GET
return: To get all Travel ID, Title and Country of the travel listings sorted by the country in the ascending order. */
app.get("/api/displaytravellistings", (req, res) => {
    User4.displayTravelListings((err, result) => {
        if (err) {
            res.status(500).json(err);
        }
        else {
            res.status(200).json(result);
        }
    });
});

module.exports = app;