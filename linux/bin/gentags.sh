#!/bin/sh

# check the directory of tags
if [ ! -d /vega/xp/dev/wdong/tags ]; then
  mkdir -p /vega/xp/dev/wdong/tags
fi

if [ -f /vega/xp/dev/wdong/tags/vega.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/vega.tags
fi

# Create tags for vega code with options required for omnicomplete in vim
# Need to add "-l" to --c++-kinds (where 'l' is letter 'l') in order to 
# make auto-completion work with local variables.
ctags -f /vega/xp/dev/wdong/tags/vega.tags -R --c++-kinds=+pl --fields=+iaS --extra=+q /vega/xp/dev/wdong/vega

if [ -f /vega/xp/dev/wdong/tags/winprod.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/winprod.tags
fi

# Create tags for vega code with options required for omnicomplete in vim
# Need to add "-l" to --c++-kinds (where 'l' is letter 'l') in order to 
# make auto-completion work with local variables.
ctags -f /vega/xp/dev/wdong/tags/winprod.tags -R --c++-kinds=+pl --fields=+iaS --extra=+q /vega/xp/dev/wdong/winprod_oldbuild

# Python
if [ -f /vega/xp/dev/wdong/tags/python.tags ]; then
  rm -rf /vega/xp/dev/wdong/tags/python.tags
fi

# Create tags for vega code with options required for omnicomplete in vim
ctags -f /vega/xp/dev/wdong/tags/python.tags -R --python-kinds=-i /vega/xp/dev/wdong/python

