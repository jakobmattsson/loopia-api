xmlrpc = require 'xmlrpc'

exports.createClient = (username, password) ->
  client = xmlrpc.createSecureClient 'https://api.loopia.se/RPCSERV'

  funcs = [
    'addDomainToAccount'
    'addSubdomain'
    'addZoneRecord'
    'domainIsFree'
    'getCreditsAmount'
    'getDomain'
    'getDomains'
    'getInvoice'
    'getSubdomains'
    'getUnpaidInvoices'
    'getZoneRecords'
    'payInvoiceUsingCredits'
    'removeDomain'
    'removeSubdomain'
    'removeZoneRecord'
    'updateZoneRecord'
  ]

  funcs.reduce (acc, key) ->
    acc[key] = (args..., callback) ->
      client.methodCall key, [username, password].concat(args), callback
    acc
  , {}
