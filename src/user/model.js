import Model from "../model.js";
import UserEntity from "./entity.js";
import Where from "../sql/where.js";
import * as argon2 from "argon2";
import LikeModel from "../like/model.js";
import PostModel from "../post/model.js";
import CommentModel from "../comment/model.js";

class UserModel extends Model {
    constructor() {
        super(
            'users',
            [
                'id',
                'login',
                'fullName',
                'password',
                'email',
                'isVerified',
                'profilePicture',
                'rating',
                'role',
                'creationAt'
            ],
            UserEntity
        );
    }

    /**
     * @param {string} login
     * @return {Promise<UserEntity>}
     */
    async getByLogin(login) {
        return this.getEntities([], [ new Where('login', '=', login) ], 'id', 1);
    }

    /**
     * @param {string} email
     * @return {Promise<UserEntity>}
     */
    async getByEmail(email) {
        return this.getEntities([], [ new Where('email', '=', email) ], 'id', 1);
    }

    /**
     * @param {string} password
     * @param {string} passwordHash
     * @return {Promise<boolean>}
     */
    async isValidPassword(password, passwordHash) {
        return await argon2.verify(passwordHash, password);
    }

    /**
     * @param {string} password
     * @return {Promise<String>}
     */
    async createPassword(password) {
        return await argon2.hash(password, { salt: Buffer.from(process.env.APP_SECRET) });
    }

    /**
     * @param {number} userId
     * @return {Promise<void>}
     */
    async recalculateRatingByUserId(userId) {
        const user = await this.getEntityById(userId);
        if (!user) {
            return;
        }

        const postModel = new PostModel();
        const commentModel = new CommentModel();
        const likeModel = new LikeModel();

        const posts = await postModel.getEntities([], [
            new Where(postModel._creationByRelationFieldName, '=', userId)
        ]);

        const comments = await commentModel.getEntities([], [
            new Where(commentModel._creationByRelationFieldName, '=', userId)
        ]);

        let rating = 0;
        if (posts.length > 0) {
            const postLikes = await likeModel.getEntities([], [
                new Where('postId', 'IN', posts.map(post => post.id))
            ]);

            postLikes.forEach(like => {
                if (like.isLike()) {
                    rating++;
                } else {
                    rating--;
                }
            });
        }

        if (comments.length > 0) {
            const commentLikes = await likeModel.getEntities([], [
                new Where('commentId', 'IN', comments.map(comment => comment.id))
            ]);

            commentLikes.forEach(like => {
                if (like.isLike()) {
                    rating++;
                } else {
                    rating--;
                }
            });
        }

        user.rating = rating;
        await user.save();
    }
}
export default UserModel;