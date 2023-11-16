// vue.config.js

/**
 * @type {import('@vue/cli-service').ProjectOptions}
 */
var path = '/vue-hf4/';
if (process.env.NODE_ENV === 'android') {
    path = '/';
}
if (process.env.NODE_ENV === 'github-pages') {
    path = '/hf4-decks/';
}
module.exports = {
    publicPath: path
};
// module.exports = {
//     publicPath: process.env.NODE_ENV === 'production'
//         ? '/hf4-decks/'
//         : '/vue-hf4/'
// }

// comando da usare:
// TARGET=android vue-cli-service build