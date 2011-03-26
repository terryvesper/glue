execute = require('glue/lib/cli').execute

# Copy a dir
copy = (src, dest) ->
  # TODO: a native async dir copy
  execute "Copy skel to #{dest}", "cp -r #{src} #{dest}"

# Create a new app from skel
create = (dest) ->
  copy "#{__dirname}/../skel/", dest

# Expose to the binary
exports.create = create
