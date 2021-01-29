const path = require('path');
const ZipPlugin = require('zip-webpack-plugin');

module.exports = {
  entry: path.resolve(__dirname, 'app.ts'),
  mode: 'development',
  target: 'node',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'app.js'
  },
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: [
          'ts-loader',
        ]
      }
    ]
  },
  plugins: [
    new ZipPlugin({
      path: __dirname,
      filename: 'dist.zip',
    }),
  ],
  resolve: {
    extensions: ['.ts', '.js'],
  }
}