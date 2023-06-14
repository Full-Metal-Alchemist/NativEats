import React, { useEffect, useState } from 'react';
import axios from 'axios';
import {
  Text, StyleSheet, View, Button, TouchableOpacity, FlatList, SafeAreaView, Dimensions,
} from 'react-native';
import RecipeButton from './maincomponents/RecipeButton';
import BottomNav from './BottomNav';
import BottomNav2 from './BottomNav2';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  header: {
    fontSize: 30,
    fontWeight: 'bold',
  },
  touchable: {
    width: 300,
    // borderWidth: 2,
    // borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#55d6bf',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
    justifyContent: 'center',
  },
  list: {
    height: Dimensions.get('window').height - 50,
    alignItems: 'center',
    padding: 0,
    margin: 0,
    display: 'flex',
  },
  container: {
    flex: 1,
    justifyContent: 'space-between',
  },
});

function RecipesMain({ navigation }) {
  const [list, setList] = useState([]);
  useEffect(() => {
    axios.get('http://localhost:8080/api/v1/recipes')
      .then((res) => setList(res.data))
      .catch((err) => console.log('This is error Line 59: ', err));
  }, []);
  return (
    <SafeAreaView style={styles.list}>
      <View style={styles.container}>
        <Text style={styles.header}>Asia Cuisine Recipes</Text>
        <FlatList
          data={list}
          renderItem={({ item }) => (
            <RecipeButton
              navigation={navigation}
              title={item.name}
              data={item}
            />
          )}
          keyExtractor={(item) => item.id}
        />
      </View>
      <BottomNav2 navigation={navigation} style={{ position: 'absolute' }} />
    </SafeAreaView>
  );
}

export default RecipesMain;
