import React from 'react';
import { Appbar, IconButton } from 'react-native-paper';
import { Platform, StyleSheet, View } from 'react-native';
import { useNavigate, useLocation } from 'react-router-native';

const AppBar = (props) => {
  const styles = StyleSheet.create({
    hide_button: {
      opacity: 0
    },
    appBar: {
      shadowColor: "rgba(0, 0, 0, 0.24) 0px 4px 4px 0px"
    },
    show_button: {
      margin: Platform.OS == 'web' ? 25 : 5
    }
  });

  const nav = useNavigate();
  const loc = useLocation();
  const is_landing = (loc.pathname == '/landing');

  return (
    <Appbar style={styles.appBar} theme={props.theme}>
      <View pointerEvents={is_landing ? 'none' : null}>
        <IconButton
          icon='arrow-left'
          theme={props.theme}
          size={24}
          onPress={() => nav('/landing')}
          style={is_landing ? styles.hide_button : styles.show_button}
        ></IconButton>
      </View>
      <Appbar.Content titleStyle={{ alignSelf: 'center' }} title="medicamina"></Appbar.Content>
      <View pointerEvents={is_landing ? null : 'none'}>
        <IconButton
          icon='account'
          theme={props.theme}
          size={24}
          onPress={() => nav('/login')}
          style={is_landing ? styles.show_button : styles.hide_button}
        ></IconButton>
      </View>
    </Appbar>
  );
}

export default AppBar;