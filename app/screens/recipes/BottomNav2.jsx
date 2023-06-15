import React from 'react';
import {
  StyleSheet, SafeAreaView, FlatList,
} from 'react-native';
import BottomLink from './BottomLink';

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    fontWeight: 'bold',
    fontFamily: 'Arial',
  },
  list: {
    fontSize: 20,
    backgroundColor: 'white',
    height: 70,
    paddingLeft: 250,
  },
  list2: {
    fontSize: 20,
    backgroundColor: 'white',
    height: 80,
    paddingLeft: 50,
  },
  text: {
    fontSize: 20,
  },
});

function BottomNav({ navigation }) {
  const mock = [
    { render: 'Recipes', navName: 'RecipesMain', icon: 'clipboard' },
    { render: 'Foodie Tour', navName: 'FoodieTour', icon: 'briefcase' },
    { render: 'Cultural Insights', navName: 'CulturalScreen', icon: 'wind' },
    { render: 'Bookmarks', navName: 'BookmarkScreen', icon: 'bookmark' },
    { render: '       ', navName: 'BookmarkScreen', icon: '' },
  ];
  return (
    <SafeAreaView style={styles.list}>
      <FlatList
        style={styles.list2}
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
    </SafeAreaView>
  );
}

export default BottomNav;
