const express = require('express');
const app = express();
const robot = require("robotjs");
const http = require("http");
const server = http.createServer(app);
var io = require("socket.io")(server, { cors: { origin: "*" } });
var x_position = 0;
var y_position = 0;

app.get('/', (req, res)=>{
    res.send('Test complete, running');
})

io.on('connection', (socket)=>{
    console.log(' a user connected');
    console.log(socket.id);
    socket.emit('server response', 'User now connected');

    socket.on('onPanDown', command =>{
        var commandJSON = JSON.parse(command);
        x_position = x_position + commandJSON.x;
        y_position = y_position + commandJSON.y;      
        robot.dragMouse(x_position, y_position);
    });

    socket.on('typedMessage', data=>{
        console.log(data);
        robot.typeString(data);
    })

    socket.on('onPanEnd', (data)=>{
        robot.moveMouse(x_position,y_position);
    })

    socket.on('Click', button =>{
        if (button == 'LMB'){
            robot.mouseClick("left");
        } else {
            robot.mouseClick("right");
        }
    });

    socket.on('disconnect', ()=>{
        console.log('the user disconnected');
        x_position = 0;
        y_position = 0;

    });


});


server.listen(3000, ()=>{console.log('App running on port 3000')})