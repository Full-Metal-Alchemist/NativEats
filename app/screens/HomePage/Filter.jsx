import React from 'react';
import {
  View, StyleSheet, ScrollView,
} from 'react-native';
import { ButtonGroup, Button, } from 'react-native-elements';
import { ArrowSmallUpIcon as ArrowSmallUpIconOutline, ArrowSmallDownIcon as ArrowSmallDownIconOutline } from "react-native-heroicons/outline";
import COLORS from "../../constants/colors";

const styles = StyleSheet.create({
  icons: {
    width: 16,
    heigth: 16,
    color: '#55d6bf',
  },
  buttons: {
    color: '#000',
  },
});

const buttonStyle = { color: '#520028' };

function Filter() {
  // const buttons = ['price', 'price', 'popularity', 'rating'];

  return (
    <View>
      <ScrollView horizontal={true}>
        <Button
          title="price"
          icon={<ArrowSmallUpIconOutline color="#520028" />}
          style={styles.buttons}
          type="clear"
          titleStyle={buttonStyle}
        />
        <Button
          title="price"
          icon={<ArrowSmallDownIconOutline color="#520028" />}
          style={styles.buttons}
          type="clear"
          titleStyle={buttonStyle}
        />
        <Button title="popularity" titleStyle={buttonStyle} type="clear" />
        <Button title="rating" titleStyle={buttonStyle} type="clear" />
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
