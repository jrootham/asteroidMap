$(document).ready
(
	function() {
		try {
			thing.setLoggedOffState();
			
			navigator.id.watch({
				loggedInUser: undefined,
				onlogin: thing.login,
				onlogout: thing.logoff
			});
	}
);


var thing = {
	login: function(assertion) {
		var data = thing.mergeSessionKey({assertion: assertion});
		Connect("app/logon.php", data, thing.loggedin);
	},
	
	loggedin: function(data) {
		if (data.status === "okay") {
			thing.setLoggedOnState(data.email);
		}
		else {
			alert("Login failed");
			thing.logoff();
			thing.setLoggedOffState();
		}
	},

	setLoggedOnState: function(email) {
	},
	
	logoff: function() {
		var data = thing.mergeSessionKey({});
		Connect("app/logoff.php", data, thing.setLoggedOffState);
	},
	
	setLoggedOffState: function() {
	},

	mergeSessionKey : function(values) {
		values["sessionkey"] = $("#global").data("session-key");
		return values;
	},


};
              
