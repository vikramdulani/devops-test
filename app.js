const fs = require("fs");
var obj;

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
