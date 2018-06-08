#!/usr/bin/env node

var request = require('request');
var cheerio = require('cheerio');
//var semver = require('semver');

var baseUrl = 'https://www.factorio.com';
var versionRegex = /^(?:\/get-download\/)(.*)(?:\/headless\/linux64)$/;
var param = process.argv[2] || "version";

// Find:
// <h3>
// <p>
// <ul>
//     <li>
//         <a>

request(baseUrl + '/download-headless', function (error, response, html)
{
	if (!error && response.statusCode == 200)
	{
		var urls = [];
		var versions = [];
		var $ = cheerio.load(html);
		$('a').each(function(i, element)
		{
			var url = $(this).attr('href');
			var result = url.match(versionRegex);
			if (result !== null && result.length > 0)
			{
				var version = result[1];
				if (version !== null && version.length > 0)
				{
					urls.push(url);
					versions.push(version);
				}
			}
		});
		//var maxVersion = versions.sort(semver.rcompare)[0];
		var maxVersion = versions[0];
		var maxUrl = urls[versions.indexOf(maxVersion)];
		if (param === 'version') console.log(maxVersion);
		else if (param === 'url') console.log(baseUrl + maxUrl);
	}
});
