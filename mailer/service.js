import config from './../config/app.json' with { type: "json" };
import nodemailer from 'nodemailer'
import ejs from 'ejs';
import * as path from "path";

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
export async function sendConfirm(email, data) {
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
export async function sendPasswordReset(email, data) {
    await send(
        email,
        '[Action Required] Password Reset',
        'passwordReset.html',
        data
    );
}