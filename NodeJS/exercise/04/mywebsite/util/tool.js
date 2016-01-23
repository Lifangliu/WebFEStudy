module.exports = {
	extend: function(target, source, flag) {
		for (var key in source) {
			if (source.hasOwnProperty(key))
				flag ?
				(target[key] = source[key]) :
				(target[key] === void 0 && (target[key] = source[key]));
		}
		return target;
	},
	mypassword: function(data) {
		var Buffer = require("buffer").Buffer;
		var buf = new Buffer(data);
		var str = buf.toString("binary");
		var crypto = require("crypto");
		var password = crypto.createHash("md5").update(str).digest("hex");
		return crypto.createHash("md5").update(password).digest("hex");
	}
}