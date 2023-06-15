import { React } from 'react';
import {
  FlatList,
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  ScrollView,
  View,
} from 'react-native';
import axios from 'axios';
import RCard from './RCard';

const styles = StyleSheet.create({
  container: {
    paddingTop: StatusBar.currentHeight,
    paddingBottom: 500,
  },
  scrollView: {
    backgroundColor: '#fff5c9',
    marginHorizontal: 20,
  },
  text: {
    fontSize: 42,
  },
});

function List({ arr, navigation }) {
  console.log('in the list', arr.map((ele) => (ele.id)));
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollView} contentContainerStyle={{ flexGrow: 1 }}>
        {arr.map((restaurant) => (
          <RCard navigation={navigation} item={restaurant} key={restaurant.id} />
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}
export default List;
