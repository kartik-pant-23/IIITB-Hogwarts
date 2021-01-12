const mongoose = require('mongoose');

const connectDb = async () => {
    
    const conn = await mongoose.connect(
        process.env.DB_URL,
        {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useCreateIndex: true,
            useFindAndModify: false
        }
    ).then(() => {
        console.log("Db connection successful!");
    }).catch(() => {
        console.log("Db connection failed!")
    });

}

module.exports = connectDb;