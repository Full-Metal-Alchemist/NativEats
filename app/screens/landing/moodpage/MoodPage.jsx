import React from 'react';
import {
  View, Text, StyleSheet, FlatList, SafeAreaView,
} from 'react-native';
import MoodButton from './MoodButton';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  touchable: {
    width: 300,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#55d6bf',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
    justifyContent: 'center',
  },
  list: {
    alignItems: 'center',
    padding: 0,
    margin: 0,
  },
});

function MoodPage({ navigation }) {
  const mock =[{
    id: '1',
    cuisine: 'italian',
  },
  {
    id: '2',
    cuisine: 'chinese',
  },
  {
    id: '3',
    cuisine: 'mexican',
  },
  {
    id: '4',
    cuisine: 'korean',
  },
  {
    id: '5',
    cuisine: 'persian',
  },
  {
    id: '6',
    cuisine: 'new american',
  },
  {
    id: '7',
    cuisine: 'japanese',
  },
  {
    id: '8',
    cuisine: 'thai',
  },
  {
    id: '9',
    cuisine: 'indian',
  },
  {
    id: '10',
    cuisine: 'vietnamese',
  }];
  return (
    <SafeAreaView style={styles.list}>
      <Text>What&apos;re you in the mood for?</Text>
      <FlatList
        data={mock}
        renderItem={({ item }) => (
          <MoodButton
            navigation={navigation}
            title={item.cuisine}
            data={item}
          />
        )}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}

export default MoodPage;
