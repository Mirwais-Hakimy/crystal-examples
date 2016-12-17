# markdown.cr:5
require "markdown"

text = "## This is title \n This is a [link](http://crystal-lang.org)"

Markdown.to_html(text)
# => <h2>This is title</h2>
# => <p>This is a <a href="http://crystal-lang.org">link</a></p>
