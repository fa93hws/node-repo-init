set -e

function main() {
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

  npm install --save-dev "${dev_deps[@]}"
}

main
