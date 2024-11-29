const mongoose = require('mongoose')
const express = require('express')
const app = express()
const port = 3000



mongoose.Promise = global.Promise;
const uri = "mongodb+srv://tejada:S1040874132ss@cluster0.rfujn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0/ecom"
const clientOptions = { serverApi: { version: '1', strict: true, deprecationErrors: true } };


mongoose.connect(uri, clientOptions).then(() => {
    console.log('DB connected');
}, (err) => {
    console.log('DB error CONN => ', err);
});

app.use(express.json());

app.use('/', require('./routes/app.routes'));


app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.listen(port, () => {
    console.log(`app listening on port ${port}`)
})
