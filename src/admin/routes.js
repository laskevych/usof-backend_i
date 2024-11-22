import AdminJS from 'adminjs'
import Plugin from '@adminjs/express'
import Adapter, { Database, Resource } from '@adminjs/sql'
import UserModel from "../user/model.js";

AdminJS.registerAdapter({
    Database,
    Resource,
});


const db = await new Adapter('mysql2', {
    database: process.env.DATABASE_NAME || 'TechCloud',
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    host: process.env.DATABASE_HOST || 'localhost',
    port: process.env.DATABASE_PORT || 3306
}).init();

const routes = new AdminJS({
    databases: [db],
    branding: {
        companyName: '[Admin] Tech_Cloud',
        logo: 'http://localhost:8080/app/logo.png',
        favicon: 'http://localhost:3000/favicon.ico',
        softwareBrothers: false,
    },
    resources: [
        {
            resource: db.resourceMap.get('posts'),
            options: {
                properties: {
                    content: {
                        isVisible: { edit: false, show: true, list: true, filter: true },
                        isDisabled: true,
                        isEditable: false,
                    },
                },
            },
        },
        {
            resource: db.resourceMap.get('comments'),
            options: {
                properties: {
                    content: {
                        isVisible: { edit: false, show: true, list: true, filter: true },
                        isDisabled: true,
                        isEditable: false,
                    },
                    rating: {
                        isVisible: { edit: false, show: true, list: true, filter: true },
                        isDisabled: true,
                        isEditable: false,
                    },
                },
            },
        },
        {
            resource: db.resourceMap.get('users'),
            options: {
                properties: {
                    password: {
                        isVisible: { edit: false, show: false, list: false, filter: false },
                        isDisabled: true,
                        isEditable: false,
                    },
                    profilePicture: {
                        isVisible: { edit: false, show: false, list: false, filter: false },
                        isDisabled: true,
                        isEditable: false,
                    },
                },
            },
        },
    ],
    rootPath: '/admin'
});

const authenticate = async (email, password) => {
    const model = new UserModel();
    const user = await model.getByEmail(email);

    if (!user || !user.isAdmin()) {
        return null;
    }

    const isValidPassword = await model.isValidPassword(password, user.password);
    if (!isValidPassword) {
        return null;
    }

    return Promise.resolve({ email, password });
};

const router = Plugin.buildAuthenticatedRouter(
    routes,
    {
        authenticate,
        cookieName: 'adminjs',
        cookiePassword: process.env.APP_SECRET,
    },
    null,
    {
        resave: true,
        saveUninitialized: true,
    }
);

routes.watch();

export default router;