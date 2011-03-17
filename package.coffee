name: "glue"
description: "glue that stuff together"
url: "http://gluejs.org"
keywords: ["glue", "js", "browser"]
author: "Terry Vesper <vesper.terry@gmail.com>"
version: require('fs').readFileSync('./VERSION', 'utf8')[..-2]
bin: 
  glue: './bin/glue'

main: 'index'

dependencies:
  'coffee-script': '>= 1.0.1'

engines:
  node: '>= 0.4.2'
  npm: '>= 0.3.15'