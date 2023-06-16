import React, { useEffect, useState, useContext } from 'react';
import axios from 'axios';
import AuthUserContext from '../../contexts';
import {
  Text, StyleSheet, View, Button, TouchableOpacity, FlatList, SafeAreaView, Dimensions,
} from 'react-native';
import RecipeButton from './maincomponents/RecipeButton';
import BottomNav2 from './BottomNav2';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  header: {
    alignSelf: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
  touchable: {
    width: 300,
    // borderWidth: 2,
    // borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
    justifyContent: 'center',
  },
  list: {
    height: Dimensions.get('window').height - 60,
    alignItems: 'center',
  },
  container: {
    flex: 1,
    justifyContent: 'space-between',
  },
});

function RecipesMain({ navigation }) {
  const { user, cuisine } = useContext(AuthUserContext);
  const [currentCuisine, setCurrentCuisine] = useState({});
  const getSetofRecipesNumber = Math.floor(Math.random() * (60 - 1) + 1);
  console.log('This is list LINE 41:', getSetofRecipesNumber);
  const [list, setList] = useState([]);
  // setList(res.data.splice(getSetofRecipesNumber, 14))
  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/recipes', {
      headers: { Authorization: `Bearer ${user.accessToken}` },
    })
      .then((res) => setList(res.data.splice(getSetofRecipesNumber, 14)))
      .catch((err) => console.log('This is error Line 59: ', err));
    axios.get('http://localhost:8080/api/v1/cuisines', {
      headers: { Authorization: `Bearer ${user.accessToken}` },
    })
      .then(({ data }) => {
        data.forEach((c) => {
          if (c.id === cuisine) {
            setCurrentCuisine(c);
          }
        });
      })
      .catch((err) => {
        console.log('Couldn\'t grab cuisines data...', err);
      });
  }, []);

  return (
    <SafeAreaView style={styles.list}>
      <View style={styles.container}>
        <Text style={styles.header}>{currentCuisine.name}</Text>
        <FlatList
          data={list}
          renderItem={({ item }) => (
            <RecipeButton
              navigation={navigation}
              title={item.name}
              data={item}
            />
          )}
          keyExtractor={(item) => item.name}
        />
      </View>
      <BottomNav2 navigation={navigation} style={{ position: 'absolute', paddinBottom: 10 }} />
    </SafeAreaView>
  );
}

export default RecipesMain;
