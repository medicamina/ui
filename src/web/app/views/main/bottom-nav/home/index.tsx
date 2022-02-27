import * as React from 'react';
import { ScrollView, StyleSheet, useWindowDimensions, View } from 'react-native';
import { Searchbar, Surface, Title } from 'react-native-paper';

import Map from './map';
import Diseases from './diseases';

const Home = ({ theme }) => {
  const [searchQuery, setSearchQuery] = React.useState('');
  const onChangeSearch = query => setSearchQuery(query);
  const { width } = useWindowDimensions();

  const styles = StyleSheet.create({
    container: {
    },
    search_bar: {
      margin: 10,
    },
    flex: {
      flex: 1,
      flexDirection: 'row',
      flexWrap: 'wrap',
      alignItems: 'flex-start'
    },
    flex_one: {
      flex: 1,
      flexDirection: 'row',
      flexWrap: 'wrap',
      alignItems: 'flex-start',
      height: 540
    },
    item: {
      padding: 10,
      flex: width >= 1440 ? 1 : null,
      width: width >= 1440 ? null : '100%'
    }
  });

  return (
    <ScrollView>
      <View style={styles.container}>
        <Searchbar
          style={styles.search_bar}
          placeholder="Search"
          onChangeText={onChangeSearch}
          value={searchQuery}
        />
      </View>
      <View style={styles.container}>
        <View style={styles.flex_one}>
          <View style={styles.item}>
            <Surface theme={theme} style={{ height: 504 }}>
              <Title style={{ paddingLeft: 15, paddingTop: 5 }} theme={theme}>Your ancestry</Title>
              <Map />
            </Surface>
          </View>
          <View style={styles.item}>
            <Surface theme={theme} style={{ height: 504 }}>
              <Title style={{ paddingLeft: 15, paddingTop: 5 }} theme={theme}>Diseases risk analysis</Title>
              <Diseases theme={theme} />
            </Surface>
          </View>
        </View>
      </View>
      <View style={styles.container}>
        <View style={styles.flex}>
          <View style={styles.item}>
            <Surface theme={theme} >
              <Title style={{ paddingLeft: 15, paddingTop: 5 }} theme={theme}>DNA mutations</Title>
            </Surface>
          </View>
          <View style={styles.item}>
            <Surface theme={theme}>
              <Title style={{ paddingLeft: 15, paddingTop: 5 }} theme={theme}>Family diseases</Title>
            </Surface>
          </View>
        </View>
      </View>
    </ScrollView>
  );
};


export default Home;