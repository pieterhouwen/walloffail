#!/bin/bash
checkroot
echo BUILDING THAT WALL!!
echo And make the hackers pay for it!
lastupdated=$(date)
echo Update lists. . .
$(pwd)/modules/updatelists.sh
art32=$(bash $(pwd)/modules/art32.sh)
top30names=$(cat /opt/zooi/networkoutput/master-user-list | head -n 30)
# sed ':a;N;$!ba;s/\n/\<br\>/g'
spiders=$(cat /var/log/nginx/access.log | grep -i spider | cut -d ] -f2 | tail -n30)
isps=$(sort -u $(pwd)/networkoutput/masterisptable)
ispsnumberd=$(#(pwd)/networkoutput/masteriptable-numberd)
echo Done!
cat <<EOF >/opt/zooi/walloffail/walloffail.html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta name="width=device-width; initial-scale=0; maximum-scale=1.0; user-scalable=0;">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Pieter Houwen">

    <!--  Le stylesheets  -->
    <link href="cssm/bootstrap.min.css" rel="stylesheet">
    <link href="cssm/font-awesome.min.css" rel="stylesheet">

    <!--  Le javascript  -->
    <script type="text/javascript" src="cssm/jquery.min.js"></script>
    <script type="text/javascript" src="cssm/bootstrap.min.js"></script>

    <style>
        section {
            padding-top: 50px; /* dit zit er om de statische navbar niet over je content heen te laten gaan wanneer de pagina geladen wordt. */
            margin-bottom: 1vh; /* dit zit er om de scroll-spy beter te laten werken. dit is niet nodig wanneer alle sections goed gevuld zijn. */
        }
    </style>

    <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#start">Wall Of Fail</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#attempts">Total amount of attempts</a></li>
                <li><a href="#top30">Top 30 used accounts</a></li>
                <li><a href="#isps">Invading ISP's</a></li>
                <li><a href="#spiders">Last 30 Spiders</a></li>
                <li><a href="#requests">Wacky requests</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<title>
The hackers paid for it!
</title>
</head>
<body>
    <div class="container">
        <section id="start">
        </section>
    </div>
    <div class="container">
        <section id="lastupdated">
		<div style="text-align:left"><h2>Wall has been updated at: $lastupdated</h2></div>
	</section>
    </div>
    <div class="container">
        <section id="attempts">
            <div style="text-align:left"><h2>Total amount of attempts </h2></div>
            <p>
		$art32
            </p>
        </section>
    </div>
    <div class="container">
        <section id="top30">
            <div style="text-align:left"><h2>Top 30 used accounts</h2></div>
		<p>
			<pre>
$top30names
			</pre>
		</p>
        </section>
    </div>
    <div class="container">
        <section id="spiders">
            <div style="text-align:left"><h2>Last 30 webspiders</h2></div>
			<p>
				<pre>
$spiders
				</pre>
			</p>
        </section>
    </div>
    <div class="container">
        <section id="isps">
            <div style="text-align:left"><h2>Invading ISP's</h2></div>
			<p>
				<pre>
$ispsnumberd
				</pre>
			</p>
        </section>
    </div>
    <div class="container">
        <section id="requests">
            <div style="text-align:left"><h2>Wacky requests</h2></div>
			<p>

			</p>
	</section>
    </div>
</body>
EOF
