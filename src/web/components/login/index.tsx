import React from 'react';
import { View, StyleSheet } from 'react-native';
import {
  Button,
  Surface, TextInput,
} from 'react-native-paper';
import {
  Tabs,
  TabScreen
} from 'react-native-paper-tabs';

const Login = (props) => {
  const styles = StyleSheet.create({
    webpage: {
      flex: 1,
    },
    surface: {
      width: '600px',
      height: '800px',
      maxWidth: '100vw',
      maxHeight: '80vh',
      elevation: 12,
      padding: '15px'
    },
    padding: {
      marginTop: '10px',
      marginBottom: '10px'
    },
    inputs: {
      height: '100%',
      justifyContent: 'space-evenly'
    }
  });

  const [email, setEmail] = React.useState({ value: '', error: '' });
  const [password, setPassword] = React.useState({ value: '', error: '' });

  const _emailValidator = (email: string) => {
    const re = /\S+@\S+\.\S+/;

    if (!email || email.length <= 0) return 'Email cannot be empty.';
    if (!re.test(email)) return 'Ooops! We need a valid email address.';

    return '';
  }

  const _passwordValidator = (password: string) => {
    if (!password || password.length <= 0) return 'Password cannot be empty.';

    return '';
  }

  const _onLoginPressed = () => {
    const email_error = _emailValidator(email.value);
    const password_error = _passwordValidator(password.value);
    if (email_error) {
      setEmail({ value: email.value, error: email_error });
    }
    if (password_error) {
      setPassword({ value: password.value, error: password_error });
    }
    if (email_error || password_error) {
      return;
    }

    // submit login
  }

  return (
    <View style={styles.webpage}>
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Surface style={styles.surface} theme={props.theme}>
          <Tabs theme={props.theme}>
            <TabScreen label="Log In" icon="account-key">
              <View style={styles.inputs}>
                <TextInput
                  label="E-mail"
                  value={email.value}
                  onChangeText={text => setEmail({ ...email, value: text })}
                  autoCapitalize="none"
                  textContentType="emailAddress"
                  keyboardType="email-address"
                  error={!!email.error}
                />
                <TextInput
                  label="Password"
                  value={password.value}
                  onChangeText={text => setPassword({ ...password, value: text })}
                  secureTextEntry={true}
                  autoCapitalize="none"
                  error={!!password.error}
                />

                <Button mode="contained" onPress={_onLoginPressed}>Login</Button>
              </View>
            </TabScreen>
            <TabScreen label="Sign Up" icon="clipboard-account-outline">
              <View style={{ backgroundColor: 'green', flex: 1 }} />
            </TabScreen>
          </Tabs>
        </Surface>
      </View>
    </View>
  );
}

export default Login;