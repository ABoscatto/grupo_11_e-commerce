const express = require('express');
const rememberMiddleware = require("../middlewares/rememberMiddleware");
const body = require('express-validator').body
// otra forma es const { body } = require('express-validator')
const router = express.Router();
const usersController = require('../controllers/usersController');

const multer = require('multer');

// Inicializo storage de multer, con el destination y formato de filename
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './public/images/users');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + '-' + file.originalname);
    }
});
const upload = multer({ storage });


const validations = [
    body('lastname').notEmpty().withMessage('Apellido no puede estar en blanco'),
    body('firstname').notEmpty().withMessage('Nombre no puede estar en blanco'),
    body('email').notEmpty().isEmail().withMessage('Email inválido')
]

//Get de /users/usersList
router.get('/usersList', usersController.getList);

//Get de /users/register
router.get('/login', rememberMiddleware, usersController.getLogin);

//Post de /users/login
router.post('/login', usersController.loginProcess);

//Post de /users/logout
router.get('/logout',usersController.logout);

//Get de /users/profile
router.get('/profile',usersController.userprofile);

//Get de /users/profile_update
router.get('/edit_profile', usersController.update);
router.post('/update_profile', usersController.update);

//Get de /users/delete_account
router.get('/confirm_delete', usersController.confirm_delete);
router.post('/delete_account', usersController.delete);

//Get de /users/register
router.get('/register',usersController.getRegister);

//Post de /users/register
//el nombre del objeto parametro de upload.single tiene que ser IGUAL al name del campo input de la imagen en el form
//middleware multer siempre primero
router.post('/register', [upload.single('userImage'), ...validations], usersController.register);

//Get del /users/register-thank-you
router.get('/register-thank-you',usersController.thankYouForRegister);

//Get del /users/cart-error-whitout-access
router.get('/cart-error-whitout-access',usersController.cartWithoutAccess);

//Get del /users/album-error-whitout-access
router.get('/album-error-whitout-access',usersController.albumWithoutAccess);


module.exports = router;