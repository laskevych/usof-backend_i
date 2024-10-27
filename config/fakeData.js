import { faker } from '@faker-js/faker';
import PostModel from "../src/post/model.js";
import UserModel from "../src/user/model.js";
import CategoryModel from "../src/category/model.js";
import PostCategoryModel from "../src/post/category/model.js";
import PostFavoritesModel from "../src/post/favorite/model.js";
import CommentModel from "../src/comment/model.js";
import LikeModel from "../src/like/model.js";

(async () => {
    const NUMBER_OF_USERS = 15;
    const NUMBER_OF_POSTS = 50;
    const NUMBER_OF_CATEGORIES = 8;
    const NUMBER_OF_POST_CATEGORIES = NUMBER_OF_POSTS * 3;
    const NUMBER_OF_POST_FAVORITES = NUMBER_OF_USERS * (NUMBER_OF_POSTS/10);
    const NUMBER_OF_COMMENTS = 50;
    const NUMBER_OF_LIKES = 10;

    let userIds = [];
    let postIds = [];
    let categoryIds = [];
    let commentIds = [];

    for (let i = 0; i < NUMBER_OF_USERS; i++) {
        const model = new UserModel();
        const entity = model.createEntity();
        const firstName = faker.person.firstName();
        const lastName = faker.person.lastName();
        entity.login = faker.internet.displayName({ firstName, lastName }).toLowerCase();
        entity.fullName = `${firstName} ${lastName}`;
        entity.email = faker.internet.email({ firstName, lastName }).toLowerCase();
        entity.isVerified = true;
        entity.password = await model.createPassword(`$User2024`);
        entity.rating = faker.number.bigInt({ min: -10, max: 49 });
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        await entity.save();

        userIds.push(entity.id);
    }


    for (let i = 0; i < NUMBER_OF_POSTS; i++) {
        const model = new PostModel();
        const entity = model.createEntity();
        const status = faker.helpers.arrayElement(['active', 'inactive']);
        entity.creationById = faker.helpers.arrayElement(userIds);
        entity.title = faker.lorem.sentence();
        entity.content = faker.lorem.paragraphs(3);
        entity.status = faker.helpers.arrayElement(['active', 'inactive']);
        entity.showOnHomepage = status === 'active' ? faker.helpers.arrayElement([0, 1]) : 0;
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        await entity.save();

        postIds.push(entity.id);
    }


    for (let i = 0; i < NUMBER_OF_CATEGORIES; i++) {
        const model = new CategoryModel();
        const entity = model.createEntity();
        entity.title = faker.lorem.word({ length: { min: 4, max: 8 }, strategy: 'shortest' });
        entity.description = faker.lorem.sentence();
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        await entity.save();

        categoryIds.push(entity.id);
    }

    for (let i = 0; i < NUMBER_OF_COMMENTS; i++) {
        const model = new CommentModel();
        const entity = model.createEntity();
        entity.creationById = faker.helpers.arrayElement(userIds);
        entity.postId = faker.helpers.arrayElement(postIds);
        entity.content = faker.lorem.sentence();
        entity.status = faker.helpers.arrayElement(['active', 'inactive']);
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        await entity.save();

        commentIds.push(entity.id);
    }

    for (let i = 0; i < NUMBER_OF_POST_CATEGORIES; i++) {
        const model = new PostCategoryModel();
        const entity = model.createEntity();
        entity.categoryId = faker.helpers.arrayElement(categoryIds);
        entity.postId = faker.helpers.arrayElement(postIds);
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        try {
            await entity.save();
        } catch (e) {
            console.error(e.message);
        }
    }

    for (let i = 0; i < NUMBER_OF_POST_FAVORITES; i++) {
        const model = new PostFavoritesModel();
        const entity = model.createEntity();
        entity.creationById = faker.helpers.arrayElement(userIds);
        entity.postId = faker.helpers.arrayElement(postIds);
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        try {
            await entity.save();
        } catch (e) {
            console.error(e.message);
        }
    }


    for (let i = 0; i < NUMBER_OF_LIKES; i++) {
        for (let i = 0; i < postIds.length; i++) {
            const model = new LikeModel();
            const entity = model.createEntity();
            entity.creationById = faker.helpers.arrayElement(userIds);
            entity.postId = faker.helpers.arrayElement(postIds);
            entity.type = faker.helpers.arrayElement(['like', 'dislike']);
            entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
            try {
                await entity.save();
            } catch (e) {
                console.error(e.message);
            }
        }

        for (let i = 0; i < commentIds.length; i++) {
            const model = new LikeModel();
            const entity = model.createEntity();
            entity.creationById = faker.helpers.arrayElement(userIds);
            entity.commentId = faker.helpers.arrayElement(commentIds);
            entity.type = faker.helpers.arrayElement(['like', 'dislike']);
            entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
            try {
                await entity.save();
            } catch (e) {
                console.error(e.message);
            }
        }
    }

    const postModel = new PostModel();
    const posts = await postModel.getEntities();
    for (const post of posts) {
        await post.recalculateLikes();
    }
})();