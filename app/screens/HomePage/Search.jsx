import { React, useState } from 'react';
import {
  View, Text, StyleSheet, FlatList, Button, ScrollView,
} from 'react-native';
import { SearchBar } from 'react-native-elements';

const styles = StyleSheet.create({
  searchbar: {
    width: 230,
  },
});

function Search({ search, setSearch }) {
  // const [search, setSearch] = useState('');
  // function debounce(func, timeout=300) {

  // }
  return (

    <SearchBar
      placeholder="Type Here..."
      onChangeText={(e) => { setSearch(e); }}
      value={search}
      containerStyle={{ backgroundColor: '#fff' }}
      inputContainerStyle={{ backgroundColor: '#fff' }}
      placeholderTextColor={{ string: '#520028' }}
      style={styles.searchbar}
    />

  );
}

export default Search;
