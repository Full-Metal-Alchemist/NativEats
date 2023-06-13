// Learn more https://docs.expo.io/guides/customizing-metro
const { getDefaultConfig } = require('expo/metro-config');
const path = require('path');

const workspaceRoot = __dirname;
const projectRoot = path.resolve(workspaceRoot, '../');
console.log('Project and Workspace roots:', projectRoot, workspaceRoot);

const defaultConfig = getDefaultConfig(projectRoot);

defaultConfig.watchFolders = [workspaceRoot];

defaultConfig.resolver.nodeModulesPaths = [
  path.resolve(projectRoot, 'node_modules'),
  path.resolve(workspaceRoot, 'node_modules'),
];

defaultConfig.resolver.disableHierarchicalLookup = true;
defaultConfig.resolver.assetExts.push('cjs');

module.exports = defaultConfig;
