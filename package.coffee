name: "glue"
description: "glue that stuff together"
url: "http://gluejs.org"
keywords: ["glue", "js", "browser"]
author: "Terry Vesper <vesper.terry@gmail.com>"
version: require('fs').readFileSync('./VERSION', 'utf8')[..-2]
main: 'index'

bin: 
  glue: './bin/glue'

dependencies:
  'coffee-script': '>= 1.0.1'
  less: '>=1.0.41'
  should: '>=0.0.4'
  expresso: '>=0.7.3'

engines:
  node: '>= 0.4.2'
  npm: '>= 0.3.15'
