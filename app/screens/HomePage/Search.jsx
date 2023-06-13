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

function Search({ setSubmitSearch }) {
  const [search, setSearch] = useState('');
  return (
    <ScrollView horizontal>
      <SearchBar
        placeholder="Type Here..."
        onChangeText={(e) => { setSearch(e); }}
        value={search}
        containerStyle={{ backgroundColor: '#fff' }}
        inputContainerStyle={{ backgroundColor: '#fff'}}
        placeholderTextColor={{ string: '#520028' }}
        style={styles.searchbar}
      />
      <Button style={styles.buttons} title="submit" onPress={() => { setSubmitSearch(search); }} />
    </ScrollView>
  );
}

export default Search;
