import React from 'react';
import { StyleSheet, Text } from 'react-native';
import { COLORS } from '../../../constants/colors';

export default function LoginError({ error, visible }) {
  if (!error || !visible) {
    return null;
  }

  return <Text style={styles.errorText}>{error}</Text>;
}

const styles = StyleSheet.create({
  errorText: {
    color: COLORS.SCARLET,
    fontSize: 20,
    marginBottom: 10,
    fontWeight: '600',
  },
});
