import React, { useRef, useState } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { Button, Dialog, List, Modal, Paragraph, Portal } from 'react-native-paper';
import { useDispatch, useStore } from 'react-redux';
import BottomNav from './bottom-nav';

const Home = ({ theme, logged_in }) => {
  const styles = StyleSheet.create({
    container: {
      flex: 1
    }
  });

  const ref = useRef({
    dispatch: useDispatch(),
    store: useStore()
  });
  const [state, setState] = useState(() => {
    let data = ref.current.store.getState();
    return {
      ...data['notifications']
    }
  });
  const [is_open, setIsOpen] = useState(false);
  ref.current.store.subscribe(() => {
    setIsOpen(ref.current.store.getState().notifications.open);
    const data = ref.current.store.getState().notifications;
    setState({
      ...data
    });
  });

  const _hideDialog = () => ref.current.dispatch({ type: 'notifications/toggle_notifications' });

  function _markAsRead() {
    let result = [];
    for (let i = 0; i < state.notifications.length; i++) {
      let notification = state.notifications[i];
      let new_notification = { ...notification };
      new_notification.read = true;
      result.push(new_notification);
    }
    ref.current.dispatch({ type: 'notifications/set_notifications', payload: result });
    _hideDialog();
  }

  function _replaceNotification(_notification) {
    let result = [];
    let index = state['notifications'].indexOf(_notification);
    for (let i = 0; i < state.notifications.length; i++) {
      let notification = state.notifications[i];
      let new_notification = { ...notification };
      if (i == index) {
        new_notification.read = true;
      }
      result.push(new_notification);
    }
    ref.current.dispatch({ type: 'notifications/set_notifications', payload: result });
  }

  const [visible, setVisible] = React.useState(false);

  return (
    <View style={styles.container}>
      <Portal>
        <Dialog visible={is_open} onDismiss={_hideDialog} theme={theme}>
          <Dialog.Title theme={theme}>Notifications</Dialog.Title>
          <Dialog.Content>
            <Dialog.ScrollArea style={{ paddingHorizontal: 0}}>
              <ScrollView>
                {state.notifications.map((notification) => {
                  return (
                    <List.Item
                      key={notification.id}
                      theme={theme}
                      title={notification.title}
                      description={notification.content}
                      onPress={() => _replaceNotification(notification)}
                      right={(props) => {
                        if (!notification.read) {
                          return (<List.Icon {...props} icon="new-box" />);
                        }
                      }} />
                  )
                })}
              </ScrollView>
            </Dialog.ScrollArea>
          </Dialog.Content>
          <Dialog.Actions>
            <Button mode='contained' onPress={_markAsRead}>Mark as read</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
      <BottomNav theme={theme} />
    </View >
  );
}

export default Home;

