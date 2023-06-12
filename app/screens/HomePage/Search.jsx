import { React, useState } from 'react';
import {
  View, Text, StyleSheet, FlatList,
} from 'react-native';
import { SearchBar } from 'react-native-elements';
function Search() {
  const [search, setSearch] = useState('');
  return (
    <View>
      <SearchBar
        placeholder="Type Here..."
        onChangeText={(e) => { setSearch(e); }}
        value={search}
      />
    </View>

  );
}

export default Search;
