# ESLint

## インストール(Sublime text)

1. nodeをインストール
2. npmをインストール
3. aucfan-sdkをgit clone
4. cd aucfan-sdk/utils/eslint/; npm install;
5. Sublime textで SublimeLinter、SublimeLinter-contrib-eslint、ESLint Formatter をインストール
6. Preferences -> Package Settings -> SublimeLinter -> Settings - User に以下の設定(a)する
7. Preferences -> Package Settings -> ESLint Formatter -> Settings - User に以下の設定(b)をして再起動

(a)SublimeLinter
設定するのはlitenrsとpaths。
pathsの/usr/local/binのところにnodeのパスを書く。  
※ sublime本体のアップデート（ver.3143）により動かなくなったので内容を修正（2018/3/13時点）

```
{
    "debug": true,
    "delay": 0.25,
    "gutter_theme": "Packages/SublimeLinter/gutter-themes/Default/Default.gutter-theme",
    "lint_mode": "background",
    "linters": {
        "eslint": {
            "@disable": false,
            "args": [
                "--config",
                "/aucfan-sdkまでのフルパス/aucfan-sdk/utils/eslint/.eslintrc.json"
            ],
            "excludes": []
        }
    },
    "no_column_highlights_line": false,
    "paths": {
        "linux": [],
        "osx": [
            "/usr/local/bin",
            "/aucfan-sdkまでのフルパス/aucfan-sdk/utils/eslint/node_modules/.bin"
        ],
        "windows": []
    },
    "show_marks_in_minimap": true,
    "syntax_map": {
        "html (django)": "html",
        "html (rails)": "html",
        "html 5": "html",
        "php": "html",
        "python django": "python"
    }
}
```

(b)ESLint Formatter
設定するのはeslint_pathとconfig_path。
```
{
  // The Nodejs installation path
  "node_path": {
    "windows": "node.exe",
    "linux": "/usr/bin/nodejs",
    "osx": "/usr/local/bin/node"
  },

  // The location to search for a locally installed eslint package.
  // These are all relative paths to a project's directory.
  // If this is not found, it will try to fallback to a global package
  // (see 'eslint_path' below)
  "local_eslint_path": {
    "windows": "node_modules/eslint/bin/eslint.js",
    "linux": "node_modules/.bin/eslint",
    "osx": "node_modules/.bin/eslint"
  },

  // The location of the globally installed eslint package to use as a fallback
  "eslint_path": {
    "windows": "%APPDATA%/npm/node_modules/eslint/bin/eslint",
    "linux": "/usr/bin/eslint",
    "osx": "/aucfan-sdkまでのフルパス/aucfan-sdk/utils/eslint/node_modules/.bin/eslint"
  },

  // Specify this path to an eslint config file to override the default behavior.
  // Passed to eslint as --config. Read more here:
  // http://eslint.org/docs/user-guide/command-line-interface#c---config
  // If an absolute path is provided, it will use as is.
  // Else, it will look for the file in the root of the project directory.
  // Failing either, it will skip the config file
  "config_path": "/aucfan-sdkまでのフルパス/aucfan-sdk/utils/eslint/.eslintrc.json",

  // Automatically format when a file is saved.
  "format_on_save": false,

  // Only attempt to format files with whitelisted extensions on save.
  // Leave empty to disable the check
  "format_on_save_extensions": [
    "js",
    "jsx",
    "es",
    "es6",
    "babel"
  ]
}
```
