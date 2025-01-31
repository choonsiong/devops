const http = require("http"), os = require("os");

http.createServer((req, res) => {
    const dateTime = new Date(), load = os.loadavg(), doc = `<!DOCTYPE html>
    <html>
        <head>
            <title>Hello World</title>
            <meta charset="utf-8" />
        </head>
        <body>
            <h1>Hello World: node</h1>
            Server time: ${dateTime}<br/>
            Server utilization (load): ${load[0]}
        </body>
    </html>`
    res.setHeader('Content-Type', 'text/html')
    res.end(doc);
}).listen(8080);