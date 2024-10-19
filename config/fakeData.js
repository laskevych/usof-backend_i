const { faker } = require('@faker-js/faker');
const PostModel = require('./../models/post/model');
const UserModel = require('./../models/user/model');
const CategoryModel = require('./../models/category/model');
// const Comment = require('./../engine/comment/module');
// const PostCategory = require('./../engine/post/category/module');
// const Like = require('./../engine/like/module');

(async () => {
    const NUMBER_OF_USERS = 15;
    const NUMBER_OF_POSTS = 50;
    const NUMBER_OF_CATEGORIES = 8;
    // const NUMBER_OF_POST_CATEGORIES = 200;
    // const NUMBER_OF_COMMENTS = 50;
    // const NUMBER_OF_LIKES = 10;

    let userIds = [];
    let postIds = [];
    let categoryIds = [];
    // let commentIds = [];

    for (let i = 0; i < NUMBER_OF_USERS; i++) {
        const model = new UserModel();
        const entity = model.createEntity();
        const firstName = faker.person.firstName();
        const lastName = faker.person.lastName();
        entity.login = faker.internet.displayName({ firstName, lastName });
        entity.fullName = `${firstName} ${lastName}`;
        entity.email = faker.internet.email({ firstName, lastName });
        entity.isVerified = true;
        entity.password = faker.internet.password();
        entity.rating = faker.number.bigInt({ min: -10, max: 49 });
        entity.creationAt = faker.date.between({ from: '2024-01-01T00:00:00.000Z', to: '2024-10-15T00:00:00.000Z' });
        await entity.save();

        userIds.push(entity.id);
    }


    for (let i = 0; i < NUMBER_OF_POSTS; i++) {
        const model = new PostModel();
        const entity = model.createEntity();
        entity.creationById = faker.helpers.arrayElement(userIds);
        entity.title = faker.lorem.sentence();
        entity.content = faker.lorem.paragraphs(3);
        entity.status = faker.helpers.arrayElement(['active', 'inactive']);
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
    //
    // for (let i = 0; i < NUMBER_OF_COMMENTS; i++) {
    //     const module = new Comment();
    //     const record = module.createRecordObject();
    //     record.createdByUserId = faker.helpers.arrayElement(userIds);
    //     record.postId = faker.helpers.arrayElement(postIds);
    //     record.content = faker.lorem.sentence();
    //     record.createdAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //     record.updatedAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //     await record.save();
    //
    //     commentIds.push(record.id);
    // }
    //
    // for (let i = 0; i < NUMBER_OF_POST_CATEGORIES; i++) {
    //     const module = new PostCategory();
    //     const record = module.createRecordObject();
    //     record.categoryId = faker.helpers.arrayElement(categoryIds);
    //     record.postId = faker.helpers.arrayElement(postIds);
    //     record.createdAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //     record.updatedAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //     try {
    //         await record.save();
    //     } catch (e) {
    //         console.error(e.message);
    //     }
    // }
    //
    // for (let i = 0; i < NUMBER_OF_LIKES; i++) {
    //     for (let i = 0; i < postIds.length; i++) {
    //         const module = new Like();
    //         const record = module.createRecordObject();
    //         record.createdByUserId = faker.helpers.arrayElement(userIds);
    //         record.postId = faker.helpers.arrayElement(postIds);
    //         record.type = faker.helpers.arrayElement(['like', 'dislike']);
    //         record.createdAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //         record.updatedAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //         try {
    //             await record.save();
    //         } catch (e) {
    //             console.error(e.message);
    //         }
    //     }
    //
    //     for (let i = 0; i < commentIds.length; i++) {
    //         const module = new Like();
    //         const record = module.createRecordObject();
    //         record.createdByUserId = faker.helpers.arrayElement(userIds);
    //         record.commentId = faker.helpers.arrayElement(commentIds);
    //         record.type = faker.helpers.arrayElement(['like', 'dislike']);
    //         record.createdAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //         record.updatedAt = faker.date.between({ from: '2022-01-01T00:00:00.000Z', to: '2024-10-05T00:00:00.000Z' });
    //         try {
    //             await record.save();
    //         } catch (e) {
    //             console.error(e.message);
    //         }
    //     }
    // }
    //
    // const postModule = new Post();
    // const likeModule = new Like();
    // const posts = await postModule.getRecords();
    // for (const post of posts) {
    //     await likeModule.recalculateLikesByPostId(post.id);
    // }
})();