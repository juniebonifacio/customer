path = require('path');

module.exports = {
  dal: {
    url: 'http://localhost:8080/SolutioWebService'
  },
  server: {
    listenPort: 3000,                                   // The port on which the server is to listen (means that the app is at http://localhost:3000 for instance)
    securePort: 8433,                                   // The HTTPS port on which the server is to listen (means that the app is at https://localhost:8433 for instance)
    distFolder: path.resolve(__dirname, '../../client/dist'),  // The folder that contains the application files (note that the files are in a different repository) - relative to this file
    staticUrl: '/static',                               // The base url from which we serve static files (such as js, css and images)
    cookieSecret: 'solutio-app'                         // The secret for encrypting the cookie
  },
  website: {
    url: 'http://192.168.1.59:3000/'
  },
  email: {
    service: 'Gmail',
    auth: {
      user: 'support@upraxis.com',
      pass: 'upraxis101'
    }
  }
};