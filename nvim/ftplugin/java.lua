--local config = {
--    cmd = {'/home/ian/jdtls/bin/jdtls'},
--    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
--}
--require('jdtls').start_or_attach(config)

local jdtls_dir = '/home/ian/jdtls/'
local config_dir = jdtls_dir .. '/config_linux'
local plugin_dir = jdtls_dir .. '/plugins'
--local jar_path = plugin_dir .. 'org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.900.v20240129-1338.jar'
local jar_path = '/home/ian/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar'

local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
local root_dir = require('jdtls.setup').find_root(root_markers)

if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = "/home/ian/.local/share/eclipse/"

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jar_path,
    '-configuration', config_dir,
    '-data', workspace_dir,
  },

  root_dir = root_dir,

  settings = {
    java = {
      format = {
        enabled = true,
        settings = {
          url = '/home/ian/.local/share/eclipse/eclipse-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
      maven = {
        downloadSources = true,
      },
      references = {
        includeDecompiledSources = true,
      },
    },
  },

  init_options = {
    bundles = {}
  },

  signatureHelp = { enabled = true },
  --contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
  completion = {
    favoriteStaticMembers = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*"
    },
    filteredTypes = {
      "com.sun.*",
      "io.micrometer.shaded.*",
      "java.awt.*",
      "jdk.*", "sun.*",
    },
    importOrder = {
      "java",
      "javax",
      "com",
      "org"
    },
  },

  sources = {
    organizeImports = {
      starThreshold = 9999;
      staticStarThreshold = 9999;
    },
  },
  -- How code generation should act
  codeGeneration = {
    toString = {
      template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
    },
    hashCodeEquals = {
      useJava7Objects = true,
    },
    useBlocks = true,
  },

  flags = {
    allow_incremental_sync = true,
  }
}

require('jdtls').start_or_attach(config)
