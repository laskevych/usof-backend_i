const express = require('express');
const path = require('path');
const config = require('./config/app.json');

const jwtMiddleware = require('./src/auth/middlewares/jwt');

const userRouter = require('./src/user/routes');
const postRouter = require('./src/post/routes');
const categoryRouter = require('./src/category/routes');
const commentRouter = require('./src/comment/routes');
const authRoutes = require('./src/auth/routes');

const app = express();
const PORT = 8080;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/api/auth/', jwtMiddleware.setUserByJWT, authRoutes);
app.use('/api/posts/', jwtMiddleware.setUserByJWT, postRouter);
app.use('/api/categories/', jwtMiddleware.setUserByJWT, categoryRouter);
app.use('/api/comments/', jwtMiddleware.setUserByJWT, commentRouter);
app.use('/api/users/', jwtMiddleware.setUserByJWT, userRouter);


app.listen(PORT, () => {
    console.log(`Server: http://localhost:${PORT}`);
});