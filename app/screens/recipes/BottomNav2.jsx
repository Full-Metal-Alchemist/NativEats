import React from 'react';
import {
  Text, StyleSheet, SafeAreaView, FlatList, Dimensions,
} from 'react-native';
import BottomLink from './BottomLink';
import ButtonGroup from 'react-native-elements'

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
  },
  list: {
    fontSize: 20,
    backgroundColor: '#61dafb',
    height: 70,
    paddingLeft: 200,
  },
  text: {
    fontSize: 20,
  },
});

function BottomNav({ navigation }) {
  const mock = [{ render: 'Recipes', navName: 'RecipesMain' }, { render: 'Foodie Tour', navName: 'FoodieTour' }, { render: 'Cultural Insights', navName: 'CulturalScreen' }, { render: 'Bookmarks', navName: 'BookmarkScreen' }];
  return (
    <SafeAreaView style={styles.list}>
      <FlatList
        horizontal
        showsHorizontalScrollIndicator={false}
        data={mock}
        renderItem={({ item }) => (
          <BottomLink
            navigation={navigation}
            title={item.render}
            data={item}
          />
        )}
        keyExtractor={(item) => item}
      />
      {/* <ButtonGroup /> */}
    </SafeAreaView>
  );
}

export default BottomNav;