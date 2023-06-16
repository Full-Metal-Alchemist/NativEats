import { React, useContext, useState, useEffect } from 'react';
import AuthUserContext from '../../contexts';
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
    paddingBottom: 100,
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
  const [bookmark, setBookMark] = useState([]);
  // const {user} = useContext(AuthUserContext)
  useEffect(()=>{
    const help_function = async () => {
      console.log('check bookmark list')
      const res = await axios.get(`http://localhost:8080/api/v1/users/1`);
      setBookMark(res.data.bookmarks);
      console.log(res.data.bookmarks);
    };
    help_function();
  }, [arr]);
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollView} contentContainerStyle={{ flexGrow: 1 }}>
        {arr.map((restaurant) => {
          const isBooked = bookmark.indexOf(restaurant.id) >= 0;
          return (
            // <RCard navigation={navigation} item={restaurant} key={restaurant.id} />
            <RCard navigation={navigation} item={restaurant} key={restaurant.id} isBooked={isBooked} />
          )
        } )}
      </ScrollView>
    </SafeAreaView>
  );
}
export default List;
