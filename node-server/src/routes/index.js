((routes)=>{
    const socketio = require('socket.io');
    routes.init = (server)=>{
        var io = socketio.listen(server);

        io.sockets.on("connection", (socket)=>{
             //TODO:  Set Events Here
        })
    }

})(module.exports);