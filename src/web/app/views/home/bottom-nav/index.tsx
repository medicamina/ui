import * as React from 'react';
import { Platform } from 'react-native';
import { BottomNavigation, Text } from 'react-native-paper';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

const HomeRoute = () => <Text>Music</Text>;;
const FamilyRoute = () => <Text>Albums</Text>;
const AccountRoute = () => <Text>Recents</Text>;

const MyComponent = (props) => {
  const insets = useSafeAreaInsets();

  const [index, setIndex] = React.useState(0);
  const [routes] = React.useState([
    { key: 'home', title: 'Home', icon: 'home'  },
    { key: 'scripts', title: 'History', icon: 'prescription'  },
    { key: 'family', title: 'Family', icon: 'file-tree' },
    { key: 'cart', title: 'Order', icon: 'cart' },
    { key: 'account', title: 'Account', icon: 'account-circle' }
  ]); 

  const renderScene = BottomNavigation.SceneMap({
    home: HomeRoute,
    family: FamilyRoute,
    account: AccountRoute,
    scripts: AccountRoute,
    cart: AccountRoute
  });

  return (
    <BottomNavigation
      theme={props.theme}
      navigationState={{ index, routes }}
      onIndexChange={setIndex}
      renderScene={renderScene}
      style={{
        paddingBottom: 
        insets.top == 50 ? 35 : 
        insets.top == 20 ? 20 : null
      }}
    />
  );
};

export default MyComponent;