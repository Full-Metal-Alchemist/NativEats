import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity, FlatList, SafeAreaView
} from 'react-native';
import RecipeButton from './maincomponents/RecipeButton';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  touchable: {
    width: 300,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function RecipesMain({ navigation }) {
  const mock = [{
    id: '1',
    name: 'Chicken Katsu',
    cuisine: ['Japanese'],
    steps: 'Season the chicken breasts on both sides with salt and pepper',
    photos: ['https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'],
    createdAt: '2001-02-16 20:38:40',
  },
  {
    id: '2',
    name: 'Indian Chicken Curry',
    cuisine: ['Indian', 'Middle-Eastern'],
    steps: 'Sprinkle the chicken breasts with 2 teaspoons salt. Heat oil in a large skillet over high heat',
    photos: ['https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'],
    createdAt: '2020-02-11 15:44:17',
  }];
  return (
    <SafeAreaView style={styles.container}>
      <FlatList
        data={mock}
        renderItem={({ item }) => (
          <RecipeButton
            navigation={navigation}
            title={item.name}
            data={item}
          />
        )}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}

export default RecipesMain;
