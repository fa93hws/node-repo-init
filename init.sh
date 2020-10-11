set -e

function install_node_modules() {
  local dev_deps=(
    # typescript
    typescript
    ts-node
    # eslint
    eslint
    prettier
    eslint-plugin-react-hooks
    eslint-plugin-react
    eslint-plugin-jsx-a11y
    eslint-plugin-import
    eslint-plugin-jest
    eslint-plugin-babel
    eslint-config-prettier
    eslint-config-airbnb-base
    @typescript-eslint/parser
    @typescript-eslint/eslint-plugin
    # storybook
    storybook
    @storybook/addon-actions
    @storybook/addon-knobs
    @storybook/addons
    @storybook/react
    # jest
    @types/jest
    @types/enzyme
    @types/enzyme-adapter-react-16
    @types/mini-css-extract-plugin
    ts-jest
    jest
    jest-serializer-html
    enzyme-to-json
    enzyme-adapter-react-16
    enzyme
    # webpack
    webpack
    webpack-cli
    @types/webpack-dev-server
    @types/webpack
    # webpack loaders
    ts-loader
    file-loader
    css-modules-typescript-loader
    css-loader
    babel-loader
    # webpack plugins
    @types/mini-css-extract-plugin
    mini-css-extract-plugin
    terser-webpack-plugin
    html-webpack-plugin
    # others
    identity-obj-proxy
    # types
    @types/react-dom
    @types/react
  )

  local prod_deps=(
    react
    react-dom
    mobx
    mobx-react
    @material-ui/core
    @material-ui/icons
  )

  npm init
  npm install --save-dev "${dev_deps[@]}"
  npm install --save "${prod_deps[@]}"
}

function amend_package_json() {
  local queries=(
    '.scripts.format = "prettier --check **/*"'
    '.scripts.lint = "eslint \"{config,src}/**/*.ts{,x}\""'
    '.scripts."lint:ts" = "tsc --noEmit --project ./tsconfig.check.json"'
    '.scripts.test = "jest --ci"'
  )
  query=$(printf "| %s" "${queries[@]}")
  query=${query:2}
  local new_file
  new_file=$(jq "${query}" package.json)
  echo "${new_file}" > package.json
}

function run_lint() {
  npm run lint
  npm run lint:ts
  npm run format
}

install_node_modules
amend_package_json
run_lint
