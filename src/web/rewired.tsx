import React from 'react';
import ReactDOM from 'react-dom';
import Index from './components';
import { View } from 'react-native';

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

ReactDOM.render(
  <App />,
  document.getElementById('root')
);