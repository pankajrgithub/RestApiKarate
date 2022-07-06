function fn(){

var config = {
    name : "pankaj",
    baseUrl : "https://reqres.in/api"
};



var env = karate.env

karate.log("env variable value is:", env);

if(env == "qa"){

	config.baseUrl = 'https://reqres.in/api'
}
else if(env == "UAT"){

	config.baseUrl = 'https://reqres.in/api'
}
else {
	config.baseUrl = 'https://reqres.in/api'
}

return config;

}