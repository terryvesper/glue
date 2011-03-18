assert = require 'assert'
should = require 'should'

css_packer = require 'css_packer'

module.exports = 
  'module exports CSSPacker': ->
    css_packer.should.have.property 'CSSPacker'

  'CSSPacker#new inits parser': ->
    topic = new css_packer.CSSPacker()
  
    topic.should.have.property 'parser'
    topic.parser.should.be.a 'object'

  'CSSPacker#new accepts and inits dir': ->
    fixture_dir = './css/*.css'
    topic = new css_packer.CSSPacker fixture_dir

    topic.should.have.property 'dir'
    topic.dir.should.be.a 'string'
    topic.dir.should.equal fixture_dir
