const { v4: uuidv4 } = require('uuid');
const multer = require('multer');
const path = require('path');

const profilePictureDir = path.join(__dirname, '../../../public/profile-pictures');

const profilePictureFilter = (request, file, cb) => {
    const allowedTypes = new RegExp(/png|jpg|jpeg/);
    const mimeType = allowedTypes.test(file.mimetype);
    const extName = allowedTypes.test(path.extname(file.originalname).toLowerCase());

    if (mimeType
        && extName
    ) {
        return cb(null, true);
    } else {
        cb(new Error(`Allowed types: png, jpg, jpeg`));
    }
};

const profilePictureStorage = multer.diskStorage({
    filename: (request, file, cb) => {
        const uniqueFilename = uuidv4(
            undefined,
            undefined,
            undefined
        ) + path.extname(file.originalname);
        cb(null, uniqueFilename);
    },
    destination: (request, file, cb) => {
        cb(null, profilePictureDir);
    }
});

const upload = multer({
    fileFilter: profilePictureFilter,
    limits: { fileSize: 10485760 },
    storage: profilePictureStorage
}).single('profilePicture');


exports.upload = (req, res, next) => {
    upload(req, res, (err) => {
        if (err) {
            return res.status(400).json({ statusCode: res.statusCode, message: err.message });
        }

        if (!req.file) {
            return res.status(400).json({ statusCode: res.statusCode, message: 'File not found' });
        }

        req.body.profilePicture = req.file.filename;
        next();
    });
};