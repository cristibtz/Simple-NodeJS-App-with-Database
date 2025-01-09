var mysql = require('mysql');

var conn = mysql.createConnection({
  host: "192.168.100.149",
  user: "cristi",
  password: "2603"
});

conn.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});