import { registerRootComponent } from 'expo';
import { View } from 'react-native';
import Index from './components';

const App = () => {
  return (
    <View>
      <Index />
    </View>
  );
}

registerRootComponent(App);
