import React from 'react';
import ReactDOM from 'react-dom';
import Index from './components';
import { View } from 'react-native';

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