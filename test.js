// const Where = require('./src/sql/where');
// const UserModel = require('./src/user/model');
const PostModel = require('./src/post/model');
// const AccessPolicy = require("./src/access/policy");
// const AccessOperation = require("./src/access/operation");

(async () => {
    const model = new PostModel();
    const post = await model.getEntityById(1);
    // await post.prepareRelationFields();
    console.log(post.toJSON());
})();



// const model = new UserModel();
// /**
//  * @type {UserEntity}
//  */
// const user = model.createEntity({
//     id: 5
// });
//
// const user2 = model.createEntity({
//     id: 34
// });
//
// const access = (new AccessPolicy(model))
//     .setCreate([], [
//         [
//             { field: 'status', operator: '=', value: 'active' },
//             { field: model._creationByRelationFieldName, operator: '=', value: ''}
//         ],
//
//     ]).setRead([], [
//         { field: model._creationByRelationFieldName, operator: '=', value: '' }
//     ]).setUpdate(['haha'], []);
//
// const create = access.getUpdate(user);
// // console.log(create);
//
// const access2 = (new AccessPolicy(model).setCreate());
// console.log(access2.getCreate());

