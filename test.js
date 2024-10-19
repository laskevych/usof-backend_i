const Where = require('./models/sql/where');
const UserModel = require('./models/user/model');
const AccessPolicy = require("./models/access/policy");
const AccessOperation = require("./models/access/operation");

const model = new UserModel();
/**
 * @type {UserEntity}
 */
const user = model.createEntity({
    id: 5
});

const user2 = model.createEntity({
    id: 34
});

const access = (new AccessPolicy(model))
    .setCreate([], [
        [
            { field: 'status', operator: '=', value: 'active' },
            { field: model._creationByRelationFieldName, operator: '=', value: ''}
        ],

    ]).setRead([], [
        { field: model._creationByRelationFieldName, operator: '=', value: '' }
    ]).setUpdate(['haha'], []);

const create = access.getUpdate(user);
// console.log(create);

const access2 = (new AccessPolicy(model).setCreate());
console.log(access2.getCreate());