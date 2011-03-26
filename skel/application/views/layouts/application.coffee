doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Untitled'} | My awesome website"
    meta(name: 'description', content: @desc) if @desc?
    link rel: 'stylesheet', href: '/stylesheets/app.css'
    style '''
      body {font-family: sans-serif}
      header, nav, section, footer {display: block}
    '''
    script src: '/javascripts/jquery.js'
    coffeescript ->
      $().ready ->
        alert 'Alerts are so annoying...'
  body ->
    header ->
      h1 @title or 'Untitled'
      nav ->
        ul ->
          (li -> a href: '/', -> 'Home') unless @path is '/'
          li -> a href: '/chunky', -> 'Bacon!'
          switch @user.role
            when 'owner', 'admin'
              li -> a href: '/admin', -> 'Secret Stuff'
            when 'vip'
              li -> a href: '/vip', -> 'Exclusive Stuff'
            else
              li -> a href: '/commoners', -> 'Just Stuff'
    section ->
      h2 "Let's count to #{@max}:"
      p i for i in [1..@max]
    footer ->
      p shoutify('bye')
