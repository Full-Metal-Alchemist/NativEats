import { React, useState, useEffect } from 'react';
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
import List from './List';

function BookMark({ navigation }) {
  const [bookmark, setBookmark] = useState([]);
  useEffect(() => {
    axios.get(`http://localhost:8080/api/v1/bookmarks/?user_id=${user_id}`)
      .then((res) => {
        setBookmark(res.data);
      });
  }, []);
  return (
    <List navigation={navigation} arr={bookmark} />
  );
}

export default BookMark;
