const http = require('http');

const port = process.env.PORT;
console.log(process.env.NODE_ENV);

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end("Hey, Hi Mark");
});

server.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});
