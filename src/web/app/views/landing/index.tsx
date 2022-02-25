import React from 'react';
import { 
  Button, 
  Text, 
  Title
} from 'react-native-paper'
import {
  View,
  StyleSheet,
  useWindowDimensions,
  ScrollView,
  Linking,
  Platform
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { useNavigate } from 'react-router';

const Home = (props) => {
  const { width } = useWindowDimensions();
  const nav = useNavigate();

  const styles = StyleSheet.create({
    container: {
      maxWidth: width
    },
    row: {
      flex: 1,
      flexDirection: 'row',
      padding: 20,
      maxWidth: width
    },
    view_one: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      padding: 10
    },
    view_two: {
      flex: 2,
      justifyContent: 'center',
      alignItems: 'center',
      padding: 10
    },
    text: {
      textAlign: 'center',
      fontSize: 18
    },
    github: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      textAlign: 'center',
      fontSize: 12,
      marginBottom: Platform.OS == 'web' ? 15 : 50
    },
    action_container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
    },
    action: {
      justifyContent: 'center',
      alignItems: 'center',
      textAlign: 'center'
    },
    headline: {
      flex: 1,
      paddingTop: Platform.OS == 'web' ? 50 : 25,
      paddingBottom: Platform.OS == 'web' ? 50 : 0,
      justifyContent: 'center',
      alignItems: 'center',
      textAlign: 'center'
    }
  });

  return (
    <ScrollView showsHorizontalScrollIndicator={false} horizontal={false}>
      <View style={styles.row}>
        <View style={styles.headline}>
          <Title style={{color: props.theme.colors.text, fontSize: (width/12), fontStyle: 'italic'}}>MEDICAMINA</Title>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_one}>
          <Icon name='dna' size={width >= 1023 ? 300 : 100} style={{ color: props.theme.colors.text }} />
        </View>
        <View style={styles.view_two}>
          <Text style={styles.text} theme={props.theme}>Precision medicine is a tailored approach to disease prevention and treatment that takes into account differences in people's genes, environments, and lifestyles.</Text>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_two}>
          <Text style={styles.text} theme={props.theme}>Precision medicine is underpinned by genetic and genomic testing (sequencing), the results of which enable better prediction, prevention and treatment of disease as well as more accurate medication diagnosis.</Text>
        </View>
        <View style={styles.view_one}>
          <Icon size={width >= 1023 ? 300 : 100} name='pill' style={{ color: props.theme.colors.text }} />
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_one}>
          <Icon size={width >= 1023 ? 300 : 100} name='hospital-building' style={{ color: props.theme.colors.text }} />
        </View>
        <View style={styles.view_two}>
          <Text style={styles.text} theme={props.theme}>Share accurate information of your families health history with your physician, surgeon or consultant and keep your data with you.</Text>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.action_container}>
          <Button
            style={styles.action}
            mode='contained'
            onPress={() => {
              nav('/login#sign-up');
            }}
          >Sign up today</Button>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_two}>
          <Text style={styles.text} theme={props.theme}>Ut ostenderet mundi amorem, quem ostendit nobis</Text>
        </View>
        <View style={styles.view_one}>
          <Icon size={width >= 1023 ? 300 : 100} name='church' style={{ color: props.theme.colors.text }} />
        </View>
      </View>
      <View style={styles.github}>
        <Text style={styles.github} theme={props.theme}>Project is open source at <Text style={{ color: props.theme.dark ? 'aqua' : 'blue' }} onPress={() => Linking.openURL('https://github.com/medicamina')}>github.com/medicamina</Text></Text>
      </View>
    </ScrollView>
  );
}

export default Home;