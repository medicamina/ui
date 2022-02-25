import React from 'react';
import { AppRegistry } from 'react-native';
import { View } from 'react-native';

import Index from './app';
import mat from '@expo/vector-icons/MaterialCommunityIcons';

const iconFontStyles = `@font-face {
  src: url(${mat.font['material-community']});
  font-family: MaterialCommunityIcons;
}`;
const style = document.createElement('style');
style.appendChild(document.createTextNode(iconFontStyles));
document.head.appendChild(style);

const App = () => {
  return (
    <View>
      <Index />
    </View>
  );
}

AppRegistry.registerComponent('App', () => App);
AppRegistry.runApplication('App', {
  rootTag: document.getElementById('root')
});