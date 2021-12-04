const express = require('express');
const app = express();
const robot = require("robotjs");
const http = require("http");
const server = http.createServer(app);
var io = require("socket.io")(server, { cors: { origin: "*" } });
const x = robot.getMousePos();
console.log(x);

app.get('/', (req, res)=>{
    res.send('Test complete, running');
})

io.on('connection', (socket)=>{
    console.log(' a user connected');
    console.log(socket.id);
})

io.on('msg', data=>{
    console.log(data);
})

server.listen(3000, ()=>{console.log('App running on port 3000')})