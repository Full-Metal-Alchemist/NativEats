import { React, useState, useEffect, useContext } from 'react';
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
import List from '../HomePage/List';

function BookMark({ navigation }) {
  const [bookmark, setBookmark] = useState([]);
  useEffect(() => {
    // axios.get(`http://localhost:8080/api/v1/bookmarks/`)
    //   .then((res) => {
    //     setBookmark(res.data);
    //   });
    // const { user } = useContext(AuthUserContext);
    const helpFunction = async () => {
      const res = await axios.get(`http://localhost:8080/api/v1/bookmarks/?userId=1`);
      await setBookmark(res.data);
    };
    helpFunction();
  }, []);
  return (
    <List navigation={navigation} arr={bookmark} />
  );
}

export default BookMark;
