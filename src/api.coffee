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
      client.methodCall key, [username, password].concat(args), (err, result) ->
        if err
          callback(err)
        else if result? && result.length == 1 && typeof result[0] == 'string' && result[0] != 'OK'
          callback(new Error(result[0]))
        else
          callback(null, result)
    acc
  , {}
