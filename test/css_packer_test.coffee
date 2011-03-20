css_packer = require 'classes/css_packer'

module.exports = 
  'module exports CSSPacker': ->
    css_packer.should.have.property 'CSSPacker'

  'CSSPacker#new inits parser': ->
    topic = new css_packer.CSSPacker()
  
    topic.should.have.property 'parser'
    topic.parser.should.be.a 'object'

  'CSSPacker#new accepts and inits dir': ->
    fixture_config = './css/*.css'
    topic = new css_packer.CSSPacker fixture_config

    topic.should.have.property 'config'
    topic.config.should.be.a 'string'
    topic.config.should.equal fixture_config
