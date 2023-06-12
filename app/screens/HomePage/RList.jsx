import { React, useState } from 'react';
import {
  FlatList,
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
} from 'react-native';
import { RCard } from './RCard';

function RList() {
  const [restaurants, setRestaurant] = useState([]);

  return (
    <SafeAreaView>
      <FlatList
        data={DATA}
        renderItem={(item) => (
          <RCard item={item} />
        )}
        keyExtractor={(item) => item.id}
      />
    </SafeAreaView>
  );
}
export default RList;
