LoopiaAPI
=========
A thin wrapper for https://www.loopia.se/api

Note that the username and password is created specifically for the api; it is not the regular username and password used for logging in.


Example
-------

    var loopia = require('loopia-api');
    var client = loopia.createClient('username', 'password');

    client.getSubdomains(domain, function(error, subdomains) {
      subdomains.forEach(function(subdomain) {
        client.getZoneRecords(domain, subdomain, function(error, value) {
          console.log(subdomain, value);
        });
      });
    });
