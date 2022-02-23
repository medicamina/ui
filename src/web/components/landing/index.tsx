import React from 'react';
import { Text } from 'react-native-paper'
import {
  View,
  StyleSheet,
  useWindowDimensions,
  ScrollView,
  Linking
} from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const Home = (props) => {
  const { width } = useWindowDimensions();

  const styles = StyleSheet.create({
    container: {
      flex: 1,
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
    },
    view_two: {
      flex: 2,
      justifyContent: 'center',
      alignItems: 'center',
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
      marginBottom: 25
    }
  });

  return (
    <ScrollView style={styles.container} contentContainerStyle={{ maxWidth: '100%' }} removeClippedSubviews={true}>
      <View style={styles.row}>
        <View style={styles.view_one}>
          <Icon name='dna' size={width >= 1023 ? 300 : 100} style={{ color: props.theme.colors.text }} />
        </View>
        <View style={styles.view_two}>
          <Text style={styles.text}>Precision medicine is a tailored approach to disease prevention and treatment that takes into account differences in people's genes, environments, and lifestyles.</Text>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_two}>
          <Text style={styles.text}>Precision medicine is underpinned by genetic and genomic testing (sequencing), the results of which enable better prediction, prevention and treatment of disease as well as more accurate medication diagnosis.</Text>
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
          <Text style={styles.text}>Share accurate information of your families health history with your physician, surgeon or consultant and keep your data with you.</Text>
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.view_two}>
          <Text style={styles.text}>Ut ostenderet mundi amorem, quem ostendit nobis</Text>
        </View>
        <View style={styles.view_one}>
          <Icon size={width >= 1023 ? 300 : 100} name='church' style={{ color: props.theme.colors.text }} />
        </View>
      </View>
      <View style={styles.github}>
        <Text style={styles.github}>Project is open source at
           <Text style={{ color: 'blue' }}
            onPress={() => Linking.openURL('github.com/svnty/medicamina')}>
            github.com/svnty/medicamina
          </Text></Text>
      </View>
    </ScrollView>
  );
}

export default Home;