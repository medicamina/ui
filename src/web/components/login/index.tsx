import React from 'react';
import {
  View,
  StyleSheet,
  useWindowDimensions,
} from 'react-native';
import {
  Button,
  Surface,
  TextInput,
  Headline
} from 'react-native-paper';
import {
  Tabs,
  TabScreen
} from 'react-native-paper-tabs';

const Login = (props) => {
  const { height, width } = useWindowDimensions();

  const styles = StyleSheet.create({
    container: {
      justifyContent: 'center',
      alignItems: 'center',
      flex: 1
    },
    surface: {
      width: width >= 1023 ? (width / 2.5) : width,
      height: width >= 1023 ? (height / 2) : '100%',
      maxWidth: width,
      maxHeight: height,
      elevation: 12,
      padding: 15
    },
    inputs: {
      marginTop: 10,
      marginBottom: 10,
      marginLeft: 10,
      marginRight: 10
    },
    headline: {
      textAlign: 'center'
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

  const _onSignUpPressed = () => {
    return;
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
    <View style={styles.container}>
      <Surface style={styles.surface} theme={props.theme}>
        <Tabs theme={props.theme}>
          <TabScreen label="Log In" icon="account-key">
            <View>
              <Headline
                style={{ ...styles.inputs, ...styles.headline, color: props.theme.colors.text }}
              >
                Welcome back
              </Headline>
              <TextInput
                label="E-mail"
                value={email.value}
                onChangeText={text => setEmail({ ...email, value: text })}
                autoCapitalize="none"
                textContentType="emailAddress"
                keyboardType="email-address"
                error={!!email.error}
                style={styles.inputs}
              />
              <TextInput
                label="Password"
                value={password.value}
                onChangeText={text => setPassword({ ...password, value: text })}
                secureTextEntry={true}
                autoCapitalize="none"
                error={!!password.error}
                style={styles.inputs}
              />

              <Button
                mode="contained"
                onPress={_onLoginPressed}
                style={styles.inputs}
              >Login</Button>
            </View>
          </TabScreen>
          <TabScreen label="Sign Up" icon="clipboard-account-outline">
          <View>
              <Headline
                style={{ ...styles.inputs, ...styles.headline, color: props.theme.colors.text }}
              >
                Create an account
              </Headline>
              <TextInput
                label="E-mail"
                value={email.value}
                onChangeText={text => setEmail({ ...email, value: text })}
                autoCapitalize="none"
                textContentType="emailAddress"
                keyboardType="email-address"
                error={!!email.error}
                style={styles.inputs}
              />
              <TextInput
                label="Password"
                value={password.value}
                onChangeText={text => setPassword({ ...password, value: text })}
                secureTextEntry={true}
                autoCapitalize="none"
                error={!!password.error}
                style={styles.inputs}
              />

              <Button
                mode="contained"
                onPress={_onSignUpPressed}
                style={styles.inputs}
              >Login</Button>
            </View>
          </TabScreen>
        </Tabs>
      </Surface>
    </View>
  );
}

export default Login;