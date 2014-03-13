exports.hello = (req, res) ->
  res.send "Hello World"

exports.json = (req, res) ->
  switch req.params.version
    when "v1"
      res.send {str: req.body.str.toUpperCase()}
    when "v2"
      setInterval (->
        return
      ), 50
      res.send {string: req.body.string.toUpperCase()}
    else
      res.send {string: "wat?"}