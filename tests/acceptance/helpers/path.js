const join = require('join-path')
const _ = require('lodash/fp')
const normalize = _.replace(/^\/+|\/+$/g, '')
const parts = _.pipe(normalize, _.split('/'))

module.exports = {
  normalize,
  resolve: _.partial(join, ['/']),
  join,
  parts,
  filename: _.pipe(parts, _.last)
}
