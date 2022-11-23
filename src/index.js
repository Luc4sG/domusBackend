const express = require('express')
const morgan = require('morgan')
const cors = require('cors')


const taskRoute = require('./routes/task.routes')

const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use(cors());





app.use(taskRoute);

app.listen(4000);
console.log('Server on port 4000')