// Import required library
const fs = require("fs");

var obj;

// Read the JSON file and parse the data into obj
// Iterate over the objects and grab the key values for first , last  and domain names.
// print the email based on these values

fs.readFile("string.json", "utf8", function (err, data) {
  if (err) throw err;
  var obj = JSON.parse(data);

  Object.keys(obj).forEach((key) => {
    console.log(
      obj[key].first_name +
        "." +
        obj[key].last_name +
        "@" +
        obj[key].domain +
        ".com"
    );
  });
});
