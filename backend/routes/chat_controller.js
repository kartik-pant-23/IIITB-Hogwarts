const Discussion = require("../models/discussion")
const Group = require("../models/group")

exports.init_chat = (client) => {
    
    var _roomId, _type;
    client.on('joinRoom', ({roomId, type}) => {
        _roomId = roomId;
        _type = type;
        console.log('Someone joined..')
    })

    client.join(_roomId);

    client.on('disconnect', () => {
        client.leave(_roomId);
    })

    client.on('send', message => {
        saveMessage(_type, _roomId, message).then((result) => {
            if(result) {
                client.in(_roomId).emit('receive', {
                    user_id: message['user_id'],
                    name: message['name'],
                    message: message['message']
                })
            }
        });
    })

}

async function saveMessage(type, roomId, msg) {
    var chat = {
        user_id: msg['user_id'],
        name: msg['name'],
        message: msg['message']
    }
    switch(type) {
        case 'group':
            Group.update({_id:roomId}, {$push: {chat: chat} }).exec()
            .then(() => { return true; })
            .catch(() => { return false; })
            break;
        case 'discussion':
            Discussion.update({_id: roomId}, {$push: {chat: chat} }).exec()
            .then(() => { return true; })
            .catch(() => { return false; })
            break;
        default: return false;
    }
}