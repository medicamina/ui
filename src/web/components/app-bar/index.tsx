import React from 'react';
import { Appbar } from 'react-native-paper';
import { StyleSheet, View } from 'react-native';

const styles = StyleSheet.create({
  hidebutton: {
    opacity: 0
  },
  appBar: {
    shadowColor: "rgba(0, 0, 0, 0.24) 0px 4px 4px 0px"
  }
});

const AppBar = (props) => {
  return (
    <Appbar style={styles.appBar} theme={props.theme}>
      <Appbar.BackAction></Appbar.BackAction>
      <Appbar.Content titleStyle={{ alignSelf: 'center' }} title="medicamina"></Appbar.Content>
      <View pointerEvents="none">
        <Appbar.BackAction style={styles.hidebutton} disabled={true}></Appbar.BackAction>
      </View>
    </Appbar>
  );
}

export default AppBar;