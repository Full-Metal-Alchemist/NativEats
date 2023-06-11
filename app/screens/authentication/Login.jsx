import React from 'react';
import {
  Text, StyleSheet, View, Button, TouchableOpacity,
} from 'react-native';

const styles = StyleSheet.create({
  text: {
    fontSize: 30,
  },
  touchable: {
    width: 300,
    marginTop: 556,
    marginLeft: 25,
    paddingVertical: 18,
    borderWidth: 2,
    borderColor: '#20232a',
    borderRadius: 6,
    backgroundColor: '#61dafb',
    color: '#20232a',
    textAlign: 'center',
    fontSize: 30,
    fontWeight: 'bold',
  },
});

function Login({ navigation }) {
  console.log(navigation);
  return (
    <View>
      <Text style={styles.text}>This is the home screen!</Text>
      <Button
        onPress={() => navigation.navigate('Signup')}
        title="Sign Up"
      />
      <TouchableOpacity
        style={styles.touchable}
        onPress={() => navigation.navigate('ForgotPassword')}
      >
        <Text>Forgot Password</Text>
      </TouchableOpacity>
    </View>
  );
}

export default Login;
