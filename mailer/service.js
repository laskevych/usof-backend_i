const config = require('./../config/app.json');
const ejs = require('ejs');
const nodemailer = require('nodemailer');
const path = require('path');

/**
 * @param {string} email
 * @param {string} subject
 * @param {string} htmlTemplate
 * @param {Object} dataForTemplate
 * @docs https://ethereal.email/
 * @return {Promise<void>}
 */
async function send(email, subject, htmlTemplate, dataForTemplate) {
    try {
        const airplane = nodemailer.createTransport(
            { ...config.mailer }
        );

        const html = await ejs.renderFile(
            path.join(__dirname, htmlTemplate),
            dataForTemplate
        );
        const result = await airplane.sendMail(
            {
                from: "\"usof\" info@usof.test",
                to: email,
                subject,
                html
            }
        );
        console.log('Mailing success! ' + result.response);
    } catch (error) {
        console.error('Mailing error! ', error);
    }
}

/**
 * @param {string} email
 * @param {Object} data
 * @return {Promise<void>}
 */
exports.sendConfirm = async function (email, data) {
    await send(
        email,
        '[Action Required] Confirm Email',
        'confirmEmail.html',
        data
    );
}

/**
 * @param {string} email
 * @param {Object} data
 * @return {Promise<void>}
 */
exports.sendPasswordReset = async function (email, data) {
    await send(
        email,
        '[Action Required] Password Reset',
        'passwordReset.html',
        data
    );
}