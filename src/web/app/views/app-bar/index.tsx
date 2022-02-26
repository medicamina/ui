import React, { useState } from 'react';
import { Appbar, IconButton, Badge } from 'react-native-paper';
import { Platform, StyleSheet, View } from 'react-native';
import { useNavigate, useLocation } from 'react-router-native';
import { useDispatch, useStore } from 'react-redux';

const AppBar = (props) => {
  // State
  const [state, setState] = useState(() => {
    const initialState = {
      store: useStore(),
      dispatch: useDispatch(),
      notifications: []
    };
    initialState.dispatch({ type: 'notifications/set_notifications'});
    initialState.notifications = initialState.store.getState().notifications.data;
    return initialState;
  });

  function getNotificationNumber() {
    let result = [];
    for (const notification of state.notifications) {
      if (!notification.read) {
        result.push(notification);
      }
    }
    return result.length;
  }

  const styles = StyleSheet.create({
    hide_button: {
      opacity: 0
    },
    appBar: {
      shadowColor: "rgba(0, 0, 0, 0.24) 0px 4px 4px 0px"
    },
    show_button: {
      margin: Platform.OS == 'web' ? 25 : 5
    },
    badge: {
      position: 'absolute',
      top: Platform.OS == 'web' ? 25 : 4,
      left: Platform.OS == 'web' ? 20 : 0
    },
    row: {
      flexDirection: 'row',
      flexWrap: 'wrap',
    },
  });

  const nav = useNavigate();
  const loc = useLocation();
  const is_landing = (loc.pathname == '/landing');
  const is_login = (loc.pathname.indexOf('/login') >= 0);
  const is_home = (loc.pathname == '/home');

  return (
    <Appbar style={styles.appBar} theme={props.theme}>
      <View pointerEvents={is_landing || is_home ? 'none' : null}>
        <IconButton
          icon='arrow-left'
          theme={props.theme}
          size={24}
          onPress={() => nav('/landing')}
          style={is_landing || is_home ? styles.hide_button : styles.show_button}
        ></IconButton>
      </View>
      <Appbar.Content titleStyle={{ alignSelf: 'center' }} title="medicamina"></Appbar.Content>
      <View pointerEvents={!is_login ? null : 'none'}>
        {is_landing ?
          (
            <View>
              <IconButton
                icon='login'
                theme={props.theme}
                size={24}
                onPress={() => nav('/login')}
                style={is_landing ? styles.show_button : styles.hide_button}
              />
            </View>
          ) :
          (
            <View style={styles.row}>
              <View>
                <IconButton
                  icon='bell'
                  theme={props.theme}
                  size={24}
                  onPress={() => null}
                  style={is_landing || is_login ? styles.hide_button : styles.show_button}
                />
                <Badge
                  visible={(!is_login && !is_landing)}
                  style={styles.badge}>
                  {getNotificationNumber()}
                </Badge>
              </View>
            </View>
          )}
      </View>
    </Appbar>
  );
}

export default AppBar;