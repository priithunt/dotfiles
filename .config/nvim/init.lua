-- Lae põhikonfiguratsioon ja pluginad
require("priit.core")
require("priit.lazy")

-- ⬇️ Python provider – kasuta süsteemi python3
vim.g.python3_host_prog = "/usr/bin/python3"

-- ⬇️ Java keskkond (et Mason ja jdtls ei näeks valeteateid)
vim.env.JAVA_HOME = "/usr/local/opt/openjdk"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

-- (Soovi korral lisa ka providerite keelamine, kui ei kasuta:)
 vim.g.loaded_node_provider = 0
 vim.g.loaded_ruby_provider = 0
 vim.g.loaded_perl_provider = 0
