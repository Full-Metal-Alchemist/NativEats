import React from 'react';
import { Button, Text, View} from 'react-native';

function SettingsButton({ navigation }) {
  return (
    <View>
      <Button
        onPress={() => navigation.navigate('Settings')}
        title="Settings"
      />
      <Text>Settings</Text>
    </View>
  );
}

export default SettingsButton;
