import React, { useState, useEffect, useContext } from 'react';
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
  Dimensions,
} from 'react-native';
import axios from 'axios';
import List from '../HomePage/List';
import BottomNav from '../recipes/BottomNav2';

const styles = StyleSheet.create({
  outerContainer: {
    height: Dimensions.get('window').height - 60,
    alignItems: 'center',
    marginBottom: -30,
    flex: 1,
  },
  container: {
    flex: 1,
    width: Dimensions.get('window').width,
  },
});

function BookMark({ navigation }) {
  const { user } = useContext(AuthUserContext);
  const [bookmark, setBookmark] = useState([]);
  useEffect(() => {
    // axios.get(`http://localhost:8080/api/v1/bookmarks/`)
    //   .then((res) => {
    //     setBookmark(res.data);
    //   });

    const helpFunction = async () => {
      const reqConfig = {
        headers: {
          Authorization: `Bearer ${await user.getIdToken()}`,
        },
      };
      const id = await user.puid;
      const res = await axios.get(`http://localhost:8080/api/v1/bookmarks/?userId=${id}`, reqConfig);
      await setBookmark(res.data);
      console.log('bookmark list', res.data);
    };
    helpFunction();
  }, []);
  return (
    <SafeAreaView style={styles.outerContainer}>
      <View style={styles.container}>
        <List navigation={navigation} arr={bookmark} />
      </View>
      <BottomNav navigation={navigation} />
    </SafeAreaView>
  );
}

export default BookMark;
