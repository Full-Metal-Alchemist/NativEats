import React from 'react';
import {
  View, Text, StyleSheet, FlatList, ScrollView,
} from 'react-native';
import { ButtonGroup } from 'react-native-elements';

function Filter() {
  const buttons = ['price', 'price', 'popularity', 'rating'];
  return (
    <View>
      {/* <ScrollView horizontal={true}>

        <Text>Child 1</Text>
        <Text>Child 2</Text>
        <Text>Child 3</Text>

      </ScrollView> */}

      <ButtonGroup
        // onPress={this.updateIndex}
        // selectedIndex={selectedIndex}
        buttons={buttons}
        containerStyle={{ height: 100 }}
      />

    </View>
  );
}

export default Filter;
