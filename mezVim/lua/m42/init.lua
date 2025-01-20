-- require("m42.plugins.highlight")
-- require("m42.plugins.nnpain")
require("m42.options")
require("m42.remap")
require("m42.plugins")
require("m42.LSPs")

-- NOTE: we even ask nixCats if we included our debug stuff in this setup! (we didnt)
-- But we have a good base setup here as an example anyway!
if nixCats('debug') then
  require('myLuaConf.debug')
end
-- NOTE: we included these though! Or, at least, the category is enabled.
-- these contain nvim-lint and conform setups.
if nixCats('lint') then
  require('myLuaConf.lint')
end
if nixCats('format') then
  require('myLuaConf.format')
end
-- NOTE: I didnt actually include any linters or formatters in this configuration,
-- but it is enough to serve as an example.

require("lze").register_handlers(require('lze.x'))
-- require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)
