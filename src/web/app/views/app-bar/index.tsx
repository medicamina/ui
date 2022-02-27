import React, { useMemo, useRef, useState } from 'react';
import { Appbar, IconButton, Badge } from 'react-native-paper';
import { Platform, StyleSheet, View } from 'react-native';
import { useNavigate, useLocation } from 'react-router-native';
import { useDispatch, useStore } from 'react-redux';

const AppBar = ({ theme, logged_in }) => {
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

  const ref = useRef({
    dispatch: useDispatch(),
    store: useStore()
  });

  const [state, setState] = useState(() => {
    ref.current.dispatch({ type: 'notifications/set_notifications' });
    let data = ref.current.store.getState();
    return {
      ...data['notifications']
    }
  });

  const nav = useNavigate();
  const loc = useLocation();
  const is_landing = (loc.pathname.indexOf('/landing') >= 0);
  const is_login = (loc.pathname.indexOf('/login') >= 0);
  const is_home = (loc.pathname.indexOf('/home') >= 0);

  function toggleNotifications() {
    ref.current.dispatch({ type: 'notifications/toggle_notifications' });
  }

  ref.current.store.subscribe(() => {
    const data = ref.current.store.getState().notifications;
    setState({
      ...data
    });
  });

  return (
    <Appbar style={styles.appBar} theme={theme}>
      <View pointerEvents={is_landing || is_home ? 'none' : null}>
        <IconButton
          icon='arrow-left'
          theme={theme}
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
                // theme={theme}
                color='rgb(255, 255, 255)'
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
                  // theme={theme}
                  color='rgb(255, 255, 255)'
                  size={24}
                  onPress={() => toggleNotifications()}
                  style={is_landing || is_login ? styles.hide_button : styles.show_button}
                />
                {state.unread > 0 && (
                  <Badge
                    visible={(!is_login && !is_landing)}
                    style={styles.badge}>
                    {state.unread}
                  </Badge>
                )}
              </View>
            </View>
          )}
      </View>
    </Appbar>
  );
}

export default AppBar;