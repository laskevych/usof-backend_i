import Controller from './../../controller.js';
import PostFavoritesModel from "./model.js";
import Where from "../../sql/where.js";

class PostFavoriteController extends Controller {
    constructor() {
        super(new PostFavoritesModel());
    }

    /**
     * @param {Request} req
     * @param {Response} res
     * @param {NextFunction} next
     * @return {Promise<Response>}
     */
    async createFavoriteByPostId(req, res, next) {
        try {
            req.body.postId = Number(req.params.postId);

            const fields = this._prepareFields(req);
            if (this._model._fields.includes(this._model._creationByRelationFieldName)) {
                fields[this._model._creationByRelationFieldName] = req.user.id;
            }

            const currentFavoritePostsIds = await this._model.getPostIdsByUserId(req.user.id);
            if (currentFavoritePostsIds.includes(Number(req.body.postId))) {
                return this._returnResponse(res, 400, {}, 'Entity is exist');
            }

            const newEntity = await this._model.createEntity(fields);
            await newEntity.save();

            return this._returnResponse(res, 201, {
                data: newEntity.toJSON()
            });
        } catch (e) {
            next(e);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<Response>}
     */
    async deleteFavoriteByPostId(req, res, next) {
        try {
            let filters = [
                new Where(
                    'postId',
                    '=',
                    Number(req.params.postId)
                )
            ];

            filters = [...req?.accessOperation?.filter, ...filters];
            const postFavorite = await this._model.getEntities([], filters, 'id', 1);
            if (!postFavorite) {
                return this._returnNotFound(res);
            }

            await postFavorite.delete();

            return this._returnResponse(res, 200);
        } catch (e) {
            next(e);
        }
    }
}

export default new PostFavoriteController();