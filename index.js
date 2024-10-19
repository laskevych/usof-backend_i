const express = require('express');
const path = require('path');
const config = require('./config/app.json');

const jwtMiddleware = require('./middleware/jwt');

const userRouter = require('./routes/userRoutes');
const postRouter = require('./routes/postRoutes');

const app = express();
const PORT = 8080;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/api/posts/', jwtMiddleware.setUserByJWT, postRouter);
app.use('/api/users/', jwtMiddleware.setUserByJWT, userRouter);


app.listen(PORT, () => {
    console.log(`Server: http://localhost:${PORT}`);
});