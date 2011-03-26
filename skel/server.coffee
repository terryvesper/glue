glue = require 'glue'

app = glue.createApp base: "#{__dirname}/application"
app.listen

AdsController = require('./application/controllers/ads_controller').AdsController

app = express.createServer()

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session secret: 'your secret here'
  app.use express.compiler src: "#{__dirname}/public", enable: ['less']
  app.use app.router
  app.use express.static "#{__dirname}/public"

app.configure 'development', ->
  app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

app.get '/', (req, res) ->
  res.render 'index', title: 'Cocks'

AdsController.load app, '/ads'

if not module.parent
  app.listen 3000
  console.log "Express server listening on port %d", app.address().port

