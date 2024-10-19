const Where = require('./../sql/where')

class AccessOperation {
    /**
     * @type {[string]}
     */
    fields;

    /**
     * @type {[Where]}
     */
    filter;

    /**
     * @param {[string]} fields
     * @param {[Where]} filter
     */
    constructor(fields = [], filter = []) {
        this.fields = fields;
        this.filter = filter;
    }
}

module.exports = AccessOperation;