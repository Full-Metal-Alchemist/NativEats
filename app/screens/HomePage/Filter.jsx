import React from 'react';
import {
  View, StyleSheet, ScrollView,
} from 'react-native';
import { ButtonGroup, Button } from 'react-native-elements';
import { ArrowSmallUpIcon as ArrowSmallUpIconOutline, ArrowSmallDownIcon as ArrowSmallDownIconOutline } from 'react-native-heroicons/outline';
import {COLORS} from '../../constants/colors';

const styles = StyleSheet.create({
  icons: {
    width: 16,
    heigth: 16,
    color: '#55d6bf',
  },
  buttons: {
    color: '#000',
  },
  btnContainer: {
    flex: 1,
    flexDirection: 'row',
  },
  container: {
    flex: 1,
    flexDirection: 'row',
    marginBottom: 12,
    paddingLeft: 12,
    alignItems: 'center',
  },
});

function Filter({ filter, setFilter }) {
  // const buttons = ['price', 'price', 'popularity', 'rating'];
  const buttonStyle = (x) => {
    if (filter === x) return ({ color: COLORS.ORANGE });

    return ({ color: '#520028' });
  };

  const iconStyle = (x) => {
    if (filter === x) return COLORS.ORANGE;

    return COLORS.SCARLET;
  };

  return (
    <View styles={styles.container}>
      <ScrollView horizontal styles={styles.btnContainer}>
        <Button title="All" titleStyle={buttonStyle(0)} type="clear" onPress={() => { setFilter(0); }} />
        <Button
          title="Price"
          icon={<ArrowSmallUpIconOutline color={iconStyle(0)} />}
          style={styles.buttons}
          type="clear"
          titleStyle={buttonStyle(1)}
          onPress={() => { setFilter(1); }}
        />
        <Button
          title="Price"
          icon={<ArrowSmallDownIconOutline color={iconStyle(0)} />}
          style={styles.buttons}
          type="clear"
          titleStyle={buttonStyle(2)}
          onPress={() => { setFilter(2); }}
        />
        <Button title="Popularity" titleStyle={buttonStyle(3)} type="clear" onPress={() => { setFilter(3); }} />
        <Button title="Rating" titleStyle={buttonStyle(4)} type="clear" onPress={() => { setFilter(4); }} />
      </ScrollView>

      {/* <ButtonGroup
        // onPress={this.updateIndex}
        // selectedIndex={selectedIndex}
        buttons={buttons}
        containerStyle={{ height: 50 }}
      /> */}
    </View>
  );
}

export default Filter;
