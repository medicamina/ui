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
  Headline,
  Text
} from 'react-native-paper';
import {
  Tabs,
  TabScreen
} from 'react-native-paper-tabs';
import { useLocation, useNavigate } from 'react-router-native';

const Login = ({ theme }) => {
  const { height, width } = useWindowDimensions();
  const nav = useNavigate();
  const url = useLocation();

  const styles = StyleSheet.create({
    container: {
      justifyContent: 'center',
      alignItems: 'center',
      flex: 1
    },
    surface: {
      width: width >= 1023 ? (width / 2.5) : width,
      height: width >= 1023 ? null : '100%',
      maxWidth: width,
      maxHeight: height,
      elevation: 12,
      paddingLeft: width >= 1023 ? 15 : 0,
      paddingRight: width >= 1023 ? 15 : 0,
      paddingBottom: 15,
      paddingTop: width >= 1023 ? 15 : 0
    },
    inputs: {
      marginTop: 10,
      marginBottom: 10,
      marginLeft: 10,
      marginRight: 10
    },
    headline: {
      marginTop: 20,
      marginBottom: 10,
      color: theme.colors.text,
      textAlign: 'center'
    },
    error: {
      color: theme.colors.error,
      textAlign: 'center'
    }
  });

  const [email, setEmail] = React.useState({ value: '', error: '' });
  const [password, setPassword] = React.useState({ value: '', error: '' });
  const [first_name, setFirstName] = React.useState({ value: '', error: '' });
  const [last_name, setLastName] = React.useState({ value: '', error: '' });

  const _emailValidator = (email: string) => {
    const re = /\S+@\S+\.\S+/;

    if (!email || email.length <= 0) return 'Email cannot be empty.';
    if (!re.test(email)) return 'Ooops! We need a valid email address.';

    return '';
  }

  const _passwordValidator = (password: string) => {
    if (!password || password.length <= 0) return 'Password cannot be empty.';
    if (password.length < 8) return 'Password must be at least 8 characters'

    return '';
  }

  const _firstNameValidator = (name: string) => {
    if (!name || name.length <=0) return 'First name can not be empty.';

    return '';
  }

  const _lastNameValidator = (name: string) => {
    if (!name || name.length <=0) return 'Last name can not be empty.';

    return '';
  }

  const _resetErrors = () => {
    setEmail({ ...email, error: '' });
    setPassword({ ...password, error: '' });
    setFirstName({ ...first_name, error: '' });
    setLastName({ ...last_name, error: '' });
  }

  const _onSignUpPressed = () => {
    const email_error = _emailValidator(email.value);
    const password_error = _passwordValidator(password.value);
    const first_name_error = _firstNameValidator(first_name.value);
    const last_name_error = _lastNameValidator(last_name.value)

    if (email_error) {
      setEmail({ ...email, error: email_error });
    }
    if (password_error) {
      setPassword({ ...password, error: password_error });
    }
    if (first_name_error) {
      setFirstName({ ...first_name, error: first_name_error })
    }
    if (last_name_error) {
      setLastName({ ...last_name, error: last_name_error });
    }

    if (email_error || password_error) {
      return;
    }

    // submit sign Up
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
    nav('/home');
  }

  return (
    <View style={styles.container}>
      <Surface style={styles.surface} theme={theme}>
        <Tabs theme={theme} defaultIndex={url.hash.indexOf('#sign-up') > -1 ? 1 : 0}>
          <TabScreen label="Log In" icon="account-key" onPress={_resetErrors}>
            <View>
              <Headline style={styles.headline}>
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
              {!!email.error ? (<Text style={styles.error}>{email.error}</Text>) : null}

              <TextInput
                label="Password"
                value={password.value}
                onChangeText={text => setPassword({ ...password, value: text })}
                secureTextEntry={true}
                autoCapitalize="none"
                error={!!password.error}
                style={styles.inputs}
              />
              {!!password.error ? (<Text style={styles.error}>{password.error}</Text>) : null}

              <Button
                mode="contained"
                onPress={_onLoginPressed}
                style={styles.inputs}
              >Login</Button>
            </View>
          </TabScreen>
          <TabScreen label="Sign Up" icon="clipboard-account-outline" onPress={_resetErrors} >
            <View>
              <Headline style={styles.headline}>
                Create an account
              </Headline>
              <TextInput
                label="First Name"
                value={first_name.value}
                onChangeText={text => setFirstName({ ...first_name, value: text })}
                autoCapitalize="words"
                textContentType="givenName"
                keyboardType="default"
                error={!!first_name.error}
                style={styles.inputs}
              />
              {!!first_name.error ? (<Text style={styles.error}>{first_name.error}</Text>) : null}

              <TextInput
                label="Last Name"
                value={last_name.value}
                onChangeText={text => setLastName({ ...last_name, value: text })}
                autoCapitalize="words"
                textContentType="familyName"
                keyboardType="default"
                error={!!last_name.error}
                style={styles.inputs}
              />
              {!!last_name.error ? (<Text style={styles.error}>{last_name.error}</Text>) : null}

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
              {!!email.error ? (<Text style={styles.error}>{email.error}</Text>) : null}

              <TextInput
                label="Password"
                value={password.value}
                onChangeText={text => setPassword({ ...password, value: text })}
                secureTextEntry={true}
                autoCapitalize="none"
                error={!!password.error}
                style={styles.inputs}
              />
              {!!password.error ? (<Text style={styles.error}>{password.error}</Text>) : null}

              <Button
                mode="contained"
                onPress={_onSignUpPressed}
                style={styles.inputs}
              >Continue</Button>
            </View>
          </TabScreen>
        </Tabs>
      </Surface>
    </View>
  );
}

export default Login;