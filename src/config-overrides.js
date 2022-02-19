// React app rewired configuration
const { resolve } = require("path");
const {
	override,
	addExternalBabelPlugins
} = require('customize-cra');

module.exports = {
	paths: function (config, env) {
		config.appPath = resolve(__dirname, 'web');
		config.appBuild = resolve(__dirname, '../dist/public');
		config.appPublic = resolve(__dirname, 'web/public');
		config.appHtml = resolve(__dirname, 'web/public/index.html');
		config.appIndexJs = resolve(__dirname, 'web/src/index.tsx');
		config.appPackageJson = resolve(__dirname, '../package.json');
		config.appSrc = resolve(__dirname, 'web/src');
		config.appTsConfig = resolve(__dirname, '../tsconfig.json');
		config.appJsConfig = resolve(__dirname, '../jsconfig.json');
		config.yarnLockFile = resolve(__dirname, 'yarn.lock')
		config.testsSetup = resolve(__dirname, 'web/src/setupTests.ts');
		config.proxySetup = resolve(__dirname, 'web/src/setupProxy.ts');
		// config.appNodeModules = resolve(__dirname, 'web/node_modules');
		// config.appWebpackCache = resolve(__dirname, 'web/node_modules/.cache');
		// config.appTsBuildInfoFile = resolve(__dirname, 'web/node_modules/.cache/tsconfig.tsbuildinfo');
		config.swSrc = resolve(__dirname, 'web/src/service-worker.ts');
		// config.ownPath = resolve(__dirname, 'web/node_modules/react-scripts');
		// config.ownNodeModules = resolve(__dirname, 'web/node_modules/react-scripts/node_modules');
		config.appTypeDeclarations = resolve(__dirname, 'web/src/react-app-env.d.ts');
		// config.ownTypeDeclarations = resolve(__dirname, 'web/node_modules/react-scripts/lib/react-app.d.ts');
		return config;
	},
	webpack: override(
		...addExternalBabelPlugins(
			'@babel/plugin-syntax-jsx',
			'@babel/plugin-transform-react-jsx',
			'@babel/plugin-transform-react-display-name',
			'@babel/plugin-transform-react-jsx-self',
			'@babel/plugin-transform-react-jsx-source'
		),
	),
	jest: function (config) {
		return config;
	},
	devServer: function (configFunction) {
		return function (proxy, allowedHost) {
			const config = configFunction(proxy, allowedHost);
			return config;
		};
	},
};