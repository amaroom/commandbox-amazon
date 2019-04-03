<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        html, body { font-family: sans-serif;}
    </style>
    <title>Hello.</title>
</head>
<body>
    <h1>Hi there. Your Coldfusion server is running</h1>
    <p>It's <cfoutput>#dateFormat(now(),"long")#</cfoutput>.</p>
    <p>You can BIND or place your files in 
        this containers <code>/web/ROOT</code> folder.</p>
    <p>Don't forget to bind to this containers port <code>8080</code>.
    </p>
</body>
</html>