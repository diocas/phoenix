const { client } = require('nightwatch-api')
const userSettings = require('../helpers/userSettings')
const _ = require('lodash')
/**
 *
 * @param {string} userId
 *
 * @returns {string}
 */
exports.createAuthHeader = function (userId) {
  const password = userSettings.getPasswordForUser(userId)
  return {
    Authorization: 'Basic ' +
      Buffer.from(userId + ':' + password).toString('base64')
  }
}

/**
 *
 * @param {node-fetch.Response} response
 * @param {string} message
 *
 * @throws Error
 * @returns {node-fetch.Response}
 */
exports.checkStatus = function (response, message) {
  if (response.ok) { // response.status >= 200 && response.status < 300
    return response
  } else {
    throw Error(message + ' Status:' + response.status + ' ' + response.statusText)
  }
}

exports.checkOCSStatus = function (response, message) {
  const statusCode = _.get(response, 'ocs.meta.statuscode')
  if (statusCode === 200) {
    return response
  } else {
    throw Error(message + ' Status:' + statusCode)
  }
}

/**
 * Give the address of the backend url
 *
 * @param {string} server - REMOTE/LOCAL
 * @returns {string}
 */
exports.getBackendUrl = function (server = 'LOCAL') {
  return server === 'LOCAL' ? client.globals.backend_url : client.globals.remote_backend_url
}

/**
 * Give the backend URL for currently default backend
 */
exports.getCurrentBackendUrl = function () {
  return client.globals.default_backend === 'LOCAL' ? client.globals.backend_url : client.globals.remote_backend_url
}

/**
 * change current default backend
 */
exports.changeBackend = function (server) {
  if (!server) {
    throw new Error('Empty value provided, please provide "REMOTE" or "LOCAL"')
  }
  client.globals.default_backend = server
}
/**
 * Run a function using the remote backend
 *
 * @callback fn - the function to run using the remote backend
 * @param args - the arguments to pass to the function
 */
exports.runOnRemoteServer = async function (fn, args = []) {
  const initialBackend = client.globals.default_backend
  this.changeBackend('REMOTE')
  let errorfound
  try {
    await fn(...args)
  } catch (e) {
    errorfound = e
  } finally {
    client.globals.default_backend = initialBackend
  }
  if (errorfound) {
    throw errorfound
  }
}
